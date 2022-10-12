module fillet(r, h) {
    translate([r / 2, r / 2, 0])
        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);
            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);
        }
}


difference(){
    difference(){
        translate([0,0,-0.8])cube([34,24,6],true);
        difference(){
            cube([31.7,21.7,6],true);
            union(){
                translate([-16,-11,0])fillet(3,4.3);
                translate([16,-11,0])rotate([0,0,90])fillet(3,4.3);
                translate([-16,11,0])rotate([0,0,270])fillet(3,4.3);
                translate([16,11,0])rotate([0,0,180])fillet(3,4.3);
            }
        }
    }
    cube([15,21.7,20], true);
}