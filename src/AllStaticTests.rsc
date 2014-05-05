module AllStaticTests

/*
 * Tests for the Rascal Type Checker (To be executed using the Rascal interpreter -- for now).
 * - Open a Rascal Console;
 * - import this module
 * - :test
 *
 */

import StaticTestingUtils;

extend Exception;

extend tests::functionality::AccumulatingTCTests;

extend tests::functionality::AliasTCTests;

extend tests::functionality::AnnotationTCTests;

extend tests::functionality::AssignmentTCTests;

extend tests::functionality::CallTCTests;

extend tests::functionality::ComprehensionTCTests;

extend tests::functionality::DataDeclarationTCTests;

extend tests::functionality::DataTypeTCTests;

extend tests::functionality::DeclarationTCTests;

extend tests::functionality::PatternTCTests;

extend tests::functionality::ProjectionTCTests;

extend tests::functionality::RegExpTCTests;

extend tests::functionality::ScopeTCTests;

extend tests::functionality::StatementTCTests;

extend tests::functionality::SubscriptTCTests;

extend tests::functionality::TryCatchTCTests;

extend tests::functionality::VisitTCTests;

extend tests::library::ListTCTests;

// Sanity check on the testing utilities themselves

test bool testChecker() = checkOK("x;", initialDecls=["int x = 5;"]);

test bool testChecker() = checkOK("d();", initialDecls=["data D = d();"]);

test bool testChecker() = checkOK("d();", initialDecls=["data D = d() | d(int n);"]);

test bool testChecker() = checkOK("d(3);", initialDecls=["data D = d() | d(int n);"]);

public test bool testCheckerX() = 
	checkOK("t();", initialDecls=["data Bool = and(Bool, Bool) | t();"]);
	
public test bool testCheckerX() = 
	checkOK("and(t(),t());", initialDecls=["data Bool = and(Bool, Bool) | t();"]);

public test bool testCheckerX() = 
	checkOK("and(t(),t());f();", initialDecls=["data Bool = and(Bool, Bool) | t();", "data Prop = or(Prop, Prop) | f();"]);

test bool testChecker() = checkOK("size([1,2,3]);", importedModules=["Exception", "List"]);

