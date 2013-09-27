module tests::functionality::AliasTests
/*******************************************************************************
 * Copyright (c) 2009-2011 CWI
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:

 *   * Jurgen J. Vinju - Jurgen.Vinju@cwi.nl - CWI
 *   * Tijs van der Storm - Tijs.van.der.Storm@cwi.nl
 *   * Paul Klint - Paul.Klint@cwi.nl - CWI
*******************************************************************************/

/*	
	
	@expected{StaticError}
	public test bool  doubleDeclarationError(){
		alias A = str;
		alias A = int;
		return false;
	}
	
	@expected{StaticError}
	public test bool  circularDeclarationError(){
		alias A = A;
		return false;
	}
	
	@expected{StaticError.class}
	public test bool  undeclaredTYpeError(){
		runTest("alias A = B;");
	}
	
	@Test
	public test bool  usingAliases(){
		prepare("alias INTEGER = int;");
		
		assertTrue(runTestInSameEvaluator("{INTEGER I = 3; I == 3;}"));
		assertTrue(runTestInSameEvaluator("{INTEGER I = 3; int J = I; J == 3;}"));
		
		assertTrue(runTestInSameEvaluator("{list[INTEGER] LI = [1,2,3]; LI == [1,2,3];}"));
		assertTrue(runTestInSameEvaluator("{set[INTEGER] SI = {1,2,3}; SI == {1,2,3};}"));
		assertTrue(runTestInSameEvaluator("{map[INTEGER,INTEGER] MI = (1:10,2:20); MI == (1:10,2:20);}"));
		assertTrue(runTestInSameEvaluator("{rel[INTEGER,INTEGER] RI = {<1,10>,<2,20>}; RI == {<1,10>,<2,20>};}"));
	}
	
	@Test
	public test bool  usingIndirectAliases(){
		prepare("alias INTEGER0 = int;");
		prepareMore("alias INTEGER = INTEGER0;");
		
		assertTrue(runTestInSameEvaluator("{INTEGER I = 3; I == 3;}"));
		assertTrue(runTestInSameEvaluator("{INTEGER I = 3; int J = I; J == 3;}"));
		
		assertTrue(runTestInSameEvaluator("{list[INTEGER] LI = [1,2,3]; LI == [1,2,3];}"));
		assertTrue(runTestInSameEvaluator("{set[INTEGER] SI = {1,2,3}; SI == {1,2,3};}"));
		assertTrue(runTestInSameEvaluator("{map[INTEGER,INTEGER] MI = (1:10,2:20); MI == (1:10,2:20);}"));
		assertTrue(runTestInSameEvaluator("{rel[INTEGER,INTEGER] RI = {<1,10>,<2,20>}; RI == {<1,10>,<2,20>};}"));
	}
	
	@Test
	public test bool  usingVeryIndirectAliases(){
		prepare("alias INTEGER0 = int;");
		prepareMore("alias INTEGER1 = INTEGER0;");
		prepareMore("alias INTEGER = INTEGER1;");
		
		assertTrue(runTestInSameEvaluator("{INTEGER I = 3; I == 3;}"));
		assertTrue(runTestInSameEvaluator("{INTEGER I = 3; int J = I; J == 3;}"));
		
		assertTrue(runTestInSameEvaluator("{list[INTEGER] LI = [1,2,3]; LI == [1,2,3];}"));
		assertTrue(runTestInSameEvaluator("{set[INTEGER] SI = {1,2,3}; SI == {1,2,3};}"));
		assertTrue(runTestInSameEvaluator("{map[INTEGER,INTEGER] MI = (1:10,2:20); MI == (1:10,2:20);}"));
		assertTrue(runTestInSameEvaluator("{rel[INTEGER,INTEGER] RI = {<1,10>,<2,20>}; RI == {<1,10>,<2,20>};}"));
	}
	
	@Test
	public test bool  aliasAndADT1() {
		prepareModule("Tester", "module Tester alias INTEGER0 = INTEGER1; data INTEGER1 = f(int);");
		prepareMore("import Tester;");
		assertTrue(runTestInSameEvaluator("{ INTEGER0 x = f(0); x == f(0); }"));
	}
	
	@Test
	public test bool  aliasAndADT2(){
		prepare("alias StateId = int;");
		prepareMore("alias Permutation = list[int];");
		prepareMore("alias StatedId = int;");
		prepareMore("alias Symbol = int;");
		prepareMore("map[list[Permutation], StateId] allStates = ();");
		prepareMore("rel[StateId from,StateId to,Symbol symbol] Transitions = {}; "); 
		assertTrue(runTestInSameEvaluator("{Transitions = {<1,2,3>}; true;}"));
		
	}
	
	@Test
	public test bool  outofOrderDeclaration() {
		prepareModule("Tester", "module Tester alias INTEGER0 = INTEGER1; alias INTEGER1 = int;");
		prepareMore("import Tester;");
		assertTrue(runTestInSameEvaluator("{ INTEGER0 x = 0; x == 0; }"));
	}

	@expected{StaticError.class} 
	public test bool  longCycle() {
		prepareModule("Tester", "module Tester alias INTEGER0 = INTEGER1; alias INTEGER1 = INTEGER2; alias INTEGER2 = INTEGER0;");
		prepareMore("import Tester;");
	}
	
	@expected{StaticError.class} 
	public test bool  undeclaredTypeInDefinition() {
		prepareModule("Tester", "module Tester alias INTEGER0 = INTEGER1;");
		prepareMore("import Tester;");
	}
	
	@expected{StaticError.class}
	public test bool  anotherCircularity() {
		prepareModule("Tester", "module Tester alias INTEGER0 = INTEGER1; alias INTEGER1 = INTEGER0;");
		prepareMore("import Tester;");
		assertTrue(runTestInSameEvaluator("{ INTEGER0 x = 0; x == 0; }"));
	}
	
	@Test
	public test bool  transitiveAliasAcrossTuplesBug() {
		prepareModule("B", "module B\n" +
				"alias trans = tuple[str, str, str];\n" +
				
				"alias block = set[trans];\n" +
				"alias partition = set[block];\n");
		prepareMore("import B;");
		assertTrue(runTestInSameEvaluator("{block aBlock = {<\"a\", \"b\", \"c\">}; " +
				"aBlock == {<\"a\", \"b\", \"c\">} ; }"));
	}
	
*/
