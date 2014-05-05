module tests::functionality::DeclarationTCTests

import StaticTestingUtils;
 
public test bool localTypeInferenceNoEscape2() = undeclaredVariable("{ x = 1; x == 1; } x;");

public test bool undeclaredType1() = undeclaredVariable("X N;");

public test bool doubleDeclaration3() = redeclaredVariable("int f(int N){int N = 1; return N;}");

public test bool shadowingDeclaration1() = redeclaredVariable("int N = 1; {int N = 2;}; N == 1;");

public test bool shadowingDeclaration2() = redeclaredVariable("N = 1; {int N = 2;}; N == 1;");

public test bool shadowingDeclaration4() = redeclaredVariable("int N = 3; int N := 3;");
	