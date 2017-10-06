package tudelft.rl.mysolution;

import java.io.File;
import java.util.ArrayList;

import tudelft.rl.*;

public class RunMe {

	public static void main(String[] args) {
		
		//load the maze
		//TODO replace this with the location to your maze on your file system
		Maze maze = new Maze(new File("C:\\toy_maze.txt"));


		int goalX = 9;
		int goalY = 9;
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
		int criterionActions = 10000;
		int criterionTrials = 100;

		double alpha = 0.7;
		double gamma = 0.9;
		double epsilon = 0.5;



		//keep learning until you decide to stop
		while (!stop) {
			//TODO implement the action selection and learning cycle
			Action nextAction = selection.getEGreedyAction(robot, maze, learn, epsilon);
			State s = robot.getState(maze);


			State new_state = robot.doAction(nextAction,maze);
			double reward = maze.getR(s);
			ArrayList<Action> possibleActions = maze.getValidActions(robot);

			if(reward>0){
				System.out.println("Found a reward");
			}
			learn.updateQ(s, nextAction, reward, new_state, possibleActions, alpha, gamma);


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

	}

}
