difference(){


translate([0,-5-2.5,0]){
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

//color("blue")
//translate([40,140,0])
//cylinder(h=100,d=18,center=true);


//color("blue")
//translate([42,165,0])
//cylinder(h=100,d=17,center=true);

color("blue")
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
cube([15,5,10]);

}
}



color("red")
translate([0,200-2.5-42/2-1-5-5-5-5-2.5+5+10+50-1, 5-2.5])
cube([200,0.01+10+20+100,100],center=true);

}
