$fn=100;

rotate([0,0,0]){
    




translate([2,0,0])
difference(){
    //激光头前面的固定板
cube([4,33,31],center=true);
    //激光头前面的孔位
rotate([0,90,0]){
cylinder(h=20,d=15,center=true);
translate([12,12,0])
    cylinder(h=20,d=5,center=true);
translate([-12,12,0])
    cylinder(h=20,d=5,center=true);
translate([12,-12,0])
    cylinder(h=20,d=5,center=true);
translate([-12,-12,0])
    cylinder(h=20,d=5,center=true);}}
   
    translate([2,0,0])
   color("red")
    translate([0,0,-31/2-3-1])
   cube([4,33,6+2],center=true) ;
    
    translate([2,0,0])
translate([0,0,-6-31/2-6-2
    ])
difference(){
cube([4,72,12],center=true);
    
    translate([0,30,2.5])
    rotate([0,90,0])
cylinder(h=20,d=4,center=true);
    
        translate([0,-30,2.5])
    rotate([0,90,0])
cylinder(h=20,d=4,center=true);}}