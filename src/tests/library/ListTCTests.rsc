module tests::library::ListTCTests

import Exception;
import List;
  
  @expected{IllegalArgument}
          public test bool sortWithCompare4() {sort([1, 2, 3], bool(int a, int b){return a <= b;}); return false ;}
          
  @expected{IllegalArgument}
          public test bool sortWithCompare5() {sort([1, 0, 1], bool(int a, int b){return a <= b;});  return false;}
          
          // @expected{UnexpectedType}
  // listExpressions1
  //		public test bool assertTrue(){ value n = 1; list[int] l = [ *[n, n] ];}
  //
  	
  // @expected{UnexpectedType}
  // listExpressions2 
  //		public test bool assertTrue() {value n = 1; list[int] l = [ 1, *[n, n], 2 ];}
  //	
 