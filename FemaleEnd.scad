
include <./threads.scad>;
include <./constants.scad>;





difference() {
    cylinder(THREAD_LENGTH + CROSS_R * 2, ROD_R, ROD_R);
    
    translate([0, 0, -CROSS_R]) {
        metric_thread(THREAD_R * 2, THREAD_PITCH, (THREAD_LENGTH + CROSS_R) * 2, internal = true);        
    }

}




translate([0, 0, CROSS_R]) {

    rotate([90, 0, 0]) {
        cylinder(CROSS_LENGTH, CROSS_R, CROSS_R, center = true);
    }

    rotate([0, 90, 0]) {
        cylinder(CROSS_LENGTH, CROSS_R, CROSS_R, center = true);
    }
    
}






