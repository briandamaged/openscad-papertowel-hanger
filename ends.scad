
include <./constants.scad>;
include <./wheel.scad>;

use <./connectors.scad>;


module cap() {
    wheel(CROSS_INNER, CROSS_OUTER);
    cylinder(CROSS_INNER * 2, ROD_R, ROD_R, center = true);
}


module maleEnd() {
    translate([0, 0, THREAD_LENGTH / 2 + CROSS_INNER * 2]) {
        maleConnector();
    }
    
    translate([0, 0, CROSS_INNER]) {
        cap();
    }
}


module femaleEnd() {
    translate([0, 0, THREAD_LENGTH / 2 + CROSS_INNER * 2]) {
        femaleConnector();
    }
    
    translate([0, 0, CROSS_INNER]) {
        cap();
    }
}



translate([30, 30, 0]) {
    maleEnd();
}

translate([-30, -30, 0]) {
    femaleEnd();
}


