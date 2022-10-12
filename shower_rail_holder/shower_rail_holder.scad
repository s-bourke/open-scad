$fa = 1; $fs = 0.5;

// Variables
donutHeight = 5;
donutDiam = 25;
coneTopDiam = 14;
donutThickness = (donutDiam - coneTopDiam) / 2;
screwHoleDiam = 6.8;
lowerDonutCylinderHeight = 2;
lowerScrewHoleHeight = 3;
curveFactor = 1.4;

difference() {
    union() {
        difference() {
            union() {
                translate([0, 0, - lowerScrewHoleHeight]) cylinder(h = lowerScrewHoleHeight, r = screwHoleDiam / 2 + 2);
                cylinder(h = lowerDonutCylinderHeight, r = donutDiam / 2);
                cylinder(h = donutHeight, r = donutDiam / 2 - (donutHeight - lowerDonutCylinderHeight) * curveFactor);
                translate([0, 0, lowerDonutCylinderHeight])
                    rotate_extrude()
                        translate([donutDiam / 2 - (donutHeight - lowerDonutCylinderHeight) * curveFactor, 0, 0])
                            scale([curveFactor, 1, 1])difference() {
                                circle(r = donutHeight - lowerDonutCylinderHeight);
                                translate([- 2 * donutHeight, - donutHeight, 0])square(2 * donutHeight);
                                translate([0, 0, - lowerScrewHoleHeight]) cylinder(h = lowerScrewHoleHeight, r = 100);
                            }
            }
            union() {
                cylinder(h = donutHeight, r2 = coneTopDiam / 2, r1 = screwHoleDiam / 2);
                translate([0, 0, - lowerScrewHoleHeight]) cylinder(h = lowerScrewHoleHeight, r = 20);
            }
        }
        translate([0, 0, - lowerScrewHoleHeight]) cylinder(h = lowerScrewHoleHeight, r = screwHoleDiam / 2 + 1);
    }
    translate([0, 0, - 25])cylinder(h = 50, r = screwHoleDiam / 2);
}    