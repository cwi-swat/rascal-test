module tests::library::RelationTests
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
 import Relation; 
  
 // @Test public void carrier() {
		 public test bool carrier()=carrier({<1,10>,<2,20>}) == {1,2,10,20};
		 public test bool carrier()=carrier({<1,10,100>,<2,20,200>}) == {1,2,10,20,100,200};
		 public test bool carrier()=carrier({<1,10,100,1000>,<2,20,200,2000>}) == {1,2,10,20,100,200,1000,2000};
		 public test bool carrier()=carrier({<1,10,100,1000,10000>,<2,20,200,2000,20000>}) == {1,2,10,20,100,200,1000,2000,10000,20000};
// }

//	@Test public void carrierR() {
		 public test bool carrierR()=carrierR({<1,10>,<2,20>}, {} ) == {};
		 public test bool carrierR()=carrierR({<1,10>,<2,20>}, {2,3} ) == {};
		 public test bool carrierR()=carrierR({<1,10>,<2,20>}, {2,20} ) == {<2,20>};
		 public test bool carrierR()=carrierR({<1,10,100>,<2,20,200>}, {2, 20,200}) == {<2,20,200>};
		 public test bool carrierR()=carrierR({<1,10,100>,<2,20,200>}, {1,2,10,20,100,200}) == {<1,10,100>,<2,20,200>};
		 public test bool carrierR()=carrierR({<1,10,100,1000>,<2,20,200,2000>}, {1,10,100,1000}) == {<1,10,100,1000>};
		 public test bool carrierR()=carrierR({<1,10,100,1000>,<2,20,200,2000>}, {2,20,200,2000}) == {<2,20,200,2000>};
// }

//	@Test public void carrierX() {
		 public test bool carrierX()=carrierX({<1,10>,<2,20>}, {} ) == {<1,10>,<2,20>};
		 public test bool carrierX()=carrierX({<1,10>,<2,20>}, {2,3} ) == {<1,10>};
		 public test bool carrierX()=carrierX({<1,10,100>,<2,20,200>}, {20}) == {<1,10,100>};
		 public test bool carrierX()=carrierX({<1,10,100>,<2,20,200>}, {20,100}) == {};
		 public test bool carrierX()=carrierX({<1,10,100,1000>,<2,20,200,2000>}, {1000}) == {<2,20,200,2000>};
		 public test bool carrierX()=carrierX({<1,10,100,1000>,<2,20,200,2000>}, {2}) == {<1,10,100,1000>};
//	}

//	@Test public void complement() {
		 public test bool complement()=complement({<1,10>,<2,20>}) == {<2,10>,<1,20>};
		 public test bool complement()=complement({<1,10,100>,<2,20,200>}) == {<2,20,100>,<2,10,200>,<2,10,100>,<1,20,200>,<1,20,100>,<1,10,200>};
		 public test bool complement()=complement({<1,10,100,1000>,<2,20,200,2000>}) == {<2,20,200,1000>,<1,10,100,2000>,<1,10,200,1000>,<1,10,200,2000>,<1,20,100,1000>,<1,20,100,2000>,<1,20,200,1000>,<1,20,200,2000>,<2,10,100,1000>,<2,10,100,2000>,<2,10,200,1000>,<2,10,200,2000>,<2,20,100,1000>,<2,20,100,2000>};
//	}

//	@Test public void domain() {
		 public test bool domain()=domain({<1,10>,<2,20>}) == {1,2};
		 public test bool domain()=domain({<1,10,100>,<2,20,200>}) == {1,2};
		 public test bool domain()=domain({<1,10,100,1000>,<2,20,200,2000>}) == {1,2};
		 public test bool domain()=domain({<1,10,100,1000,10000>,<2,20,200,2000,20000>}) == {1,2};
//	}

//	@Test public void domainR() {
		 public test bool domainR()=domainR({<1,10>,<2,20>}, {}) == {};
		 public test bool domainR()=domainR({<1,10>,<2,20>}, {2}) == {<2,20>};
		 public test bool domainR()=domainR({<1,10,100>,<2,20,200>}, {2,5}) == {<2,20,200>};
		 public test bool domainR()=domainR({<1,10,100,1000>,<2,20,200,2000>}, {1,3}) == {<1,10,100,1000>};
		 public test bool domainR()=domainR({<1,10,100,1000,10000>,<2,20,200,2000,20000>},{2,5}) == {<2,20,200,2000,20000>};
//	}

//	@Test public void domainX() {
		 public test bool domainX()=domainX({<1,10>,<2,20>}, {}) == {<1,10>,<2,20>};
		 public test bool domainX()=domainX({<1,10>,<2,20>}, {2}) == {<1,10>};
		 public test bool domainX()=domainX({<1,10,100>,<2,20,200>}, {2,5}) == {<1,10,100>};
		 public test bool domainX()=domainX({<1,10,100,1000>,<2,20,200,2000>}, {1,3}) == {<2,20,200,2000>};
		 public test bool domainX()=domainX({<1,10,100,1000,10000>,<2,20,200,2000,20000>},{2,5}) == {<1,10,100,1000,10000>};
//	}
	
//	@Test public void ident() {
		//indent()=ident({}) == {};
		 public test bool indent()=ident({1}) == {<1,1>};
		 public test bool indent()=ident({1,2,3}) == {<1,1>,<2,2>,<3,3>};
//	}

//	@Test public void invert() {
		 public test bool invert()=invert({<1,10>,<2,20>}) == {<10,1>,<20,2>};
		 public test bool invert()=invert({<1,10,100>,<2,20,200>}) == {<100,10,1>,<200,20,2>};
		 public test bool invert()=invert({<1,10,100,1000>,<2,20,200,2000>}) == {<1000,100,10,1>,<2000,200,20,2>};
		 public test bool invert()=invert({<1,10,100,1000,10000>,<2,20,200,2000,20000>}) == {<10000,1000,100,10,1>,<20000,2000,200,20,2>};
//	}

//	@Test public void range() {
		 public test bool range()=range({<1,10>,<2,20>}) == {10,20};
		 public test bool range()=range({<1,10,100>,<2,20,200>}) == {<10,100>,<20,200>};
		 public test bool range()=range({<1,10,100,1000>,<2,20,200,2000>}) == {<10,100,1000>,<20,200,2000>};
		 public test bool range()=range({<1,10,100,1000,10000>,<2,20,200,2000,20000>}) == {<10,100,1000,10000>,<20,200,2000,20000>};
//	}

//	@Test public void rangeR() {
		// rangeR()=rangeR({<1,10>,<2,20>}, {}) == {};
		 public test bool rangeR()=rangeR({<1,10>,<2,20>}, {20}) == {<2,20>};
		// rangeR()=rangeR({<1,10,100>,<2,20,200>}) == {<10,100>,<20,200>};
		// rangeR()=rangeR({<1,10,100,1000>,<2,20,200,2000>}) == {<10,100,1000>,<20,200,2000>};
		// rangeR()=rangeR({<1,10,100,1000,10000>,<2,20,200,2000,20000>}) == {<10,100,1000,10000>,<20,200,2000,20000>};

//	}

//	@Test public void rangeX() {
		// rangeX()=rangeX({<1,10>,<2,20>}, {}) == {<1,10>,<2,20>};
		 public test bool rangeX()=rangeX({<1,10>,<2,20>}, {20}) == {<1,10>};
		// rangeX()=rangeX({<1,10,100>,<2,20,200>}) == {<10,100>,<20,200>};
		// rangeX()=rangeX({<1,10,100,1000>,<2,20,200,2000>}) == {<10,100,1000>,<20,200,2000>};
		// rangeX()=rangeX({<1,10,100,1000,10000>,<2,20,200,2000,20000>}) == {<10,100,1000,10000>,<20,200,2000,20000>};
//	}
	
	// Tests related to the correctness of the dynamic types of relations produced by the library functions;
	// incorrect dynamic types make pattern matching fail;

//	@Test public void testDynamicTypes() {
		 public test bool testDynamicTypes(){ rel[value, value] sr = {<"1","1">,<2,2>,<3,3>}; return rel[int, int] _ := sr - <"1","1">; }
		 public test bool testDynamicTypes(){ rel[value a, value b] sr = {<"1","1">,<2,2>,<3,3>}; return rel[int, int] _ := sr - {<"1","1">} && (sr - {<"1","1">}).a == {2,3} && (sr - {<"1","1">}).b == {2,3}; }
		 public test bool testDynamicTypes(){ return {<"1","1">, *tuple[int,int] _} := {<"1","1">,<2,2>,<3,3>}; }
		
		 public test bool testDynamicTypes(){ rel[value a, value b] sr1 = {<"1","1">,<2,2>,<3,3>}; rel[value a, value b] sr2 = {<2,2>,<3,3>}; return rel[int, int] _ := sr1 & sr2 && (sr1 & sr2).a == {2,3} && (sr2 & sr1).b == {2,3}; }
//	}


  