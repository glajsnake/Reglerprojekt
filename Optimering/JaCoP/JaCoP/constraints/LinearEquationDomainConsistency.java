/**
 *  LinearEquationDomainConsistency.java 
 *  This file is part of JaCoP.
 *
 *  JaCoP is a Java Constraint Programming solver. 
 *	
 *	Copyright (C) 2000-2008 Radoslaw Szymanek and Polina Makeeva
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Affero General Public License for more details.
 *  
 *  Notwithstanding any other provision of this License, the copyright
 *  owners of this work supplement the terms of this License with terms
 *  prohibiting misrepresentation of the origin of this work and requiring
 *  that modified versions of this work be marked in reasonable ways as
 *  different from the original version. This supplement of the license
 *  terms is in accordance with Section 7 of GNU Affero General Public
 *  License version 3.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

package JaCoP.constraints;

import java.util.ArrayList;

import JaCoP.constraints.ExtensionalSupportSTR;
import JaCoP.core.Store;
import JaCoP.core.IntVar;
import JaCoP.core.ValueEnumeration;
import JaCoP.search.Search;
import JaCoP.search.DepthFirstSearch;
import JaCoP.search.SimpleSelect;
import JaCoP.search.SelectChoicePoint;
import JaCoP.search.IndomainMin;
import JaCoP.search.SimpleSolutionListener;

/**
 *
 * It constructs a LinearEquationDomainConsistency constraint based on ExtensionalSupportSTR constraint. 
 * 
 * @author Krzysztof Kuchcinski
 * @version 3.1
 */

public class LinearEquationDomainConsistency extends DecomposedConstraint {

    IntVar[] vars;
    int[] weights;
    int result;
    ArrayList<Constraint> constraints;
	
    ArrayList<int[]> tuples = new ArrayList<int[]>();

    boolean validLastValue = false;

	/**
	 * It creates a LinearEquationDomainConsistency constraint. 
	 * 
	 * @param variables a list of variables of linear equation constrain.
	 * @param w the weights for variables.
	 * @param r the right hand side of equation that linera term is equal to.
	 */
	public LinearEquationDomainConsistency(IntVar[] variables, int[] w, int r) {
	
		assert (variables != null) : "variables argument is null";
		this.vars = new IntVar[variables.length];
		System.arraycopy(variables, 0, this.vars, 0, variables.length);

		assert (w != null) : "weights argument is null";
		this.weights = new int[w.length];
		System.arraycopy(w, 0, this.weights, 0, w.length);

		this.result = r;

	}

	@Override
	public void imposeDecomposition(Store store) {
			
		if (constraints == null)
			decompose(store);
		
		for (Constraint c : constraints)
			store.impose(c, queueIndex);
	}

	@Override
	public ArrayList<Constraint> decompose(Store store) {

		if (constraints != null)
			return constraints;

		int index = putLargestDomainLast(vars, weights);

		IntVar tmp = vars[index];
		vars[index] = vars[vars.length-1];
		vars[vars.length-1] = tmp;

		int x = weights[index];
		weights[index] = weights[weights.length-1];
		weights[weights.length-1] = x;

		enumerate(vars, weights, result, new int[0]);

//      		generateTuples(vars, weights, result);

		// System.out.println ("\n============================");
		// for (int i=0; i<tuples.size(); i++) {
		//     System.out.print ("[");
		//     for (int j=0; j<tuples.get(i).length; j++)
		// 	System.out.print (tuples.get(i)[j]+", ");
		//     System.out.print ("], ");
		// }

 		constraints = new ArrayList<Constraint>();
		int[][] values = tuples.toArray(new int[tuples.size()][]);
 		constraints.add(new ExtensionalSupportSTR(vars, values));
		
		return constraints;
	}

    void enumerate(IntVar[] v, int[] weight, int result, int[] partialTuple) {

	if (v.length == 1) {

	    int lastValue = sumW(partialTuple, weight, result);

	    if (validLastValue && v[0].dom().contains(lastValue)) {
		
		int[] t = new int[partialTuple.length+1];
		for (int i=0; i<partialTuple.length; i++)
		    t[i] = partialTuple[i];
		t[t.length-1] = lastValue;

		tuples.add(t);
	    }
	    return;
	}
	else {
	    IntVar[] nextV = new IntVar[v.length-1];
	    for (int i=1; i<v.length; i++)
		nextV[i-1] = v[i];

	    for (ValueEnumeration e = v[0].dom().valueEnumeration(); e.hasMoreElements();) {
		int j = e.nextElement();

		int[] t = new int[partialTuple.length+1];
		for (int i=0; i<partialTuple.length; i++)
		    t[i] = partialTuple[i];
		t[t.length-1] = j;
		enumerate(nextV, weight, result, t);
		
	    }
	}
    }

    int sumW(int[] v, int[] w, int eq) {
	    int result=0;

	    for (int i=0; i<v.length; i++) 
		result += v[i] * w[i];

	    result -= eq;

	    validLastValue = result % -w[w.length-1] == 0;

	    return result / -w[w.length-1];
	}

    int putLargestDomainLast(IntVar[] vars, int[]weights) {
	int index=0;
	int largestDomainSize=0;
	for (int i=0; i<vars.length; i++)
	    if (vars[i].dom().getSize() > largestDomainSize) {
		largestDomainSize = vars[i].dom().getSize();
		index = i;
	    }
	return index;
    }


//     void enumerate(IntVar[] v, int[] weight, int result, int[] partialTuple) {

// 	if (v.length == 0) {

// 	    if (sumW(partialTuple, weight) == result)
// 		tuples.add(partialTuple);

// 	    return;
// 	}
// 	else {
// 	    IntVar[] nextV = new IntVar[v.length-1];
// 	    for (int i=1; i<v.length; i++)
// 		nextV[i-1] = v[i];

// 	    for (ValueEnumeration e = v[0].dom().valueEnumeration(); e.hasMoreElements();) {
// 		int j = e.nextElement();

// 		int[] t = new int[partialTuple.length+1];
// 		for (int i=0; i<partialTuple.length; i++)
// 		    t[i] = partialTuple[i];
// 		t[t.length-1] = j;
// 		enumerate(nextV, weight, result, t);
		
// 	    }
// 	}
//     }

// 	int sumW(int[] v, int[] w) {
// 	int result=0;
// 	for (int i=0; i<w.length; i++)
// 	    result += v[i] * w[i];
// 	return result;
//     }


/*
    IntVar[] searchVars;

    void generateTuples(IntVar[] variables, int[] weight, int result) {

	Store localStore = new Store();

	IntVar[] v = new IntVar[variables.length];
	for (int i=0; i < variables.length; i++)
	    v[i] = new IntVar(localStore, "$"+i, (IntDomain)variables[i].dom().clone());

	searchVars = v;

	localStore.impose(new SumWeight(v, weight, new IntVar(localStore, result, result)));

	DepthFirstSearch<IntVar> label = new DepthFirstSearch<IntVar>();
	SelectChoicePoint<IntVar> select = new SimpleSelect<IntVar>(v, null, new IndomainMin());

	label.setAssignSolution(false);
	label.setSolutionListener(new ResultListener<IntVar>());
	label.getSolutionListener().recordSolutions(false); 
	label.getSolutionListener().searchAll(true);
	label.setPrintInfo(false);

	label.labeling(localStore, select);
	
    }

    public class ResultListener<T extends Var> extends SimpleSolutionListener<T> {

	public boolean executeAfterSolution(Search<T> search, SelectChoicePoint<T> select) {

	    boolean returnCode = super.executeAfterSolution(search, select);

	    int[] tuple = new int[searchVars.length];
 	    for (int i=0; i<searchVars.length; i++)
		tuple[i] = searchVars[i].value();

	    tuples.add(tuple);

	    return returnCode;
	}
    }
*/

}
