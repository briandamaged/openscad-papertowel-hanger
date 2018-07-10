
include <./threads.scad>;
include <./constants.scad>;

include <./cross.scad>;

use <./connectors.scad>;


translate([0, 0, THREAD_LENGTH / 2]) {
    femaleConnector();
}




translate([0, 0, CROSS_R]) {
    
}



