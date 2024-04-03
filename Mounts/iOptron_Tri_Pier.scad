//三脚架 -- 参数
Tri_Pier_plate_width=210;
Tri_Pier_plate_thickness=10;
Tri_Pier_column_diameter=160;
Tri_Pier_column_height=600;

iOptron_Tri_Pier();
//三脚架的模块
module iOptron_Tri_Pier(){
//三脚架 -平面
color("black",0.4)
translate([0,0,-Tri_Pier_plate_thickness/2])
cube([Tri_Pier_plate_width,Tri_Pier_plate_width,Tri_Pier_plate_thickness],center=true);

//三脚架 -平面与立柱对接环
color("red")
translate([0,0,-1.5*Tri_Pier_plate_thickness])
cylinder(h=10,d=Tri_Pier_column_diameter+20,center=true);

//三脚架 -立柱
color("black",0.6)
translate([0,0,-Tri_Pier_column_height/2-Tri_Pier_plate_thickness])
cylinder(h=Tri_Pier_column_height,d=Tri_Pier_column_diameter,center=true);

//三脚架 -三脚架与立柱对接环
color("black")
translate([0,0,-200])
cylinder(h=30,d=Tri_Pier_column_diameter+40,center=true);

//三脚架 -三脚架的腿

for(i=[0,120,240])
    rotate([0,0,i]){
        translate([0,60,-600*cos(30)-90])
        color("black")
        cube([20,250,10]);  
translate([-25,600*sin(30)+Tri_Pier_column_diameter/2,-600*cos(30)-200]){ 
rotate([30,0,0])
    color("red")
cube([50,20,600]);}


    }
    
    //地面
    translate([-800,-800,-720])
cube([1600,1600,1]);
    
    }