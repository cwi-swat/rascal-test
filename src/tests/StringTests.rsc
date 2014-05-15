module tests::StringTests
import String;

// Center
public test bool a1() = center("a", 0) == "a";
public test bool a2() = center("a", 1) == "a";
public test bool a3() = center("a", 2) == "a " ;
public test bool a4() = center("a", 3) == " a ";

public test bool ab1() = center("ab", 0, "-") == "ab";
public test bool ab2() = center("ab", 1, "-") == "ab";
public test bool ab3() = center("ab", 2, "-") == "ab";
public test bool ab4() = center("ab", 3, "-") == "ab-";
public test bool ab5() = center("ab", 4, "-") == "-ab-";
public test bool ab6() = center("ab", 3, "-+") == "ab-";
public test bool ab7() = center("ab", 4, "-+") == "-ab-";
public test bool ab8() = center("ab", 5, "-+") == "-ab-+";
public test bool ab9() = center("ab", 6, "-+") == "-+ab-+";

// charAt
public test bool charAt0() = String::charAt("abc", 0) == 97;
public test bool charAt1() = String::charAt("abc", 1) == 98;
public test bool charAt2() = String::charAt("abc", 2) == 99;
public test bool charAt3() = charAt("abc", 0) == 97;

//endsWith
public test bool endsWith1() = String::endsWith("abc", "abc");
public test bool endsWith2() = endsWith("abc", "abc");
public test bool endsWith3() = String::endsWith("abcdef", "def");
public test bool endsWith4() = !String::endsWith("abcdef", "abc");

// left
public test bool left1() = left("a", 0) == "a";
public test bool left2() = left("a", 1) == "a";
public test bool left3() = left("a", 2) == "a ";

public test bool left4() = left("ab", 0, "-") == "ab";
public test bool left5() = left("ab", 1, "-") == "ab";
public test bool left6() = left("ab", 2, "-") == "ab";
public test bool left7() = left("ab", 3, "-") == "ab-";
public test bool left8() = left("ab", 4, "-") == "ab--";

public test bool left9() = left("ab", 3, "-+") == "ab-";
public test bool left10() = left("ab", 4, "-+") == "ab-+";
public test bool left11() = left("ab", 5, "-+") == "ab-+-";
public test bool left12() = left("ab", 6, "-+") == "ab-+-+";

// isEmpty		
public test bool isEmpty1() =isEmpty("");
public test bool isEmpty2() =isEmpty("abc") == false;

// reverse		
public test bool reverse1() =String::reverse("") == "";
public test bool reverse2() =reverse("") == "";
public test bool reverse3() =String::reverse("abc") == "cba";

// right		
public test bool right1() =right("a", 0) == "a";
public test bool right2() =right("a", 1) == "a";
public test bool right3() =right("a", 2) == " a";
		
public test bool right4() =right("ab", 0, "-") == "ab";
public test bool right5() =right("ab", 1, "-") == "ab";
public test bool right6() =right("ab", 2, "-") == "ab";
public test bool right7() =right("ab", 3, "-") == "-ab";
public test bool right8() =right("ab", 4, "-") == "--ab";

public test bool right9() =right("ab", 3, "-+") == "-ab";
public test bool right10() =right("ab", 4, "-+") == "-+ab";
public test bool right11() =right("ab", 5, "-+") == "-+-ab";
public test bool right12() =right("ab", 6, "-+") == "-+-+ab";

// size		
public test bool size1() =String::size("") == 0;
public test bool size2() =size("") == 0;
public test bool size3() =String::size("abc") == 3;

// startsWith
public test bool startsWith1() =String::startsWith("abc", "abc");
public test bool startsWith2() =startsWith("abc", "abc");
public test bool startsWith3() =String::startsWith("abcdef", "abc");
public test bool startsWith4() =!String::startsWith("abcdef", "def");

// substring
public test bool substring1() =substring("abc", 0) == "abc";
public test bool substring2() =substring("abc", 1) == "bc";
public test bool substring3() =substring("abc", 2) == "c";
public test bool substring4() =substring("abc", 3) == "";
public test bool substring5() =substring("abc", 1, 2) == "b";
public test bool substring6() =substring("abc", 1, 3) == "bc";

// toLowerCase
public test bool toLowerCase1() =String::toLowerCase("") == "";
public test bool toLowerCase2() =toLowerCase("") ==  "";
public test bool toLowerCase3() =String::toLowerCase("ABC") == "abc";
public test bool toLowerCase4() =String::toLowerCase("ABC123") == "abc123";

// toUpperCase
public test bool toUpperCase5() =String::toUpperCase("") == "";
public test bool toUpperCase6() =toUpperCase("") == "";
public test bool toUpperCase7() =String::toUpperCase("abc") == "ABC";
public test bool toUpperCase8() =toInt("12345") == 12345;

// toInt
public test bool toInt1() =toInt("0") == 0;
public test bool toInt2() =toInt("1") == 1;
public test bool toInt3() =toInt("0001") == 1;
public test bool toInt4() =toInt("-1") == -1;
public test bool toInt5() =toInt("12345") == 12345;


// toReal
public test bool toReal1() =toReal("0.0") == 0.0;
public test bool toReal2() =toReal("1.0") == 1.0;
public test bool toReal3() =toReal("0001.0") == 1.0;
public test bool toReal4() =toReal("-1.0") == -1.0;
public test bool toReal5() =toReal("1.2345") == 1.2345;


// replaceAll
public test bool replaceAll1() =replaceAll("a", "a", "A") == "A";
public test bool replaceAll2() =replaceAll("a", "x", "X") == "a";
public test bool replaceAll3() =replaceAll("a", "aa", "A") == "a";
public test bool replaceAll4() =replaceAll("abracadabra", "a", "A") == "AbrAcAdAbrA";
public test bool replaceAll5() =replaceAll("abracadabra", "a", "A") == "AbrAcAdAbrA";
public test bool replaceAll6() =replaceAll("abracadabra", "a", "AA") == "AAbrAAcAAdAAbrAA";
public test bool replaceAll7() =replaceAll("abracadabra", "ab", "AB") == "ABracadABra";

// replaceFirst
public test bool replaceFirst1() =replaceFirst("a", "a", "A") == "A";
public test bool replaceFirst2() =replaceFirst("a", "x", "X") == "a";
public test bool replaceFirst3() =replaceFirst("a", "aa", "A") == "a";
public test bool replaceFirst4() =replaceFirst("abracadabra", "a", "A") == "Abracadabra";
public test bool replaceFirst5() =replaceFirst("abracadabra", "a", "AA") == "AAbracadabra";
public test bool replaceFirst6() =replaceFirst("abracadabra", "ab", "AB") == "ABracadabra";

// replaceLast
public test bool replaceLast1() =replaceLast("a", "a", "A") == "A";
public test bool replaceLast2() =replaceLast("a", "x", "X") == "a";
public test bool replaceLast3() =replaceLast("a", "aa", "A") == "a";
public test bool replaceLast4() =replaceLast("abracadabra", "a", "A") == "abracadabrA";
public test bool replaceLast5() =replaceLast("abracadabra", "a", "AA") == "abracadabrAA";
public test bool replaceLast6() =replaceLast("abracadabra", "ab", "AB") == "abracadABra";

// contains
public test bool contains1() =contains("abc", "a");
public test bool contains2() =contains("abc", "c");
public test bool contains3() = !contains("abc", "x");
public test bool contains4() = !contains("abc", "xyzpcontainsr");
public test bool contains5() =contains("abracadabra", "bra");

// findAll
public test bool findAll1() =findAll("abc", "a") == [0];
public test bool findAll2() =findAll("abc", "c") == [2];
public test bool findAll3() =findAll("abc", "x") == [];
public test bool findAll4() =findAll("abc", "xyzpfindsr") == [];
public test bool findAll5() =findAll("abracadabra", "bra") == [1, 8];

// findFirst
public test bool findFirst1() =findFirst("abc", "a") == 0;
public test bool findFirst2() =findFirst("abc", "c") == 2;
public test bool findFirst3() =findFirst("abc", "x") == -1;
public test bool findFirst4() =findFirst("abc", "xyzpfindFirstr") == -1;
public test bool findFirst5() =findFirst("abracadabra", "bra") == 1;

// findLast	
public test bool findLast1() =findLast("abc", "a") == 0;
public test bool findLast2() =findLast("abc", "c") == 2;
public test bool findLast3() =findLast("abc", "x") == -1;
public test bool findLast4() =findLast("abc", "xyzpfindLastr") == -1;
public test bool findLast5() =findLast("abracadabra", "bra") == 8;	
		