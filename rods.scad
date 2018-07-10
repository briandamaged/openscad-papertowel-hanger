
include <./constants.scad>;
use <./connectors.scad>;

module rod(rod_length = ROD_LENGTH, thread_length = THREAD_LENGTH, rod_r = ROD_R, thread_r = THREAD_R, inner_r = INNER_R) {
    
    top_length = 5;
    bottom_length = rod_length - top_length;
    

    translate([0, 0, (thread_length + rod_length) / 2]) {
        maleConnector();
    }

    translate([0, 0, bottom_length / 2]) {
        difference() {
            cylinder(5, rod_r, rod_r, center = true);
            cylinder(5 + 0.01, thread_r, inner_r, center = true);
        }

    }


    translate([0, 0, -top_length / 2]) {
        difference() {
            cylinder(bottom_length, rod_r, rod_r, center = true);
            cylinder(bottom_length + 0.1, thread_r, thread_r, center = true);
        }
    }


    translate([0, 0, -(thread_length + rod_length) / 2]) {
        femaleConnector(rod_r = rod_r);        
    }

}

rod(rod_length = 15);
