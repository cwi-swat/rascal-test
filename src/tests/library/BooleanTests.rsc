module tests::library::BooleanTests
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

import Boolean;

// public void arb() {
		public test bool assertTrue(){
		      bool B = Boolean::arbBool(); 
		      return (B == true) || (B == false);
		      }
		public test bool assertTrue(){
		     bool B = arbBool(); 
		     return (B == true) || (B == false);
		     }
//	}

//	@Test public void toInt() {

		public test bool assertTrue()=Boolean::toInt(false) == 0;
		public test bool assertTrue()=Boolean::toInt(true) == 1;

		public test bool assertTrue()=toInt(false) == 0;
		public test bool assertTrue()=toInt(true) == 1;
//	}

//	@Test public void toReal() {
		public test bool assertTrue()=Boolean::toReal(false) == 0.0;
		public test bool assertTrue()=Boolean::toReal(true) == 1.0;

		public test bool assertTrue()=toReal(false) == 0.0;
		public test bool assertTrue()=toReal(true) == 1.0;
//	}

//	@Test public void testToString() {
		public test bool assertTrue()= Boolean::toString(false) == "false";
		public test bool assertTrue()= Boolean::toString(true) == "true";
		public test bool assertTrue()= toString(false) == "false";
		public test bool assertTrue()= toString(true) == "true";
//	}