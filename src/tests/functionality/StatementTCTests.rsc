module tests::functionality::StatementTCTests
/*******************************************************************************
 * Copyright (c) 2009-2011 CWI
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:

 *   * Jurgen J. Vinju - Jurgen.Vinju@cwi.nl - CWI
 *   * Paul Klint - Paul.Klint@cwi.nl - CWI
 *   * Bert Lisser - Bert.Lisser@cwi.nl - CWI
*******************************************************************************/


@expected{UnexpectedType}
  	// public test bool assertError2() {
public test bool assertError2() {assert 3.5;return false;}
  	// }
  	
@expected{UnexpectedType}
public test bool assertError3() {
  		assert 3.5 : "Wrong expression type";return false;
  	}
  	
@expected{UndeclaredVariable}
  	// public test bool assertError4() {
public test bool assertError4() {return assert X;}
  	// }
  	
@expected{UndeclaredVariable}
public test bool assertError5() {
  		assert X : "Wrong expression type";return false;
  	}
  	
 @expected{UnexpectedType}
  //	public test bool ifThenError() {
 public test bool ifThenError1() {return if(3){n = 4;}}
  //	}
  
  rel[int,int] R1 =  {<1,2>, <2,3>, <3,4>};
  
  @expected{UnexpectedType}	
  public test bool unexpectedType1() {
  		rel[int,int] T =    R1;
  		solve (T; true)  T = T + (T o R1);
  		return T =={<1,2>, <1,3>,<1,4>,<2,3>,<2,4>,<3,4>};
  		}
  		
  @expected{UnexpectedType}
  public test bool ifThenElseError1() {
  		if("abc") {n = 4;} else {n=5;}; return false;
  	}
  	
  	
 @expected{AssertionFailed}
  	// public test bool assertError1() {
  		public test bool assertError1() {assert 1 == 2;return false;}
  	// }
  	
  @expected{IndexOutOfBounds}
  public test bool indexOutOfBounds1() {
  		rel[int,int] T =    R1;
  		solve (T; -1)  T = T + (T o R1);
  		return T =={<1,2>, <1,3>,<1,4>,<2,3>,<2,4>,<3,4>};
  		}