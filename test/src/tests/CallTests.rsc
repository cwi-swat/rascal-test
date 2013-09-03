module tests::CallTests
	
	
@expected{UndeclaredVariable}
// callError1
		public test bool  q() {zap(1,2);return false;}
/*	

// qualifiedNameType
		prepareModule("M", "module M\n" +
		         "data X = x();");

		prepareMore("import M;");
		prepareMore("M::X f() { return x(); }");
		assertTrue(runTestInSameEvaluator("f() == x();"));
	}
*/	
@expected{ArgumentsMismatch}
// callError2
	public test bool q() {
	     int f(int n) {return 2*n;}  
	     f("abc");
	     return false;
	     }

	
@expected{UndeclaredModule}
// callError3
		public test bool  q() {zip::zap(1,2);return false;}
	

@expected{UnsupportedOperation}
// callError4 
		public test bool  q() {zap = 10; zap(1,2);return false;}


@expected{UnexpectedType}
// callError5
		public test bool  q() {int f(){return "a";} f();return false;}

	
@expected{MissingReturn}
// callError6
		public test bool  q() { int f(){ } f();return false;}

/*	
	@Ignore("can't check this anymore due to pattern dispatch") @expected{StaticError.}
	public void callError7() {
		public test bool  q() {{ int f(int n) {return "a";}  int f(value v) {return "a";} }");
	}
*/
	
@expected{UndeclaredVariable}
// callError8() 
	public test bool  q() {int f(int n) {return n;} f(undef);return false;}

	
	
//	public void voidFun() {
		public test bool q() {void f(){ } f(); return true;}
//	}

// public void fac() {
//		String fac = "int fac(int n){ return (n <= 0) ? 1 : (n * fac(n - 1));}";
		
		public test bool  q() {
		     int fac(int n){ return (n <= 0) ? 1 : (n * fac(n - 1));}
		     return fac(0) == 1 && fac(1)==1 && fac(2)== 2 && 
		       fac(3)==6 && fac(4)==24;
		     }
	

        int facQ(int n)  { 
           if(n == 0) { return 1;} 
           int z = facQ(n-1); return z*n; 
           }

//	 public void facNotTailRec() {
		public test bool  q() {
		      return facQ(0) == 1 && facQ(1)==1 && facQ(2)== 2 && 
		       facQ(3)==6 && facQ(4)==24;	      
		      }
	
		
/*
	
	 public void formalsAreLocal() {
		
		String fac = "int fac(int n) { if (n == 0) { return 1; } int z = n; int m = fac(n - 1); return z * m; }";
		// "m" used to be "n", but now we forbid redeclarations.
		
		assertTrue(public test bool  q() {{" + fac + " fac(0) == 1;}"));
		assertTrue(public test bool  q() {{" + fac + " fac(1) == 1;}"));
		assertTrue(public test bool  q() {{" + fac + " fac(2) == 2;}"));
		assertTrue(public test bool  q() {{" + fac + " fac(3) == 6;}"));
		assertTrue(public test bool  q() {{" + fac + " fac(4) == 24;}"));
	}
*/	
//	 public void higherOrder() {
		
        public test bool  q() {
          int add(int a, int b) { return a + b; };
          int doSomething(int (int a, int b) F) { return F(1,2); }; 
          int sub(int a, int b) { return a - b; }
          if (doSomething(add) != 3) return false;
          if (doSomething(sub) != -1) return false;
          return true;
		}
		
// }
	
//  public void closures() {
		public test bool  q() {
		    int x = 1;
		    int f(int (int i) g, int j) { return g(j);}
		if (f(int (int i) { return i + 1; }, 0) != 1) return false;
	    if (f(int (int i) { x = x * 2; return i + x; }, 1) != 3 || (x != 2))
	       return false;
	    return true;
	    }
//	}

/*	
	 public void closuresVariables() {
		prepareModule("M", "module M\n" +
		         "bool() x = bool() { return false; } ;\n" +
		         "public void changeX(bool() newX) { x = newX; }\n" +
		         "public bool getX() = x();");

		prepareMore("import M;");
		assertFalse(runTestInSameEvaluator("getX();"));
		prepareMore("changeX(bool() { return true; });");
		assertTrue(runTestInSameEvaluator("getX();"));
	}
	
	 public void varArgs() {
		
		String add0 = "int add(int i...) { return 0; }";
		String add1 = "int add(int i...) { return i[0]; }";
		String add2 = "int add(int i, int j...) { return i + j[0]; }";
		
		assertTrue(public test bool  q() {{" + add0 + " add() == 0; }"));
		assertTrue(public test bool  q() {{" + add0 + " add([]) == 0; }"));
		assertTrue(public test bool  q() {{" + add0 + " add(0) == 0; }"));
		assertTrue(public test bool  q() {{" + add0 + " add([0]) == 0; }"));
		assertTrue(public test bool  q() {{" + add0 + " add(0,1,2) == 0; }"));
		assertTrue(public test bool  q() {{" + add0 + " add([0,1,2]) == 0; }"));
		
		assertTrue(public test bool  q() {{" + add1 + " add(0) == 0; }"));
		assertTrue(public test bool  q() {{" + add1 + " add([0]) == 0; }"));
		assertTrue(public test bool  q() {{" + add1 + " add(0,1,2) == 0; }"));
		assertTrue(public test bool  q() {{" + add1 + " add([0,1,2]) == 0; }"));
		
		assertTrue(public test bool  q() {{" + add2 + " add(1,2) == 3; }"));
		assertTrue(public test bool  q() {{" + add2 + " add(1,[2]) == 3; }"));
		assertTrue(public test bool  q() {{" + add2 + " add(1,2,3) == 3; }"));
		assertTrue(public test bool  q() {{" + add2 + " add(1,[2,3]) == 3; }"));
	}
*/	

// public void sideEffect() {
		
		
		public test bool  q() {
		     void One() { called = called + 1; return; }
		     int called = 0;  
		     One(); 
		     One(); 
		     One(); 
		     return called == 3;
		     }
// }
	
// public void max1() {
		public test bool  q() { 
		    int max(int a, int b) { return a > b ? a : b; } 
		    return max(3,4) == 4;
		    }
		public test bool  q() { 
		    int max(int a, int b) { return a > b ? a : b; } 
		    real max(real a, real b) { return a > b ? a : b; }
		    return max(3,4) == 4 && max(3.0,4.0) == 4.0;
		    }
		    
		public test bool  q() { 
		    int max(int a, int b) { return a > b ? a : b; } 
		    real max(real a, real b) { return a > b ? a : b; }
		    &T max(&T a, &T b) { return a > b ? a : b; }
		    return max(3,4) == 4 && max(3.0,4.0) == 4.0
		    && max("abc","def")=="def";
		    }
		
//	}
	

/*	
	 public void ident() {
		
		String ident = "&T ident(&T x){ return x; }";
		assertTrue(public test bool  q() {{" + ident + " ident(true) == true;}"));
		assertTrue(public test bool  q() {{" + ident + " ident(4) == 4;}"));
		assertTrue(public test bool  q() {{" + ident + " ident(4.5) == 4.5;}"));
		assertTrue(public test bool  q() {{" + ident + " ident("abc") == "abc";}"));
//		assertTrue(public test bool  q() {{" + ident + " ident(f(1)) == f(1);}"));
		assertTrue(public test bool  q() {{" + ident + " ident([1,2,3]) == [1,2,3];}"));
		assertTrue(public test bool  q() {{" + ident + " ident({1,2,3}) == {1,2,3};}"));
		assertTrue(public test bool  q() {{" + ident + " ident((1:10,2:20,3:30)) == (1:10,2:20,3:30);}"));
	}
	
	 public void map() {
		
		String put = "map[&K,&V] put(map[&K,&V] m, &K k, &V v) { m[k] = v; return m; }";
		
		assertTrue(public test bool  q() {{" + put + " put((),1,"1") == (1:"1"); }"));
	}
	
	@Ignore
	 public void add() {
		
		String add = "list[&T] java add(&T elm, list[&T] lst) { return lst.insert(elm); }";
		
		assertTrue(public test bool  q() {{" + add + " add(1, [2,3]) == [1,2,3];}"));
		assertTrue(public test bool  q() {{" + add + " add("a", ["b","c"]) == ["a","b", "c"];}"));
	}
	
	@Ignore
	 public void putAt() {
		
		String putAt = "list[&T] java putAt(&T elm, int n, list[&T] lst){return lst.put(n.intValue(), elm);}";
		
		assertTrue(public test bool  q() {{" + putAt + " putAt(1, 0, [2,3]) == [1,3];}"));
	}
*/

data X = x() | y() | z();	
//	 public void dispatchTest1() {
public test bool  q() { 
		public int f(x()) = 1;
		public int f(y()) = 2;
		public int f(z()) = 3;
		return [f(x()),f(y()),f(z())] == [1,2,3];
	}
// }
/*	
	 public void dispatchTest2() {
		prepare("data X = x() | y() | z();");
		prepareMore("public int f(x()) = 1;");
		prepareMore("public int f(y()) = 2;");
		prepareMore("public int f(z()) = 3;");
		prepareMore("public default int f(int x) = x;");

		assertTrue(runTestInSameEvaluator("[f(x()),f(y()),f(z()),f(4)] == [1,2,3,4]"));
	}
	@Ignore
	 public void dispatchTest3() {
		prepare("syntax X = "x" | "y" | "z";");
		prepareMore("public int f((X) `x`) = 1;");
		prepareMore("public int f((X) `y`) = 2;");
		prepareMore("public int f((X) `z`) = 3;");

		assertTrue(runTestInSameEvaluator("[f(`x`),f(`y`),f(`z`)] == [1,2,3]"));
	}
	
	 public void keywordTest1(){
		prepare("int incr(int x, int delta=1) = x + delta;");
		assertTrue(runTestInSameEvaluator("incr(3) == 4;"));
		assertTrue(runTestInSameEvaluator("incr(3, delta=2) == 5;"));
	}
	
	 public void keywordTest2(){
		prepare("int sum(int x = 0, int y = 0) = x + y;");
		assertTrue(runTestInSameEvaluator("sum() == 0;"));
		assertTrue(runTestInSameEvaluator("sum(x=5, y=7) == 5 + 7;"));
		assertTrue(runTestInSameEvaluator("sum(y=7, x=5) == 5 + 7;"));
	}
	
	 public void keywordTest3(){
		prepare("list[int] varargs(int x, int y ..., int z = 0, str q = "a") = y;");
		assertTrue(runTestInSameEvaluator("varargs(1,2,3,4) == [2,3,4];"));
		assertTrue(runTestInSameEvaluator("varargs(1,2,3,4,q="b") == [2,3,4];"));
		assertTrue(runTestInSameEvaluator("varargs(1,2,3,4,z=5) == [2,3,4];"));
		assertTrue(runTestInSameEvaluator("varargs(1,2,3,4,q="b",z=5) == [2,3,4];"));
	}
	
	 public void keywordTest4(){
		prepare("data Figure (real shrink = 1.0, str fillColor = "white", str lineColor = "black")  =  emptyFigure() | ellipse(Figure inner = emptyFigure()) | box(Figure inner = emptyFigure());");
		
		assertTrue(runTestInSameEvaluator("emptyFigure().fillColor == "white";"));
		assertTrue(runTestInSameEvaluator("emptyFigure(shrink=0.5).fillColor == "white";"));
		assertTrue(runTestInSameEvaluator("emptyFigure(lineColor="red").fillColor == "white";"));
		assertTrue(runTestInSameEvaluator("emptyFigure(lineColor="red", shrink=0.5).fillColor == "white";"));
		
		assertTrue(runTestInSameEvaluator("emptyFigure(fillColor="red").fillColor == "red";"));
		assertTrue(runTestInSameEvaluator("emptyFigure(shrink=0.5,fillColor="red").fillColor == "red";"));
		assertTrue(runTestInSameEvaluator("emptyFigure(shrink=0.5,fillColor="red", lineColor="black").fillColor == "red";"));
		assertTrue(runTestInSameEvaluator("emptyFigure(lineColor="red", shrink=0.5).fillColor == "white";"));
		
		assertTrue(runTestInSameEvaluator("ellipse().fillColor == "white";"));
		assertTrue(runTestInSameEvaluator("ellipse(inner=emptyFigure(fillColor="red")).fillColor == "white";"));
		assertTrue(runTestInSameEvaluator("ellipse(inner=emptyFigure(fillColor="red")).inner.fillColor == "red";"));
	}
	
	@expected{ArgumentsMismatch.}
	public void keywordError1() {
		prepare("int incr(int x, int delta=1) = x + delta;");
		runTestInSameEvaluator("incr(delta=3);");
	}
	
	@expected{ArgumentsMismatch.}
	public void keywordError2() {
		prepare("int incr(int x, int delta=1) = x + delta;");
		runTestInSameEvaluator("incr(1, 3);");
	}
	
	@expected{UnexpectedKeywordArgumentType.}
	public void keywordError3() {
		prepare("int incr(int x, int delta=1) = x + delta;");
		runTestInSameEvaluator("incr(3, delta="a");");
	}
	
	@expected{UndeclaredKeywordParameter.}
	public void keywordError4() {
		prepare("int incr(int x, int delta=1) = x + delta;");
		runTestInSameEvaluator("incr(3, d=5);");
	}
	
	@expected{NoKeywordParameters.}
	public void keywordError5() {
		prepare("int add1(int x) = x + 1;");
		runTestInSameEvaluator("add1(3, delta=5);");
	}
	
	@expected{ArgumentsMismatch.}
	public void keywordInConstructorError1() {
		prepare("data D = d(int x, int y = 3);");
		runTestInSameEvaluator("d();");
	}
	
	@expected{ArgumentsMismatch.}
	public void keywordInConstructorError2() {
		prepare("data D = d(int x, int y = 3);");
		runTestInSameEvaluator("d(y=4);");
	}
	
	@expected{ArgumentsMismatch.}
	public void keywordInConstructorError3() {
		prepare("data D = d(int x, int y = 3);");
		runTestInSameEvaluator("d(1, 4);");
	}
	
	@expected{ArgumentsMismatch.}
	public void keywordInConstructorError4() {
		prepare("data D = d(int x, int y = 3);");
		runTestInSameEvaluator("d(1, y="a");");
	}
	
	@expected{UndeclaredKeywordParameter.}
	public void keywordInConstructorError5() {
		prepare("data D = d(int x, int y = 3);");
		runTestInSameEvaluator("d(1, z=4);");
	}
	
	@expected{NoKeywordParameters.}
	public void keywordInConstructorError6() {
		prepare("data D = d(int x);");
		runTestInSameEvaluator("d(1, y=4);");
	}
	
	
	public void keywordMatchTest1(){
		prepare("data POINT = point(int x, int y, str color = "red");");
		
		assertTrue(runTestInSameEvaluator("point(_,_,_) !:= point(1,2);"));
		assertTrue(runTestInSameEvaluator("point(_,_,"red") !:= point(1,2);"));
		assertTrue(runTestInSameEvaluator("point(_,_,"green") !:= point(1,2, color="green");"));
		assertTrue(runTestInSameEvaluator("point(_,_,color="green") := point(1,2, color="green");"));
		assertTrue(runTestInSameEvaluator("point(1,2) := point(1,2);"));
		assertTrue(runTestInSameEvaluator("point(1,2) !:= point(1,3);"));
		assertTrue(runTestInSameEvaluator("point(1,2) := point(1,2,color="red");"));
		assertTrue(runTestInSameEvaluator("point(1,2,color="red") := point(1,2,color="red");"));
		assertTrue(runTestInSameEvaluator("point(1,2,color="green") !:= point(1,2);"));
		assertTrue(runTestInSameEvaluator("point(1,2,color="green") !:= point(1,2);"));
	}
	
	public void keywordMatchTest2(){
		prepare("data POINT = point(int x, int y, int z = 3, list[str] colors = []);");
		
		assertTrue(runTestInSameEvaluator("point(_, _, colors=["blue"]) := point(1,2, colors=["blue"]);"));
		assertTrue(runTestInSameEvaluator("point(_, _, colors=[*_,"blue",*_]) := point(1,2, colors=["red","green","blue"]);"));
		assertTrue(runTestInSameEvaluator("point(_, _, colors=[*_,*X,*_,*X, *_]) := point(1,2, colors=["red","blue","green","blue"]);"));
	}
	
	
*/

