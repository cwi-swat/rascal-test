module tests::functionality::CallTCTests

data D = d(int x, int y = 3);
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
  	