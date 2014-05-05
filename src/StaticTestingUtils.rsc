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
import lang::rascal::types::TestChecker;

bool check(str stmts, list[str] expected, list[str] importedModules = [], list[str] initialDecls = []){
     errors = getAllMessages(checkStatementsString(stmts, importedModules=importedModules, initialDecls=initialDecls));
     println(errors);
     if(any(error <- errors, exp <- expected, contains(error.msg, exp)))
        return true;
     throw errors;
}

bool checkOK(str stmts, list[str] importedModules = [], list[str] initialDecls = []){
     errors = getAllMessages(checkStatementsString(stmts, importedModules=importedModules, initialDecls=initialDecls));
     println(errors);
     if(size(errors) == 0)
        return true;
     throw errors;
}

bool unexpectedType(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = 
	check(stmts, ["not defined for", "not defined on", "Invalid type", "Expected", "Unable to bind", "not assignable to","Cannot use type", "expected return type",
	"Expected subscript of type", "Cannot subscript assignable of type", "Unexpected type", "Type of bound should be", "incomparable", "must have an actual type"]);
	
// NOTE: type checker does not yet support this, this check always suvveeds, for now.
bool uninitialized(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = true;
//bool uninitialized(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = check(stmts, ["Unable to bind", "Cannot initialize", "must have an actual type before assigning"], importedModules=importedModules, initialDecls=initialDecls);

bool undeclaredVariable(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = check(stmts, ["is not in scope", "Only constructors or productions with a different arity are available"], importedModules=importedModules, initialDecls=initialDecls);

bool undefinedField(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = check(stmts, ["does not exist on type"], importedModules=importedModules, initialDecls=initialDecls);

bool argumentMismatch(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = check(stmts, ["cannot be called with argument types", "cannot be built with argument types"], importedModules=importedModules, initialDecls=initialDecls);

bool outOfBounds(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = check(stmts, ["Tuple index must be between", "out of range"], importedModules=importedModules, initialDecls=initialDecls);

bool redeclaredVariable(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = check(stmts, ["re-declare"], importedModules=importedModules, initialDecls=initialDecls);

bool cannotMatch(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = check(stmts, ["Cannot match an expression of type", "Cannot assign pattern of type", "is not enumerable"], importedModules=importedModules, initialDecls=initialDecls);

bool declarationError(str stmts, list[str] importedModules = [], list[str] initialDecls = []) = check(stmts, ["Constructor overlaps", "Initializer type"], importedModules=importedModules, initialDecls=initialDecls);