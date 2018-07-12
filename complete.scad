
include <./constants.scad>;

use <./rods.scad>;
use <./ends.scad>;
use <./hanger.scad>;

RENDER_RODS = true;
RENDER_ENDS = true;
RENDER_HANGERS = true;


if(RENDER_ENDS) {

    translate([-(CROSS_OUTER + 2 * CROSS_INNER), 0, 0]) {
        femaleEnd();
    }


    translate([(CROSS_OUTER + 2 * CROSS_INNER), 0, 0]) {
        maleEnd();
    }
}


translate([0, CROSS_OUTER + ROD_R, 0]) {

    if(RENDER_HANGERS) {
        for(c = [-1, 1]) {
            translate([c * (HOOK_WIDTH + ROD_R), HOOK_HEIGHT / 2, CROSS_R]) {
                hanger();
            }
        }
    }

    if(RENDER_RODS) {
        segment_length = ROD_LENGTH / ROD_SEGMENTS;

        rotate([0, 0, 90]) {
            translate([0, 0, (segment_length + THREAD_LENGTH) / 2]) {
                for(i = [0:ROD_SEGMENTS - 1]) {
                    translate([2.5 * i * ROD_R, 0, 0]) {
                        rod(rod_length = segment_length);
                    }
                }
            }
        }

    }
    
}


