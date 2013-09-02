module tests::ListTests

import List;
	
// delete		
		public test bool q() = delete([0,1,2], 0) == [1,2];
		public test bool q() = delete([0,1,2], 1) == [0,2];
		public test bool q() = delete([0,1,2], 2) == [0,1];

// domain
		public test bool q() = domain([]) == {};
		public test bool q()  = domain([1]) == {0};
		public test bool q() = domain([1, 2]) == {0, 1};
	
// getOneFrom
		public test bool q() {int N = List::getOneFrom([1]); return N == 1;}
		public test bool q() {int N = getOneFrom([1]); return N == 1;}
		public test bool q() {int N = List::getOneFrom([1,2]); return  (N == 1) || (N == 2);}
		public test bool q() {int N = List::getOneFrom([1,2,3]); return  (N == 1) || (N == 2) || (N == 3);}
		public test bool q() {real D = List::getOneFrom([1.0,2.0]); return  (D == 1.0) || (D == 2.0);}
		public test bool q() {str S = List::getOneFrom(["abc","def"]); return  (S == "abc") || (S == "def");}

// getOneFromError
@expected{EmptyList}
	public test bool q() {
		getOneFrom([]);
		return false;
	}

// head
		public test bool q() = List::head([1]) == 1;
		public test bool q() = head([1]) == 1;
		public test bool q() = List::head([1, 2]) == 1;

		public test bool q() = head([1, 2, 3, 4], 0) == [];
		public test bool q() = head([1, 2, 3, 4], 1) == [1];
		public test bool q() = head([1, 2, 3, 4], 2) == [1,2];
		public test bool q() = head([1, 2, 3, 4], 3) == [1,2,3];
		public test bool q() = head([1, 2, 3, 4], 4) == [1,2,3,4];
	

@expected{EmptyList}
	public test bool q() {
		head([]);
		return false;
		}
	
@expected{IndexOutOfBounds}
	public test bool q() {
		head([], 3);
		return false;
		}	
		
@expected{IndexOutOfBounds}
	public test bool q() {
		head([1,2,3], 4);
		return false;
		}

		
// insertAt
		public test bool q() =List::insertAt([], 0, 1) == [1];
		public test bool q() =insertAt([], 0, 1) == [1];
		public test bool q() =List::insertAt([2,3], 1, 1) == [2,1, 3];
		public test bool q() =insertAt([2,3], 1, 1) == [2, 1, 3];
		public test bool q() =List::insertAt([2,3], 2, 1) == [2,3,1];
		public test bool q() =insertAt([2,3], 2, 1) == [2, 3, 1];
	
	

@expected{IndexOutOfBounds}
	   public test bool q() {insertAt([1,2,3], 4, 5); return false;}
	
// isEmpty
	   public test bool q()  =isEmpty([]);
	   public test bool q()  =isEmpty([1,2]) == false;
	

// mapper 
	   public test bool q() {int inc(int n) {return n + 1;} return mapper([1, 2, 3], inc) == [2, 3, 4];}
	

// max
	   public test bool q() = List::max([1, 2, 3, 2, 1]) == 3;
	   public test bool q() = max([1, 2, 3, 2, 1]) == 3;
	
// min
		public test bool q() = List::min([1, 2, 3, 2, 1]) == 1;
		public test bool q() = min([1, 2, 3, 2, 1]) == 1;
		
// permutations

		public test bool q()  =permutations([]) == {[]};
		public test bool q()  =permutations([1]) == {[1]};
		public test bool q()  =permutations([1,2]) == {[1,2],[2,1]};
		public test bool q()  =permutations([1,2,3]) ==  {[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]};

// distribution

		public test bool q()  =distribution([]) == ();
		public test bool q()  =distribution([1]) == (1:1);
		public test bool q()  =distribution([1,2]) == (1:1, 2:1);
		public test bool q()  =distribution([1,2, 2]) == (1:1, 2:2);
	

	
// reducer
		public test bool q() {
		     int add(int x, int y){return x + y;};
		     return reducer([1, 2, 3, 4], add, 0) == 10;
		}
	
// reverse 
		public test bool q() = List::reverse([]) == [];
		public test bool q() = reverse([]) == [];
		public test bool q() = List::reverse([1]) == [1];
		public test bool q() = List::reverse([1,2,3]) == [3,2,1];

	
// size
		public test bool q() = List::size([]) == 0;
		public test bool q() = size([]) == 0;
		public test bool q() = List::size([1]) == 1;
		public test bool q() = List::size([1,2,3]) == 3;
	
// slice
		public test bool q() = slice([1,2,3,4], 0, 0) == [];
		public test bool q() = slice([1,2,3,4], 0, 1) == [1];
		public test bool q() = slice([1,2,3,4], 0, 2) == [1,2];
		public test bool q() = slice([1,2,3,4], 0, 3) == [1,2,3];
		public test bool q()  =slice([1,2,3,4], 0, 4) == [1,2,3,4];
		public test bool q() = slice([1,2,3,4], 1, 0) == [];
		public test bool q() = slice([1,2,3,4], 1, 1) == [2];
		public test bool q() = slice([1,2,3,4], 1, 2) == [2,3];
		public test bool q() = slice([1,2,3,4], 3, 0) == [];
		public test bool q() = slice([1,2,3,4], 3, 1) == [4];
	

// 	sort
		public test bool q() =List::sort([]) == [];
		public test bool q() =sort([]) == [];
		public test bool q() =List::sort([1]) == [1];
		public test bool q() =sort([1]) == [1];
		public test bool q() =List::sort([2, 1]) == [1,2];
		public test bool q() =sort([2, 1]) == [1,2];
		public test bool q() =List::sort([2,-1,4,-2,3]) == [-2,-1,2,3, 4];
		public test bool q() =sort([2,-1,4,-2,3]) == [-2,-1,2,3, 4];
		public test bool q() =sort([1,2,3,4,5,6]) == [1,2,3,4,5,6];
		public test bool q() =sort([1,1,1,1,1,1]) == [1,1,1,1,1,1];
		public test bool q() =sort([1,1,0,1,1]) == [0,1,1,1,1];
	
// sum
		public test bool q() =sum([]) == 0;
		public test bool q() =sum([1]) == 1;
		public test bool q() =sum([1,2]) == 3;
		public test bool q() =sum([1,2,3]) == 6;
	
	
	
// sortWithCompareFunction 	
		public test bool q() = sort([1, 2, 3]) == [1,2,3];
		public test bool q() = sort([1, 2, 3], bool(int a, int b){return a < b;}) == [1,2,3];
		public test bool q() = sort([1, 2, 3], bool(int a, int b){return a > b;}) == [3,2,1];
// public test bool q() {try { sort([1, 2, 3], bool(int a, int b){return a <= b;}); throw "Should fail";  catch IllegalArgument(_,_): ;}
// public test bool q() {try { sort([1, 0, 1], bool(int a, int b){return a <= b;}); throw "Should fail";  catch IllegalArgument(_,_): ;}
	

// tail
		public test bool q() = List::tail([1]) == [];
		public test bool q() = tail([1]) == [];
		public test bool q() = List::tail([1, 2]) == [2];
		public test bool q() = tail([1, 2, 3]) + [4, 5, 6]  == [2, 3, 4, 5, 6];
		public test bool q() = tail([1, 2, 3]) + tail([4, 5, 6])  == [2, 3, 5, 6];

		public test bool q() = tail([1, 2, 3], 2) == [2,3];
		public test bool q() = tail([1, 2, 3], 0) == [];
		
		public test bool q() = tail(tail([1, 2])) == tail([3]);
		
		public test bool q() { L = [1,2]; return tail(tail(L)) == tail(tail(L));}
		public test bool q() { L1 = [1,2,3]; L2 = [2,3]; return tail(tail(L1)) == tail(L2);}
		public test bool q() { L1 = [1,2]; L2 = [3]; return tail(tail(L1)) == tail(L2);}
		public test bool q() { L1 = [1,2]; L2 = [3]; return {tail(tail(L1)), tail(L2)} == {[]};}
			

@expected{EmptyList}
	public test bool q() {
		tail([]); return false;
		}

@expected{IndexOutOfBounds}
	public test bool q() {
		tail([1,2,3], 4); return false;
		}
	
// takeOneFrom() 
		public test bool q() {<E, L> = takeOneFrom([1]); return (E == 1) && (L == []);}
		public test bool q() {<E, L> = List::takeOneFrom([1,2]); return ((E == 1) && (L == [2])) || ((E == 2) && (L == [1]));}
	
@expected{EmptyList}
	public test bool q() {
		takeOneFrom([]);
		return false;
		}
	
// toMapUnique
		public test bool q() = List::toMapUnique([]) == ();
		public test bool q() = toMapUnique([]) == ();
		public test bool q() = List::toMapUnique([<1,10>, <2,20>]) == (1:10, 2:20);

	
	
// 	(expected=Throw.class)
// toMapUniqueError
		
		public test bool q() {List::toMapUnique([<1,10>, <1,20>]) == (1:10, 2:20);}

	

// toMap
		public test bool q() = List::toMap([]) == ();
		public test bool q() = toMap([]) == ();
		public test bool q() = List::toMap([<1,10>, <2,20>]) == (1:{10}, 2:{20});
		public test bool q() = List::toMap([<1,10>, <2,20>, <1,30>]) == (1:{10,30}, 2:{20});
	
		public test bool q() = List::toSet([]) == {};
		public test bool q() = toSet([]) == {};
		public test bool q() = List::toSet([1]) == {1};
		public test bool q() = toSet([1]) == {1};
		public test bool q() = List::toSet([1, 2, 1]) == {1, 2};
	
// testToString
		public test bool q() = List::toString([]) == "[]";
		public test bool q() = toString([]) == "[]";
		public test bool q() = List::toString([1]) == "[1]";
		public test bool q() = List::toString([1, 2]) == "[1,2]";

/*
	(expected = UnexpectedType.class) 
	public void listExpressions1() {
		runTest("{ value n = 1; list[int] l = [ *[n, n] ]; ");
	
	
	(expected = UnexpectedType.class) 
	public void listExpressions2() {
		runTest("{ value n = 1; list[int] l = [ 1, *[n, n], 2 ]; ");
	
*/
	
// listExpressions3
	public test bool q() { 
		value n = 1; 
		value s = "string"; 
		return list[int] _ := [ n ] && 
		list[str] _ := [ s, s, *[ s, s ] ]; 
		}
	
	
	// Tests related to the correctness of the dynamic types of lists produced by the library functions;
	// incorrect dynamic types make pattern matching fail;

	
// testDynamicTypes

		public test bool q() { list[value] lst = ["1",2,3]; return list[int] _ := slice(lst, 1, 2); }
		public test bool q() { list[value] lst = ["1",2,3]; return list[int] _ := lst - "1"; }
		public test bool q() { list[value] lst = ["1",2,3]; return list[int] _ := lst - ["1"]; }
		public test bool q() { list[value] lst = ["1",2,3]; return  list[int] _ := delete(lst, 0); }
		public test bool q() { list[value] lst = ["1",2,3]; return  list[int] _ := drop(1, lst); }
		public test bool q() { list[value] lst = [1,2,"3"]; return  list[int] _ := head(lst, 2); }
		public test bool q() { list[value] lst = [1,2,"3"]; return  list[int] _ := prefix(lst); }
		public test bool q() { list[value] lst = ["1",2,3]; return  list[int] _ := tail(lst); }
		public test bool q() { list[value] lst = [1,2,"3"]; return  list[int] _ := take(2, lst); }	
		public test bool q() { return [str _, *int _] := ["1",2,3]; }
	