difference(){
translate([0,250,0])
cylinder(h=10,d=20,center=true);
translate([0,250,0])
cylinder(h=20,d=4,center=true);}

difference(){
linear_extrude(5)
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

translate([0,160,0])
cylinder(h=20,d=25,center=true);

translate([0,200,0])
cylinder(h=20,d=20,center=true);


translate([0,230,0])
cylinder(h=20,d=10,center=true);

translate([0,0,5])
cylinder(h=20,d=70,center=true);

translate([0,250,0])
cylinder(h=20,d=4,center=true);
}