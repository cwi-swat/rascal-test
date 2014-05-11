@bootstrapParser
module StaticTestingUtils

/*
 * Utilities for writing tests for the Rascal Type Checker:
 * - all utitlities depend on checkStatementsString
 * - all utitlies match for the occurence of certain phrases in the generated error messages.
 * - (in a next phase we may want to introduce a more specific error reporting datatype)
 */

import IO;
import String;
import Message;
import Set;
import util::Reflective;
import ParseTree;
import lang::rascal::checker::ParserHelper;
import lang::rascal::types::TestChecker;
import lang::rascal::types::CheckTypes;
import lang::rascal::types::CheckerConfig;
import lang::rascal::\syntax::Rascal;

str abbrev(str s) { return size(s) < 100 ? s : "<s[0..97]> ..."; }

bool check(str stmts, list[str] expected, list[str] importedModules = [], list[str] initialDecls = []){
     errors = getAllMessages(checkStatementsString(stmts, importedModules=importedModules, initialDecls=initialDecls));
     println(errors);
     if(any(error <- errors, exp <- expected, contains(uncapitalize(error.msg), uncapitalize(exp))))
        return true;
     throw abbrev("<errors>");
}

bool checkOK(str stmts, list[str] importedModules = [], list[str] initialDecls = []){
     errors = getAllMessages(checkStatementsString(stmts, importedModules=importedModules, initialDecls=initialDecls));
     println(errors);
     if(size(errors) == 0)
        return true;
     throw abbrev("<errors>");
}

bool checkModuleOK(loc moduleToCheck){
	c = newConfiguration();							// Copied from checkStatementsString
	try {
		pt = parse(#start[Module],moduleToCheck);
		if (pt has top && Module m := pt.top) {
			c = checkModule(m, c);
		} else {
			c = addScopeError(c, "Unexpected parse result for module to check", moduleToCheck); 
		}
	} catch perror : {
		c = addScopeError(c, "Could not parse and prepare config for base module to check: <perror>", moduleToCheck);
	}
     errors = c.messages;
     println(errors);
     if(size(errors) == 0)
        return true;
     throw abbrev("<errors>");
}

bool unexpectedType(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = 
	check(stmts, [
		"not defined for", 
		"not defined on", 
		"Invalid type", 
		"Expected", 
		"Unable to bind", 
		"not assignable to",
		"Cannot use type", 
		"expected return type",
		"Expected subscript of type", 
		"Cannot subscript assignable of type", 
		"Unexpected type", 
		"Type of bound should be", 
		"incomparable", 
		"must have an actual type",
		"Cannot assign value of type", 
		"does not allow fields",
		"Tuple index must be between", 
		"out of range"
	], importedModules=importedModules, initialDecls=initialDecls);
	
// NOTE: type checker does not yet support this, this check always succeeds, for now.

bool uninitialized(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = true;

//bool uninitialized(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = 
	//check(stmts, [
	//	"Unable to bind", 
	//	"Cannot initialize", 
	//	"must have an actual type before assigning"
	//], importedModules=importedModules, initialDecls=initialDecls);

bool undeclaredVariable(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = 
	check(stmts, [
		"is not in scope", 
		"Only constructors or productions with a different arity are available"
	], importedModules=importedModules, initialDecls=initialDecls);

bool undefinedField(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = 
	check(stmts, [
		"does not exist on type"
	], importedModules=importedModules, initialDecls=initialDecls);

bool argumentMismatch(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = 
	check(stmts, [
		"cannot be called with argument types", 
		"cannot be built with argument types"
	], importedModules=importedModules, initialDecls=initialDecls);

bool redeclaredVariable(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = 
	check(stmts, [
		"re-declare",
		"redeclaration",
		"has already been declared"
	], importedModules=importedModules, initialDecls=initialDecls);

bool cannotMatch(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = 
	check(stmts, [
		"Cannot match an expression of type", 
		"Cannot assign pattern of type", 
		"is not enumerable"
	], importedModules=importedModules, initialDecls=initialDecls);

bool declarationError(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = 
	check(stmts, [
		"Constructor overlaps", 
		"Initializer type"
	], importedModules=importedModules, initialDecls=initialDecls);
	
void makeModule(str name, str body){
    writeFile(|project://rascal-test/src/<name>.rsc|, "module <name>\n<body>");
}
