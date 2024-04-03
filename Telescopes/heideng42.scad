$fn=50;
//opt-110c16m摄像头

//镜头前端
len_part1_diameter=46;
len_part1_length=5;

//对焦区域
len_part2_diameter=50;
len_part2_length=25;

//信息区域
len_part3_diameter=48;
len_part3_length=20;

//光圈区域
len_part4_diameter=50;
len_part4_length=35;

//固定位置
len_part5_diameter=48;
len_part5_length=20;

//转接区域
len_part6_diameter=48;
len_part6_length=5;


heideng42();

//模块
module heideng42(){
    
    rotate([0,90,0])
    {
//对接
//镜头前端
translate([0,0,len_part2_length+len_part3_length+len_part4_length+len_part5_length+len_part6_length]){
difference(){
    color("gray",0.4)
cylinder(h=len_part1_length,d=len_part1_diameter);
    translate([0,0,1])
cylinder(h=len_part1_length,d=len_part1_diameter-4);}
color("blue",0.5)
cylinder(h=2,d=len_part1_diameter-4);

}

//
//
////对焦区域
translate([0,0,len_part3_length+len_part4_length+len_part5_length+len_part6_length])
color("grey",0.7)
cylinder(h=len_part2_length,d=len_part2_diameter);
//
////信息区域
translate([0,0,len_part4_length+len_part5_length+len_part6_length]){
color("black",0.7)
cylinder(h=len_part3_length,d=len_part3_diameter);
 
    //固定环
       translate([0,0,-len_part3_length-len_part2_length])
    cylinder(h=5,d=len_part3_diameter+18);
    
           translate([0,0,-len_part3_length+5])
    cylinder(h=5,d=len_part3_diameter+18);
    
 //固定旋钮  
    translate([0,len_part3_diameter/2,len_part3_length/4])
    rotate([-90,0,0])
    color("silver")
   cylinder(h=8,d=4); 
    
    }
//
////光圈区域
translate([0,0,len_part5_length+len_part6_length]){
color("grey",0.7)
cylinder(h=len_part4_length,d=len_part4_diameter);

    translate([0,len_part4_diameter/2,len_part4_length/2])
    rotate([-90,0,0])
    color("silver")
   cylinder(h=8,d=4); 

}
//固定位置
translate([0,0,len_part6_length])
color("black",0.7)
cylinder(h=len_part5_length,d=len_part5_diameter);

//转接区域
translate([0,0,0])
color("white")
cylinder(h=len_part6_length,d1=len_part6_diameter-2,d2=len_part6_diameter);

}}