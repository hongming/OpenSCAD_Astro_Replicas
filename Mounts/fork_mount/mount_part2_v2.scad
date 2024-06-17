//difference(){
//translate([0,250,0])
//cylinder(h=10,d=20,center=true);
//translate([0,250,0])
//cylinder(h=20,d=4,center=true);}

 difference(){
linear_extrude(6)
polygon(points=[
[-35,0],
[35,0],
[10,250],
[-10,250]
]);

translate([0,70,0])
cylinder(h=20,d=40,center=true);

translate([0,120,0])
cylinder(h=20,d=30,center=true);

//translate([0,160,0])
//cylinder(h=20,d=25,center=true);

color("red")
translate([0,200,0])
cylinder(h=20,d=20,center=true);



color("red")
translate([0,200-1+5+20+50,5])
//translate([0,0,0])
cube([42,42+10+40+100,42],center=true);
 

translate([0,230,0])
cylinder(h=20,d=10,center=true);

translate([0,0,5])
cylinder(h=20,d=70,center=true);

translate([0,250,0])
cylinder(h=20,d=4,center=true);
 }
 
 
 
 
 

color("blue")
translate([0,200-2.5-42/2-1, 5])
cube([42,5,84],center=true);

color("red")
translate([0,200-2.5-42/2-1-5, 5-2.5])
cube([42,5,30],center=true);

color("blue")
translate([0,200-2.5-42/2-1-5-5, 5-2.5])
cube([42,5,20],center=true);


color("red")
translate([0,200-2.5-42/2-1-5-5-5, 5-2.5])
cube([42,5+5+5,10],center=true);

//
//color("red")
//translate([0,200-2.5-42/2-1-5-5-5-5-2.5, 5-2.5])
//cube([42,0.01,100],center=true);






color("red")
translate([0,200-2.5-42/2-1-5-5, 5-2.5-25-5])
cube([42,5+10,30-14],center=true);

translate([0,0,-30]){
 difference(){
linear_extrude(6)
polygon(points=[
[-35,0],
[35,0],
[10,250],
[-10,250]
]);

translate([0,70,0])
cylinder(h=20,d=40,center=true);

translate([0,120,0])
cylinder(h=20,d=30,center=true);

//translate([0,160,0])
//cylinder(h=20,d=25,center=true);

color("red")
translate([0,200,0])
cylinder(h=20,d=20,center=true);



color("red")
translate([0,200-1+5+20+50,5])
//translate([0,0,0])
cube([42,42+10+40+100,42],center=true);
 

translate([0,230,0])
cylinder(h=20,d=10,center=true);

translate([0,0,5])
cylinder(h=20,d=70,center=true);

translate([0,250,0])
cylinder(h=20,d=4,center=true);
 }
}