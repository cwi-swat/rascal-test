module tests::library::IntegerTests
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

// @Test public void abs() {
		public test bool assertTrue() = abs(0) == 0;
		public test bool assertTrue() = abs(-1) == 1;
		public test bool assertTrue() = abs(1) == 1;

//	@Test public void arbInt() {
		public test bool assertTrue() {
		    int N = arbInt(10); 
		    return (N >= 0) && (N < 10);
		    }
		public test bool assertTrue() {
		    int N = arbInt(); 
		    return true;
		    }

//	@Test public void max() {
		public test bool assertTrue() = max(3, 10) == 10;
		public test bool assertTrue() = max(10, 10) == 10;
//	}

//	@Test public void min() {
		public test bool assertTrue() = min(3, 10) == 3;
		public test bool assertTrue() = min(10, 10) == 10;
//	}

//	@Test public void toReal() {
		public test bool assertTrue() =  toReal(3) == 3.0;
//	}

//	@Test public void testToString() {
		public test bool assertTrue() = toString(314) == "314";
//	}
