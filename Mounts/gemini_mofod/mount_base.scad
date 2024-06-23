$fn=200;
//////////////////////////////参数
//底座
base_tube_length=850;
base_tube_dimeter=254;
base_tube_thickness=3;
base_hole_cube_up_length=500;
base_hole_cube_up_width=180;
base_hole_cylinder_dimeter=10;

//支架
wing_height=850;
wing_thickness=5;
wing_wall_top_width=160;
base_hole_cylinder_angle=asin(0.5*(base_tube_dimeter-wing_wall_top_width-wing_thickness/2)/(wing_height-20-5));
equilateral_triangle_lenth=100;

//上支架平移
wing_move_length=-10;

//模块 -  安装望远镜的鸠尾槽
tail_for_telescope_width=160;
tail_for_telescope_thickness=28;
tail_for_telescope_cut1_length=85;
tail_for_telescope_cut2_length=100;
tail_for_telescope_cut3_thickness=20;
tail_for_telescope_angle=0;

//////////////////////////////外部控件
translate([-340+15,0,wing_height])
rotate([0,0,180])
color("red")
import("csf-25-xxx-2uh.stl");

translate([-340-170/2+5,5,wing_height-86/2])
color("red")
import("86CME120.stl");

//////////////////////////////基本代码


rotate([0,270,0]){


mount_base();

 translate([0,0,-340-wing_move_length])
rotate([0,90,0])
holder();

 translate([0,0,340+wing_move_length])
rotate([0,90,0])
    mirror([1,0,0])
holder_with_motor();
    
    translate([400,0,0])
    rotate([0,90,0])
    rasa14();
}
 
 
 /////////////////////////////Modules
 module mount_base(){

     
     
                       //下方孔
    translate([base_tube_dimeter/2-(base_tube_dimeter+8)*cos(45),0,0])
   
        cube([10,base_tube_dimeter,base_tube_dimeter],center=true);
     

     difference(){
              color("black")
cylinder(h=base_tube_length,d=base_tube_dimeter,center=true,$fn=200);
              color("grey")
cylinder(h=base_tube_length+10,d=base_tube_dimeter-2*base_tube_thickness,center=true,$fn=200);
 
    //上方孔
    translate([base_tube_dimeter/2,0,0])
cube([base_tube_dimeter,base_hole_cube_up_width,base_hole_cube_up_length],center=true);   
         
                           //下方孔
    translate([-base_tube_dimeter*cos(45),0,0])
   
        cube([base_tube_dimeter,base_tube_dimeter,base_tube_dimeter],center=true);


    //孔洞
    for(i=[-10:1:-1]){
        translate([0,0,40*i+20-5])
    rotate([90,0,base_hole_cylinder_angle]){
    cylinder(h=base_tube_dimeter,d=base_hole_cylinder_dimeter);}
        }

    
        for(i=[0:1:9]){
        translate([0,0,40*i+20+5])
    rotate([90,0,base_hole_cylinder_angle])
    cylinder(h=base_tube_dimeter,d=base_hole_cylinder_dimeter);}

    
    //孔洞-对面
    for(i=[-10:1:-1]){
        translate([0,0,40*i+20])
    rotate([90,0,180-base_hole_cylinder_angle])
    cylinder(h=base_tube_dimeter,d=base_hole_cylinder_dimeter);}
    

    
        for(i=[0:1:9]){
        translate([0,0,40*i+20])
    rotate([90,0,180-base_hole_cylinder_angle])
    cylinder(h=base_tube_dimeter,d=base_hole_cylinder_dimeter);}
    

    
    //穿线孔
    translate([base_tube_dimeter/2,0,base_tube_length/2-50])
    rotate([0,90,0])
    cylinder(h=base_tube_dimeter,d=40,center=true);
    
        translate([base_tube_dimeter/2,0,base_tube_length/2-120])
    rotate([0,90,0])
    cylinder(h=base_tube_dimeter,d=40,center=true);
    
        translate([base_tube_dimeter/2,0,-base_tube_length/2+50])
    rotate([0,90,0])
    cylinder(h=base_tube_dimeter,d=40,center=true);
    
    
            translate([base_tube_dimeter/2,0,-base_tube_length/2+120])
    rotate([0,90,0])
    cylinder(h=base_tube_dimeter,d=40,center=true);}
    
    
    
            //支架
     rotate([0,0,base_hole_cylinder_angle]){
     translate([-20-10/2,-base_tube_dimeter/2,-1*wing_move_length])
         color("grey")
 wing();}
  
        //支架镜像
        mirror([0,0,1])
        rotate([0,0,base_hole_cylinder_angle]){
     translate([-20-10/2,-base_tube_dimeter/2,-1*wing_move_length])
                     color("grey")
 wing();}
             //支架
     rotate([0,0,-1*base_hole_cylinder_angle]){
     translate([-20-10/2,5+base_tube_dimeter/2,-1*wing_move_length])
                  color("grey")
 wing();}
                    //支架镜像
    mirror([0,0,1])
     rotate([0,0,-1*base_hole_cylinder_angle]){
     translate([-20-10/2,5+base_tube_dimeter/2,-1*wing_move_length])
                  color("silver")
 wing();}
}


module wing(){
   rotate([90,90,0])
linear_extrude(5)
 difference()
    {
polygon(points=[
[60,0],
[340,0],
[500,160],
[340+80,wing_height],
[340,wing_height],
[340,400],
[60,50] 
]);
    //圆形空缺
    translate([130,70]){
    //circle(d=80);
            polygon(points=[
            [0,0],
            [equilateral_triangle_lenth,0],
            [equilateral_triangle_lenth/2,equilateral_triangle_lenth*cos(45)],
            ]);
    }
    translate([320,160])
    circle(d=180);
   
    //滑动安装孔
    translate([20+60,20])
        square([50,10]);
    translate([20+30+130,20])
        square([50,10]);
    translate([20+130+130,20])
        square([50,10]);
    
 
    //纵向固定孔
    translate([340+5+5+10,400+10+10/5-120]) 
        circle(d=10);   
    translate([340+5+5+10,400+10+10/5])
        circle(d=10);      
    translate([340+5+5+10,400+10+10/5+120])
        circle(d=10);  
    translate([340+5+5+10,400+10+10/5+120+120])
        circle(d=10);   
    translate([340+5+5+10,400+10+10/5+120+120+120])
        circle(d=10); 

 

     //横向固定孔
    
            
        translate([10+100,50+100])
        circle(d=10); 
            
        translate([10+100+100,50+100+100])
        circle(d=10); 
    
        translate([10+100+100+100,50+100+100+100])
        circle(d=10); 

    //远端竖向孔
  
    translate([500-15-20,160-20])
        circle(d=10); 
                
    translate([500-150*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+150*cos(atan((500-340-80)/(850-160)))])
        circle(d=10);   
  
      translate([500-300*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+300*cos(atan((500-340-80)/(850-160)))])
        circle(d=10);  
 
       translate([500-450*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+450*cos(atan((500-340-80)/(850-160)))])
        circle(d=10);   
  
         translate([500-600*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+600*cos(atan((500-340-80)/(850-160)))])
        circle(d=10);                 
                
 
   }
    
    
    }
    
  
module holder(){
    
    rotate([90,0,90]){
    linear_extrude(5){
    difference(){
    polygon(points=[
    [base_tube_dimeter/2,0],
    [wing_wall_top_width/2,base_tube_length*cos(base_hole_cylinder_angle)],
    [-wing_wall_top_width/2,base_tube_length*cos(base_hole_cylinder_angle)],
    [-1*base_tube_dimeter/2,0]
    ]);
        //去掉下面的圆面
    circle(d=base_tube_dimeter);
        }
    
    translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    circle(d=160);
   }
   translate([0,0,-50])
   linear_extrude(50){
           translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    circle(d=120);
   }

       
             translate([0,0,-40]){
 
           translate([0,base_tube_length*cos(base_hole_cylinder_angle),-10]) 
          rotate([180,0,-1*tail_for_telescope_angle])
           2047studio_dovetail_dule_saddle(195,2);
          }
          }
    }

module holder_with_motor(){

    rotate([90,0,90]){
    linear_extrude(5){
    difference(){
    polygon(points=[
    [base_tube_dimeter/2,0],
    [wing_wall_top_width/2,base_tube_length*cos(base_hole_cylinder_angle)],
    [-wing_wall_top_width/2,base_tube_length*cos(base_hole_cylinder_angle)],
    [-1*base_tube_dimeter/2,0]
    ]);
        //去掉下面的圆面
    circle(d=base_tube_dimeter);
        }
    
    translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    color("red")
    circle(d=160);
   }

    color("silver")
   translate([0,0,30-2]){
   linear_extrude(5){
           translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    circle(d=wing_wall_top_width);

   }}
  /* 
       color("silver")
   translate([0,0,-40]){
   linear_extrude(20){
           translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    circle(d=200);

   }}
  */ 
       color("silver")
      translate([0,0,-50]){
   linear_extrude(20){
           translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    circle(d=100);

   }}

   
      translate([0,0,-40]){
 
           translate([0,base_tube_length*cos(base_hole_cylinder_angle),-10]) 
          rotate([180,0,-1*tail_for_telescope_angle])
           2047studio_dovetail_dule_saddle(195,2);
          }
   
              
   
   
       }
   
    }    
 
module 2047studio_dovetail_dule_saddle(tail_for_telescope_length,position){
    
    if(position==1){
    //旋转把手
    translate([tail_for_telescope_width/2+20,0,tail_for_telescope_thickness/2])
    rotate([0,90,0])
    cylinder(h=15,d=30,center=true);
    
        translate([tail_for_telescope_width/2-5+10,0,tail_for_telescope_thickness/2])
    rotate([0,90,0])
    cylinder(h=15,d=8,center=true);}
    else
    {
          //旋转把手
    translate([-tail_for_telescope_width/2-20-40,tail_for_telescope_length/4,tail_for_telescope_thickness/2])
    rotate([0,90,0])
    cylinder(h=15,d=30,center=true);
    
        translate([-tail_for_telescope_width/2-5-20,tail_for_telescope_length/4,tail_for_telescope_thickness/2])
    rotate([0,90,0])
    cylinder(h=55,d=8,center=true);  
        
        translate([-tail_for_telescope_width/2-20-40,-tail_for_telescope_length/4,tail_for_telescope_thickness/2])
    rotate([0,90,0])
    cylinder(h=15,d=30,center=true);
    
        translate([-tail_for_telescope_width/2-5-20,-tail_for_telescope_length/4,tail_for_telescope_thickness/2])
    rotate([0,90,0])
    cylinder(h=55,d=8,center=true);  
        }
    
    //槽面
 
  
    color("red",0.8)
    translate([-tail_for_telescope_width/2,tail_for_telescope_length/2,])
    rotate([90,0,0])
linear_extrude(tail_for_telescope_length)
 polygon(points=[[0,0],[tail_for_telescope_width,0],
 
 //右上角
 [tail_for_telescope_width,tail_for_telescope_thickness],
 [tail_for_telescope_width-(tail_for_telescope_width-tail_for_telescope_cut1_length)/2,tail_for_telescope_thickness],
 
  [tail_for_telescope_width-(tail_for_telescope_width-tail_for_telescope_cut2_length)/2,
        tail_for_telescope_cut3_thickness],

    [tail_for_telescope_width/2+19,tail_for_telescope_cut3_thickness],
     
      [tail_for_telescope_width/2+22.5,tail_for_telescope_cut3_thickness-7],
      [tail_for_telescope_width/2-22.5,tail_for_telescope_cut3_thickness-7],
      [tail_for_telescope_width/2-19,tail_for_telescope_cut3_thickness],
      
    [(tail_for_telescope_width-tail_for_telescope_cut2_length)/2,tail_for_telescope_cut3_thickness],
    

    
     [(tail_for_telescope_width-tail_for_telescope_cut1_length)/2,tail_for_telescope_thickness],
 //左上角
  [0,tail_for_telescope_thickness],
 ]);
 
 }
 
 
 module rasa14(){
    cylinder(h=1100,d=500);
    }
    
    
    