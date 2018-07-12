
include <./constants.scad>;

use <./rods.scad>;
use <./ends.scad>;
use <./hanger.scad>;

RENDER_RODS = true;
RENDER_ENDS = true;
RENDER_HANGERS = true;

/////////////////////////////////////
// Rods
/////////////////////////////////////
if(RENDER_RODS) {
    segment_length = ROD_LENGTH / ROD_SEGMENTS;
    translate([0, 0, (segment_length + THREAD_LENGTH) / 2]) {
        for(i = [0:ROD_SEGMENTS - 1]) {
            translate([2.5 * i * ROD_R, 0, 0]) {
                rod(rod_length = segment_length);
            }
        }
    }    
}



/////////////////////////////////////
// Ends
/////////////////////////////////////
if(RENDER_ENDS) {
    translate([CROSS_OUTER, 2 * ROD_R + CROSS_OUTER, 0]) {
        femaleEnd();

        translate([2 * CROSS_OUTER + ROD_R, 0, 0]) {
            maleEnd();
        }
    }
}

if(RENDER_HANGERS) {
    translate([HOOK_HEIGHT / 2, -(ROD_R * 2 + HOOK_WIDTH / 2), CROSS_R]) {
        rotate([0, 0, 90]) {
            hanger();
        }
        
        translate([HOOK_HEIGHT / 2 + HOOK_WIDTH, 0, 0]) {
            rotate([0, 0, -0]) {
                hanger();
            }

        }

    }
}