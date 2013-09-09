module tests::functionality::StatementTests


//	@Test public test bool testAssert() {
       public test bool q() {return assert 3 > 2;}
	   public test bool q() {return assert 3 > 2: "Yes assert succeeds";}
//	}

	@expected{AssertionFailed}
	// public test bool assertError1() {
		public test bool q() {assert 1 == 2;return false;}
	// }
	
	@expected{UnexpectedType}
	// public test bool assertError2() {
		public test bool q() {assert 3.5;return false;}
	// }
	
	@expected{UnexpectedType}
	public test bool assertError3() {
		assert 3.5 : "Wrong expression type";return false;
	}
	
	@expected{UndeclaredVariable}
	// public test bool assertError4() {
		public test bool q() {return assert X;}
	// }
	
	@expected{UndeclaredVariable}
	public test bool assertError5() {
		assert X : "Wrong expression type";return false;
	}
	

//	@Test public test bool assignment() {
		public test bool q() {int x = 3; return x == 3;}
		public test bool q() {int x = 3; x = 4; return  x == 4;}
		public test bool q() {return {<x, y> = <3, 4>; (x == 3) && (y == 4);};}
		public test bool q() {return {<x, y, z> = <3, 4, 5>; (x == 3) && (y == 4) && (z == 5);};}
		public test bool q() {return {<x, y> = <3, 4>; x = 5; return (x == 5) && (y == 4);};}

		public test bool q() {int x = 3; x += 2; return x == 5;}
		public test bool q() {int x = 3; x -= 2; return x == 1;}
		public test bool q() {int x = 3; x *= 2; return x == 6;}
		public test bool q() {int x = 3; x /= 2; return x == 1;}
		
		public test bool q() {list[int] x = [0,1,2]; return x == [0,1,2];}
		public test bool q() {list[int] x = [0,1,2]; return x[0] == 0;}
		public test bool q() {list[int] x = [0,1,2]; return x[1] == 1;}
		public test bool q() {list[int] x = [0,1,2]; return  x[2] == 2;}
		public test bool q() {return {list[int] x = [0,1,2]; x[1] = 10; (x[0] == 0) && (x[1] == 10) && (x[2] == 2);};}

		public test bool q() {return {map[int,int] x = (0:0,1:10,2:20); x == (0:0,1:10,2:20);};}
		public test bool q() {return {map[int,int] x = (0:0,1:10,2:20); x[1] = 15; (x[0] == 0) && (x[1] == 15) && (x[2] == 20);};}

		public test bool q() {set[int] x = {0,1,2}; return x == {0,1,2};}
		public test bool q() {set[int] x = {0,1,2}; x = x + {3,4}; return x == {0,1,2, 3,4};}

		public test bool q() {rel[str,list[int]] s = {<"a", [1,2]>, <"b", []>, <"c", [4,5,6]>}; return s != {};}
		public test bool q() {rel[str,list[int]] s = {<"a", [1,2]>, <"b", []>, <"c", [4,5,6]>};return s != {};}
//	}

//	@Test public test bool block() {
		public test bool q() {int x = 3; x = 4; return x ==4;}
		public test bool q() {int x = 3; x = 4; return x == 4;}
//	}

//	@Test public test bool testBreak() {
		// public test bool q() {int n = 0; while(n < 10){ n = n + 1; break;}; n == 1;};));
//	}

//	@Test
//	public test bool testContinue() {
//	}

//	@Test public test bool doWhile() {
		public test bool q() {return {int n = 0; m = 2; do {m = m * m; n = n + 1;} while (n < 1); (n == 1) && (m == 4);};}
		public test bool q() {return {int n = 0; m = 2; do {m = m * m; n = n + 1;} while (n < 3); m == 256;};}
//	}
	
	@expected{UnexpectedType}
// public test bool doWhileError() {
		public test bool q() {do {n = 4;} while(3); return false;}
//	}
	
//	@Test public test bool testWhile() {
		public test bool q() {return {int n = 0; int m = 2; while(n != 0){ m = m * m;}; (n == 0)&& (m == 2);};}
		public test bool q() {return {int n = 0; int m = 2; while(n < 3){ m = m * m; n = n + 1;}; (n ==3) && (m == 256);};}
//	}
	
	@expected{UnexpectedType}
	// public test bool whileError() {
		public test bool q() {while(3){n = 4;};return false;}
	// }
	
data D = d(int i) | d();
D d(int i) { if (i % 2 == 0) fail d; else return d();}
// public test bool fail() {
		public test bool q() = d(2) := d(2);
		public test bool q() = d(3) == d();
		
//	}

// @Test public test bool testFor() {
		public test bool q() {int n = 0; for(int i <- [1,2,3,4]){ n = n + i;} return n == 10;}
		public test bool q() {int n = 0; for(int i <- [1,2,3,4], n <= 3){ n = n + i;} return n == 6;}
		public test bool q() {int n = 0; for(int i <- [1,2,3,4]){ n = n + 1; if (n == 3) break; } return n == 3;}
		public test bool q() {int n = 0; for(int i <- [1,2,3,4], n <= 3){ if (n == 3) continue; n = n + 1; } return n == 3;}
		public test bool q() {int n = 0; loop:for(int i <- [1,2,3,4], n <= 3){ if (n == 3) fail loop; n = n + 1; } return n == 3;}
//	}
	
//	@Test  public test bool testAppend(){
		//public test bool q() for(int i <- [1,2,3,4]){ 3 * i; } == 12;));
		public test bool q() { L = for(int i <- [1,2,3,4]){ append 3 * i; }; return L == [3,6,9,12];}
		public test bool q() { L = for(int i <- [1,2,3,4]){ append 3 * i; append 4 *i;}; return L == [3,4,6,8,9,12,12,16];}
//	}

//	@Test public test bool ifThen() {
		public test bool q() {int n = 10; if(n < 10){n = n - 4;} return n == 10;}
		public test bool q() {int n = 10; if(n < 15){n = n - 4;} return n == 6;}
		public test bool q() {int n = 10; l:if(int i <- [1,2,3]){ if (i % 2 != 0) { n = n + 4; fail l; } n = n - 4;} 
		     return n == 10;}
//	}
	

	@expected{UnexpectedType}
//	public test bool ifThenError() {
		public test bool q() {return if(3){n = 4;}}
//	}
	
//	@Test public test bool ifThenElse() {
		public test bool q() {int n = 10; if(n < 10){n = n - 4;} else { n = n + 4;} return n == 14;}
		public test bool q() {int n = 12; if(n < 10){n = n - 4;} else { n = n + 4;} return n == 16;}
//	}
	
	@expected{UnexpectedType}
	public test bool ifThenElseError() {
		if("abc") {n = 4;} else {n=5;}; return false;
	}

//	@Test public test bool testSwitch() {
		public test bool q() {int n = 0; switch(2){ case 2: n = 2; case 4: n = 4; case 6: n = 6; default: n = 10;} return n == 2;}
		public test bool q() {int n = 0; switch(4){ case 2: n = 2; case 4: n = 4; case 6: n = 6; default: n = 10;} return n == 4;}
		public test bool q() {int n = 0; switch(6){ case 2: n = 2; case 4: n = 4; case 6: n = 6; default: n = 10;} return n == 6;}
		public test bool q() {int n = 0; switch(8){ case 2: n = 2; case 4: n = 4; case 6: n = 6; default: n = 10;} return n == 10;}
//	}
	
	rel[int,int] R1 =  {<1,2>, <2,3>, <3,4>};
	
	
// @Test  public test bool solve(){	
		public test bool q() {
		  rel[int,int] T =    R1;
		  solve (T)  T = T + (T o R1);
		  return T =={<1,2>, <1,3>,<1,4>,<2,3>,<2,4>,<3,4>};
    }

@expected{UnexpectedType}	
public test bool q() {
		rel[int,int] T =    R1;
		solve (T; true)  T = T + (T o R1);
		return T =={<1,2>, <1,3>,<1,4>,<2,3>,<2,4>,<3,4>};
		}
	
	
@expected{IndexOutOfBounds}
public test bool q() {
		rel[int,int] T =    R1;
		solve (T; -1)  T = T + (T o R1);
		return T =={<1,2>, <1,3>,<1,4>,<2,3>,<2,4>,<3,4>};
		}	
	

//public test bool solveMaximumUnboundedBug888() {
//		prepare("int j = 0;");
//		prepareMore("solve (j) if (j < 100000) j += 1;");
//		assertTrue(runTestInSameEvaluator("j == 100000;
//	}
//	


