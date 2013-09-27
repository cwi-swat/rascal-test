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
 *   * Bert Lisser - Bert.Lisser@cwi.nl - CWI
*******************************************************************************/


//	@Test public test boollist() {

		public test bool listTest() =[0,1,2,3][0] == 0;
		public test bool listTest() = [0,1,2,3][1] == 1;
		public test bool listTest() = [0,1,2,3][2] == 2;
		public test bool listTest() = [0,1,2,3][3] == 3;

		public test bool listTest() {list[int] L = [0,1,2,3]; L[0] = 10; return L == [10,1,2,3];}
		public test bool listTest() {list[int] L = [0,1,2,3]; L[1] = 11; return L == [0,11,2,3];}
		public test bool listTest() {list[int] L = [0,1,2,3]; L[2] = 22; return L == [0,1,22,3];}
		public test bool listTest() {list[int] L = [0,1,2,3]; L[3] = 33; return L == [0,1,2,33];}
//	}
	
	@expected{IndexOutOfBounds}
	public test bool listError(){
		[0,1,2,3][4] == 3;
	}
	
	@expected{IndexOutOfBounds}
	public test bool listError(){
		list[int] L = [0,1,2,3]; L[4] = 44; L == [0,1,2,3,44]; return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedListVariable(){
		list[int] L; L[4]; return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedListVariable(){
		list[int] L; L[4] = 44;return false;
	}
	
	@expected{UnexpectedType}
	public test bool WrongListIndex(){
		list[int] L = [0,1,2,3]; L["abc"]; return false;
	}
	
	@expected{UnsupportedSubscript}
	public test bool WrongListIndex(){
		list[int] L = [0,1,2,3]; L["abc"] = 44;return false;
	}
	
	@expected{UnexpectedType}
	public test bool WrongListAssignment(){
		list[int] L = [0,1,2,3]; L[2] = "abc";return false;
	}

//	//@Test public test boolmap() {
		public test bool mapTest() = (1:10, 2:20, 3:30)[1] == 10;
		public test bool mapTest() = (1:10, 2:20, 3:30)[2] == 20;
		public test bool mapTest() = (1:10, 2:20, 3:30)[3] == 30;

		// mapTestrunWithError("(1:10, 2:20, 3:30)[4] == 30;", "xxx"));

		public test bool mapTest() {map[int,int] M = (1:10, 2:20, 3:30); M[1] = 100; return M == (1:100, 2:20, 3:30);}
		public test bool mapTest() {map[int,int] M = (1:10, 2:20, 3:30); M[2] = 200; return M == (1:10, 2:200, 3:30);}
		public test bool mapTest() {map[int,int] M = (1:10, 2:20, 3:30); M[3] = 300; return M == (1:10, 2:20, 3:300);}
		public test bool mapTest() {map[int,int] M = (1:10, 2:20, 3:30); M[4] = 400; return M == (1:10, 2:20, 3:30, 4:400);}
//	//}

	@expected{UnexpectedType}
	public test bool WrongMapIndex(){
		map[int,int] M = (1:10,2:20); M["abc"];return false;
	}
	
	@expected{UnexpectedType}
	public test bool WrongMapIndex(){
		map[int,int] M  = (1:10,2:20); M["abc"] = 3;return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedMapVariable() {
		map[int,int] M; M[4]; return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedMapVariable(){
		map[int,int] M; M[4] = 44; return false;
	}
	
	@expected{UndeclaredVariable}
	public test bool WrongMapAssignment(){
		runTest("{map[int,int] M = (1:10,2:20); M[2] = \"abc\";}");
	}

//	@Test public test bool tuple() {
		public test bool  tupleTest()=<0, "a", 3.5>[0] == 0;
		public test bool  tupleTest()=<0, "a", 3.5>[1] == "a";
		public test bool  tupleTest()=<0, "a", 3.5>[2] == 3.5;
//	}

	@expected{UninitializedVariable}
	public test bool UninitializedTupleVariable(){
		tuple[int,int] T; T[1];return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedTupleVariable(){
		tuple[int,int] T; T[1] = 10; return false;
	}
	
	@expected{IndexOutOfBounds}
	public test bool tupleBoundsError(){
		<0, "a", 3.5>[3] == 3.5;
	}
	
	@expected{UnsupportedSubscript}
	public test bool tupleIndexError(){
		<0, "a", 3.5>["abc"];return false;
	}
	
	@expected{UnsupportedSubscript}
	public test bool tupleAssignmentError(){
		T = <0, "a", 3.5>["abc"]; T[1] = 3; return false;
	}

//	@Test  public test boolrelation() {
		public test bool relationTest()= {<1, "a">, <2, "b">}[0] == {};
		public test bool relationTest()={<1, "a">, <2, "b">}[1] == {"a"};
		public test bool relationTest()={<1, "a">, <2, "b">}[2] == {"b"};

		public test bool  relationTest()={<1, "a">, <2, "b">, <1, "abc">}[1] == {"a", "abc"};

		public test bool  relationTest()={<1, "a", 10>, <2, "b", 20>, <1, "abc", 100>}[0] == {};
		public test bool  relationTest()={<1, "a", 10>, <2, "b", 20>, <1, "abc", 100>}[1] == {<"a", 10>, <"abc", 100>};
		public test bool  relationTest()={<1, "a", 10>, <2, "b", 20>, <1, "abc", 100>}[2] == {<"b", 20>};
		public test bool  relationTest()={<1, "a", 10>, <2, "b", 20>, <1, "abc", 100>}[{1,2}] == {<"a", 10>, <"b", 20>, <"abc", 100>};
	
		public test bool relationTest()={<1, "a", 10>, <2, "b", 20>, <1, "abc", 100>}[1,_] == {10, 100};
//	}

	@expected{UninitializedVariable}
	public test bool UninitializedRelVariable(){
		rel[int,int] R; R[1];return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedRelVariable(){
		rel[int,int] R; R[1,2];return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedRelVariable(){
		rel[int,int] R; R[1] = 10; return false;
	}

//	@Test public test bool relationMultiIndex() {
		public test bool relationMultiIndex()={<1,"a",1.0>,<2,"b",2.0>,<3,"c",3.0>}[0] == {};
		public test bool relationMultiIndex()={<1,"a",1.0>,<2,"b",2.0>,<3,"c",3.0>}[1] == {<"a",1.0>};
		public test bool relationMultiIndex()={<1,"a",1.0>,<2,"b",2.0>,<3,"c",3.0>}[2, "b"] == {2.0};
		public test bool relationMultiIndex()= {<1,10,10.5>, <2,20,20.5>, <3,20,30.5>, <2,10,100.5>}[{1},{10,20}] == {10.5};
//	}


//	@Test public test boolnode() {
		public test bool nodeTest()= f(0, "a", 3.5)[0] == 0;
		public test bool nodeTest()= f(0, "a", 3.5)[1] == "a";
		public test bool nodeTest()= f(0, "a", 3.5)[2] == 3.5;
		public test bool nodeTest() {NODE T = f(0, "a", 3.5); T[0] = 10; return  T == f(10, "a", 3.5);}
//	}
	
	@expected{IndexOutOfBounds}
	public test bool nodeBoundsError() = f(0, "a", 3.5)[3] == 3.5;
	
	
	@expected{UnexpectedType}
	public test bool nodeIndexError() {
		f(0, "a", 3.5)["abc"];return false;
	}
	
	@expected{UnexpectedType}
	public test bool nodeAssignmentError(){
		NODE N = f(0, "a", 3.5); N.b = 3; return false;
	}
data NODE = f(int a, str b, real c);
