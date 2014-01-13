module tests::functionality::SubscriptTCTests

data NODE = f(int a, str b, real c);

@expected{UnexpectedType}
	public test bool WrongMapIndex(){
		map[int,int] M = (1:10,2:20); M["abc"];return false;
	}
	
	@expected{UnexpectedType}
	public test bool WrongMapIndex(){
		map[int,int] M  = (1:10,2:20); M["abc"] = 3;return false;
	}
	
	@expected{UndeclaredVariable}
	public test bool WrongMapAssignment(){
		runTest("{map[int,int] M = (1:10,2:20); M[2] = \"abc\";}");
	}
	
	@expected{UnsupportedSubscript}
	public test bool tupleIndexError(){
		<0, "a", 3.5>["abc"];return false;
	}
	
	@expected{UnsupportedSubscript}
	public test bool tupleAssignmentError(){
		T = <0, "a", 3.5>["abc"]; T[1] = 3; return false;
	}
	
	@expected{UnexpectedType}
	public test bool nodeIndexError() {
		f(0, "a", 3.5)["abc"];return false;
	}
	
	@expected{UnexpectedType}
	public test bool nodeAssignmentError(){
		NODE N = f(0, "a", 3.5); N.b = 3; return false;
	}
	
	@expected{UnexpectedType}
	public test bool WrongListIndex(){
		list[int] L = [0,1,2,3]; L["abc"]; return false;
	}
	
	@expected{UnsupportedSubscript}
	public test bool WrongListIndex(){
		list[int] L = [0,1,2,3]; L["abc"] = 44;return false;
	}
	
	@expected{UnexpectedType}
	public test bool WrongListAssignment(){
		list[int] L = [0,1,2,3]; L[2] = "abc";return false;
	}
	
		@expected{UninitializedVariable}
	public test bool UninitializedTupleVariable(){
		tuple[int,int] T; T[1];return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedTupleVariable(){
		tuple[int,int] T; T[1] = 10; return false;
	}
	
		@expected{IndexOutOfBounds}
	public test bool tupleBoundsError(){
		<0, "a", 3.5>[3] == 3.5;
	}
	
		@expected{UninitializedVariable}
	public test bool UninitializedRelVariable(){
		rel[int,int] R; R[1,2];return false;
	}
	