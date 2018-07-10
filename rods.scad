
include <./constants.scad>;
use <./connectors.scad>;

module rod(rod_length = ROD_LENGTH) {
    
    top_length = 5;
    bottom_length = rod_length - top_length;
    

    translate([0, 0, (THREAD_LENGTH + rod_length) / 2]) {
        maleConnector();
    }

    translate([0, 0, bottom_length / 2]) {
        difference() {
            cylinder(5, ROD_R, ROD_R, center = true);
            cylinder(5 + 0.01, THREAD_R, INNER_R, center = true);
        }

    }


    translate([0, 0, -top_length / 2]) {
        difference() {
            cylinder(bottom_length, ROD_R, ROD_R, center = true);
            cylinder(bottom_length + 0.1, THREAD_R, THREAD_R, center = true);
        }
    }


    translate([0, 0, -(THREAD_LENGTH + rod_length) / 2]) {
        femaleConnector();        
    }

}

rod();
