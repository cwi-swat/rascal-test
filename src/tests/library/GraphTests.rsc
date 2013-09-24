module tests::library::GraphTests
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
import analysis::graphs::Graph;

//	@Test public void bottom() {
		public test bool assertTrue() = bottom({}) == {};
		public test bool assertTrue() = bottom({<1,2>, <1,3>, <2,4>, <3,4>}) == {4};
//	}

//	@Test public void predecessors(){
		public test bool assertTrue()=  predecessors({<1,2>, <1,3>, <2,4>, <3,4>}, 4) =={2, 3};
//	}

//	@Test  public void reachR() {
		public test bool assertTrue() = reachR({}, {}, {}) == {};
		public test bool assertTrue() = reachR({<1,2>, <1,3>, <2,4>, <3,4>}, {1}, {}) =={};
		public test bool assertTrue() = reachR({<1,2>, <1,3>, <2,4>, <3,4>}, {1}, {1,2}) =={2};
		public test bool assertTrue() = reachR({<1,2>, <1,3>, <2,4>, <3,4>}, {1}, {1,2,3}) =={2,3};
		public test bool assertTrue() = reachR({<1,2>, <1,3>, <2,4>, <3,4>}, {1}, {1,2,4}) =={2, 4};
//	}

//	@Test public void reachX() {
		public test bool assertTrue() = reachX({}, {}, {}) == {};
		// public test bool assertTrue() = reachX({<1,2>, <1,3>, <2,4>, <3,4>}, {1}, {}) =={2, 3, 4};
		public test bool assertTrue() = reachX({<1,2>, <1,3>, <2,4>, <3,4>}, {1}, {2}) =={3, 4};
		// public test bool assertTrue() reachX({<1,2>, <1,3>, <2,4>, <3,4>}, {1}, {2,3}) =={};
		public test bool assertTrue() = reachX({<1,2>, <1,3>, <2,4>, <3,4>}, {1}, {4}) =={2, 3};

	
//	@Test public void reach(){
//		public test bool assertTrue() = reach({}, {}, {}) == {};
		public test bool assertTrue() = reach({<1,2>, <1,3>, <2,4>, <3,4>}, {1}) =={1,2, 3, 4};
		public test bool assertTrue() = reach({<1,2>, <1,3>, <2,4>, <3,4>}, {2}) =={2, 4};
		public test bool assertTrue() = reach({<1,2>, <1,3>, <2,4>, <3,4>}, {3}) =={3, 4};
		public test bool assertTrue() = reach({<1,2>, <1,3>, <2,4>, <3,4>}, {4}) =={4};
		public test bool assertTrue() = reach({<1,2>, <1,3>, <2,4>, <3,4>}, {3,4}) =={3,4};
		public test bool assertTrue() = reach({<1,2>, <1,3>, <2,4>, <3,4>}, {2,3}) =={2, 3,4};
//	}
	
//	@Test public void successors(){
		public test bool assertTrue() = successors({<1,2>, <1,3>, <2,4>, <3,4>}, 1) =={2, 3};
//	}

//	@Test public void top() {
		public test bool assertTrue() = top({}) == {};
		public test bool assertTrue() = top({<1,2>, <1,3>, <2,4>, <3,4>}) == {1};
//	}