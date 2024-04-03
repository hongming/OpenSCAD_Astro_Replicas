
celestron_losmandy_style_dovetail_bar(100);
//鸠尾板
module celestron_losmandy_style_dovetail_bar(main_tube_lenght){

color("black")
translate([0,20,0]){
for(i=[[20,0,12.7],[80,0,12.7],
   [20,0,main_tube_lenght+70-12.7],[80,0,main_tube_lenght+70-12.7] 
])    
translate(i)    
    rotate([90,0,0])
    cylinder(h=20,d=10,center=true);

translate([50,0,25.4])    
    rotate([90,0,0])
    cylinder(h=20,d=6,center=true);

translate([50,0,main_tube_lenght-25.4+70])    
    rotate([90,0,0])
    cylinder(h=20,d=6,center=true);
}
    
    //鸠尾板
color("DarkOrange")
linear_extrude(height=main_tube_lenght+70){

    difference(){
 polygon(points=[[0,0],[100,0],[100,20],[85,20],[91.5,27],[8.5,27],[15,20],[0,20]
 ]);
 
 translate([50,-135+6])
 circle(r=135);}}
 
 translate([0,20,0])
 color("SandyBrown")
 cube([100,0.5,main_tube_lenght]);
    }