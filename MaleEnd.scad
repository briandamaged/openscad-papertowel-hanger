
include <./threads.scad>;
include <./constants.scad>;

include <./cross.scad>;



difference() {
    union() {

        translate([0, 0, CROSS_R * 2]) {
            metric_thread(THREAD_R * 2, THREAD_PITCH, THREAD_LENGTH, leadin = 1, n_starts = 2);
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

