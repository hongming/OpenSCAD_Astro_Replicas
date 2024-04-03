//use <../Accessories/telescope_tail.scad>
use <heideng42.scad>
use <../Cameras/asi585.scad>
use <../Accessories/dovetail_bar.scad>
use <../Accessories/dovetail_saddle.scad>

widecamera146mm();

module widecamera146mm(){

translate([-75,0,0]){
rotate([0,90,0]){
asi585mc();
    translate([0,0,10])
    color("black")
    cylinder(h=30,d=45);}
    translate([40,0,0])
heideng42();}

translate([-35,0,-45]){
    rotate([0,0,90])
dovetail_bar(150);}

translate([-35,0,-35-10-10]){
rotate([0,0,90])
dovetail_saddle(60);}
}
