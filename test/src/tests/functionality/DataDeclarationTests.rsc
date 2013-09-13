module tests::functionality::DataDeclarationTests
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


data Bool = btrue() | bfalse() | band(Bool left, Bool right) | bor(Bool left, Bool right);
data Exp = let(str name, Exp exp1, Exp exp2) | var(str name) | \int(int intVal);
data Exp1[&T] = tval(&T tval) | tval2(&T tval1, &T tval2) | ival(int x);
alias Var2 = str;
data Exp2 = let(Var2 var, Exp2 exp1, Exp2 exp2) | var2(Var2 var) | \int2(int intVal);
data Maybe[&T] = None() | Some(&T t);
// data D = d() | d();


//	public void bool() {
		public test bool assertTrue() {Bool b = btrue(); return b == Bool::btrue();}
		public test bool assertTrue() {Bool b = bfalse(); return b == Bool::bfalse();}
		public test bool assertTrue() {Bool b = band(btrue(),bfalse());  return b == Bool::band(Bool::btrue(),Bool::bfalse());}
		public test bool assertTrue() {Bool b = bor(btrue(),bfalse()); return b == bor(btrue(),bfalse());}
		public test bool assertTrue() = band(btrue(),bfalse()).left == btrue();
		public test bool assertTrue() = band(btrue(),bfalse()).right == bfalse();
		public test bool assertTrue() = bor(btrue(),bfalse()).left == btrue();
		public test bool assertTrue() = bor(btrue(),bfalse()).right == bfalse();
		public test bool assertTrue() {Bool b = band(btrue(),bfalse()).left; return b == btrue();}
		public test bool assertTrue() {Bool b = band(btrue(),bfalse()).right; return b == bfalse();}
//	}

	@expected{UninitializedVariable}
	public test bool UndefinedValue(){
		Bool b; b.left; return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UnitializedVariable1(){
		Bool b; b.left = btrue(); return false;
	}
	
//	@Test  public void boolFieldUpdate() {
		 public test bool assertTrue() {
		 Bool b = bor(btrue(),bfalse()); return b[left=bfalse()] == bor(bfalse(),bfalse());
		 }
		public test bool assertTrue() {Bool b = bor(btrue(),bfalse()); return b[right=btrue()] == bor(btrue(),btrue());}
		public test bool assertTrue() {Bool b = bor(btrue(),bfalse());  b.left=bfalse();return b == bor(bfalse(),bfalse());}
		public test bool assertTrue() {Bool b = bor(btrue(),bfalse());b.right=btrue();  return b == bor(btrue(),btrue());}
		public test bool assertTrue() {Bool b = bor(bfalse(),bfalse()); b.left=btrue(); b.right=btrue(); return b == bor(btrue(),btrue());}
//	}
	
	@expected{UninitializedVariable}
	public test bool UnitializedVariable2() {
		Bool b; b[left = btrue()]; return false;
	}

//	@Test
//	public void let1() {
		public test bool assertTrue() {Exp e = \int(1); return e == \int(1);}
		public test bool assertTrue() {Exp e = var("a"); return e == var("a");}
		public test bool assertTrue() {Exp e = let("a",\int(1),var("a")); return e ==  let("a",\int(1),var("a"));}
//	}
	
//	@Test
//	public void parameterized() {
//		public test bool assertTrue() {a = tval(1); a == tval(1);}
//		assertTrue(runTestInSameEvaluator("{b = tval("abc"); b == tval("abc");}
//		assertTrue(runTestInSameEvaluator("{c = {tval("abc")}; c == {tval("abc")};}"));
		
		public test bool assertTrue() {Exp1[int] e = tval(1); return e == tval(1);}
		public test bool assertTrue(){Exp1[str] f = tval("abc"); return f == tval("abc");}
		public test bool assertTrue() {set[Exp1[value]] g = {tval(1),tval("abc")}; return g == {tval(1), tval("abc")};}
		
		// if the parameter is not bound by a constructor, the instantiated type equals the bound of the parameter, 
		// any smaller types, like Exp1[int] would result in a type error
		public test bool assertTrue() {a = tval(1); return a == tval(1);}
//		assertTrue(runTestInSameEvaluator("{b = tval(\"abc\"); b == tval(\"abc\");}"));
//		assertTrue(runTestInSameEvaluator("{c = {tval(\"abc\")}; c == {tval(\"abc\")};}"));
		
		public test bool assertTrue() {Exp1[int] e = tval(1); return e == tval(1);}
		public test bool assertTrue(){Exp1[str] f = tval("abc"); return f == tval("abc");}
		public test bool assertTrue() {set[Exp1[value]] g = {tval(1),tval("abc")}; return g == {tval(1), tval("abc")};}
		
		// if the parameter is not bound by a constructor, the instantiated type equals the bound of the parameter, 
		// any smaller types, like Exp1[int] would result in a type error
		public test bool assertTrue() {Exp1[value] h = ival(3); return h == ival(3);}
		
		public test bool assertTrue(){j = tval2("abc", "def"); return j == tval2("abc", "def");}
		public test bool assertTrue(){k = tval2("abc", "def"); return k.tval1 == "abc";}
		public test bool assertTrue(){l = tval2("abc", "def"); return l.tval2 == "def";}
		public test bool assertTrue(){m = tval2("abc", "def"); str s2 = m.tval2; return s2 == "def";}	
		public test bool assertTrue() {Exp1[value] h = ival(3); return h == ival(3);}
		
		public test bool assertTrue(){j = tval2("abc", "def"); return j == tval2("abc", "def");}
		public test bool assertTrue(){k = tval2("abc", "def"); return k.tval1 == "abc";}
		public test bool assertTrue(){l = tval2("abc", "def"); return l.tval2 == "def";}
		public test bool assertTrue(){m = tval2("abc", "def"); str s2 = m.tval2; return s2 == "def";}	
//	}

// public void parameterizedErrorTest() {
//	prepare("data Exp[&T] = tval(&T tval) | tval2(&T tval1, &T tval2) | ival(int x);");
		public test bool assertTrue() {Exp1[int] h = ival(3); return h == ival(3);}
//	}

//	public void unboundTypeVar() {
		public test bool assertTrue() { Maybe[void] x = None(); return x == None();}
		public test bool assertTrue() { x = None(); x = Some(0); return x == Some(0);}
//	}
	
	public test bool unequalParameterType(){
		Exp1[value] x = tval2(3, "abc"); return true;
	}
	
	
@expected{UnexpectedType}
public test bool letWrongTypeViaAlias(){	
		Var2 varx !:= let("a",\int(1),var("a")); return false;
	}

// @Test public void let2() {
		public test bool assertTrue() {Exp2 e = \int2(1); return e == \int2(1);}
		public test bool assertTrue(){Exp2 e = var2("a"); return e == var2("a");}
		public test bool assertTrue(){Exp2 e = let("a",\int2(1),var2("a")); return e ==  let("a",\int2(1),var2("a"));}
		public test bool assertTrue()=Var2 var2 := "a";
//	}
	
	@expected{NoSuchField} 
//	public void boolError() {	
		public test bool assertTrue() {Bool b = btrue(); return b.left == btrue();}
//	}

// Not possible to do local data definitions	
//	public void exactDoubleFieldIsAllowed()  {
//		assertTrue(true);
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
	//	assertTrue(true);
	//}
	//
	//@expected{s}
	//public void undeclaredTypeError1() throws UndeclaredField {
	//	runTest("data D = anE(E e);");
	//}

