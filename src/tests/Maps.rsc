module tests::Maps

import Map;
import Set;
import List;
import ListRelation;
import util::Math;

// is A + B == C?
bool isUnion(map[&K, &V] A, map[&K, &V] B, map[&K, &V] C) =
     isEmpty(A) ==> C == B ||
     isEmpty(B) ==> C == A ||
     all(x <- C,  x in domain(B) && C[x] == B[x] || x in domain(A) && C[x] == A[x]);

public test bool union(map[&K, &V] A, map[&K, &V] B) = isUnion(A,   B,  A + B);

// is A - B == C?
bool isDiff(map[&K, &V] A, map[&K, &V] B, map[&K, &V] C) =
     isEmpty(A) ==> C == B ||
     isEmpty(B) ==> C == A ||
     all(x <- C, x in domain(A) && x notin domain(B));
     
public test bool diff(map[&K, &V] A, map[&K, &V] B) = isDiff(A, B, A - B);

// A == B?
public bool isEqual(map[&K, &V] A, map[&K, &V] B) = 
    domain(A) == domain(B) && range(A) == range(B) &&
    (size(A) == 0 || all(x <- A, A[x] == B[x]));

public test bool equal(map[&K, &V] A) = A == A;
public test bool equal(map[str, int] A, map[str, int] B) = (A == B) ? isEqual(A,B) : !isEqual(A, B);

public test bool notEqual(map[&K, &V] A) = !(A != A);
public test bool notEqual(map[&K, &V] A, map[&K, &V] B) = (A != B) ? !isEqual(A,B) : isEqual(A, B);
 
public test bool intersection(map[&K, &V] A, map[&K, &V] B) = isEmpty(A & B) || all(x <- A & B, x in A, x in B, A[x] == B[x]);


public test bool lesseq(map[&K, &V] A, map[&K, &V] B)  = A <= (B + A); // right overwrites left

public test bool less(map[&K, &V] A, map[&K, &V] B) = (A != B + A) ==> A < (B + A);

public test bool greatereq(map[&K, &V] A, map[&K, &V] B)  = (B + A) >= A;
public test bool greater(map[int, str] A, map[int, str] B)  = B <= A || (B + A) > A;

public test bool tst_in(&K key, &V val, map[&K, &V] M) = key in M || (key in (M + (key : val)) && val == (M + (key : val))[key] &&
														              key in ((key : val) + M) && val == ((key : val) + M)[key]);
public test bool tst_notin(int A, map[int,int] B) = A notin (B - (A:A));

// Library functions

public test bool tst_domain(map[str, int] X) = 
   isEmpty(X) || 
   {k | k <- X} == domain(X);

private set[int] sample(map[int, int] X) {
   c = domain(X) + range(X);
   if(size(c) <= 2)
   	  return {};
   <r1, c> = takeOneFrom(c);
   <r2, c> = takeOneFrom(c);
  return {r1, r2};
}

public test bool tst_domainR(map[int, int] X) {
   s = sample(X);
   XR = domainR(X, s);
   return isEmpty(XR) || all(k <- XR, k in s);
}

public test bool tst_domainX(map[int, int] X) {
   s = sample(X);
   XR = domainX(X, s);
   return isEmpty(XR) || all(k <- XR, k notin s);
}

public test bool tst_invert(map[int, int] X) = isEmpty(X) || domain(invert(X)) == range(X) && domain(X) == {*invert(X)[k] | k <- invert(X)};

public test bool tst_invertUnique(set[int] D, set[int] R) {
 if(isEmpty(D) || isEmpty(R)) return true;
 dList = toList(D);
 rList = toList(R);
 S = (dList[i] : rList[i] | i <- [0 .. min(size(D) -1 , size(R) -1) + 1]);
 return domain(S) == range(invertUnique(S)) && range(S) == domain(invertUnique(S));
}

public test bool tst_range(map[str, int] X) = 
   isEmpty(X) || 
   {X[k] | k <- X} == range(X);

public test bool tst_rangeR(map[int, int] X) {
   s = sample(X);
   XR = rangeR(X, s);
   return isEmpty(XR) || all(k <- XR, X[k] in s);
}

public test bool tst_rangeX(map[int, int] X) {
   s = sample(X);
   XR = rangeX(X, s);
   return isEmpty(XR) || all(k <- XR, X[k] notin s);
}

public test bool tst_toList(map[int,int] S) = isEmpty(S) || size(S) == size(toList(S)) && all(k <- S, <k, S[k]> in toList(S));

public test bool tst_toRel(map[int,int] S) = isEmpty(S) || size(S) == size(toRel(S)) && all(k <- S, <k, S[k]> in toRel(S));


