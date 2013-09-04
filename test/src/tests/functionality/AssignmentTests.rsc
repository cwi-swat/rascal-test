module tests::functionality::AssignmentTests

	
@expected{UndeclaredVariable}
// public void testUninit() {
		public test bool q() {zzz;return false;}
//	}
	
	@expected{UnexpectedType}
//	public void assignmentError1() {
		public test bool q() {int n = 3; n = true;return false;}
//	}

	@expected{UnexpectedType}
//	public void assignmentError2() {
		public test bool q() {{int i = true;}return false;}
//	}
	@expected{UnexpectedType}
//	public void assignmentError3() {
		public test bool q() {int i = true;return false;}
//	}

	@expected{UnexpectedType}
//	public void assignmentError4() {
		public test bool q() {{int n = 3; n = true;}return false;}
//	}

	
// @Test public void testSimple() {
		public test bool q() {bool b = true; return b == true;}
		public test bool q() {b = true; return b == true;}
//	}
	
// public void testInteger(){
		public test bool q() {int N = 3; N += 2; return N==5;}
		public test bool q() {int N = 3; N -= 2; return N==1;}
		public test bool q() {int N = 3; N *= 2; return N==6;}
		public test bool q() {int N = 6; N /= 2; return N==3;}
		public test bool q() {int N = 6; N ?= 2; return N==6;}
		public test bool q() {N ?= 2; return N==2;}
//	}
	
	@expected{UninitializedVariable}
//	public void integerError1(){
		public test bool q() {N += 2;return false;}
//	}
	
	@expected{UninitializedVariable}
//	public void integerError2(){
		public test bool q() {N -= 2;return false;}
//	}

	@expected{UninitializedVariable}
//	public void integerError3(){
		public test bool q() {N *= 2;return false;}
//	}
	
	@expected{UninitializedVariable}
// public void integerError4(){
		public test bool q() {N /= 2;return false;}
// 	}
	
//	@Test public void testTuple() {
		public test bool q() {int a = 1; int b = 2; <a, b> = <b, a>; return (a == 2) && (b == 1);}
		public test bool q() {<a, b> = <1, 2>; return (a == 1) && (b == 2);}
		public test bool q() {tuple[str name, int cnt] T = <"abc", 1>; T.name = "def"; return T.name == "def";}
		public test bool q() {tuple[str name, int cnt] T = <"abc", 1>; return T[name = "def"] == <"def", 1>;}
//	}

	
// @Test public void testList1() {
		public test bool q() {list[int] L = []; return L == [];}
		public test bool q() {list[int] L = [0,1,2]; L[1] = 10; return L == [0,10,2];}
		public test bool q() {L = [0,1,2]; L[1] = 10; return L == [0,10,2];}
		public test bool q() {list[list[int]] L = [[0,1],[2,3]]; L[1][0] = 20; return L == [[0,1],[20,3]];}
		public test bool q() {L = [[0,1],[2,3]]; L[1][0] = 20; return  L == [[0,1],[20,3]];}
		
		public test bool q() {list[int] L = [1,2,3]; L += [4]; return  L==[1,2,3,4];}
		public test bool q() {list[int] L = [1,2,3]; L -= [2]; return  L==[1,3];}
		public test bool q() {list[int] L = [1,2,3]; L ?= [4]; return  L==[1,2,3];}
		public test bool q() {                       L ?= [4]; return  L==[4];}
//	}
	
//	@Test public void testList2() {
		public test bool q() {list[list[int]] L = [[1,2,3],[10,20,30]]; L[0] += [4]; return  L==[[1,2,3,4],[10,20,30]];}
		public test bool q() {list[list[int]] L = [[1,2,3],[10,20,30]]; L[0] -= [2]; return  L==[[1,3],[10,20,30]];}
		public test bool q() {list[list[int]] L = [[1,2,3],[10,20,30]]; L[0] ?= [4]; return  L==[[1,2,3],[10,20,30]];}
//	}

	@expected{UnexpectedType}
//	public void errorList(){
		public test bool q() {list[int] L = {1,2,3}; L *= [4]; return L==[<1,4>,<2,4>,<3,4>];}
//	}
	
//	@Test public void testMap1() {
		public test bool q() {map[int,int] M = (); return M == ();}
		public test bool q() {map[int,int] M = (1:10, 2:20);return  M == (1:10, 2:20);}
		
		public test bool q() {map[int,int] M = (1:10, 2:20); M += (3:30); return M==(1:10, 2:20,3:30);}
		public test bool q() {map[int,int] M = (1:10, 2:20); M -= (2:20); return M==(1:10);}
		public test bool q() {map[int,int] M = (1:10, 2:20); M ?= (3:30); return M==(1:10, 2:20);}
		public test bool q() {                               M ?= (3:30); return M==(3:30);}
//	}
	
	@expected{UnexpectedType}
//	public void errorMap(){
		public test bool q() {map[int,list[int]] M = (0:[1,2,3],1:[10,20,30]); M[0] *= [4]; 
		    return M==(0:[<1,4>,<2,4>,<3,4>],1:[10,20,30]);
		    }

//	}
	
//	@Test public void testMap2() {
		public test bool q() {map[int,list[int]] M = (0:[1,2,3],1:[10,20,30]); M[0] += [4]; return M==(0:[1,2,3,4],1:[10,20,30]);}
		public test bool q() {map[int,list[int]] M = (0:[1,2,3],1:[10,20,30]); M[0] -= [2]; return M==(0:[1,3],1:[10,20,30]);}
		public test bool q() {map[int,list[int]] M = (0:[1,2,3],1:[10,20,30]); M[0] ?= [4]; return M==(0:[1,2,3],1:[10,20,30]);}
		public test bool q() {map[int, list[int]] M = (0:[1,2,3],1:[10,20,30]); M[2] ?= [4]; return M==(0:[1,2,3],1:[10,20,30], 2:[4]);}
		
//	}
	
//	@Test public void testSet() {
		public test bool q() {set[int] S = {}; return S == {};}
		public test bool q() {set[int] S = {0,1,2}; return S == {0, 1, 2};}
		
		public test bool q() {set[int] L = {1,2,3}; L += {4}; return  L=={1,2,3,4};}
		public test bool q() {set[int] L = {1,2,3}; L -= {2}; return L=={1,3};}
		public test bool q() {set[int] L = {1,2,3}; L ?= {4}; return L=={1,2,3};}
		public test bool q() {                       L ?= {4}; return L=={4};}
//	}
	
	@expected{UnexpectedType}
//	public void errorSet(){
		public test bool q() {set[int] L = {1,2,3}; L *= {4}; return L=={<1,4>,<2,4>,<3,4>};}
//	}

 data D = listfield(list[int] ints) | intfield(int i);
	
//	@Test public void testADT(){
        public test bool q() {
            D d = listfield([1,2]); 
            d.ints += [3]; 
            return d == listfield([1,2,3]);
            }
 
         public test bool q() {
            D d = listfield([1,2]); 
            d.ints -= [2]; 
            return d == listfield([1]);
            }
          
		public test bool q() {
            D d = intfield(2); 
            d.i += 3;
            if (d != intfield(5)) return false;
            d.i -= 3;
            if (d != intfield(2)) return false;
            d = intfield(5);
            d.i *= 3;
            if (d != intfield(15)) return false;
            d = intfield(6);
            d.i /= 3;
            if (d != intfield(2)) return false;
            return true;
            }
	// }
	
data F = f() | f(int n) | g(int n) | deep(F f);
anno int F @ pos;

//	@Test public void testAnnotations(){
	public test bool q() {	
		F X = f(); X @ pos = 1; 
		if (X @ pos != 1) return false;
	    X = f(); X @ pos = 2; X @ pos += 3; 
	    if ( X @ pos != 5) return false;
		X = f(); X @ pos = 3; X @ pos -= 2; 
		if ( X @ pos != 1) return false;
	     X = f(); X @ pos = 2; X @ pos *= 3; 
		if (X @ pos != 6) return false;
		X = f(); 
		X @ pos = 6; X @ pos /= 3;  
		if (X @ pos != 2) return false;
		X = f(); X @ pos = 6; X @ pos ?= 3;  
		if (X @ pos != 6) return false;
		X = f(); X @ pos ?= 3;  
		if (X @ pos != 3) return false;
		return true;
	}


@expected{UninitializedVariable}
//	public void annotationError1(){
	public test bool q() {	
	  X @ pos = 1;
	  return false;
	  }
//	}
	
@expected{UninitializedVariable}
	// public void annotationError2(){
	public test bool q() {	
	  F X;
	  X @ pos += 1;
	  return false;
	  }
	  
@expected{UninitializedVariable}
	public test bool q() {	
	  F X;
	  X @ pos -= 1;
	  return false;
	  }
	  
@expected{UninitializedVariable}
	public test bool q() {	
	  F X;
	  X @ pos *= 1;
	  return false;
	  }	
	  
@expected{UninitializedVariable}
    public test bool q() {	
	  F X;
	  X @ pos /= 1;
	  return false;
	  }			
//	}
	
// public void assigningClosureToVariableBug877() {
	public test bool q() {	
	    bool() x = bool(){ return true; };
		return x() == true;
		}
// }
	

	
