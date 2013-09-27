 module tests::functionality::TryCatchTests
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
  import Exception;
  import Prelude;
  
  
  data NODEA = fA(int N);
  
  data NODEB = fB(int N) | dB(NODEB a, NODEB b);
  
  data NODEC = fC(int N) | fin(value V) | dC(NODEC a) | dC(NODEC a, NODEC b);
  
  data Exception = divide_by_zero();
  
  int classify(value v){
  			try { 
  				throw v; 
  			} catch int x:{ 
  				return 1; 
  			} 
  			catch node x: { 
  				return 2; 
  			}
  			catch str s: { 
  				return 3; 
  			} 
  			catch: { 
  				return 4; 
  			}
  		return 0; 
  		}
  		
  value duplicate(value v){
  			try { 
  				throw v; 
  			} catch int x: {
  				return x + x;
  			} 
  			catch NODEB x: { 
  				return dB(x,x); 
  			} 
  			catch str s: { 
  				return s + s; 
  			} 
  			catch: { 
  				return v; 
  			} 
  		}
  		
  		
  value dfin(value v){
  		value res = 0;
  			try { 
  				throw v; 
  			} catch int x: { 
  				res = x + x; 
  			} 
  			catch NODEC x: { 
  				res = dC(x,x); 
  			} 
  			catch str s: { 
  				res = s + s; 
  			} 
  			catch: { 
  				res = v; 
  			} 
  			finally { 
  				return fin(res); 
  			} 
  		}
  		
  		
  		
  int divide(int x, int y) 
  		throws divide_by_zero 
  		{ 
  			if(y == 0){ 
  				throw divide_by_zero(); 
  			} else { 
  				return x / y; 
  			} 
  		} 
  	
  int safeDivide(int x, int y){ 
  			try 
  				return divide(x,y); 
  			catch:  
  				return 0; 
  		}
  		
  bool functionL() { 
  		  try { 
  		     head([]); 
  		  } catch EmptyList(): 
  		      return true; 
  		  return false; 
  		}
  		
  bool functionM() { 
  		  try { 
  		     getOneFrom(()); 
  		  } catch EmptyMap(): 
  		      return true; 
  		  return false; 
  		}
  		
  bool functionS() { 
  		  try { 
  		     getOneFrom({}); 
  		  } catch EmptySet: 
  		      return true; 
  		  return false; 
  		}
  		
  bool functionR() { 
  		  try { 
  		     [0,1,2][3]; 
  		  } catch IndexOutOfBounds(int i): 
  		      return true; 
  		  return false; 
  		}
  		
  bool functionA() {
              NODEA l = fA(3);
  		    l@pos;
  		    return false;
  		}
  
  bool functionF() {
  		try {
  		     S = readFile("DoesNotExist");
  		} catch PathNotFound(loc location):
  		        return true;
  		 return false;
  		}
  		
  bool functionB() { 
  		  try { 
  		      [1,2,3][1,2]; 
  		  } catch SubscriptException(str e): 
  		      return true; 
  		  return false; 
  		}
  		
  bool functionC() { 
  		      X+3; 
  		      return false; 
  		}
  		
  bool functionD() { 
  		      X[2] = 3; 
  		      return false; 
  		}
  		
  bool functionE() { 
  		  try { 
  		      X[2] = 3; 
  		  } catch StrangeException e: 
  		      return true; 
  		  return false; 
  		}
  		
  bool functionZ() { 
  		  try { 
  		      X[2] = 3; 
  		  } catch StrangeException (str e): 
  		      return true; 
  		  return false; 
  		}
  	
  // public void testClassify()  {
  		public test bool testClassify1()=classify(3) == 1;
  		public test bool testClassify2()=classify(fA(3)) == 2;
  		public test bool testClassify3()=classify("abc") == 3;
  		public test bool testClassify4()=classify([1,2,3]) == 4;
  //	}
  	
  // public void testDuplicate()  {		
  		public test bool testDuplicate1()=duplicate(3) == 6;
  		public test bool testDuplicate2()=duplicate(fB(3)) == dB(fB(3),fB(3));
  		public test bool testDuplicate3()=duplicate("abc") == "abcabc";
  		public test bool testDuplicate4()=duplicate(3.5) == 3.5;
  //	}
  	
  //	@Test public void testDFin()  {	
  		public test bool testDFin1()=dfin(3) == fin(6);
  		public test bool testDFin2()=dfin(fC(3)) == fin(dC(fC(3),fC(3)));
  		public test bool testDFin3()=dfin("abc") == fin("abcabc");
  		public test bool testDFin4()=dfin(3.5) == fin(3.5);
  //	}
  	
  //	@Test public void testDivide ()  {
  		public test bool testDivide1()=divide(3, 2) == 1;
  		public test bool testDivide2()=safeDivide(3, 2) == 1;
  		public test bool testDivide3()=safeDivide(3, 0) == 0;
  //	}
  
  //	@Test public void emptyListException(){
  		public test bool emptyListException1()=functionL();
  //	}
  	
  //	@Test public void emptyMapException(){
  		public test bool emptyMapException1()=functionM();
  //	}
  	
  //	@Test public void emptySetException() {
  		public test bool emptySetException1()=functionS();
  //	}
  	
  //	@Test public void IndexOutOfBoundsException(){
  		public test bool indexOutOfBoundsException1()=functionR();
  //	}
  
  @expected{UndeclaredAnnotation}
  
  	//public void NoSuchAnnotationException(){
  		public test bool noSuchAnnotationException1() = functionA();
  	// }
  	
  //	@Test public void PathNotFoundException(){	
  		public test bool pathNotFoundException1()=functionF();
  //	}
  
  @expected{UnsupportedSubscriptArity}
  //	public void SubscriptException(){
  		public test bool assertTrue1()=functionB();
  //	}
  	
  @expected{UndeclaredVariable}
  
  //	public void UndefinedValueException(){
  		public test bool undefinedValueException1()=functionC();
  //	}
  	
  @expected{UninitializedVariable}
  //	public void UninitializedvariableException(){
  		public test bool uninitializedvariableException1()=functionD();
  //	}
  	
  @expected{UninitializedVariable}
  //	public void UnknownExceptionError1(){
  		public test bool assertTrue2()=functionE();
  //	}
  	
  @expected{UndeclaredVariable}
  //	public void UnknownExceptionError2(){
  		public test bool assertTrue3()=ffunctionZ();
  //	}
  
    	@expected{UnexpectedType}
  // public test bool doWhileError() {
  		public test bool doWhileError1() {do {n = 4;} while(3); return false;}
  //	}
 	
  	@expected{UnexpectedType}
  	// public test bool whileError() {
  		public test bool whileError1() {while(3){n = 4;};return false;}
  	// } 
 