module tests::library::SetTests
import Set;
import Exception;

	
// getOneFrom

		public test bool q() {int N = Set::getOneFrom({1});  return N == 1;}
		public test bool q() {int N = Set::getOneFrom({1}); return  N == 1;}
		public test bool q() {int N = getOneFrom({1}); return  N == 1;}
		public test bool q() {int N = Set::getOneFrom({1, 2}); return  (N == 1) || (N == 2);}
		public test bool q() {int N = Set::getOneFrom({1, 2, 3}); return  (N == 1) || (N == 2) || (N == 3);}
		public test bool q() {real D = Set::getOneFrom({1.0,2.0}); return  (D == 1.0) || (D == 2.0);}
		public test bool q() {str S = Set::getOneFrom({"abc","def"}); return  (S == "abc") || (S == "def");}
		public test bool q() {try{Set::getOneFrom({});return false;} catch EmptySet(): return true;}
	
	
	
// isEmpty
		public test bool q() = isEmpty({});
		public test bool q() = isEmpty({1,2}) == false;
		
// mapper
		public test bool q() {int inc(int n) {return n + 1;} return mapper({1, 2, 3}, inc) == {2, 3, 4};}

//  max
		public test bool q() = Set::max({1, 2, 3, 2, 1}) == 3;
		public test bool q()  = max({1, 2, 3, 2, 1}) == 3;

	
// min 
		public test bool q() = Set::min({1, 2, 3, 2, 1}) == 1;
		public test bool q() = min({1, 2, 3, 2, 1}) == 1;
	
// power 
		public test bool q() = Set::power({}) == {{}};
		public test bool q() = Set::power({1}) == {{}, {1}};
		public test bool q() = Set::power({1, 2}) == {{}, {1}, {2}, {1,2}};
		public test bool q() = Set::power({1, 2, 3}) == {{}, {1}, {2}, {3}, {1,2}, {1,3}, {2,3}, {1,2,3}};
		public test bool q() =  Set::power({1, 2, 3, 4}) == { {}, {1}, {2}, {3}, {4}, {1,2}, {1,3}, {1,4}, {2,3}, {2,4}, {3,4}, {1,2,3}, {1,2,4}, {1,3,4}, {2,3,4}, {1,2,3,4}};

	
// reducer
        public test bool reducer1() {
		    int add(int x, int y){return x + y;}
			return reducer({1, 2, 3, 4}, add, 0) == 10;
		}

// size	
		public test bool q() = Set::size({}) == 0;
		public test bool q()  = size({}) == 0;
		public test bool q()  = Set::size({1}) == 1;
		public test bool q()  = Set::size({1,2,3}) == 3;

// sum	
		public test bool q()  = sum({}) == 0;
		public test bool q()  = sum({1}) == 1;
		public test bool q()  = sum({1,2}) == 3;
		public test bool q()  = sum({1,2,3}) == 6;

//	takeOneFrom
		public test bool q() {<E, SI> = Set::takeOneFrom({1}); return (E == 1) && (SI == {}) ;}
		public test bool q() {<E, SI> = Set::takeOneFrom({1,2}); return ((E == 1) && (SI == {2})) || ((E == 2) && (SI == {1}));}
        public test bool q() {try{Set::takeOneFrom({});return false;} catch EmptySet(): return true;}
        
// toList
		public test bool q() = Set::toList({}) == [];
		public test bool q() = toList({}) == [];
		public test bool q() = Set::toList({1}) == [1];
		public test bool q() = (Set::toList({1, 2, 1}) == [1, 2]) || (Set::toList({1, 2, 1}) == [2, 1]);
	
	
// toMap
		public test bool q() = Set::toMap({}) == ();
		public test bool q()  =toMap({}) == ();
		public test bool q() = Set::toMap({<1, "a">}) == (1 : {"a"});
		public test bool q() = Set::toMap({<1, "a">, <2, "b">, <1, "c">}) == (1 : {"a", "c"}, 2 : {"b"});
	
// toMapUnique	
		public test bool q() = Set::toMapUnique({}) == ();
		public test bool q() = toMapUnique({}) == ();
		public test bool q() = Set::toMapUnique({<1, "a">}) == (1 : "a");
		public test bool q() = Set::toMapUnique({<1, "a">, <2, "b">}) == (1 : "a", 2 : "b");
	
// testToString 
		public test bool q() = Set::toString({}) == "{}";
		public test bool q() = toString({}) == "{}";
		public test bool q() = Set::toString({1}) == "{1}";
		public test bool q() { S = Set::toString({1, 2}); return (S == "{1,2}") || (S == "{2,1}");}	
	
// setExpressions3 
public test bool setExpressions() {
		value n = 1; 
		value s = "string"; 
		return set[int] _ := { n } && set[str] _ := { s, s, *{ s, s } };
		}
	
	// Tests related to the correctness of the dynamic types of sets produced by the library functions;
	// incorrect dynamic types make pattern matching fail;

// testDynamicTypes() 
		public test bool q() {set[value] s = {"1",2,3}; return set[int] _ := s - "1";}
		public test bool q() {set[value] s = {"1",2,3}; return set[int] _ := s - {"1"}; }
		public test bool q() {set[value] s = {"1",2,3}; return set[int] _ := s & {2,3};}
		public test bool q() = {"1", *int _} := {"1",2,3}; 
		


