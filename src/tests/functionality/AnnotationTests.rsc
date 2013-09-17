module tests::functionality::AnnotationTests
/*******************************************************************************
 * Copyright (c) 2009-2011 CWI
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:

 *   * Jurgen J. Vinju - Jurgen.Vinju@cwi.nl - CWI
 *   * Paul Klint - Paul.Klint@cwi.nl - CWI
*******************************************************************************/
   data F = f() | f(int n) | g(int n) | deep(F f);
   anno int F @ pos;
   data AN = an(int n);
	
	@expected{UndeclaredAnnotation}
	public test bool annotationNotAllowed(){
		1 [@an=3]; return false;
	}
	
	@expected{UnsupportedOperation}
	public test bool annotationNotAllowed2(){
		1 @ ann; return false;
	}
	
	@expected{UnsupportedOperation}
	public test bool annotationNotAllowed3(){
		f[@pos=true]; return false;
	}
	
	@expected{UndeclaredAnnotation}
	public test bool annotationNotAllowed4(){
		f() [@wrongpos=true]; return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UndefinedValueError1(){
		F someF; someF @ pos; return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UndefinedValueError2(){
		F someF; someF [@pos=3]; return false;
	}
	
	@expected{UninitializedVariable}
	public test bool UninitializedVariableError(){
		F someF; someF @ pos = 3;
	}
	
//	@Test public test boolannotations(){
		
		public test bool assertTrue()=f() [@pos=1] == f();
		public test bool assertTrue()=f() [@pos=1] @ pos == 1;
		public test bool assertTrue()=f() [@pos=1] [@pos=2] @ pos == 2;
		
		public test bool assertTrue()=f(5) [@pos=1] == f(5);
		public test bool assertTrue()=f(5) [@pos=1] @ pos == 1;
		public test bool assertTrue()=f(5) [@pos=1] [@pos=2] @ pos == 2;
		
		public test bool assertTrue()=deep(f(5) [@pos=1]) == deep(f(5));
		public test bool assertTrue()=f(5) [@pos=1] == f(5) [@pos=2];	
//	}
	
// 	@Test public test bool annotationsInSets(){
		public test bool assertTrue()={f() [@pos=1]} == {f()};
		public test bool assertTrue()={f() [@pos=1], g(2) [@pos=2]} == {f(), g(2)};
		public test bool assertTrue()={f() [@pos=1], g(2)} == {f(), g(2)[@pos=2]};		
		public test bool assertTrue()={deep(f(5) [@pos=1])} == {deep(f(5))};
	
		public test bool assertTrue()={f() [@pos=1]} + {g(2) [@pos=2]} == {f(), g(2)};
	
		public test bool assertTrue()={X = {f() [@pos=1]} + {f() [@pos=2]}; {F elem} := X && (elem@pos == 2 || elem@pos == 1);};
//	}


