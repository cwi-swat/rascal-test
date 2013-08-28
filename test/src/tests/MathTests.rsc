module tests::MathTests
import util::Math;

real eps = 0.000001;

public test bool cosTest() {
    return abs(cos(0) - 1) <  eps 
    && abs(cos(PI()/2))<eps
    && abs(cos(PI()+1)<eps
    && abs(cos(3*PI()/2)))<eps
    && abs(cos(2*PI()-1))<eps;
	}
	
public test bool denominatorTest() {
    return denominator(2r3)== 3 &&
    denominator(4r6)== 3 && denominator(-2r3);
    }
 
 public test bool ETest() {   
    return E() > 2.7 && E() < 2.8;
    }
    
 public test bool ExpTest() {   
    return abs(exp(0) - 1) < eps
    && abs(exp(1) - E()) < ps
    && abs(exp(2) - E() * E()) < eps;
    }
    
 public test bool floorTest() { 
     return floor(0.0) == 0
     && floor(1.0) == 1
     && floor(1.1) == 1
	 && floor(1.5) == 1
	 && floor(1.9) == 1
	 && floor(-1.0) == -1
	 && floor(-1.1) == -2
     && floor(-1.5) == -2
	 && floor(-1.9) == -2;
	 }