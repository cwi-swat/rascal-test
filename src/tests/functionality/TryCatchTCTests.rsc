module tests::functionality::TryCatchTCTests

  		
  bool functionA() {
              NODEA l = fA(3);
  		    l@pos;
  		    return false;
  		}
 
  		
  bool functionB() { 
  		  try { 
  		      [1,2,3][1,2]; 
  		  } catch SubscriptException(str e): 
  		      return true; 
  		  return false; 
  		}
  		
  bool functionC() { 
  		      X+3; 
  		      return false; 
  		}
  		
  bool functionD() { 
  		      X[2] = 3; 
  		      return false; 
  		}
  		
  bool functionE() { 
  		  try { 
  		      X[2] = 3; 
  		  } catch StrangeException e: 
  		      return true; 
  		  return false; 
  		}
  		
  bool functionZ() { 
  		  try { 
  		      X[2] = 3; 
  		  } catch StrangeException (str e): 
  		      return true; 
  		  return false; 
  		}
  		
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