module tests::functionality::DataTypeTests


// @Test public void bool() {
		
		public test bool q() = true == true;
		public test bool q() = !(true == false);
		public test bool q() = true != false;	

		public test bool q() = (!true) == false;
		public test bool q() = (!false) == true;
		
		public test bool q() = (true && true) == true;	
		public test bool q() = (true && false) == false;	
		public test bool q() = (false && true) == false;	 
		public test bool q() = (false && false) == false;	
		
		public test bool q() = (true || true) == true;	
		public test bool q() = (true || false) == true;	
		public test bool q() = (false || true) == true;	
		public test bool q() = (false || false) == false;	
		
		public test bool q() = (true ==> true) == true;	
		public test bool q() = (true ==> false) == false;	
		public test bool q() = (false ==> true)  == true;	
		public test bool q() = (false ==> false) == true;
		
		public test bool q() = (true <==> true) == true;	
		public test bool q() = (true <==> false) == false;	
		public test bool q() = (false <==> true) == false;	
		public test bool q() = (false <==> false) == true;
		
		public test bool q() = false  <= false;
		public test bool q() = false  <= true;
		public test bool q() = !(true  <= false);
		public test bool q() = true   <= true;
		
		public test bool q() = !(false < false);
		public test bool q() = false  < true;
		public test bool q() = !(true  < false);
		public test bool q() = !(true  < true);
		
		public test bool q() = false  >= false;
		public test bool q() = true   >= false;
		public test bool q() = !(false >= true);
		public test bool q() = true   >= true;
		
		public test bool q() = !(false > false);
		public test bool q() = true   > false;
		public test bool q() = !(false > true);
		public test bool q() = !(true   > true);
//	}
	

@expected{UnexpectedType}
	public test bool andError() {
		3 && true; return false;
	}
	
@expected{UnexpectedType}
	public test bool andError() {
		3 ==> true; return false;
	}
	
@expected{UnexpectedType}
	public test bool condExpError() {
		1 ? 2 : 3; return false;
	}


//	@Test public void testInt() {		
		public test bool q() = 1 == 1;
		public test bool q() = 1 != 2;
		
		public test bool q() = -1 == -1;
		public test bool q() = -1 != 1;
		
		public test bool q() = 1 + 1 == 2;
		public test bool q() = -1 + 2 == 1;
		public test bool q() = 1 + (-2) == -1;
		
		public test bool q() = 2 - 1 == 1;	
		public test bool q() = 2 - 3 == -1;	
		public test bool q() = 2 - -1 == 3;	
		public test bool q() = -2 - 1 == -3;	
		
		public test bool q() = 2 * 3 == 6;	
		public test bool q() = -2 * 3 == -6;	
		public test bool q() = 2 * (-3) == -6;
		public test bool q() = -2 * (-3) == 6;	
		
		public test bool q() = 8 / 4 == 2;	
		public test bool q() = -8 / 4 == -2;
		public test bool q() = 8 / -4 == -2;	
		public test bool q() = -8 / -4 == 2;
		
		public test bool q() = 7 / 2 == 3;	
		public test bool q() = -7 / 2 == -3;
		public test bool q() = 7 / -2 == -3;	
		public test bool q() = -7 / -2 == 3;	
		
		public test bool q() = 0 / 5 == 0;	
		public test bool q() = 5 / 1 == 5;	
		
		public test bool q() = 5 % 2 == 1;	
		public test bool q() = -5 % 2 == -1;
		public test bool q() = 5 % -2 == 1;		
		
		public test bool q() = -2 <= -1;
		public test bool q() = -2 <= 1;
		public test bool q() = 1 <= 2;
		public test bool q() = 2 <= 2;
		public test bool q() = !(2 <= 1);
		
		public test bool q() = -2 < -1;
		public test bool q() = -2 < 1;
		public test bool q() = 1 < 2;
		public test bool q() = !(2 < 2);
		
		public test bool q() = -1 >= -2;
		public test bool q() = 1 >= -1;
		public test bool q() = 2 >= 1;
		public test bool q() = 2 >= 2;
		public test bool q() = !(1 >= 2);
		
		public test bool q() = -1 > -2;
		public test bool q() = 1 > -1;
		public test bool q() = 2 > 1;
		public test bool q() = !(2 > 2);
		public test bool q() = !(1 > 2);
		
		public test bool q() = (3 > 2 ? 3 : 2) == 3;
		
// 	}
	

@expected{UnsupportedOperation}
	public test bool addError() {
		3 + true; return false;
	}
	

@expected{UnsupportedOperation}
	public test bool subError() {
		3 - true;return false;
	}

@expected{UnsupportedOperation}
	public test bool uMinusError() {
		- true; return false;
	}
	
@expected{UnsupportedOperation}
	public test bool  timesError() {
		3 * true;return false;
	}
	
	@expected{UnsupportedOperation}
	public test bool  divError() {
		3 / true;return false;
	}
	
	@expected{UnsupportedOperation}
	public test bool  modError() {
		3 % true;return false;
	}
	
//	@Test public void valueEquals() {
		public test bool q()  {value x = 1.0; value y = 2; return x != y; }
//	}
	
//	@Test public void real()	{		
		public test bool q() = 1.0 == 1.0;
		public test bool q() = 1.0 != 2.0;
		
		public test bool q() = -1.0 == -1.0;
		public test bool q() = -1.0 != 1.0;
		
		public test bool q() = 1.0 == 1;
		public test bool q() = 1.00 == 1.0;
		public test bool q() = 1 == 1.0;
		
		public test bool q()  {value x = 1.0; value y = 1; return x == y; }
		public test bool q() {value x = 1.0; value y = 2; return x != y; }
		
		public test bool q() = 1.0 + 1.0 == 2.0;
		public test bool q() = -1.0 + 2.0 == 1.0;
		public test bool q() = 1.0 + (-2.0) == -1.0;
		
		public test bool q() = 1.0 + 1 == 2.0;
		public test bool q() = -1 + 2.0 == 1.0;
		public test bool q() = 1.0 + (-2) == -1.0;
		
		public test bool q() = 2.0 - 1.0 == 1.0;	
		public test bool q() = 2.0 - 3.0 == -1.0;	
		public test bool q() = 2.0 - -1.0 == 3.0;	
		public test bool q() = -2.0 - 1.0 == -3.0;
		
		public test bool q() = 2.0 - 1 == 1.0;	
		public test bool q() = 2 - 3.0 == -1.0;	
		public test bool q() = 2.0 - -1 == 3.0;	
		public test bool q() = -2 - 1.0 == -3.0;
		
		public test bool q() = 2.0 * 3.0 == 6.00;	
		public test bool q() = -2.0 * 3.0 == -6.00;	
		public test bool q() = 2.0 * (-3.0) == -6.00;
		public test bool q() = -2.0 * (-3.0) == 6.00;	
		
		public test bool q() = 2.0 * 3 == 6.0;	
		public test bool q() = -2 * 3.0 == -6.0;	
		public test bool q() = 2.0 * (-3) == -6.0;
		public test bool q() = -2 * (-3.0) == 6.0;	
		
		public test bool q() = 8.0 / 4.0 == 2e0;	
		public test bool q() = -8.0 / 4.0 == -2e0;
		public test bool q() = 8.0 / -4.0 == -2e0;	
		public test bool q() = -8.0 / -4.0 == 2e0;
		
		// TODO, I don't get it, why does the previous have 1 digit precision and this
		// one two digits
		public test bool q() = 7.0 / 2.0 == 3.5;	
		public test bool q() = -7.0 / 2.0 == -3.5;
		public test bool q() = 7.0 / -2.0 == -3.5;	
		public test bool q() = -7.0 / -2.0 == 3.5;	
		
		public test bool q() = 0.0 / 5.0 == 0.0;	
		public test bool q() = 5.0 / 1.0 == 5.0;	
		
		public test bool q() = 7 / 2.0 == 3.5;	
		public test bool q() = -7.0 / 2 == -3.5;
		public test bool q() = 7 / -2.0 == -3.5;	
		public test bool q() = -7.0 / -2 == 3.5;	
		
		public test bool q() = -2.0 <= -1.0;
		public test bool q() = -2.0 <= 1.0;
		public test bool q() = 1.0 <= 2.0;
		public test bool q() = 2.0 <= 2.0;
		public test bool q() = !(2.0 <= 1.0);
		
		public test bool q() = -2 <= -1.0;
		public test bool q() = -2.0 <= 1;
		public test bool q() = 1 <= 2.0;
		public test bool q() = 2.0 <= 2;
		public test bool q() = !(2 <= 1.0);
		
		public test bool q() = -2.0 < -1.0;
		public test bool q() = -2.0 < 1.0;
		public test bool q() = 1.0 < 2.0;
		public test bool q() = !(2.0 < 2.0);
		
		public test bool q() = -2 < -1.0;
		public test bool q() = -2.0 < 1;
		public test bool q() = 1 < 2.0;
		public test bool q() = !(2.0 < 2);
		
		public test bool q() = -1.0 >= -2.0;
		public test bool q() = 1.0 >= -1.0;
		public test bool q() = 2.0 >= 1.0;
		public test bool q() = 2.0 >= 2.0;
		public test bool q() = !(1.0 >= 2.0);
		
		public test bool q() = -1 >= -2.0;
		public test bool q() = 1.0 >= -1;
		public test bool q() = 2 >= 1.0;
		public test bool q() = 2.0 >= 2;
		public test bool q() = !(1 >= 2.0);
		
		public test bool q() = -1.0 > -2.0;
		public test bool q() = 1.0 > -1.0;
		public test bool q() = 2.0 > 1.0;
		public test bool q() = !(2.0 > 2.0);
		public test bool q() = !(1.0 > 2.0);
		
		public test bool q() = -1 > -2.0;
		public test bool q() = 1.0 > -1;
		public test bool q() = 2 > 1.0;
		public test bool q() = !(2.0 > 2);
		public test bool q() = !(1 > 2.0);
		
		public test bool q() = ((3.5 > 2.5) ? 3.5 : 2.5) == 3.5;
		
		public test bool q() = ((3.5 > 2) ? 3.5 : 2) == 3.5;
		public test bool q() = ((3.5 > 4) ? 3.5 : 2) == 2;
//	}
	
//	@Test public void testNumber(){
		public test bool q() {num n = 1; return n == 1;}
		public test bool q() {num n = 1;  return 1 == n;}
		
		public test bool q() {num n = 1;  return n != 2;}
		public test bool q() {num n = 1;  return 2 != n;}
		
		
		public test bool q() {num n = 1;  return n + 1 == 2;}
		public test bool q() {num n = 1;  return 1 + n == 2;}
		
		public test bool q() {num n = 2; return n - 1 == 1;}	
		public test bool q() {num n = 2; return 1 - n == -1;}	
		
		
		public test bool q() {num n = 2; return n * 3 == 6;}
		public test bool q() {num n = 2; return 3 * n == 6;}
		
		public test bool q() {num n = 8; return n / 4 == 2;}	
		public test bool q() {num n = 4; return 8 / n == 2;}	
		
//		public test bool q() {num n = 5; return n % 2 == 1;}	
//		public test bool q() {num n = 2; return 5 % n == 1;}	
		
	
		public test bool q() {num n = 1; return n <= 2;}
		public test bool q() {num n = 1; return 0 <= n;}
		
		public test bool q() {num n = 1; return n < 2;} 
		public test bool q() {num n = 1; return 0 < n;}
		
		public test bool q() {num n = 2; return n >= 1;}
		public test bool q() {num n = 1; return 2 >= n;}
		
		public test bool q() {num n = 2; return n > 1;}         
		public test bool q() {num n = 1; return 2 > n;}
		
		public test bool q() {num n = 1; return 2 > n;}
		
		public test bool q() {num n35 = 3.5; num n2 = 2; return ((n35 > n2) ? 3.5 : 2) == 3.5;}
//	}
	
//	@Test public void testString() {	
		public test bool q() = "" == "";
		public test bool q() = "abc" != "";
		public test bool q() = "abc" == "abc";
		public test bool q() = "abc" != "def";
		
		public test bool q() = "abc" + "" == "abc";
		public test bool q() = "abc" + "def" == "abcdef";
		
		public test bool q() = "" <= "";
		public test bool q() = "" <= "abc";
		public test bool q() = "abc" <= "abc";
		public test bool q() = "abc" <= "def";
		
		public test bool q() = !("" < "");
		public test bool q() = "" < "abc";
		public test bool q() = !("abc" < "abc");
		public test bool q() = "abc" < "def";
		
		public test bool q() = "" >= "";
		public test bool q() = "abc" >= "";
		public test bool q() = "abc" >= "abc";
		public test bool q() = "def" >= "abc";
		
		public test bool q() = !("" > "");
		public test bool q() = "abc" > "";
		public test bool q() = !("abc" > "abc");
		public test bool q() = "def" > "abc";
//	}
	
//	@Test public void stringEscapes() {
		public test bool q() = "\\b" == "\\b";
		public test bool q() = "\\t" == "\\t";
		public test bool q() = "\\n" == "\\n";
		public test bool q() = "\\f" == "\\f";
		public test bool q() = "\\r" == "\\r";
		
		public test bool q() = "\"\"" == "\"\"";
		public test bool q() = "\\\'" == "\\\'";
		public test bool q() = "\\\\" == "\\\\";
		public test bool q() = "\"\<" == "\"\<";
		public test bool q() = "\"\>" == "\"\>";
		
		// public test bool q() = "\\a20" == " ";
		// public test bool q() = "\\U01F35D" == "🍝";
		// public test bool q() = "\\U01F35D" == "🍝";
		// public test bool q() = "\\u2713" == "✓";
//	}
	
//	@Test  public void stringInterpolation(){
		public test bool q() {str a = "abc"; return "1<a>2" == "1abc2";}
		public test bool q() {int a = 789; return "1<a>2" == "17892";}
		
		public test bool q() {str a = "a\\bc"; return "1<a>2" == "1a\\bc2";}
		public test bool q() {str a = "a\\tc"; return "1<a>2" == "1a\\tc2";}
		public test bool q() {str a = "a\\nc"; return "1<a>2" == "1a\\nc2";}
		public test bool q() {str a = "a\\fc"; return "1<a>2" == "1a\\fc2";}
		public test bool q() {str a = "a\\rc"; return "1<a>2" == "1a\\rc2";}
		
		public test bool q() {str a = "a\\\"c"; return "1<a>2" == "1a\\\"c2";}
		public test bool q() {str a = "a\\\'c"; return "1<a>2" == "1a\\\'c2";}
		public test bool q() {str a = "a\\\\c"; return "1<a>2" == "1a\\\\c2";}
		
		public test bool q() {str a = "a\<c"; return "1<a>2" == "1a\<c2";}
		public test bool q() {str a = "a\>c"; return "1<a>2" == "1a\>c2";}
	
//	}

	@expected{UnexpectedType}
	public void orError() {
		public test bool q() = 3 || true;
	}

loc Loc = |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>);
loc Loc2 = |file:///home/paulk/pico2.trm|(0,1,<2,3>,<4,5>);	
//	@Test public void testLocation() {
		
		
		public test bool q() {Loc ; return true;}
		public test bool q() =  Loc == Loc;
		public test bool q() = Loc != Loc2;
		
		public test bool q() = Loc.uri == "file:///home/paulk/pico.trm";
		public test bool q() = Loc.offset == 0;
		public test bool q() = Loc.length == 1;
		public test bool q() = Loc.begin.line == 2;
		public test bool q() = Loc.begin.column == 3;
		public test bool q() = Loc.end.line == 4;
		public test bool q() = Loc.end.column == 5;
		public test bool q() = Loc.path == "/home/paulk/pico.trm";
		
		
		//public test bool q() = { loc Loc = " + Loc + "; Loc.uri == \"file:///home/paulk/pico.trm\";}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.offset == 0;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.length == 1;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.begin.line == 2;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.begin.column == 3;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.end.line == 4;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.end.column == 5;}
		//
		//public test bool q() = { loc Loc = " + Loc + "; Loc.uri = \"file:///home/paulk/pico2.trm\"; Loc.uri == \"file:///home/paulk/pico2.trm\";}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.offset = 10; Loc.offset == 10;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.length = 11; Loc.length == 11;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.end.line = 14; Loc.end.line == 14;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.begin.line = 1; Loc.begin.line == 1;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.begin.column = 13; Loc.begin.column == 13;}
		//public test bool q() = { loc Loc = " + Loc + "; Loc.end.column = 15; Loc.end.column == 15;}
		//
		//public test bool q() = {loc Loc = " + Loc + "; Loc = Loc[uri= \"file:///home/paulk/pico.trm\"]; Loc == |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>);}
		//public test bool q() = {loc Loc = " + Loc + "; Loc = Loc[offset = 10]; Loc == |file:///home/paulk/pico.trm|(10,1,<2,3>,<4,5>);}
		//public test bool q() = {loc Loc = " + Loc + "; Loc = Loc[length = 11]; Loc ==  |file:///home/paulk/pico.trm|(0,11,<2,3>,<4,5>);}
		//public test bool q() = {loc Loc = " + Loc + "; Loc = Loc[begin = <1,4>]; Loc == |file:///home/paulk/pico.trm|(0,1,<1,4>,<4,5>);}
		//public test bool q() = {loc Loc = " + Loc + "; Loc = Loc[end = <14,38>]; Loc ==  |file:///home/paulk/pico.trm|(0,1,<2,3>,<14,38>);}
	
		public test bool q() = |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) == |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>);
		public test bool q() = !(|file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) == |file:///home/paulk/pico.trm|(0,2,<2,3>,<4,5>));
		public test bool q() = !(|file:///home/paulk/pico1.trm|(0,1,<2,3>,<4,5>) == |file:///home/paulk/pico2.trm|(0,1,<2,3>,<4,5>));
		
		public test bool q() = |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) != |file:///home/paulk/pico2.trm|(0,1,<2,3>,<4,5>);
		public test bool q() = |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) != |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,7>);
		public test bool q() = !(|file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>) != |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,5>));
		public test bool q() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) != |file:///home/paulk/pico.trm|(0,1,<2,3>,<4,7>);
		
		public test bool q() = !(|file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) < |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
		public test bool q() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) < |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>);
		public test bool q() = !(|file:///home/paulk/pico.trm|(1,1,<2,3>,<4,5>) < |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
		public test bool q() = !(|file:///home/paulk/pico.trm|(1,2,<2,3>,<4,5>) < |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
		
		
		public test bool q() = |file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>) <= |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>);
		public test bool q() = !(|file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>) <= |file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>));
		public test bool q() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) <= |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>);
		public test bool q() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) <= |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>);
		public test bool q() = !(|file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>) <= |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
		
		
		public test bool q() = |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>) > |file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>);
		public test bool q() = !(|file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>) > |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>));
		public test bool q() = !(|file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) > |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>));
		public test bool q() = |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>) > |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>);
		public test bool q() = !(|file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) > |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>));
		
		public test bool q() = |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>) >= |file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>);
		public test bool q() = !(|file:///home/paulk/pico1.trm|(2,1,<2,3>,<4,5>) >= |file:///home/paulk/pico2.trm|(2,1,<2,3>,<4,5>));
		public test bool q() = |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) >= |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>);
		public test bool q() = |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>) >= |file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>);
		public test bool q() = !(|file:///home/paulk/pico.trm|(2,1,<2,3>,<4,5>) >= |file:///home/paulk/pico.trm|(2,2,<2,3>,<4,5>));
		
		public test bool q() = |file:///xxx|(45,1,<1,45>,<1,46>) <= |file:///xxx|(40,6,<1,40>,<1,46>);
		public test bool q() = |file:///xxx|(45,1,<1,45>,<1,46>) <= |file:///xxx|(40,7,<1,40>,<1,47>);
	
//	}
	
	@expected{UninitializedVariable}
	public test bool UndefinedLocationError1(){
		 loc Loc; Loc.url;return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UndefinedLocationError2(){
		 loc Loc; Loc.url = "abc";return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UndefinedLocationError3(){
		 loc Loc; Loc[url = "abc"];return false;
	}
	
	@expected{UndeclaredField}
	public test bool WrongLocFieldError1(){
		loc Loc = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
		 Loc.bla;return false;
	}
	
	@expected{UndeclaredField}
	public test bool WrongLocFieldError2(){
		loc Loc = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
		Loc[bla=3]; return false;
	}
	
	@expected{UnexpectedType}
	public test bool URLFieldError1(){
		loc Loc = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
		Loc.uri=true;return false;
	}
	
	@expected{ParseError}
	public test bool URLFieldError2(){
		loc Loc = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
		Loc.uri="? ??";return false;
	}
	
	@expected{UnexpectedType}
	public test bool LengthFieldError(){
		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
		Loc.length=true;return false;
	}
	
	@expected{UnexpectedType}
	public test bool OffsetFieldError(){
		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
		Loc.offset=true;return false;
	}
	
	@expected{UndeclaredField}
	public test bool BeginLineFieldError(){
		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
		Loc.beginLine=true;return false;
	}
	@expected{UnexpectedType}
	public test bool EndLineFieldError(){
		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
		Loc.end=<true,12>;return false;
	}
	
	@expected{UnexpectedType}
	public test bool BeginColumnFieldError(){
		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
		Loc.begin=<true,1>;return false;
	}

//	@Testb public void testList() {		
		public test bool q() = [] == [];
		public test bool q() = [] != [1];
		public test bool q() = [1] == [1];
		public test bool q() = [1] != [2];
		public test bool q() = [1, 2] == [1, 2];
		public test bool q() = [1, 2] != [2, 1];
		
		public test bool q() = [] + [] == [];
		public test bool q() = [1, 2, 3] + [] == [1, 2, 3];
		public test bool q() = [] + [1, 2, 3] == [1, 2, 3];
		public test bool q() = [1, 2] + [3, 4, 5] == [1, 2, 3, 4, 5];	
		
		public test bool q() = ([1, 2] + [3, 4]) + [5] == [1, 2, 3, 4, 5];	
		public test bool q() = [1, 2] + ([3, 4] + [5]) == [1, 2, 3, 4, 5];	
		public test bool q() = [1, 2] + [3, 4] + [5] == [1, 2, 3, 4, 5];
		
		public test bool q() = [1, 2] + 3 == [1, 2, 3];
		public test bool q() = 1 +  [2, 3] == [1, 2, 3];
		
		public test bool q() = [1,2,1,2,3,4,3,4,5] - 1 == [2,1,2,3,4,3,4,5];
		public test bool q() = [1,2,1,2,3,4,3,4,5] - 2 == [1,1,2,3,4,3,4,5];
		public test bool q() = [1,2,1,2,3,4,3,4,5] - 5 == [1,2,1,2,3,4,3,4];
		
		public test bool q() = [1,2,1,2,3,4,3,4,5] - [1] == [2,1,2,3,4,3,4,5];
		public test bool q() = [1,2,1,2,3,4,3,4,5] - [2] == [1,1,2,3,4,3,4,5];
		public test bool q() = [1,2,1,2,3,4,3,4,5] - [5] == [1,2,1,2,3,4,3,4];
		
		public test bool q() = [1,2,1,2,3,4,3,4,5] - [1,1] == [2,2,3,4,3,4,5];
		public test bool q() = [1,2,1,2,3,4,3,4,5] - [1,1,1] == [2,2,3,4,3,4,5];
		
		public test bool q() = [1,2,1,2,3,4,3,4,5] - [1,2] == [1,2,3,4,3,4,5];
		public test bool q() = [1,2,1,2,3,4,3,4,5] - [2,3] == [1,1,2,4,3,4,5];
		
		public test bool q() = [] & [1,2,4] == [];
		public test bool q() = [1,2,3] & [] == [];
		public test bool q() = [1,2,3,4,5,4,3,2,1] & [1,2,4] == [1,2,4,4,2,1];
		
		
		public test bool q() = [] <= [];
		public test bool q() = [] <= [1];
// These commented out tests assume that <= etc. are ("half") ordering operations
// Currently they are strictly subset implementations.
//		public test bool q() = [2, 1, 0] <= [2, 3];
//		public test bool q() = [2, 1] <= [2, 3, 0];
		public test bool q() = [2, 1] <= [2, 1];
		public test bool q() = [2, 1] <= [2, 1, 0];
		
		public test bool q() = [] < [1];
//		public test bool q() = [2, 1, 0] < [2, 3];
//		public test bool q() = [2, 1] < [2, 3, 0];
		public test bool q() = [2, 1] < [2, 1, 0];
		
		public test bool q() = [] >= [];
//		public test bool q() = [1] >= [];
//		public test bool q() = [2, 3] >= [2, 1, 0];
//		public test bool q() = [2, 3, 0] >= [2, 1];
		public test bool q() = [2, 1] >= [2, 1];
		public test bool q() = [2, 1, 0] >= [2, 1];
		
		public test bool q() = [1] > [];
//		public test bool q() = [2, 3] > [2, 1, 0];
//		public test bool q() = [2, 3, 0] > [2, 1];
		public test bool q() = [2, 1, 0] > [2, 1];
		
		public test bool q() = [] * [] == [];
		public test bool q() = [1] * [9] == [<1,9>];
		public test bool q() = [1, 2] * [9] == [<1,9>, <2,9>];
		public test bool q() = [1, 2, 3] * [9] == [<1,9>, <2,9>, <3,9>];
		public test bool q() = [1, 2, 3] * [9, 10] == [<1,9>, <1,10>, <2,9>, <2,10>, <3,9>, <3,10>];
		
		public test bool q() = 2 in [1, 2, 3];
		public test bool q() = 3 notin [2, 4, 6];
		
		public test bool q() = 2 > 3 ? [1,2] : [1,2,3] == [1,2,3];
//	}

	@expected{IndexOutOfBounds}
	public test bool  SubscriptError1() {
		[1,2][5];return false;
	}
	
	@expected{UndeclaredVariable}
	public test bool  SubscriptError2() {
		L[5]; return false;
	}

	
//	@Test  public void listSplicing(){
		public test bool q() =  [1,2,3] == [1,2,3];
		public test bool q() = [*1,2,3] == [1,2,3];
		public test bool q() = [1,*2,3] == [1,2,3];
		public test bool q() = [1,2,*3] == [1,2,3];
		public test bool q() = [*1,*2,3] == [1,2,3];
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1] == [[1,2]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1] == [1,2];}
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,3] == [[1,2],3];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,3] == [1,2,3];}
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,L2] == [[1,2],[3,4]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,L2] == [1,2,[3,4]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,*L2] == [[1,2],3,4];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,*L2] == [1,2,3,4];}
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,L2,5] == [[1,2],[3,4],5];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,L2,5] == [1,2,[3,4],5];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,*L2,5] == [[1,2],3,4,5];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,*L2,5] == [1,2,3,4,5];}
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[L1]] == [[[1,2]]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1]] == [[1,2]];}
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[L1],3] == [[[1,2]],3];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1],3] == [[1,2],3];}	
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[L1],[L2]] == [[[1,2]],[[3,4]]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1],[L2]] == [[1,2],[[3,4]]];}
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[L1],[*L2]] == [[[1,2]],[3,4]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1],[*L2]] == [[1,2],[3,4]];}
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*[*L1],[*L2]] == [1,2,[3,4]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [[*L1],*[*L2]] == [[1,2],3,4];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*[*L1],*[*L2]] == [1,2,3,4];}
	
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,[L2]] == [[1,2],[[3,4]]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,[L2]] == [1,2,[[3,4]]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,[*L2]] == [[1,2],[3,4]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,[*L2]] == [1,2,[3,4]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,*[*L2]] == [1,2,3,4];}

		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,[L2],5] == [[1,2],[[3,4]],5];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [*L1,[L2],5] == [1,2,[[3,4]],5];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; return [L1,[*L2],5] == [[1,2],[3,4],5];}
		
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[list[list[int]]] L3 = [[L1]]; return L3 == [[[1,2]]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[value] L3 = [[L1],3]; return L3 == [[[1,2]],3];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[list[list[int]]] L3 = [[L1],[L2]]; return L3 == [[[1,2]],[[3,4]]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[value] L3 = [L1,[L2]]; return L3 == [[1,2],[[3,4]]];}
		public test bool q() {list[int] L1 = [1,2]; list[int] L2 = [3,4]; list[value] L3 = [L1,[L2],5]; return L3 == [[1,2],[[3,4]],5];}
//	}

//	@Test public void testSetInListSplicing() {
		public test bool q() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return [L1,S2,5] == [[1,2],{3,4},5];}
		public test bool q() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return [*L1,S2,5] == [1,2,{3,4},5];}
		public test bool q() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return ([L1,*S2,5] == [[1,2],3,4,5]) || ([L1,*S2,5] == [[1,2],4,3,5]);}
		public test bool q() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return ([*L1,*S2,5] == [1,2,3,4,5]) || ([*L1,*S2,5] == [1,2,4,3,5]) ;}
//	}

//	@Test public void testRange() {
		
		public test bool q() = [1 .. 1] == [];
		public test bool q() = [1 .. 2] == [1];
		public test bool q() = [1 .. -1] == [1, 0];
		public test bool q() = [1, 2 .. 10] == [1,2,3,4,5,6,7,8,9];
		public test bool q() = [1, 3 .. 10] == [1,3,5,7,9];
		public test bool q() = [1, -2 .. 10] == [];
		public test bool q() = [1, -3 .. -10] == [1,-3,-7];
//	}
	
//	@Test public void testSet1()  {
		
		public test bool q() = {} == {};
		public test bool q() = {} != {1};
		public test bool q() = {1} == {1};
		public test bool q() = {1} != {2};
		public test bool q() = {1, 2} == {1, 2};
		public test bool q() = {1, 2} == {2, 1};
		public test bool q() = {1, 2, 3, 1, 2, 3} == {3, 2, 1};	
		
		public test bool q() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		public test bool q() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {10, 2, 3, 4, 5, 6, 7, 8, 9, 1};
		public test bool q() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
		public test bool q() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {10, 9, 7, 4, 5, 6, 3, 8, 2, 1};
		public test bool q() = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} == {10, 9, 7, 6, 5, 4, 3, 8, 2, 1};
		
		public test bool q() = {{1}, {2}} == {{2}, {1}};
		public test bool q() = {{}} == {{}};
		public test bool q() = {{}, {}} == {{}};
		public test bool q() = {{}, {}, {}} == {{}};
		
		public test bool q() = {{1, 2}, {3,4}} == {{2,1}, {4,3}};	
	
		public test bool q() = {} + {} == {};
		public test bool q() = {1, 2, 3} + {} == {1, 2, 3};
		public test bool q() = {} + {1, 2, 3} == {1, 2, 3};
		public test bool q() = {1, 2} + {3, 4, 5} == {1, 2, 3, 4, 5};	
		public test bool q() = {1, 2, 3, 4} + {3, 4, 5} == {1, 2, 3, 4, 5};
		public test bool q() = {{1, 2}, {3,4}} + {{5,6}} == {{1,2},{3,4},{5,6}};
		public test bool q() = 1 + {2,3} == {1,2,3};
		public test bool q() = {1,2} + 3 == {1,2,3};
		
		public test bool q() = {} - {} == {};
		public test bool q() = {1, 2, 3} - {} == {1, 2, 3};
		public test bool q() = {} - {1, 2, 3} == {};
		public test bool q() = {1, 2, 3} - {3, 4, 5} == {1, 2};	
		public test bool q() = {1, 2, 3, 4} - {1, 2, 3, 4, 5} == {};
		public test bool q() = {{1, 2}, {3,4}, {5,6}} - {{3,4}} == {{1,2}, {5,6}};
		public test bool q() = {1,2,3} - 3 == {1,2};
		
		public test bool q() = {} & {} == {};
		public test bool q() = {1, 2, 3} & {} == {};
		public test bool q() = {} & {1, 2, 3} == {};
		public test bool q() = {1, 2, 3} & {3, 4, 5} == {3};	
		public test bool q() = {1, 2, 3, 4} & {3, 4, 5} == {3, 4};	
		public test bool q() = {{1,2},{3,4},{5,6}} & {{2,1}, {8,7}, {6,5}} == {{1,2},{5,6}};
		
		public test bool q() = {} <= {};
		public test bool q() = {} <= {1};
		public test bool q() = {2, 1} <= {1, 2};
		public test bool q() = {2, 1} <= {1, 2, 3};
		public test bool q() = {2, 1} <= {2, 1, 0};
	
		public test bool q() = {} < {1};
		public test bool q() = {2, 1} < {2, 1, 3};
	
		public test bool q() = {} >= {};
		public test bool q() = {1} >= {};
		public test bool q() = {2, 3} >= {2};
	
		public test bool q() = {1} > {};
		public test bool q() = {2, 1, 3} > {2, 3};
		
		public test bool q() = {} * {} == {};
		public test bool q() = {1} * {9} == {<1,9>};
		public test bool q() = {1, 2} * {9} == {<1,9>, <2,9>};
		public test bool q() = {1, 2, 3} * {9} == {<1,9>, <2,9>, <3,9>};
		public test bool q() = {1, 2, 3} * {9, 10} == {<1,9>, <1,10>, <2,9>, <2,10>, <3,9>, <3,10>};
		
		
		public test bool q() = 2 in {1, 2, 3};
		public test bool q() = {4,3} in {{1, 2}, {3,4}, {5,6}};
		
		public test bool q() = 5 notin {1, 2, 3};
		public test bool q() = {7,8} notin {{1, 2}, {3,4}, {5,6}};
		
		public test bool q() = ((3 > 2) ? {1,2} : {1,2,3}) == {1,2};
		
		public test bool q() = {<"a", [1,2]>, <"b", []>, <"c", [4,5,6]>} != {};
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
		
		public test bool q() = {INTERSECT({TYPESET t1, *TYPESET rest}), TYPESET t2} :=  {INTERSECT({SET("a"), SET("b")}), SET("c")};
		public test bool q() = {INTERSECT({TYPESET t1, *TYPESET rest}),  t1} :=  {INTERSECT({SET("a"), SET("b")}), SET("a")};
		public test bool q() = {INTERSECT({TYPESET t1, *TYPESET rest}),  t1} :=  {INTERSECT({SET("b"), SET("a")}), SET("a")};

		public test bool q() =  { <t1, t2> | INTERSECT({TYPESET t1, *TYPESET t2}) :=  INTERSECT({SET("b"), SET("a")})} == 
						   { <SET("b"),{SET("a")}>, <SET("a"),{SET("b")}>};
	
	
		public test bool q() = {<t1, rest, t2> | {INTERSECT({TYPESET t1, *TYPESET rest}),  t2} :=  {INTERSECT({SET("a"), SET("b")}) , SET("b")}}==
				           { <SET("a"),{SET("b")},SET("b")>, <SET("b"),{SET("a")},SET("b")>};

		public test bool q() = {<t1, rest> | {INTERSECT({TYPESET t1, *TYPESET rest}),  t1} :=  {INTERSECT({SET("a"), SET("b")}), SET("b")}}==
				           {<SET("b"),{SET("a")}>};
//	}

	//
	// Anastassija's type constraint examples
	// Tests for "simp" version
	//
	
//	private void simpTests(){
//	
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({  })), SET(\"s1\") }))",
//							"INTERSECT({ SUBTYPES(INTERSECT({  })), SET(\"s1\") })
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({SET(\"s1\")  })), SET(\"s2\") }))",
//		   	    			"INTERSECT({ SUBTYPES(INTERSECT({SET(\"s1\") })), SET(\"s2\") })
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\") })), SET(\"s1\") }))",
//		        			"INTERSECT({ SUBTYPES(INTERSECT({             })), SET(\"s1\") });
//	
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\") })), SET(\"s1\"), SET(\"s2\")  }))",
//							"INTERSECT({ SUBTYPES(INTERSECT({             })), SET(\"s1\"), SET(\"s2\")  });
//	
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\") })), SET(\"s2\"), SET(\"s1\")  }))",
//							"INTERSECT({ SUBTYPES(INTERSECT({             })), SET(\"s2\"), SET(\"s1\")  });
//
//
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SET(\"s2\") })), SET(\"s3\") }))",
//               				"INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SET(\"s2\") })), SET(\"s3\") });
//	
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SET(\"s2\") })), SET(\"s3\"), SET(\"s4\") }))",
//   		    		  		"INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SET(\"s2\") })), SET(\"s3\"), SET(\"s4\")  });
//
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SET(\"s3\") })), SET(\"s1\") }))",
//							"INTERSECT({ SUBTYPES(INTERSECT({              SET(\"s3\") })), SET(\"s1\") });
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET(\"s3\"))})), SET(\"s3\") }))",
//            				"INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET(\"s3\"))})), SET(\"s3\") });
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s70\"), SET(\"s4\")})), SET(\"s70\") }))",
//            				"INTERSECT({ SUBTYPES(INTERSECT({               SET(\"s4\")})), SET(\"s70\") });
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SUBTYPES(SET(\"s3\")) })), SET(\"s1\") }))",
//             				"INTERSECT({ SUBTYPES(INTERSECT({              SUBTYPES(SET(\"s3\")) })), SET(\"s1\") });
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SUBTYPES(SET(\"s3\")) })), SUBTYPES(SET(\"s2\")), SET(\"s1\") }))",   
//            				"INTERSECT({ SUBTYPES(INTERSECT({              SUBTYPES(SET(\"s3\")) })), SUBTYPES(SET(\"s2\")), SET(\"s1\") });
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SUBTYPES(SET(\"s2\")) })), SUBTYPES(SET(\"s2\")), SET(\"s1\") }))",
//            				"INTERSECT({ SUBTYPES(INTERSECT({                                    })), SUBTYPES(SET(\"s2\")), SET(\"s1\") });	
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET(\"s3\")), SUBTYPES(SET(\"s2\")) })), SUBTYPES(SET(\"s2\")) }))",
//            				"INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET(\"s3\"))                        })), SUBTYPES(SET(\"s2\")) });
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SUBTYPES(SET(\"s2\")), SUBTYPES(SET(\"s3\")) })), SUBTYPES(SET(\"s2\")), SET(\"s1\") }))",
//             				"INTERSECT({ SUBTYPES(INTERSECT({                                     SUBTYPES(SET(\"s3\")) })), SUBTYPES(SET(\"s2\")), SET(\"s1\") });
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SET(\"s2\"), SET(\"s3\"), SET(\"s5\") })), SET(\"s6\"), SET(\"s2\"), SET(\"s7\"), SET(\"s1\") }))",
//            				"INTERSECT({ SUBTYPES(INTERSECT({                           SET(\"s3\"), SET(\"s5\") })), SET(\"s6\"), SET(\"s2\"), SET(\"s7\"), SET(\"s1\") });
//
//	assertTrue(auxTest("simp(INTERSECT({ SUBTYPES(INTERSECT({ SET(\"s1\"), SUBTYPES(SET(\"s2\")), SET(\"s3\"), SET(\"s5\") })), SET(\"s6\"), SUBTYPES(SET(\"s2\")), SET(\"s7\"), SET(\"s1\"), SET(\"s3\") }))",
//							"INTERSECT({ SUBTYPES(INTERSECT({                                                  SET(\"s5\") })), SET(\"s6\"), SUBTYPES(SET(\"s2\")), SET(\"s7\"), SET(\"s1\"), SET(\"s3\") });
//
//	}


	
	// private void funTests(){
		
		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({  })), SET("s1") }) ==
						   INTERSECT({ SUBTYPES(INTERSECT({  })), SET("s1") });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({SET("s1")  })), SET("s2") })==
			   	    	   INTERSECT({ SUBTYPES(INTERSECT({SET("s1") })),  SET("s2") });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1") })), SET("s1") })==
			        	   INTERSECT({ SUBTYPES(INTERSECT({             })), SET("s1") });
		
		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1") })), SET("s1"), SET("s2")  })==
						   INTERSECT({ SUBTYPES(INTERSECT({             })), SET("s1"), SET("s2")  });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1") })), SET("s2"), SET("s1")  })==
						   INTERSECT({ SUBTYPES(INTERSECT({             })), SET("s2"), SET("s1")  });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3") })==
	               		   INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3") });
		
		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3"), SET("s4") })==
        		   		    INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2") })), SET("s3"), SET("s4")  });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s3") })), SET("s1") })==
						   INTERSECT({ SUBTYPES(INTERSECT({              SET("s3") })), SET("s1") });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3"))})), SET("s3") })==
	            		   INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3"))})), SET("s3") });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s70"), SET("s4")})), SET("s70") })==
	            		   INTERSECT({ SUBTYPES(INTERSECT({               SET("s4")})), SET("s70") });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s3")) })), SET("s1") })==
	             		   INTERSECT({ SUBTYPES(INTERSECT({              SUBTYPES(SET("s3")) })), SET("s1") });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") })== 
	            		   INTERSECT({ SUBTYPES(INTERSECT({              SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s2")) })), SUBTYPES(SET("s2")), SET("s1") })==
	            		   INTERSECT({ SUBTYPES(INTERSECT({                                    })), SUBTYPES(SET("s2")), SET("s1") });	

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3")), SUBTYPES(SET("s2")) })), SUBTYPES(SET("s2")) })==
	            		   INTERSECT({ SUBTYPES(INTERSECT({ SUBTYPES(SET("s3"))                        })), SUBTYPES(SET("s2")) });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s2")), SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") })==
	             		   INTERSECT({ SUBTYPES(INTERSECT({                                     SUBTYPES(SET("s3")) })), SUBTYPES(SET("s2")), SET("s1") });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SET("s2"), SET("s3"), SET("s5") })), SET("s6"), SET("s2"), SET("s7"), SET("s1") })==
	            		   INTERSECT({ SUBTYPES(INTERSECT({                           SET("s3"), SET("s5") })), SET("s6"), SET("s2"), SET("s7"), SET("s1") });

		public test bool q() = INTERSECT({ SUBTYPES(INTERSECT({ SET("s1"), SUBTYPES(SET("s2")), SET("s3"), SET("s5") })), SET("s6"), SUBTYPES(SET("s2")), SET("s7"), SET("s1"), SET("s3") })==
						   INTERSECT({ SUBTYPES(INTERSECT({                                                  SET("s5") })), SET("s6"), SUBTYPES(SET("s2")), SET("s7"), SET("s1"), SET("s3") });

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
//		public test bool q() = {*value S1, *value S2} := {} && (S1 == {}) && (S2 == {});
//		public test bool q() = {*S1, *S2} := {} && (S1 == {}) && (S2 == {});
//		
//		public test bool q() = {*int S1, *int S2} := {100} && ((S1 == {100} && S2 == {}) || (S1 == {} && S2 == {100}));
//		public test bool q() = {*S1, *S2} := {100} && ((S1 == {100} && S2 == {}) || (S1 == {} && S2 == {100}));
//		
//		public test bool q() = {R = for({*int S1, *int S2} := {100}) append <S1, S2>; R == [<{100}, {}>, <{}, {100}> ];}
//		public test bool q() = {R = for({*S1, *S2} := {100}) append <S1, S2>; R == [<{100}, {}>, <{}, {100}> ];}
//
//		public test bool q() = {R = for({*S1, *S2} := {100}) append <S1, S2>; R == [<{100}, {}>, <{}, {100}> ];}
//		//
//		// TODO: the following test requires a specific implementation specific
//		// set representation and, thus, should be refactored. To check
//		// splicing, without taking order into account, the list 'R' is now
//		// converted to a set.
//		//
//		public test bool q() = {R = for({*S1, *S2} := {100, 200}) append <S1, S2>; {*R} == {<{200,100}, {}>, <{200}, {100}>, <{100}, {200}>, <{}, {200,100}>};}
//		public test bool q() = {R = for({*int S1, *S2} := {100, \"a\"})  append <S1, S2>; R == [<{100}, {\"a\"}>, <{},{100,\"a\"}>];}
//		public test bool q() = {R = for({*int S1, *str S2} := {100, \"a\"}) append <S1, S2>; R == [<{100}, {\"a\"}>];}
//		
//		public test bool q() = {R = for({*str S1, *S2} := {100, \"a\"})  append <S1, S2>; R == [<{\"a\"},{100}>, <{},{100,\"a\"}>];}
//		public test bool q() = {R = for({*str S1, *int S2} := {100, \"a\"})  append <S1, S2>; R == [<{\"a\"},{100}>];}
//		
//		public test bool q() = !({*str S1, *str S2} := {100, \"a\"};
//		public test bool q() = !({*int S1, *int S2} := {100, \"a\"};
//
//	}


    @expected{UndeclaredVariable}
    public test bool UndefinedSetElementError(){
    	{X}; return false;
    }
    
    @expected{UnsupportedOperation}
	public test bool inError() {
		1 in 3; return false;
	}
    
	public test bool addSetError() {
		return {1,2,3} + true=={1,2,3,true};
	}
    
	@expected{UnsupportedOperation}
	public test bool productError() {
		{1,2,3} * true; return false;
	}
	
	
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1} == {{1,2}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1} == {1,2};}
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,3} == {{1,2},3};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,3} == {1,2,3};}
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,S2} == {{1,2},{3,4}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,S2} == {1,2,{3,4}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,*S2} == {{1,2},3,4};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,*S2} == {1,2,3,4};}
	
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,S2,5} == {{1,2},{3,4},5};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,S2,5} == {1,2,{3,4},5};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,*S2,5} == {{1,2},3,4,5};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,*S2,5} == {1,2,3,4,5};}
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{S1}} == {{{1,2}}};}
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{*S1}}   == {{1,2}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{*S1}} == {1,2};}
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{S1},3} == {{{1,2}},3};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{S1},3} == {{1,2},3};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{*S1},3} == {1,2,3};}
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{*S1},2} == {1,2};}
	
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{S1},{S2}} == {{{1,2}},{{3,4}}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{S1},{S2}} == {{1,2},{{3,4}}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {{S1},*{S2}} == {{{1,2}},{3,4}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{S1},*{S2}} == {{1,2},{3,4}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*{*S1},*{*S2}} == {1,2,3,4};}
		
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,{S2}} == {{1,2},{{3,4}}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,{*S2}} == {{1,2},{3,4}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,*{*S2}} == {{1,2},3,4};}
		
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,{S2},5} == {{1,2},{{3,4}},5};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,{*S2},5} == {{1,2},{3,4},5};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {S1,*{*S2},5} == {{1,2},3,4,5};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; return {*S1,*{*S2},5} == {1,2,3,4,5};}
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[set[set[int]]] S3 = {{S1}}; return S3 == {{{1,2}}};}
		
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[value] S3 = {{S1},3}; return S3 == {{{1,2}},3};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[set[set[int]]] S3 = {{S1},{S2}};return  S3 == {{{1,2}},{{3,4}}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[value] S3 = {S1,{S2}}; return S3 == {{1,2},{{3,4}}};}
		public test bool q() {set[int] S1 = {1,2}; set[int] S2 = {3,4}; set[value] S3 = {S1,{S2},5}; return S3 == {{1,2},{{3,4}},5};}
	

	@Test public void testListInSetSplicing() {
		public test bool q() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return {L1,S2,5} == {[1,2],{3,4},5};}
		public test bool q() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return {*L1,S2,5} == {1,2,{3,4},5};}
		public test bool q() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return {L1,*S2,5} == {[1,2],3,4,5};}
		public test bool q() {list[int] L1 = [1,2]; set[int] S2 = {3,4}; return {*L1,*S2,5} == {1,2,3,4,5};}
	}
	
//	@Test public void testMap()  {
		
		public test bool q() = () == ();
		public test bool q() = (1:10) != ();
		public test bool q() = (1:10) == (1:10);
		public test bool q() = (1:10) != (2:20);
		
		public test bool q() = () + () == ();
		public test bool q() = (1:10) + () == (1:10);
		public test bool q() = (1:10) + (2:20) == (1:10, 2:20);
		public test bool q() = (1:10, 2:20) + (2:25) == (1:10, 2:25);
		
		public test bool q() = () - () == ();
		public test bool q() = (1:10, 2:20) - () == (1:10,2:20);
		public test bool q() = (1:10, 2:20) - (2:20) == (1:10);
		public test bool q() = (1:10, 2:20) - (2:25) == (1:10); // This is current behaviour; is this ok?
	
		public test bool q() = () & () == ();
		public test bool q() = (1:10) & () == ();
		public test bool q() = (1:10, 2:20, 3:30, 4:40) & (2:20, 4:40, 5:50) == (2:20, 4:40);
		public test bool q() = (1:10, 2:20, 3:30, 4:40) & (5:50, 6:60) == ();
		
		public test bool q() = () <= ();
		public test bool q() = () <= (1:10);
		public test bool q() = (1:10) <= (1:10);
		public test bool q() = (1:10) <= (1:10, 2:20);
		
		public test bool q() = !(() < ());
		public test bool q() = () < (1:10);
		public test bool q() = !((1:10) < (1:10));
		public test bool q() = (1:10) < (1:10, 2:20);
		
		public test bool q() = () >= ();
		public test bool q() = (1:10) >= ();
		public test bool q() = (1:10) >= (1:10);
		public test bool q() = (1:10, 2:20) >= (1:10);
		
		public test bool q() = !(() > ());
		public test bool q() = (1:10) > ();
		public test bool q() = !((1:10) > (1:10));
		public test bool q() = (1:10, 2:20) > (1:10);
		
		
		public test bool q() = 1 in (1:10, 2:20);
		public test bool q() = !(3 in (1:10, 2:20));
		
		public test bool q() = 3 notin (1:10, 2:20);
		public test bool q() = !(2 notin (1:10, 2:20));
		
		public test bool q() {map[str,list[int]] m = ("a": [1,2], "b": [], "c": [4,5,6]); return m["a"] == [1,2];}
//	}
/*	
	 @expected{UndeclaredVariable}
	    public void UndefinedMapElementError1(){
	    	runTest("(X:2);");
	    }
	 
	 @expected{UndeclaredVariable}
	    public void UndefinedMapElementError2(){
	    	runTest("(1:Y);");
	    }
	 
	 @expected{Throw}
	 public void NoKeyError(){
		 runTest("(1:10, 2:20)[3];");
	 }
	 
	 @expected{Throw}  // MultipleKey
	 public void MultipleKeyError(){
		 runTest("(1:10, 1:10);");
	 }
	
	@Test
	public void testTuple() {
		
		public test bool q() = <1, 2.5, true> == <1, 2.5, true>;
		public test bool q() = <1, 2.5, true> != <0, 2.5, true>;
		public test bool q() = <{1,2}, 3> == <{2,1}, 3>;
		public test bool q() = <1, {2,3}> == <1, {3,2}>;
		public test bool q() = <{1,2}, {3,4}> == <{2,1},{4,3}>;
		
		public test bool q() = <1>           >= <1>;
		public test bool q() = <2>           >= <1>;
		public test bool q() = <1,2>         >= <1>;
		public test bool q() = <1,2>         >= <1,2>;
		public test bool q() = <1,2>         >= <1, 1>;
		public test bool q() = <1,\"def\">   >= <1, \"abc\">;
		public test bool q() = <1, [2,3,4]>  >= <1, [2,3]>;
		public test bool q() = <1, [2,3]>    >= <1, [2,3]>;
		
		public test bool q() = !(<1>          > <1>;
		public test bool q() = <2>           > <1>;
		public test bool q() = <1,2>         > <1>;
		public test bool q() = !(<1,2>        > <1,2>;
		public test bool q() = <1,2>         > <1, 1>;
		public test bool q() = <1,\"def\">   > <1, \"abc\">;
		public test bool q() = <1, [2,3,4]>  > <1, [2,3]>;
		public test bool q() = !(<1, [2,3]>   > <1, [2,3]>;
		
		public test bool q() = <1>           <= <1>;
		public test bool q() = <1>           <= <2>;
		public test bool q() = <1>           <= <1,2>;
		public test bool q() = <1,2>         <= <1,2>;
		public test bool q() = <1,1>         <= <1, 2>;
		public test bool q() = <1,\"abc\">   <= <1, \"def\">;
		public test bool q() = <1, [2,3]>    <= <1, [2,3,4]>;
		public test bool q() = <1, [2,3]>    <= <1, [2,3]>;
		
		public test bool q() = !(<1>          < <1>;
		public test bool q() = <1>           < <2>;
		public test bool q() = <1>           < <1,2>;
		public test bool q() = !(<1,2>        < <1,2>;
		public test bool q() = <1,1>         < <1, 2>;
		public test bool q() = <1,\"abc\">   < <1, \"def\">;
		public test bool q() = <1, [2,3]>    < <1, [2,3,4]>;
		public test bool q() = !(<1, [2,3]>   < <1, [2,3]>;
		
		public test bool q() = <1, \"a\", true> + <1.5, \"def\"> == <1, \"a\", true> + <1.5, \"def\">;
	}
	
	 @expected{UndeclaredVariable}
	    public void UndefinedTupleElementError1(){
	    	runTest("<1,X,3>;");
	    }
	
	@Test
	public void namedTuple()  {
		
		public test bool q() = {tuple[int key, str val] T = <1, \"abc\">; T.key == 1;}
		public test bool q() = {tuple[int key, str val] T = <1, \"abc\">; T.val == \"abc\";}
		
		
	}
	
	@expected{UndeclaredField}
	public void tupleError1(){
		runTest("{tuple[int key, str val] T = <1, \"abc\">; T.zip == \"abc\";}");
	}
	
	@expected{UninitializedVariable}
	public void tupleError2(){
		runTest("{tuple[int key, str val] T; T.key;}");
	}
	

	@Test
	public void testRelation()  {
		
		public test bool q() = {} == {};
		public test bool q() = {<1,10>} == {<1,10>};
		public test bool q() = {<1,2,3>} == {<1,2,3>};
		public test bool q() = {<1,10>, <2,20>} == {<1,10>, <2,20>};
		public test bool q() = {<1,10>, <2,20>, <3,30>} == {<1,10>, <2,20>, <3,30>};
		public test bool q() = {<1,2,3>, <4,5,6>} == {<4,5,6>, <1,2,3>};
		public test bool q() = {<1,2,3,4>, <4,5,6,7>} == {<4,5,6,7>, <1,2,3,4>};
		
		public test bool q() = {} != {<1,2>, <3,4>};
		public test bool q() = !({<1,2>, <3,4>} == {};
		
		public test bool q() = {<1, {1,2,3}>, <2, {2,3,4}>} ==  {<1, {1,2,3}>, <2, {2,3,4}>};
		public test bool q() = {<1, {1,2,3}>, <2, {2,3,4}>} ==  {<2, {2,3,4}>, <1, {1,2,3}>};
		public test bool q() = {<1, {1,2,3}>, <2, {2,3,4}>} ==  {<2, {4,3,2}>, <1, {2,1,3}>};
		
		public test bool q() = {<1,10>} + {} == {<1,10>};
		public test bool q() = {} + {<1,10>}  == {<1,10>};
		public test bool q() = {<1,10>} + {<2,20>} == {<1,10>, <2,20>};
		public test bool q() = {<1,10>, <2,20>} + {<3,30>} == {<1,10>, <2,20>, <3,30>};
		public test bool q() = {<1,10>, <2,20>} + {<2,20>, <3,30>} == {<1,10>, <2,20>, <3,30>};
		
		public test bool q() = {<1,10>} - {} == {<1,10>};
		public test bool q() = {} - {<1,10>}  == {};
		public test bool q() = {<1,10>, <2,20>} - {<2,20>, <3,30>} == {<1,10>};
		
		public test bool q() = {<1,10>} & {} == {};
		public test bool q() = {} & {<1,10>}  == {};
		public test bool q() = {<1,10>, <2,20>} & {<2,20>, <3,30>} == {<2,20>};
		public test bool q() = {<1,2,3,4>, <2,3,4,5>} & {<2,3,4,5>,<3,4,5,6>} == {<2,3,4,5>};
		
		public test bool q() = <2,20> in {<1,10>, <2,20>, <3,30>};
		public test bool q() = <1,2,3> in {<1,2,3>, <4,5,6>};
		
		public test bool q() = <4,40> notin {<1,10>, <2,20>, <3,30>};
		public test bool q() = <1,2,4> notin {<1,2,3>, <4,5,6>};
		
		public test bool q() = {} o {} == {};
		public test bool q() = {<1,10>,<2,20>} o {} == {};
		public test bool q() = {} o {<10,100>, <20,200>} == {};
		public test bool q() = {<1,10>,<2,20>} o {<10,100>, <20,200>} == {<1,100>, <2,200>};
		
		public test bool q() = {<1, \"a\">, <2, \"b\">} * {<false, 0>, <true, 1>} == {<<1,\"a\">,<false,0>>,<<2,\"b\">,<false,0>>,<<1,\"a\">,<true,1>>,<<2,\"b\">,<true,1>>};

		public test bool q() = {<1,2>} join {<2,3>} == {<1,2,2,3>};
		public test bool q() = {<1,2>} join {} == {};
		public test bool q() = {} join {<2,3>} == {};
		public test bool q() = {} join {} == {};
		public test bool q() = {<1,2>} join {3} == {<1,2,3>};
		public test bool q() = {<1,2>} join {3, 4} == {<1,2,3>, <1,2,4>};
		public test bool q() = {1} join {2} == {<1,2>};
		public test bool q() = {1,2,3} join {2} == {<1,2>, <2,2>, <3,2>};
		

		public test bool q() = {} + == {};
		public test bool q() = {} * == {};
		
		public test bool q() = {<1,2>, <2,3>, <3,4>} + == {<1,2>, <2,3>, <3,4>, <1, 3>, <2, 4>, <1, 4>};
		
		public test bool q() = {<1,2>, <2,3>, <3,4>} * == {<1,2>, <2,3>, <3,4>, <1, 3>, <2, 4>, <1, 4>, <1, 1>, <2, 2>, <3, 3>, <4, 4>};
		
		public test bool q() = {<1,2>, <2,3>, <3,4>, <4,2>, <4,5>}+ ==	{<1,2>, <2,3>, <3,4>, <4,2>, <4,5>, <1, 3>, <2, 4>, <3, 2>, <3, 5>, <4, 3>, <1, 4>, <2, 2>, <2, 5>, <3, 3>, <4, 4>, <1, 5>};
		
		public test bool q() = {<1,2>, <2,3>, <3,4>, <4,2>, <4,5>}* == {<1,2>, <2,3>, <3,4>, <4,2>, <4,5>, <1, 3>, <2, 4>, <3, 2>, <3, 5>, <4, 3>, <1, 4>, <2, 2>, <2, 5>, <3, 3>, <4, 4>, <1, 5>, <1, 1>, <5, 5>};
	}
	
	@expected{UndeclaredVariable}
	public void UndeRelationElementError1(){
		runTest("{<1,10>, <X,20>};");
	}
	
	@expected{UndeclaredVariable}
	public void UndefinedRelationElementError2(){
		runTest("{<1,10>, <10, Y>};");
	}
	
	@expected{UndeclaredVariable}
	public void UndefinedRelationElementError3(){
		runTest("{<1,10>, T, <3,30>};");
	}

	
	@expected{UnexpectedType}
	public void compError() {
		runTest("1 o 3;");
	}

	
	@expected{UnexpectedType}
	public void closError1() {
		runTest("1*;");
	}
	
	@expected{UnexpectedType}
	public void closError2() {
		runTest("1+;");
	}
	
	@Test
	public void namedRelation1() {
		
		public test bool q() = {rel[int from, int to] R = {<1,10>, <2,20>}; R.from == {1,2};}
		public test bool q() = {rel[int from, int to] R = {<1,10>, <2,20>}; R.to == {10,20};}
	}
	@expected{UndeclaredField}
	public void namedRelationError(){
		runTest("{rel[int from, int to] R = {<1,10>, <2,20>}; R.zip == {10,20};}");
	}
	
	@Test
	public void good()  {
		prepare("data NODE = val(value V) | f() | f(NODE a);");
		
		assertTrue(runTestInSameEvaluator("f(val(1)) == f(val(1));
	}
	
	@Test
	public void node()  {
		prepare("data NODE = i(int I) | s(str x)  | st(set[NODE] s) | l(list[NODE]) | m(map[NODE,NODE] m) | f() | f(NODE a) | f(NODE a, NODE b) | g() | g(NODE a) | g(NODE a,NODE b);");
		
		assertTrue(runTestInSameEvaluator("f() == f();
		assertTrue(runTestInSameEvaluator("f() != g();
		public test void q() {NODE n = f(); NODE m = g(); n != m;}
		assertTrue(runTestInSameEvaluator("f(i(1)) == f(i(1));
		assertTrue(runTestInSameEvaluator("f(i(1)) != g(i(1));
		public test void q() {NODE n = f(i(1)); NODE m = g(i(1)); n != m;}
		assertTrue(runTestInSameEvaluator("f(i(1),i(2)) == f(i(1),i(2));
		assertTrue(runTestInSameEvaluator("f(i(1),i(2)) != f(i(1),i(3));
		public test void q() { NODE n = f(i(1),i(2)); NODE m = f(i(1),i(3)); n != m;}
		assertTrue(runTestInSameEvaluator("f(i(1),g(i(2),i(3))) == f(i(1),g(i(2),i(3)));
		assertTrue(runTestInSameEvaluator("f(i(1),g(i(2),i(3))) != f(i(1),g(i(2),i(4)));
		public test void q() {NODE n = f(i(1),g(i(2),i(3))); NODE m = f(i(1),g(i(2),i(4))); n != m;}
		assertTrue(runTestInSameEvaluator("f(i(1),g(i(2),st({i(3),i(4),i(5)}))) == f(i(1),g(i(2),st({i(3),i(4),i(5)})));
		public test void q() { NODE n = f(i(1),g(i(2),st({i(3),i(4),i(5)}))); NODE m = f(i(1),g(i(2),st({i(3),i(4),i(5),i(6)}))); n != m;}
		assertTrue(runTestInSameEvaluator("f(i(1),g(i(2),l([i(3),i(4),i(5)]))) == f(i(1),g(i(2),l([i(3),i(4),i(5)])));
		public test void q() { NODE n = f(i(1),g(i(2),l([i(3),i(4),i(5)]))); NODE m = f(i(1),g(i(2),l([i(3),i(4),i(5),i(6)]))); n != m;}
		assertTrue(runTestInSameEvaluator("f(i(1),g(i(2),m((i(3):i(3),i(4):i(4),i(5):i(5))))) == f(i(1),g(i(2),m((i(3):i(3),i(4):i(4),i(5):i(5)))));
		public test void q() {NODE n = f(i(1),g(i(2),m((i(3):i(3),i(4):i(4),i(5):i(5))))); NODE x = f(i(1),g(i(2),m((i(3):i(3),i(4):i(4),i(5):i(0))))); n != x;}
		
		assertTrue(runTestInSameEvaluator("f()                       <= f();
		assertTrue(runTestInSameEvaluator("f()                       <= g();
		assertTrue(runTestInSameEvaluator("f()                       <= f(i(1));
		assertTrue(runTestInSameEvaluator("f(i(1))                   <= f(i(1));
		assertTrue(runTestInSameEvaluator("f(i(1), i(2))             <= f(i(1), i(3));
		assertTrue(runTestInSameEvaluator("f(i(1), i(2))             <= g(i(1), i(3));
		assertTrue(runTestInSameEvaluator("f(i(1), s(\"abc\"))       <= f(i(1), s(\"def\
		assertTrue(runTestInSameEvaluator("f(i(1), l([i(2), i(3)]))  <= f(i(1), l([i(2),i(3),i(4)]));
		assertTrue(runTestInSameEvaluator("f(i(1), l([i(2), i(3)]))  <= f(i(1), l([i(2),i(3)]));
		
		assertFalse(runTestInSameEvaluator("f()                      < f();
		assertTrue(runTestInSameEvaluator("f()                       < g();
		assertTrue(runTestInSameEvaluator("f()                       < f(i(1));
		assertFalse(runTestInSameEvaluator("f(i(1))                  < f(i(1));
		assertTrue(runTestInSameEvaluator("f(i(1), i(2))             < f(i(1), i(3));
		assertTrue(runTestInSameEvaluator("f(i(1), i(2))             < g(i(1), i(3));
		assertTrue(runTestInSameEvaluator("f(i(1), s(\"abc\"))       < f(i(1), s(\"def\
		assertTrue(runTestInSameEvaluator("f(i(1), l([i(2), i(3)]))  < f(i(1), l([i(2),i(3),i(4)]));
		assertFalse(runTestInSameEvaluator("f(i(1), l([i(2), i(3)])) < f(i(1), l([i(2),i(3)]));
		
		assertTrue(runTestInSameEvaluator("f()                          >= f();
		assertTrue(runTestInSameEvaluator("g()                          >= f();
		assertTrue(runTestInSameEvaluator("f(i(1))                      >= f();
		assertTrue(runTestInSameEvaluator("f(i(1))                      >= f(i(1));
		assertTrue(runTestInSameEvaluator("f(i(1), i(3))                >= f(i(1), i(2));
		assertTrue(runTestInSameEvaluator("g(i(1), i(2))                >= f(i(1), i(3));
		assertTrue(runTestInSameEvaluator("f(i(1), s(\"def\"))          >= f(i(1), s(\"abc\
		assertTrue(runTestInSameEvaluator("f(i(1), l([i(2),i(3),i(4)])) >= f(i(1), l([i(2),i(3)]));
		assertTrue(runTestInSameEvaluator("f(i(1), l([i(2), i(3)]))     >= f(i(1), l([i(2),i(3)]));
		
		assertFalse(runTestInSameEvaluator("f()                         > f();
		assertTrue(runTestInSameEvaluator("g()                          > f();
		assertTrue(runTestInSameEvaluator("f(i(1))                      > f();
		assertFalse(runTestInSameEvaluator("f(i(1))                     > f(i(1));
		assertTrue(runTestInSameEvaluator("f(i(1), i(3))                > f(i(1), i(2));
		assertTrue(runTestInSameEvaluator("g(i(1), i(2))                > f(i(1), i(3));
		assertTrue(runTestInSameEvaluator("f(i(1), s(\"def\"))          > f(i(1), s(\"abc\
		assertTrue(runTestInSameEvaluator("f(i(1), l([i(2),i(3),i(4)])) > f(i(1), l([i(2),i(3)]));
		assertFalse(runTestInSameEvaluator("f(i(1), l([i(2), i(3)]))    > f(i(1), l([i(2),i(3)]));
	}
	
	@expected{UninitializedVariable}
	public void UndefinedDataTypeAccess1(){
		prepare("data D = d(int ival);");
		runTestInSameEvaluator("{D someD; someD.ival;}");
	}
	
	@expected{UninitializedVariable}
	public void UndefinedDataTypeAccess2(){
		prepare("data D = d(int ival);");
		runTestInSameEvaluator("{D someD; someD.ival = 3;}");
	}
	
	@Test
	public void undefined()  {
		
		public test bool q() = {int T; (T ? 13) == 13;}
		public test bool q() = {T = (1:10); (T[1] ? 13) == 10;}
		public test bool q() = {T = (1:10); (T[2] ? 13) == 13;}
		
		public test bool q() = {T = (1:10); T[1] ? == true;}
		public test bool q() = {T = (1:10); T[2] ? == false;}
	
	}
*/
