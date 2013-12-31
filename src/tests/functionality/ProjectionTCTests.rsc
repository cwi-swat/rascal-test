module tests::functionality::ProjectionTCTests

@expected{IndexOutOfBounds}
//	public void outOfBounds() {
		public test bool outOfBounds()={<1,2>}<2> == {2};
//	}
