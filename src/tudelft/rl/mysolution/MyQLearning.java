package tudelft.rl.mysolution;

import java.util.ArrayList;

import tudelft.rl.Action;
import tudelft.rl.QLearning;
import tudelft.rl.State;

public class MyQLearning extends QLearning {

    /**
     * Updating the Q value for the state the agent left.
     * @param s, state where the agent came from
     * @param a, action it executed
     * @param r, the reward in the resulting state
     * @param s_next, the resulting state
     * @param possibleActions, the available actions in the resulting state
     * @param alfa, learning rate alpha
     * @param gamma, discount factor
     */
	@Override
	public void updateQ(State s, Action a, double r, State s_next, ArrayList<Action> possibleActions, double alfa, double gamma) {
        Action bestAction = possibleActions.get(0);

		for(Action possibleAction : possibleActions) {
			if(getQ(s_next, possibleAction) > getQ(s_next, bestAction)) {
				bestAction = possibleAction;
			}
		}

		double addedValue = alfa*(r + gamma * getQ(s_next,bestAction) - getQ(s,a));
		double newQ = getQ(s,a) + addedValue;

		setQ(s, a, newQ);
		
	}

}
