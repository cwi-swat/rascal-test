module tests::functionality::ComprehensionTests
import List;
	
//	@Test public void emptySetGeneratorError1(){
		public test bool q()  = { X | int X <- {} } == {};
//	}
	
//	@Test public void emptySetGeneratorError2(){
		public test bool q()  = { X | int X <- [] } == {};
//	}
	
//	@Test public void setComprehension1() {
		
		public test bool q()  = { X | int X <- {1}} == {1};
		public test bool q()  = { X | int X <- [1]} == {1};
		
		public test bool q()  = { X | X <- {1}} == {1};
		public test bool q()  = { X | X <- [1]} == {1};
		
		public test bool q()  = { X | int X <- {1, 2}} == {1,2};
		public test bool q()  = { X | int X <- [1, 2]} == {1,2};
		
		public test bool q()  = { X | X <- {1, 2}} == {1,2};
		public test bool q()  = { X | X <- [1, 2]} == {1,2};
		
		public test bool q()  = { X | int X <- {1, 1, 1}} == {1};
		public test bool q()  = { X | int X <- [1, 1, 1]} == {1};
		
		public test bool q()  = { 1 | int X <- {1,2,3}} == {1};
		public test bool q()  = { 1 | int X <- [1,2,3]} == {1};
		
		public test bool q()  = { 1 | int X <- {1,2,3}, true } == {1};
		public test bool q()  = { 1 | int X <- [1,2,3], true } == {1};
		
		public test bool q()  = { 1 | int X <- {1,2,3}, false} 	== {};
		public test bool q()  = { 1 | int X <- [1,2,3], false} 	== {};
		
		public test bool q()  = { X | int X <- {1,2,3}} == {1,2,3};
		public test bool q()  = { X | int X <- [1,2,3]} == {1,2,3};
		
		public test bool q()  = {  X | int X <- {1,2,3}, true} == {1,2,3};
		public test bool q()  = {  X | int X <- [1,2,3], true} == {1,2,3};
		
		public test bool q()  = {  X | int X <- {1,2,3}, false} 	== {};
		public test bool q()  = {  X | int X <- [1,2,3], false} 	== {};
		
		public test bool q()  = {  X | int X <- {1,2,3}, X >= 2, X < 3} == {2};
		public test bool q()  = {  X | int X <- [1,2,3], X >= 2, X < 3} == {2};
		
		public test bool q()  = {  X, 10*X | int X <- [1,2,3]} == {1,2,3,10,20,30};
		public test bool q()  = {  X, 10*X, 100*X | int X <- [1,2,3]} == {1,2,3,10,20,30, 100,200,300};
//	}
	
//	@Test public void setComprehension2() {	
		
		public test bool q()  = {  {} | int X <- {1,2,3}} == {{}};
		public test bool q()  = {  {} | int X <- [1,2,3]} == {{}};
		
		public test bool q()  = {  {} | int X <- {1,2,3}, true} == {{}};
		public test bool q()  = {  {} | int X <- [1,2,3], true} == {{}};
		
		public test bool q()  = {  {} | int X <- {1,2,3}, false} == {};
		public test bool q()  = {  {} | int X <- [1,2,3], false} == {};
		
		public test bool q()  = { <1,2,3> | int X <- {1,2,3}} 	== {<1,2,3>};
		public test bool q()  = { <1,2,3> | int X <- [1,2,3]} 	== {<1,2,3>};
		
		public test bool q()  = { <1,2,3> | int X <- {1,2,3}, true} 	== {<1,2,3>};
		public test bool q()  = { <1,2,3> | int X <- [1,2,3], true} 	== {<1,2,3>};
		
		public test bool q()  = { <1,2,3> | int X <- {1,2,3}, true, true} == {<1,2,3>};
		public test bool q()  = { <1,2,3> | int X <- [1,2,3], true, true} == {<1,2,3>};
		
		public test bool q()  = { <1,2,3> | int X <- {1,2,3}, false}	== {} ;
		public test bool q()  = { <1,2,3> | int X <- [1,2,3], false}	== {} ;
		
		public test bool q()  = { Y | list[int] Y <- [[1,2,3],[10,20,30],[100,200,300]] } == { [1,2,3],[10,20,30],[100,200,300]};
		public test bool q()  = {1 | 3 > 2} == {1} ;
		public test bool q()  = {1 | 2 > 3} == {} ;
//	}
	

	
@expected{UnexpectedType}
//	public void testGen1() {
		public test bool q() {{x | 5};return false;}
//	}
	
@expected{UnexpectedType}
//	public void testVoidFunctionPredicate() {
		public test bool q() { void f() { } { x | int x <- {1,2,3}, f() };return false;}
//	}

@expected{UndeclaredVariable}
//	public void testUndefinedValue() {
		public test bool q() {{ y | int x <- {1,2,3}};return false;}
//	}
	
@expected{UnexpectedType}
//	public void WrongStrategyError1(){
//		public bool q() {innermost int X <- {1,2,3};return false;}
//	}
//	
@expected{UnexpectedType}
//	public void WrongStrategyError2(){
//		public bool q() {outermost int X <- {1,2,3};return false;}
//	}
//	
@expected{UnexpectedType}
//	public void WrongStrategyError3(){
//		public bool q() {bottom-up-break int X <- {1,2,3};return false;}
//	}
//	
//	@expected{UnexpectedType}
//	public void WrongStrategyError4(){
//		public bool q() {top-down-break int X <- {1,2,3};return false;}
//	}


@expected{UnexpectedType}
//	public void WrongListType(){
		public test bool q() {str S <- [1,2,3];return false;}
//	}
	
@expected{UnexpectedType}
//	public void WrongSetType(){
		public test bool q() {str S <- {1,2,3};return false;}
//	}
	
@expected{UnexpectedType}
//	public void WrongMapType(){
		public test bool q() {str S <- (1:10,2:20);return false;}
//	}
	
@expected{NotEnumerable}
//	public void WrongStringType(){
		public test bool q() = int N <- "abc";
//	}
/*
//	@expected{UnexpectedType}
	public void WrongADTType(){
		prepare("data Bool = btrue() | bfalse() | band(Bool lhs, Bool rhs) | bor(Bool lhs, Bool rhs);");
		public bool q() {int N <- [true, true, false];return false;}
//	}
*/
	
//	@Test public void any()  {
		
		public test bool q()  = any(int X <- {1,2,3}, X > 2);
		public test bool q()  = any(    X <- {1,2,3}, X > 2);
		public test bool q()  = any(int X <- {1,2,3}, X > 2, X <10);
		public test bool q()  = any(int X <- {1,2,3}, X > 2 && X <10);
		public test bool q()  = any(    X <- {1,2,3}, X > 2 && X <10);
		
		public test bool q()  = any(int X <- [1,2,3], X > 2);
		public test bool q()  = any(int X <- [1,2,3], X > 2, X < 10);
		public test bool q()  = any(int X <- [1,2,3], X > 2 && X < 10);
		
		public test bool q()  = !(any(int X <- {1,2,3}, X > 10));
		public test bool q()  = !(any(int X <- [1,2,3], X > 10));
		
		public test bool q()  = any(<int X, int Y> <- {<1,10>,<30,3>,<2,20>}, X > Y);
		public test bool q()  = any(<int X, int Y> <- [<1,10>,<30,3>,<2,20>], X > Y);
		
		public test bool q()  = !(any(<int X, int Y> <- {<1,10>,<30,3>,<2,20>}, X > 100*Y));
		public test bool q()  = !(any(<int X, int Y> <- [<1,10>,<30,3>,<2,20>], X > 100*Y));
		
		public test bool q()  = !(any(_ <- []));
		public test bool q()  = !(any(_ <- {}));
		public test bool q()  = !(any(_ <- ()));
//	}
	

	@expected{UnexpectedType}
	// public void anyError() {
		public test bool q() {any(x <- [1,2,3], "abc");return false;}
	// }
	
//	@Test  public void all() {
		
		public test bool q()  = all(int X <- {1,2,3}, X >= 1);
		public test bool q()  = all(int X <- {1,2,3}, X >= 1, X < 10);
		public test bool q()  = all(int X <- {1,2,3}, X >= 1 && X < 10);
		public test bool q()  = all(int X <- [1,2,3], X >= 1);
		public test bool q()  = all(int X <- {1,2,3}, X >= 1, X < 10);
		public test bool q()  = all(int X <- {1,2,3}, X >= 1 && X < 10);
		
		public test bool q()  = !(all(int X <- {1,2,3}, X >= 2));
		public test bool q()  = !(all(int X <- {1,2,3}, X >= 2, X <=2));
		public test bool q()  = !(all(int X <- {1,2,3}, X >= 2 && X <=2));
		public test bool q()  = !(all(int X <- [1,2,3], X >= 2));
		public test bool q()  = !(all(int X <- [1,2,3], X >= 2, X <= 2));
		public test bool q()  = !(all(int X <- [1,2,3], X >= 2 && X <= 2));
		
		public test bool q()  = all(<int X, int Y> <- {<1,10>,<3,30>,<2,20>}, X < Y);
		public test bool q()  = all(<int X, int Y> <- [<1,10>,<3,30>,<2,20>], X < Y);
		
		public test bool q()  = !(all(<int X, int Y> <- {<1,10>,<30,3>,<2,20>}, X < Y));
		public test bool q()  = !(all(<int X, int Y> <- [<1,10>,<30,3>,<2,20>], X < Y));
		
		public test bool q()  = all(int i <- [0, 1] && [0, 1][i] == i);
		
		// The following were all asserTrue, how can this have worked?
		
		public test bool q()  = !(all(_ <- []));
		public test bool q()  = !(all(_ <- {}));
		public test bool q()  = !(all(_ <- ()));
		// This must be a bug
		// public test bool q()  = all(i <- [1,2,3], (i % 2 == 0 || i % 2 == 1));
		public test bool q()  = all(i <- [1,2,3], (i % 2 == 0 || i % 2 == 1)?true:false);
//	}
	

	@expected{UndeclaredVariable}
//	public void noLeaking() {
		public test bool q()  {{ X | int X <- [1,2,3] }; X == 3; }
//	}
	
	@expected{UnexpectedType}
//	public void allError() {
		public test bool q()  {all(x <- [1,2,3], "abc");}
//	}

//	@Test public void setComprehension3() {	
		
		public test bool q()  = {X + 1 | int X <- {1,2,3}} == {2,3,4};
		public test bool q()  = {X + 1 | int X <- [1,2,3]} == {2,3,4};
		
		public test bool q()  = {X | int X <- {1,2,3}, X + 1 < 3} == {1};
		public test bool q()  = {X | int X <- [1,2,3], X + 1 < 3} == {1};
		
		public test bool q()  = {X - 1 | int X <- {1,2,3}} == {0,1,2};
		public test bool q()  = {X - 1 | int X <- [1,2,3]} == {0,1,2};
		
		public test bool q()  = {X | int X <- {1,2,3}, X - 1 < 3} == {1,2,3};
		public test bool q()  = {X | int X <- [1,2,3], X - 1 < 3} == {1,2,3};
		
		public test bool q()  = {X * 2 | int X <- {1,2,3}} == {2,4,6};
		public test bool q()  = {X * 2 | int X <- [1,2,3]} == {2,4,6};
		
		
		public test bool q()  = {*[X * 2] | int X <- {1,2,3}} == {2,4,6};
		public test bool q()  = {*[X * 2, X * 2 + 1] | int X <- {1,2,3}} == {2,3,4,5,6,7};
//	}

set[int] fset(int n) { return {n, 3*n}; }	
//	@Test public void setComprehension4(){
		
		public test bool q() = {fset(n) | n <- [ 1 .. 4 ]} == {{1,3},{2,6},{3,9}};
		public test bool q() = {*fset(n) | n <- [ 1 .. 4 ]} == {1,3,2,6,3,9};
		
		public test bool q() = {{n, 3*n} | n <- [ 1 .. 4 ]} == {{1,3},{2,6},{3,9}};
		public test bool q() = {*{n, 3*n} | n <- [ 1 .. 4 ]} == {1,3,2,6,3,9};
		public test bool q() = {n, 3*n | n <- [ 1 .. 4 ]} == {1,3,2,6,3,9};
	
		public test bool q() = {{5*n, fset(n)} | n <- [ 1 .. 4 ]} == {{5,{1,3}},{10,{2,6}},{15,{3,9}}};
		public test bool q() = {{5*n, *fset(n)} | n <- [ 1 .. 4 ]} == {{5,1,3},{10,2,6},{15,3,9}};
		public test bool q() = {5*n, fset(n) | n <- [ 1 .. 4 ]} == {5,{1,3},10,{2,6},15,{3,9}};
		public test bool q() = {5*n, *fset(n) | n <- [ 1 .. 4 ]} == {5,1,3,10,2,6,15,3,9};
		
		public test bool q() = {{5*n, fset(n)} | n <- [ 1 .. 4 ]} == {{5,{1,3}},{10,{2,6}},{15,{3,9}}};
		public test bool q() = {{5*n, *fset(n)} | n <- [ 1 .. 4 ]} == {{5,1,3},{10,2,6},{15,3,9}};
		public test bool q() = {5*n, fset(n) | n <- [ 1 .. 4 ]} == {5,{1,3},10,{2,6},15,{3,9}};
		public test bool q() = {5*n, *fset(n) | n <- [ 1 .. 4 ]} == {5,1,3,10,2,6,15,3,9};
//	}
	
//	@Test public void setComprehensionNested() {
		public test bool q()  = { {X + y | int y <- [1..X+1]} | int X <- {1,2,3}} == {{2}, {3,4}, {4,5,6}};
		public test bool q()  = { *{X + y | int y <- [1..X+1]} | int X <- {1,2,3}} == {2, 3, 4, 5, 6};
		public test bool q()  = { {X + y | int y <- [1..X+1], X < 2} | int X <- [1,2,3]} == {{2}, {}};
		public test bool q()  = { *{X + y | int y <- [1..X+1], X < 2} | int X <- [1,2,3]} == {2};
		public test bool q()  = { {X + y | int y <- [1..X+1], X > 2} | int X <- [1,2,3]} == {{}, {4,5,6}};
		public test bool q()  = { *{X + y | int y <- [1..X+1], X > 2} | int X <- [1,2,3]} == {4, 5, 6};
//	}
	
//	@Test public void emptySetGeneratorError(){
		public test bool q()  = [ X | int X <- {} ] == [];
//	}
	
//	@Test public void emptyListGeneratorError1(){
		public test bool q()  = [ X | int X <- [] ] == [];
//	}
	
//	@Test public void emptyListGeneratorError2(){
		public test bool q()  = [ X |     X <- [] ] == [];
//	}
	
//	@Test public void listComprehension1()  {
		
		public test bool q()  = [ X | int X <- {1}] == [1];
		public test bool q()  = [ X | int X <- [1]] == [1];
		public test bool q()  = [ X |     X <- [1]] == [1];
		
		public test bool q()  = {L = [ X | int X <- {1, 2}]; (L == [1,2]) || (L == [2, 1]);};
		public test bool q()  = [ X | int X <- [1, 2]] == [1,2];
		public test bool q()  = [ X |     X <- [1, 2]] == [1,2];
		
		public test bool q()  = [ X | int X <- {1, 1, 1}] == [1];
		public test bool q()  = [ X | int X <- [1, 1, 1]] == [1, 1, 1];
		
		public test bool q()  = [ 1 | int X <- {1,2,3}] == [1, 1, 1];
		public test bool q()  = [ 1 | int X <- [1,2,3]] == [1, 1, 1];
		
		public test bool q()  = [ 1 | int X <- {1,2,3}, true ] == [1, 1, 1];
		public test bool q()  = [ 1 | int X <- [1,2,3], true ] == [1, 1, 1];
		
		public test bool q()  = [ 1 | int X <- {1,2,3}, false] 	== [];
		public test bool q()  = [ 1 | int X <- [1,2,3], false] 	== [];
		
		public test bool q()  = {L = [ X | int X <- {1,2}]; (L == [1,2]) || (L == [2, 1]);};
		public test bool q()  = [ X | int X <- [1,2,3]] == [1,2,3];
		
		public test bool q()  = {L = [  X | int X <- {1,2}, true]; (L == [1,2]) || (L == [2, 1]);};
		public test bool q()  = [  X | int X <- [1,2,3], true] == [1,2,3];
		
		public test bool q()  = [  X | int X <- {1,2,3}, false] == [];
		public test bool q()  = [  X | int X <- [1,2,3], false] == [];
		
		public test bool q()  = [  X | int X <- {1,2,3}, X >= 2, X < 3] == [2];
		public test bool q()  = [  X | int X <- [1,2,3], X >= 2, X < 3] == [2];
		
		public test bool q()  = [  X, 10*X | int X <- [1,2,3]] == [1,10,2,20,3,30];
		public test bool q()  = [  X, 10*X, 100*X | int X <- [1,2,3]] == [1,10,100,2,20,200,3,30,300];
//	}
	
//	@Test public void listComprehension2() {
		
		public test bool q()  = [  [] | int X <- {1,2,3}] == [[], [], []];
		public test bool q()  = [  [] | int X <- [1,2,3]] == [[], [], []];
		
		public test bool q()  = [  [] | int X <- {1,2,3}, true] == [[], [], []];
		public test bool q()  = [  [] | int X <- [1,2,3], true] == [[], [], []];
		
		public test bool q()  = [  [] | int X <- {1,2,3}, false] == [];
		public test bool q()  = [  [] | int X <- [1,2,3], false] == [];
		
		public test bool q()  = [ <1,2,3> | int X <- {1,2,3}] == [<1,2,3>, <1,2,3>, <1,2,3>];
		public test bool q()  = [ <1,2,3> | int X <- [1,2,3]] == [<1,2,3>, <1,2,3>, <1,2,3>];
		
		public test bool q()  = [ <1,2,3> | int X <- {1,2,3}, true] == [<1,2,3>, <1,2,3>, <1,2,3>];
		public test bool q()  = [ <1,2,3> | int X <- [1,2,3], true] == [<1,2,3>, <1,2,3>, <1,2,3>];
		
		public test bool q()  = [ <1,2,3> | int X <- {1,2,3}, true, true] == [<1,2,3>, <1,2,3>, <1,2,3>];
		public test bool q()  = [ <1,2,3> | int X <- [1,2,3], true, true] == [<1,2,3>, <1,2,3>, <1,2,3>];
		
		public test bool q()  = [ <1,2,3> | int X <- {1,2,3}, false]	== [] ;
		public test bool q()  = [ <1,2,3> | int X <- [1,2,3], false]	== [] ;
//	}
	
//	@Test public void listComprehension3()  {
		
		public test bool q()  = [ [Y] | list[int] Y <- [[1,2,3],[10,20,30],[100,200,300]] ] == [ [[1,2,3]], [[10,20,30]],[[100,200,300]]];
		public test bool q()  = [ Y | list[int] Y <- [[1,2,3],[10,20,30],[100,200,300]] ] == [ [1,2,3], [10,20,30],[100,200,300]];
		public test bool q()  = [ *Y | list[int] Y <- [[1,2,3],[10,20,30],[100,200,300]] ] == [ 1,2,3, 10,20,30,100,200,300];
		
		public test bool q()  = [1 | 3 > 2] == [1] ;
		public test bool q()  = [1 | 2 > 3] == [] ;
		
		public test bool q()  = {L = [X + 1 | int X <- {1,2}]; (L == [2,3]) || (L == [3,2]);};
		public test bool q()  = [X + 1 | int X <- [1,2,3]] == [2,3,4];
		
		public test bool q()  = [X | int X <- {1,2,3}, X + 1 < 3] == [1];
		public test bool q()  = [X | int X <- [1,2,3], X + 1 < 3] == [1];
		
		public test bool q()  = {L = [X - 1 | int X <- {1,2}]; (L == [0,1]) || (L == [1,0]);};
		public test bool q()  = [X - 1 | int X <- [1,2,3]] == [0,1,2];
		
		public test bool q()  = {L = [X | int X <- {2,3}, X - 1 < 3]; (L == [2,3]) || (L == [3,2]);};
		public test bool q()  = [X | int X <- [1,2,3], X - 1 < 3] == [1,2,3];
		
		public test bool q()  = { L = [X * 2 | int X <- {2,3}]; (L == [4,6]) || (L == [6,4]);};
		public test bool q()  = [X * 2 | int X <- [1,2,3]] == [2,4,6];
		
		public test bool q()  = [*{X * 2} | int X <- [1,2,3]] == [2,4,6];
		
		public test bool q() = toSet([*{X * 2, X * 2 + 1} | int X <- [1,2,3]]) == {2,3,4,5, 6, 7};
//	}

list[int] flist(int n) { return [n, 3*n];}	
//	@Test public void listComprehension4(){
		public test bool q() = [flist(n) | n <- [ 1 .. 4 ]] == [[1,3],[2,6],[3,9]];
		public test bool q() = [*flist(n) | n <- [ 1 .. 4 ]] == [1,3,2,6,3,9];

		public test bool q() = [[n, 3*n] | n <- [ 1 .. 4 ]] == [[1,3],[2,6],[3,9]];
		
		public test bool q() = [5*n, flist(n) | n <- [ 1 .. 4 ]] == [5,[1,3],10,[2,6],15,[3,9]];
		public test bool q() = [5*n, *flist(n) | n <- [ 1 .. 4 ]] == [5,1,3,10,2,6,15,3,9];
		
		public test bool q() = [[5*n, flist(n)] | n <- [ 1 .. 4 ]] == [[5,[1,3]],[10,[2,6]],[15,[3,9]]];
		public test bool q() = [[5*n, *flist(n)] | n <- [ 1 .. 4 ]] == [[5,1,3],[10,2,6],[15,3,9]];
// 	}
//	@Test public void listComprehensionNested() {
		public test bool q()  = [  [y | int y <- [0..X+1]] | int X <- [1,2,3]] == [[0,1], [0,1,2], [0,1,2,3]];
		public test bool q()  = [ *[y | int y <- [0..X+1]] | int X <- [1,2,3]] == [0,1, 0,1,2, 0,1,2,3];
		public test bool q()  = [ [y | int y <- [0..X+1], X < 2] | int X <- [1,2,3]] == [[0,1], [], []];
		public test bool q()  = [ *[y | int y <- [0..X+1], X < 2] | int X <- [1,2,3]] == [0,1];
		public test bool q()  = [ [y | int y <- [0..X+1], X > 2] | int X <- [1,2,3]] == [[], [], [0,1,2,3]];
		public test bool q()  = [ *[y | int y <- [0..X+1], X > 2] | int X <- [1,2,3]] == [0,1,2,3];
		
//	}
	
//	@Test public void emptyTupleGeneratorError1(){
		public test bool q()  = {<X,Y> | <int X, int Y> <- {}} == {} ;
//	}
	
//	@Test public void emptyTupleGeneratorError2(){
		public test bool q()  = {<X,Y> | <int X, int Y> <- []} == {} ;
//	}
	
//	@Test public void emptyTupleGeneratorError3(){
		public test bool q()  = {<X,Y> | int X <- {}, int Y <- {}} == {};
//	}
	
//	@Test public void emptyTupleGeneratorError4(){
		public test bool q()  = {<X,Y> | int X <- [], int Y <- []} == {};
//	}
	
//	@Test public void relationComprehension() {	
		
		public test bool q()  = {<X,Y> | int X <- {1}, int Y <- {2}} == {<1,2>};
		public test bool q()  = {<X,Y> | int X <- [1,1,1], int Y <- [2,2,2]} == {<1,2>};
		
		public test bool q()  = {<1,2> | int X <- {1,2,3}} == {<1,2>};
		public test bool q()  = {<1,2> | int X <- [1,2,3]} == {<1,2>};
		
		public test bool q()  = {<X,Y> | int X <- {1,2,3}, int Y <- {2,3,4}} ==  {<1, 2>, <1, 3>, <1, 4>, <2, 2>, <2, 3>, <2, 4>, <3, 2>, <3, 3>, <3, 4>};
		public test bool q()  = {<X,Y> | int X <- [1,2,3], int Y <- [2,3,4]} ==  {<1, 2>, <1, 3>, <1, 4>, <2, 2>, <2, 3>, <2, 4>, <3, 2>, <3, 3>, <3, 4>};
		
		public test bool q()  = {<X,Y> | int X <- {1,2,3}, int Y <- {2,3,4}, true} ==	{<1, 2>, <1, 3>, <1, 4>, <2, 2>, <2, 3>, <2, 4>, <3, 2>, <3, 3>, <3, 4>};
		public test bool q()  = {<X,Y> | int X <- [1,2,3], int Y <- [2,3,4], true} ==	{<1, 2>, <1, 3>, <1, 4>, <2, 2>, <2, 3>, <2, 4>, <3, 2>, <3, 3>, <3, 4>};
		
		
		public test bool q()  = {<X,Y> | int X <- {1,2,3}, int Y <- {2,3,4}, false} == {};
		public test bool q()  = {<X,Y> | int X <- [1,2,3], int Y <- [2,3,4], false} == {};
		
		public test bool q()  = {<X,Y> | int X <- {1,2,3}, int Y <- {2,3,4}, X >= Y} =={<2, 2>, <3, 2>, <3, 3>};
		public test bool q()  = {<X,Y> | int X <- [1,2,3], int Y <- [2,3,4], X >= Y} =={<2, 2>, <3, 2>, <3, 3>};
		
		public test bool q()  = {<X,Y> | int X <- {1,2,3}, <X, int Y> <- {<1,10>, <7,70>, <3,30>,<5,50>}} == {<1, 10>, <3, 30>};
		public test bool q()  = {<X,Y> | int X <- [1,2,3], <X, int Y> <- [<1,10>, <7,70>, <3,30>,<5,50>]} == {<1, 10>, <3, 30>};
		
		public test bool q()  = {<X,Y> | int X <- {1,2,3}, <X, str Y> <- {<1,"a">, <7,"b">, <3,"c">,<5,"d">}} == {<1, "a">, <3, "c">};
		public test bool q()  = {<X,Y> | int X <- [1,2,3], <X, str Y> <- [<1,"a">, <7,"b">, <3,"c">,<5,"d">]} == {<1, "a">, <3, "c">};
		
//		}

//	@Test public void emptyMapGeneratorError1(){
		public test bool q()  = ( X : 2 * X | int X <- {} ) == ();
//	}

//	@Test public void emptyMapGeneratorError2(){
		public test bool q()  = ( X : 2 * X | int X <- [] ) == ();
//	}
	
//	@Test public void mapComprehension()  {
		
		public test bool q()  = ( X : 2 * X | int X <- {1}) == (1:2);
		public test bool q()  = ( X : 2 * X | int X <- [1]) == (1:2);
		
		public test bool q()  = ( X : 2 * X | int X <- {1, 2}) == (1:2,2:4);
		public test bool q()  = ( X : 2 * X | int X <- [1, 2]) == (1:2,2:4);
		
		public test bool q()  = ( X: 2 * X| int X<- [1,2,3] ) == (1:2,2:4,3:6);
//	}
	
//	@Test public void mapComprehensionNested() {
		public test bool q()  = ( X: (2 * X + y : y | int y <- [1..X+1]) | int X <- [1,2,3] ) == (1:(3:1),2:(5:1,6:2),3:(7:1,8:2,9:3));
		public test bool q()  = ( X: (2 * X + y : y | int y <- [1..X+1], X < 2) | int X <- [1,2,3] ) == (1:(3:1), 2:(), 3:());
		public test bool q()  = ( X: (2 * X + y : y | int y <- [1..X+1], X > 2) | int X <- [1,2,3] ) == (1:(),2:(),3:(7:1,8:2,9:3));
//	}

data TREE = i(int N) | f(TREE a,TREE b) | g(TREE a, TREE b);	
//	@Test public void nodeGenerator()  {
		
		public test bool q() = [ X | /int X <- f(i(1),g(i(2),i(3))) ] == [1,2,3];
		
		public test bool q() = [ X | /value X <- f(i(1),g(i(2),i(3))) ] == [1,i(1),2,i(2),3,i(3),g(i(2),i(3))];
		public test bool q() = [ X | value X <- f(i(1),g(i(2),i(3))) ] == [i(1),g(i(2),i(3))];

		public test bool q() = [N | /value N <- f(i(1),i(2))] == [1,i(1),2,i(2)];
		public test bool q() = [N | value N <- f(i(1),i(2))] == [i(1), i(2)];
		
		public test bool q() = [N | /TREE N <- f(i(1),i(2))] == [i(1),i(2)];
		public test bool q() = [N | TREE N <- f(i(1),i(2))] == [i(1),i(2)];
		
		public test bool q() = [N | /int N <- f(i(1),i(2))] == [1,2];
		
		public test bool q() = [N | /value N <- f(i(1),g(i(2),i(3)))] == [1,i(1),2,i(2),3,i(3),g(i(2),i(3))];
		public test bool q() = [N | value N <- f(i(1),g(i(2),i(3)))] == [i(1),g(i(2),i(3))];
		
		public test bool q() = [N | /TREE N <- f(i(1),g(i(2),i(3)))] == [i(1),i(2),i(3),g(i(2),i(3))];
		public test bool q() = [N | TREE N <- f(i(1),g(i(2),i(3)))] == [i(1),g(i(2),i(3))];
		
		public test bool q() = [N | /int N <- f(i(1),g(i(2),i(3)))] == [1,2,3];
//	}
	
//	@expected{UnexpectedType}
//	public void nodeGeneratorTypeError(){
//		prepare("data TREE = i(int N) | f(TREE a,TREE b) | g(TREE a, TREE b);");
//		public test bool q() = [N | int N <- f(i(1),g(i(2),i(3)))] == [];
//	}
	
//	@Test public void regularGenerators() {
		
		public test bool q()  = [S | /@<S:[a-z]+>@/ <- ["@abc@", "@def@"]] == ["abc","def"];
		public test bool q()  = {S | /@<S:[a-z]+>@/ <- ["@abc@", "@def@"]} == {"abc", "def"};
		public test bool q()  = {S | /@<S:[a-z]+>@/ <- {"@abc@", "@def@"}} == {"abc", "def"};
//	}

@expected{UndeclaredVariable}
//	public void NoLeakFromNextGenerator1(){
		public test bool q()  = [<N,M> | int N <- [1 .. 3], ((N==1) ? true : M > 0), int M <- [10 .. 12]] == [<1,10>,<1,11>,<2,10><2,11>];
//	}
	
@expected{UndeclaredVariable}
//	public void NoLeakFromNextGenerator2(){
		public test bool q()  = [<N,M> | int N <- [1 .. 3], ((N==1) ? true : M > 0), int M := N] == [<1,1>,<2,2>];
//	}

