package tudelft.rl.mysolution;

import tudelft.rl.*;

import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

public class RunMe {

	public static void main(String[] args) {
		Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();

		String old_contents = null;
		try {
			old_contents = (String) clipboard.getData(DataFlavor.stringFlavor);
		} catch (UnsupportedFlavorException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		StringSelection new_clip = new StringSelection("");

		clipboard.setContents(new_clip, null);

		for (int runs = 0; runs < 10; runs++) {


			//load the maze
			//TODO replace this with the location to your maze on your file system
			Maze maze = new Maze(new File("/Users/orhun/Downloads/reinforcement-learning-master/data/toy_maze.txt"));

			int[] goalsX = {9, 9};
			int[] goalsY = {9, 0};
			int[] rewards = {10, 5};
			boolean[] resetOnGoal = {true, true};

			for (int i = 0; i < rewards.length; i++) {
				maze.setR(maze.getState(goalsX[i], goalsY[i]), rewards[i]);
			}

			//create a robot at starting and reset location (0,0) (top left)
			Agent robot = new Agent(0, 0);

			//make a selection object (you need to implement the methods in this class)
			EGreedy selection = new MyEGreedy();

			//make a Qlearning object (you need to implement the methods in this class)
			QLearning learn = new MyQLearning();

			boolean stop = false;
			int steps = 0;
			int trials = 0;
			boolean checkSteps = false;
			int criterionActions = 1000;
			int criterionTrials = 50;

			double alpha = 0.7;
			double gamma = 0.9;
			double epsilon = 0.5;

			//keep learning until you decide to stop
			while (!stop) {

				// New action, get the state and reward in that state
				State previous_state = robot.getState(maze);
				Action executedAction = selection.getEGreedyAction(robot, maze, learn, epsilon);
				State new_state = robot.doAction(executedAction, maze);
				double reward = maze.getR(new_state);

				ArrayList<Action> possibleActions = maze.getValidActions(robot);
				learn.updateQ(previous_state, executedAction, reward, new_state, possibleActions, alpha, gamma);

				for (int i = 0; i < rewards.length; i++) {
					if (resetOnGoal[i] && robot.x == goalsX[i] && robot.y == goalsY[i]) {
						robot.reset();
						trials++;
					}
				}

				steps++;

				if (checkSteps && (steps >= criterionActions) || (trials >= criterionTrials)) {
					stop = true;
				}
			}

			System.out.println("Now only do the best actions, number of actions:");

			boolean runLast = true;
			// Run it one more time doing only the best actions
			while (runLast) {
				for (int i = 0; i < rewards.length; i++) {
					if (resetOnGoal[i] && robot.x == goalsX[i] && robot.y == goalsY[i]) {
						runLast = false;
					}
				}
				Action executedAction = selection.getBestAction(robot, maze, learn);
				robot.doAction(executedAction, maze);
			}

			//robot.reset();
		}
	}

}
