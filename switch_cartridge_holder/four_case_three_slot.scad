module fillet(r, h) {
    translate([r / 2, r / 2, 0])
        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);
            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);
        }
}


module rail(x,y,z,a){
    rotate([90,a,0])
    translate([x,y,x])
    linear_extrude(height = 75, scale = 1.0, center=true) 
    polygon(
        points = [[-0.5,-0.5],[0.5,-0.5],[0,0.5]],
        paths=[[0,1,2]]
    );
}

module case(y){
    translate([0,y,0])
    rotate([-90,0,0])
    union(){
        difference(){
            translate([0,0,-0.8])cube([40,75,7],true);
            union(){
                translate([0,0,-0.8])cube([34,75,5.5],true);
                rail(0,17.5,0,90);
                rail(0,17.5,0,-90);
            }
        }
    translate([0,39,-0.8])cube([40,3,7], true);
    }
}

case(-8.25);
case(-2.75);
case(2.75);
case(8.25);
