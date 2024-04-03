usb2a();

module usb2a(){


color("silver")
    difference(){
cube([12.5,13.7,7]);
translate([0.5,-1,0.8])
cube([11,16,5.12]);}
color("white")
translate([1,0,3.5])
cube([10,13,1.84]);
translate([0,8,0])
color("grey",0.5)
cube([12.5,5,7]);
}