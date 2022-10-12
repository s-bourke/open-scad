include <C:\Users\sam\Downloads\OpenScad+library.+Threads+for+screws+and+nuts+V1\files\threads-library-by-cuiso-v1.scad>;

$ns=;

height=30;

difference(){
translate([0,0,height/2])
cylinder(r=10, h=height, center=true);
translate([0,0,-2])
thread_for_screw(diameter=15.5, length=30);
};

translate([0,0,height])
    thread_for_screw(diameter=15, length=15);
   