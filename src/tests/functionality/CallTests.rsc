 module tests::functionality::CallTests
  	
  	
  @expected{UndeclaredVariable}
  // callError1
  		public test bool  assertTrue1() {zap(1,2);return false;}
  /*	
  
  // qualifiedNameType
  		prepareModule("M", "module M\n" +
  		         "data X = x();");
  
  		prepareMore("import M;");
  		prepareMore("M::X f() { return x(); }");
  		runTestInSameEvaluator("f() == x();"));
  	}
  */	
  @expected{ArgumentsMismatch}
  // callError2
  	public test bool assertTrue2() {
  	     int f(int n) {return 2*n;}  
  	     f("abc");
  	     return false;
  	     }
  
  	
  @expected{UndeclaredModule}
  // callError3
  		public test bool  assertTrue3() {zip::zap(1,2);return false;}
  	
  
  @expected{UnsupportedOperation}
  // callError4 
  		public test bool  assertTrue4() {zap = 10; zap(1,2);return false;}
  
  
  @expected{UnexpectedType}
  // callError5
  		public test bool  assertTrue5() {int f(){return "a";} f();return false;}
  
  	
  @expected{MissingReturn}
  // callError6
  		public test bool  assertTrue6() { int f(){ } f();return false;}
  
  /*	
  	@Ignore("can't check this anymore due to pattern dispatch") @expected{StaticError.}
  	public void callError71() {
  		public test bool  assertTrue7() {{ int f(int n) {return "a";}  int f(value v) {return "a";} }");
  	}
  */
  	
  @expected{UndeclaredVariable}
  // callError8() 
  	public test bool  assertTrue8() {int f(int n) {return n;} f(undef);return false;}
  
  	
  	
  //	public void voidFun() {
  		public test bool assertTrue9() {void f(){ } f(); return true;}
  //	}
  
  // public void fac() {
  //		String fac = "int fac(int n){ return (n <= 0) ? 1 : (n * fac(n - 1));}";
  		
  		public test bool  assertTrue10() {
  		     int fac(int n){ return (n <= 0) ? 1 : (n * fac(n - 1));}
  		     return fac(0) == 1 && fac(1)==1 && fac(2)== 2 && 
  		       fac(3)==6 && fac(4)==24;
  		     }
  	
  
          int facQ(int n)  { 
             if(n == 0) { return 1;} 
             int z = facQ(n-1); return z*n; 
             }
  
  //	 public void facNotTailRec() {
  		public test bool  assertTrue11() {
  		      return facQ(0) == 1 && facQ(1)==1 && facQ(2)== 2 && 
  		       facQ(3)==6 && facQ(4)==24;	      
  		      }
  	
  		
  /*
  	
  	 public void formalsAreLocal1() {
  		
  		String fac = "int fac(int n) { if (n == 0) { return 1; } int z = n; int m = fac(n - 1); return z * m; }";
  		// "m" used to be "n", but now we forbid redeclarations.
  		
  		public test bool  assertTrue12() {{" + fac + " fac(0) == 1;}"));
  		public test bool  assertTrue13() {{" + fac + " fac(1) == 1;}"));
  		public test bool  assertTrue14() {{" + fac + " fac(2) == 2;}"));
  		public test bool  assertTrue15() {{" + fac + " fac(3) == 6;}"));
  		public test bool  assertTrue16() {{" + fac + " fac(4) == 24;}"));
  	}
  */	
  //	 public void higherOrder() {
  		
          public test bool  higherOrder1() {
            int add(int a, int b) { return a + b; };
            int doSomething(int (int a, int b) F) { return F(1,2); }; 
            int sub(int a, int b) { return a - b; }
            if (doSomething(add) != 3) return false;
            if (doSomething(sub) != -1) return false;
            return true;
  		}
  		
  // }
  	
  //  public void closures() {
  		public test bool  closures1() {
  		    int x = 1;
  		    int f(int (int i) g, int j) { return g(j);}
  		if (f(int (int i) { return i + 1; }, 0) != 1) return false;
  	    if (f(int (int i) { x = x * 2; return i + x; }, 1) != 3 || (x != 2))
  	       return false;
  	    return true;
  	    }
  //	}
  
  /*	
  	 public void closuresVariables1() {
  		prepareModule("M", "module M\n" +
  		         "bool() x = bool() { return false; } ;\n" +
  		         "public void changeX(bool() newX) { x = newX; }\n" +
  		         "public bool getX() = x();");
  
  		prepareMore("import M;");
  		assertFalse(runTestInSameEvaluator("getX();"));
  		prepareMore("changeX(bool() { return true; });");
  		runTestInSameEvaluator("getX();"));
  	}
  	
  	 public void varArgs1() {
  		
  		String add0 = "int add(int i...) { return 0; }";
  		String add1 = "int add(int i...) { return i[0]; }";
  		String add2 = "int add(int i, int j...) { return i + j[0]; }";
  		
  		public test bool  assertTrue17() {{" + add0 + " add() == 0; }"));
  		public test bool  assertTrue18() {{" + add0 + " add([]) == 0; }"));
  		public test bool  assertTrue19() {{" + add0 + " add(0) == 0; }"));
  		public test bool  assertTrue20() {{" + add0 + " add([0]) == 0; }"));
  		public test bool  assertTrue21() {{" + add0 + " add(0,1,2) == 0; }"));
  		public test bool  assertTrue22() {{" + add0 + " add([0,1,2]) == 0; }"));
  		
  		public test bool  assertTrue23() {{" + add1 + " add(0) == 0; }"));
  		public test bool  assertTrue24() {{" + add1 + " add([0]) == 0; }"));
  		public test bool  assertTrue25() {{" + add1 + " add(0,1,2) == 0; }"));
  		public test bool  assertTrue26() {{" + add1 + " add([0,1,2]) == 0; }"));
  		
  		public test bool  assertTrue27() {{" + add2 + " add(1,2) == 3; }"));
  		public test bool  assertTrue28() {{" + add2 + " add(1,[2]) == 3; }"));
  		public test bool  assertTrue29() {{" + add2 + " add(1,2,3) == 3; }"));
  		public test bool  assertTrue30() {{" + add2 + " add(1,[2,3]) == 3; }"));
  	}
  */	
  
  // public void sideEffect() {
  		
  		
  		public test bool  sideEffect1() {
  		     void One() { called = called + 1; return; }
  		     int called = 0;  
  		     One(); 
  		     One(); 
  		     One(); 
  		     return called == 3;
  		     }
  // }
  	
  // public void max1() {
  		public test bool  max1() { 
  		    int max(int a, int b) { return a > b ? a : b; } 
  		    return max(3,4) == 4;
  		    }
  		public test bool max2() { 
  		    int max(int a, int b) { return a > b ? a : b; } 
  		    real max(real a, real b) { return a > b ? a : b; }
  		    return max(3,4) == 4 && max(3.0,4.0) == 4.0;
  		    }
  		    
  		public test bool max3() { 
  		    int max(int a, int b) { return a > b ? a : b; } 
  		    real max(real a, real b) { return a > b ? a : b; }
  		    &T max(&T a, &T b) { return a > b ? a : b; }
  		    return max(3,4) == 4 && max(3.0,4.0) == 4.0
  		    && max("abc","def")=="def";
  		    }
  		
  //	}
  	
  //	 public void ident() {
  		
  		 public test bool  ident1() {
  		             &T ident(&T x){ return x; }
  		            return ident(true) == true;
  		            }        
  		 public test bool  ident2() {
  		             &T ident(&T x){ return x; }
  		            return ident(4) == 4;
  		            }
  		 public test bool  ident3() {
  		             &T ident(&T x){ return x; }
  		            return ident(4.5) == 4.5;
  		            }
  		 public test bool  ident4() {
  		             &T ident(&T x){ return x; }
  		            return ident("abc") == "abc";
  		            }
  		 // public test bool  ident() {
  		 //            &T ident(&T x){ return x; }
  		  //          return ident(f(1)) == f(1);
  		 //          }
  		 public test bool  ident5() {
  		             &T ident(&T x){ return x; }
  		            return ident([1,2,3]) == [1,2,3];
  		            }
  		 public test bool  ident6() {
  		             &T ident(&T x){ return x; }
  		            return ident({1,2,3}) == {1,2,3};
  		            }
  		  public test bool  ident7() {
  		             &T ident(&T x){ return x; }
  		            return ident((1:10,2:20,3:30)) == (1:10,2:20,3:30);
  		            }
  		
  //	}
  
  
  // public void map() {
  	public test bool  map1() {
  		map[&K,&V] put(map[&K,&V] m, &K k, &V v) { m[k] = v; return m; }
  		return put((),1,"1") == (1:"1");
  	}
  /*	
  	@Ignore
  	 public void add1() {
  		
  		String add = "list[&T] java add(&T elm, list[&T] lst) { return lst.insert(elm); }";
  		
  		public test bool  assertTrue31() {{" + add + " add(1, [2,3]) == [1,2,3];}"));
  		public test bool  assertTrue32() {{" + add + " add("a", ["b","c"]) == ["a","b", "c"];}"));
  	}
  	
  	@Ignore
  	 public void putAt1() {
  		
  		String putAt = "list[&T] java putAt(&T elm, int n, list[&T] lst){return lst.put(n.intValue(), elm);}";
  		
  		public test bool  assertTrue33() {{" + putAt + " putAt(1, 0, [2,3]) == [1,3];}"));
  	}
  */
  
  data X = x() | y() | z();	
  //	 public void dispatchTest1() {
  public test bool  dispatchTest1() { 
  		public int f(x()) = 1;
  		public int f(y()) = 2;
  		public int f(z()) = 3;
  		return [f(x()),f(y()),f(z())] == [1,2,3];
  	}
  	
  public test bool  dispatchTest2() { 
  		public int f(x()) = 1;
  		public int f(y()) = 2;
  		public int f(z()) = 3;
  		public default int f(int x) = x;
  		return [f(x()),f(y()),f(z()), f(4)] == [1,2,3, 4];
  	}
  // }
  
  //	@Ignore
  //	 public void dispatchTest3() {
  //		prepare("syntax X = "x" | "y" | "z";");
  //		prepareMore("public int f((X) `x`) = 1;");
  //		prepareMore("public int f((X) `y`) = 2;");
  //		prepareMore("public int f((X) `z`) = 3;");
  //
  //		runTestInSameEvaluator("[f(`x`),f(`y`),f(`z`)] == [1,2,3]"));
  //	}
  	
  //	 public void keywordTest1(){
  	 public test bool  keywordTest11() { 
  		int incr(int x, int delta=1) = x + delta;
  		return incr(3) == 4 && incr(3, delta=2) == 5;
  	}
  
  	
  	public test bool  keywordTest1() { 
  		int sum(int x = 0, int y = 0) = x + y;
  		return sum() == 0 && sum(x=5, y=7) == 5+7 &&
  		sum(y=7,x=5)== 5+7;
  	}
  
  /*
  	 public void keywordTest31(){
  		prepare("list[int] varargs(int x, int y ..., int z = 0, str q = "a") = y;");
  		runTestInSameEvaluator("varargs(1,2,3,4) == [2,3,4];"));
  		runTestInSameEvaluator("varargs(1,2,3,4,q="b") == [2,3,4];"));
  		runTestInSameEvaluator("varargs(1,2,3,4,z=5) == [2,3,4];"));
  		runTestInSameEvaluator("varargs(1,2,3,4,q="b",z=5) == [2,3,4];"));
  	}
  */
  data Figure (real shrink = 1.0, str fillColor = "white", str lineColor = "black")  =  emptyFigure() 
  | ellipse(Figure inner = emptyFigure()) 
  | box(Figure inner = emptyFigure());
  	//  public void keywordTest4(){
  public test bool  keywordTest2() { 
  		if(!(emptyFigure().fillColor == "white")) return false;
  		if(!(emptyFigure(shrink=0.5).fillColor == "white")) return false;
  		if(!(emptyFigure(lineColor="red").fillColor == "white")) return false;
  		if(!(emptyFigure(lineColor="red", shrink=0.5).fillColor == "white")) return false;
  		
  		if(!(emptyFigure(fillColor="red").fillColor == "red")) return false;
  		if(!(emptyFigure(shrink=0.5,fillColor="red").fillColor == "red")) return false;
  		if(!(emptyFigure(shrink=0.5,fillColor="red", lineColor="black").fillColor == "red")) return false;
  		if(!(emptyFigure(lineColor="red", shrink=0.5).fillColor == "white")) return false;
  		
  		if(!(ellipse().fillColor == "white")) return false;
  		if(!(ellipse(inner=emptyFigure(fillColor="red")).fillColor == "white")) return false;
  		if(!(ellipse(inner=emptyFigure(fillColor="red")).inner.fillColor == "red")) return false;
  		return true;
  	}
  
  	@expected{ArgumentsMismatch}
  // public void keywordError1() {
  	public test bool  assertTrue34() { 
  		int incr(int x, int delta=1) = x + delta;
  		incr(delta=3);
  		return false;
  	}
  //	}
  
  @expected{ArgumentsMismatch}	
  	public test bool  assertTrue35() { 
  		int incr(int x, int delta=1) = x + delta;
  		incr(1, 3);
  		return false;
  	}
  	
  @expected{UnexpectedKeywordArgumentType}
  // public void keywordError3() {
  	    public test bool keywordError1() { 
  		int incr(int x, int delta=1) = x + delta;
  		incr(3, delta="a");
  		return false;
  	}
  
  @expected{UndeclaredKeywordParameter}	
  	public test bool keywordError2() { 
  		int incr(int x, int delta=1) = x + delta;
  		incr(3, d=5);
  		return false;
  	}
  //	}
  
  	
  	
  @expected{NoKeywordParameters}
  // public void keywordError5() {
  public test bool keywordError3()  { 
  		int add1(int x) = x + 1;
  		add1(3, delta=5);
  		return false;
  	}
  //}
  data D = d(int x, int y = 3);
  @expected{ArgumentsMismatch}
  // public void keywordInConstructorError1() {
  		public test bool keywordInConstructorError1() { 
  		d1();
  		return false;
  	}
  // }
  	
  @expected{ArgumentsMismatch}
  	// public void keywordInConstructorError2() {
  	public test bool  keywordInConstructorError2() { 
  		d(y=4);
  		return false;
  	}
  	
  	
  @expected{ArgumentsMismatch}
     
  //	public void keywordInConstructorError3() {
  	public test bool  keywordInConstructorError3() { 
  		d(1,4);
  		return false;
  	}
  	
  	
  @expected{ArgumentsMismatch}
  	// public void keywordInConstructorError4() {
  		public test bool  keywordInConstructorError4() { 
  		d(1,y="a");
  		return false;
  	    }
   //}
  	
  	
  @expected{UndeclaredKeywordParameter}
  //	public void keywordInConstructorError5() {
  		public test bool  keywordInConstructorError5() { 
  		d(1,z=4);
  		return false;
  	    }
  //	}
  
  data D1 = d1(int x);
  
  @expected{NoKeywordParameters}
  //	public void keywordInConstructorError6() {
  		public test bool  keywordInConstructorError6() { 
  		d1(1,y=4);
  		return false;
  	    }
  //	}
  	
  data POINT = point(int x, int y, str color = "red");
  // public void keywordMatchTest1(){
  		
  		
  		public test bool keywordMatchTest1() =point(_,_,_) !:= point(1,2);
  		public test bool keywordMatchTest2() =point(_,_,"red") !:= point(1,2);
  		public test bool keywordMatchTest3() =point(_,_,"green") !:= point(1,2, color="green");
  		public test bool keywordMatchTest4() =point(_,_,color="green") := point(1,2, color="green");
  		public test bool keywordMatchTest5() =point(1,2) := point(1,2);
  		public test bool keywordMatchTest6() =point(1,2) !:= point(1,3);
  		public test bool keywordMatchTest7() =point(1,2) := point(1,2,color="red");
  		public test bool keywordMatchTest8() =point(1,2,color="red") := point(1,2,color="red");
  		public test bool keywordMatchTest9() =point(1,2,color="green") !:= point(1,2);
  		public test bool keywordMatchTest10() =point(1,2,color="green") !:= point(1,2);
  //	}
  
  data POINT1 = point1(int x, int y, int z = 3, list[str] colors = []);	
  //	public void keywordMatchTest2(){
  		public test bool keywordMatchTest11() =point1(_, _, colors=["blue"]) := point1(1,2, colors=["blue"]);
  		public test bool keywordMatchTest12() =point1(_, _, colors=[*_,"blue",*_]) := point1(1,2, colors=["red","green","blue"]);
  		public test bool keywordMatchTest13() =point1(_, _, colors=[*_,*X,*_,*X, *_]) := point1(1,2, colors=["red","blue","green","blue"]);
  //	}
  	
  	
  
  
 