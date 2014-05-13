module AllStaticIssues

import StaticTestingUtils;

//public test bool comma() = checkOK("or(true);", 
//					initialDecls = ["test bool or(bool b) { if (true || b == true, b || true == true, false || false == false) return true; else return false; }"]); 

//public test bool or(bool b) { if (true || b == true, b || true == true, false || false == false) return true; else return false; } 

// https://github.com/cwi-swat/rascal/issues/416

public test bool Issue416(){
	return checkOK("true;", initialDecls=["data D = d(int i) | d();", "D d(int i) { if (i % 2 == 0) fail d; else return d();}"]);
} 

// https://github.com/cwi-swat/rascal/issues/430

public test bool Issue430() =
	checkOK("true;", initialDecls=["data T1 = \\int() | \\void() | string(str s);",
								   "data T2 = \\int() | \\void() | string(str s);",
								   "bool fT1(T1::\\int()) = true;",
								   "bool fT2(T2::\\int()) = true;"]);


// https://github.com/cwi-swat/rascal/issues/431

// Included in FunctionCompositionTests

// https://github.com/cwi-swat/rascal/issues/432

public test bool Issue432() =
	checkOK("set[value] s := {} && s\<0\> == {};");
	
// https://github.com/cwi-swat/rascal/issues/435

public test bool Issue435() {
	makeModule("M", "bool sideEffect1() {
             			void One() { called = called + 1; return; }
             			int called = 0;  
             			One(); 
             			One(); 
            			One(); 
             			return called == 3;
             		}");	
	return checkOK("true;", importedModules=["M"]);
}
	
// https://github.com/cwi-swat/rascal/issues/436	
// Is already included in the standard test suite
	
// https://github.com/cwi-swat/rascal/issues/442

public test bool Issue442() =
	checkOK("true;", initialDecls=["syntax A = \"a\";",
								   "value main(list[value] args) = [A] \"a\" := [A] \"a\";"]);
	
// 	https://github.com/cwi-swat/rascal/issues/448

public test bool Issue448a() =
	checkOK("true;", importedModules = ["Exception", "List"],
					 initialDecls = ["bool tstMapper(list[int] L) {
  										int incr(int x) { return x + 1; };
  										return mapper(L, incr) == [x + 1 | x \<- L];
									  }"]);
	
public test bool Issue448b() =
	checkOK("true;", importedModules = ["Exception", "List"],
 					 initialDecls =    ["list[&U] mapper(tuple[list[&T] lst, &U (&T) fun] t) = [ t.fun(elem) | elem \<- t.lst ];",

										"value tstMapper(list[int] L) {
  											int incr(int x) { return x + 1; };
  											return mapper(\<L, incr\>);
										 }"]);	
										 
// https://github.com/cwi-swat/rascal/issues/449	

public test bool Issue449() =
	checkOK("true;", importedModules = ["Exception", "ParseTree"],
					 initialDecls =   ["syntax A = a: \"a\";",

										"test bool tstA(){
    										pt = parse(#A, \"a\");
    										return a() := pt && pt is a;
										 }"]);
										 
// https://github.com/cwi-swat/rascal/issues/450

public test bool Issue450() =
	checkOK("true;", importedModules = ["Exception", "List", "ParseTree"],
					 initialDecls =   ["syntax A = a: \"a\";",
					 
					 					"syntax As = as: A+ alist;",

										"syntax C = c: A a \"x\" As as;",

										"test bool tstA(){
   										 pt = [A] \"a\";
   											 return a() := pt ;
										}"]);

// https://github.com/cwi-swat/rascal/issues/451
// Is already included in the standard test suite

// https://github.com/cwi-swat/rascal/issues/452
public test bool Issue452() =
	checkOK("true;", importedModules = ["ParseTree"]);


// https://github.com/cwi-swat/rascal/issues/456

public test bool Issue456() =
	checkOK("true;", initialDecls = ["data POINT1 = point1(int x, int y, int z = 3, list[str] colors = []);",
									  "value main(list[value] args) =  point1(1,2);"]);

// https://github.com/cwi-swat/rascal/issues/457

public test bool Issue457() =
	checkOK("true;", initialDecls = ["data Exp1[&T] = tval(&T tval) | tval2(&T tval1, &T tval2) | ival(int x);", 
									  "value main(list[value] args) {m = tval2(\"abc\", \"def\"); str s2 = m.tval2; return s2 == \"def\";}"]);   

// https://github.com/cwi-swat/rascal/issues/459

public test bool Issue459() =
	checkOK("true;",  importedModules = ["Exception", "Set"],
					initialDecls = ["value main(list[value] args) = toMap({});"]);

// https://github.com/cwi-swat/rascal/issues/467

public test bool Issue459() =
	checkOK("true;",  importedModules = ["Exception", "List"]);
																	 

// https://github.com/cwi-swat/rascal/issues/458

public test bool Issue458a() =												// https://github.com/cwi-swat/rascal/issues/458
	checkOK("\"f1\"(1, M=10) := \"f1\"(1, M=10);");

data F1 = f1(int N, int M = 10, bool B = false) | f1(str S);

public test bool Issue458b() =
	checkOK("f1(1, M=X) := f1(1, B=false, M=20) && X == 20;", initialDecls=["data F1 = f1(int N, int M = 10, bool B = false) | f1(str S);"]);
		
public test bool Issue458c() = 
	checkOK("\"f1\"(1, M=X) := \"f1\"(1, B=false, M=20) && X == 20;", initialDecls=["data F1 = f1(int N, int M = 10, bool B = false) | f1(str S);"]);


// https://github.com/cwi-swat/rascal/issues/465

public test bool Issue465(){												
	makeModule("M", "lexical IntegerLiteral = [0-9]+;           
					 start syntax Exp = con: IntegerLiteral;
					 data Exp = con(int n);");
	return checkOK("true;", importedModules=["M"]);
}

// https://github.com/cwi-swat/rascal/issues/471

public test bool Issue471a() =
	checkOK("([A1, f([A1, b(), DATA X8])] := [a(), f([a(),b(),c()])]) && (A1 == a());", 
					initialDecls = ["data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] L) | f(set[DATA] S)| s(set[DATA] S)|g(int N)|h(int N)| f(DATA left, DATA right);"]);

public test bool Issue471b() =
	checkOK("([f([A1, b(), DATA X8]), A1] := [f([a(),b(),c()]), a()]) && (A1 == a());", 
					initialDecls = ["data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] L) | f(set[DATA] S)| s(set[DATA] S)|g(int N)|h(int N)| f(DATA left, DATA right);"]);


public test bool Issue471c() =
	checkOK("([DATA A2, f([A2, b(), *DATA SX1]), *SX1] := [a(), f([a(),b(),c()]), c()]) && (A2 == a()) && (SX1 ==[c()]);", 
					initialDecls = ["data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] L) | f(set[DATA] S)| s(set[DATA] S)|g(int N)|h(int N)| f(DATA left, DATA right);"]);

public test bool Issue471d() =
	checkOK("([DATA A3, f([A3, b(), *DATA SX2]), *SX2] !:= [d(), f([a(),b(),c()]), a()]);", 
					initialDecls = ["data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] L) | f(set[DATA] S)| s(set[DATA] S)|g(int N)|h(int N)| f(DATA left, DATA right);"]);

public test bool Issue471e() =
	checkOK("([DATA A4, f([A4, b(), *DATA SX3]), *SX3] !:= [c(), f([a(),b(),c()]), d()]);", 
					initialDecls = ["data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] L) | f(set[DATA] S)| s(set[DATA] S)|g(int N)|h(int N)| f(DATA left, DATA right);"]);

public test bool Issue471f() =
	checkOK("f(_) := f(1);", 
					initialDecls = ["data F = f(int N) | f(int N, int M) | f(int N, value f, bool B) | g(str S);"]);

public test bool Issue471g() =
	checkOK("f(_,_):= f(1,2);", 
					initialDecls = ["data F = f(int N) | f(int N, int M) | f(int N, value f, bool B) | g(str S);"]);

public test bool Issue471h() =
	checkOK("f(_,_,_):= f(1,2.5,true);", 
					initialDecls = ["data F = f(int N) | f(int N, int M) | f(int N, value f, bool B) | g(str S);"]);

 public test bool Issue471i() =
	checkOK("(f(n5) := f(1)) && (n5 == 1);", 
					initialDecls = ["data F = f(int N) | f(int N, int M) | f(int N, value f, bool B) | g(str S);"]);
 
 public test bool Issue471j() =
	checkOK("({e(X3), g(X3), h(X3)} := {e(3), h(3), g(3)}) && (X3 == 3);", 
					initialDecls = ["data DATA = a() | b() | c() | d() | e(int N) | f(list[DATA] L) | f(set[DATA] S)| s(set[DATA] S)|g(int N)|h(int N)| f(DATA left, DATA right);
"]);


// https://github.com/cwi-swat/rascal/issues/472

public test bool Issue472a() =
	checkOK("[1, /f(/g(2), _), 3] := [1, f(g(1),f(g(2),g(3),true)), 3];", 
					initialDecls = ["f(F left, F right) | g(int N);"]);
 
public test bool Issue472b() =
	checkOK("[1, F outer: /f(/F inner: g(2), _), 3] := [1, f(g(1),f(g(2),g(3))), 3] && outer == f(g(1),f(g(2),g(3))) && inner == g(2);", 
					initialDecls = ["data F = f(F left, F right) | g(int N);"]);

// https://github.com/cwi-swat/rascal/issues/473

public test bool Issue473() =
 	unexpectedType("[ \<s,r,L\> | list[int] L:[*str s, *str r] \<- [ [1,2], [\"3\",\"4\"] ]];");



// https://github.com/cwi-swat/rascal/issues/477

// A discussion only

// https://github.com/cwi-swat/rascal/issues/478

public test bool Issue478() =
	checkOK("true;", 
					initialDecls = ["data F1 = f1(int N, int M = 10, bool B = false) | f1(str S);",
 									 "public value main(list[value] args) = f1(1, M=10)  := f1(1);"]); 

// https://github.com/cwi-swat/rascal/issues/481

public test bool Issue481() =
	checkOK("true;", importedModules=["ParseTree"],
					initialDecls = ["syntax A = a: \"a\";",

									"syntax As = as: A+ alist;",

									"syntax C = c: A a \"x\" As as;",

									"bool tstAs(){
    									pt = parse(#As, \"aaa\");
    									return as(al) := pt && pt is as && pt.alist == al;
									}",
									
									"bool tstC(){
    									pt = parse(#C, \"axaaa\");
    									return c(A a, As as) := pt && pt.a == a && pt.as == as && size([x | x \<- as.alist]) == 3;
									}"]);


// https://github.com/cwi-swat/rascal/issues/480

public test bool Issue480(){
	makeModule("M", "data Figure (real shrink = 1.0, str fillColor = \"white\", str lineColor = \"black\")  =  emptyFigure() 
  					| ellipse(Figure inner = emptyFigure()) 
  					| box(Figure inner = emptyFigure());

 				value main(list[value] args) = (!(ellipse(inner=emptyFigure(fillColor=\"red\")).fillColor == \"white\"));");
	return checkOK("true;", importedModules=["M"]);
} 
 
// https://github.com/cwi-swat/rascal/issues/482

public test bool Issue482() =
	checkModuleOK(|rascal:///APIGen.rsc|);
	
// https://github.com/cwi-swat/rascal/issues/483

public test bool Issue483() =
	checkModuleOK(|rascal:///Ambiguity.rsc|);
	
	
// https://github.com/cwi-swat/rascal/issues/491

public test bool Issue491() =
	checkOK("true;", importedModules=[" util::Math"],
					initialDecls = ["public map[&T \<: num, int] distribution(rel[&U event, &T \<: num bucket] input, &T \<: num bucketSize) {
  										map[&T,int] result = ();
  										for (\<&U event, &T bucket\> \<- input) {
    										result[round(bucket, bucketSize)]?0 += 1;
  										}
 										return result;
									}"]);
	
// https://github.com/cwi-swat/rascal/issues/492
// https://github.com/cwi-swat/rascal/issues/493

// These tests are related to the Exp demo. We will test that separately

// https://github.com/cwi-swat/rascal/issues/494
	
public test bool Issue494() =
	checkModuleOK(|rascal:///demo/lang/Func/Test.rsc|);
	
// https://github.com/cwi-swat/rascal/issues/495

public test bool Issue495() =
	checkModuleOK(|rascal:///demo/lang/Func/Parse.rsc|);

// https://github.com/cwi-swat/rascal/issues/496

public test bool Issue496a(){
	makeModule("M", "import lang::java::m3::AST;");
	return checkModuleOK("true;", importedModules=["M"]);
} 

public test bool Issue496b(){
	makeModule("M", "import lang::java::m3::AST;
					 import analysis::m3::TypeSymbol;");
	return checkOK("true;", importedModules=["M"]);
}

public test bool Issue496c(){
	makeModule("M", "import lang::java::m3::AST;
					 import analysis::m3::TypeSymbol;
					 import Message;");
	return checkOK("true;", importedModules=["M"]);
}

// https://github.com/cwi-swat/rascal/issues/502

public test bool Issue502(){
	makeModule("M", "import Type;
					 lexical Num = \\int: [0-9]+;");
	return checkOK("true;", importedModules=["M"]);
}
	
// https://github.com/cwi-swat/rascal/issues/503

public test bool Issue503(){												
	makeModule("M1", "import M2;
				  	  import ParseTree;");		 
	makeModule("M2", "extend ParseTree;");
	return checkOK("true;", importedModules=["M1", "M2"]);
}

// https://github.com/cwi-swat/rascal/issues/504

public test bool Issue504() =
	redeclaredVariable("true;", initialDecls = ["alias INT = int;", "alias INT = int;"]);
	
	
// https://github.com/cwi-swat/rascal/issues/547

public test bool Issue547(){												
	makeModule("M1", "import M2;");		 
	makeModule("M2", "import Type;
					  public data MuExp = muCallJava( str name, Symbol parameterTypes);");
	return checkOK("true;", importedModules=["M1", "M2"]);
}


// https://github.com/cwi-swat/rascal/issues/549

// An error in the failing example itself, does not lead to a test

// https://github.com/cwi-swat/rascal/issues/550

public test bool Issue550(){												
	makeModule("M1", "import lang::rascal::\\syntax::Rascal;

						public int tmpVar = -1;  
						
						public str nextTmp(){
						    tmpVar += 1;
						    return \"TMP\<tmpVar\>\";
						}
						
						str getLabel(Label label) =
						  (label is \\default) ? \"\<label.name\>\" : nextTmp();");		 
	makeModule("M2", "import M1;");
	return checkOK("true;", importedModules=["M1", "M2"]);
}

// https://github.com/cwi-swat/rascal/issues/563

public test bool Issue563() = uninitialized("int x; x + 5;");
