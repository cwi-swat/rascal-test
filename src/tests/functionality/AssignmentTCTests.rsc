module tests::functionality::AssignmentTCTests


	
  @expected{UndeclaredVariable}
  // public void testUninit() {
  		public test bool testUninit1() {zzz;return false;}
  //	}
  	
  	@expected{UnexpectedType}
  //	public void assignmentError1() {
  		public test bool AssignmentError1() {int n = 3; n = true;return false;}
  //	}
  
  	@expected{UnexpectedType}
  //	public void assignmentError2() {
  		public test bool AssignmentError2() {{int i = true;}return false;}
  //	}
  	@expected{UnexpectedType}
  //	public void assignmentError3() {
  		public test bool AssignmentError3() {int i = true;return false;}
  //	}
  
  	@expected{UnexpectedType}
  //	public void assignmentError4() {
  		public test bool AssignmentError4() {{int n = 3; n = true;}return false;}
  //	}
  
  
  @expected{UninitializedVariable}
  //	public void integerError1(){
  		public test bool integerError1() {N += 2;return false;}
  //	}
  	
  	@expected{UninitializedVariable}
  //	public void integerError2(){
  		public test bool integerError2() {N -= 2;return false;}
  //	}
  
  	@expected{UninitializedVariable}
  //	public void integerError3(){
  		public test bool integerError3() {N *= 2;return false;}
  //	}
  	
  	@expected{UninitializedVariable}
  // public void integerError4(){
  		public test bool integerError4() {N /= 2;return false;}
  // 	}
  
  	@expected{UnexpectedType}
  //	public void errorList(){
  		public test bool errorList1() {list[int] L = {1,2,3}; L *= [4]; return L==[<1,4>,<2,4>,<3,4>];}
  //	}
  
 @expected{UnexpectedType}
  //	public void errorMap(){
  		public test bool errorMap1() {map[int,list[int]] M = (0:[1,2,3],1:[10,20,30]); M[0] *= [4]; 
  		    return M==(0:[<1,4>,<2,4>,<3,4>],1:[10,20,30]);
  		    }
  		    
 @expected{UnexpectedType}
  //	public void errorSet(){
  		public test bool errorSet1() {set[int] L = {1,2,3}; L *= {4}; return L=={<1,4>,<2,4>,<3,4>};}
  //	}
  
  @expected{UninitializedVariable}
  //	public void annotationError1(){
  	public test bool annotationError1() {	
  	  X @ pos = 1;
  	  return false;
  	  }
  //	}
  	
  @expected{UninitializedVariable}
  	// public void annotationError2(){
  	public test bool annotationError2() {	
  	  F X;
  	  X @ pos += 1;
  	  return false;
  	  }
  	  
  @expected{UninitializedVariable}
  	public test bool uninitializedVariable1() {	
  	  F X;
  	  X @ pos -= 1;
  	  return false;
  	  }
  	  
  @expected{UninitializedVariable}
  	public test bool uninitializedVariable2() {	
  	  F X;
  	  X @ pos *= 1;
  	  return false;
  	  }	
  	  
  @expected{UninitializedVariable}
      public test bool uninitializedVariable3() {	
  	  F X;
  	  X @ pos /= 1;
  	  return false;
  	  }			
  //	}
  