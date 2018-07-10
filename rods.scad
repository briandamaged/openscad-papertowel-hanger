
include <./constants.scad>;
use <./connectors.scad>;

module rod(rod_length = ROD_LENGTH, thread_length = THREAD_LENGTH, rod_r = ROD_R, thread_r = THREAD_R) {
    
    inner_length = rod_length - (2 * thread_length);

    top_length = 10;
    bottom_length = inner_length - top_length;
    

    translate([0, 0, (thread_length + inner_length) / 2]) {
        maleConnector(thread_length = thread_length, thread_r = thread_r);
    }

    translate([0, 0, bottom_length / 2]) {
        difference() {
            cylinder(top_length, rod_r, rod_r, center = true);
            cylinder(top_length + 0.01, thread_r, 0, center = true);
        }

    }


    translate([0, 0, -top_length / 2]) {
        difference() {
            cylinder(bottom_length, rod_r, rod_r, center = true);
            cylinder(bottom_length + 0.1, thread_r, thread_r, center = true);
        }
    }


    translate([0, 0, -(thread_length + inner_length) / 2]) {
        femaleConnector(thread_length = thread_length, thrad_r = thread_r, rod_r = rod_r);
    }

}


segment_length = ROD_LENGTH / ROD_SEGMENTS;

rod(rod_length = segment_length);

/*
for(i = [0:ROD_SEGMENTS - 1]) {
    translate([3 * i * ROD_R, 0, 0]) {
        rod(rod_length = segment_length);
    }
}
*/


