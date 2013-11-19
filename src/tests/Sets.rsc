module tests::Sets

import Exception;
import Set;
import List;
import Relation;
import Map;
import IO;
import Type;

public test bool eqSet(value a, value b) = eq(a,b) <==> size({a,b}) == 1;

// Set operators

// is A + B == C?
bool isUnion(set[&T] A, set[&T] B, set[&T] C) =
     isEmpty(A) ==> C == B ||
     isEmpty(B) ==> C == A ||
     all(x <- C, x in A || x in B);

public test bool union(set[&T] A, set[&T] B) = isUnion(A,   B,  A + B);
public test bool union(     &T A, set[&T] B) = isUnion({A}, B,  {A} + B);
public test bool union(set[&T] A,      &T B) = isUnion(A,   {B}, A +{B});

// is A - B == C?
bool isDiff(set[&T] A, set[&T] B, set[&T] C) =
     isEmpty(A) ==> C == B ||
     isEmpty(B) ==> C == A ||
     all(x <- C, x in A && x notin B);
     
public test bool diff(set[&T] A, set[&T] B) = isDiff(A, B, A - B);

// A == B?
public bool isEqual(set[&T] A, set[&T] B) = 
     size(A) == size(B) ? (size(A) == 0 || all(x <- A, x in B) && all(x <- B, x in A))
                        : false;

public test bool equal(set[&T] A) = A == A;
public test bool equal(set[int] A, set[int] B) = (A == B) ? isEqual(A,B) : !isEqual(A, B);

public test bool notEqual(set[&T] A) = !(A != A);
public test bool notEqual(set[int] A, set[int] B) = (A != B) ? !isEqual(A,B) : isEqual(A, B);
 
public test bool intersection(set[&T] A, set[&T] B) = isEmpty(A & B) || all(x <- A & B, x in A, x in B);

public test bool lesseq(set[int] A, set[int] B)  = A <= (A + B);
public test bool less(set[int] A, set[int] B) = isEmpty(B) || A < (A + B);

public test bool greatereq(set[int] A, set[int] B)  = (A + B) >= A;
public test bool greater(set[int] A, set[int] B)  = isEmpty(B) || (A + B) > A;

public test bool tst_in(int A, set[int] B) = A in (A + B) && A in (B + A);
public test bool tst_notin(int A, set[int] B) = A notin (B - A);

public test bool splicing(set[&T] A, set[&T] B) = {*A, *B} == A + B && {A, *B} == {A} + B && {*A, B} == A + {B};

// Library functions

private bool similar(int a, int b) = a % 5 == b % 5;
private int getClass(int a) = a % 5;

public test bool tst_classify(set[int] S) {
 if (isEmpty(S)) {
   return true;
 }
 
 classes = classify(S, getClass);
 
 if ({ *classes[c] | c <- classes } != S) {
   println("failed for <S>: <classes>");
   return false;
 }
 
 if (c <- classes, e <- classes[c], getClass(e) notin classes) {
   println("failed due to: classes: <classes>, class: <c>, elem: <e>, getClass(<e>): <getClass(e)>");
   return false;
 }
 
 return true;
}
                                                     
public test bool tst_getOneFrom(set[&A] S) = isEmpty(S) || getOneFrom(S) in S;

public test bool tst_group1(set[int] S) = isEmpty(S) || { *g | g <- group(S, similar) } == S;
public test bool tst_group2(set[int] S) = isEmpty(S) || all(g <- group(S, similar), all(x <- g, y <- g, similar(x, y)));

public test bool tst_index1(set[int] S) = isEmpty(S) || domain(index(S)) == S;
public test bool tst_index2(set[int] S) = isEmpty(S) || min(range(index(S))) == 0 ;
public test bool tst_index3(set[int] S) = isEmpty(S) || max(range(index(S))) == size(S) - 1;

// mapper

public test bool tst_max(set[int] S) = isEmpty(S) || all(x <- S, x <= max(S));

public test bool tst_min(set[int] S) = isEmpty(S) || all(x <- S, x >= min(S));

// power, power1, reducer

public test bool tst_size(set[int] S) = size(S) == (0 | it + 1 | x <- S);

// Is L sorted?
public bool isSorted(list[int] L) = !any(int i <- index(L), int j <- index(L), i < j && L[i] > L[j]);

public test bool tst_sort(set[int] S) = isEmpty(S) || all(x <- sort(S), x in S) && size(S) == size(sort(S)) && isSorted(sort(S));

public test bool tst_sum(set[int] S) = sum(S) == (0 | it + x | x <- S);

public test bool tst_takeOneFrom(set[int] S) {
  if(isEmpty(S)) return true;
  <x, S2> = takeOneFrom(S);
  return x in S && x notin S2 && size(S2) == size(S) - 1 && S2 < S;
}

public test bool tst_toList(set[int] S) = isEmpty(S) || size(S) == size(toList(S)) && all(x <- S, x in toList(S));

public test bool tst_toMap(rel[int, int] S) = isEmpty(S) || domain(S) == domain(toMap(S)) && range(S) == {*toMap(S)[k] | k <- toMap(S)};

public test bool tst_toMapUnique(set[int] D, set[int] R) {
 if(isEmpty(D) || isEmpty(R)) return true;
 S = {<k , getOneFrom(R)> | k <- D};
 return domain(S) == domain(toMapUnique(S)) && range(S) == {toMapUnique(S)[k] | k <- toMapUnique(S)};
}

// toString

// Tests that check the correctness of the dynamic types of sets produced by the library functions; 
// incorrect dynamic types make pattern matching fail;

public test bool dtstDifference(set[&T] s) {
	if(isEmpty(s)) return true;
	bool check = true;
	for(int i <- [0..size(s)]) {
		&T elem = getOneFrom(s);
		lhs = s - {elem};
		rhs = { el | &T el <- s, el != elem };
		check = check && lhs == rhs && typeOf(lhs) == typeOf(rhs);
	}
	return check;
}

public test bool dtstIntersection(set[&T] s) {
	if(isEmpty(s)) return true;
	set[set[&T]] subs = power(s);
	bool check = true;
	for(set[&T] sub <- subs) {
	lhs = s & sub;
	rhs = { el | &T el <- s, el in sub };
		check = check && lhs == rhs && typeOf(lhs) == typeOf(rhs);
		}	
	return check;
}
