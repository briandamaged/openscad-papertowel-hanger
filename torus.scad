
module torus(inner, outer, angle, $fn=$fn) {
    rotate_extrude(angle=angle, $fn=$fn) {
        translate([outer, 0]) {
            circle(inner, $fn=$fn);
        }
    }
}

