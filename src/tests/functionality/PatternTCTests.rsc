module tests::functionality::PatternTCTests

public test bool matchNestedList2() = !([[1]] := []);

public test bool matchNestedSet2() = !({{1}} := {});

data Bool = and(Bool, Bool) | t();
data Prop = or(Prop, Prop) | f();

@expected{UnexpectedType}
  	public test bool cannotMatchListStr1(){
  		return [1] := "a";
  	}
  	
@expected{UndeclaredVariable}
  	public test bool  unguardedMatchNoEscape1() {
  		// m should not be declared after the unguarded pattern match.
  		int n = 3; int m := n; return m == n; 
  	}
  	
@expected{ArgumentsMismatch}
  	public test bool recursiveDataTypeNoPossibleMatchHorizontal1() {
  		return Prop p := and(t,t);
  	}
  	
 @expected{RedeclaredVariable}
  	public test bool matchListError1() {
  		list[int] x = [1,2,3]; 
  		return [1, *int L, 2, *int L] := x;
  	}
  	
 @expected{RedeclaredVariable}
  	public test bool matchListErrorRedeclaredSpliceVar1() {
  		list[int] x = [1,2,3]; return [1, * int L, * int L] := x;
  	}
  	
  //@expected{UnexpectedType
  //	@Ignore("this is disabled because such type check would break the visiting code")
  //	public void matchListError22() {
  //		runTest("{ list[int] l = [1,2,3]; [1, list[str] L, 2] := l; }");
  //	}
  
  	@expected{UnexpectedType}
  	// public void matchBoolIntError1(){
  		public test bool assertTrue1() = (true    !:= 1);
  	// }
  	
  @expected{UnexpectedType}
  //	public void matchBoolIntError2(){
  		public test bool assertTrue2() = !(1 := true);
  //	}
  	
  @expected{UnexpectedType}	
  //	public void noMatchBoolIntError1(){
  		public test bool assertTrue3() = true !:= 1;
  //	}
  
  @expected{UnexpectedType}	
  	// public void noMatchBoolIntError2(){
  		public test bool assertTrue4() = 1 !:= true;
  	// }
  	
  @expected{UnexpectedType}	
  public test bool matchStringBoolError11(){
  		return "abc" := true;
  }
  @expected{UnexpectedType}	
  public test bool matchStringBoolError21(){
  		return true := "abc";
  }
  	
  @expected{UnexpectedType}
  public test bool noMatchStringBoolError11(){
  		return "abc"  !:= true;
  	}
  
  @expected{UnexpectedType}	
  public test bool noMatchStringBoolError21(){
  		return true !:= "abc";
  	}
  
  @expected{UnexpectedType}		
  	public test bool matchStringIntError11(){
  		return "abc" !:= 1;
  	}
  	
  	@expected{UnexpectedType}
  //	public void matchStringIntError2(){
  		public test bool assertTrue5() = 1 !:= "abc";
  //	}
  	
  	@expected{UnexpectedType}
  // public void noMatchStringIntError1(){
  		public test bool assertTrue6()="abc"!:=1;
  //	}
  	
  @expected{UnexpectedType}
  //	public void noMatchStringIntError2(){
  		public test bool assertTrue7()= 1 !:= "abc";
  //	}
  	
  	@expected{UnexpectedType}
  	// public void matchStringRealError1(){
  		public test bool assertFalse1() = "abc" := 1.5;
  	// }
  	
  	@expected{UnexpectedType}
  	// public void matchStringRealError2(){
  		public test bool assertTrue8() = 1.5 !:= "abc";
  	// }
  	
  	@expected{UnexpectedType}
  	// public void noMatchStringRealError1(){
  		public test bool assertTrue9() = "abc"  !:= 1.5;
  	// }
  	
  	@expected{UnexpectedType}
  	// public void noMatchStringRealError2(){
  		public test bool assertTrue10()= 1.5 !:= "abc";
  	// }
  	
  	@expected{UnexpectedType}
  	//public void matchIntRealError1(){
  		public test bool assertTrue11() = !(2 := 1.5);
  	// }
  	
  	@expected{UnexpectedType}
  	// public void matchIntRealError2(){
  		public test bool assertTrue12() = !(1.5 := 2);
  	// }
  	
  	@expected{UnexpectedType}
  	// public void noMatchIntRealError1(){
  		public test bool assertTrue13() {2  !:= 1.5;}
  	// }
  	
  	@expected{UnexpectedType}
  	// public void noMatchIntRealError2(){
  		public test bool assertTrue14() {1.5 !:= 2;}
  	// }
  	
  	@expected{RedeclaredVariable}
  		public test bool errorRedclaredVariable1() = {1, *int L, 2, *int L} := {1,2,3};
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
  		public test bool matchSetErrorRedeclaredSpliceVar1()  {
  		set[int] x = {1,2,3}; return {1, * int L, * int L} := x;
  		}
  //	}
  
  @expected{UndefinedType}
  	public bool UndeclaredTypeError1()  {
  		STRANGE X := 123; return false;
  	}
  	
  @expected{UndeclaredVariable}
  	public test bool antiPatternDoesNotDeclare1() {
  		![1,int X,3] := [1,2,4] && (X ? 10) == 10; return false;
  	}
  	
  	@expected{UnexpectedType}
  	public test bool matchADTStringError11(){
  		return f(1) !:= "abc";
  	}
  	
  	@expected{UnexpectedType}
  	public  test bool matchADTStringError21(){
  		return "abc" !:= f(1);
  	}
  	
  	@expected{UnexpectedType}
  	public  test bool  noMatchADTStringError11(){
  		return f(1) !:= "abc";
  	}
  	
  	@expected{UnexpectedType}
  	public  test bool noMatchADTStringError21(){
  		return "abc" !:= f(1);
  	}
  	
  	@expected{UnexpectedType}
  //	public void matchTupleStringError() {
  		public test bool matchTupleStringError1() = <1> := "a";
  //	}
  	
  @expected{UnexpectedType}
  //	public void matchTupleArityError() {
  		public test bool assertTrue15() = !(<1,2> := <1>);
  	
  @expected{UnexpectedType}
  //	public void noMatchTupleArityError(){
  		public test bool noMatchTupleArityError1() = <1> !:= <1,2>;
  //	}
  
  @expected{UnexpectedType}
  	// public void matchSetStringError(){
  		public bool assertFalse2() = {1} := "a";
  	// }
  	
  	
   //	public void matchListError1() {
  		public test bool matchListError2() {list[int] x = [1,2,3]; return [1, *list[int] L, 2, list[int] M] !:= x;}
  //	}
  	
  //	public void matchListError11() {
  		public test bool matchListError3() = !([1, list[int] L, 2, list[int] L] := [1,2,3]);
  //	}
  	
  //	public void matchListError2() {
  		public test bool matchListError4() = !([1, list[str] L, 2] := [1,2,3]);
  //	}	
  	
  	
  		public void doubleVariableBecomes1(){
  		public test bool doubleVariableBecomes2() = !(([N : 3, N : 4] := [3,4]) && N == 3);
  		public test bool doubleVariableBecomes3() = [N : 3, N : 3] := [3,3] && N == 3;
  	}
  
  	
  	 //	public void matchListError4() {
  		public test bool matchListError5()  {str S = "a"; return [1, S, 2] !:= [1,2,3];}
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
  
   //	@Ignore @Test(expected=StaticError.class)
  //	public void recursiveDataTypeNoPossibleHiddenRecursion() {
  //		prepare("data Prop = f;");
  //		prepareMore("data Bool = and(list[Prop], list[Prop]) | t();");
  //		runTestInSameEvaluator("{p = or(t,t); and(t,t) := p;}");
  //	}
  
  //@Ignore @Test(expected=StaticError.class)
  	//public void NoDataDecl(){
  	//	runTest("f(1) := 1;");
  	//}
  	
  	//
  	// The following test requires deeper analysis of the data signature
  	///
  	//@Ignore @Test(expected=StaticError.class)
  	//public void descendantWrongType(){
  	//	prepare("data F = f(F left, F right) | g(int N);");
  	//	public test bool assertTrue() = /true := f(g(1),f(g(2),g(3)));
  	//}
  	
  	////	@Ignore @Test(expected=StaticError.class)
  ////	public void recursiveDataTypeNoPossibleMatchVertical() {
  ////		prepare("data Bool = and(Bool, Bool) | t();");
  ////		runTestInSameEvaluator("t := and(t,t);");
  ////	}
  
   // @expected{UndefinedType} Doesn't work
  //	public void typedVariableBecomesWrongType(){
  //		public test bool assertTrue() {str N : 3 := 3; return false;}
  //	}
  	
  //	@Test
  //	public void redeclaredTypedVariableBecomesShadowsAnother(){
  		/*TC*/ //public test bool redeclaredTypedVariableBecomesShadowsAnother1() {int N = 5; return int N : 3 := 3 && N == 3;}
  //	}
  	
  	//@Ignore("we can't find this bug anymore due to pattern dispatch") @Test(expected=StaticError.class)
  	//public void doubleTypedVariableBecomes(){
  	//	public test bool assertTrue() {{[int N : 3, int N : 4] := [3,4] && N == 3;}}
  	//}
  	
  	
  	public test bool matchListExternalVar1() {
  		list[int] S; return [1, *S, 2] !:= [1,2,3] && S != [3];
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
  
 
  
  