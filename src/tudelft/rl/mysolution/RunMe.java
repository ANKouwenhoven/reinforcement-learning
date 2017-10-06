package tudelft.rl.mysolution;

import java.io.File;
import java.util.ArrayList;

import tudelft.rl.*;

public class RunMe {

	public static void main(String[] args) {
		
		//load the maze
		//TODO replace this with the location to your maze on your file system
		Maze maze = new Maze(new File("C:\\easy_maze.txt"));


		int goalX = 24;
		int goalY = 14;
		//Set the reward at the bottom right to 10
		maze.setR(maze.getState(goalX, goalY), 10);

				
		//create a robot at starting and reset location (0,0) (top left)
		Agent robot = new Agent(0,0);
		
		//make a selection object (you need to implement the methods in this class)
		EGreedy selection = new MyEGreedy();
		
		//make a Qlearning object (you need to implement the methods in this class)
		QLearning learn = new MyQLearning();
		
		boolean stop=false;

		int steps = 0;
		int trials = 0;
		boolean checkSteps = false;
		int criterionActions = 1000;
		int criterionTrials = 10000;

		double alpha = 0.7;
		double gamma = 0.9;
		double epsilon = 0.5;



		//keep learning until you decide to stop
		while (!stop) {


			//TODO implement the action selection and learning cycle

			// New action, get the state and reward in that state
			State previous_state = robot.getState(maze);
			Action executedAction = selection.getEGreedyAction(robot, maze, learn, epsilon);
			State new_state = robot.doAction(executedAction,maze);
			double reward = maze.getR(new_state);

			ArrayList<Action> possibleActions = maze.getValidActions(robot);

			learn.updateQ(previous_state, executedAction, reward, new_state, possibleActions, alpha, gamma);


			if(robot.x == goalX && robot.y == goalY){
				robot.reset();
				trials++;
			}

			steps++;

			if(checkSteps && steps >= criterionActions){
				stop = true;
			}

			if(trials >= criterionTrials){
				stop = true;
			}
		}

		robot.reset();

		System.out.println("Now only do the best actions, number of actions:");

		// Run it one more time
		while(!(robot.x == goalX && robot.y == goalY)){
			Action executedAction = selection.getBestAction(robot, maze, learn);
			robot.doAction(executedAction,maze);
		}
		robot.reset();

	}

}
