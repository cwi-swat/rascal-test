module tests::Lists

import IO;
import List;
import Set;
import String;
import Boolean;
import util::Math;
import Type;

// is A + B == C?
bool isConcat(list[&T] A, list[&T] B, list[&T] C) =
     isEmpty(A) ==> C == B ||
     isEmpty(B) ==> C == A ||
     (slice(C, 0, size(A) - 1) == A && slice(C, size(A), size(C) - size(A)) == B);

public test bool concat(list[&T] A, list[&T] B) = isConcat(A, B, A + B);
public test bool concat(     &T  A, list[&T] B) = isConcat([A], B, [A] + B);
public test bool concat(list[&T] A,      &T  B) = isConcat(A, [B], A + [B]);

// is A - B == C?
bool isDiff(list[&T] A, list[&T] B, list[&T] C) =
     isEmpty(A) ==> C == B ||
     isEmpty(B) ==> C == A ||
     all(x <- C, x in A && (x notin B || freq(x, A) > freq(x, B)));

public test bool diff(list[&T] A, list[&T] B) = isDiff(A, B, A - B);

// A == B?
bool isEqual(list[&T] A, list[&T] B) = 
     size(A) == size(B) ? (true | (it && (elementAt(A,i) == elementAt(B,i))) | int i <- index(A)) : false;

bool isEqual(list[&T] A, list[&T] B) = 
     size(A) == size(B) && (true | (it && (A[i] == B[i])) | int i <- index(A));

public test bool equal(list[&T] A) = A == A;
public test bool equal(list[&T] A, list[&T] B) = (A == B) ? isEqual(A,B) : !isEqual(A, B);

public test bool notEqual(list[&T] A) = !(A != A);
public test bool notEqual(list[&T] A, list[&T] B) = (A != B) ? !isEqual(A,B) : isEqual(A,B);
      
// x in L?
bool isIn(&T x, list[&T] L) = (false | it || (x == e) | e <- L);

// Is L sorted?
public bool isSorted(list[int] L) = !any(int i <- index(L), int j <- index(L), i < j && elementAt(L,i) > elementAt(L,j));

// Frequency of x in L
int freq(&T x, list[&T] L) = (0 | e == x ? it + 1 : it | e <- L);

// Merge two lists, keeping their order
public list[&T] mergeOrdered(list[&T] A, list[&T] B) {
   int i = 0;
   int j = 0;
   res = [];
   while(i < size(A) || j < size(B)){
            if(i < size(A) && arbBool()){
               res = res + [elementAt(A,i)];
               i += 1;
            } else if(j < size(B)) {
              res = res + [elementAt(B,j)];
              j += 1;
            };
           };
   return res;
}

// Merge two lists without keeping their order.
public list[&T] mergeUnOrdered(list[&T] A, list[&T] B) {
   res = [];
   while(!(isEmpty(A) && isEmpty(B))){
            if(arbBool() && size(A) > 0){
               <x, A> = takeOneFrom(A);
               res = res + [x];
            } else if(size(B) > 0){
               <x, B> = takeOneFrom(B);
               res = res + [x];
            };
           }
    return res;
}

public test bool inList(list[&T] A, list[&T] B) {
  C =  mergeUnOrdered(A, B);
  return (true | it && b in C | b <- B);
}
    
public test bool notInList(list[&T] A, &T x) =
     x in A ==> isIn(x, A) ||
     x notin A ==> !isIn(x, A);
     
public test bool intersection(list[&T] A, list[&T] B) = isEmpty(A & B) || all(x <- A & B, x in A, x in B);

public test bool lesseq(list[int] A, list[int] B)  = A <= mergeOrdered(A, B);
public test bool less(list[int] A, list[int] B) = isEmpty(B) ||  A < mergeOrdered(A, B);

public test bool greatereq(list[int] A, list[int] B)  = mergeOrdered(A, B) >= A;
public test bool greater(list[int] A, list[int] B)  = isEmpty(B) || mergeOrdered(A, B) > A;
   
public test bool splicing(list[&T] A, list[&T] B) = [*A, *B] == A + B && [A, *B] == [A] + B && [*A, B] == A + [B];

public test bool subscription(list[&T] L){
  R = L;
  for(int i <- index(L)){
      if(head(R) != L[i])
         return false;
       R = tail(R);
  }
  return true;  
}

public test bool subscriptionWrapped(list[&T] L){
  for(int i <- index(L)){
      if(L[i] != L[i - size(L)]){
      	 return false;
      }
  }
  return true;
}

public test bool sliceFirst(list[int] L) {
  if(isEmpty(L)) return true;
  f = arbInt(size(L));
  e = f + arbInt(size(L) - f);
  S = L[f .. e];
  return S == makeSlice(L, f, f + 1, e);
}

public test bool sliceFirst(list[&T] L) {
  if(isEmpty(L)) return true;
  f = arbInt(size(L));
  S = L[f..];
  return S == [elementAt(L,i) | i <- [f .. size(L) ] ];
}

// In an ideal world, this should work, but we have to adapt ranges first ...

//public list[int] makeSlice(list[int] L, int b, int s, int e){
//  return
//    for(int i <- [b, s .. e])
//      append L[i];
//}


public list[int] makeSlice(list[int] L, int f, int s, int e){
  res = [];
  int i = f;
  int delta = s - f;
  if(delta == 0 || f == e)
     return res;
  if(f <= e){
     while(i >= 0 && i < size(L) && i < e ){
        res = res + [elementAt(L,i)];
        i += delta;
     }
  } else {
    while(i >= 0 && i < size(L) && i > e){
        res = res + [elementAt(L,i)];
        i += delta;
     }
  }
  return res;
}

public test bool sliceFirstSecond(list[int] L) {
  if(isEmpty(L)) return true;
  f = arbInt(size(L));
  incr = 2;
  return L[f, f + incr..] == makeSlice(L, f, f + incr, size(L));
}


public test bool sliceEnd(list[int] L) {
  if(isEmpty(L)) return true;
  e = arbInt(size(L));
  return L[..e] == makeSlice(L, 0, 1, e);
}

public test bool sliceSecondEnd(list[int] L) {
  if(isEmpty(L)) return true;
  e = arbInt(size(L));
  incr = 2;
  first = incr > e ? size(L)-1 : 0;
  return L[,incr..e] == makeSlice(L, first, incr, e);
}

public tuple[int,int] arbFirstEnd(list[int] L){
  if(isEmpty(L)) throw "No beging/end indices possible";
  if(size(L) == 1) return <0,0>;
  f = arbInt(size(L));
  e = f + arbInt(size(L) - f);
  return <f, e>;
}
public test bool sliceFirstSecondEnd(list[int] L) {
  if(isEmpty(L)) return true;
  <f, e> = arbFirstEnd(L);
  incr = 2;
  return L[f, f + incr .. e] == makeSlice(L, f, f + incr, e);
}

public test bool sliceFirstNegative(list[int] L) {
  if(isEmpty(L)) return true;
  f = 1;
  return L[-f..] == makeSlice(L, size(L) - f,  size(L) - f + 1, size(L));
}

public test bool sliceEndNegative(list[int] L) {
  if(isEmpty(L)) return true;
  e = arbInt(size(L));
  return L[..-e] == makeSlice(L, 0, 1, e == 0 ? e : size(L) - e);
}

public test bool sliceFirstNegativeSecondNegative(list[int] L) {
  if(isEmpty(L)) return true;
  f = arbInt(size(L));
  incr = 2;
  if(f == 0)
     return L[0, -incr..] == makeSlice(L, 0, size(L) - incr, size(L));
  else
     return L[-f, -(f + incr)..] == makeSlice(L, size(L) - f, size(L) - (f + incr), -1);
}

public test bool sliceSecondNegative(list[int] L) {
  if(isEmpty(L)) return true;
  incr = 2;
  S = L[, -incr ..];
  return S == makeSlice(L, 0, size(L) - incr, size(L));
}

public test bool assignSlice() { L = [0,1,2,3,4,5,6,7,8,9]; L[..] = [10,20]; return L == [10,20,10,20,10,20,10,20,10,20];}
public test bool assignSlice() { L = [0,1,2,3,4,5,6,7,8,9]; L[2..] = [10,20]; return   L == [0,1,10,20,10,20,10,20,10,20];}
public test bool assignSlice() { L = [0,1,2,3,4,5,6,7,8,9]; L[2..6] = [10,20]; return L == [0,1,10,20,10,20,6,7,8,9];}
public test bool assignSlice() { L = [0,1,2,3,4,5,6,7,8,9]; L[8..3] = [10,20]; return L == [0,1,2,3,10,20,10,20,10,9];}

public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[,2..] = [10]; return L == [10,1,10,3,10,5,10,7,10,9];}
public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[,2..] = [10,20]; return L == [10,1,20,3,10,5,20,7,10,9];}
public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[,2..] = [10]; return L == [10,1,10,3,10,5,10,7,10,9];}
public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[,2..] = [10,20]; return L == [10,1,20,3,10,5,20,7,10,9];}
public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[,2..] = [10,20,30]; return L == [10,1,20,3,30,5,10,7,20,9];}
public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[,2..] = [10,20,30,40,50,60,70]; return L == [10,1,20,3,30,5,40,7,50,9,60,70];}

public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[2,4..] = [10]; return L == [0,1,10,3,10,5,10,7,10,9];}
public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[2,4..6] = [10]; return L == [0,1,10,3,10,5,6,7,8,9];}

public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[,6..1] = [10]; return L == [0,1,2,10,4,5,10,7,8,10];}
public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[8,6..] = [10]; return L == [10,1,10,3,10,5,10,7,10,9];}
public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[8,6..3] = [10]; return L == [0,1,2,3,10,5,10,7,10,9];}

public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[-1,-2..] = [10,20,30,40,50]; return L == [50,40,30,20,10,50,40,30,20,10];}
public test bool assignStep() { L = [0,1,2,3,4,5,6,7,8,9]; L[-1,-3..] = [10,20,30,40,50]; return L == [0,50,2,40,4,30,6,20,8,10];}

/*TODO:COMP*///public test bool assignAdd() { L = [0,1,2,3,4,5,6,7,8,9]; L[..] += [10]; return L == [10,11,12,13,14,15,16,17,18,19]; }
/*TODO:COMP*///public test bool assignAdd() { L = [0,1,2,3,4,5,6,7,8,9]; L[2..] += [10]; return L == [0,1,12,13,14,15,16,17,18,19]; }
/*TODO:COMP*///public test bool assignAdd() { L = [0,1,2,3,4,5,6,7,8,9]; L[2..6] += [10]; return L == [0,1,12,13,14,15,6,7,8,9];}
/*TODO:COMP*///public test bool assignAdd() { L = [0,1,2,3,4,5,6,7,8,9]; L[8..3] += [10]; return L == [0,1,2,3,14,15,16,17,18,9];}


// Library functions

public test bool tstDelete(list[&T] L) {
  if(size(L) > 1){
   n = arbInt(size(L));
   return delete(L, n) == L[..n] + ((n == size(L)-1) ? [] : L[n+1 ..]);
 }
 return true;
}
   
// TODO: distribution

public test bool tstDomain(list[&T] L) = domain(L) == toSet([0..size(L)]);

public test bool tstDrop(list[&T] L) {
 if(size(L) > 1){
   n = arbInt(size(L));
   return drop(n, L) == (n < size(L) ? L[n ..] : []);
 }
 return true;
}

public test bool tstDup(list[&T] L) {  // L = [{{{[<-121590445r651299473>]}},{},{{[]},{}}},{}];
  seen = {};
  d = for(e <- L) { if(e notin seen){seen = seen + {e}; append e;} };
  return d == dup(d);
}

public test bool tstGetOneFrom(list[&T] L) = isEmpty(L) || getOneFrom(L) in L;

public test bool tstHead(list[&T] L) = isEmpty(L) || head(L) == elementAt(L,0);

public test bool tstHeadN(list[&T] L) {
  if(size(L) > 1){
    n = arbInt(size(L));
    return head(L, n) == L[..n];
  }
  return true;
}

public test bool tstHeadTail(list[&T] L) = isEmpty(L) || headTail(L) == <elementAt(L,0), size(L) == 1 ? [] : L[1..]>;
   
public test bool tstIndex(list[&T] L) = index(L) == [0..size(L)];

public test bool tstIndexOf(list[int] L) {
  int n = -1;
  e = isEmpty(L) ? 0 : getOneFrom(L);
  for(int i <- index(L)){
    if(elementAt(L,i) == e){ n = i; break; }
  }
  return indexOf(L, e) == n;
}

public test bool tstInsertAt(list[&T] L, &T e){
  if(isEmpty(L))
  	 return insertAt(L, 0, e) == [e];
  n = arbInt(size(L));
  return insertAt(L, n, e) == L[..n] + [e] + L[n..];
}

// sep = "\"\\\"\\\"���������������������������������������������������������������\"������������������������������������������������������";
// L = [<({-113949296r42589197}:797878609r38010066)>,$4551-10-12T12:45:25.024+01:00,"������������������������������������������������������������������������������������������������������������������������������������������������"({|tmp:///|})];

public test bool tstIntercalate(str sep, list[value] L) = 
       intercalate(sep, L) == (isEmpty(L) ? ""
                                          : "<L[0]><for(int i <- [1..size(L)]){><sep><L[i]><}>");

public test bool tstIsEmpty(list[&T] L) = isEmpty(L) ==> (size(L) == 0);

public test bool tstLast(list[&T] L) = isEmpty(L) || last(L) == elementAt(L,-1);

public test bool tstLastIndexOf(list[int] L) {
  int n = -1;
  e = isEmpty(L) ? 0 : getOneFrom(L);
  for(int i <- reverse(index(L))){
    if(elementAt(L,i) == e){ n = i; break; }
  }
  return lastIndexOf(L, e) == n;
}

public test bool tstMapper(list[int] L) {
  int incr(int x) { return x + 1; };
  return mapper(L, incr) == [x + 1 | x <- L];
}

public test bool tstMax(list[int] L) = isEmpty(L) || all(x <- L, max(L) >= x);

public test bool tstMerge(list[int] L, list[int] R) = isSorted(merge(sort(L), sort(R)));

public test bool tstMin(list[int] L) = isEmpty(L) || all(x <- L, min(L) <= x);

public test bool tstMix(list[&T] L, list[&U] R) {
  if(isEmpty(L))
     return mix(L, R) == R;
  if(isEmpty(R))
     return mix(L, R) == L;
  n = min(size(L), size(R));
  res = [elementAt(L,i), elementAt(R,i) | i <- [0..n]] + 
        (size(L) > n ? L[n..] : []) +
        (size(R) > n ? R[n..] : []);
  return mix(L,R) == res;
}

public int factorial(int n) = (n <= 0) ? 1 : n * factorial(n -1);

public test bool tstPermutations(list[&T] L) =
  size(permutations(L)) <= factorial(size(L)) &&
  all(P <- permutations(L), size(P) == size(L), isEmpty(L - P), isEmpty(P - L));
  
public test bool tstPop(list[&T] L) = isEmpty(L) || pop(L) == <elementAt(L,0), size(L) == 1 ? [] : L[1..]>;

public test bool tstPrefix(list[&T] L) = prefix(L) == (isEmpty(L) ? [] : L[..-1]);

public test bool tstPush(&T elem, list[&T] L) = push(elem, L) == [elem, *L];

public test bool tstReverse(list[&T] L) = reverse(reverse(L)) == L;

public test bool tstSize(list[&T] L) = size(L) == (0 | it + 1 | e <- L);

// TODO: slice

public test bool tstSort(list[int] L) = isSorted(sort(L));

public test bool tstSplit(list[&T] L) {
  <L1, L2> = split(L);
  return L1 + L2 == L;
}

public test bool tstSum(list[int] L) = sum(L) == (0 | it + x | x <- L);

public test bool tstTail(list[&T] L) = isEmpty(L) || (tail(L) == (size(L) == 1 ? [] : L[1..]));

public test bool tstTailN(list[&T] L){
 if(isEmpty(L))
    return true;
  n = arbInt(size(L));
  return tail(L, n) == (n > 0 ? L[-n..] : []);
}

public test bool tstTake(list[&T] L){
if(size(L) > 1){
   n = arbInt(size(L));
   return take(n, L) == L[..n];
 }
 return true;
}

public test bool tstTakeOneFrom(list[int] L){
 if(size(L) > 1){
  <elem, R> = takeOneFrom(L);
   return elem in L && (size(R) == size(L) - 1) && (toSet(L) == toSet(R) + elem);
 }
 return true;
}

bool isEven(int a) = a mod 2 == 0;

list[int] takeEven(list[int] L) = (isEmpty(L) || !isEven(elementAt(L,0))) ? [] 
                                                                : elementAt(L,0) + takeEven(size(L) == 1 ? [] : L[1..]);

public test bool tstTakeWhile(list[int] L){
  return takeWhile(L, isEven) == takeEven(L);
}

public test bool tstToMap(list[tuple[&A, &B]] L) = toMap(L) == toMap(toSet(L));

public test bool tstToMapUnique(list[tuple[&A, &B]] L) =
  domain(L) == toSet(L<0>) ==> toMapUnique(L) == toMapUnique(toSet(L));

public test bool tstTop(list[&T] L) = isEmpty(L) || top(L) == elementAt(L,0);

public test bool tstToRel(list[&T] L) = isEmpty(L) || toRel(L) == {<elementAt(L,i), elementAt(L,i+1)> | i <- [0 .. size(L) - 1]};

public test bool tstToSet(list[&T] L) = toSet(L) == {x | x <- L};

/*TODO:?*/ // TODO public test bool tstToString(list[&T] L) = toString(L) == "[" + intercalate(",", L) + "]";

public test bool tstUnzip2(list[tuple[&A, &B]] L) = unzip(L) == <[a | <a,b> <- L], [b | <a,b> <- L]>;

public test bool tstUnzip3(list[tuple[&A, &B, &C]] L) = 
     isEmpty(L) || unzip(L) == <[a | <a,b,c> <- L], [b | <a,b,c> <- L], [c | <a,b,c> <- L]>;
     
public test bool tstUpTill(int n) = n < 0 || n > 10000 || upTill(n) == [0 .. n];

public test bool tstZip(list[&T] L) = zip(L, L) == [<x, x> | x <- L];

// Tests that check the correctness of the dynamic types of lists produced by the library functions; 
// incorrect dynamic types make pattern matching fail;

public test bool dtstSlice(list[&T] lst) {
if(isEmpty(lst)) return true;
int b = 0;
if(size(lst) != 1) b = arbInt(size(lst) - 1);
int len = arbInt(size(lst) - b);
if(len == 0) return true;
lhs = slice(lst, b, len);
rhs = lst[b..(len + b)];
return lhs == rhs && typeOf(lhs) == typeOf(rhs);
}

public test bool dtstDelete(list[&T] lst) {
if(isEmpty(lst)) return true;
int index = 0;
if(size(lst) != 1) index = arbInt(size(lst) - 1);
lhs = delete(lst, index);
rhs = [ lst[i] | int i <- [0..size(lst)], i != index ];
return lhs == rhs && typeOf(lhs) == typeOf(rhs);
}

public test bool dtstDrop(list[&T] lst) {
if(isEmpty(lst)) return true;
int n = 0;
if(size(lst) != 1) n = arbInt(size(lst) - 1);
lhs = drop(n, lst);
rhs = [ lst[i] | int i <- [n..size(lst)] ];
return lhs == rhs && typeOf(lhs) == typeOf(rhs);
}

public test bool dtstHead(list[&T] lst) {
if(isEmpty(lst)) return true;
int n = 0;
if(size(lst) != 1) n = arbInt(size(lst) - 1);
if(n == 0) return true;
lhs = head(lst, n);
rhs1 = [ lst[i] | int i <- [0..n] ];
rhs2 = take(n, lst);
return lhs == rhs1 && lhs == rhs2 && typeOf(lhs) == typeOf(rhs1) && typeOf(lhs) == typeOf(rhs2);
}

public test bool dtstTail(list[&T] lst) {
if(isEmpty(lst)) return true;
int n = 0;
if(size(lst) != 1) n = arbInt(size(lst) - 1);
if(n == 0) return true;
lhs = tail(lst, n);
rhs = [ lst[i] | int i <- [(size(lst) - n)..size(lst)] ];
return lhs == rhs && typeOf(lhs) == typeOf(rhs);
}

public test bool dtstPrefix(list[&T] lst) {
if(isEmpty(lst) || size(lst) == 1) return true;
lhs = prefix(lst);
rhs = [ lst[i] | int i <- [0..(size(lst) - 1)] ];
return lhs == rhs && typeOf(lhs) == typeOf(rhs);
}

public test bool dtstDifference(list[&T] lst) {
	if(isEmpty(lst)) return true;
	bool check = true;
	for(&T elem <- lst) {
		bool deleted = false;
		lhs = lst - [elem];
		rhs = [ *( (elem == el && !deleted) ? { deleted = true; []; } : [ el ]) | &T el <- lst ];
		check = check && lhs == rhs && typeOf(lhs) == typeOf(rhs);
	}
	return check;
}

public test bool dtstIntersection(list[&T] lst) {
	if(isEmpty(lst)) return true;
	bool check = true;
	for([*l1, *l2] := lst) {
	lhs1 = lst & l1;
	rhs1 = [ el | &T el <- lst, el in l1 ];
	lhs2 = lst & l2;
	rhs2 = [ el | &T el <- lst, el in l2 ];
check = check && lhs1 == rhs1 && typeOf(lhs1) == typeOf(rhs1) && lhs2 == rhs2 && typeOf(lhs2) == typeOf(rhs2);
}
	return check;
}

