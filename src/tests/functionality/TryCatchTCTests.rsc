module tests::functionality::TryCatchTCTests

@expected{UndeclaredAnnotation}
public test bool noSuchAnnotationException1() = functionA();

@expected{UnsupportedSubscriptArity}
public test bool assertTrue1()=functionB();

@expected{UndeclaredVariable}
public test bool undefinedValueException1()=functionC();
  	
@expected{UninitializedVariable}
public test bool uninitializedvariableException1()=functionD();
  	
@expected{UninitializedVariable}
public test bool assertTrue2()=functionE();
  	
@expected{UndeclaredVariable}
public test bool assertTrue3()=ffunctionZ();
  
@expected{UnexpectedType}
public test bool doWhileError1() {do {n = 4;} while(3); return false;}
 	
@expected{UnexpectedType}
public test bool whileError1() {while(3){n = 4;};return false;}