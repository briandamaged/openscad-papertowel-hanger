
include <./constants.scad>;

use <./torus.scad>;

module hanger(width = HOOK_WIDTH, height = HOOK_HEIGHT, r = CROSS_R) {
    // No pun intended...
    hook_r = width / 2;
    inner_height = (height / 2) - (2 * hook_r);


    for(z = [0, 180]) {
        rotate([0, 0, z]) {

            translate([0, inner_height + hook_r, 0]) {
                torus(r, hook_r, angle = 180);
            }
            
            translate([0, hook_r, 0]) {
                rotate([0, 0, 180]) {
                    torus(r, hook_r, angle = 90);
                }
            }

            translate([-hook_r, hook_r, 0]) {
                rotate([-90, 0, 0]) {
                    cylinder(inner_height, r, r);
                }
            }


            translate([hook_r, hook_r + inner_height / 4, 0]) {
                rotate([-90, 0, 0]) {
                    cylinder(3 * inner_height / 4, r, r);
                }
            }


        }
    }



}

hanger();
