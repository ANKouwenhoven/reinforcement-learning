package tudelft.rl.mysolution;

import java.io.File;
import java.util.ArrayList;

import tudelft.rl.*;

public class RunMe {

	public static void main(String[] args) {
		
		//load the maze
		//TODO replace this with the location to your maze on your file system
		Maze maze = new Maze(new File("C:\\toy_maze.txt"));

		int[] goalsX = {9, 9};
		int[] goalsY = {9, 0};
		int[] rewards = {10, 5};
		double[] correct = new double[1000];
		double[] epsilons = new double[1000];
		boolean[] resetOnGoal = {true, true};

		for(int i = 0; i < rewards.length; i++) {
			maze.setR(maze.getState(goalsX[i], goalsY[i]), rewards[i]);
		}
				
		//create a robot at starting and reset location (0,0) (top left)
		Agent robot = new Agent(0,0);
		
		//make a selection object (you need to implement the methods in this class)
		EGreedy selection = new MyEGreedy();
		
		//make a Qlearning object (you need to implement the methods in this class)
		QLearning learn = new MyQLearning();
		
		boolean stop = false;
		int steps = 0;
		int trials = 0;
		boolean checkSteps = false;
		int criterionActions = 1000;
		int criterionTrials = 1000;

		double alpha = 0.7;
		double gamma = 0.9;
		double epsilon = 0.1;

		//keep learning until you decide to stop
		while (!stop) {

			// New action, get the state and reward in that state
			State previous_state = robot.getState(maze);
			Action executedAction = selection.getEGreedyAction(robot, maze, learn, epsilon);
			State new_state = robot.doAction(executedAction, maze);
			double reward = maze.getR(new_state);

			ArrayList<Action> possibleActions = maze.getValidActions(robot);
			learn.updateQ(previous_state, executedAction, reward, new_state, possibleActions, alpha, gamma);

            for(int i = 0; i < rewards.length; i++) {
                if (resetOnGoal[i] && robot.x == goalsX[i] && robot.y == goalsY[i]) {
                	epsilons[trials] = epsilon;
                	if (epsilon < 1 && epsilon > 0) {
						if (robot.x == 9 && robot.y == 0) {
							epsilon += 0.005;
						} else {
							epsilon -= 0.005;
						}
					}
					correct[trials] = i;
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

		// Keep track of the final path of the agent to print it later
		char[][] finalPath = new char[10][10];
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				finalPath[i][j] = '#';
			}
		}

		// Run it one more time doing only the best actions
		while(runLast) {
            for(int i = 0; i < rewards.length; i++) {
                if (resetOnGoal[i] && robot.x == goalsX[i] && robot.y == goalsY[i]) {
                    runLast = false;
                }
            }
            finalPath[robot.x][robot.y] = '0';
			Action executedAction = selection.getBestAction(robot, maze, learn);
			robot.doAction(executedAction, maze);
		}

		robot.reset();
		String correctLabel = "For every trial, the agent either found the small reward (1.0) or the large reward (0.0):";
		String epsilonsLabel = "For every trial, this is the agent's starting epsilon:";
		printFinalMaze(10, 10, finalPath);
		printOtherData(new double[][] {correct, epsilons}, new String[] {correctLabel, epsilonsLabel});
	}

	/**
	 * Print out a representation of the final path traversed by the agent
	 * @param sizeX - X size of the maze
	 * @param sizeY - Y size of the maze
	 * @param path - The final path traversed by the agent
	 */
	private static void printFinalMaze(int sizeX, int sizeY, char[][] path) {
		System.out.println("");
		System.out.println("This is the final path traversed by the agent: ");

		for (int i = 0; i < sizeX; i++) {
			System.out.print("- ");
		}

		System.out.println("");
		for (int i = 0; i < sizeY; i++) {
			for (int j = 0; j < sizeX; j++) {
				System.out.print(path[j][i] + " ");
			}
			System.out.println("");
		}

		for (int i = 0; i < sizeX; i++) {
			System.out.print("- ");
		}

		System.out.println("\n");
	}

	/**
	 * Print the remaining tracked data, in this case the rewards of every trial and the starting epsilon of every trial.
	 * This is mostly used to be able to paste the data into matlab for plotting.
	 * @param data - the data to be printed
	 * @param labels - the labels that explain the data
	 */
	private static void printOtherData(double[][] data, String[] labels) {
		for (int i = 0; i < data.length; i++) {
			System.out.println(labels[i]);
			for (int j = 0; j < data[i].length; j++) {
				System.out.print(data[i][j] + " ");
			}
			System.out.println("\n");
		}
	}
}
