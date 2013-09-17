module tests::functionality::ScopeTests
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
 *   * Arnold Lankamp - Arnold.Lankamp@cwi.nl
 *   * Bert Lisser - Bert.Lisser@cwi.nl - CWI
*******************************************************************************/

	
	@expected{UndeclaredVariable}
	public test bool  noEscapeFromToplevelMatch() {
		{bool a := true; return a;}
	}
	
	@expected{UndeclaredVariable}
	public test bool  noEscapeFromToplevelMatchStatement() {
		bool a := true;
		return a;
	}
	
	//@expected{UndeclaredVariable})
	//public test bool  noEscapeFromToplevelMatchExpression() {
	//	runTest("bool a := true"); // notice the necessary lack of a semi-colon here
	//	runTestInSameEvaluator("a;");
	//}

	@expected{RedeclaredVariable}
	public test bool  localRedeclarationError1(){
		int n; int n;
		}
	
	@expected{RedeclaredVariable}
	public test bool  localRedeclarationError2(){
		int n = 1; int n;
	}

	@expected{RedeclaredVariable}
	public test bool  localRedeclarationError3(){
		int n = 1; int n = 2;
	}
	
	public test bool localShadowing(){
		int n = 2; return int n := 3;
	}	

	public test bool  localRedeclarationInt1(){
		int n ; return int n := 3 && n == 3;
	}
	
	public test bool localRedeclarationInt2(){
		int n; return [int n] := [3] && n == 3;
	}
	
	public test bool localShadowing2(){
		int n; return [*int n] := [1,2,3] && n == [1,2,3];
	}
	
	public test bool  localShadowingListMatch(){
		list[int] n = [10,20]; return [*int n] := [1,2,3] && n == [1,2,3];
	}
	
	public test bool  localRedeclarationList(){
		list[int] n; return [*int n] := [1,2,3] && n == [1,2,3];
	}
	
	public test bool  localRedeclarationError9(){
		int n; return /<n:[0-9]*>/ := "123";
	}
	
	public test bool  localComprehensionShadowing(){
		int n = 5; L = [n | int n <- [1 .. 10]]; return n==5;
	}
	
	public test bool  localRedeclarationError10(){
		int n; L = [n | int n <- [1 .. 10]]; return L == [1 .. 10];
		}

	
	//@expected{RedeclaredVariable})
	//public test bool  moduleRedeclarationError1(){
	//	prepareModule("XX", "module XX public int n = 1; public int n = 2;");
	//	runTestInSameEvaluator("import XX;");
	//	assertTrue(runTestInSameEvaluator("n == 1;"));
	//}
	
	//@Test
	//public test bool  qualifiedScopeTest(){
	//	prepareModule("XX", "module XX public int n = 1; ");
	//	runTestInSameEvaluator("import XX;");
	//	runTestInSameEvaluator("XX::n = 2;");
	//	runTestInSameEvaluator("XX::n == 2;");
	//}
	//
	//@Test
	//public test bool  moduleAndLocalVarDeclaration(){
	//	prepareModule("XX", "module XX public int n = 1;");
	//	prepareMore("import XX;");
	//	assertTrue(runTestInSameEvaluator("{int n = 2; n == 2;}"));
	//}
	
	@expected{UndeclaredVariable}
	public test bool  ifNoLeak1(){
		if (int n := 3) {n == 3;} else  {n != 3;} n == 3; return false;
	}
	
	@expected{UndeclaredVariable}
	public test bool  ifNoLeak2(){
		if(int n <- [1 .. 3], n>=3){n == 3;}else{n != 3;} n == 3; return false;
	}
	
	@expected{UndeclaredVariable}
	public test bool  blockNoLeak1(){
		int n = 1; {int m = 2;} n == 1 && m == 2; return false;
	}
	
	public test bool RedeclaredLocal(){
		int n = 1; {int m = 2;}; int m = 3; return n == 1 && m == 3;
	}
	
	@expected{UndeclaredVariable}
	public test bool  innerImplicitlyDeclared(){
		int n = 1; {m = 2;}; return n == 1 && m == 2;
	}
	
	@expected{UndeclaredVariable}
	public test bool  varsInEnumeratorExpressionsShouldNotLeak(){
		int n <- [1,2]; n == 1; return false;
	}
	
	public test bool  formalsToGlobalsLeak() {
		int x = 0;
		void f(int x) { x += 1;}
		f(1); return x == 0;
	}

