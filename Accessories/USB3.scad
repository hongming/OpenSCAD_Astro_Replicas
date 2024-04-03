usb3();

module usb3(){


color("white")
difference(){
cube([12.1,18.45,12.92]);



translate([1,-1,1])
rotate([90,0,0])
linear_extrude(40,center=true

){
polygon([
[0,0],
[10,0],
[10,6.6],
[8.5,8.75],
    [8.5,11.5],
    [1.5,11.5],
[1.5,8.75],
[0,6.6]
]);
    
    }}

color("blue")
translate([6.1-2.75,0,3.5])
cube([5.5,18.45,3.05]);

color("blue")
translate([6.1-2.75,0,10.5])
cube([5.5,18.45,1.5]);

color("black")
translate([0,8,0])
cube([12.1,8,12.92]);
}