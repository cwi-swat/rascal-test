module tests::functionality::PatternTests


@expected{UnexpectedType}
	public test bool cannotMatchListStr(){
		return [1] := "a";
	}
	
	
// @Test public void matchList1() {
		
		public test bool assertTrue() = !([] := [2]);
		public test bool assertTrue() = !([1] := []);

		public test bool assertTrue() = [] := [];
		public test bool assertTrue() = [1] := [1];
		public test bool assertTrue() = [1,2] := [1,2];
		
		public test bool assertTrue() = !([1] := [2]);
		public test bool assertTrue() = !([1,2] := [1,2,3]);

		public test bool assertTrue() = ([int N] := [1]) && (N == 1);
		public test bool assertTrue() = [ _ ] := [1];
		
		public test bool assertTrue() = ([int N, 2, int M] := [1,2,3]) && (N == 1) && (M==3);
		public test bool assertTrue() = [ _, 2, _] := [1,2,3];
		
		public test bool assertTrue() = ([int N, 2, N] := [1,2,1]) && (N == 1);
		
		public test bool assertTrue() = !(([int N, 2, N] := [1,2,3]));
		public test bool assertTrue() = !([int N, 2, N] := [1,2,"a"]);
		
		public test bool assertTrue() {int N = 1; return ([N, 2, int M] := [1,2,3]) && (N == 1) && (M==3);}
		public test bool assertTrue() {int N = 1; return !([N, 2, int M] := [4,2,3]);}
		
		public test bool assertTrue() {list[int] L = [3]; return [1,2,L] := [1,2,3];}
		public test bool assertTrue() {list[int] L = [2, 3]; return [1, L] := [1,2,3];}

		public test bool assertTrue() = [1, [2, 3], 4] := [1, [2, 3], 4];
		public test bool assertTrue() = !([1, [2, 3], 4] := [1, [2, 3, 4], 4]);
		
		public test bool assertTrue() = ([list[int] L] := [[]]) && (L == []);
		public test bool assertTrue() = ([1, list[int] L] := [1, [2]]) && (L == [2]);
		public test bool assertTrue() = ([1, list[int] L, 10] := [1,[],10]) && (L == []);
		public test bool assertTrue() = ([1, list[int] L, 10] := [1,[2],10]) && (L == [2]);
		public test bool assertTrue() = ([*list[int] L] := []) && (L == []);
		public test bool assertTrue() { list[int] X = []; return ([*int L] := X) && (L == []);} 
		public test bool assertTrue() = ([*int L] := ([1] - [1])) && (L == []);
		public test bool assertTrue() = ([*int L] := [1]) && (L == [1]);
		public test bool assertTrue() = ([*int L] := [1,2]) && (L == [1,2]);

		public test bool assertTrue() = ([1, *int L] := [1]) && (L == []);
		public test bool assertTrue() = ([1, *int L] := [1, 2]) && (L == [2]);
		public test bool assertTrue() = ([1, *int L] := [1, 2, 3]) && (L == [2, 3]);

		public test bool assertTrue() = ([*int L, 10] := [10]) && (L == []);
		public test bool assertTrue() = ([*int L, 10] := [1,10]) && (L == [1]);
		public test bool assertTrue() = ([*int L, 10] := [1,2,10]) && (L == [1,2]);

		public test bool assertTrue() = ([1, *int L, 10] := [1,10]) && (L == []);
		public test bool assertTrue() = ([1, *int L, 10] := [1,2,10]) && (L == [2]);
		public test bool assertTrue() = ([1, *int L, 10, *int M, 20] := [1,10,20]) && (L == []) && (M == []);
		public test bool assertTrue() = ([1, *int L, 10, *int M, 20] := [1,2,10,20]) && (L == [2]) && (M == []);
		public test bool assertTrue() = ([1, *int L, 10, *int M, 20] := [1,2,10,3,20]) && (L == [2]) && (M==[3]);
		public test bool assertTrue() = ([1, *int L, 10, *int M, 20] := [1,2,3,10,4,5,20]) && (L == [2,3]) && (M==[4,5]);
		
		public test bool assertTrue() = ([1, *int L, 10, L, 20] := [1,2,3,10,2,3,20]) && (L == [2,3]);
		public test bool assertTrue() = !(([1,*int L, 10, L, 20] := [1,2,3,10,2,4,20]));
		
		public test bool assertTrue() = [*int _] := [];
		public test bool assertTrue() = [*int _] := [1];
		public test bool assertTrue() = [*int _] := [1,2];
		public test bool assertTrue() = ([1, *int _, 10, *int _, 20] := [1,2,10,20]);
		
		
		
	//	public test bool assertTrue() {([1, list[int] L, [10, list[int] M, 100], list[int] N, 1000] := [1, [10,100],1000]);}
	// }

//	@Test public void matchNestedList(){
		public test bool assertTrue() = !([] := [[2]]);
		public test bool assertTrue() = !([[1]] := []);

		public test bool assertTrue() = [] := [];
		public test bool assertTrue() = [[1]] := [[1]];
		public test bool assertTrue() = [[1,2]] := [[1,2]];
		
		public test bool assertTrue() = !([[1]] := [[2]]);
		public test bool assertTrue() = !([[1,2]] := [[1,2,3]]);
		
		public test bool assertTrue() = [*list[int] L] := [];
		
		public test bool assertTrue() = [*list[int] L] := [[1]];
		public test bool assertTrue() = [*list[int] L] := [[1,2]];
		
		public test bool assertTrue() = ([[1], *list[int] L, [6,7,8]] := [[1],[2,3],[4,5],[6,7,8]]) && (L == [[2,3],[4,5]]);
		public test bool assertTrue() = !(([[1], *list[int] L, [6,7,8]] := [[1],[2,3],[4,5],[8]]) && (L == [[2,3],[4,5]]));
		
		public test bool assertTrue() = ([[1], *list[int] L, [6,7,8], L] := [[1],[2,3],[4,5],[6,7,8],[2,3],[4,5]]) && (L == [[2,3],[4,5]]);
//	}
	
//	@Test public void matchNestedSet(){
		public test bool assertTrue() = !({} := {{2}});
		public test bool assertTrue() = !({{1}} := {});

		public test bool assertTrue() = {} := {};
		public test bool assertTrue() = {{1}} := {{1}};
		public test bool assertTrue() = {{1,2}} := {{1,2}};
		
		public test bool assertTrue() = !({{1}} := {{2}});
		public test bool assertTrue() = !({{1,2}} := {{1,2,3}});
		
		public test bool assertTrue() = {*set[int] L} := {};
		
		public test bool assertTrue() = {*set[int] L} := {{1}};
		public test bool assertTrue() = {*set[int] L} := {{1,2}};
		
		public test bool assertTrue() = ({{1}, *set[int] L, {6,7,8}} := {{1},{2,3},{4,5},{6,7,8}}) && (L == {{2,3},{4,5}});
		public test bool assertTrue() = !(({{1}, *set[int] L, {6,7,8}} := {{1},{2,3},{4,5},{8}}) && (L == {{2,3},{4,5}}));
		
		public test bool assertTrue() = ({{1}, *set[int] L, {6,7,8}, L} := {{1},{2,3},{4,5},{6,7,8},{2,3},{4,5}}) && (L == {{2,3},{4,5}});
//	}
	
//	@Test public void matchExternalListVars(){
		public test bool assertTrue() {int n;  return n := 3 && n == 3; }
		public test bool assertTrue() {list[int] L; return ([1, L, 4, 5] := [1, 2, 3, 4, 5] && L == [2, 3]);}
//	}
	
//	@Test public void matchListMultiVars(){
		public test bool assertTrue() = [1, L*, 4, 5] := [1, 2, 3, 4, 5] && L == [2, 3];
		public test bool assertTrue() = [1, _*, 4, 5] := [1, 2, 3, 4, 5];
		public test bool assertTrue() = [1, L*, 4, L, 5] := [1, 2, 3, 4, 2, 3, 5] && L == [2, 3];
//	}
	
//	@Test public void matchListSpliceVars(){
		public test bool assertTrue() = [1, *L, 4, 5] := [1, 2, 3, 4, 5] && L == [2, 3];
		public test bool assertTrue() = [1, * int L, 4, 5] := [1, 2, 3, 4, 5] && L == [2, 3];
		public test bool assertTrue() = [1, *_, 4, 5] := [1, 2, 3, 4, 5];
		public test bool assertTrue() = [1, * int _, 4, 5] := [1, 2, 3, 4, 5];
		public test bool assertTrue() = [1, *L, 4, *L, 5] := [1, 2, 3, 4, 2, 3, 5] && L == [2, 3];
		public test bool assertTrue() = [1, * int L, 4, *L, 5] := [1, 2, 3, 4, 2, 3, 5] && L == [2, 3];
//	}
	
//	@Test public void matchSetMultiVars(){
		public test bool assertTrue() = {1, S*, 4, 5}:= {1, 2, 3, 4, 5} && S == {2, 3};
		public test bool assertTrue() = {1, _*, 4, 5} := {1, 2, 3, 4, 5};
//	}
	
//	@Test public void matchSetSpliceVars(){
		public test bool assertTrue() = {1, *S, 4, 5}:= {1, 2, 3, 4, 5} && S == {2, 3};
		public test bool assertTrue() = {1, * int S, 4, 5}:= {1, 2, 3, 4, 5} && S == {2, 3};
		public test bool assertTrue() = {1, *_, 4, 5} := {1, 2, 3, 4, 5};
		public test bool assertTrue() = {1, * int _, 4, 5} := {1, 2, 3, 4, 5};
//	}

	@expected{UndeclaredVariable}
	public test bool  unguardedMatchNoEscape() {
		// m should not be declared after the unguarded pattern match.
		int n = 3; int m := n; return m == n; 
	}
	
//	@Test public void matchListHasOrderedElement()  {	
		public test bool assertTrue() = hasOrderedElement([]) == false;
		public test bool assertTrue() = hasOrderedElement([1]) == false;
		public test bool assertTrue() = hasOrderedElement([1,2]) == false;
		public test bool assertTrue() = hasOrderedElement([1,2,1]) == true;
		public test bool assertTrue() = hasOrderedElement([1,2,3,4,3,2,1]) == true;
//}
	
//	@Test public void matchListHasDuplicateElement()  {
		public test bool assertTrue() = hasDuplicateElement([]) == false;
		public test bool assertTrue() = hasDuplicateElement([1]) == false;
		public test bool assertTrue() = hasDuplicateElement([1,2]) == false;
		public test bool assertTrue() = hasDuplicateElement([1,1]) == true;
		public test bool assertTrue() = hasDuplicateElement([1,2,3]) == false;
		public test bool assertTrue() = hasDuplicateElement([1,2,3,1]) == true;
		public test bool assertTrue() = hasDuplicateElement([1,2,3,2]) == true;
		public test bool assertTrue() = hasDuplicateElement([1,2,3,3]) == true;
//	}

//	@Test public void matchListIsDuo1()  {
		public test bool assertTrue() = isDuo1([]) == true;
		public test bool assertTrue() = isDuo1([1]) == false;
		public test bool assertTrue() = isDuo1([1,1]) == true;
		public test bool assertTrue() = isDuo1([1,2]) == false;
		public test bool assertTrue() = isDuo1([1,2, 1]) == false;
		public test bool assertTrue() = isDuo1([1,2, 1,2]) == true;
		public test bool assertTrue() = isDuo1([1,2,3, 1,2]) == false;
		public test bool assertTrue() = isDuo1([1,2,3, 1,2, 3]) == true;
//	}
		
//	@Test public void matchListIsDuo2()  {
		public test bool assertTrue() = isDuo2([]) == true;
		public test bool assertTrue() = isDuo2([1]) == false;
		public test bool assertTrue() = isDuo2([1,1]) == true;
		public test bool assertTrue() = isDuo2([1,2]) == false;
		public test bool assertTrue() = isDuo2([1,2, 1]) == false;
		public test bool assertTrue() = isDuo2([1,2, 1,2]) == true;
		public test bool assertTrue() = isDuo2([1,2,3, 1,2]) == false;
		public test bool assertTrue() = isDuo2([1,2,3, 1,2, 3]) == true;
//	}
	
//	@Test public void matchListIsDuo3()  {
		public test bool assertTrue() = isDuo3([]) == true;
		public test bool assertTrue() = isDuo3([1]) == false;
		public test bool assertTrue() = isDuo3([1,1]) == true;
		public test bool assertTrue() = isDuo3([1,2]) == false;
		public test bool assertTrue() = isDuo3([1,2, 1]) == false;
		public test bool assertTrue() = isDuo3([1,2, 1,2]) == true;
		public test bool assertTrue() = isDuo3([1,2,3, 1,2]) == false;
		public test bool assertTrue() = isDuo3([1,2,3, 1,2, 3]) == true;
//	}

// @Test public void matchListIsTrio1()  {
		// prepare("import ListMatchingTests;");
		public test bool assertTrue() = isTrio1([]) == true;
		public test bool assertTrue() = isTrio1([1]) == false;
		public test bool assertTrue() = isTrio1([1,1]) == false;
		public test bool assertTrue() = isTrio1([1,1,1]) == true;
		public test bool assertTrue() = isTrio1([2,1,1]) == false;
		public test bool assertTrue() = isTrio1([1,2,1]) == false;
		public test bool assertTrue() = isTrio1([1,1,2]) == false;
		public test bool assertTrue() = isTrio1([1,2, 1,2, 1,2]) == true;
//	}
	
//	@Test public void matchListIsTrio2()  {
//		prepare("import ListMatchingTests;");
		public test bool assertTrue() = isTrio2([]) == true;
		public test bool assertTrue() = isTrio2([1]) == false;
		public test bool assertTrue() = isTrio2([1,1]) == false;
		public test bool assertTrue() = isTrio2([1,1,1]) == true;
		public test bool assertTrue() = isTrio2([2,1,1]) == false;
		public test bool assertTrue() = isTrio2([1,2,1]) == false;
		public test bool assertTrue() = isTrio2([1,1,2]) == false;
		public test bool assertTrue() = isTrio2([1,2, 1,2, 1,2]) == true;
//	}
	
// 	@Test public void matchListIsTrio3()  {
//		prepare("import ListMatchingTests;");
		public test bool assertTrue() = isTrio3([]) == true;
		public test bool assertTrue() = isTrio3([1]) == false;
		public test bool assertTrue() = isTrio3([1,1]) == false;
		public test bool assertTrue() = isTrio3([1,1,1]) == true;
		public test bool assertTrue() = isTrio3([2,1,1]) == false;
		public test bool assertTrue() = isTrio3([1,2,1]) == false;
		public test bool assertTrue() = isTrio3([1,1,2]) == false;
		public test bool assertTrue() = isTrio3([1,2, 1,2, 1,2]) == true;
// }

// data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] S);
// @Test public void matchList3()  {
		public test bool assertTrue() = [a(), b()] := [a(), b()];
		public test bool assertTrue() = ([DATA X1, b()] := [a(), b()]) && (X1 == a());

		public test bool assertTrue() = ([DATA X2, DATA Y, c()] !:= [a(), b()]);

		public test bool assertTrue() = ([e(int X3), b()] := [e(3), b()]) && (X3 == 3);
		public test bool assertTrue() = ([e(int X4)] := [e(3)]) && (X4 == 3);
		public test bool assertTrue() = ([e(int X5)] !:= [a()]);

		public test bool assertTrue() = ([a(), f([a(), b(), DATA X6])] := [a(), f([a(),b(),c()])]) && (X6 == c());

		public test bool assertTrue() = ([a(), f([a(), b(), DATA X7]), *DATA Y7] := [a(), f([a(),b(),c()]), b()]) && (X7 == c() && Y7 == [b()]);
		public test bool assertTrue() = ([DATA A1, f([A1, b(), DATA X8])] := [a(), f([a(),b(),c()])]) && (A1 == a());
		public test bool assertTrue() = ([A1, f([A1, b(), DATA X8])] := [a(), f([a(),b(),c()])]) && (A1 == a());
		
		public test bool assertTrue() = ([f([DATA A1, b(), DATA X8]), A1] := [f([a(),b(),c()]), a()]) && (A1 == a());
		public test bool assertTrue() = ([f([A1, b(), DATA X8]), A1] := [f([a(),b(),c()]), a()]) && (A1 == a());

		public test bool assertTrue() = ([DATA A2, f([A2, b(), *DATA SX1]), SX1] := [a(), f([a(),b(),c()]), c()]) && (A2 == a()) && (SX1 ==[c()]);

		public test bool assertTrue() = ([DATA A3, f([A3, b(), *DATA SX2]), SX2] !:= [d(), f([a(),b(),c()]), a()]);
		public test bool assertTrue() = ([DATA A4, f([A4, b(), *DATA SX3]), SX3] !:= [c(), f([a(),b(),c()]), d()]);
//	}
	
//	@Ignore @Test(expected=StaticError.class)
//	public void recursiveDataTypeNoPossibleMatchVertical() {
//		prepare("data Bool = and(Bool, Bool) | t();");
//		runTestInSameEvaluator("t := and(t,t);");
//	}
data Bool = and(Bool, Bool) | t();
data Prop = or(Prop, Prop) | f();
	
	@expected{ArgumentsMismatch}
	public test bool recursiveDataTypeNoPossibleMatchHorizontal() {
		return Prop p := and(t,t);
	}
	
//	@Ignore @Test(expected=StaticError.class)
//	public void recursiveDataTypeNoPossibleHiddenRecursion() {
//		prepare("data Prop = f;");
//		prepareMore("data Bool = and(list[Prop], list[Prop]) | t();");
//		runTestInSameEvaluator("{p = or(t,t); and(t,t) := p;}");
//	}
	
@expected{RedeclaredVariable}
	public test bool matchListError12() {
		list[int] x = [1,2,3]; 
		return [1, *int L, 2, *int L] := x;
	}
	 
//	public void matchListError1() {
		public test bool assertTrue() {list[int] x = [1,2,3]; return [1, list[int] L, 2, list[int] M] !:= x;}
//	}
	
//	public void matchListError11() {
		public test bool assertTrue() = !([1, list[int] L, 2, list[int] L] := [1,2,3]);
//	}
	
//	public void matchListError2() {
		public test bool assertTrue() = !([1, list[str] L, 2] := [1,2,3]);
//	}
	
@expected{RedeclaredVariable}
	public test bool matchListErrorRedeclaredSpliceVar() {
		list[int] x = [1,2,3]; return [1, * int L, * int L] := x;
	}
	
//@expected{UnexpectedType
//	@Ignore("this is disabled because such type check would break the visiting code")
//	public void matchListError22() {
//		runTest("{ list[int] l = [1,2,3]; [1, list[str] L, 2] := l; }");
//	}
	
//	@Test public void matchListFalse3() {
		public test bool assertTrue() { list[value] l = [1,2,3]; return [1, str S, 2] !:= l;}
//	}
	
//	@Test(expected=StaticError.class)
//	@Ignore("this is disabled because such type check would break the visiting code")
//	public void matchListError3() {
//		runTest("{ list[int] x = [1,2,3] ; [1, str S, 2] := x;}");
//	}
	
	
//	public void matchListError4() {
		public test bool assertTrue()  {str S = "a"; return [1, S, 2] !:= [1,2,3];}
//	}
	
//	@Test(expected=StaticError.class)
//	@Ignore("this is disabled because such type check would break the visiting code")
//	public void matchListError42() {
//		runTest("{str S = "a"; list[int] x = [1,2,3]; [1, S, 2] := x;}");
//	}
	
//	public void matchListError5() {
		public test bool assertTrue() {list[str] S = ["a"]; return [1, S, 2] !:= [1,2,3];}
//	}
	
//	@Test(expected=StaticError.class)
//	@Ignore("this is disabled because such type check would break the visiting code")
//	public void matchListError55() {
//		runTest("{list[str] S = ["a"]; list[int] x = [1,2,3]; [1, S, 2] := x;}");
//	}
	
	public test bool matchListExternalVar() {
		list[int] S; return [1, S, 2] !:= [1,2,3] && S != [3];
	}


//	@Test public void matchListSet() {

		public test bool assertTrue() = [a(), b()] := [a(), b()];
		public test bool assertTrue() = ([DATA X1, b()] := [a(), b()]) && (X1 == a());

		public test bool assertTrue() = ([DATA X2, DATA Y2, c()] !:= [a(), b()]);

		public test bool assertTrue() = ([e(int X3), b()] := [e(3), b()]) && (X3 == 3);
		public test bool assertTrue() = ([e(int X4)] := [e(3)]) && (X4 == 3);
		public test bool assertTrue() = ([e(int X5)] !:= [a()]);

		public test bool assertTrue() = ([a(), f({a(), b(), DATA X6})] := [a(), f({a(),b(),c()})]) && (X6 == c());
		public test bool assertTrue() = ({a(), f([a(), b(), DATA X7])} := {a(), f([a(),b(),c()])}) && (X7 == c());

		public test bool assertTrue() = ([a(), f({a(), b(), DATA X8}), *DATA Y8] := [a(), f({a(),b(),c()}), b()]) && (X8 == c() && Y8 == [b()]);
		public test bool assertTrue() = ({a(), f([a(), b(), DATA X9]), *DATA Y9} := {a(), f([a(),b(),c()]), b()}) && (X9 == c() && Y9 == {b()});

		public test bool assertTrue() = ([DATA A1, f({A1, b(), DATA X10})] := [a(), f({a(),b(),c()})]) && (A1 == a());
		public test bool assertTrue() = ({DATA A2, f([A2, b(), DATA X11])} := {a(), f([a(),b(),c()])}) && (A2 == a());

//	}

	@expected{UnexpectedType}
	// public void matchBoolIntError1(){
		public test bool assertTrue() = (true    !:= 1);
	// }
	
@expected{UnexpectedType}
//	public void matchBoolIntError2(){
		public test bool assertTrue() = !(1 := true);
//	}
	
@expected{UnexpectedType}	
//	public void noMatchBoolIntError1(){
		public test bool assertTrue() = true !:= 1;
//	}

@expected{UnexpectedType}	
	// public void noMatchBoolIntError2(){
		public test bool assertTrue() = 1 !:= true;
	// }
	
@expected{UnexpectedType}	
public test bool matchStringBoolError1(){
		return "abc" := true;
}
@expected{UnexpectedType}	
public test bool matchStringBoolError2(){
		return true := "abc";
}
	
@expected{UnexpectedType}
public test bool noMatchStringBoolError1(){
		return "abc"  !:= true;
	}

@expected{UnexpectedType}	
public test bool noMatchStringBoolError2(){
		return true !:= "abc";
	}

@expected{UnexpectedType}		
	public test bool matchStringIntError1(){
		return "abc" !:= 1;
	}
	
	@expected{UnexpectedType}
//	public void matchStringIntError2(){
		public test bool assertTrue() = 1 !:= "abc";
//	}
	
	@expected{UnexpectedType}
// public void noMatchStringIntError1(){
		public test bool assertTrue()="abc"!:=1;
//	}
	
@expected{UnexpectedType}
//	public void noMatchStringIntError2(){
		public test bool assertTrue()= 1 !:= "abc";
//	}
	
	@expected{UnexpectedType}
	// public void matchStringRealError1(){
		public test bool assertFalse() = "abc" := 1.5;
	// }
	
	@expected{UnexpectedType}
	// public void matchStringRealError2(){
		public test bool assertTrue() = 1.5 !:= "abc";
	// }
	
	@expected{UnexpectedType}
	// public void noMatchStringRealError1(){
		public test bool assertTrue() = "abc"  !:= 1.5;
	// }
	
	@expected{UnexpectedType}
	// public void noMatchStringRealError2(){
		public test bool assertTrue()= 1.5 !:= "abc";
	// }
	
	@expected{UnexpectedType}
	//public void matchIntRealError1(){
		public test bool assertTrue() = !(2 := 1.5);
	// }
	
	@expected{UnexpectedType}
	// public void matchIntRealError2(){
		public test bool assertTrue() = !(1.5 := 2);
	// }
	
	@expected{UnexpectedType}
	// public void noMatchIntRealError1(){
		public test bool assertTrue() {2  !:= 1.5;}
	// }
	
	@expected{UnexpectedType}
	// public void noMatchIntRealError2(){
		public test bool assertTrue() {1.5 !:= 2;}
	// }

//	@Test  public void matchLiteral() {

		public test bool assertTrue() = true     := true;
		public test bool assertTrue() = !(true    := false);
		public test bool assertTrue() = true     !:= false;

		public test bool assertTrue() = 1        := 1;
		public test bool assertTrue() = !(2       := 1);
		public test bool assertTrue() = 2        !:= 1;

		public test bool assertTrue() = 1.5      := 1.5;
		public test bool assertTrue() = !(2.5     := 1.5);
		public test bool assertTrue() = 2.5      !:= 1.5;
		
		public test bool assertTrue() = !(1.0     := 1.5);
		public test bool assertTrue() = 1.0      !:= 1.5;

		public test bool assertTrue()=  "abc"  := "abc";
		public test bool assertTrue() = "def" !:= "abc";
		public test bool assertTrue()=  "def" !:= "abc";
//	}

	@expected{UnexpectedType}
	public test bool matchADTStringError1(){
		return f(1) !:= "abc";
	}
	
	@expected{UnexpectedType}
	public  test bool matchADTStringError2(){
		return "abc" !:= f(1);
	}
	
	@expected{UnexpectedType}
	public  test bool  noMatchADTStringError1(){
		return f(1) !:= "abc";
	}
	
	@expected{UnexpectedType}
	public  test bool noMatchADTStringError2(){
		return "abc" !:= f(1);
	}

//	@Test public void matchADT() {

		public test bool assertTrue() = f(1)                   := f(1);
		public test bool assertTrue() = f(1, g("abc"), true) := f(1, g("abc"), true);
		public test bool assertTrue() = q(1) !:= f(1);
		public test bool assertTrue() = f(1, 2)!:= f(1);
		public test bool assertTrue() = f(1, 2)!:= f(1);	
		public test bool assertTrue() = f(_):= f(1);
		public test bool assertTrue() = f(_,_):= f(1,2);
		public test bool assertTrue() = f(_,_,_):= f(1,2.5,true);
//	}

//	@Test public void matchADTWithKeywords() {
		
		public test bool assertTrue() = f1(1)                   := f1(1);
		public test bool assertTrue() = f1(1, M=10)             := f1(1);
		public test bool assertTrue() = f1(1, B=false, M=10)    := f1(1);
		public test bool assertTrue() = f1(1, M=20)             := f1(1, B=false, M=20);
		public test bool assertTrue() = f1(1, M=X)             := f1(1, B=false, M=20) && X == 20;
//	}
	
//	@Test public void matchNode() {
		
		public test bool assertTrue() ="f"(1)                := "f"(1);
		public test bool assertTrue() ="f"(1, "g"("abc"), true) := "f"(1, "g"("abc"), true);
		public test bool assertTrue() = "g"(1)               !:= "f"(1);
		public test bool assertTrue() = "g"(1)                !:= "f"(1);
		public test bool assertTrue() = "f"(1, 2)            !:= "f"(1);
		public test bool assertTrue() = "f"(1, 2)             !:= "f"(1);
		
		public test bool assertTrue() = "f"(_)                := "f"(1);
		public test bool assertTrue() = "f"(_,_)              := "f"(1,2);
		public test bool assertTrue() = "f"(_,_,_)            := "f"(1,2.5,true);
		public test bool assertTrue() = "f"(1,_,3)            := "f"(1,2,3);
		public test bool assertTrue() = "f"(_,2,_)            := "f"(1,2,3);
//	}

//	@Test public void matchNodeWithKeywords() {
	
	   public test bool assertTrue() ="f1"(1)                := "f1"(1);
		
		public test bool assertTrue() ="f1"(1)               !:= "f1"(2);
		public test bool assertTrue() ="f1"(1, M=10)          := "f1"(1, M=10);
		public test bool assertTrue() ="f1"(1)                := "f1"(1, M=10);
		public test bool assertTrue() ="f1"(1, M=10)         !:= "f1"(1, M=20);
		public test bool assertTrue() ="f1"(1, M=10)         !:= "f1"(1);
		public test bool assertTrue() ="f1"(1, M=10)         !:= "f1"(1, B=false);
		
		
		public test bool assertTrue() ="f1"(1, B=false, M=10) := "f1"(1, M=10, B=false);
		public test bool assertTrue() ="f1"(1, M=20, B=false) := "f1"(1, B=false, M=20);
		public test bool assertTrue() ="f1"(1, M=20)          := "f1"(1, B=false, M=20);
		public test bool assertTrue() ="f1"(1)                := "f1"(1, B=false, M=20);
		public test bool assertTrue() ="f1"(1, B=false, M=10) !:= "f1"(1, M=20, B=false);
		public test bool assertTrue() ="f1"(1, M=10, B=false)!:= "f1"(1, B=false, M=20);
		public test bool assertTrue() ="f1"(1, M=_, B=false)  := "f1"(1, B=false, M=20);
		public test bool assertTrue() ="f1"(_, M=20, B=false) := "f1"(1, B=false, M=20);
		
		public test bool assertTrue() = "f1"(1, M=X) := "f1"(1, B=false, M=20) && X == 20;
//	}
	
	
	//@Ignore @Test(expected=StaticError.class)
	//public void NoDataDecl(){
	//	runTest("f(1) := 1;");
	//}
	
	@expected{UnexpectedType}
	// public void matchSetStringError(){
		public bool assertFalse() = {1} := "a";
	// }

//	@Test public void matchSet1() {
		
		public test bool assertTrue() = {} := {};
		public test bool assertTrue() = {1} := {1};
		public test bool assertTrue() = {1, 2} := {1, 2};
		
		public test bool assertTrue() = {int _} := {1};
		public test bool assertTrue() = {int _, int _} := {1, 2};
		
		public test bool assertTrue() = {_} := {1};
		public test bool assertTrue() = {_, _} := {1, 2};
		public test bool assertTrue() = !({_} := {1, 2});
		public test bool assertTrue() = !({_, _} := {1});
		
		public test bool assertTrue() = !({_, _} := {1, 2, 3});

		public test bool assertTrue() = !({_, _, _} := {1, 2});
		 
		public test bool assertTrue() = !({} := {1});
		public test bool assertTrue() = !({1} := {2});
		public test bool assertTrue() = !({1,2} := {1,3});

		public test bool assertTrue() = {*int X} := {} && X == {};

		public test bool assertTrue() =  {*int X} := {1} && X == {1};
		public test bool assertTrue() = {*int X} := {1,2} && X == {1,2};
		
		public test bool assertTrue() = {*Y} := {1,2} && Y == {1,2};
//TODO: Test related to + multivariables are commented out since they are not yet supported by
//the Rascal syntax
		
//		public test bool assertTrue() = {Y+} := {1,2} && Y == {1,2};
		
		
		public test bool assertTrue() = {*int _} := {1,2}; 
		public test bool assertTrue() = {*_} := {1,2}; 
//		public test bool assertTrue() = {_+} := {1,2}; 
		
		public test bool assertTrue() = ({int N, 2, N} := {1,2}) && (N == 1);
		
		public test bool assertTrue() = !(({int N, 2, N} := {1,2,3}));
		public bool assertFalse() = ({int N, 2, N} := {1,2,"a"});
		
		public test bool assertTrue() {int N = 3; return {N, 2, 1} := {1,2,3};}
		public test bool assertTrue() {set[int] S = {3}; return {S, 2, 1} := {1,2,3};}
		public test bool assertTrue() {set[int] S = {2, 3}; return {S, 1} := {1,2,3};}

		public test bool assertTrue() = {1, *int X, 2} := {1,2} && X == {};
		public test bool assertTrue() = {1, *X, 2} := {1,2} && X == {};
		public test bool assertTrue() = {1, *_, 2} := {1,2};
//		public test bool assertTrue() = !({ {1, X+, 2} := {1,2});
//		public test bool assertTrue() = !({ {1, _+, 2} := {1,2};}) _+ does not exist yet
		public test bool assertTrue() = {1, *X, 2} := {1,2} && X == {};
		public test bool assertTrue() = !({1, *X, 2} := {1,3});
		public test bool assertTrue() = !({1, *_, 2} := {1,3});
		
		public test bool assertTrue() = {1, *int X, 2} := {1,2,3} && X == {3};
		public test bool assertTrue() = {1, *X, 2} := {1,2,3} && X == {3};
//		public test bool assertTrue() = {1, X+, 2} := {1,2,3} && X == {3};
		public test bool assertTrue() = {1, *_, 2} := {1,2,3};
//		public test bool assertTrue() = {1, _+, 2} := {1,2,3};
		
		public test bool assertTrue() = {1, *int X, 2} := {1,2,3,4} && X == {3,4};

		public test bool assertTrue() = {*int X, *int Y} := {} && X == {} && Y == {};
		public test bool assertTrue() = {1, *int X, *int Y} := {1} && X == {} && Y == {};
		public test bool assertTrue() = {*int X, 1, *int Y} := {1} && X == {} && Y == {};
		public test bool assertTrue() = {*int X, *int Y, 1} := {1} && X == {} && Y == {};

		public test bool assertTrue() = !({*int X, *int Y, 1} := {2});
		public test bool assertTrue() = !({*X, *Y, 1} := {2});
		
		public test bool assertTrue() = {*int X, *int Y} := {1} && ((X == {} && Y == {1}) || (X == {1} && Y == {}));
		public test bool assertTrue() = {*X, *Y} := {1} && ((X == {} && Y == {1}) || (X == {1} && Y == {}));

		public test bool assertTrue() = {*int X, *int Y, *int Z} := {} && X == {} && Y == {} && Z == {};
		public test bool assertTrue() = {*X, *Y, *Z} := {} && X == {} && Y == {} && Z == {};
		public test bool assertTrue() = {*int X, *int Y, *int Z} := {1} && (X == {1} && Y == {} && Z == {}) || (X == {} && Y == {1} && Z == {}) || (X == {} && Y == {} && Z == {1});
		public test bool assertTrue() = {*X, *Y, *Z} := {1} && (X == {1} && Y == {} && Z == {}) || (X == {} && Y == {1} && Z == {}) || (X == {} && Y == {} && Z == {1});

		public test bool assertTrue() = {int X, *int Y} := {1} && X == 1 && Y == {};
		public test bool assertTrue() = {*int X, int Y} := {1} && X == {} && Y == 1;
		public test bool assertTrue() = {*X, int Y} := {1} && X == {} && Y == 1;
//		public test bool assertTrue() = !({ {X+, int Y} := {1};})
		public test bool assertTrue() = {*int _, int _} := {1}; 
		public test bool assertTrue() = {*_, int _} := {1}; 
		public test bool assertTrue() =  {*_, _} := {1}; 
//		public test bool assertTrue() = !({_+, _} := {1});

		public test bool assertTrue() = {*int X, int Y} := {1, 2} && (X == {1} && Y == 2) || (X == {2} && Y == 1);
		public test bool assertTrue() = {*X, int Y} := {1, 2} && (X == {1} && Y == 2) || (X == {2} && Y == 1);
		
		public test bool assertTrue() = {*int X, int Y} := {1, 2} && (X == {1} && Y == 2) || (X == {2} && Y == 1);
		public test bool assertTrue() = {*int X, *real Y} := { 1, 5.5, 2, 6.5} && (X == {1,2} && Y == {5.5, 6.5});
		public test bool assertTrue() = {*X, *Y} := { 1, 5.5, 2, 6.5} && (X == {1, 5.5, 2, 6.5} && Y == {});
		
		public test bool assertTrue() {set[int] x = {}; return {} := x;} 
		
//	}	

//	@Test public void matchSet2() {

		// prepare("data DATA = a() | b() | c() | d() | e(int N) | s(set[DATA] S) | g(int N) | h(int N);");

		public test bool assertTrue() = {a(), b()} := {a(), b()};
		public test bool assertTrue() = ({DATA X1, b()} := {a(), b()}) && (X1 == a());

		public test bool assertTrue() = {DATA X2, DATA Y2, c()} !:= {a(), b()};

		public test bool assertTrue() = ({e(int X3), b()} := {e(3), b()}) && (X3 == 3);
		public test bool assertTrue() = ({e(int X4)} := {e(3)}) && (X4 == 3);
		public test bool assertTrue() = ({e(int X5)} !:= {a()});
		
		public test bool assertTrue() = ({e(int X3), g(X3)} := {e(3), g(3)}) && (X3 == 3);
		public test bool assertTrue() = ({e(X3), g(X3), h(X3)} := {e(3), h(3), g(3)}) && (X3 == 3);

		public test bool assertTrue() = ({a(), s({a(), b(), DATA X6})} := {a(), s({a(),b(),c()})}) && (X6 == c());
		public test bool assertTrue() = ({s({a(), b(), DATA X7}), a()} := {a(), s({a(),b(),c()})}) && (X7 == c());

		public test bool assertTrue() = ({a(), s({a(), b(), DATA X8}), *DATA Y8} := {a(), b(), s({a(),b(),c()})}) && (X8 == c() && Y8 == {b()});
		public test bool assertTrue() = ({DATA A1, s({A1, b(), DATA X9})} := {a(), s({a(),b(),c()})}) && (A1 == a());
		public test bool assertTrue() = ({DATA A2, s({A2, b(), DATA X10})} := {s({a(),b(),c()}), a()}) && (A2 == a());

		public test bool assertTrue() = ({DATA A3, s({A3, b(), *DATA SX1}), *SX1} := {a(), s({a(),b(),c()}), c()}) && (A3== a()) && (SX1 =={c()});
		public test bool assertTrue() = ({DATA A4, s({A4, b(), *DATA SX2}), *SX2} := {s({a(),b(),c()}), a(), c()}) && (A4== a()) && (SX2 =={c()});
		public test bool assertTrue() = ({DATA A5, s({A5, b(), *DATA SX3}), *SX3} := {c(), s({a(),b(),c()}), a()}) && (A5 == a()) && (SX3 =={c()});

		public test bool assertTrue() = ({DATA A6, s({A6, b(), *DATA SX4}), *SX4} !:= {d(), s({a(),b(),c()}), a()});
		public test bool assertTrue() = ({DATA A7, s({A7, b(), *DATA SX5}), *SX5} !:= {c(), s({a(),b(),c()}), d()});
		
		public test bool assertTrue() = ({DATA A8, s({A8, b()})} := {s({a(),b()}), a()}) && (A8 == a());
		public test bool assertTrue() = ({s({DATA A9, b()}), A9} := {s({a(),b()}), a()});
		public test bool assertTrue() = ({s({DATA A9, b()}), A9} := {s({a(),b()}), a()}) && (A9 == a());
		public test bool assertTrue() = ({s({DATA A10, b(), *DATA SX6}), A10, SX6} := {c(), s({a(),b(),c()}), a()}) && (A10 == a()) && (SX6 =={c()});
//	}
	
//	@Test public void matchListSetVariableScopes(){
		
		
		public test bool assertTrue() = {PAIR D, pair(D, b1())} := {pair(a1(),b1()), a1()} && D == a1();
		public test bool assertTrue() = {PAIR D, pair(D, b1())} !:= {pair(a1(),b1()), c1()};
		
		public test bool assertTrue() = {pair(PAIR D, b1()), D} := {pair(a1(),b1()), a1()} && D == a1();
		public test bool assertTrue() = {pair(PAIR D, b1()), D} !:= {pair(a1(),b1()), c1()};
		
		public test bool assertTrue() = {pair(s1(set[PAIR] S1), c1()), S1} :=  {pair(s1({a1(), b1()}), c1()), a1(), b1()} && S1 == {a1(), b1()};
		public test bool assertTrue() = {pair(s1(set[PAIR] S1), c1()), S1} !:= {pair(s1({a1(), b1()}), c1()), a1(), d1()};
		
		public test bool assertTrue() {list[PAIR] L1 = [a1(), b1()]; return [L1, c1()] := [a1(), b1(), c1()];}
		public test bool assertTrue() {list[PAIR] L1 = [a1(), b1()]; return [L1, c1()] !:= [a1(), d1(), c1()];}
		
		public test bool assertTrue() = [pair(l1(list[PAIR] L1), c1()), L1] := [pair(l1([a1(), b1()]), c1()), a1(), b1()];
		public test bool assertTrue() = [pair(l1(list[PAIR] L1), c1()), L1] !:= [pair(l1([a1(), b1()]), c1()), a1(), d1()];
		
		public test bool assertTrue() = [pair(PAIR L1, b1()), L1] := [pair(a1(), b1()), a1()];
		public test bool assertTrue() = [pair(PAIR L1, b1()), L1] !:= [pair(a1(), b1()), d1()];
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

@expected{RedeclaredVariable}
		public test bool assertTrue() = {1, *int L, 2, *int L} := {1,2,3};
@expected{UnexpectedType}	
	//@Test(expected=StaticError.class)
	//@Ignore("This can only be correctly checked by the type checker, the current implementation broke set matching in visits")
	//public void matchSetWrongElemError() {
	//	public test bool assertTrue() =runTest("{1, "a", 2, *set[int] L} := {1,2,3};");
	//}	
//@expected{UnexpectedType}	
//	@Test(expected=StaticError.class) @Ignore
//	public void matchSetWrongElemError2() {
//		public test bool assertTrue() =runTest("{1, set[str] L, 2} := {1,2,3};");
//	}
//@expected{UnexpectedType}	
//	@Test(expected=StaticError.class) @Ignore
//	public void matchSetWrongElemError3() {
//		public test bool assertTrue() =runTest("{1, str S, 2} := {1,2,3};");
//	}
//@expected{UnexpectedType}
//	@Test(expected=StaticError.class) @Ignore
//	public void matchSetWrongElemError4() {
//		public test bool assertTrue() =runTest("{set[str] S = {"a"}; {1, S, 2} := {1,2,3};}");
//	}
@expected{RedeclaredVariable}	
//	public void matchSetErrorRedeclaredSpliceVar() {
		public test bool assertTrue()  {
		set[int] x = {1,2,3}; return {1, * int L, * int L} := x;
		}
//	}

//	@Test	
//	public void matchSetExternalVar() {
		public test bool assertTrue() {set[int] S; return ({1, *S, 2} := {1,2,3} && S == {3});}
//	}

@expected{UnexpectedType}
//	public void matchTupleStringError() {
		public test bool assertTrue() = <1> := "a";
//	}
	
@expected{UnexpectedType}
//	public void matchTupleArityError() {
		public test bool assertTrue() = !(<1,2> := <1>);
	
@expected{UnexpectedType}
//	public void noMatchTupleArityError(){
		public test bool assertTrue() = <1> !:= <1,2>;
//	}
/*
	@Test
	public void matchTuple() {

		public test bool assertTrue() {<1>           := <1>;}
		assertTrue(runTest("<1, "abc">  := <1, "abc">;"));
		public test bool assertTrue() = !(<2>          := <1>;)
		public test bool assertTrue() {<2>           !:= <1>;}
		
		public bool assertFalse() = "<1, "abc"> := <1, "def">;"));
		assertTrue(runTest("<1, "abc">  !:= <1, "def">;"));
		
		assertTrue(runTest("<_, "abc">  := <1, "abc">;"));
		assertTrue(runTest("<1, _>        := <1, "abc">;"));
		assertTrue(runTest("<_, _>        := <1, "abc">;"));
	}
	
	@Test
	public void matchTupleExternalVar(){
		public test bool assertTrue() {{tuple[int,int] T; T := <1,2> && T[0] == 1 && T[1] == 2;}}
	}

	@Test
	public void matchVariable() {

		prepare("data F = f(int N);");

		public test bool assertTrue() = (n1 := 1) && (n1 == 1);
		public test bool assertTrue() = {int n2 = 1; (n2 := 1) && (n2 == 1);}
		public test bool assertTrue() = {int n3 = 1; (n3 !:= 2) && (n3 == 1);}

		public test bool assertTrue() = (f(n5) := f(1)) && (n5 == 1);
		public test bool assertTrue() = {int n6 = 1; (f(n6) := f(1)) && (n6 == 1);}
		
		assertTrue(runTestInSameEvaluator("(f(_) := f(1));
	}
	
	@Test
	public void matchTypedVariableBecomes() {
		public test bool assertTrue() {{int N : 3 := 3 && N == 3;}}
		public test bool assertTrue() {{list[int] L1 : [int N, *int L2, int M] := [1,2,3] && L1 == [1,2,3] && N == 1 && L2 == [2] && M == 3;}}
		public test bool assertTrue() {{[1, list[int] L: [int N], 2] := [1,[2],2] && L == [2];}}
		public test bool assertTrue() {{[1, list[int] L1: [*int L2, int N], 5] := [1,[2,3,4],5] && L1 == [2,3,4] && L2==[2,3] && N ==4;}}
		public test bool assertTrue() {{[1, list[int] L1: [*int L2, int N], L1] := [1,[2,3,4],[2,3,4]] && L1 == [2,3,4] && L2==[2,3] && N ==4;}}
	}
	
	@Test(expected=StaticError.class)
	public void typedVariableBecomesWrongType(){
		public test bool assertTrue() {{str N : 3 := 3; N == 3;}}
	}
	
	@Test
	public void redeclaredTypedVariableBecomesShadowsAnother(){
		public test bool assertTrue() {{int N = 5; int N : 3 := 3 && N == 3;}}
	}
	
	@Ignore("we can't find this bug anymore due to pattern dispatch") @Test(expected=StaticError.class)
	public void doubleTypedVariableBecomes(){
		public test bool assertTrue() {{[int N : 3, int N : 4] := [3,4] && N == 3;}}
	}
	
	@Test
	public void matchVariableBecomes() {
		public test bool assertTrue() {{N : 3 := 3 && N == 3;}}
		public test bool assertTrue() {{L1 : [int N, *int L2, int M] := [1,2,3] && L1 == [1,2,3] && N == 1 && L2 == [2] && M == 3;}}
		public test bool assertTrue() {{[1, L: [int N], 2] := [1,[2],2] && L == [2];}}
		public test bool assertTrue() {{[1, L1: [*int L2, int N], 5] := [1,[2,3,4],5] && L1 == [2,3,4] && L2==[2,3] && N ==4;}}
		public test bool assertTrue() {{[1, L1: [*int L2, int N], L1] := [1,[2,3,4],[2,3,4]] && L1 == [2,3,4] && L2==[2,3] && N ==4;}}
	}
	
	public void variableBecomesEquality(){
		public test bool assertTrue() = !({int N = 5; N : 3 := 3 && N == 3;})
		public test bool assertTrue() {{int N = 3; N : 3 := 3 && N == 3;}}
	}
	
	public void doubleVariableBecomes(){
		public test bool assertTrue() = !({[N : 3, N : 4] := [3,4] && N == 3;})
		public test bool assertTrue() {{[N : 3, N : 3] := [3,3] && N == 3;}}
	}
	
	@Test(expected=StaticError.class)
	public void UndeclaredTypeError(){
		runTest("STRANGE X := 123;");
	}
	
	@Test
	public void antiPattern(){
		public test bool assertTrue() {{!4 := 3;}}
		public test bool assertTrue() = !({!3 := 3;})
		
		public test bool assertTrue() {{![1,2,3] := [1,2,4];}}
		public test bool assertTrue() = !({![1,2,3] := [1,2,3];})
	}
	
	@Test(expected=UndeclaredVariable.class)
	public void antiPatternDoesNotDeclare() {
		runTest("{![1,int X,3] := [1,2,4] && (X ? 10) == 10;}");
	}
	
	@Test
	public void descendant1(){
		public test bool assertTrue() {/int N := 1 && N == 1;}
		public test bool assertTrue() {!/int N := true;}
		
		public test bool assertTrue() = !(/int N := [];)
		public test bool assertTrue() {/int N := [1] && N == 1;}

		public test bool assertTrue() {/int N := [1,2,3,2] && N > 2;}
		public test bool assertTrue() {!/4 := [1,2,3,2];}
		public test bool assertTrue() {/int N := (1 : 10) && (N == 1 || N == 10);}
	
		public test bool assertTrue() = !(/int N := {};)
		public test bool assertTrue() {/int N := {1} && N == 1;}
		public test bool assertTrue() {/int N := {<false,1>} && N == 1;}
		
		assertTrue(runTest("/int N := ("a" : 1) && N == 1;"));
		assertTrue(runTest("/int N := <"a", 1> && N == 1;"));
		
		public test bool assertTrue() {{[1, /int N, 3] := [1, [1,2,3,2], 3] && N == 1;}}
		public test bool assertTrue() {{[1, /int N, 3] := [1, [1,2,3,2], 3] && N == 2;}}	
	}
	
	@Test
	public void descendant2(){
		prepare("data F = f(F left, F right) | g(int N);");
		public test bool assertTrue() = /g(2) := f(g(1),f(g(2),g(3)));"));
		public test bool assertTrue() = [1, /g(2), 3] := [1, f(g(1),f(g(2),g(3))), 3];
		public test bool assertTrue() = [1, !/g(5), 3] := [1, f(g(1),f(g(2),g(3))), 3];
		
		public test bool assertTrue() = [1, /f(/g(2), _), 3] := [1, f(g(1),f(g(2),g(3))), 3];
		public test bool assertTrue() = [1, /f(/g(2),/g(3)), 3] := [1, f(g(1),f(g(2),g(3))), 3];
		public test bool assertTrue() = [1, F outer: /f(/F inner: g(2), _), 3] := [1, f(g(1),f(g(2),g(3))), 3] && outer == f(g(1),f(g(2),g(3))) && inner == g(2);
			
		public test bool assertTrue() = {[1, /g(int N1), 3] := [1, f(g(1),f(g(2),g(3))), 3] && N1 == 1;}
		public test bool assertTrue() = {[1, /g(int N2), 3] := [1, f(g(1),f(g(2),g(3))), 3] && N2 == 2;}
		public test bool assertTrue() = {[1, /g(int N3), 3] := [1, f(g(1),f(g(2),g(3))), 3] && N3 == 3;}
	}
	
	@Test
	public void descendant3(){
		public test bool assertTrue() = [n | /int n <- [1,2,3]] == [1,2,3];
		public test bool assertTrue() = [b | /bool b <- [true,false,true]] == [true,false,true];
		assertTrue(runTestInSameEvaluator("[s | /str s <- ["a","b"]] == ["a","b"];"));
		
		public test bool assertTrue() = {n | /int n <- {1,2,3}} == {1,2,3};
		public test bool assertTrue() = {n | /int n <- {<1,2,3>}} == {1,2,3};
		assertTrue(runTestInSameEvaluator("{v | /value v <- {<1,"b",true>}} == {1,"b",true, <1,"b",true>};"));
	}
	
	//
	// The following test requires deeper analysis of the data signature
	///
	@Ignore @Test(expected=StaticError.class)
	public void descendantWrongType(){
		prepare("data F = f(F left, F right) | g(int N);");
		public test bool assertTrue() = /true := f(g(1),f(g(2),g(3)));
	}
	
	@Test
	public void listCount1(){
		String cnt = 
		      "int cnt(list[int] L){" +
		      "  int count = 0;" +
		      "  while ([int N, *int Ns] := L) { " +
		      "         count = count + 1;" +
		      "         L = tail(L);" +
		      "  }" +
		      "  return count;" +
		      "}";
	
		prepare("import List;");
		assertTrue(runTestInSameEvaluator("{" + cnt + "cnt([1,2,3]) == 3;}"));
	}
	
	@Test
	public void listCount2(){
		String cnt = 
		      "int cnt(list[int] L){" +
		      "  int count = 0;" +
		      "  while ([int N, *int _] := L) { " +
		      "         count = count + 1;" +
		      "         L = tail(L);" +
		      "  }" +
		      "  return count;" +
		      "}";
	
		prepare("import List;");
		assertTrue(runTestInSameEvaluator("{" + cnt + "cnt([1,2,3]) == 3;}"));
	}
	
	@Test
	public void listCount3(){
		String cnt = 
		      "int cnt(list[int] L){" +
		      "  int count = 0;" +
		      "  while ([N, *int _] := L) { " +
		      "         count = count + 1;" +
		      "         L = tail(L);" +
		      "  }" +
		      "  return count;" +
		      "}";
	
		prepare("import List;");
		assertTrue(runTestInSameEvaluator("{" + cnt + "cnt([1,2,3]) == 3;}"));
	}
	
	@Test
	public void setCount1(){
		String cnt = 
		      "int cnt(set[int] S){" +
		      "  int count = 0;" +
		      "  while ({int N, *int Ns} := S) { " +
		      "         count = count + 1;" +
		      "         S = S - {N};" +
		      "  }" +
		      "  return count;" +
		      "}";
	
		assertTrue(runTestInSameEvaluator("{" + cnt + "cnt({1,2,3}) == 3;}"));
	}
	
	@Test
	public void setCount2(){
		String cnt = 
		      "int cnt(set[int] S){" +
		      "  int count = 0;" +
		      "  while ({int N, *int _} := S) { " +
		      "         count = count + 1;" +
		      "         S = S - {N};" +
		      "  }" +
		      "  return count;" +
		      "}";
	
		assertTrue(runTestInSameEvaluator("{" + cnt + "cnt({1,2,3}) == 3;}"));
	}
	
	@Test
	public void setCount3(){
		String cnt = 
		      "int cnt(set[int] S){" +
		      "  int count = 0;" +
		      "  while ({N, *int _} := S) { " +
		      "         count = count + 1;" +
		      "         S = S - {N};" +
		      "  }" +
		      "  return count;" +
		      "}";
	
		assertTrue(runTestInSameEvaluator("{" + cnt + "cnt({1,2,3}) == 3;}
	}
	
	@Test
	public void nodeMatchBacktracking() {
		prepare("import List;");
		runTestInSameEvaluator("{ x = for("f"({int a, int b, *set[int] c}) := "f"({1,2,3,4})) append <a,b>; size(x) == 12;}"); 
	}
	
	@Test
	public void tupleMatchBacktracking() {
		prepare("import List;");
		runTestInSameEvaluator("{ x = for(<{int a, int b, *set[int] c}> := <{1,2,3,4}>) append <a,b>; size(x) == 12;}"); 
	}
	
	@Test 
	public void switchListOnValue() {
		runTest("{ value yy = []; switch(yy) { case [] : true; default: false; } }");
	}
	
	@Test 
	public void switchSetOnValue() {
		runTest("{ value yy = {}; switch(yy) { case {} : true; default: false; } }");
	}
*/
data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] L) | f(set[DATA] S)| s(set[DATA] S)|g(int N)|h(int N);
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

