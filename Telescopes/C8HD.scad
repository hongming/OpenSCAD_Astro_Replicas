$fn=400;


use <../EAFs/ZWO-EAF-2.scad>;
use <../Cameras/Tupu2600MC.scad>;
use <../Accessories/celestron_losmandy_style_dovetail_bar.scad>;

//中间镜筒长度
main_tube_lenght=300;
main_tube_diameter=210;

//显示
c8hd();

module c8hd(){
//摄像头
translate([0,0,-main_tube_lenght-200-125]){
    translate([0,0,215])
    color("orange")
cylinder(h=15,d=64,center=true);
     translate([0,0,160])
    color("black")
    cylinder(h=135,d=54,center=true);
tupu2600mc();
    
    }

 
//EAF电动调焦
translate([50,0,0])
translate([55,-30,-main_tube_lenght-50-20-50-35]){
    translate([-35,20,26])
        color("grey")
        cylinder(h=40,d=20,center=true);
rotate([-90,0,90])
eaf();
    }
    

//Camera Adapter
color("black")
cylinder(h=4,d=76);
color("grey")
cylinder(h=15,d=62);
//color("black")
//cylinder(h=72.8,d=54);

//Tube_front_adapter

difference(){
    color("black")
cylinder(h=60,d=214);
    color("grey")
cylinder(h=80,d=main_tube_diameter);}
    color("LightSkyBlue",0.8)
cylinder(h=0.5,d=main_tube_diameter);

//压镜环

difference(){
        color("grey")
cylinder(h=3,d=main_tube_diameter);
difference([0,0,-5])

cylinder(h=20,d=main_tube_diameter-30);}

//Tube
translate([0,0,-1*main_tube_lenght]){
color("LightCyan")
cylinder(h=main_tube_lenght,d=main_tube_diameter);
    translate([0,0,-60])
        color("black")
cylinder(h=60,d=214);
        translate([0,0,-80-25])
        color("grey")
cylinder(h=45,r1=main_tube_diameter/2-5,r2=main_tube_diameter/2);
    }
    
    
    translate([-50,main_tube_diameter/2-5,-main_tube_lenght-40])
celestron_losmandy_style_dovetail_bar(main_tube_lenght);
    
//    mirror([0,1,0])
//    {
//            translate([-50,main_tube_diameter/2,-main_tube_lenght-40])
//losmandy_tail(main_tube_lenght);
//        }
    

   
//把手
    color("black")
    translate([-50,90,-1*main_tube_lenght-155])
difference(){
cube([100,10,50]);
translate([10,-5,10])
cube([80,20,30]);
}    }