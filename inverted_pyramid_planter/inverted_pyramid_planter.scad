module pyramidBase(r, N){
    pointsArray = [for(i = [0 : N - 1]) [r * cos(360*i/N), r * sin(360*i/N)] ];
    polygon(points = pointsArray, 
    paths = [ [for(i = [0 : N - 1]) i ]], convexity = N);
}


numSides = 3;
// Base
difference(){
    difference(){
        union(){
            translate([0,0,60])rotate([0,180,0])
            linear_extrude(height = 70, scale = 0) pyramidBase(120, numSides);
            if (numSides % 2 == 0)
                rotate([0,0,180/numSides])
                linear_extrude(height = 20, scale = 0) pyramidBase(40, numSides);
            else
                linear_extrude(height = 20, scale = 0) pyramidBase(40, numSides);
            }
        translate([0,0,62])rotate([0,180,0])
        linear_extrude(height = 60, scale = 0) pyramidBase(120, numSides);
    }
    translate([0,0,-6])cube([50,50,12], true);
}
    
// Insert
translate([0,0,-125])
difference(){
    difference(){
        difference(){
            union(){
                translate([0,0,155])
                scale([1,1,0.8]) sphere(r = 17);
                translate([0,0,158])cylinder(h = 65, r1 = 8, r2 = 8, center = true);
            }
        translate([0,0,155])
        scale([1,1,0.8]) sphere(r = 16);
        }
        cylinder(h = 500, r1 = 7, r2 = 7, center = true);
    }
    union(){
        for(i = [0 : 12]) 
        translate([0,0,142-i])rotate([i*30,90,0])cylinder(h = 500, r1 = 1, r2 = 1, center = true);
    }
}
