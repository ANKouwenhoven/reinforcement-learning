package tudelft.rl.mysolution;

import java.util.ArrayList;

import tudelft.rl.Action;
import tudelft.rl.QLearning;
import tudelft.rl.State;

public class MyQLearning extends QLearning {

	@Override
	public void updateQ(State s, Action a, double r, State s_next, ArrayList<Action> possibleActions, double alfa, double gamma) {

		Action bestAction = possibleActions.get(0);

		for(Action possibleAction : possibleActions) {
			if(getQ(s, possibleAction) > getQ(s, bestAction)) {
				bestAction = possibleAction;
			}
		}

		double addedValue = alfa*(r + gamma * getQ(s_next,bestAction) - getQ(s,a));


		double newQ = getQ(s,a) + addedValue;

		/*
		if(addedValue!=0.0){
			System.out.println("Added value: " + addedValue);
			System.out.println("Update Q from: " + getQ(s,a) + " to: " + newQ);

		}*/


		setQ(s, a, newQ);
		
	}

}
