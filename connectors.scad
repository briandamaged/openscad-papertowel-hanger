

include <./threads.scad>;
include <./constants.scad>;

module maleConnector(r = THREAD_R, length = THREAD_LENGTH, pitch = THREAD_PITCH, n_starts = THREAD_N_STARTS) {
    metric_thread(r * 2, pitch, length, leadin = 1, n_starts = n_starts);
}

maleConnector();
