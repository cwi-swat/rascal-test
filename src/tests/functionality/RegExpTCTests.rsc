module tests::functionality::RegExpTCTests

@expected{RedeclaredVariable}
//	public void RedeclaredError(){
		public test bool match() = (/<x:[a-z]+>-<x:[a-z]+>/ !:= "abc-abc") && (x == "abc");
//	}