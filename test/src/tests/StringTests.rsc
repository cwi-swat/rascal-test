module tests::StringTests
import String;

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