module tests::functionality::DataDeclarationTCTests

data Bool = btrue() | bfalse() | band(Bool left, Bool right) | bor(Bool left, Bool right);
  data Exp = let(str name, Exp exp1, Exp exp2) | var(str name) | \int(int intVal);
  data Exp1[&T] = tval(&T tval) | tval2(&T tval1, &T tval2) | ival(int x);
  alias Var2 = str;
  data Exp2 = let(Var2 var, Exp2 exp1, Exp2 exp2) | var2(Var2 var) | \int2(int intVal);
  data Maybe[&T] = None() | Some(&T t);

@expected{UninitializedVariable}
  	public test bool UndefinedValue1(){
  		Bool b; b.left; return false;
  	}
  	
 @expected{UninitializedVariable}
  	public test bool UnitializedVariable11(){
  		Bool b; b.left = btrue(); return false;
  	}
  	
  	
 @expected{UninitializedVariable}
  	public test bool UnitializedVariable21() {
  		Bool b; b[left = btrue()]; return false;
  	}
  	
 @expected{UnexpectedType}
  public test bool letWrongTypeViaAlias1(){	
  		Var2 varx !:= let("a",\int(1),var("a")); return false;
  	}
  	
  @expected{NoSuchField} 
  //	public void boolError() {	
  		public test bool boolFieldUpdate6() {Bool b = btrue(); return b.left == btrue();}
  //	}
  
    // Not possible to do local data definitions	
  //	public void exactDoubleFieldIsAllowed()  {
  //		boolFieldUpdate(true);
  //	}
  //	
  //	@expected{s}
  //public test bool doubleFieldError2()  {
  //		 return true;
  //	}
  	
  	//@expected{s}
  	//public void doubleFieldError3() throws StaticError {
  	//	runTest("data D = d(int n) | d(int v);");
  	//}
  	//
  	//@expected{s}
  	//public void doubleFieldError4() throws StaticError {
  	//	prepare("alias INTEGER = int;");
  	//	runTest("data D = d(int n) | d(INTEGER v);");
  	//}
  	//
  	//public void exactDoubleDataDeclarationIsAllowed() throws StaticError {
  	//	prepare("data D = d(int n) | e;");
  	//	runTestInSameEvaluator("data D = d(int n);");
  	//	boolFieldUpdate(true);
  	//}
  	//
  	//@expected{s}
  	//public void undeclaredTypeError1() throws UndeclaredField {
  	//	runTest("data D = anE(E e);");
  	//}
  
 