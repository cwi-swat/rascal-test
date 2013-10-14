 module tests::functionality::PatternTests
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
  
  
  
  	
  	
  // @Test public void matchList1() {
  		
  		public test bool matchList1() = !([] := [2]);
  		public test bool matchList2() = !([1] := []);
  
  		public test bool matchList3() = [] := [];
  		public test bool matchList4() = [1] := [1];
  		public test bool matchList5() = [1,2] := [1,2];
  		
  		public test bool matchList6() = !([1] := [2]);
  		public test bool matchList7() = !([1,2] := [1,2,3]);
  
  		public test bool matchList8() = ([int N] := [1]) && (N == 1);
  		public test bool matchList9() = [ _ ] := [1];
  		
  		public test bool matchList10() = ([int N, 2, int M] := [1,2,3]) && (N == 1) && (M==3);
  		public test bool matchList11() = [ _, 2, _] := [1,2,3];
  		
  		public test bool matchList12() = ([int N, 2, N] := [1,2,1]) && (N == 1);
  		
  		public test bool matchList13() = !(([int N, 2, N] := [1,2,3]));
  		public test bool matchList14() = !([int N, 2, N] := [1,2,"a"]);
  		
  		public test bool matchList15() {int N = 1; return ([N, 2, int M] := [1,2,3]) && (N == 1) && (M==3);}
  		public test bool matchList16() {int N = 1; return !([N, 2, int M] := [4,2,3]);}
  		
  		public test bool matchList17() {list[int] L = [3]; return [1,2,L] := [1,2,3];}
  		public test bool matchList18() {list[int] L = [2, 3]; return [1, L] := [1,2,3];}
  
  		public test bool matchList19() = [1, [2, 3], 4] := [1, [2, 3], 4];
  		public test bool matchList20() = !([1, [2, 3], 4] := [1, [2, 3, 4], 4]);
  		
  		public test bool matchList21() = ([list[int] L] := [[]]) && (L == []);
  		public test bool matchList22() = ([1, list[int] L] := [1, [2]]) && (L == [2]);
  		public test bool matchList23() = ([1, list[int] L, 10] := [1,[],10]) && (L == []);
  		public test bool matchList24() = ([1, list[int] L, 10] := [1,[2],10]) && (L == [2]);
  		public test bool matchList25() = ([*list[int] L] := []) && (L == []);
  		public test bool matchList26() { list[int] X = []; return ([*int L] := X) && (L == []);} 
  		public test bool matchList27() = ([*int L] := ([1] - [1])) && (L == []);
  		public test bool matchList28() = ([*int L] := [1]) && (L == [1]);
  		public test bool matchList29() = ([*int L] := [1,2]) && (L == [1,2]);
  
  		public test bool matchList30() = ([1, *int L] := [1]) && (L == []);
  		public test bool matchList31() = ([1, *int L] := [1, 2]) && (L == [2]);
  		public test bool matchList32() = ([1, *int L] := [1, 2, 3]) && (L == [2, 3]);
  
  		public test bool matchList33() = ([*int L, 10] := [10]) && (L == []);
  		public test bool matchList34() = ([*int L, 10] := [1,10]) && (L == [1]);
  		public test bool matchList35() = ([*int L, 10] := [1,2,10]) && (L == [1,2]);
  
  		public test bool matchList36() = ([1, *int L, 10] := [1,10]) && (L == []);
  		public test bool matchList37() = ([1, *int L, 10] := [1,2,10]) && (L == [2]);
  		public test bool matchList38() = ([1, *int L, 10, *int M, 20] := [1,10,20]) && (L == []) && (M == []);
  		public test bool matchList39() = ([1, *int L, 10, *int M, 20] := [1,2,10,20]) && (L == [2]) && (M == []);
  		public test bool matchList40() = ([1, *int L, 10, *int M, 20] := [1,2,10,3,20]) && (L == [2]) && (M==[3]);
  		public test bool matchList41() = ([1, *int L, 10, *int M, 20] := [1,2,3,10,4,5,20]) && (L == [2,3]) && (M==[4,5]);
  		
  		public test bool matchList42() = ([1, *int L, 10, L, 20] := [1,2,3,10,2,3,20]) && (L == [2,3]);
  		public test bool matchList43() = !(([1,*int L, 10, L, 20] := [1,2,3,10,2,4,20]));
  		
  		public test bool matchList44() = [*int _] := [];
  		public test bool matchList45() = [*int _] := [1];
  		public test bool matchList46() = [*int _] := [1,2];
  		public test bool matchList47() = ([1, *int _, 10, *int _, 20] := [1,2,10,20]);
  		
  		
  		
  	//	public test bool matchList() {([1, list[int] L, [10, list[int] M, 100], list[int] N, 1000] := [1, [10,100],1000]);}
  	// }
  
  //	@Test public void matchNestedList(){
  		public test bool matchNestedList1() = !([] := [[2]]);
  		public test bool matchNestedList2() = !([[1]] := []);
  
  		public test bool matchNestedList3() = [] := [];
  		public test bool matchNestedList4() = [[1]] := [[1]];
  		public test bool matchNestedList5() = [[1,2]] := [[1,2]];
  		
  		public test bool matchNestedList6() = !([[1]] := [[2]]);
  		public test bool matchNestedList7() = !([[1,2]] := [[1,2,3]]);
  		
  		public test bool matchNestedList8() = [*list[int] L] := [];
  		
  		public test bool matchNestedList9() = [*list[int] L] := [[1]];
  		public test bool matchNestedList10() = [*list[int] L] := [[1,2]];
  		
  		public test bool matchNestedList11() = ([[1], *list[int] L, [6,7,8]] := [[1],[2,3],[4,5],[6,7,8]]) && (L == [[2,3],[4,5]]);
  		public test bool matchNestedList12() = !(([[1], *list[int] L, [6,7,8]] := [[1],[2,3],[4,5],[8]]) && (L == [[2,3],[4,5]]));
  		
  		public test bool matchNestedList13() = ([[1], *list[int] L, [6,7,8], L] := [[1],[2,3],[4,5],[6,7,8],[2,3],[4,5]]) && (L == [[2,3],[4,5]]);
  //	}
  	
  //	@Test public void matchNestedSet(){
  		public test bool matchNestedSet1() = !({} := {{2}});
  		public test bool matchNestedSet2() = !({{1}} := {});
  
  		public test bool matchNestedSet3() = {} := {};
  		public test bool matchNestedSet4() = {{1}} := {{1}};
  		public test bool matchNestedSet5() = {{1,2}} := {{1,2}};
  		
  		public test bool matchNestedSet6() = !({{1}} := {{2}});
  		public test bool matchNestedSet7() = !({{1,2}} := {{1,2,3}});
  		
  		public test bool matchNestedSet8() = {*set[int] L} := {};
  		
  		public test bool matchNestedSet9() = {*set[int] L} := {{1}};
  		public test bool matchNestedSet10() = {*set[int] L} := {{1,2}};
  		
  		public test bool matchNestedSet11() = ({{1}, *set[int] L, {6,7,8}} := {{1},{2,3},{4,5},{6,7,8}}) && (L == {{2,3},{4,5}});
  		public test bool matchNestedSet12() = !(({{1}, *set[int] L, {6,7,8}} := {{1},{2,3},{4,5},{8}}) && (L == {{2,3},{4,5}}));
  		
  		public test bool matchNestedSet13() = ({{1}, *set[int] L, {6,7,8}, L} := {{1},{2,3},{4,5},{6,7,8},{2,3},{4,5}}) && (L == {{2,3},{4,5}});
  //	}
  	
  //	@Test public void matchExternalListVars(){
  		public test bool matchExternalListVars1() {int n;  return n := 3 && n == 3; }
  		public test bool matchExternalListVars2() {list[int] L; return ([1, L, 4, 5] := [1, 2, 3, 4, 5] && L == [2, 3]);}
  //	}
  	
  //	@Test public void matchListMultiVars(){
  		public test bool matchListMultiVars1() = [1, L*, 4, 5] := [1, 2, 3, 4, 5] && L == [2, 3];
  		public test bool matchListMultiVars2() = [1, _*, 4, 5] := [1, 2, 3, 4, 5];
  		public test bool matchListMultiVars3() = [1, L*, 4, L, 5] := [1, 2, 3, 4, 2, 3, 5] && L == [2, 3];
  //	}
  	
  //	@Test public void matchListSpliceVars(){
  		public test bool matchListSpliceVars1() = [1, *L, 4, 5] := [1, 2, 3, 4, 5] && L == [2, 3];
  		public test bool matchListSpliceVars2() = [1, * int L, 4, 5] := [1, 2, 3, 4, 5] && L == [2, 3];
  		public test bool matchListSpliceVars3() = [1, *_, 4, 5] := [1, 2, 3, 4, 5];
  		public test bool matchListSpliceVars4() = [1, * int _, 4, 5] := [1, 2, 3, 4, 5];
  		public test bool matchListSpliceVars5() = [1, *L, 4, *L, 5] := [1, 2, 3, 4, 2, 3, 5] && L == [2, 3];
  		public test bool matchListSpliceVars6() = [1, * int L, 4, *L, 5] := [1, 2, 3, 4, 2, 3, 5] && L == [2, 3];
  //	}
  	
  //	@Test public void matchSetMultiVars(){
  		public test bool matchSetMultiVars1() = {1, S*, 4, 5}:= {1, 2, 3, 4, 5} && S == {2, 3};
  		public test bool matchSetMultiVars2() = {1, _*, 4, 5} := {1, 2, 3, 4, 5};
  //	}
  	
  //	@Test public void matchSetSpliceVars(){
  		public test bool matchSetSpliceVars1() = {1, *S, 4, 5}:= {1, 2, 3, 4, 5} && S == {2, 3};
  		public test bool matchSetSpliceVars2() = {1, * int S, 4, 5}:= {1, 2, 3, 4, 5} && S == {2, 3};
  		public test bool matchSetSpliceVars3() = {1, *_, 4, 5} := {1, 2, 3, 4, 5};
  		public test bool matchSetSpliceVars4() = {1, * int _, 4, 5} := {1, 2, 3, 4, 5};
  //	}
  

  //	@Test public void matchListHasOrderedElement()  {	
  		public test bool matchListHasOrderedElement1() = hasOrderedElement([]) == false;
  		public test bool matchListHasOrderedElement2() = hasOrderedElement([1]) == false;
  		public test bool matchListHasOrderedElement3() = hasOrderedElement([1,2]) == false;
  		public test bool matchListHasOrderedElement4() = hasOrderedElement([1,2,1]) == true;
  		public test bool matchListHasOrderedElement5() = hasOrderedElement([1,2,3,4,3,2,1]) == true;
  //}
  	
  //	@Test public void matchListHasDuplicateElement()  {
  		public test bool matchListHasDuplicateElement1() = hasDuplicateElement([]) == false;
  		public test bool matchListHasDuplicateElement2() = hasDuplicateElement([1]) == false;
  		public test bool matchListHasDuplicateElement3() = hasDuplicateElement([1,2]) == false;
  		public test bool matchListHasDuplicateElement4() = hasDuplicateElement([1,1]) == true;
  		public test bool matchListHasDuplicateElement5() = hasDuplicateElement([1,2,3]) == false;
  		public test bool matchListHasDuplicateElement6() = hasDuplicateElement([1,2,3,1]) == true;
  		public test bool matchListHasDuplicateElement7() = hasDuplicateElement([1,2,3,2]) == true;
  		public test bool matchListHasDuplicateElement8() = hasDuplicateElement([1,2,3,3]) == true;
  //	}
  
  //	@Test public void matchListIsDuo1()  {
  		public test bool matchListIsDuo1() = isDuo1([]) == true;
  		public test bool matchListIsDuo2() = isDuo1([1]) == false;
  		public test bool matchListIsDuo3() = isDuo1([1,1]) == true;
  		public test bool matchListIsDuo4() = isDuo1([1,2]) == false;
  		public test bool matchListIsDuo5() = isDuo1([1,2, 1]) == false;
  		public test bool matchListIsDuo6() = isDuo1([1,2, 1,2]) == true;
  		public test bool matchListIsDuo7() = isDuo1([1,2,3, 1,2]) == false;
  		public test bool matchListIsDuo8() = isDuo1([1,2,3, 1,2, 3]) == true;
  //	}
  		
  //	@Test public void matchListIsDuo2()  {
  		public test bool matchListIsDuo9() = isDuo2([]) == true;
  		public test bool matchListIsDuo10() = isDuo2([1]) == false;
  		public test bool matchListIsDuo11() = isDuo2([1,1]) == true;
  		public test bool matchListIsDuo12() = isDuo2([1,2]) == false;
  		public test bool matchListIsDuo13() = isDuo2([1,2, 1]) == false;
  		public test bool matchListIsDuo14() = isDuo2([1,2, 1,2]) == true;
  		public test bool matchListIsDuo15() = isDuo2([1,2,3, 1,2]) == false;
  		public test bool matchListIsDuo16() = isDuo2([1,2,3, 1,2, 3]) == true;
  //	}
  	
  //	@Test public void matchListIsDuo3()  {
  		public test bool matchListIsDuo17() = isDuo3([]) == true;
  		public test bool matchListIsDuo18() = isDuo3([1]) == false;
  		public test bool matchListIsDuo19() = isDuo3([1,1]) == true;
  		public test bool matchListIsDuo20() = isDuo3([1,2]) == false;
  		public test bool matchListIsDuo21() = isDuo3([1,2, 1]) == false;
  		public test bool matchListIsDuo22() = isDuo3([1,2, 1,2]) == true;
  		public test bool matchListIsDuo23() = isDuo3([1,2,3, 1,2]) == false;
  		public test bool matchListIsDuo24() = isDuo3([1,2,3, 1,2, 3]) == true;
  //	}
  
  // @Test public void matchListIsTrio1()  {
  		// prepare("import ListMatchingTests;");
  		public test bool matchListIsTrio1() = isTrio1([]) == true;
  		public test bool matchListIsTrio2() = isTrio1([1]) == false;
  		public test bool matchListIsTrio3() = isTrio1([1,1]) == false;
  		public test bool matchListIsTrio4() = isTrio1([1,1,1]) == true;
  		public test bool matchListIsTrio5() = isTrio1([2,1,1]) == false;
  		public test bool matchListIsTrio6() = isTrio1([1,2,1]) == false;
  		public test bool matchListIsTrio7() = isTrio1([1,1,2]) == false;
  		public test bool matchListIsTrio8() = isTrio1([1,2, 1,2, 1,2]) == true;
  //	}
  	
  //	@Test public void matchListIsTrio2()  {
  //		prepare("import ListMatchingTests;");
  		public test bool matchListIsTrio9() = isTrio2([]) == true;
  		public test bool matchListIsTrio10() = isTrio2([1]) == false;
  		public test bool matchListIsTrio11() = isTrio2([1,1]) == false;
  		public test bool matchListIsTrio12() = isTrio2([1,1,1]) == true;
  		public test bool matchListIsTrio13() = isTrio2([2,1,1]) == false;
  		public test bool matchListIsTrio14() = isTrio2([1,2,1]) == false;
  		public test bool matchListIsTrio15() = isTrio2([1,1,2]) == false;
  		public test bool matchListIsTrio16() = isTrio2([1,2, 1,2, 1,2]) == true;
  //	}
  	
  // 	@Test public void matchListIsTrio3()  {
  //		prepare("import ListMatchingTests;");
  		public test bool matchListIsTrio17() = isTrio3([]) == true;
  		public test bool matchListIsTrio18() = isTrio3([1]) == false;
  		public test bool matchListIsTrio19() = isTrio3([1,1]) == false;
  		public test bool matchListIsTrio20() = isTrio3([1,1,1]) == true;
  		public test bool matchListIsTrio21() = isTrio3([2,1,1]) == false;
  		public test bool matchListIsTrio22() = isTrio3([1,2,1]) == false;
  		public test bool matchListIsTrio23() = isTrio3([1,1,2]) == false;
  		public test bool matchListIsTrio24() = isTrio3([1,2, 1,2, 1,2]) == true;
  // }
  
  // data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] S);
  // @Test public void matchList3()  {
  		public test bool matchList48() = [a(), b()] := [a(), b()];
  		public test bool matchList49() = ([DATA X1, b()] := [a(), b()]) && (X1 == a());
  
  		public test bool matchList50() = ([DATA X2, DATA Y, c()] !:= [a(), b()]);
  
  		public test bool matchList51() = ([e(int X3), b()] := [e(3), b()]) && (X3 == 3);
  		public test bool matchList52() = ([e(int X4)] := [e(3)]) && (X4 == 3);
  		public test bool matchList53() = ([e(int X5)] !:= [a()]);
  
  		public test bool matchList54() = ([a(), f([a(), b(), DATA X6])] := [a(), f([a(),b(),c()])]) && (X6 == c());
  
  		public test bool matchList55() = ([a(), f([a(), b(), DATA X7]), *DATA Y7] := [a(), f([a(),b(),c()]), b()]) && (X7 == c() && Y7 == [b()]);
  		public test bool matchList56() = ([DATA A1, f([A1, b(), DATA X8])] := [a(), f([a(),b(),c()])]) && (A1 == a());
  		public test bool matchList57() = ([A1, f([A1, b(), DATA X8])] := [a(), f([a(),b(),c()])]) && (A1 == a());
  		
  		public test bool matchList58() = ([f([DATA A1, b(), DATA X8]), A1] := [f([a(),b(),c()]), a()]) && (A1 == a());
  		public test bool matchList59() = ([f([A1, b(), DATA X8]), A1] := [f([a(),b(),c()]), a()]) && (A1 == a());
  
  		public test bool matchList60() = ([DATA A2, f([A2, b(), *DATA SX1]), SX1] := [a(), f([a(),b(),c()]), c()]) && (A2 == a()) && (SX1 ==[c()]);
  
  		public test bool matchList61() = ([DATA A3, f([A3, b(), *DATA SX2]), SX2] !:= [d(), f([a(),b(),c()]), a()]);
  		public test bool matchList62() = ([DATA A4, f([A4, b(), *DATA SX3]), SX3] !:= [c(), f([a(),b(),c()]), d()]);
  //	}
  	
  //	@Ignore @Test(expected=StaticError.class)
  //	public void recursiveDataTypeNoPossibleMatchVertical() {
  //		prepare("data Bool = and(Bool, Bool) | t();");
  //		runTestInSameEvaluator("t := and(t,t);");
  //	}
  data Bool = and(Bool, Bool) | t();
  data Prop = or(Prop, Prop) | f();
  	
  
  	
  //	@Ignore @Test(expected=StaticError.class)
  //	public void recursiveDataTypeNoPossibleHiddenRecursion() {
  //		prepare("data Prop = f;");
  //		prepareMore("data Bool = and(list[Prop], list[Prop]) | t();");
  //		runTestInSameEvaluator("{p = or(t,t); and(t,t) := p;}");
  //	}
  	
  
  	 
  //	public void matchListError1() {
  		public test bool matchListError2() {list[int] x = [1,2,3]; return [1, list[int] L, 2, list[int] M] !:= x;}
  //	}
  	
  //	public void matchListError11() {
  		public test bool matchListError3() = !([1, list[int] L, 2, list[int] L] := [1,2,3]);
  //	}
  	
  //	public void matchListError2() {
  		public test bool matchListError4() = !([1, list[str] L, 2] := [1,2,3]);
  //	}
  	
 
  	
  //	@Test public void matchListFalse3() {
  		public test bool matchListFalse1() { list[value] l = [1,2,3]; return [1, str S, 2] !:= l;}
  //	}
  	
  //	@Test(expected=StaticError.class)
  //	@Ignore("this is disabled because such type check would break the visiting code")
  //	public void matchListError3() {
  //		runTest("{ list[int] x = [1,2,3] ; [1, str S, 2] := x;}");
  //	}
  	
  	
  //	public void matchListError4() {
  		public test bool matchListError5()  {str S = "a"; return [1, S, 2] !:= [1,2,3];}
  //	}
  	
  //	@Test(expected=StaticError.class)
  //	@Ignore("this is disabled because such type check would break the visiting code")
  //	public void matchListError42() {
  //		runTest("{str S = "a"; list[int] x = [1,2,3]; [1, S, 2] := x;}");
  //	}
  	
  //	public void matchListError5() {
  		public test bool matchListError6() {list[str] S = ["a"]; return [1, S, 2] !:= [1,2,3];}
  //	}
  	
  //	@Test(expected=StaticError.class)
  //	@Ignore("this is disabled because such type check would break the visiting code")
  //	public void matchListError55() {
  //		runTest("{list[str] S = ["a"]; list[int] x = [1,2,3]; [1, S, 2] := x;}");
  //	}
  	
  	public test bool matchListExternalVar1() {
  		list[int] S; return [1, S, 2] !:= [1,2,3] && S != [3];
  	}
  
  
  //	@Test public void matchListSet() {
  
  		public test bool matchListSet1() = [a(), b()] := [a(), b()];
  		public test bool matchListSet2() = ([DATA X1, b()] := [a(), b()]) && (X1 == a());
  
  		public test bool matchListSet3() = ([DATA X2, DATA Y2, c()] !:= [a(), b()]);
  
  		public test bool matchListSet4() = ([e(int X3), b()] := [e(3), b()]) && (X3 == 3);
  		public test bool matchListSet5() = ([e(int X4)] := [e(3)]) && (X4 == 3);
  		public test bool matchListSet6() = ([e(int X5)] !:= [a()]);
  
  		public test bool matchListSet7() = ([a(), f({a(), b(), DATA X6})] := [a(), f({a(),b(),c()})]) && (X6 == c());
  		public test bool matchListSet8() = ({a(), f([a(), b(), DATA X7])} := {a(), f([a(),b(),c()])}) && (X7 == c());
  
  		public test bool matchListSet9() = ([a(), f({a(), b(), DATA X8}), *DATA Y8] := [a(), f({a(),b(),c()}), b()]) && (X8 == c() && Y8 == [b()]);
  		public test bool matchListSet10() = ({a(), f([a(), b(), DATA X9]), *DATA Y9} := {a(), f([a(),b(),c()]), b()}) && (X9 == c() && Y9 == {b()});
  
  		public test bool matchListSet11() = ([DATA A1, f({A1, b(), DATA X10})] := [a(), f({a(),b(),c()})]) && (A1 == a());
  		public test bool matchListSet12() = ({DATA A2, f([A2, b(), DATA X11])} := {a(), f([a(),b(),c()])}) && (A2 == a());
  
  //	}
  
  
  //	@Test  public void matchLiteral() {
  
  		public test bool matchListLiteral1() = true     := true;
  		public test bool matchListLiteral2() = !(true    := false);
  		public test bool matchListLiteral3() = true     !:= false;
  
  		public test bool matchListLiteral4() = 1        := 1;
  		public test bool matchListLiteral5() = !(2       := 1);
  		public test bool matchListLiteral6() = 2        !:= 1;
  
  		public test bool matchListLiteral7() = 1.5      := 1.5;
  		public test bool matchListLiteral8() = !(2.5     := 1.5);
  		public test bool matchListLiteral9() = 2.5      !:= 1.5;
  		
  		public test bool matchListLiteral10() = !(1.0     := 1.5);
  		public test bool matchListLiteral11() = 1.0      !:= 1.5;
  
  		public test bool matchListLiteral12()=  "abc"  := "abc";
  		public test bool matchListLiteral13() = "def" !:= "abc";
  		public test bool matchListLiteral14()=  "def" !:= "abc";
  //	}
  
  	
  
  //	@Test public void matchADT() {
  
  		public test bool matchADT1() = f(1)                   := f(1);
  		public test bool matchADT2() = f(1, g("abc"), true) := f(1, g("abc"), true);
  		public test bool matchADT3() = q(1) !:= f(1);
  		public test bool matchADT4() = f(1, 2)!:= f(1);
  		public test bool matchADT5() = f(1, 2)!:= f(1);	
  		public test bool matchADT6() = f(_):= f(1);
  		public test bool matchADT7() = f(_,_):= f(1,2);
  		public test bool matchADT8() = f(_,_,_):= f(1,2.5,true);
  //	}
  
  //	@Test public void matchADTWithKeywords() {
  		
  		public test bool matchADTwithKeywords1() = f1(1)                   := f1(1);
  		public test bool matchADTwithKeywords2() = f1(1, M=10)             := f1(1);
  		public test bool matchADTwithKeywords3() = f1(1, B=false, M=10)    := f1(1);
  		public test bool matchADTwithKeywords4() = f1(1, M=20)             := f1(1, B=false, M=20);
  		public test bool matchADTwithKeywords5() = f1(1, M=X)             := f1(1, B=false, M=20) && X == 20;
  //	}
  	
  //	@Test public void matchNode() {
  		
  		public test bool matchNode1() ="f"(1)                := "f"(1);
  		public test bool matchNode2() ="f"(1, "g"("abc"), true) := "f"(1, "g"("abc"), true);
  		public test bool matchNode3() = "g"(1)               !:= "f"(1);
  		public test bool matchNode4() = "g"(1)                !:= "f"(1);
  		public test bool matchNode5() = "f"(1, 2)            !:= "f"(1);
  		public test bool matchNode6() = "f"(1, 2)             !:= "f"(1);
  		
  		public test bool matchNode7() = "f"(_)                := "f"(1);
  		public test bool matchNode8() = "f"(_,_)              := "f"(1,2);
  		public test bool matchNode9() = "f"(_,_,_)            := "f"(1,2.5,true);
  		public test bool matchNode10() = "f"(1,_,3)            := "f"(1,2,3);
  		public test bool matchNode11() = "f"(_,2,_)            := "f"(1,2,3);
  //	}
  
  //	@Test public void matchNodeWithKeywords() {
  	
  	   public test bool matchNodeWithKeywords1() ="f1"(1)                := "f1"(1);
  		
  		public test bool matchNodeWithKeywords2() ="f1"(1)               !:= "f1"(2);
  		public test bool matchNodeWithKeywords3() ="f1"(1, M=10)          := "f1"(1, M=10);
  		public test bool matchNodeWithKeywords4() ="f1"(1)                := "f1"(1, M=10);
  		public test bool matchNodeWithKeywords5() ="f1"(1, M=10)         !:= "f1"(1, M=20);
  		public test bool matchNodeWithKeywords6() ="f1"(1, M=10)         !:= "f1"(1);
  		public test bool matchNodeWithKeywords7() ="f1"(1, M=10)         !:= "f1"(1, B=false);
  		
  		
  		public test bool matchNodeWithKeywords8() ="f1"(1, B=false, M=10) := "f1"(1, M=10, B=false);
  		public test bool matchNodeWithKeywords9() ="f1"(1, M=20, B=false) := "f1"(1, B=false, M=20);
  		public test bool matchNodeWithKeywords10() ="f1"(1, M=20)          := "f1"(1, B=false, M=20);
  		public test bool matchNodeWithKeywords11() ="f1"(1)                := "f1"(1, B=false, M=20);
  		public test bool matchNodeWithKeywords12() ="f1"(1, B=false, M=10) !:= "f1"(1, M=20, B=false);
  		public test bool matchNodeWithKeywords13() ="f1"(1, M=10, B=false)!:= "f1"(1, B=false, M=20);
  		public test bool matchNodeWithKeywords14() ="f1"(1, M=_, B=false)  := "f1"(1, B=false, M=20);
  		public test bool matchNodeWithKeywords15() ="f1"(_, M=20, B=false) := "f1"(1, B=false, M=20);
  		
  		public test bool matchNodeWithKeywords16() = "f1"(1, M=X) := "f1"(1, B=false, M=20) && X == 20;
  //	}
  	
  	
  	//@Ignore @Test(expected=StaticError.class)
  	//public void NoDataDecl(){
  	//	runTest("f(1) := 1;");
  	//}
  	
  	
  //	@Test public void matchSet1() {
  		
  		public test bool matchSet1() = {} := {};
  		public test bool matchSet2() = {1} := {1};
  		public test bool matchSet3() = {1, 2} := {1, 2};
  		
  		public test bool matchSet4() = {int _} := {1};
  		public test bool matchSet5() = {int _, int _} := {1, 2};
  		
  		public test bool matchSet6() = {_} := {1};
  		public test bool matchSet7() = {_, _} := {1, 2};
  		public test bool matchSet8() = !({_} := {1, 2});
  		public test bool matchSet9() = !({_, _} := {1});
  		
  		public test bool matchSet10() = !({_, _} := {1, 2, 3});
  
  		public test bool matchSet11() = !({_, _, _} := {1, 2});
  		 
  		public test bool matchSet12() = !({} := {1});
  		public test bool matchSet13() = !({1} := {2});
  		public test bool matchSet14() = !({1,2} := {1,3});
  
  		public test bool matchSet15() = {*int X} := {} && X == {};
  
  		public test bool matchSet16() =  {*int X} := {1} && X == {1};
  		public test bool matchSet17() = {*int X} := {1,2} && X == {1,2};
  		
  		public test bool matchSet18() = {*Y} := {1,2} && Y == {1,2};
  //TODO: Test related to + multivariables are commented out since they are not yet supported by
  //the Rascal syntax
  		
  //		public test bool assertTrue() = {Y+} := {1,2} && Y == {1,2};
  		
  		
  		public test bool matchSet19() = {*int _} := {1,2}; 
  		public test bool matchSet20() = {*_} := {1,2}; 
  //		public test bool matchSet() = {_+} := {1,2}; 
  		
  		public test bool matchSet21() = ({int N, 2, N} := {1,2}) && (N == 1);
  		
  		public test bool matchSet22() = !(({int N, 2, N} := {1,2,3}));
  		public bool assertFalse3() = ({int N, 2, N} := {1,2,"a"});
  		
  		public test bool matchSet23() {int N = 3; return {N, 2, 1} := {1,2,3};}
  		public test bool matchSet24() {set[int] S = {3}; return {S, 2, 1} := {1,2,3};}
  		public test bool matchSet25() {set[int] S = {2, 3}; return {S, 1} := {1,2,3};}
  
  		public test bool matchSet26() = {1, *int X, 2} := {1,2} && X == {};
  		public test bool matchSet27() = {1, *X, 2} := {1,2} && X == {};
  		public test bool matchSet28() = {1, *_, 2} := {1,2};
  //		public test bool matchSet() = !({ {1, X+, 2} := {1,2});
  //		public test bool matchSet() = !({ {1, _+, 2} := {1,2};}) _+ does not exist yet
  		public test bool matchSet29() = {1, *X, 2} := {1,2} && X == {};
  		public test bool matchSet30() = !({1, *X, 2} := {1,3});
  		public test bool matchSet31() = !({1, *_, 2} := {1,3});
  		
  		public test bool matchSet32() = {1, *int X, 2} := {1,2,3} && X == {3};
  		public test bool matchSet33() = {1, *X, 2} := {1,2,3} && X == {3};
  //		public test bool matchSet() = {1, X+, 2} := {1,2,3} && X == {3};
  		public test bool matchSet34() = {1, *_, 2} := {1,2,3};
  //		public test bool matchSet() = {1, _+, 2} := {1,2,3};
  		
  		public test bool matchSet35() = {1, *int X, 2} := {1,2,3,4} && X == {3,4};
  
  		public test bool matchSet36() = {*int X, *int Y} := {} && X == {} && Y == {};
  		public test bool matchSet37() = {1, *int X, *int Y} := {1} && X == {} && Y == {};
  		public test bool matchSet38() = {*int X, 1, *int Y} := {1} && X == {} && Y == {};
  		public test bool matchSet39() = {*int X, *int Y, 1} := {1} && X == {} && Y == {};
  
  		public test bool matchSet40() = !({*int X, *int Y, 1} := {2});
  		public test bool matchSet41() = !({*X, *Y, 1} := {2});
  		
  		public test bool matchSet42() = {*int X, *int Y} := {1} && ((X == {} && Y == {1}) || (X == {1} && Y == {}));
  		public test bool matchSet43() = {*X, *Y} := {1} && ((X == {} && Y == {1}) || (X == {1} && Y == {}));
  
  		public test bool matchSet44() = {*int X, *int Y, *int Z} := {} && X == {} && Y == {} && Z == {};
  		public test bool matchSet45() = {*X, *Y, *Z} := {} && X == {} && Y == {} && Z == {};
  		public test bool matchSet46() = {*int X, *int Y, *int Z} := {1} && (X == {1} && Y == {} && Z == {}) || (X == {} && Y == {1} && Z == {}) || (X == {} && Y == {} && Z == {1});
  		public test bool matchSet47() = {*X, *Y, *Z} := {1} && (X == {1} && Y == {} && Z == {}) || (X == {} && Y == {1} && Z == {}) || (X == {} && Y == {} && Z == {1});
  
  		public test bool matchSet48() = {int X, *int Y} := {1} && X == 1 && Y == {};
  		public test bool matchSet49() = {*int X, int Y} := {1} && X == {} && Y == 1;
  		public test bool matchSet50() = {*X, int Y} := {1} && X == {} && Y == 1;
  //		public test bool matchSet() = !({ {X+, int Y} := {1};})
  		public test bool matchSet51() = {*int _, int _} := {1}; 
  		public test bool matchSet52() = {*_, int _} := {1}; 
  		public test bool matchSet53() =  {*_, _} := {1}; 
  //		public test bool matchSet() = !({_+, _} := {1});
  
  		public test bool matchSet54() = {*int X, int Y} := {1, 2} && (X == {1} && Y == 2) || (X == {2} && Y == 1);
  		public test bool matchSet55() = {*X, int Y} := {1, 2} && (X == {1} && Y == 2) || (X == {2} && Y == 1);
  		
  		public test bool matchSet56() = {*int X, int Y} := {1, 2} && (X == {1} && Y == 2) || (X == {2} && Y == 1);
  		public test bool matchSet57() = {*int X, *real Y} := { 1, 5.5, 2, 6.5} && (X == {1,2} && Y == {5.5, 6.5});
  		public test bool matchSet58() = {*X, *Y} := { 1, 5.5, 2, 6.5} && (X == {1, 5.5, 2, 6.5} && Y == {});
  		
  		public test bool matchSet59() {set[int] x = {}; return {} := x;} 
  		
  //	}	
  
  //	@Test public void matchSet2() {
  
  		// prepare("data DATA = a() | b() | c() | d() | e(int N) | s(set[DATA] S) | g(int N) | h(int N);");
  
  		public test bool matchSet60() = {a(), b()} := {a(), b()};
  		public test bool matchSet61() = ({DATA X1, b()} := {a(), b()}) && (X1 == a());
  
  		public test bool matchSet62() = {DATA X2, DATA Y2, c()} !:= {a(), b()};
  
  		public test bool matchSet63() = ({e(int X3), b()} := {e(3), b()}) && (X3 == 3);
  		public test bool matchSet64() = ({e(int X4)} := {e(3)}) && (X4 == 3);
  		public test bool matchSet65() = ({e(int X5)} !:= {a()});
  		
  		public test bool matchSet66() = ({e(int X3), g(X3)} := {e(3), g(3)}) && (X3 == 3);
  		public test bool matchSet67() = ({e(X3), g(X3), h(X3)} := {e(3), h(3), g(3)}) && (X3 == 3);
  
  		public test bool matchSet68() = ({a(), s({a(), b(), DATA X6})} := {a(), s({a(),b(),c()})}) && (X6 == c());
  		public test bool matchSet69() = ({s({a(), b(), DATA X7}), a()} := {a(), s({a(),b(),c()})}) && (X7 == c());
  
  		public test bool matchSet70() = ({a(), s({a(), b(), DATA X8}), *DATA Y8} := {a(), b(), s({a(),b(),c()})}) && (X8 == c() && Y8 == {b()});
  		public test bool matchSet71() = ({DATA A1, s({A1, b(), DATA X9})} := {a(), s({a(),b(),c()})}) && (A1 == a());
  		public test bool matchSet72() = ({DATA A2, s({A2, b(), DATA X10})} := {s({a(),b(),c()}), a()}) && (A2 == a());
  
  		public test bool matchSet73() = ({DATA A3, s({A3, b(), *DATA SX1}), *SX1} := {a(), s({a(),b(),c()}), c()}) && (A3== a()) && (SX1 =={c()});
  		public test bool matchSet74() = ({DATA A4, s({A4, b(), *DATA SX2}), *SX2} := {s({a(),b(),c()}), a(), c()}) && (A4== a()) && (SX2 =={c()});
  		public test bool matchSet75() = ({DATA A5, s({A5, b(), *DATA SX3}), *SX3} := {c(), s({a(),b(),c()}), a()}) && (A5 == a()) && (SX3 =={c()});
  
  		public test bool matchSet76() = ({DATA A6, s({A6, b(), *DATA SX4}), *SX4} !:= {d(), s({a(),b(),c()}), a()});
  		public test bool matchSet77() = ({DATA A7, s({A7, b(), *DATA SX5}), *SX5} !:= {c(), s({a(),b(),c()}), d()});
  		
  		public test bool matchSet78() = ({DATA A8, s({A8, b()})} := {s({a(),b()}), a()}) && (A8 == a());
  		public test bool matchSet79() = ({s({DATA A9, b()}), A9} := {s({a(),b()}), a()});
  		public test bool matchSet80() = ({s({DATA A9, b()}), A9} := {s({a(),b()}), a()}) && (A9 == a());
  		public test bool matchSet81() = ({s({DATA A10, b(), *DATA SX6}), A10, SX6} := {c(), s({a(),b(),c()}), a()}) && (A10 == a()) && (SX6 =={c()});
  //	}
  	
  //	@Test public void matchListSetVariableScopes(){
  		
  		
  		public test bool matchListSetVariableScopes1() = {PAIR D, pair(D, b1())} := {pair(a1(),b1()), a1()} && D == a1();
  		public test bool matchListSetVariableScopes2() = {PAIR D, pair(D, b1())} !:= {pair(a1(),b1()), c1()};
  		
  		public test bool matchListSetVariableScopes3() = {pair(PAIR D, b1()), D} := {pair(a1(),b1()), a1()} && D == a1();
  		public test bool matchListSetVariableScopes4() = {pair(PAIR D, b1()), D} !:= {pair(a1(),b1()), c1()};
  		
  		public test bool matchListSetVariableScopes5() = {pair(s1(set[PAIR] S1), c1()), S1} :=  {pair(s1({a1(), b1()}), c1()), a1(), b1()} && S1 == {a1(), b1()};
  		public test bool matchListSetVariableScopes6() = {pair(s1(set[PAIR] S1), c1()), S1} !:= {pair(s1({a1(), b1()}), c1()), a1(), d1()};
  		
  		public test bool matchListSetVariableScopes7() {list[PAIR] L1 = [a1(), b1()]; return [L1, c1()] := [a1(), b1(), c1()];}
  		public test bool matchListSetVariableScopes8() {list[PAIR] L1 = [a1(), b1()]; return [L1, c1()] !:= [a1(), d1(), c1()];}
  		
  		public test bool matchListSetVariableScopes9() = [pair(l1(list[PAIR] L1), c1()), L1] := [pair(l1([a1(), b1()]), c1()), a1(), b1()];
  		public test bool matchListSetVariableScopes10() = [pair(l1(list[PAIR] L1), c1()), L1] !:= [pair(l1([a1(), b1()]), c1()), a1(), d1()];
  		
  		public test bool matchListSetVariableScopes11() = [pair(PAIR L1, b1()), L1] := [pair(a1(), b1()), a1()];
  		public test bool matchListSetVariableScopes12() = [pair(PAIR L1, b1()), L1] !:= [pair(a1(), b1()), d1()];
  // }
  
  //	@Ignore @Test
  //	public void matchConstructor1(){
  //		prepare("data Bool = btrue() | bfalse() | band(Bool left, Bool right) | bor(Bool left, Bool right);");
  //
  //		public test bool assertTrue() = Bool::btrue b := btrue;
  //		public test bool assertTrue() = btrue := btrue();
  //		public test bool assertTrue() = Bool::band b := band(btrue, bfalse);
  //		public test bool assertTrue() = band := band(btrue, bfalse);
  //	}
  //	
  //	@Ignore @Test
  //	public void matchConstructor2(){
  //	
  //		prepareModule("Bool", "module Bool " +
  //				  "data Bool = btrue | bfalse | band(Bool left, Bool right) | bor(Bool left, Bool right);");
  //
  //		public test bool assertTrue() = import Bool;
  //		public test bool assertTrue() = btrue := btrue;
  //		public test bool assertTrue() = Bool::band := band(btrue, bfalse);
  //	}
  
  
  
  //	@Test	
  //	public void matchSetExternalVar() {
  		public test bool matchSetExternalVar1() {set[int] S; return ({1, *S, 2} := {1,2,3} && S == {3});}
  //	}
  
  
  
  //	@Test public void matchTuple() {
  
  		public test bool matchTuple1() = <1> := <1>;
  		public test bool matchTuple2() = <1, "abc">  := <1, "abc">;
  		public test bool matchTuple3() = !(<2>  := <1>);
  		public test bool matchTuple4() = <2> !:= <1>;
  		
  		public test bool matchTuple5() = <1, "abc"> !:= <1, "def">;
  		public test bool matchTuple6() = <1, "abc"> !:= <1, "def">;
  		
  		public test bool matchTuple7() = <_, "abc">  := <1, "abc">;
  		public test bool matchTuple8() = <1, _>        := <1, "abc">;
  		public test bool matchTuple9() = <_, _>        := <1, "abc">;
  //	}
  	
  //	@Test public void matchTupleExternalVar(){
  		public test bool matchTupleExternalVar1() {tuple[int,int] T; return T := <1,2> && T[0] == 1 && T[1] == 2;}
  //	}
  
  //	@Test public void matchVariable() {
  		public test bool matchVariable1() = (n1 := 1) && (n1 == 1);
  		public test bool matchVariable2() {int n2 = 1;return  (n2 := 1) && (n2 == 1);}
  		public test bool matchVariable3()  {int n3 = 1; return (n3 !:= 2) && (n3 == 1);}
  
  		public test bool matchVariable4() = (f(n5) := f(1)) && (n5 == 1);
  		public test bool matchVariable5() {int n6 = 1; return (f(n6) := f(1)) && (n6 == 1);}
  		
  		public test bool matchVariable6() = f(_) := f(1);
  //	}
  	
  //	@Test  public void matchTypedVariableBecomes() {
  		public test bool matchTypedVariableBecomes1() = int N : 3 := 3 && N == 3;
  		public test bool matchTypedVariableBecomes2() = list[int] L1 : [int N, *int L2, int M] := [1,2,3] && L1 == [1,2,3] && N == 1 && L2 == [2] && M == 3;
  		public test bool matchTypedVariableBecomes3() = [1, list[int] L: [int N], 2] := [1,[2],2] && L == [2];
  		public test bool matchTypedVariableBecomes4() = [1, list[int] L1: [*int L2, int N], 5] := [1,[2,3,4],5] && L1 == [2,3,4] && L2==[2,3] && N ==4;
  		public test bool matchTypedVariableBecomes5() = [1, list[int] L1: [*int L2, int N], L1] := [1,[2,3,4],[2,3,4]] && L1 == [2,3,4] && L2==[2,3] && N ==4;
  //	}
  	
  // @expected{UndefinedType} Doesn't work
  //	public void typedVariableBecomesWrongType(){
  //		public test bool assertTrue() {str N : 3 := 3; return false;}
  //	}
  	
  //	@Test
  //	public void redeclaredTypedVariableBecomesShadowsAnother(){
  		public test bool redeclaredTypedVariableBecomesShadowsAnother1() {int N = 5; return int N : 3 := 3 && N == 3;}
  //	}
  	
  	//@Ignore("we can't find this bug anymore due to pattern dispatch") @Test(expected=StaticError.class)
  	//public void doubleTypedVariableBecomes(){
  	//	public test bool assertTrue() {{[int N : 3, int N : 4] := [3,4] && N == 3;}}
  	//}
  	
  //	@Test public void matchVariableBecomes() {
  		public test bool matchVariableBecomes1() = N : 3 := 3 && N == 3;
  		public test bool matchVariableBecomes2() = L1 : [int N, *int L2, int M] := [1,2,3] && L1 == [1,2,3] && N == 1 && L2 == [2] && M == 3;
  		public test bool matchVariableBecomes3() = [1, L: [int N], 2] := [1,[2],2] && L == [2];
  		public test bool matchVariableBecomes4() = [1, L1: [*int L2, int N], 5] := [1,[2,3,4],5] && L1 == [2,3,4] && L2==[2,3] && N ==4;
  		public test bool matchVariableBecomes5() = [1, L1: [*int L2, int N], L1] := [1,[2,3,4],[2,3,4]] && L1 == [2,3,4] && L2==[2,3] && N ==4;
  //	}
  
  //	public void variableBecomesEquality(){
          
  		public test bool matchVariableBecomesEquality1() {int N = 5; return N : 3 !:= 3 && N != 3;}
  		public test bool matchVariableBecomesEquality2() {int N = 3; return N : 3 := 3 && N == 3;}
  //	}
  	
  	public void doubleVariableBecomes1(){
  		public test bool doubleVariableBecomes2() = !(([N : 3, N : 4] := [3,4]) && N == 3);
  		public test bool doubleVariableBecomes3() = [N : 3, N : 3] := [3,3] && N == 3;
  	}
  
  	
  	
  //	@Test public void antiPattern(){
  		public test bool antiPattern1() = !4 := 3;
  		public test bool antiPattern2() = (!(!3 := 3));	
  		public test bool antiPattern3() = ![1,2,3] := [1,2,4];
  		public test bool antiPattern4() = !(![1,2,3] := [1,2,3]);
  //	}
  	
 
  	
  //	@Test  public void descendant1(){
  		public test bool descendant1() = /int N := 1 && N == 1;
  		public test bool descendant2() =  !/int N := true;
  		
  		public test bool descendant3() = !(/int N := []);
  		public test bool descendant4() = /int N := [1] && N == 1;
  
  		public test bool descendant5() = /int N := [1,2,3,2] && N > 2;
  		public test bool descendant6() = !/4 := [1,2,3,2];
  		public test bool descendant7() = /int N := (1 : 10) && (N == 1 || N == 10);
  	
  		public test bool descendant8() = !(/int N := {});
  		public test bool descendant9() = /int N := {1} && N == 1;
  		public test bool descendant10() = /int N := {<false,1>} && N == 1;
  		
  		public test bool descendant11() = /int N := ("a" : 1) && N == 1;
  		public test bool descendant12() = /int N := <"a", 1> && N == 1;
  		
  		public test bool descendant13() = [1, /int N, 3] := [1, [1,2,3,2], 3] && N == 1;
  		public test bool descendant14() = [1, /int N, 3] := [1, [1,2,3,2], 3] && N == 2;	
  //	}
  	
  //	@Test public void descendant2
  // prepare("data F = f(F left, F right) | g(int N);");
  		public test bool descendant15() = /g(2) := f(g(1),f(g(2),g(3)));
  		public test bool descendant16() = [1, /g(2), 3] := [1, f(g(1),f(g(2),g(3))), 3];
  		public test bool descendant17() = [1, !/g(5), 3] := [1, f(g(1),f(g(2),g(3))), 3];
  		
  		public test bool descendant18() = [1, /f(/g(2), _), 3] := [1, f(g(1),f(g(2),g(3))), 3];
  		public test bool descendant19() = [1, /f(/g(2),/g(3)), 3] := [1, f(g(1),f(g(2),g(3))), 3];
  		// Goes wrong Bert Lisser
  		// public test bool descendant() = [1, F outer: /f(/F inner: g(2), _), 3] := [1, f(g(1),f(g(2),g(3))), 3] && outer == f(g(1),f(g(2),g(3))) && inner == g(2);
  			
  		public test bool descendant20() = [1, /g(int N1), 3] := [1, f(g(1),f(g(2),g(3))), 3] && N1 == 1;
  		public test bool descendant21() = [1, /g(int N2), 3] := [1, f(g(1),f(g(2),g(3))), 3] && N2 == 2;
  		public test bool descendant22() = [1, /g(int N3), 3] := [1, f(g(1),f(g(2),g(3))), 3] && N3 == 3;
  //	}
  	
  //	@Test public void descendant3(){
  		public test bool descendant23() = [n | /int n <- [1,2,3]] == [1,2,3];
  		public test bool descendant24() = [b | /bool b <- [true,false,true]] == [true,false,true];
  		public test bool descendant25() = [s | /str s <- ["a","b"]] == ["a","b"];
  		
  		public test bool descendant26() = {n | /int n <- {1,2,3}} == {1,2,3};
  		public test bool descendant27() = {n | /int n <- {<1,2,3>}} == {1,2,3};
  		public test bool descendant28() = {v | /value v <- {<1,"b",true>}} == {1,"b",true, <1,"b",true>};
  //	}
  	
  	//
  	// The following test requires deeper analysis of the data signature
  	///
  	//@Ignore @Test(expected=StaticError.class)
  	//public void descendantWrongType(){
  	//	prepare("data F = f(F left, F right) | g(int N);");
  	//	public test bool assertTrue() = /true := f(g(1),f(g(2),g(3)));
  	//}
  	
  //@Test public void listCount1(){
  //		String cnt = 
  //		      "int cnt(list[int] L){" +
  //		      "  int count = 0;" +
  //		      "  while ([int N, *int Ns] := L) { " +
  //		      "         count = count + 1;" +
  //		      "         L = tail(L);" +
  //		      "  }" +
  //		      "  return count;" +
  //		      "}";
  //	
  //		prepare("import List;");
  //		assertTrue(runTestInSameEvaluator("{" + cnt + "cnt([1,2,3]) == 3;}"));
  //	}
  	
  	//@Test
  	//public void listCount2(){
  	//	String cnt = 
  	//	      "int cnt(list[int] L){" +
  	//	      "  int count = 0;" +
  	//	      "  while ([int N, *int _] := L) { " +
  	//	      "         count = count + 1;" +
  	//	      "         L = tail(L);" +
  	//	      "  }" +
  	//	      "  return count;" +
  	//	      "}";
  	//
  	//	prepare("import List;");
  	//	assertTrue(runTestInSameEvaluator("{" + cnt + "cnt([1,2,3]) == 3;}"));
  	//}
  	
  	//@Test
  	//public void listCount3(){
  	//	String cnt = 
  	//	      "int cnt(list[int] L){" +
  	//	      "  int count = 0;" +
  	//	      "  while ([N, *int _] := L) { " +
  	//	      "         count = count + 1;" +
  	//	      "         L = tail(L);" +
  	//	      "  }" +
  	//	      "  return count;" +
  	//	      "}";
  	//
  	//	prepare("import List;");
  	//	assertTrue(runTestInSameEvaluator("{" + cnt + "cnt([1,2,3]) == 3;}"));
  	//}
  	
  	public test bool setCount11(){
  		      int cnt(set[int] S){ 
  		        int count = 0; 
  		        while ({int N, *int Ns} := S) {  
  		               count = count + 1; 
  		               S = S - {N}; 
  		        } 
  		        return count;
  		      };
  	 return cnt({1,2,3}) == 3;
  	 }
  
  public test bool setCount21(){
  		      int cnt(set[int] S){ 
  		        int count = 0; 
  		        while ({int N, *int _} := S) {  
  		               count = count + 1; 
  		               S = S - {N}; 
  		        } 
  		        return count; 
  		      };
  	return cnt({1,2,3}) == 3;
  	}
  	
  	//@Test
  	//public void setCount3(){
  	//	String cnt = 
  	//	      int cnt(set[int] S){ +
  	//	        int count = 0; +
  	//	        while ({N, *int _} := S) {  +
  	//	               count = count + 1; +
  	//	               S = S - {N}; +
  	//	        } +
  	//	        return count; +
  	//	      };
  	//
  	//	assertTrue(runTestInSameEvaluator({ + cnt + cnt({1,2,3}) == 3;}
  	//}
  	
  	//@Test public void nodeMatchBacktracking() {
  	//	prepare("import List;");
  	//	runTestInSameEvaluator("{ x = for("f"({int a, int b, *set[int] c}) := "f"({1,2,3,4})) append <a,b>; size(x) == 12;}"); 
  	//}
  	//
  	//@Test
  	//public void tupleMatchBacktracking() {
  	//	prepare("import List;");
  	//	runTestInSameEvaluator("{ x = for(<{int a, int b, *set[int] c}> := <{1,2,3,4}>) append <a,b>; size(x) == 12;}"); 
  	//}
  	
  	 public test bool switchListOnValue1() {
  	      value yy = []; switch(yy) { case [] : return true; default: return false; }
  	}
  	
  	public test bool switchSetOnValue1() {
  		value yy = {}; switch(yy) { case {} : return true; default: return false; }
  	}
  data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] L) | f(set[DATA] S)| s(set[DATA] S)|g(int N)|h(int N)|
         f(DATA left, DATA right);
  data F = f(int N) | f(int N, int M) | f(int N, value f, bool B) | g(str S);
  data F1 = f1(int N, int M = 10, bool B = false) | f1(str S);
  data PAIR = a1() | b1() | c1() | d1() | pair(PAIR q1, PAIR q2) | s1(set[PAIR] S) | l1(list[PAIR] L);
  data Bool = btrue() | bfalse() | band(Bool left, Bool right) | bor(Bool left, Bool right);
  
  public bool hasOrderedElement(list[int] L)
  {
     switch(L){
     
     case [*int L1, int I, *int L2, int J, *int L3]: {
          if(I > J){
          	return true;
          } else {
          	fail;
          }
          }
     }
     return false;
  }
  
  
  public bool hasDuplicateElement(list[int] L)
  {
  	switch(L){
  	
  	case [*int L1, int I, *int L2, int J, *int L3]:
  		if(I == J){
  			return true;
  		} else {
  			fail;
  		}
  	default:
  		return false;
      }
  }
  
  public bool isDuo1(list[int] L)
  {
  	switch(L){
  	case [*int L1, *int L2]:
  		if(L1 == L2){
  			return true;
  		} else {
  			fail;
  		}
  	default:
  		return false;
      }
  }
  
  public bool isDuo2(list[int] L)
  {
  	switch(L){
  	case [*int L1, L1]:
  			return true;
  	default:
  		return false;
      }
  }
  
  public bool isDuo3(list[int] L)
  {
      return [*int L1, L1] := L;
  }
  
  public bool isTrio1(list[int] L)
  {
  	switch(L){
  	case [*int L1, *int L2, *int L3]:
  		if((L1 == L2) && (L2 == L3)){
  			return true;
  		} else {
  			fail;
  		}
  	default:
  		return false;
      }
  }
  
  public bool isTrio2(list[int] L)
  {
  	switch(L){
  	case [*int L1, L1, L1]:
  		return true;
  	default:
  		return false;
      }
  }
  
  public bool isTrio3(list[int] L)
  {
      return [*int L1, L1, L1] := L;
  }
  
  public bool isNestedDuo(list[int] L)
  {
      return [[*int L1, L1], [L1, L1]] := L;
  }
  
 