module tests::functionality::DeclarationTCTests


@expected{UndeclaredVariable}
	public test bool localTypeInferenceNoEscape2() {
		{ x = 1; x == 1; }
		x;
		return false;
	}
	
	
@expected{UndeclaredType}
	public test bool undeclaredType1(){
		X N;
		return false;
	}
	
@expected{RedeclaredVariable}
	public test bool doubleDeclaration3(){
		int f(int N){int N = 1; return N;} f(3) == 1;
		return false;
	}