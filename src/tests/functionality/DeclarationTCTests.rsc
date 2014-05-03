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
	
	/*changed*/
	//public test bool shadowingDeclaration1(){
	//	int N = 1; {int N = 2;}; return N == 1;
	//}
	
	/*changed*/
	//public test bool shadowingDeclaration2(){
	//	N = 1; {int N = 2;}; return N == 1;
	//}
	
	/*changed*/
	//public test bool shadowingDeclaration4(){
	//	int N = 3; return int N := 3;
	//}
	