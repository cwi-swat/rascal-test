module tests::library::NumberTests
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
import util::Math;

//public void abs() {

		public test bool assertTrue() = abs(0) == 0;
		public test bool assertTrue() = abs(0r) == 0r;
		public test bool assertTrue() = abs(-1) == 1;
		public test bool assertTrue() = abs(-1r1) == 1r1;
		public test bool assertTrue() = abs(1) == 1;
		public test bool assertTrue() = abs(1.5) == 1.5;
		public test bool assertTrue() = abs(3r2) == 3r2;
		public test bool assertTrue() = abs(-1.5) == 1.5;
		public test bool assertTrue() = abs(-3r2) == 3r2;
//	}

//	@Test public void arbInt() {
		public test bool assertTrue() {int N = arbInt(10); return (N >= 0) && (N < 10);}
		public test bool assertTrue() {int N = arbInt(); return true;}
//	}

//	@Test public void compare() {

		public test bool assertTrue() = 1r1 == 1;
		public test bool assertTrue() = 1r1 == 1.0;
		public test bool assertTrue() =  -1r1 == -1;

		public test bool assertTrue() = 1r2 < 1;
		public test bool assertTrue() = 1r2 <= 1;
		public test bool assertTrue() = 1r1 <= 1;
		public test bool assertTrue() = 3r2 > 1;
		public test bool assertTrue() = 3r2 >= 1;
		public test bool assertTrue() = 3r1 >= 1;

		public test bool assertTrue() = 1r2 < 1.0;
		public test bool assertTrue() = 1r2 <= 1.0;
		public test bool assertTrue() = 1r1 <= 1.0;
		public test bool assertTrue() = 3r2 > 1.0;
		public test bool assertTrue() = 3r2 >= 1.0;
		public test bool assertTrue() = 3r1 >= 1.0;
		
		public test bool assertTrue() = 1r2 < 2r2;
		public test bool assertTrue() = 1r2 <= 2r2;
		public test bool assertTrue() = 1r1 <= 2r2;
		public test bool assertTrue() = 3r2 > 2r2;
		public test bool assertTrue() = 3r2 >= 2r2;
		public test bool assertTrue() = 3r1 >= 2r2;
//	}

//	@Test public void arithPromotion() {
		public test bool assertTrue() = 2r4 + 1r2 == 1r;
		public test bool assertTrue() = 2r4 - 1r2 == 0r;
		public test bool assertTrue() = 2r4 * 1r2 == 1r4;
		public test bool assertTrue() = 2r4 / 1r2 == 1r;

		public test bool assertTrue() = 2r4 + 2 == 5r2;
		public test bool assertTrue() = 2r4 - 2 == -3r2;
		public test bool assertTrue() = 2r4 * 2 == 1r;
		public test bool assertTrue() = 2r4 / 2 == 1r4;

		public test bool assertTrue() = 2r4 + 2.0 == 2.5;
		public test bool assertTrue() = 2r4 - 2.0 == -1.5;
		public test bool assertTrue() = 2r4 * 2.0 == 1.0;
		public test bool assertTrue() = 2r4 / 2.0 == 0.25;

		
		public test bool assertTrue() = 2 + 1r2 == 5r2;
		public test bool assertTrue() = 2 - 1r2 == 3r2;
		public test bool assertTrue() = 2 * 1r2 == 1r;
		public test bool assertTrue() = 2 / 1r2 == 4r;

		public test bool assertTrue() = 2.0 + 1r2 == 2.5;
		public test bool assertTrue() = 2.0 - 1r2 == 1.5;
		public test bool assertTrue() = 2.0 * 1r2 == 1.0;
		public test bool assertTrue() = 2.0 / 1r2 == 4.0;
//	}

	@Test
//	public void arbReal() {
		public test bool assertTrue() {real D = arbReal(); return (D >= 0.0) && (D <= 1.0);}
//	}

//	@Test public void max() {
		public test bool assertTrue() = max(3, 10) == 10;
		public test bool assertTrue() = max(10, 10) == 10;
		public test bool assertTrue() = max(3.0, 10.0) == 10.0;
		public test bool assertTrue() = max(10.0, 10.0) == 10.0;
		
		public test bool assertTrue() = max(3.5, 10) == 10;
		public test bool assertTrue() = max(3, 10.5) == 10.5;
//	}

//	@Test public void min() {

		public test bool assertTrue() = min(3, 10) == 3;
		public test bool assertTrue() = min(10, 10) == 10;
		
		public test bool assertTrue() = min(3.0, 10.0) == 3.0;
		public test bool assertTrue() = min(3.0, 10.0) == 3.0;
		public test bool assertTrue() = min(10.0, 10.0) == 10.0;
		
		public test bool assertTrue() = min(3.5, 10) == 3.5;
		public test bool assertTrue() = min(3, 10.5) == 3;

//	}
	
//	@Test  public void toInt() {

		public test bool assertTrue() = toInt(3) == 3;
		public test bool assertTrue() = toInt(3.14) == 3;
		public test bool assertTrue() = toInt(3r2) == 1;
		public test bool assertTrue() = toInt(4r2) == 2;
//	}

//	@Test public void toReal() {
		public test bool assertTrue() =  toReal(3) == 3.0;
		public test bool assertTrue() = toReal(3.14) == 3.14;
//	}

//	@Test public void testToString() {
		public test bool assertTrue() = toString(314) == "314";
		public test bool assertTrue() = toString(3.14) == "3.14";
		public test bool assertTrue() = toString(4r8) == "1r2";

//	}

