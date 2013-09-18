module tests::functionality::ProjectionTests
/*******************************************************************************
 * Copyright (c) 2009-2011 CWI
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:

 *   * Jurgen J. Vinju - Jurgen.Vinju@cwi.nl - CWI
 *   * Bert Lisser - Bert.Lisser@cwi.nl - CWI
*******************************************************************************/

//	@Test public void empty() {
		public test bool assertTrue()={}<0> == {};
		public test bool assertTrue()={}<1> == {};
//	}
	
//	@Test public void nonEmpty() {
		public test bool assertTrue()={<1,2>}<0> == {1};
		public test bool assertTrue()={<1,2>}<1> == {2};
//	}
	
@expected{IndexOutOfBounds}
//	public void outOfBounds() {
		public test bool  assertTrue()={<1,2>}<2> == {2};
//	}
	

