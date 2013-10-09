module tests::functionality::DataTypeTCTests
data D = d(int ival);

@expected{UnexpectedType}
  	public test bool andError1() {
  		3 && true; return false;
  	}
  	
  @expected{UnexpectedType}
  	public test bool andError2() {
  		3 ==> true; return false;
  	}
  	
  @expected{UnexpectedType}
  	public test bool condExpError1() {
  		1 ? 2 : 3; return false;
  	}
  	
  	@expected{UnsupportedOperation}
  	public test bool addError1() {
  		3 + true; return false;
  	}
  	
  
  @expected{UnsupportedOperation}
  	public test bool subError1() {
  		3 - true;return false;
  	}
  
  @expected{UnsupportedOperation}
  	public test bool uMinusError1() {
  		- true; return false;
  	}
  	
  @expected{UnsupportedOperation}
  	public test bool  timesError1() {
  		3 * true;return false;
  	}
  	
  @expected{UnsupportedOperation}
  	public test bool  divError1() {
  		3 / true;return false;
  	}
  	
 @expected{UnsupportedOperation}
  	public test bool  modError1() {
  		3 % true;return false;
  	}
  	
 @expected{UnexpectedType}
  	public void orError1() {
  		public test bool assertTrue2() = 3 || true;
  	}
  	
  @expected{UninitializedVariable}
  	public test bool UndefinedLocationError11(){
  		 loc Loc; Loc.url;return false;
  	}
  	
  	@expected{UninitializedVariable}
  	public test bool UndefinedLocationError21(){
  		 loc Loc; Loc.url = "abc";return false;
  	}
  	
  	@expected{UninitializedVariable}
  	public test bool UndefinedLocationError31(){
  		 loc Loc; Loc[url = "abc"];return false;
  	}
  	
  	@expected{UndeclaredField}
  	public test bool WrongLocFieldError11(){
  		loc Loc = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
  		 Loc.bla;return false;
  	}
  	
  	@expected{UndeclaredField}
  	public test bool WrongLocFieldError21(){
  		loc Loc = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
  		Loc[bla=3]; return false;
  	}
  	
  	@expected{UnexpectedType}
  	public test bool URLFieldError11(){
  		loc Loc = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
  		Loc.uri=true;return false;
  	}
  	
  	@expected{ParseError}
  	public test bool URLFieldError21(){
  		loc Loc = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
  		Loc.uri="? ??";return false;
  	}
  	
  	@expected{UnexpectedType}
  	public test bool LengthFieldError1(){
  		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
  		Loc.length=true;return false;
  	}
  	
  	@expected{UnexpectedType}
  	public test bool OffsetFieldError1(){
  		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
  		Loc.offset=true;return false;
  	}
  	
  	@expected{UndeclaredField}
  	public test bool BeginLineFieldError1(){
  		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
  		Loc.beginLine=true;return false;
  	}
  	@expected{UnexpectedType}
  	public test bool EndLineFieldError1(){
  		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
  		Loc.end=<true,12>;return false;
  	}
  	
  	@expected{UnexpectedType}
  	public test bool BeginColumnFieldError1(){
  		loc Loc  = |file:///home/paulk/pico2.trm|(0,1,<1,4>,<4,5>);
  		Loc.begin=<true,1>;return false;
  	}
  	
  	@expected{UndeclaredVariable}
  	public test bool  SubscriptError21() {
  		L[5]; return false;
  	}
  	
  	@expected{UndeclaredVariable}
      public test bool UndefinedSetElementError1(){
      	{X}; return false;
      }
      
    @expected{UnsupportedOperation}
  	public test bool inError1() {
  		1 in 3; return false;
  	}
  	
  	@expected{UnsupportedOperation}
  	public test bool productError1() {
  		{1,2,3} * true; return false;
  	}
  	
  	@expected{UndeclaredField}
  	public test bool tupleError11(){
  	 tuple[int key, str val] T = <1, "abc">; return T.zip == "abc";
  	}
  	
  	@expected{UninitializedVariable}
  	public void tupleError21(){
  		tuple[int key, str val] T; T.key;return false;
  	}
  	
  	@expected{UninitializedVariable}
  	public test bool UndefinedDataTypeAccess11(){
  		D someD; someD.ival;return false;
  	}
  
  @expected{UninitializedVariable}
  	public test bool UndefinedDataTypeAccess21(){
  		D someD; someD.ival = 3; return false;
  	}
  	
 @expected{UndeclaredVariable}
  	    public void UndefinedMapElementError11(){
  	    	(X:2);return false;
  	    }
  	    
 @expected{UndeclaredVariable}
  	    public void UndefinedMapElementError21(){
  	    	(1:Y);return false;
  	    }
  	    
 @expected{UndeclaredVariable}
  	    public void UndefinedTupleElementError11(){
  	    	<1,X,3>;return false;
  	    }
  	    
 @expected{UndeclaredVariable}
  	public test bool UndeRelationElementError11(){
  		{<1,10>, <X,20>};return false;
  	}
  	
  	@expected{UndeclaredVariable}
  	public test bool UndefinedRelationElementError21(){
  		{<1,10>, <10, Y>};return false;
  	}
  	
  	@expected{UndeclaredVariable}
  	public test bool UndefinedRelationElementError31(){
  		{<1,10>, T, <3,30>};return false;
  	}
  
  	
  	@expected{UnsupportedOperation}
  	public test bool compError1() {
  		1 o 3;return false;
  	}
  
  
  	@expected{UnsupportedOperation}
  	public test bool closError11() {
  		1*;return false;
  	}
  	
  	@expected{UnsupportedOperation}
  	public test bool closError21() {
  		1+;return false;
  	}
  	
  	@expected{UndeclaredField}
  	public test bool namedRelationError1(){
  		{rel[int from, int to] R = {<1,10>, <2,20>}; R.zip == {10,20};}return false;
  	}
  