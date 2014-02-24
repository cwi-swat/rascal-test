module tests::library::lang::csv::CSVIOTests

import IO;
import Type;
import lang::csv::IO;

loc targetFile = |tmp:///test.csv|;

bool readWrite(set[&T] dt) {
	if (dt == {}) return true;
	returnType = type(typeOf(dt), ());
	writeCSV(dt, targetFile);

	if (dt != readCSV(returnType, targetFile)) {
		throw "Default read/write params";
	}
	writeCSV(dt, targetFile, header = false);
	if (dt != readCSV(returnType, targetFile, header = false)) {
		throw "Header = false";
	}

	writeCSV(dt, targetFile, separator = ";");
	if (dt != readCSV(returnType, targetFile, separator = ";")) {
		throw "separator = ;";
	}

	if (/\node() !:= typeOf(dt)) {
		writeCSV(dt, targetFile);
		if (dt != readCSV(targetFile)) {
			throw "infered types";	
		}
	}
	return true;
}

test bool csvWithLoc(rel[loc first, int second] dt) = readWrite(dt);
test bool csvWithStr(rel[str first, int second] dt) = readWrite(dt);
test bool csvWithList(rel[list[&T] first, int second] dt) = readWrite(dt);
test bool csvWithSet(rel[set[&T] first, int second] dt) = readWrite(dt);
test bool csvWithMap(rel[map[&T, &Y] first, int second] dt) = readWrite(dt);
test bool csvWithNode(rel[node first, int second] dt) = readWrite(dt);

test bool csvRandom(rel[&T,&X] dt) = readWrite(dt);

test bool csvMoreTuples(rel[str a, str b, int c, bool d, real e] dt) = readWrite(dt);
test bool csvMoreRandomTypes(rel[&T1 a, &T2 b, int c, str d, &T3 e] dt) = readWrite(dt);