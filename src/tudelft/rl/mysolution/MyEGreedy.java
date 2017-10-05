package tudelft.rl.mysolution;

import tudelft.rl.*;

import java.util.ArrayList;
import java.util.Random;

public class MyEGreedy extends EGreedy {

	/**
	 *
	 * @param r
	 * @param m
	 * @return
	 */
	@Override
	public Action getRandomAction(Agent r, Maze m) {
		ArrayList<Action> possibleActions = m.getValidActions(r);
		Random randomGenerator = new Random();
		int randomIndex = randomGenerator.nextInt(possibleActions.size());

		return possibleActions.get(randomIndex);
	}

	@Override
	public Action getBestAction(Agent r, Maze m, QLearning q) {
		//TODO to select the best possible action currently known in State s.
		ArrayList<Action> possibleActions = m.getValidActions(r);
		State currentState = r.getState(m);

		Action best = getRandomAction(r, m);

		for(int i = 1; i<possibleActions.size();i++){
			Action possibleAction = possibleActions.get(i);

			if(q.getQ(currentState,possibleAction)>q.getQ(currentState,best)){
				best = possibleAction;
			}
		}

		return best;
	}

	@Override
	public Action getEGreedyAction(Agent r, Maze m, QLearning q, double epsilon) {
		//TODO to select between random or best action selection based on epsilon.
		return null;
	}

}
