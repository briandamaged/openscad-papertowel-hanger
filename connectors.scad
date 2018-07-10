

include <./threads.scad>;
include <./constants.scad>;

module maleConnector(thread_r = THREAD_R, thread_length = THREAD_LENGTH, thread_pitch = THREAD_PITCH, thread_n_starts = THREAD_N_STARTS) {

    translate([0, 0, -thread_length / 2]) {
        metric_thread(thread_r * 2, thread_pitch, thread_length, leadin = 1, n_starts = thread_n_starts);
    }
}


module femaleCutout(thread_r = THREAD_R, thread_length = THREAD_LENGTH, thread_pitch = THREAD_PITCH, thread_n_starts = THREAD_N_STARTS) {

    d = thread_pitch / 4.0;

    translate([0, 0, -(thread_length + d) / 2]) {
        metric_thread((thread_r + d) * 2, thread_pitch, thread_length + d, n_starts = thread_n_starts, internal = true);
    }
}

module femaleConnector(rod_r = ROD_R, thread_r = THREAD_R, thread_length = THREAD_LENGTH, thread_pitch = THREAD_PITCH, thread_n_starts = THREAD_N_STARTS) {
    difference() {
        cylinder(thread_length, rod_r, rod_r, center = true);

        femaleCutout(
            thread_r = thread_r,
            thread_length = thread_length,
            thread_pitch = thread_pitch,
            thread_n_starts = thread_n_starts
        );
    }
    
}


translate([20, 0, 0]) {
    maleConnector();
}

translate([-20, 0, 0]) {
    femaleConnector();
}

