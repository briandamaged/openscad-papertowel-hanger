
include <./constants.scad>;
include <./cross.scad>;

use <./MaleConnector.scad>;


difference() {
    union() {

        translate([0, 0, CROSS_R * 2]) {
            maleConnector();
        }

        cylinder(CROSS_INNER * 2, ROD_R, ROD_R);

    }
    
    cylinder((CROSS_INNER + THREAD_LENGTH) * 3, INNER_R, INNER_R, center = true);
}



/*
translate([0, 0, CROSS_R]) {
    cross(CROSS_INNER, CROSS_OUTER);
}

*/

