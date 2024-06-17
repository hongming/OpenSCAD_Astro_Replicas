difference(){
linear_extrude(5)
polygon(points=[
[60,0],
[140,0],
[140,20],
[60,100],
[60,250],
[40,250],
[0,60
]
]);

color("red")
translate([55,55,0])
cylinder(h=100,d=50,center=true);


color("red")
translate([100,30,0])
cylinder(h=100,d=30,center=true);


color("red")
translate([20,75,0])
cylinder(h=100,d=15,center=true);

color("red")
translate([37,90,0])
cylinder(h=100,d=20,center=true);


color("red")
translate([38,115,0])
cylinder(h=100,d=19,center=true);

color("red")
translate([40,140,0])
cylinder(h=100,d=18,center=true);


color("red")
translate([42,165,0])
cylinder(h=100,d=17,center=true);

color("red")
translate([44,190,0])
cylinder(h=100,d=16,center=true);



color("red")
translate([45,215,0])
cylinder(h=100,d=15,center=true);

color("blue")
translate([60,5,0])
cube([15,5,10]);

color("blue")
translate([60+15+15,5,0])
cube([15,5,10]);

color("blue")
translate([60+15+15+15+15,5,0])
cube([15,5,10]);}



