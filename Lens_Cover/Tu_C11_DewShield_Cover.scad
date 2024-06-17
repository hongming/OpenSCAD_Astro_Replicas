$fn=3600;

//外部直径
Out_Diameter=317;
//外部高度
Out_height=20;

//露盾直径
Dew_shield_Diameter=315;
//内部高度
Dew_shield_height=100;




//3毫米厚的白色PVC板
           color("white",0.7)
        translate([0,0,-3]) 
        cylinder(h=1,d=Dew_shield_Diameter,center=false);








for(i=[0,1,2])
{
   rotate([0,0,i*120])
part(); 
    }

       module part(){
difference(){
    union()
    {
    //盖子圆柱主体
    difference(){
    //外部
    translate([0,0,-Out_height])
    cylinder(h=Out_height,d1=Out_Diameter,d2=Out_Diameter,center=false);

    //内部
    color("white")
    translate([0,0,-Dew_shield_height])
    cylinder(h=Dew_shield_height*2,d=Dew_shield_Diameter,center=false);
        }
     
    
    //用于粘贴PVC原片的底盘  
        translate([0,0,-1])
        difference(){
        cylinder(h=1,d=Dew_shield_Diameter,center=false);
            translate([0,0,-10])
        cylinder(h=Dew_shield_height*2,d=Dew_shield_Diameter-20,center=false);}

        

        

      
       //外部遮挡-把手  -去掉螺丝孔
        
        difference(){
        
        
     //外部遮挡-把手  
    rotate([0,0,-5])
     difference(){
    translate([0,0,-Out_height])
        difference(){
    //外部
    translate([0,0,-Out_height])
    cylinder(h=Out_height*2,d1=Out_Diameter+10,d2=Out_Diameter+2,center=false);

    //内部
    color("white")
    translate([0,0,-Dew_shield_height])
    cylinder(h=Dew_shield_height*2,d=Dew_shield_Diameter,center=false);
        }
        
        
        translate([0,0,-Out_Diameter/3]){
        //移出角度-1
        translate([-Out_Diameter/2-5,-Out_Diameter,0])
        cube([Out_Diameter+10,Out_Diameter,Out_Diameter/2]);
        //移出角度-2
        rotate([0,0,10])
            translate([-Out_Diameter/2-5,0,0])
        cube([Out_Diameter+10,Out_Diameter,Out_Diameter/2]);}
      }
      
      
       //螺母最长对角
     hexagonal_length=8;
     hexagonal_height=3;
      translate([Dew_shield_Diameter/2-0.5,0,-Out_height*2+ 10])
     rotate([90,0,90])
     cylinder(hexagonal_height,hexagonal_length,hexagonal_length,$fn=6);
      //螺母-转孔
       hexagonal_length_hole=4;
     hexagonal_height_hole=50;
      translate([Dew_shield_Diameter/2-0.5,0,-Out_height*2+ 10])
     rotate([90,0,90])
     cylinder(hexagonal_height_hole,hexagonal_length_hole,hexagonal_length_hole,$fn=6);
      
      
      }

 }
 
 
 
 //切割
  rotate([0,0,60-5])
  translate([-200,0,-50])
cube([400,400,100]);
  
    rotate([0,0,10-5])
  translate([-200,0,-50])
cube([400,400,100]);
 
 }}