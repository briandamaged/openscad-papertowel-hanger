

include <./threads.scad>;
include <./constants.scad>;

module maleConnector(r = THREAD_R, length = THREAD_LENGTH, pitch = THREAD_PITCH, n_starts = THREAD_N_STARTS) {
    translate([0, 0, -length / 2]) {
        metric_thread(r * 2, pitch, length, leadin = 1, n_starts = n_starts);
    }
}


module femaleCutout(r = THREAD_R, length = THREAD_LENGTH, pitch = THREAD_PITCH, n_starts = THREAD_N_STARTS) {
    d = pitch / 4.0;
    translate([0, 0, -(length + d) / 2]) {
        metric_thread((r + d) * 2, pitch, length + d, n_starts = n_starts, internal = true);
    }
}

module femaleConnector(rod_r = ROD_R, thread_r = THREAD_R, length = THREAD_LENGTH, pitch = THREAD_PITCH, n_starts = THREAD_N_STARTS) {
    difference() {
        cylinder(length, rod_r, rod_r, center = true);

        femaleCutout(
            r = thread_r,
            length = length,
            pitch = pitch,
            n_starts = n_starts
        );
    }
    
}


translate([20, 0, 0]) {
    maleConnector();
}

translate([-20, 0, 0]) {
    femaleConnector();
}

