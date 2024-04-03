use <../Accessories/losmandy_style_dovetail_saddle.scad>
use <OPT110C16M.scad>
use <../Cameras/usbcamera.scad>


widecamera16mm();

module widecamera16mm(){

translate([-33,0,0]){
rotate([0,90,0]){
    rotate([0,-90,0])
usbcamera();

    }
 
opt110c16m();}

translate([0,0,32])
rotate([0,0,-90])
losmandy_style_dovetail_saddle(40,1);


}
