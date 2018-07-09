
include <./threads.scad>;
include <./constants.scad>;

include <./cross.scad>;

D = 0.1;


difference() {
    cylinder(THREAD_LENGTH + CROSS_R * 2, ROD_R, ROD_R);

    translate([0, 0, -(D / 2)]) {
        metric_thread(THREAD_R * 2 + D, THREAD_PITCH, THREAD_LENGTH + (CROSS_R * 2) + D, internal = true);
    }

}

translate([0, 0, CROSS_R]) {
    cross(CROSS_INNER, CROSS_OUTER);
}

