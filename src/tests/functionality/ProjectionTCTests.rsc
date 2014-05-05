module tests::functionality::ProjectionTCTests

import StaticTestingUtils;

public test bool tupleOutOfBounds() = outOfBounds("{\<1,2\>}\<2\> == {2};");
