$fn=100;
asi585mc();
module asi585mc(){
translate([0,0,5.75])
color("black")
difference(){
cylinder(h=11.5,d=50.8,center=true);
translate([0,0,-2])
cylinder(h=30,d=42,center=true);
}

translate([0,0,5.75])
color("white")
difference(){
cylinder(h=11.5,d=42,center=true);
translate([0,0,-2])
cylinder(h=30,d=41,center=true);
}

translate([0,0,-15.7])
color("red")
difference(){
cylinder(h=31.4,d=62,center=true);

translate([0,0,-2])
for(i=[-5:-1.5:-11]){
   translate([0,0,i])
cylinder(h=1,d=80,center=true); 
    }
    
translate([0,0,-4.5]) 
cylinder(h=0.5,d=80,center=true); 
    
translate([0,0,13]) 
cylinder(h=0.5,d=80,center=true); 
    
    //中间1/4英寸孔
    translate([0,0,-20])
    cylinder(h=20,d=5,center=true);
    
   //边缘安装孔
    translate([28*sin(45),28*sin(45),-20])
    cylinder(h=20,d=3,center=true); 
        translate([-28*sin(45),28*sin(45),-20])
    cylinder(h=20,d=3,center=true); 
        translate([28*sin(45),-28*sin(45),-20])
    cylinder(h=20,d=3,center=true); 
        translate([-28*sin(45),-28*sin(45),-20])
    cylinder(h=20,d=3,center=true); 
}


//边缘安装立柱

    //中间1/4英寸孔
    translate([0,0,-20])
color("black")
    cylinder(h=20,d=5,center=true);
//四边
color("silver"){
    translate([28*sin(45),28*sin(45),-20])
    cylinder(h=20,d=4,center=true); 
        translate([-28*sin(45),28*sin(45),-20])
    cylinder(h=20,d=4,center=true); 
        translate([28*sin(45),-28*sin(45),-20])
    cylinder(h=20,d=4,center=true); 
        translate([-28*sin(45),-28*sin(45),-20])
    cylinder(h=20,d=4,center=true); }

//立柱结束
translate([30-4,0,-15.7-9])
color("blue")
cube([10,10,12],center=true);


translate([-30+4,0,-15.7-9+0.5])
color("blue")
cube([10,10,10],center=true);


//LOGO文字
translate([-8,16,-31.0])
color("white")
rotate([0,180,180])
text("ZWO",size=5,direction="ltr");

//LOGO文字
translate([-10,-16,-31.0])
color("white")
rotate([0,180,180])
text("ASI585MC",size=3,direction="ltr");}