module fillet(r, h) {
    translate([r / 2, r / 2, 0])
        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);
            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);
        }
}

module clip(x,y,z){
   translate([x,y,z]) difference(){
        difference(){
            translate([0,0,-0.8])cube([34,24,5.5],true);
            difference(){
                cube([31.7,21.7,5.5],true);
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
}

module rail(x,y,z,a){
    translate([x,y,z-0.8])
    rotate([90,a,0])
    difference(){
        cylinder(h=72, d = 5.5, center = true, $fn=100);
       translate([0,-10,-40]) cube([20,20,80]);
    }
}

clip(0,-24,0);
clip(0,0,0);
clip(0,24,0);

rail(17,0,0,180);
rail(-17,0,0,0);

translate([0,40,-0.8])cube([40,10,5.5], true);
