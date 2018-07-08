
include <./threads.scad>;
include <./constants.scad>;

include <./cross.scad>;



difference() {
    union() {
        translate([0, 0, CROSS_R * 2]) {
            metric_thread(THREAD_R * 2, THREAD_PITCH, THREAD_LENGTH, leadin = 1);
        }

        cylinder(CROSS_R * 2, ROD_R, ROD_R);        
    }

    cylinder(CROSS_LENGTH * 2, INNER_R, INNER_R, center = true);
}




translate([0, 0, CROSS_R]) {

    rotate([90, 0, 0]) {
        cylinder(CROSS_LENGTH, CROSS_R, CROSS_R, center = true);
    }

    rotate([0, 90, 0]) {
        cylinder(CROSS_LENGTH, CROSS_R, CROSS_R, center = true);
    }
    
    torus(CROSS_R, CROSS_LENGTH / 2);
}

