module tests::functionality::SubscriptTests
/*******************************************************************************
 * Copyright (c) 2009-2011 CWI
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:

 *   * Jurgen J. Vinju - Jurgen.Vinju@cwi.nl - CWI
 *   * Paul Klint - Paul.Klint@cwi.nl - CWI
 *  *  Bert Lisser - Bert.Lisser@cwi.nl - CWI
*******************************************************************************/


//	@Test public test boollist() {

		public test bool assertTrue() =[0,1,2,3][0] == 0;
		public test bool assertTrue() = [0,1,2,3][1] == 1;
		public test bool assertTrue() = [0,1,2,3][2] == 2;
		public test bool assertTrue() = [0,1,2,3][3] == 3;

		public test bool assertTrue() {list[int] L = [0,1,2,3]; L[0] = 10; return L == [10,1,2,3];}
		public test bool assertTrue() {list[int] L = [0,1,2,3]; L[1] = 11; return L == [0,11,2,3];}
		public test bool assertTrue() {list[int] L = [0,1,2,3]; L[2] = 22; return L == [0,1,22,3];}
		public test bool assertTrue() {list[int] L = [0,1,2,3]; L[3] = 33; return L == [0,1,2,33];}
//	}
	
	@expected{IndexOutOfBounds}
	public test bool listError1(){
		[0,1,2,3][4] == 3;
	}
	
	@expected{IndexOutOfBounds}
	public test bool listError2(){
		list[int] L = [0,1,2,3]; L[4] = 44; L == [0,1,2,3,44]; return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedListVariable1(){
		list[int] L; L[4]; return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedListVariable2(){
		list[int] L; L[4] = 44;return false;
	}
	
	@expected{UnexpectedType}
	public test bool WrongListIndex1(){
		list[int] L = [0,1,2,3]; L["abc"]; return false;
	}
	
	@expected{UnsupportedSubscript}
	public test bool WrongListIndex2(){
		list[int] L = [0,1,2,3]; L["abc"] = 44;return false;
	}
	
	@expected{UnexpectedType}
	public test bool WrongListAssignment(){
		list[int] L = [0,1,2,3]; L[2] = "abc";return false;
	}
/*
	@Test
	public test boolmap() {
		public test bool assertTrue() {(1:10, 2:20, 3:30)[1] == 10;}
		public test bool assertTrue() {(1:10, 2:20, 3:30)[2] == 20;}
		public test bool assertTrue() {(1:10, 2:20, 3:30)[3] == 30;}

		// assertTruerunWithError("(1:10, 2:20, 3:30)[4] == 30;", "xxx"));

		public test bool assertTrue() {{map[int,int] M = (1:10, 2:20, 3:30); M[1] = 100; M == (1:100, 2:20, 3:30);}}
		public test bool assertTrue() {{map[int,int] M = (1:10, 2:20, 3:30); M[2] = 200; M == (1:10, 2:200, 3:30);}}
		public test bool assertTrue() {{map[int,int] M = (1:10, 2:20, 3:30); M[3] = 300; M == (1:10, 2:20, 3:300);}}
		public test bool assertTrue() {{map[int,int] M = (1:10, 2:20, 3:30); M[4] = 400; M == (1:10, 2:20, 3:30, 4:400);}}
	}
	
	@expected{StaticError.class}
	public test boolWrongMapIndex1(){
		runTest("{map[int,int] M = (1:10,2:20); M[\"abc\"];}");
	}
	
	@expected{StaticError.class}
	public test boolWrongMapIndex2(){
		runTest("{map[int,int] M  = (1:10,2:20); M[\"abc\"] = 3;}");
	}
	
	@expected{UninitializedVariable.class}
	public test boolUninitializedMapVariable1(){
		runTest("{map[int,int] M; M[4];}");
	}
	
	@expected{UninitializedVariable.class}
	public test boolUninitializedMapVariable2(){
		runTest("{map[int,int] M; M[4] = 44;}");
	}
	
	@expected{StaticError.class}
	public test boolWrongMapAssignment(){
		runTest("{map[int,int] M = (1:10,2:20); M[2] = \"abc\";}");
	}

	@Test
	public test booltuple() {
		assertTrue(runTest("<0, \"a\", 3.5>[0] == 0;"));
		assertTrue(runTest("<0, \"a\", 3.5>[1] == \"a\";"));
		assertTrue(runTest("<0, \"a\", 3.5>[2] == 3.5;"));
	}
	
	@expected{UninitializedVariable.class}
	public test boolUninitializedTupleVariable1(){
		runTest("{tuple[int,int] T; T[1];}");
	}
	
	@expected{UninitializedVariable.class}
	public test boolUninitializedTupleVariable2(){
		runTest("{tuple[int,int] T; T[1] = 10;}");
	}
	
	@expected{Throw.class}
	public test booltupleBoundsError(){
		runTest("<0, \"a\", 3.5>[3] == 3.5;");
	}
	
	@expected{StaticError.class}
	public test booltupleIndexError(){
		runTest("<0, \"a\", 3.5>[\"abc\"];");
	}
	
	@expected{StaticError.class}
	public test booltupleAssignmentError(){
		runTest("{T = <0, \"a\", 3.5>[\"abc\"]; T[1] = 3;}");
	}

	@Test
	public test boolrelation() {
		assertTrue(runTest("{<1, \"a\">, <2, \"b\">}[0] == {};"));
		assertTrue(runTest("{<1, \"a\">, <2, \"b\">}[1] == {\"a\"};"));
		assertTrue(runTest("{<1, \"a\">, <2, \"b\">}[2] == {\"b\"};"));

		assertTrue(runTest("{<1, \"a\">, <2, \"b\">, <1, \"abc\">}[1] == {\"a\", \"abc\"};"));

		assertTrue(runTest("{<1, \"a\", 10>, <2, \"b\", 20>, <1, \"abc\", 100>}[0] == {};"));
		assertTrue(runTest("{<1, \"a\", 10>, <2, \"b\", 20>, <1, \"abc\", 100>}[1] == {<\"a\", 10>, <\"abc\", 100>};"));
		assertTrue(runTest("{<1, \"a\", 10>, <2, \"b\", 20>, <1, \"abc\", 100>}[2] == {<\"b\", 20>};"));
		assertTrue(runTest("{<1, \"a\", 10>, <2, \"b\", 20>, <1, \"abc\", 100>}[{1,2}] == {<\"a\", 10>, <\"b\", 20>, <\"abc\", 100>};"));
	
		assertTrue(runTest("{<1, \"a\", 10>, <2, \"b\", 20>, <1, \"abc\", 100>}[1,_] == {10, 100};"));
	}
	
	@expected{UninitializedVariable.class}
	public test boolUninitializedRelVariable1(){
		runTest("{rel[int,int] R; R[1];}");
	}
	
	@expected{UninitializedVariable.class}
	public test boolUninitializedRelVariable2(){
		runTest("{rel[int,int] R; R[1,2];}");
	}
	
	@expected{UninitializedVariable.class}
	public test boolUninitializedRelVariable3(){
		runTest("{rel[int,int] R; R[1] = 10;}");
	}

	@Test
	public test boolrelationMultiIndex() {
		assertTrue(runTest("{<1,\"a\",1.0>,<2,\"b\",2.0>,<3,\"c\",3.0>}[0] == {};"));
		assertTrue(runTest("{<1,\"a\",1.0>,<2,\"b\",2.0>,<3,\"c\",3.0>}[1] == {<\"a\",1.0>};"));
		assertTrue(runTest("{<1,\"a\",1.0>,<2,\"b\",2.0>,<3,\"c\",3.0>}[2, \"b\"] == {2.0};"));

		public test bool assertTrue() {{<1,10,10.5>, <2,20,20.5>, <3,20,30.5>, <2,10,100.5>}[{1},{10,20}] == {10.5};}
	}

	@Test
	public test boolnode() {

		prepare("data NODE = f(int a, str b, real c);");

		assertTrue(runTestInSameEvaluator("f(0, \"a\", 3.5)[0] == 0;"));
		assertTrue(runTestInSameEvaluator("f(0, \"a\", 3.5)[1] == \"a\";"));
		assertTrue(runTestInSameEvaluator("f(0, \"a\", 3.5)[2] == 3.5;"));
		assertTrue(runTestInSameEvaluator("{NODE T = f(0, \"a\", 3.5); T[0] = 10; T == f(10, \"a\", 3.5);}"));
	}
	
	@expected{Throw.class}
	public test boolnodeBoundsError(){
		prepare("data NODE = f(int a, str b, real c);");
		
		runTestInSameEvaluator("f(0, \"a\", 3.5)[3] == 3.5;");
	}
	
	@expected{StaticError.class}
	public test boolnodeIndexError(){
		prepare("data NODE = f(int a, str b, real c);");
		
		runTestInSameEvaluator("f(0, \"a\", 3.5)[\"abc\"];");
	}
	
	@expected{StaticError.class}
	public test boolnodeAssignmentError(){
		prepare("data NODE = f(int a, str b, real c);");
		
		runTestInSameEvaluator("{NODE N = f(0, \"a\", 3.5); N.b = 3;}");
	}
*/
