package tudelft.rl.mysolution;

import tudelft.rl.*;

import java.util.ArrayList;
import java.util.Random;

public class MyEGreedy extends EGreedy {

	/**
	 * Randomly selects an action from all valid actions.
	 * @param r - Agent that selects the action
	 * @param m - Maze the agent is in
	 * @return - a randomly selected action
	 */
	@Override
	public Action getRandomAction(Agent r, Maze m) {
		ArrayList<Action> possibleActions = m.getValidActions(r);
		Random randomGenerator = new Random();
		int randomIndex = randomGenerator.nextInt(possibleActions.size());

		return possibleActions.get(randomIndex);
	}

	/**
	 * Returns the best possible action, determined by every action's Q value.
	 * @param r - Agent that selects the action
	 * @param m - Maze the agent is in
	 * @param q - QLearning object
	 * @return - The best action for the agent to take.
	 */
	@Override
	public Action getBestAction(Agent r, Maze m, QLearning q) {
		ArrayList<Action> possibleActions = m.getValidActions(r);
		State currentState = r.getState(m);
		Action bestAction = getRandomAction(r, m);

		for(Action possibleAction : possibleActions){
			if(q.getQ(currentState, possibleAction) > q.getQ(currentState, bestAction)) {
				bestAction = possibleAction;
			}
		}

		return bestAction;
	}

	@Override
	public Action getEGreedyAction(Agent r, Maze m, QLearning q, double epsilon) {
		//TODO to select between random or best action selection based on epsilon.
		return null;
	}

}
