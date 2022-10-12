width=27;
height=15;
depth=30;



a=[[0,width*0.3],[depth/2,0],[-depth/2,0]];

translate([0,-width/2,0])
linear_extrude(height = height)
polygon(a);

translate([0,width/2,0])
linear_extrude(height = height)
polygon(-a);

translate([-depth/4,-width/2,0])
cube([depth/2,width,height]);