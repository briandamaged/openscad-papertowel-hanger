
include <./torus.scad>;

module wheel(inner, outer) {
    rotate([90, 0, 0]) {
        cylinder(outer * 2, inner, inner, center = true);
    }

    rotate([0, 90, 0]) {
        cylinder(outer * 2, inner, inner, center = true);
    }
    
    torus(inner, outer);
}
