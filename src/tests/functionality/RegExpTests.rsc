module tests::functionality::RegExpTests

//	@Test public void match() {
		public test bool match()=/abc/ := "abc";
		public test bool match()=/def/ !:= "abc";
		public test bool match()=/def/ !:= "abc";
		public test bool match()=/[a-z]+/ := "abc";
		public test bool match()=/.*is.*/ := "Rascal is marvelous";
		public test bool match()=/@.*@/ := "@ abc @";
		
		public test bool match()=(/<x:[a-z]+>/ := "abc") && (x == "abc");
		public test bool match()=(/if<tst:.*>then<th:.*>fi/ := "if a \> b then c fi") 
				           && (tst == " a \> b ") && (th == " c ");

		public test bool match()=(/<l:.*>[Rr][Aa][Ss][Cc][Aa][Ll]<r:.*>/ := "RASCAL is marvelous")
				            && (l == "") && (r == " is marvelous");
		
		public test bool match(){str x = "abc"; return /<x>/ := "abc";}
		public test bool match() {str x = "abc"; int n = 3; return /<x><n>/ := "abc3";}
		
		public test bool match()=(/<x:[a-z]+>-<x>/ := "abc-abc") && (x == "abc");
		public test bool match()=(/<x:[a-z]+>-<x>-<x>/ := "abc-abc-abc") && (x == "abc");
		public test bool match()=/<x:[a-z]+>-<x>/ !:= "abc-def";

		public test bool match()=/\// := "/";
		public test bool match()=/<x:\/>/ := "/";
		public test bool match()=/<x:\/>/ := "/" && x == "/";
//	}
	

	
//	@Test public void matchWithLocalVariable(){
//		public test bool matchWithLocalVariable() { str x;          return (/<x:[a-z]+>/ := "abc") && (x == "abc");}
//		public test bool matchWithLocalVariable() { str x = "123"; return (/<x:[a-z]+>/ := "abc") && (x == "abc");}
//		public test bool matchWithLocalVariable() { str x = "123"; return (/<x:[a-z]+>/ := "abc"); (x == "123");}
//	}
	
//	@Test public void matchWithLocalVariableOfNonStringType(){
//		public test bool matchWithLocalVariable() { int x;       return (/<x:[a-z]+>/ := "abc") && (x == "abc");}
//		public test bool matchWithLocalVariable() { int x = 123; return (/<x:[a-z]+>/ := "abc") && (x == "abc");}
//		public test bool matchWithLocalVariable() { int x = 123; return (/<x:[a-z]+>/ := "abc"); (x == 123);}
//	}
	
//	@Test public void nomatchWithLocalVariable(){
//		public test bool nomatchWithLocalVariable() { str x = "123"; return (/<x:[a-z]+>/ !:= "abc" || x == "123");}
//		public test bool nomatchWithLocalVariable() { str x = "123"; (/<x:[a-z]+>/ !:= "abc");  return (x == "123");}
//	}
	
//	@Test public void repeatedInterpolation() {
		public test bool repeatedInterpolation(){r = out:for (i <- [1,2,3]) for (/<i>/ := "332211") append out:i; return r == [1,1,2,2,3,3]; }
//	}
	
// @Test  public void interpolatingAndEscaped() 
		public test bool interpolationAndEscaped() {x = "."; return (/<x>/ !:= "a");}
		public test bool interpolationAndEscaped() {x = "."; return /<x>/ := ".";}
		public test bool interpolationAndEscaped() = /.<x:bc>/ := "abc" && x == "bc";
		public test bool interpolationAndEscaped() = /^(a|b)*$/ := "ababab"; 
		public test bool interpolationAndEscaped()= /(a|b)<x:cd>/ := "acd" && x == "cd";
		public test bool interpolationAndEscaped()= /^(a|b)*$/ !:= "abacbab";
	    public test bool interpolationAndEscaped()= /(.)<x:bc>/ := "abc" && x == "bc";
 	    public test bool interpolationAndEscaped() { x = "("; y = ")"; return /<x>.<y>/ !:= "a";}
		public test bool interpolationAndEscaped() { x = "("; y = ")"; return /<x>.<y>/ := "(a)";}
//	}
	
//	@Test public void literalBracket() {
		public test bool literalBracket()=/\(/ := "(";
//	}
	
//	@Test public void lotsofbrackets() {
		public test bool lotsofBracket()=/(<x:[a-z]+>)/ := "abc" && x == "abc";
		public test bool lotsofBracket()=/((<x:[a-z]+>))/ := "abc" && x == "abc";
		public test bool lotsofBracket()=/(<x:([a-z]+)>)/ := "abc" && x == "abc";
		public test bool lotsofBracket()=/(<x:(([a-z])+)>)/ := "abc" && x == "abc";
//	}
	
//	@Test  public void nogrouplookaheadandbehind() {
		public test bool nogrouplookaheadandbehind()=/(?s)a.c/ := "a\nc";
//	}
	
//	@Test public void InterpolateInPatternVarDecl(){
		public test bool interpolateIndPatternDecl(){ int n = 3; return (/<x:<n>>/ := "3" && x == "3");}
		public test bool interpolateIndPatternDecl(){ int n = 3; return (/<x:<n>><x>/ := "33" && x == "3");}
		public test bool interpolateIndPatternDecl(){ int n = 3; return  (/<x:a<n>>/ := "a3" && x == "a3");}
		public test bool interpolateIndPatternDecl(){ int n = 3; return  (/<x:<n>b>/ := "3b" && x == "3b");}
		public test bool interpolateIndPatternDecl(){ int n = 3; return  (/<x:a<n>b>/ := "a3b" && x == "a3b");}
		public test bool interpolateIndPatternDecl(){ int n = 3;  return (/<x:a<n>b>/ := "a3b" && x == "a3b");}
		public test bool interpolateIndPatternDecl(){ int n = 3; return (/<x:a<n>b<n>c>/ := "a3b3c" && x == "a3b3c");}
		public test bool interpolateIndPatternDecl(){ int n = 3; return (/<x:a<n>b<n>c><x>/ := "a3b3ca3b3c" && x == "a3b3c");}
		public test bool interpolateIndPatternDecl(){ int n = 3; return (/<x:a{<n>}>/ := "aaa" && x == "aaa");}
		public test bool interpolateIndPatternDecl(){ str a = "a"; int n = 3; return (/<x:<a>{<n>}>/ := "aaa" && x == "aaa");}
		public test bool interpolateIndPatternDecl(){ str a = "abc"; int n = 3; return (/<x:(<a>){<n>}>/ := "abcabcabc" && x == "abcabcabc");}
	
		public test bool interpolateIndPatternDecl(){ int n = 3;  return (/<x:\\>/ := "\\" && x == "\\");}
		public test bool interpolateIndPatternDecl(){ int n = 3;  return (/<x:\>>/ := "\>" && x == "\>");}

		public test bool interpolateIndPatternDecl(){ int n = 3;  return (/<x:\<>/ := "\<" && x == "\<");}
		public test bool interpolateIndPatternDecl(){ int n = 3;  return (/<x:\< <n>>/ := "\< 3" && x == "\< 3");}
		public test bool interpolateIndPatternDecl(){ int n = 3;  return (/<x:\< <n>\>>/ := "\< 3\>" && x == "\< 3\>");}
//	}
	
//	@Test public void multipleMatches(){
		public test bool multipleMatches()=[<x, y> | /<x:[a-z]+?><y:[a-z]+?>/ := "abcd"] == [<"a", "b">, <"c", "d">];
		public test bool multipleMatches() {int n = 3;  return [y | /<x:abc><y:.{<n>}>/ := "abc111abc222abc333"] == ["111", "222", "333"];}
		public test bool multipleMatches()=[s | /<s:.>/ := "abcdef"] ==  ["a","b","c","d","e","f"];
//	}
	
	
	//@Test 
	//public void matchWithExternalModuleVariable(){
	//	prepareModule("XX", "module XX str x = "abc";");
	//	runTestInSameEvaluator("import XX;");
	//	assertTrue(runTestInSameEvaluator("(/<x:[a-z]+>/ := "abc") && (x == "abc");
	//}
	//
	//@Test 
	//public void nomatchWithExternalModuleVariable(){
	//	prepareModule("XX", "module XX public str x = "abc";");
	//	runTestInSameEvaluator("import XX;");
	//	assertTrue(runTestInSameEvaluator("(/<x:[a-z]+>/ !:= "pqr") || (x == "abc");
	//	assertTrue(runTestInSameEvaluator("{(/<x:[a-z]+>/ !:= "pqr") ; (x == "abc");}
	//}
	//
	//@Test 
	//public void matchWithExternalModuleVariableOfWrongType(){
	//	prepareModule("XX", "module XX int x = 123;");
	//	assertTrue(runTestInSameEvaluator("(/<x:[a-z]+>/ := "abc") && (x == "abc");
	//}
	
//	@Test(expected=SyntaxError.class)
//	public void RegExpSyntaxError1(){
//		runTest("/[a-/ := "abc";");
//	}
//	
//	@Test
//	public void modifiers() {
//		assertTrue(runTest("/abc/i := "ABC";
//		assertTrue(runTest("/abc/i := "ABC";
//		assertTrue(runTest("/ab.*c/s := "ab\\nc";
//		assertTrue(runTest("/ab.*c/si := "AB\\nc";
//	    assertTrue(runTest("/^ab.*c$/smd := "ab\\r\\nc";
//	}
//	
//	@Test
//	public void wordCount1(){
//	
//	String cnt = 
//		      "int cnt(str S){" +
//		      "  int count = 0;" +
//		      "  while (/^\\W*<word:\\w+><rest:.*$>/ := S) { " +
//		      "         count = count + 1;" +
//		      "         S = rest;" +
//		      "  }" +
//		      "  return count;" +
//		      "}";
//		assertTrue(runTest("{" + cnt + "cnt("abc def ghi") == 3;}
//	}
//	
//	@Test
//	public void wordCount2(){
//	
//	String cnt = 
//		      "int cnt(str S){" +
//		      "  int count = 0;" +
//		      "  while (/^\\W*<word:\\w+><rest:.*$>/ := S) { " +
//		      "         count = count + 1;" +
//		      "         S = rest;" +
//		      "  }" +
//		      "  return count;" +
//		      "}";
//		assertTrue(runTest("{" + cnt + "cnt("abc def ghi") == 3;}
//	}
//}
