 module tests::functionality::DataTypeTests
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
  
  
  // @Test public void bool() {
  		
  		public test bool testBool1() = true == true;
  		public test bool testBool2() = !(true == false);
  		public test bool testBool3() = true != false;	
  
  		public test bool testBool4() = (!true) == false;
  		public test bool testBool5() = (!false) == true;
  		
  		public test bool testBool6() = (true && true) == true;	
  		public test bool testBool7() = (true && false) == false;	
  		public test bool testBool8() = (false && true) == false;	 
  		public test bool testBool9() = (false && false) == false;	
  		
  		public test bool testBool10() = (true || true) == true;	
  		public test bool testBool11() = (true || false) == true;	
  		public test bool testBool12() = (false || true) == true;	
  		public test bool testBool13() = (false || false) == false;	
  		
  		public test bool testBool14() = (true ==> true) == true;	
  		public test bool testBool15() = (true ==> false) == false;	
  		public test bool testBool16() = (false ==> true)  == true;	
  		public test bool testBool17() = (false ==> false) == true;
  		
  		public test bool testBool18() = (true <==> true) == true;	
  		public test bool testBool19() = (true <==> false) == false;	
  		public test bool testBool20() = (false <==> true) == false;	
  		public test bool testBool21() = (false <==> false) == true;
  		
  		public test bool testBool22() = false  <= false;
  		public test bool testBool23() = false  <= true;
  		public test bool testBool24() = !(true  <= false);
  		public test bool testBool25() = true   <= true;
  		
  		public test bool testBool26() = !(false < false);
  		public test bool testBool27() = false  < true;
  		public test bool testBool28() = !(true  < false);
  		public test bool testBool29() = !(true  < true);
  		
  		public test bool testBool30() = false  >= false;
  		public test bool testBool31() = true   >= false;
  		public test bool testBool32() = !(false >= true);
  		public test bool testBool33() = true   >= true;
  		
  		public test bool testBool34() = !(false > false);
  		public test bool testBool35() = true   > false;
  		public test bool testBool36() = !(false > true);
  		public test bool testBool37() = !(true   > true);
  //	}
  
  //	@Test public void testInt() {		
  		public test bool testInt1() = 1 == 1;
  		public test bool testInt2() = 1 != 2;
  		
  		public test bool testInt3() = -1 == -1;
  		public test bool testInt4() = -1 != 1;
  		
  		public test bool testInt5() = 1 + 1 == 2;
  		public test bool testInt6() = -1 + 2 == 1;
  		public test bool testInt7() = 1 + (-2) == -1;
  		
  		public test bool testInt8() = 2 - 1 == 1;	
  		public test bool testInt9() = 2 - 3 == -1;	
  		public test bool testInt10() = 2 - -1 == 3;	
  		public test bool testInt11() = -2 - 1 == -3;	
  		
  		public test bool testInt12() = 2 * 3 == 6;	
  		public test bool testInt13() = -2 * 3 == -6;	
  		public test bool testInt14() = 2 * (-3) == -6;
  		public test bool testInt15() = -2 * (-3) == 6;	
  		
  		public test bool testInt16() = 8 / 4 == 2;	
  		public test bool testInt17() = -8 / 4 == -2;
  		public test bool testInt18() = 8 / -4 == -2;	
  		public test bool testInt19() = -8 / -4 == 2;
  		
  		public test bool testInt20() = 7 / 2 == 3;	
  		public test bool testInt21() = -7 / 2 == -3;
  		public test bool testInt22() = 7 / -2 == -3;	
  		public test bool testInt23() = -7 / -2 == 3;	
  		
  		public test bool testInt24() = 0 / 5 == 0;	
  		public test bool testInt25() = 5 / 1 == 5;	
  		
  		public test bool testInt26() = 5 % 2 == 1;	
  		public test bool testInt27() = -5 % 2 == -1;
  		public test bool testInt28() = 5 % -2 == 1;		
  		
  		public test bool testInt29() = -2 <= -1;
  		public test bool testInt30() = -2 <= 1;
  		public test bool testInt31() = 1 <= 2;
  		public test bool testInt32() = 2 <= 2;
  		public test bool testInt33() = !(2 <= 1);
  		
  		public test bool testInt34() = -2 < -1;
  		public test bool testInt35() = -2 < 1;
  		public test bool testInt36() = 1 < 2;
  		public test bool testInt37() = !(2 < 2);
  		
  		public test bool testInt38() = -1 >= -2;
  		public test bool testInt39() = 1 >= -1;
  		public test bool testInt40() = 2 >= 1;
  		public test bool testInt41() = 2 >= 2;
  		public test bool testInt42() = !(1 >= 2);
  		
  		public test bool testInt43() = -1 > -2;
  		public test bool testInt44() = 1 > -1;
  		public test bool testInt45() = 2 > 1;
  		public test bool testInt46() = !(2 > 2);
  		public test bool testInt47() = !(1 > 2);
  		
  		public test bool testInt48() = (3 > 2 ? 3 : 2) == 3;
  		
  // 	}
  	
  
  
  	
  //	@Test public void valueEquals() {
  		public test bool assertTrue1()  {value x = 1.0; value y = 2; return x != y; }
  //	}
  	
  //	@Test public void real()	{		
  		public test bool testReal1() = 1.0 == 1.0;
  		public test bool testReal2() = 1.0 != 2.0;
  		
  		public test bool testReal3() = -1.0 == -1.0;
  		public test bool testReal4() = -1.0 != 1.0;
  		
  		public test bool testReal5() = 1.0 == 1;
  		public test bool testReal6() = 1.00 == 1.0;
  		public test bool testReal7() = 1 == 1.0;
  		
  		public test bool testReal8()  {value x = 1.0; value y = 1; return x == y; }
  		public test bool testReal9() {value x = 1.0; value y = 2; return x != y; }
  		
  		public test bool testReal10() = 1.0 + 1.0 == 2.0;
  		public test bool testReal11() = -1.0 + 2.0 == 1.0;
  		public test bool testReal12() = 1.0 + (-2.0) == -1.0;
  		
  		public test bool testReal13() = 1.0 + 1 == 2.0;
  		public test bool testReal14() = -1 + 2.0 == 1.0;
  		public test bool testReal15() = 1.0 + (-2) == -1.0;
  		
  		public test bool testReal16() = 2.0 - 1.0 == 1.0;	
  		public test bool testReal17() = 2.0 - 3.0 == -1.0;	
  		public test bool testReal18() = 2.0 - -1.0 == 3.0;	
  		public test bool testReal19() = -2.0 - 1.0 == -3.0;
  		
  		public test bool testReal20() = 2.0 - 1 == 1.0;	
  		public test bool testReal21() = 2 - 3.0 == -1.0;	
  		public test bool testReal22() = 2.0 - -1 == 3.0;	
  		public test bool testReal23() = -2 - 1.0 == -3.0;
  		
  		public test bool testReal24() = 2.0 * 3.0 == 6.00;	
  		public test bool testReal25() = -2.0 * 3.0 == -6.00;	
  		public test bool testReal26() = 2.0 * (-3.0) == -6.00;
  		public test bool testReal27() = -2.0 * (-3.0) == 6.00;	
  		
  		public test bool testReal28() = 2.0 * 3 == 6.0;	
  		public test bool testReal29() = -2 * 3.0 == -6.0;	
  		public test bool testReal30() = 2.0 * (-3) == -6.0;
  		public test bool testReal31() = -2 * (-3.0) == 6.0;	
  		
  		public test bool testReal32() = 8.0 / 4.0 == 2e0;	
  		public test bool testReal33() = -8.0 / 4.0 == -2e0;
  		public test bool testReal34() = 8.0 / -4.0 == -2e0;	
  		public test bool testReal35() = -8.0 / -4.0 == 2e0;
  		
  		// TODO, I don't get it, why does the previous have 1 digit precision and this
  		// one two digits
  		public test bool testReal36() = 7.0 / 2.0 == 3.5;	
  		public test bool testReal37() = -7.0 / 2.0 == -3.5;
  		public test bool testReal38() = 7.0 / -2.0 == -3.5;	
  		public test bool testReal39() = -7.0 / -2.0 == 3.5;	
  		
  		public test bool testReal40() = 0.0 / 5.0 == 0.0;	
  		public test bool testReal41() = 5.0 / 1.0 == 5.0;	
  		
  		public test bool testReal42() = 7 / 2.0 == 3.5;	
  		public test bool testReal43() = -7.0 / 2 == -3.5;
  		public test bool testReal44() = 7 / -2.0 == -3.5;	
  		public test bool testReal45() = -7.0 / -2 == 3.5;	
  		
  		public test bool testReal46() = -2.0 <= -1.0;
  		public test bool testReal47() = -2.0 <= 1.0;
  		public test bool testReal48() = 1.0 <= 2.0;
  		public test bool testReal49() = 2.0 <= 2.0;
  		public test bool testReal50() = !(2.0 <= 1.0);
  		
  		public test bool testReal51() = -2 <= -1.0;
  		public test bool testReal52() = -2.0 <= 1;
  		public test bool testReal53() = 1 <= 2.0;
  		public test bool testReal54() = 2.0 <= 2;
  		public test bool testReal55() = !(2 <= 1.0);
  		
  		public test bool testReal56() = -2.0 < -1.0;
  		public test bool testReal57() = -2.0 < 1.0;
  		public test bool testReal58() = 1.0 < 2.0;
  		public test bool testReal59() = !(2.0 < 2.0);
  		
  		public test bool testReal60() = -2 < -1.0;
  		public test bool testReal61() = -2.0 < 1;
  		public test bool testReal62() = 1 < 2.0;
  		public test bool testReal63() = !(2.0 < 2);
  		
  		public test bool testReal64() = -1.0 >= -2.0;
  		public test bool testReal65() = 1.0 >= -1.0;
  		public test bool testReal66() = 2.0 >= 1.0;
  		public test bool testReal67() = 2.0 >= 2.0;
  		public test bool testReal68() = !(1.0 >= 2.0);
  		
  		public test bool testReal69() = -1 >= -2.0;
  		public test bool testReal70() = 1.0 >= -1;
  		public test bool testReal71() = 2 >= 1.0;
  		public test bool testReal72() = 2.0 >= 2;
  		public test bool testReal73() = !(1 >= 2.0);
  		
  		public test bool testReal74() = -1.0 > -2.0;
  		public test bool testReal75() = 1.0 > -1.0;
  		public test bool testReal76() = 2.0 > 1.0;
  		public test bool testReal77() = !(2.0 > 2.0);
  		public test bool testReal78() = !(1.0 > 2.0);
  		
  		public test bool testReal79() = -1 > -2.0;
  		public test bool testReal80() = 1.0 > -1;
  		public test bool testReal81() = 2 > 1.0;
  		public test bool testReal82() = !(2.0 > 2);
  		public test bool testReal83() = !(1 > 2.0);
  		
  		public test bool testReal84() = ((3.5 > 2.5) ? 3.5 : 2.5) == 3.5;
  		
  		public test bool testReal85() = ((3.5 > 2) ? 3.5 : 2) == 3.5;
  		public test bool testReal86() = ((3.5 > 4) ? 3.5 : 2) == 2;
  //	}
  	
  //	@Test public void testNumber(){
  		public test bool testNumber1() {num n = 1; return n == 1;}
  		public test bool testNumber2() {num n = 1;  return 1 == n;}
  		
  		public test bool testNumber3() {num n = 1;  return n != 2;}
  		public test bool testNumber4() {num n = 1;  return 2 != n;}
  		
  		
  		public test bool testNumber5() {num n = 1;  return n + 1 == 2;}
  		public test bool testNumber6() {num n = 1;  return 1 + n == 2;}
  		
  		public test bool testNumber7() {num n = 2; return n - 1 == 1;}	
  		public test bool testNumber8() {num n = 2; return 1 - n == -1;}	
  		
  		
  		public test bool testNumber9() {num n = 2; return n * 3 == 6;}
  		public test bool testNumber10() {num n = 2; return 3 * n == 6;}
  		
  		public test bool testNumber11() {num n = 8; return n / 4 == 2;}	
  		public test bool testNumber12() {num n = 4; return 8 / n == 2;}	
  		
  //		public test bool testNumber() {num n = 5; return n % 2 == 1;}	
  //		public test bool assertTrue() {num n = 2; return 5 % n == 1;}	
  		
  	
  		public test bool testNumber13() {num n = 1; return n <= 2;}
  		public test bool testNumber14() {num n = 1; return 0 <= n;}
  		
  		public test bool testNumber15() {num n = 1; return n < 2;} 
  		public test bool testNumber16() {num n = 1; return 0 < n;}
  		
  		public test bool testNumber17() {num n = 2; return n >= 1;}
  		public test bool testNumber18() {num n = 1; return 2 >= n;}
  		
  		public test bool testNumber19() {num n = 2; return n > 1;}         
  		public test bool testNumber20() {num n = 1; return 2 > n;}
  		
  		public test bool testNumber21() {num n = 1; return 2 > n;}
  		
  		public test bool testNumber22() {num n35 = 3.5; num n2 = 2; return ((n35 > n2) ? 3.5 : 2) == 3.5;}
  //	}
  	
  //	@Test public void testString() {	
  		public test bool testString1() = "" == "";
  		public test bool testString2() = "abc" != "";
  		public test bool testString3() = "abc" == "abc";
  		public test bool testString4() = "abc" != "def";
  		
  		public test bool testString5() = "abc" + "" == "abc";
  		public test bool testString6() = "abc" + "def" == "abcdef";
  		
  		public test bool testString7() = "" <= "";
  		public test bool testString8() = "" <= "abc";
  		public test bool testString9() = "abc" <= "abc";
  		public test bool testString10() = "abc" <= "def";
  		
  		public test bool testString11() = !("" < "");
  		public test bool testString12() = "" < "abc";
  		public test bool testString13() = !("abc" < "abc");
  		public test bool testString14() = "abc" < "def";
  		
  		public test bool testString15() = "" >= "";
  		public test bool testString16() = "abc" >= "";
  		public test bool testString17() = "abc" >= "abc";
  		public test bool testString18() = "def" >= "abc";
  		
  		public test bool testString19() = !("" > "");
  		public test bool testString20() = "abc" > "";
  		public test bool testString21() = !("abc" > "abc");
  		public test bool testString22() = "def" > "abc";
  //	}
  	
  //	@Test public void stringEscapes() {
  		public test bool testStringEscapes1() = "\\b" == "\\b";
  		public test bool testStringEscapes2() = "\\t" == "\\t";
  		public test bool testStringEscapes3() = "\\n" == "\\n";
  		public test bool testStringEscapes4() = "\\f" == "\\f";
  		public test bool testStringEscapes5() = "\\r" == "\\r";
  		
  		public test bool testStringEscapes6() = "\"\"" == "\"\"";
  		public test bool testStringEscapes7() = "\\\'" == "\\\'";
  		public test bool testStringEscapes8() = "\\\\" == "\\\\";
  		public test bool testStringEscapes9() = "\"\<" == "\"\<";
  		public test bool testStringEscapes10() = "\"\>" == "\"\>";
  		
  		// public test bool assertTrue() = "\\a20" == " ";
  		// public test bool assertTrue() = "\\U01F35D" == "🍝";
  		// public test bool assertTrue() = "\\U01F35D" == "🍝";
  		// public test bool assertTrue() = "\\u2713" == "✓";
  //	}
  	
  //	@Test  public void stringInterpolation(){
  		public test bool testStringInterpolation1() {str a = "abc"; return "1<a>2" == "1abc2";}
  		public test bool testStringInterpolation2() {int a = 789; return "1<a>2" == "17892";}
  		
  		public test bool testStringInterpolation3() {str a = "a\\bc"; return "1<a>2" == "1a\\bc2";}
  		public test bool testStringInterpolation4() {str a = "a\\tc"; return "1<a>2" == "1a\\tc2";}
  		public test bool testStringInterpolation5() {str a = "a\\nc"; return "1<a>2" == "1a\\nc2";}
  		public test bool testStringInterpolation6() {str a = "a\\fc"; return "1<a>2" == "1a\\fc2";}
  		public test bool testStringInterpolation7() {str a = "a\\rc"; return "1<a>2" == "1a\\rc2";}
  		
  		public test bool testStringInterpolation8() {str a = "a\\\"c"; return "1<a>2" == "1a\\\"c2";}
  		public test bool testStringInterpolation9() {str a = "a\\\'c"; return "1<a>2" == "1a\\\'c2";}
  		public test bool testStringInterpolation10() {str a = "a\\\\c"; return "1<a>2" == "1a\\\\c2";}
  		
  		public test bool testStringInterpolation11() {str a = "a\<c"; return "1<a>2" == "1a\<c2";}
  		public test bool testStringInterpolation12() {str a = "a\>c"; return "1<a>2" == "1a\>c2";}
  	
  //	}
  loc Loc = |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>);
  loc Loc2 = |file:///home/paulk/pico2.trm|(0,1,<2,3>,<4,5>);	
  //	@Test public void testLocation() {
  		
  		
  		public test bool testLocation1() {Loc ; return true;}
  		public test bool testLocation2() =  Loc == Loc;
  		public test bool testLocation3() = Loc != Loc2;
  		
  		public test bool testLocation4() = Loc.uri == "file:///home/paulk/pico.trm";
  		public test bool testLocation5() = Loc.offset == 0;
  		public test bool testLocation6() = Loc.length == 1;
  		public test bool testLocation7() = Loc.begin.line == 2;
  		public test bool testLocation8() = Loc.begin.column == 3;
  		public test bool testLocation9() = Loc.end.line == 4;
  		public test bool testLocation10() = Loc.end.column == 5;
  		public test bool testLocation11() = Loc.path == "/home/paulk/pico.trm";
  		
  		
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.uri == "file:///home/paulk/pico.trm";}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.offset == 0;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.length == 1;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.begin.line == 2;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.begin.column == 3;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.end.line == 4;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.end.column == 5;}
  		//
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.uri = "file:///home/paulk/pico2.trm"; Loc.uri == "file:///home/paulk/pico2.trm";}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.offset = 10; Loc.offset == 10;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.length = 11; Loc.length == 11;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.end.line = 14; Loc.end.line == 14;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.begin.line = 1; Loc.begin.line == 1;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.begin.column = 13; Loc.begin.column == 13;}
  		//public test bool assertTrue() = { loc Loc = " + Loc + "; Loc.end.column = 15; Loc.end.column == 15;}
  		//
  		//public test bool assertTrue() = {loc Loc = " + Loc + "; Loc = Loc[uri= "file:///home/paulk/pico.trm"]; Loc == |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>);}
  		//public test bool assertTrue() = {loc Loc = " + Loc + "; Loc = Loc[offset = 10]; Loc == |file:///home/paulk/pico.trm|(10,1,<2,3>,<4,5>);}
  		//public test bool assertTrue() = {loc Loc = " + Loc + "; Loc = Loc[length = 11]; Loc ==  |file:///home/paulk/pico.trm|(0,11,<2,3>,<4,5>);}
  		//public test bool assertTrue() = {loc Loc = " + Loc + "; Loc = Loc[begin = <1,4>]; Loc == |file:///home/paulk/pico.trm|(0,1,<1,4>,<4,5>);}
  		//public test bool assertTrue() = {loc Loc = " + Loc + "; Loc = Loc[end = <14,38>]; Loc ==  |file:///home/paulk/pico.trm|(0,1,<2,3>,<14,38>);}
  	
  		public test bool testLocation12() = |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) == |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>);
  		public test bool testLocation13() = !(|file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) == |file:///home/paulk/pico.trm|(0,2,<2,3>,<4,5>));
  		public test bool testLocation14() = !(|file:///home/paulk/pico1.trm|(0,1,<2,3>,<4,5>) == |file:///home/paulk/pico2.trm|(0,1,<2,3>,<4,5>));
  		
  		public test bool testLocation15() = |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) != |file:///home/paulk/pico2.trm|(0,1,<2,3>,<4,5>);
  		public test bool testLocation16() = |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) != |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,7>);
  		public test bool testLocation17() = !(|file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) != |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>));
  		public test bool testLocation18() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) != |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,7>);
  		
  		public test bool testLocation19() = !(|file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) < |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
  		public test bool testLocation20() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) < |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>);
  		public test bool testLocation21() = !(|file:///home/paulk/pico.trm|(1,1,<2,3>,<4,5>) < |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
  		public test bool testLocation22() = !(|file:///home/paulk/pico.trm|(1,2,<2,3>,<4,5>) < |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
  		
  		
  		public test bool testLocation23() = |file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>) <= |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>);
  		public test bool testLocation24() = !(|file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>) <= |file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>));
  		public test bool testLocation25() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) <= |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>);
  		public test bool testLocation26() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) <= |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>);
  		public test bool testLocation27() = !(|file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>) <= |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
  		
  		
  		public test bool testLocation28() = |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>) > |file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>);
  		public test bool testLocation29() = !(|file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>) > |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>));
  		public test bool testLocation30() = !(|file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) > |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
  		public test bool testLocation31() = |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>) > |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>);
  		public test bool testLocation32() = !(|file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) > |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>));
  		
  		public test bool testLocation33() = |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>) >= |file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>);
  		public test bool testLocation34() = !(|file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>) >= |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>));
  		public test bool testLocation35() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) >= |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>);
  		public test bool testLocation36() = |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>) >= |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>);
  		public test bool testLocation37() = !(|file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) >= |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>));
  		
  		public test bool testLocation38() = |file:///xxx|(45,1,<1,45>,<1,46>) <= |file:///xxx|(40,6,<1,40>,<1,46>);
  		public test bool testLocation39() = |file:///xxx|(45,1,<1,45>,<1,46>) <= |file:///xxx|(40,7,<1,40>,<1,47>);
  	
  //	}
  	
  
  //	@Testb public void testList() {		
  		public test bool testList1() = [] == [];
  		public test bool testList2() = [] != [1];
  		public test bool testList3() = [1] == [1];
  		public test bool testList4() = [1] != [2];
  		public test bool testList5() = [1, 2] == [1, 2];
  		public test bool testList6() = [1, 2] != [2, 1];
  		
  		public test bool testList7() = [] + [] == [];
  		public test bool testList8() = [1, 2, 3] + [] == [1, 2, 3];
  		public test bool testList9() = [] + [1, 2, 3] == [1, 2, 3];
  		public test bool testList10() = [1, 2] + [3, 4, 5] == [1, 2, 3, 4, 5];	
  		
  		public test bool testList11() = ([1, 2] + [3, 4]) + [5] == [1, 2, 3, 4, 5];	
  		public test bool testList12() = [1, 2] + ([3, 4] + [5]) == [1, 2, 3, 4, 5];	
  		public test bool testList13() = [1, 2] + [3, 4] + [5] == [1, 2, 3, 4, 5];
  		
  		public test bool testList14() = [1, 2] + 3 == [1, 2, 3];
  		public test bool testList15() = 1 +  [2, 3] == [1, 2, 3];
  		
  		public test bool testList16() = [1,2,1,2,3,4,3,4,5] - 1 == [2,1,2,3,4,3,4,5];
  		public test bool testList17() = [1,2,1,2,3,4,3,4,5] - 2 == [1,1,2,3,4,3,4,5];
  		public test bool testList18() = [1,2,1,2,3,4,3,4,5] - 5 == [1,2,1,2,3,4,3,4];
  		
  		public test bool testList19() = [1,2,1,2,3,4,3,4,5] - [1] == [2,1,2,3,4,3,4,5];
  		public test bool testList20() = [1,2,1,2,3,4,3,4,5] - [2] == [1,1,2,3,4,3,4,5];
  		public test bool testList21() = [1,2,1,2,3,4,3,4,5] - [5] == [1,2,1,2,3,4,3,4];
  		
  		public test bool testList22() = [1,2,1,2,3,4,3,4,5] - [1,1] == [2,2,3,4,3,4,5];
  		public test bool testList23() = [1,2,1,2,3,4,3,4,5] - [1,1,1] == [2,2,3,4,3,4,5];
  		
  		public test bool testList24() = [1,2,1,2,3,4,3,4,5] - [1,2] == [1,2,3,4,3,4,5];
  		public test bool testList25() = [1,2,1,2,3,4,3,4,5] - [2,3] == [1,1,2,4,3,4,5];
  		
  		public test bool testList26() = [] & [1,2,4] == [];
  		public test bool testList27() = [1,2,3] & [] == [];
  		public test bool testList28() = [1,2,3,4,5,4,3,2,1] & [1,2,4] == [1,2,4,4,2,1];
  		
  		
  		public test bool testList29() = [] <= [];
  		public test bool testList30() = [] <= [1];
  // These commented out tests assume that <= etc. are ("half") ordering operations
  // Currently they are strictly subset implementations.
  //		public test bool testList() = [2, 1, 0] <= [2, 3];
  //		public test bool testList() = [2, 1] <= [2, 3, 0];
  		public test bool testList31() = [2, 1] <= [2, 1];
  		public test bool testList32() = [2, 1] <= [2, 1, 0];
  		
  		public test bool testList33() = [] < [1];
  //		public test bool testList() = [2, 1, 0] < [2, 3];
  //		public test bool testList() = [2, 1] < [2, 3, 0];
  		public test bool testList34() = [2, 1] < [2, 1, 0];
  		
  		public test bool testList35() = [] >= [];
  //		public test bool testList() = [1] >= [];
  //		public test bool testList() = [2, 3] >= [2, 1, 0];
  //		public test bool testList() = [2, 3, 0] >= [2, 1];
  		public test bool testList36() = [2, 1] >= [2, 1];
  		public test bool testList37() = [2, 1, 0] >= [2, 1];
  		
  		public test bool testList38() = [1] > [];
  //		public test bool testList() = [2, 3] > [2, 1, 0];
  //		public test bool testList() = [2, 3, 0] > [2, 1];
  		public test bool testList39() = [2, 1, 0] > [2, 1];
  		
  		public test bool testList40() = [] * [] == [];
  		public test bool testList41() = [1] * [9] == [<1,9>];
  		public test bool testList42() = [1, 2] * [9] == [<1,9>, <2,9>];
  		public test bool testList43() = [1, 2, 3] * [9] == [<1,9>, <2,9>, <3,9>];
  		public test bool testList44() = [1, 2, 3] * [9, 10] == [<1,9>, <1,10>, <2,9>, <2,10>, <3,9>, <3,10>];
  		
  		public test bool testList45() = 2 in [1, 2, 3];
  		public test bool testList46() = 3 notin [2, 4, 6];
  		
  		public test bool testList47() = 2 > 3 ? [1,2] : [1,2,3] == [1,2,3];
  //	}
  
  	@expected{IndexOutOfBounds}
  	public test bool  SubscriptError11() {
  		[1,2][5];return false;
  	}
  	
  //	@Test  public void listSplicing(){
  		public test bool testListSplicing1() =  [1,2,3] == [1,2,3];
  		public test bool testListSplicing2() = [*1,2,3] == [1,2,3];
  		public test bool testListSplicing3() = [1,*2,3] == [1,2,3];
  		public test bool testListSplicing4() = [1,2,*3] == [1,2,3];
  		public test bool testListSplicing5() = [*1,*2,3] == [1,2,3];
  		
  		public test bool testListSplicing6() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1] == [[1,2]];}
  		public test bool testListSplicing7() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1] == [1,2];}
  		
  		public test bool testListSplicing8() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,3] == [[1,2],3];}
  		public test bool testListSplicing9() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,3] == [1,2,3];}
  		
  		public test bool testListSplicing10() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,L2] == [[1,2],[3,4]];}
  		public test bool testListSplicing11() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,L2] == [1,2,[3,4]];}
  		public test bool testListSplicing12() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,*L2] == [[1,2],3,4];}
  		public test bool testListSplicing13() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,*L2] == [1,2,3,4];}
  		
  		public test bool testListSplicing14() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,L2,5] == [[1,2],[3,4],5];}
  		public test bool testListSplicing15() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,L2,5] == [1,2,[3,4],5];}
  		public test bool testListSplicing16() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,*L2,5] == [[1,2],3,4,5];}
  		public test bool testListSplicing17() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,*L2,5] == [1,2,3,4,5];}
  		
  		public test bool testListSplicing18() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[L1]] == [[[1,2]]];}
  		public test bool testListSplicing19() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1]] == [[1,2]];}
  		
  		public test bool testListSplicing20() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[L1],3] == [[[1,2]],3];}
  		public test bool testListSplicing21() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1],3] == [[1,2],3];}	
  		
  		public test bool testListSplicing22() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[L1],[L2]] == [[[1,2]],[[3,4]]];}
  		public test bool testListSplicing23() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1],[L2]] == [[1,2],[[3,4]]];}
  		
  		public test bool testListSplicing24() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[L1],[*L2]] == [[[1,2]],[3,4]];}
  		public test bool testListSplicing25() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1],[*L2]] == [[1,2],[3,4]];}
  		
  		public test bool testListSplicing26() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*[*L1],[*L2]] == [1,2,[3,4]];}
  		public test bool testListSplicing27() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1],*[*L2]] == [[1,2],3,4];}
  		public test bool testListSplicing28() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*[*L1],*[*L2]] == [1,2,3,4];}
  	
  		public test bool testListSplicing29() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,[L2]] == [[1,2],[[3,4]]];}
  		public test bool testListSplicing30() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,[L2]] == [1,2,[[3,4]]];}
  		public test bool testListSplicing31() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,[*L2]] == [[1,2],[3,4]];}
  		public test bool testListSplicing32() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,[*L2]] == [1,2,[3,4]];}
  		public test bool testListSplicing33() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,*[*L2]] == [1,2,3,4];}
  
  		public test bool testListSplicing34() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,[L2],5] == [[1,2],[[3,4]],5];}
  		public test bool testListSplicing35() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,[L2],5] == [1,2,[[3,4]],5];}
  		public test bool testListSplicing36() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,[*L2],5] == [[1,2],[3,4],5];}
  		
  		public test bool testListSplicing37() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[list[list[int]]] L3 = [[L1]]; return L3 == [[[1,2]]];}
  		public test bool testListSplicing38() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[value] L3 = [[L1],3]; return L3 == [[[1,2]],3];}
  		public test bool testListSplicing39() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[list[list[int]]] L3 = [[L1],[L2]]; return L3 == [[[1,2]],[[3,4]]];}
  		public test bool testListSplicing40() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[value] L3 = [L1,[L2]]; return L3 == [[1,2],[[3,4]]];}
  		public test bool testListSplicing41() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[value] L3 = [L1,[L2],5]; return L3 == [[1,2],[[3,4]],5];}
  //	}
  
  //	@Test public void testSetInListSplicing() {
  		public test bool testSetInListSplicing1() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return [L1,S2,5] == [[1,2],{3,4},5];}
  		public test bool testSetInListSplicing2() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return [*L1,S2,5] == [1,2,{3,4},5];}
  		public test bool testSetInListSplicing3() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return ([L1,*S2,5] == [[1,2],3,4,5]) || ([L1,*S2,5] == [[1,2],4,3,5]);}
  		public test bool testSetInListSplicing4() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return ([*L1,*S2,5] == [1,2,3,4,5]) || ([*L1,*S2,5] == [1,2,4,3,5]) ;}
  //	}
  
  //	@Test public void testRange() {
  		
  		public test bool testRange1() = [1 .. 1] == [];
  		public test bool testRange2() = [1 .. 2] == [1];
  		public test bool testRange3() = [1 .. -1] == [1, 0];
  		public test bool testRange4() = [1, 2 .. 10] == [1,2,3,4,5,6,7,8,9];
  		public test bool testRange5() = [1, 3 .. 10] == [1,3,5,7,9];
  		public test bool testRange6() = [1, -2 .. 10] == [];
  		public test bool testRange7() = [1, -3 .. -10] == [1,-3,-7];
  //	}
  	
  //	@Test public void testSet1()  {
  		
  		public test bool testSet1() = {} == {};
  		public test bool testSet2() = {} != {1};
  		public test bool testSet3() = {1} == {1};
  		public test bool testSet4() = {1} != {2};
  		public test bool testSet5() = {1, 2} == {1, 2};
  		public test bool testSet6() = {1, 2} == {2, 1};
  		public test bool testSet7() = {1, 2, 3, 1, 2, 3} == {3, 2, 1};	
  		
  		public test bool testSet8() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  		public test bool testSet9() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {10, 2, 3, 4, 5, 6, 7, 8, 9, 1};
  		public test bool testSet10() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
  		public test bool testSet11() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {10, 9, 7, 4, 5, 6, 3, 8, 2, 1};
  		public test bool testSet12() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {10, 9, 7, 6, 5, 4, 3, 8, 2, 1};
  		
  		public test bool testSet13() = {{1}, {2}} == {{2}, {1}};
  		public test bool testSet14() = {{}} == {{}};
  		public test bool testSet15() = {{}, {}} == {{}};
  		public test bool testSet16() = {{}, {}, {}} == {{}};
  		
  		public test bool testSet17() = {{1, 2}, {3,4}} == {{2,1}, {4,3}};	
  	
  		public test bool testSet18() = {} + {} == {};
  		public test bool testSet19() = {1, 2, 3} + {} == {1, 2, 3};
  		public test bool testSet20() = {} + {1, 2, 3} == {1, 2, 3};
  		public test bool testSet21() = {1, 2} + {3, 4, 5} == {1, 2, 3, 4, 5};	
  		public test bool testSet22() = {1, 2, 3, 4} + {3, 4, 5} == {1, 2, 3, 4, 5};
  		public test bool testSet23() = {{1, 2}, {3,4}} + {{5,6}} == {{1,2},{3,4},{5,6}};
  		public test bool testSet24() = 1 + {2,3} == {1,2,3};
  		public test bool testSet25() = {1,2} + 3 == {1,2,3};
  		
  		public test bool testSet26() = {} - {} == {};
  		public test bool testSet27() = {1, 2, 3} - {} == {1, 2, 3};
  		public test bool testSet28() = {} - {1, 2, 3} == {};
  		public test bool testSet29() = {1, 2, 3} - {3, 4, 5} == {1, 2};	
  		public test bool testSet30() = {1, 2, 3, 4} - {1, 2, 3, 4, 5} == {};
  		public test bool testSet31() = {{1, 2}, {3,4}, {5,6}} - {{3,4}} == {{1,2}, {5,6}};
  		public test bool testSet32() = {1,2,3} - 3 == {1,2};
  		
  		public test bool testSet33() = {} & {} == {};
  		public test bool testSet34() = {1, 2, 3} & {} == {};
  		public test bool testSet35() = {} & {1, 2, 3} == {};
  		public test bool testSet36() = {1, 2, 3} & {3, 4, 5} == {3};	
  		public test bool testSet37() = {1, 2, 3, 4} & {3, 4, 5} == {3, 4};	
  		public test bool testSet38() = {{1,2},{3,4},{5,6}} & {{2,1}, {8,7}, {6,5}} == {{1,2},{5,6}};
  		
  		public test bool testSet39() = {} <= {};
  		public test bool testSet40() = {} <= {1};
  		public test bool testSet41() = {2, 1} <= {1, 2};
  		public test bool testSet42() = {2, 1} <= {1, 2, 3};
  		public test bool testSet43() = {2, 1} <= {2, 1, 0};
  	
  		public test bool testSet44() = {} < {1};
  		public test bool testSet45() = {2, 1} < {2, 1, 3};
  	
  		public test bool testSet46() = {} >= {};
  		public test bool testSet47() = {1} >= {};
  		public test bool testSet48() = {2, 3} >= {2};
  	
  		public test bool testSet49() = {1} > {};
  		public test bool testSet50() = {2, 1, 3} > {2, 3};
  		
  		public test bool testSet51() = {} * {} == {};
  		public test bool testSet52() = {1} * {9} == {<1,9>};
  		public test bool testSet53() = {1, 2} * {9} == {<1,9>, <2,9>};
  		public test bool testSet54() = {1, 2, 3} * {9} == {<1,9>, <2,9>, <3,9>};
  		public test bool testSet55() = {1, 2, 3} * {9, 10} == {<1,9>, <1,10>, <2,9>, <2,10>, <3,9>, <3,10>};
  		
  		
  		public test bool testSet56() = 2 in {1, 2, 3};
  		public test bool testSet57() = {4,3} in {{1, 2}, {3,4}, {5,6}};
  		
  		public test bool testSet58() = 5 notin {1, 2, 3};
  		public test bool testSet59() = {7,8} notin {{1, 2}, {3,4}, {5,6}};
  		
  		public test bool testSet60() = ((3 > 2) ? {1,2} : {1,2,3}) == {1,2};
  		
  		public test bool testSet61() = {<"a", [1,2]>, <"b", []>, <"c", [4,5,6]>} != {};
  //	}
  
  /*
  	private boolean auxTest(String S1, String S2){
  		return runTestInSameEvaluator(S1 + "==" + S2);
  	}
  */	
  	//
  	// Some nested set patterns to test backtracking behaviour.
  	//
  	
  data TYPESET = SET(str name) | SUBTYPES(TYPESET tset) | INTERSECT(set[TYPESET] tsets);
  //	@Test public void testSet2(){
  		
  		public test bool testSet62() = {INTERSECT({TYPESET t1, *TYPESET rest}), TYPESET t2} :=  {INTERSECT({SET("a"), SET("b")}), SET("c")};
  		public test bool testSet63() = {INTERSECT({TYPESET t1, *TYPESET rest}),  t1} :=  {INTERSECT({SET("a"), SET("b")}), SET("a")};
  		public test bool testSet64() = {INTERSECT({TYPESET t1, *TYPESET rest}),  t1} :=  {INTERSECT({SET("b"), SET("a")}), SET("a")};
  
  		public test bool testSet65() =  { <t1, t2> | INTERSECT({TYPESET t1, *TYPESET t2}) :=  INTERSECT({SET("b"), SET("a")})} == 
  						   { <SET("b"),{SET("a")}>, <SET("a"),{SET("b")}>};
  	
  	
  		public test bool testSet66() = {<t1, rest, t2> | {INTERSECT({TYPESET t1, *TYPESET rest}),  t2} :=  {INTERSECT({SET("a"), SET("b")}) , SET("b")}}==
  				           { <SET("a"),{SET("b")},SET("b")>, <SET("b"),{SET("a")},SET("b")>};
  
  		public test bool testSet67() = {<t1, rest> | {INTERSECT({TYPESET t1, *TYPESET rest}),  t1} :=  {INTERSECT({SET("a"), SET("b")}), SET("b")}}==
  				           {<SET("b"),{SET("a")}>};
  //	}
  
  	//
  	// Anastassija's type constraint examples
  	// Tests for "simp" version
  	//
  	
  //	private void simpTests(){
  //	
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({  })), SET("s1") }))",
  //							"INTERSECT({ SUBTYPES(INTERSECT({  })), SET("s1") })
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({SET("s1")  })), SET("s2") }))",
  //		   	    			"INTERSECT({ SUBTYPES(INTERSECT({SET("s1") })), SET("s2") })
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1") })), SET("s1") }))",
  //		        			"INTERSECT({ SUBTYPES(INTERSECT({             })), SET("s1") });
  //	
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1") })), SET("s1"), SET("s2")  }))",
  //							"INTERSECT({ SUBTYPES(INTERSECT({             })), SET("s1"), SET("s2")  });
  //	
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1") })), SET("s2"), SET("s1")  }))",
  //							"INTERSECT({ SUBTYPES(INTERSECT({             })), SET("s2"), SET("s1")  });
  //
  //
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3") }))",
  //               				"INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3") });
  //	
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3"), SET("s4") }))",
  //   		    		  		"INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3"), SET("s4")  });
  //
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s3") })), SET("s1") }))",
  //							"INTERSECT({ SUBTYPES(INTERSECT({              SET("s3") })), SET("s1") });
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3"))})), SET("s3") }))",
  //            				"INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3"))})), SET("s3") });
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s70"), SET("s4")})), SET("s70") }))",
  //            				"INTERSECT({ SUBTYPES(INTERSECT({               SET("s4")})), SET("s70") });
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s3")) })), SET("s1") }))",
  //             				"INTERSECT({ SUBTYPES(INTERSECT({              SUBTYPES(SET("s3")) })), SET("s1") });
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") }))",   
  //            				"INTERSECT({ SUBTYPES(INTERSECT({              SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") });
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s2")) })), SUBTYPES(SET("s2")), SET("s1") }))",
  //            				"INTERSECT({ SUBTYPES(INTERSECT({                                    })), SUBTYPES(SET("s2")), SET("s1") });	
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3")), SUBTYPES(SET("s2")) })), SUBTYPES(SET("s2")) }))",
  //            				"INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3"))                        })), SUBTYPES(SET("s2")) });
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s2")), SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") }))",
  //             				"INTERSECT({ SUBTYPES(INTERSECT({                                     SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") });
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2"), SET("s3"), SET("s5") })), SET("s6"), SET("s2"), SET("s7"), SET("s1") }))",
  //            				"INTERSECT({ SUBTYPES(INTERSECT({                           SET("s3"), SET("s5") })), SET("s6"), SET("s2"), SET("s7"), SET("s1") });
  //
  //	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s2")), SET("s3"), SET("s5") })), SET("s6"), SUBTYPES(SET("s2")), SET("s7"), SET("s1"), SET("s3") }))",
  //							"INTERSECT({ SUBTYPES(INTERSECT({                                                  SET("s5") })), SET("s6"), SUBTYPES(SET("s2")), SET("s7"), SET("s1"), SET("s3") });
  //
  //	}
  
  
  	
  	// private void funTests(){
  		
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({  })), SET("s1") }) ==
  //						   INTERSECT({ SUBTYPES(INTERSECT({  })), SET("s1") });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({SET("s1")  })), SET("s2") })==
  //			   	    	   INTERSECT({ SUBTYPES(INTERSECT({SET("s1") })),  SET("s2") });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1") })), SET("s1") })==
  //			        	   INTERSECT({ SUBTYPES(INTERSECT({             })), SET("s1") });
  //		
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1") })), SET("s1"), SET("s2")  })==
  //						   INTERSECT({ SUBTYPES(INTERSECT({             })), SET("s1"), SET("s2")  });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1") })), SET("s2"), SET("s1")  })==
  //						   INTERSECT({ SUBTYPES(INTERSECT({             })), SET("s2"), SET("s1")  });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3") })==
  //	               		   INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3") });
  //		
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3"), SET("s4") })==
  //        		   		    INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3"), SET("s4")  });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s3") })), SET("s1") })==
  //						   INTERSECT({ SUBTYPES(INTERSECT({              SET("s3") })), SET("s1") });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3"))})), SET("s3") })==
  //	            		   INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3"))})), SET("s3") });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s70"), SET("s4")})), SET("s70") })==
  //	            		   INTERSECT({ SUBTYPES(INTERSECT({               SET("s4")})), SET("s70") });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s3")) })), SET("s1") })==
  //	             		   INTERSECT({ SUBTYPES(INTERSECT({              SUBTYPES(SET("s3")) })), SET("s1") });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") })== 
  //	            		   INTERSECT({ SUBTYPES(INTERSECT({              SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s2")) })), SUBTYPES(SET("s2")), SET("s1") })==
  //	            		   INTERSECT({ SUBTYPES(INTERSECT({                                    })), SUBTYPES(SET("s2")), SET("s1") });	
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3")), SUBTYPES(SET("s2")) })), SUBTYPES(SET("s2")) })==
  //	            		   INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3"))                        })), SUBTYPES(SET("s2")) });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s2")), SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") })==
  //	             		   INTERSECT({ SUBTYPES(INTERSECT({                                     SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2"), SET("s3"), SET("s5") })), SET("s6"), SET("s2"), SET("s7"), SET("s1") })==
  //	            		   INTERSECT({ SUBTYPES(INTERSECT({                           SET("s3"), SET("s5") })), SET("s6"), SET("s2"), SET("s7"), SET("s1") });
  //
  //		public test bool assertTrue() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s2")), SET("s3"), SET("s5") })), SET("s6"), SUBTYPES(SET("s2")), SET("s7"), SET("s1"), SET("s3") })==
  //						   INTERSECT({ SUBTYPES(INTERSECT({                                                  SET("s5") })), SET("s6"), SUBTYPES(SET("s2")), SET("s7"), SET("s1"), SET("s3") });
  
  //		}
  
  	
  	//
  	// Anastassija's type constraint examples
  	// Version 1; with explicit simplification function, no non-linear constraints, fail to explore alternative matches
  	//
  	
  	//@Test
  	//public void testSet3()  {
  	//	prepare("data TYPESET = SET(str name) | SUBTYPES(TYPESET tset) | INTERSECT(set[TYPESET] tsets);");
  	//	
  	//	prepareMore("public TYPESET simp(TYPESET ts){" +
  	//		           "for(INTERSECT({ SUBTYPES(INTERSECT({ TYPESET tset, *TYPESET rest})), TYPESET tset1, *TYPESET rest1 }) := ts){" +
  	//		                "if(tset == tset1) return simp(INTERSECT({ SUBTYPES(INTERSECT(rest)), tset1, *rest1 }));" +
  	//		                "else  fail;" +
  	//		           "}" +
  	//		           "return ts;" +
  	//	            "}");
  	//	simpTests();
  	//	}
  	//
  	//
  	// Anastassija's type constraint examples
  	// Version 2; with explicit simplification function, and non-linear constraints (tset)
  	//
  	
  	//@Test
  	//public void testSet4()  {
  	//	prepare("data TYPESET = SET(str name) | SUBTYPES(TYPESET tset) | INTERSECT(set[TYPESET] tsets);");
  	//	
  	//	prepareMore("public TYPESET simp(TYPESET ts){" +
  	//		           "if(INTERSECT({ SUBTYPES(INTERSECT({ TYPESET tset, *TYPESET rest})), tset, *TYPESET rest1 }) := ts){" +
  	//		                "return simp(INTERSECT({ SUBTYPES(INTERSECT(rest)), tset, *rest1 }));" +
  	//		           "}" +
  	//		           "return ts;" +
  	//	            "}");
  	//	
  	//	simpTests();
  	//}
  	
  	//
  	// Anastassija's type constraint examples
  	// Version 3; with explicit simplification function, non-linear constraints (tset) and nested simp call
  	//
  	
  	//@Test
  	//public void testSet5()  {
  	//	prepare("data TYPESET = SET(str name) | SUBTYPES(TYPESET tset) | INTERSECT(set[TYPESET] tsets);");
  	//	
  	//	prepareMore("public TYPESET simp(TYPESET ts){" +
  	//		           "if(INTERSECT({ SUBTYPES(INTERSECT({ TYPESET tset, *TYPESET rest})), tset, *TYPESET rest1 }) := ts){" +
  	//		                "return simp(INTERSECT({ SUBTYPES(simp(INTERSECT(rest))), tset, *rest1 }));" +
  	//		           "}" +
  	//		           "return ts;" +
  	//	            "}");
  	//	
  	//	simpTests();
  	//}
  
  
  	//
  	// Anastassija's type constraint examples
  	// Version 4; with overloaded constructor INTERSECT , and non-linear constraints (tset)
  	//
  //	@Test
  //	public void testSet6()  {
  //		prepare("data TYPESET = SET(str name) | SUBTYPES(TYPESET tset) | INTERSECT(set[TYPESET] tsets);");
  //		
  //		prepareMore("public TYPESET INTERSECT({ SUBTYPES(INTERSECT({ TYPESET tset, *TYPESET rest})), tset, *TYPESET rest1 }) {" +
  //		               " return INTERSECT({ SUBTYPES(INTERSECT(rest)), tset, *rest1 });" +
  //				    "}");
  //
  //		funTests();
  //	}
  //	
  //	@Test
  //	public void testSetMultiVariable()  {
  //		public test bool assertTrue() = {*value S1, *value S2} := {} && (S1 == {}) && (S2 == {});
  //		public test bool assertTrue() = {*S1, *S2} := {} && (S1 == {}) && (S2 == {});
  //		
  //		public test bool assertTrue() = {*int S1, *int S2} := {100} && ((S1 == {100} && S2 == {}) || (S1 == {} && S2 == {100}));
  //		public test bool assertTrue() = {*S1, *S2} := {100} && ((S1 == {100} && S2 == {}) || (S1 == {} && S2 == {100}));
  //		
  //		public test bool assertTrue() = {R = for({*int S1, *int S2} := {100}) append <S1, S2>; R == [<{100}, {}>, <{}, {100}> ];}
  //		public test bool assertTrue() = {R = for({*S1, *S2} := {100}) append <S1, S2>; R == [<{100}, {}>, <{}, {100}> ];}
  //
  //		public test bool assertTrue() = {R = for({*S1, *S2} := {100}) append <S1, S2>; R == [<{100}, {}>, <{}, {100}> ];}
  //		//
  //		// TODO: the following test requires a specific implementation specific
  //		// set representation and, thus, should be refactored. To check
  //		// splicing, without taking order into account, the list 'R' is now
  //		// converted to a set.
  //		//
  //		public test bool assertTrue() = {R = for({*S1, *S2} := {100, 200}) append <S1, S2>; {*R} == {<{200,100}, {}>, <{200}, {100}>, <{100}, {200}>, <{}, {200,100}>};}
  //		public test bool assertTrue() = {R = for({*int S1, *S2} := {100, "a"})  append <S1, S2>; R == [<{100}, {"a"}>, <{},{100,"a"}>];}
  //		public test bool assertTrue() = {R = for({*int S1, *str S2} := {100, "a"}) append <S1, S2>; R == [<{100}, {"a"}>];}
  //		
  //		public test bool assertTrue() = {R = for({*str S1, *S2} := {100, "a"})  append <S1, S2>; R == [<{"a"},{100}>, <{},{100,"a"}>];}
  //		public test bool assertTrue() = {R = for({*str S1, *int S2} := {100, "a"})  append <S1, S2>; R == [<{"a"},{100}>];}
  //		
  //		public test bool assertTrue() = !({*str S1, *str S2} := {100, "a"};
  //		public test bool assertTrue() = !({*int S1, *int S2} := {100, "a"};
  //
  //	}
  
    
  	public test bool addSetError1() {
  		return {1,2,3} + true=={1,2,3,true};
  	}
      
  		public test bool testSet3() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1} == {{1,2}};}
  		public test bool testSet4() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1} == {1,2};}
  		
  		public test bool testSet5() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,3} == {{1,2},3};}
  		public test bool testSet6() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,3} == {1,2,3};}
  		
  		public test bool testSet7() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,S2} == {{1,2},{3,4}};}
  		public test bool testSet8() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,S2} == {1,2,{3,4}};}
  		public test bool testSet9() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,*S2} == {{1,2},3,4};}
  		public test bool testSet10() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,*S2} == {1,2,3,4};}
  	
  		
  		public test bool testSet11() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,S2,5} == {{1,2},{3,4},5};}
  		public test bool testSet12() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,S2,5} == {1,2,{3,4},5};}
  		public test bool testSet13() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,*S2,5} == {{1,2},3,4,5};}
  		public test bool testSet14() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,*S2,5} == {1,2,3,4,5};}
  		
  		public test bool testSet15() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{S1}} == {{{1,2}}};}
  		
  		public test bool testSet16() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{*S1}}   == {{1,2}};}
  		public test bool testSet17() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{*S1}} == {1,2};}
  		
  		public test bool testSet18() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{S1},3} == {{{1,2}},3};}
  		public test bool testSet19() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{S1},3} == {{1,2},3};}
  		public test bool testSet20() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{*S1},3} == {1,2,3};}
  		
  		public test bool testSet21() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{*S1},2} == {1,2};}
  	
  		public test bool testSet22() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{S1},{S2}} == {{{1,2}},{{3,4}}};}
  		public test bool testSet23() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{S1},{S2}} == {{1,2},{{3,4}}};}
  		public test bool testSet24() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{S1},*{S2}} == {{{1,2}},{3,4}};}
  		public test bool testSet25() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{S1},*{S2}} == {{1,2},{3,4}};}
  		public test bool testSet26() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{*S1},*{*S2}} == {1,2,3,4};}
  		
  		
  		public test bool testSet27() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,{S2}} == {{1,2},{{3,4}}};}
  		public test bool testSet28() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,{*S2}} == {{1,2},{3,4}};}
  		public test bool testSet29() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,*{*S2}} == {{1,2},3,4};}
  		
  		
  		public test bool testSet30() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,{S2},5} == {{1,2},{{3,4}},5};}
  		public test bool testSet31() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,{*S2},5} == {{1,2},{3,4},5};}
  		public test bool testSet32() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,*{*S2},5} == {{1,2},3,4,5};}
  		public test bool testSet33() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,*{*S2},5} == {1,2,3,4,5};}
  		
  		public test bool testSet34() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[set[set[int]]] S3 = {{S1}}; return S3 == {{{1,2}}};}
  		
  		public test bool testSet35() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[value] S3 = {{S1},3}; return S3 == {{{1,2}},3};}
  		public test bool testSet36() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[set[set[int]]] S3 = {{S1},{S2}};return  S3 == {{{1,2}},{{3,4}}};}
  		public test bool testSet37() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[value] S3 = {S1,{S2}}; return S3 == {{1,2},{{3,4}}};}
  		public test bool testSet38() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[value] S3 = {S1,{S2},5}; return S3 == {{1,2},{{3,4}},5};}
  	
  
  	// @Test public void testListInSetSplicing() {
  		public test bool testListInSplicing39() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return {L1,S2,5} == {[1,2],{3,4},5};}
  		public test bool testListInSplicing40() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return {*L1,S2,5} == {1,2,{3,4},5};}
  		public test bool testListInSplicing41() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return {L1,*S2,5} == {[1,2],3,4,5};}
  		public test bool testListInSplicing42() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return {*L1,*S2,5} == {1,2,3,4,5};}
  	// }
  	
  //	@Test public void testMap()  {
  		
  		public test bool testMap43() = () == ();
  		public test bool testMap44() = (1:10) != ();
  		public test bool testMap45() = (1:10) == (1:10);
  		public test bool testMap46() = (1:10) != (2:20);
  		
  		public test bool testMap47() = () + () == ();
  		public test bool testMap48() = (1:10) + () == (1:10);
  		public test bool testMap49() = (1:10) + (2:20) == (1:10, 2:20);
  		public test bool testMap50() = (1:10, 2:20) + (2:25) == (1:10, 2:25);
  		
  		public test bool testMap51() = () - () == ();
  		public test bool testMap52() = (1:10, 2:20) - () == (1:10,2:20);
  		public test bool testMap53() = (1:10, 2:20) - (2:20) == (1:10);
  		public test bool testMap54() = (1:10, 2:20) - (2:25) == (1:10); // This is current behaviour; is this ok?
  	
  		public test bool testMap55() = () & () == ();
  		public test bool testMap56() = (1:10) & () == ();
  		public test bool testMap57() = (1:10, 2:20, 3:30, 4:40) & (2:20, 4:40, 5:50) == (2:20, 4:40);
  		public test bool testMap58() = (1:10, 2:20, 3:30, 4:40) & (5:50, 6:60) == ();
  		
  		public test bool testMap59() = () <= ();
  		public test bool testMap60() = () <= (1:10);
  		public test bool testMap61() = (1:10) <= (1:10);
  		public test bool testMap62() = (1:10) <= (1:10, 2:20);
  		
  		public test bool testMap63() = !(() < ());
  		public test bool testMap64() = () < (1:10);
  		public test bool testMap65() = !((1:10) < (1:10));
  		public test bool testMap66() = (1:10) < (1:10, 2:20);
  		
  		public test bool testMap67() = () >= ();
  		public test bool testMap68() = (1:10) >= ();
  		public test bool testMap69() = (1:10) >= (1:10);
  		public test bool testMap70() = (1:10, 2:20) >= (1:10);
  		
  		public test bool testMap71() = !(() > ());
  		public test bool testMap72() = (1:10) > ();
  		public test bool testMap73() = !((1:10) > (1:10));
  		public test bool testMap74() = (1:10, 2:20) > (1:10);
  		
  		
  		public test bool testMap75() = 1 in (1:10, 2:20);
  		public test bool testMap76() = !(3 in (1:10, 2:20));
  		
  		public test bool testMap77() = 3 notin (1:10, 2:20);
  		public test bool testMap78() = !(2 notin (1:10, 2:20));
  		
  		public test bool testMap79() {map[str,list[int]] m = ("a": [1,2], "b": [], "c": [4,5,6]); return m["a"] == [1,2];}
  //	}
 
  	 
  	 
  	 @expected{Throw}
  	 public void NoKeyError1(){
  		 (1:10, 2:20)[3];return false;
  	 }
  	 
  	 @expected{Throw}  // MultipleKey
  	 public void MultipleKeyError1(){
  		 (1:10, 1:10);return false;
  	 }
  	
  	// @Test public void testTuple() {
  		
  		public test bool testTuple80() = <1, 2.5, true> == <1, 2.5, true>;
  		public test bool testTuple81() = <1, 2.5, true> != <0, 2.5, true>;
  		public test bool testTuple82() = <{1,2}, 3> == <{2,1}, 3>;
  		public test bool testTuple83() = <1, {2,3}> == <1, {3,2}>;
  		public test bool testTuple84() = <{1,2}, {3,4}> == <{2,1},{4,3}>;
  		
  		public test bool testTuple85() = <1>           >= <1>;
  		public test bool testTuple86() = <2>           >= <1>;
  		public test bool testTuple87() = <1,2>         >= <1>;
  		public test bool testTuple88() = <1,2>         >= <1,2>;
  		public test bool testTuple89() = <1,2>         >= <1, 1>;
  		public test bool testTuple90() = <1,"def">   >= <1, "abc">;
  		public test bool testTuple91() = <1, [2,3,4]>  >= <1, [2,3]>;
  		public test bool testTuple92() = <1, [2,3]>    >= <1, [2,3]>;
  		
  		public test bool testTuple93() = !(<1>          > <1>);
  		public test bool testTuple94() = <2>           > <1>;
  		public test bool testTuple95() = <1,2>         > <1>;
  		public test bool testTuple96() = !(<1,2>        > <1,2>);
  		public test bool testTuple97() = <1,2>         > <1, 1>;
  		public test bool testTuple98() = <1,"def">   > <1, "abc">;
  		public test bool testTuple99() = <1, [2,3,4]>  > <1, [2,3]>;
  		public test bool testTuple100() = !(<1, [2,3]>   > <1, [2,3]>);
  		
  		public test bool testTuple101() = <1>           <= <1>;
  		public test bool testTuple102() = <1>           <= <2>;
  		public test bool testTuple103() = <1>           <= <1,2>;
  		public test bool testTuple104() = <1,2>         <= <1,2>;
  		public test bool testTuple105() = <1,1>         <= <1, 2>;
  		public test bool testTuple106() = <1,"abc">   <= <1, "def">;
  		public test bool testTuple107() = <1, [2,3]>    <= <1, [2,3,4]>;
  		public test bool testTuple108() = <1, [2,3]>    <= <1, [2,3]>;
  		
  		public test bool testTuple109() = !(<1>          < <1>);
  		public test bool testTuple110() = <1>           < <2>;
  		public test bool testTuple111() = <1>           < <1,2>;
  		public test bool testTuple112() = !(<1,2>        < <1,2>);
  		public test bool testTuple113() = <1,1>         < <1, 2>;
  		public test bool testTuple114() = <1,"abc">   < <1, "def">;
  		public test bool testTuple115() = <1, [2,3]>    < <1, [2,3,4]>;
  		public test bool testTuple116() = !(<1, [2,3]>   < <1, [2,3]>);
  		
  		public test bool testTuple117() = <1, "a", true> + <1.5, "def"> == <1, "a", true> + <1.5, "def">;
  	// }
  	 
  	
  // @Test public void namedTuple()  {
  		
  		public test bool testNamedTuple118() {tuple[int key, str val] T = <1, "abc">; return T.key == 1;}
  		public test bool testNamedTuple119() {tuple[int key, str val] T = <1, "abc">; return T.val == "abc";}	
  		
  // }
  	
 // 	@Test public void testRelation1()  {
  		public test bool testRelation120() = {} == {};
  		public test bool testRelation121() = {<1,10>} == {<1,10>};
  		public test bool testRelation122() = {<1,2,3>} == {<1,2,3>};
  		public test bool testRelation123() = {<1,10>, <2,20>} == {<1,10>, <2,20>};
  		public test bool testRelation124() = {<1,10>, <2,20>, <3,30>} == {<1,10>, <2,20>, <3,30>};
  		public test bool testRelation125() = {<1,2,3>, <4,5,6>} == {<4,5,6>, <1,2,3>};
  		public test bool testRelation126() = {<1,2,3,4>, <4,5,6,7>} == {<4,5,6,7>, <1,2,3,4>};
  		
  		public test bool testRelation127() = {} != {<1,2>, <3,4>};
  		public test bool testRelation128() = !({<1,2>, <3,4>} == {});
  		
  		public test bool testRelation129() = {<1, {1,2,3}>, <2, {2,3,4}>} ==  {<1, {1,2,3}>, <2, {2,3,4}>};
  		public test bool testRelation130() = {<1, {1,2,3}>, <2, {2,3,4}>} ==  {<2, {2,3,4}>, <1, {1,2,3}>};
  		public test bool testRelation131() = {<1, {1,2,3}>, <2, {2,3,4}>} ==  {<2, {4,3,2}>, <1, {2,1,3}>};
  		
  		public test bool testRelation132() = {<1,10>} + {} == {<1,10>};
  		public test bool testRelation133() = {} + {<1,10>}  == {<1,10>};
  		public test bool testRelation134() = {<1,10>} + {<2,20>} == {<1,10>, <2,20>};
  		public test bool testRelation135() = {<1,10>, <2,20>} + {<3,30>} == {<1,10>, <2,20>, <3,30>};
  		public test bool testRelation136() = {<1,10>, <2,20>} + {<2,20>, <3,30>} == {<1,10>, <2,20>, <3,30>};
  		
  		public test bool testRelation137() = {<1,10>} - {} == {<1,10>};
  		public test bool testRelation138() = {} - {<1,10>}  == {};
  		public test bool testRelation139() = {<1,10>, <2,20>} - {<2,20>, <3,30>} == {<1,10>};
  		
  		public test bool testRelation140() = {<1,10>} & {} == {};
  		public test bool testRelation141() = {} & {<1,10>}  == {};
  		public test bool testRelation142() = {<1,10>, <2,20>} & {<2,20>, <3,30>} == {<2,20>};
  		public test bool testRelation143() = {<1,2,3,4>, <2,3,4,5>} & {<2,3,4,5>,<3,4,5,6>} == {<2,3,4,5>};
  		
  		public test bool testRelation144() = <2,20> in {<1,10>, <2,20>, <3,30>};
  		public test bool testRelation145() = <1,2,3> in {<1,2,3>, <4,5,6>};
  		
  		public test bool testRelation146() = <4,40> notin {<1,10>, <2,20>, <3,30>};
  		public test bool testRelation147() = <1,2,4> notin {<1,2,3>, <4,5,6>};
  		
  		public test bool testRelation148() = {} o {} == {};
  		public test bool testRelation149() = {<1,10>,<2,20>} o {} == {};
  		public test bool testRelation150() = {} o {<10,100>, <20,200>} == {};
  		public test bool testRelation151() = {<1,10>,<2,20>} o {<10,100>, <20,200>} == {<1,100>, <2,200>};
  		
  		public test bool testRelation152() = {<1, "a">, <2, "b">} * {<false, 0>, <true, 1>} == {<<1,"a">,<false,0>>,<<2,"b">,<false,0>>,<<1,"a">,<true,1>>,<<2,"b">,<true,1>>};
  
  		public test bool testRelation153() = {<1,2>} join {<2,3>} == {<1,2,2,3>};
  		public test bool testRelation154() = {<1,2>} join {} == {};
  		public test bool testRelation155() = {} join {<2,3>} == {};
  		public test bool testRelation156() = {} join {} == {};
  		public test bool testRelation157() = {<1,2>} join {3} == {<1,2,3>};
  		public test bool testRelation158() = {<1,2>} join {3, 4} == {<1,2,3>, <1,2,4>};
  		public test bool testRelation159() = {1} join {2} == {<1,2>};
  		public test bool testRelation160() = {1,2,3} join {2} == {<1,2>, <2,2>, <3,2>};
  		
  
  		public test bool testRelation161() = {} + == {};
  		public test bool testRelation162() = {} * == {};
  		
  		public test bool testRelation163() = {<1,2>, <2,3>, <3,4>} + == {<1,2>, <2,3>, <3,4>, <1, 3>, <2, 4>, <1, 4>};
  		
  		public test bool testRelation164() = {<1,2>, <2,3>, <3,4>} * == {<1,2>, <2,3>, <3,4>, <1, 3>, <2, 4>, <1, 4>, <1, 1>, <2, 2>, <3, 3>, <4, 4>};
  		
  		public test bool testRelation165() = {<1,2>, <2,3>, <3,4>, <4,2>, <4,5>}+ ==	{<1,2>, <2,3>, <3,4>, <4,2>, <4,5>, <1, 3>, <2, 4>, <3, 2>, <3, 5>, <4, 3>, <1, 4>, <2, 2>, <2, 5>, <3, 3>, <4, 4>, <1, 5>};
  		
  		public test bool testRelation166() = {<1,2>, <2,3>, <3,4>, <4,2>, <4,5>}* == {<1,2>, <2,3>, <3,4>, <4,2>, <4,5>, <1, 3>, <2, 4>, <3, 2>, <3, 5>, <4, 3>, <1, 4>, <2, 2>, <2, 5>, <3, 3>, <4, 4>, <1, 5>, <1, 1>, <5, 5>};
 // 	}
    	
  // @Test public void namedRelation1() {
  		public test bool namedRelation167() {rel[int from, int to] R = {<1,10>, <2,20>}; return R.from == {1,2};}
  		public test bool namedRelation168() {rel[int from, int to] R = {<1,10>, <2,20>}; return R.to == {10,20};}
  //	}
  
  
  data NODE1 = val(value V) | f1() | f1(NODE1 a);
  	public test bool good1()  {
  		return f1(val(1)) == f1(val(1));
  	}
  
  data NODE = i(int I) | s(str x)  | st(set[NODE] s) | l(list[NODE]) | m(map[NODE,NODE] m) | f() | f(NODE a) | f(NODE a, NODE b) | g() | g(NODE a) | g(NODE a,NODE b);
  	
  //	@Test public void node()  
  		public test bool node169()=f() == f();
  		public test bool node170()=f() != g();
  		public test bool node171() {NODE n = f(); NODE m = g(); return n != m;}
  		public test bool node172()=f(i(1)) == f(i(1));
  		public test bool node173()=f(i(1)) != g(i(1));
  		public test bool node174() {NODE n = f(i(1)); NODE m = g(i(1)); return n != m;}
  		public test bool node175()=f(i(1),i(2)) == f(i(1),i(2));
  		public test bool node176()=f(i(1),i(2)) != f(i(1),i(3));
  		public test bool node177() { NODE n = f(i(1),i(2)); NODE m = f(i(1),i(3)); return n != m;}
  		public test bool node178()=f(i(1),g(i(2),i(3))) == f(i(1),g(i(2),i(3)));
  		public test bool node179()=f(i(1),g(i(2),i(3))) != f(i(1),g(i(2),i(4)));
  		public test bool node180() {NODE n = f(i(1),g(i(2),i(3))); NODE m = f(i(1),g(i(2),i(4))); return n != m;}
  		public test bool node181()=f(i(1),g(i(2),st({i(3),i(4),i(5)}))) == f(i(1),g(i(2),st({i(3),i(4),i(5)})));
  		public test bool node182() { NODE n = f(i(1),g(i(2),st({i(3),i(4),i(5)}))); NODE m = f(i(1),g(i(2),st({i(3),i(4),i(5),i(6)}))); return n != m;}
  		public test bool node183()=f(i(1),g(i(2),l([i(3),i(4),i(5)]))) == f(i(1),g(i(2),l([i(3),i(4),i(5)])));
  		public test bool node184() { NODE n = f(i(1),g(i(2),l([i(3),i(4),i(5)]))); NODE m = f(i(1),g(i(2),l([i(3),i(4),i(5),i(6)]))); return  n != m;}
  		public test bool node185()=f(i(1),g(i(2),m((i(3):i(3),i(4):i(4),i(5):i(5))))) == f(i(1),g(i(2),m((i(3):i(3),i(4):i(4),i(5):i(5)))));
  		public test bool node186() {NODE n = f(i(1),g(i(2),m((i(3):i(3),i(4):i(4),i(5):i(5))))); NODE x = f(i(1),g(i(2),m((i(3):i(3),i(4):i(4),i(5):i(0))))); return n != x;}
  
  		public test bool node187()=f()                       <= f();
  		public test bool node188()=f()                       <= g();
  		public test bool node189()=f()                       <= f(i(1));
  		public test bool node190()=f(i(1))                   <= f(i(1));
  		public test bool node191()=f(i(1), i(2))             <= f(i(1), i(3));
  		public test bool node192()=f(i(1), i(2))             <= g(i(1), i(3));
  		public test bool node193()=f(i(1), s("abc"))       <= f(i(1), s("def"));
  		public test bool node194()=f(i(1), l([i(2), i(3)]))  <= f(i(1), l([i(2),i(3),i(4)]));
  		public test bool node195()=f(i(1), l([i(2), i(3)]))  <= f(i(1), l([i(2),i(3)]));
  		
  		public test bool node196()=!(f()                      < f());
  		public test bool node197()=f()                       < g();
  		public test bool node198()=f()                       < f(i(1));
  		public test bool node199()=!(f(i(1))                  < f(i(1)));
  		public test bool node200()=f(i(1), i(2))             < f(i(1), i(3));
  		public test bool node201()=f(i(1), i(2))             < g(i(1), i(3));
  		public test bool node202()=f(i(1), s("abc"))       < f(i(1), s("def"));
  		public test bool node203()=f(i(1), l([i(2), i(3)]))  < f(i(1), l([i(2),i(3),i(4)]));
  		public test bool node204()=!(f(i(1), l([i(2), i(3)])) < f(i(1), l([i(2),i(3)])));
  		
  		public test bool node205()=f()                          >= f();
  		public test bool node206()=g()                          >= f();
  		public test bool node207()=f(i(1))                      >= f();
  		public test bool node208()=f(i(1))                      >= f(i(1));
  		public test bool node209()=f(i(1), i(3))                >= f(i(1), i(2));
  		public test bool node210()=g(i(1), i(2))                >= f(i(1), i(3));
  		public test bool node211()=f(i(1), s("def"))          >= f(i(1), s("abc"));
  		public test bool node212() =f(i(1), l([i(2),i(3),i(4)])) >= f(i(1), l([i(2),i(3)]));
  		public test bool node213()=f(i(1), l([i(2), i(3)]))     >= f(i(1), l([i(2),i(3)]));
  		
  		public test bool node214()=!(f()                         > f());
  		public test bool node215()=g()                          > f();
  		public test bool node216()=f(i(1))                      > f();
  		public test bool node217()=!(f(i(1))                     > f(i(1)));
  		public test bool node218()=f(i(1), i(3))                > f(i(1), i(2));
  		public test bool node219()=g(i(1), i(2))                > f(i(1), i(3));
  		public test bool node220()=f(i(1), s("def"))          > f(i(1), s("abc"));
  		public test bool node221()=  f(i(1), l([i(2),i(3),i(4)])) > f(i(1), l([i(2),i(3)]));
  		public test bool node222()=!(f(i(1), l([i(2), i(3)]))    > f(i(1), l([i(2),i(3)])));
  // 	}
  
  data D = d(int ival);
  	
  // @Test public void undefined()  {
  		public test bool undefined223() {int T; return (T ? 13) == 13;}
  		public test bool undefined224() {T = (1:10); return (T[1] ? 13) == 10;}
  		public test bool undefined225() {T = (1:10); return (T[2] ? 13) == 13;}
  		
  		public test bool undefined226() {T = (1:10); return T[1] ? == true;}
  		public test bool undefined227() {T = (1:10); return T[2] ? == false;} 	
  //	}
  
 