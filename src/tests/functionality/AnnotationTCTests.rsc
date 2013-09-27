module tests::functionality::AnnotationTCTests

@expected{UndeclaredAnnotation}
  	public test bool annotationNotAllowed1(){
  		1 [@an=3]; return false;
  	}
  	
  	@expected{UnsupportedOperation}
  	public test bool annotationNotAllowed21(){
  		1 @ ann; return false;
  	}
  	
  	@expected{UnsupportedOperation}
  	public test bool annotationNotAllowed31(){
  		f[@pos=true]; return false;
  	}
  	
  	@expected{UndeclaredAnnotation}
  	public test bool annotationNotAllowed41(){
  		f() [@wrongpos=true]; return false;
  	}
  	
  	@expected{UninitializedVariable}
  	public test bool UndefinedValueError11(){
  		F someF; someF @ pos; return false;
  	}
  	
  	@expected{UninitializedVariable}
  	public test bool UndefinedValueError21(){
  		F someF; someF [@pos=3]; return false;
  	}
  	
  	@expected{UninitializedVariable}
  	public test bool UninitializedVariableError1(){
  		F someF; someF @ pos = 3;
  	}
  	