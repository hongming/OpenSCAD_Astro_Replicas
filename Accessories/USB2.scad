usb2();

module usb2(){


color("silver")
difference(){
cube([12.1,16.6,10.75]);



translate([1,-1,1])
rotate([90,0,0])
linear_extrude(40,center=true

){
polygon([
[0,0],
[10,0],
[10,6.6],
[7.3,8.75],
[2.3,8.75],
[0,6.6]
]);}}

color("white")
translate([6.1-2.75,0,3.5])
cube([5.5,16.6,3.05]);

translate([0,8.6,0])
cube([12.1,8,10.75]);
}