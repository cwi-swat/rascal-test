/*******************************************************************************
 * Copyright (c) 2009-2012 CWI
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:

 *   * Anastasia Izmaylova - A.Izmaylova@cwi.nl - CWI
  *  * Bert Lisser - Bert.Lisser@cwi.nl - CWI
*******************************************************************************/
module tests::functionality::FunctionCompositionTests

public int fib(0) = 0;
public int fib(1) = 1;
default int fib(int n) = fib(n-1) + fib(n-2);


int fact(0) = 1;
int fact(1) = 1;
default int fact(int n) = n*fact(n-1);

int f(0) = 0;
int f(1) = 1; 
default int f(int n) = n + 1;


int g(0) { fail; }
int g(1) = 1;
default int g(int n) = n + 2;

str p(int n) = "<n>";
str p(str s) = s+s;

str h(0) = "0";
str h(1) = "1";
default str h(int n) { fail; }

str i(0) = "1";
str i(1) = "2";
default str i(int n) = "<n+1>";

int j0(0) = 0;
int j1(1) = 1;

default int j3(int n) = 2*n;
	
default int j4(int n) = 2*n - 1;

int k(int n) = (n%2 == 0) ? { fail; } : 2*n;

int l(int n) = (n%2 == 0) ? n*(n-1) : { fail; };

//public void testFactorialFibonacci() {
public test bool assertTrue() {
   list[int] inputs = [0,1,2,3,4,5,6,7,8,9];
   list[int] outputs1 = [ fact(fib(i)) | int i <- inputs ]; 
   list[int] outputs2 = [ (fact o fib)(i) | int i <- inputs ]; 
   return outputs1 == outputs2;   
   }
//}
// public void testFactorialFibonacciPrint() {
public test bool assertTrue() {
   list[int] inputs = [0,1,2,3,4,5,6,7,8,9];
   list[str] outputs1 = [ p(fact(fib(i))) | int i <- inputs ]; 
   list[str] outputs2 = [ (p o fact o fib)(i) | int i <- inputs ]; 
   list[str] outputs3 = [ ((p o fact) o fib) (i) | int i <- inputs ]; 
   list[str] outputs4 = [ (p o (fact o fib)) (i) | int i <- inputs ]; 
   return outputs1 == outputs2 && outputs1 == outputs3 && outputs1 == outputs4;   
   }
//}
// public void testAnonymousFunctionComposition() {
public test bool assertTrue() {
   list[int] inputs = [0,1,2,3,4,5,6,7,8,9];
   list[int] outputs1 = [ int (int n) { switch(n) { 
          case 0: return 1; 
          case 1: return 1; 
          case int n: return n*(n-1); } } 
	            ( int (int n) { switch(n) { 
	                  case 0: return 0; 
	                  case 1: return 1; 
	                  case int n: return (n-1) + (n-2); } } 
	                            (i)) | int i <- inputs ]; 
	list[int] outputs2 = [ (int (int n) { switch(n) { 
	       case 0: return 1; 
	       case 1: return 1; 
	       case int n: return n*(n-1); } } 
				o int (int n) { switch(n) { 
				    case 0: return 0; 
				    case 1: return 1; 
				    case int n: return (n-1) + (n-2); } }) 
									(i) | int i <- inputs ]; 
   return outputs1 == outputs2;  
   }
 //}
 
// public void testComposedOverloadedFunctions() {
  public test bool assertTrue() {
     return (g o f)(0) == 2;
  }
// }

// public void testNonDeterministicChoiceAndNormalComposition() {
   public test bool assertTrue() {
       list[int] inputs = [2,3];
	   list[str] outputs1 = [ i(n) | int n <- inputs ]; 
	   list[str] outputs2 = [ (h + i)(n) | int n <- inputs ]; 
	   list[str] outputs3 = [ (i + h)(n) | int n <- inputs ]; 
	   return outputs1 == outputs2 && outputs1 == outputs3 && 
				( (h + i)(0) == "0" || (h + i)(0) == "1" ) &&
				( (h + i)(1) == "1" || (h + i)(1) == "2" ) &&
				( (i + h)(0) == "0" || (i + h)(0) == "1" ) &&
				( (i + h)(1) == "1" || (i + h)(1) == "2" );
		
   }
   
  public test bool assertTrue() {
		list[int] inputs = [0,1,2,3,4,5,6,7,8,9,10]; 
		list[int] outputs = [ (n%2 == 0) ? n*(n - 1) : 2*n | int n <- inputs ]; 
		list[int] outputs1 = [ (k + l)(n) | int n <- inputs ]; 
	    list[int] outputs2 = [ (l + k)(n) | int n <- inputs ];
		list[int] outputs3 = [ ( (k + l) o (l + k) )(n) | int n <- inputs ];
		list[int] outputs4 = [ n*(n - 1) | int n <- outputs ];
		list[int] outputs5 = [ (j0 + j1 + (k + l) o j3)(n) | int n <- inputs ]; 
		list[int] outputs6 = [ ((k + l) o j4 + j0 + j1)(n) | int n <- inputs ];
		list[int] outputs7 = [0,1] + [ 2*n*(2*n - 1) | int n <- inputs - [0,1] ]; 
		list[int] outputs8 = [0,1] + [ 2*(2*n-1) | int n <- inputs - [0,1] ]; 
		list[int] outputs9 = [ 2*n*(2*n - 1) | int n <- inputs ]; 
		list[int] outputs10 = [ 2*(2*n-1) | int n <- inputs ]; 
		list[int] outputs11 = [ (( int (int n) { return (n%2 == 0) ? { fail; } : 2*n; } + l) o (int (int n) { return 2*n - 1; }) + j0 + j1)(n) | int n <- inputs ];

		return outputs == outputs1 && outputs == outputs2  && outputs3 == outputs4 
				&& ( outputs5 == outputs7 || outputs5 == outputs9 ) 
				&& ( outputs6 == outputs8 || outputs6 == outputs10 ) 
				&& ( outputs11 == outputs8 || outputs11 == outputs10 ); 
		}
				
// }