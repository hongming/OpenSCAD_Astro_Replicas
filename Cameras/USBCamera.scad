
use <../Accessories/usb3.scad>
use <../Accessories/telescope_tail.scad>
use <../Telescopes/OPT110C16M.scad>


usbcamera();
module usbcamera(){
translate([-25,0,0])
rotate([0,0,90]){
translate([-20,-25,-20]) 
color("black")
cube([40,50,40]);
    
    
    translate([20,-25,-20])
    {
                   color("blue")
        cube([0.1,50,40]);
        }
        
            translate([-20.1,-25,-20])
    {
                   color("blue")
        cube([0.1,50,40]);
        }

    translate([-20,-25,-20])
    {
        cube([0.1,50,40]);
        }    
        
        translate([-20,-25,-20])
        {
            color("white")
            cube([40,0.2,40]);
            }
translate([-5,8,0])
usb3();}}