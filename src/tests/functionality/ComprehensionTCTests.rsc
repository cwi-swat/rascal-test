module tests::functionality::ComprehensionTCTests

@expected{UnexpectedType}
  //	public void testGen1() {
  		public test bool testGen1() {{x | 5};return false;}
  //	}
  	
  @expected{UnexpectedType}
  //	public void testVoidFunctionPredicate() {
  		public test bool testVoidFunctionPredicate1() { void f() { } { x | int x <- {1,2,3}, f() };return false;}
  //	}
  
  @expected{UndeclaredVariable}
  //	public void testUndefinedValue() {
  		public test bool testUndefinedValue1() {{ y | int x <- {1,2,3}};return false;}
  //	}
  	
  @expected{UnexpectedType}
  //	public void WrongStrategyError1(){
  //		public bool WrongStrategyError() {innermost int X <- {1,2,3};return false;}
  //	}
  //	
  @expected{UnexpectedType}
  //	public void WrongStrategyError2(){
  //		public bool WrongStrategyError() {outermost int X <- {1,2,3};return false;}
  //	}
  //	
  @expected{UnexpectedType}
  //	public void WrongStrategyError3(){
  //		public bool WrongStrategyError() {bottom-up-break int X <- {1,2,3};return false;}
  //	}
  //	
  //	@expected{UnexpectedType}
  //	public void WrongStrategyError4(){
  //		public bool q() {top-down-break int X <- {1,2,3};return false;}
  //	}
  
  
  @expected{UnexpectedType}
  //	public void WrongListType(){
  		public test bool WrongListType1() {str S <- [1,2,3];return false;}
  //	}
  	
  @expected{UnexpectedType}
  //	public void WrongSetType(){
  		public test bool WrongSetType1() {str S <- {1,2,3};return false;}
  //	}
  	
  @expected{UnexpectedType}
  //	public void WrongMapType(){
  		public test bool WrongMapType1() {str S <- (1:10,2:20);return false;}
  //	}
  	
  @expected{NotEnumerable}
  //	public void WrongStringType(){
  		public test bool wrongStringType() = int N <- "abc";
  //	}
  /*
  //	@expected{UnexpectedType}
  	public void WrongADTType1(){
  		prepare("data Bool = btrue() | bfalse() | band(Bool lhs, Bool rhs) | bor(Bool lhs, Bool rhs);");
  		public bool q2() {int N <- [true, true, false];return false;}
  //	}
  
  
  */
  
   //	@expected{UnexpectedType}
  //	public void nodeGeneratorTypeError(){
  //		prepare("data TREE = i(int N) | f(TREE a,TREE b) | g(TREE a, TREE b);");
  //		public test bool nodeGeneratorTypeError() = [N | int N <- f(i(1),g(i(2),i(3)))] == [];
  //	}
  
  @expected{UnexpectedType}
  	// public void anyError() {
  		public test bool anyError() {any(x <- [1,2,3], "abc");return false;}
  	// }
  	
  		@expected{UndeclaredVariable}
  //	public void noLeaking() {
  		public test bool noLeaking1()  {{ X | int X <- [1,2,3] }; X == 3; }
  //	}
  	
  	@expected{UnexpectedType}
  //	public void allError() {
  		public test bool allError1()  {all(x <- [1,2,3], "abc");}
  //	}
  
  @expected{UndeclaredVariable}
  //	public void NoLeakFromNextGenerator1(){
  		public test bool NoLeakFromNextGenerator1()  = [<N,M> | int N <- [1 .. 3], ((N==1) ? true : M > 0), int M <- [10 .. 12]] == [<1,10>,<1,11>,<2,10><2,11>];
  //	}
  	
  @expected{UndeclaredVariable}
  //	public void NoLeakFromNextGenerator2(){
  		public test bool NoLeakFromNextGenerator2()  = [<N,M> | int N <- [1 .. 3], ((N==1) ? true : M > 0), int M := N] == [<1,1>,<2,2>];
  //	}
  
   //	@Test public void emptyTupleGeneratorError1(){
  		public test bool emptyTupleGeneratorError1()  = {<X,Y> | <int X, int Y> <- {}} == {} ;
  //	}
  	
  //	@Test public void emptyTupleGeneratorError2(){
  		public test bool emptyTupleGeneratorError2()  = {<X,Y> | <int X, int Y> <- []} == {} ;
  //	}
  	
  //	@Test public void emptyTupleGeneratorError3(){
  		public test bool emptyTupleGeneratorError3()  = {<X,Y> | int X <- {}, int Y <- {}} == {};
  //	}
  	
  //	@Test public void emptyTupleGeneratorError4(){
  		public test bool emptyTupleGeneratorError4()  = {<X,Y> | int X <- [], int Y <- []} == {};
  //	}