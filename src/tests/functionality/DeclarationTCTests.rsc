module tests::functionality::DeclarationTCTests

import StaticTestingUtils;
 
public test bool localTypeInferenceNoEscape2() = undeclaredVariable("{ x = 1; x == 1; } x;");

public test bool undeclaredType1() = undeclaredVariable("X N;");

public test bool doubleDeclaration3() = redeclaredVariable("int f(int N){int N = 1; return N;}");

public test bool shadowingDeclaration1() = redeclaredVariable("int N = 1; {int N = 2;}; N == 1;");

public test bool shadowingDeclaration2() = redeclaredVariable("N = 1; {int N = 2;}; N == 1;");

public test bool shadowingDeclaration4() = redeclaredVariable("int N = 3; int N := 3;");


// Variable declaration in imported module

public test bool privateVarDeclarationNotVisible(){ 
	makeModule("M", "private int x = 3;"); 
	return undeclaredVariable("x;", importedModules=["M"]);
}

public test bool publicVarDeclarationVisible(){ 
	makeModule("M", "public int x = 3;"); 
	return checkOK("x;", importedModules=["M"]);
}

public test bool publicVarDeclarationVisibleViaQualifiedName(){ 
	makeModule("M", "public int x = 3;"); 
	return checkOK("M::x;", importedModules=["M"]);
}

public test bool DefaultVarDeclarationNotVisible(){ 
	makeModule("M", "int x = 3;"); 
	return undeclaredVariable("x;", importedModules=["M"]);
}

public test bool RedeclaredVarDeclaration(){ 	// PK: I am not sure
	makeModule("M", "public int x = 3;"); 
	return redeclaredVariable("int x = 4;", importedModules=["M"]);
}

// Function declaration in imported module

public test bool privateFunDeclarationNotVisible(){ 
	makeModule("M", "private int f() = 3;"); 
	return undeclaredVariable("x();", importedModules=["M"]);
}

public test bool publicFunDeclarationVisible(){ 
	makeModule("M", "public int f() = 3;"); 
	return checkOK("f();", importedModules=["M"]);
}

public test bool publicFunDeclarationVisibleViaQualifiedName(){ 
	makeModule("M", "public int f() = 3;"); 
	return checkOK("M::f();", importedModules=["M"]);
}

public test bool DefaultFunDeclarationVisible(){ 
	makeModule("M", "int f() = 3;"); 
	return checkOK("f();", importedModules=["M"]);
}

// Non-terminal declaration in imported module

public test bool NonTerminalVisible(){ 
	makeModule("M", "syntax A = \"a\";"); 
	return checkOK("A a;", importedModules=["M"]);
}

public test bool QualifiedNonTerminalVisible(){ 
	makeModule("M", "syntax A = \"a\";"); 
	return checkOK("M::A a;", importedModules=["M"]);
}

public test bool UseNonTerminal(){ 
	makeModule("M", "syntax A = \"a\";"); 
	return checkOK("[A]\"a\";", importedModules=["M"]);
}

public test bool ExtendNonTerminal(){ 
	makeModule("M", "syntax A = \"a\";"); 
	return checkOK("A a;", initialDecls=["syntax A = \"b\";"], importedModules=["M"]);
}

public test bool UseExtendedNonTerminal(){ 
	makeModule("M", "syntax A = \"a\";"); 
	return checkOK("A x = [A] \"b\";", initialDecls=["syntax A = \"b\";"], importedModules=["M"]);
}

// Data declaration in imported module

public test bool ADTVisible(){ 
	makeModule("M", "data DATA = d();"); 
	return checkOK("DATA x;", importedModules=["M"]);
}

public test bool QualifiedADTVisible(){ 
	makeModule("M", "data DATA = d();"); 
	return checkOK("M::DATA x;", importedModules=["M"]);
}

public test bool ExtendADT(){ 
	makeModule("M", "data DATA = d();"); 
	return checkOK("DATA x = d2(3);", initialDecls=["data DATA = d2(int n);"], importedModules=["M"]);
}

public test bool RedeclareConstructorError(){ 
	makeModule("M", "data DATA = d();"); 
	return declarationError("DATA x = d();", initialDecls=["data DATA = d();"], importedModules=["M"]);
}

// Data declaration in imported module

public test bool UseImportedAlias(){ 
	makeModule("M", "alias INT = int;"); 
	return checkOK("int x = 3;", importedModules=["M"]);
}



	