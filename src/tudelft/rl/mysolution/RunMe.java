package tudelft.rl.mysolution;

import java.io.File;

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
		int criterionActions = 99999999;
		int criterionTrials = 20;
		double epsilon = 0.5;



		//keep learning until you decide to stop
		while (!stop) {
			//TODO implement the action selection and learning cycle
			robot.doAction(selection.getEGreedyAction(robot, maze, learn, epsilon), maze);
			//learn.updateQ

			if(robot.x == goalX && robot.y == goalY){
				robot.reset();
				trials++;
			}
			//TODO figure out a stopping criterion
			steps++;
			if(steps>=criterionActions || trials >= criterionTrials){
				stop = true;
			}
		}

	}

}
