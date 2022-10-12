module rail(x,y,z,a){
    translate([x,y,z-0.8])
    rotate([90,a,0])
    difference(){
        cylinder(h=75, d = 5.7, center = true, $fn=100);
       translate([0,-10,-40]) cube([20,20,80]);
    }
}

scale([1.06,1.03,1]){
rotate([-90,0,0])
union(){
difference(){

translate([0,0,-0.8])cube([42,75,8],true);
union(){
translate([0,0,-0.8])cube([34.21,75,5.7],true);

rail(17.1,0,0,180);
rail(-17.1,0,0,0);
}
}
translate([0,39,-0.8])cube([42,3,8], true);
}
}