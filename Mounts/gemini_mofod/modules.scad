/////////////////////////////Modules
 include <config.scad>;
 include <../../Telescopes/RASA11.scad>;
 
module mount_base(){
    
                       //下方半圆的对接平面
    translate([-base_tube_thickness/2-15,0,0])
        color("grey")
        cube([base_tube_thickness,base_tube_dimeter,base_tube_length+10],center=true);
     

  difference(){
              color("black")
            cylinder(h=base_tube_length,d=base_tube_dimeter,center=true);
              color("grey")
            cylinder(h=base_tube_length+15,d=base_tube_dimeter-2*base_tube_thickness,center=true);
 
    //上方孔
    translate([base_tube_dimeter/2,0,0])
        cube([base_tube_dimeter,base_hole_cube_up_width,base_hole_cube_up_length],center=true);   
         
    //下方孔
    translate([-base_tube_dimeter/2-15,0,0])   
        cube([base_tube_dimeter,base_tube_dimeter,base_tube_length*2],center=true);


    //孔洞
    for(i=[-10:1:-1]){
        translate([0,0,40*i+20-5])
        rotate([90,0,base_hole_cylinder_angle]) 
        cylinder(h=base_tube_dimeter,d=base_hole_cylinder_dimeter);}
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
        cylinder(h=base_tube_dimeter,d=40,center=true);

  }
    
 
    
            //支架
     rotate([0,0,base_hole_cylinder_angle]){
     translate([-20-10/2,-base_tube_dimeter/2-5,-1*wing_move_length])
                              color("grey")
         mirror([0,1,0])
 wing_support();}
  
        //支架镜像
        mirror([0,0,1])
        rotate([0,0,base_hole_cylinder_angle]){
     translate([-20-10/2,-base_tube_dimeter/2-5,-1*wing_move_length])
                     color("grey")
            mirror([0,1,0])
 wing_with_motor();}
 
 
             //支架
     rotate([0,0,-1*base_hole_cylinder_angle]){
     translate([-20-10/2,wing_thickness+base_tube_dimeter/2,-1*wing_move_length])
                  color("grey")
         
 wing_support();}
                    //支架镜像
    mirror([0,0,1])
     rotate([0,0,-1*base_hole_cylinder_angle]){
     translate([-20-10/2,wing_thickness+base_tube_dimeter/2,-1*wing_move_length])
                  color("grey")
 wing_with_motor();}
 
 
  
}



 
module wing_with_motor(){
   rotate([90,90,0]){
linear_extrude(wing_thickness){
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
    //底部三角形圆形空缺
    translate([130,70]){
            polygon(points=[
            [0,0],
            [equilateral_triangle_length,0],
            [equilateral_triangle_length/2,equilateral_triangle_length*cos(45)],
            ]);
    }
    //底部圆形空缺-大
    translate([320,160])
        circle(d=180);

    //底部圆形空缺-小
    translate([320+105,160+100])
        circle(d=80); 
    
    //上部三角形
    
   
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

 

     //近端-横向固定孔        
                union(){
        translate([10+100+50+10,50+100+10])
        circle(d=10);  
        translate([10+100+130,50+100+100])
        circle(d=10); 
        translate([10+100+100+100+10,50+100+100+100])
        circle(d=10); }

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


//三角形漏洞组
         union()
         {
         //近端从下数第一个三角形
         translate([340+5+5+10+10,400+10+10/5+100+10,0])
        rotate([0,0,270])
        color("blue")
                        polygon(points=[
                    [0,0],
                    [100,0],
                    [50,100*cos(45)],
                    ]);
                    
         //远端从下数第一个三角形
         translate([340+5+5+10+10+60,400+10+10/5-100+10,0])
        rotate([0,0,90])
        color("green")
                        polygon(points=[
                    [0,-10],
                    [100,0],
                    [0,30+100*cos(45)],
                    ]);
                    
          //近端从下数第二个三角形
         translate([340+5+5+10+10,400+10+10/5+2*equilateral_triangle_length+10+20,0])
        rotate([0,0,270])
        color("red")
                        polygon(points=[
                    [0,0],
                    [100,0],
                    [50,80*cos(45)],
                    ]);
          
         //远端从下数第二个三角形
         translate([340+5+5+10+10+70,400+10+10/5+60+10,0])
        rotate([0,0,90])
        color("red")
                        polygon(points=[
                    [0,-5],
                    [100,10],
                    [50,90*cos(45)],
                    ]);
                  
                  
          //近端从下数第三个三角形
         translate([340+5+5+10+10,400+10+10/5+2*100+120+10+20,0])
        rotate([0,0,270])
        color("blue")
                        polygon(points=[
                    [0,0],
                    [100,0],
                    [50,70*cos(45)],
                    ]);
                    
           //远从下数第三个三角形
         translate([340+5+5+10+10+50,400+10+10/5+150+10+20,0])
        rotate([0,0,90])
        color("blue")
                        polygon(points=[
                    [20,0],
                    [100,5],
                    [60,60*cos(45)],
                    ]);}

                
 
   }
   
   }
    
   
  
        //近端-横向固定孔-支架
                union(){
        translate([10+100+50+10,50+100+10,-5])
            linear_extrude(130)
            circle(d=10);  
        translate([10+100+130,50+100+100,-5])
            linear_extrude(130)
            circle(d=20); 
        translate([10+100+100+100+10,50+100+100+100,-5])
            linear_extrude(130)
            circle(d=10); }
        
   
       //远端竖向孔-支架
  union(){
    translate([500-15-20,160-20,-5])
      linear_extrude(130)
        circle(d=20); 
                
    translate([500-150*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+150*cos(atan((500-340-80)/(850-160))),-5])
      linear_extrude(125)
        circle(d=10);   
  
      translate([500-300*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+300*cos(atan((500-340-80)/(850-160))),-5])
      linear_extrude(120)
        circle(d=10);  
 
       translate([500-450*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+450*cos(atan((500-340-80)/(850-160))),-5])
      linear_extrude(110)
        circle(d=10);   
  
         translate([500-600*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+600*cos(atan((500-340-80)/(850-160))),-5])
      linear_extrude(100)
        circle(d=10);          }    
   
   
    }
  
}
 
 
module wing_support(){
   rotate([90,90,0]){
linear_extrude(wing_thickness){
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
    //底部三角形圆形空缺
    translate([130,70]){
            polygon(points=[
            [0,0],
            [equilateral_triangle_length,0],
            [equilateral_triangle_length/2,equilateral_triangle_length*cos(45)],
            ]);
    }
    //底部圆形空缺-大
    translate([320,160])
        circle(d=180);

    //底部圆形空缺-小
    translate([320+105,160+100])
        circle(d=80); 
   
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

 

     //近端横向固定孔
        union(){
        translate([10+100+50+10,50+100+10])
        circle(d=10);  
        translate([10+100+130,50+100+100])
        circle(d=10); 
        translate([10+100+100+100+10,50+100+100+100])
        circle(d=10); }

    //远端竖向孔
    union(){
    translate([500-15-20,160-20])
        circle(d=10); 
                
    translate([500-150*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+150*cos(atan((500-340-80)/(850-160)))])
        circle(d=10);   
  
      translate([500-300*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+300*cos(atan((500-340-80)/(850-160)))])
        circle(d=10);  
 
       translate([500-450*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+450*cos(atan((500-340-80)/(850-160)))])
        circle(d=10);   
  
         translate([500-600*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+600*cos(atan((500-340-80)/(850-160)))])
        circle(d=10);}            
       


//三角形漏洞组
         union()
         {
         //近端从下数第一个三角形
         translate([340+5+5+10+10,400+10+10/5+100+10,0])
        rotate([0,0,270])
        color("blue")
                        polygon(points=[
                    [0,0],
                    [100,0],
                    [50,100*cos(45)],
                    ]);
                    
         //远端从下数第一个三角形
         translate([340+5+5+10+10+60,400+10+10/5-100+10,0])
        rotate([0,0,90])
        color("green")
                        polygon(points=[
                    [0,-10],
                    [100,0],
                    [0,30+100*cos(45)],
                    ]);
                    
          //近端从下数第二个三角形
         translate([340+5+5+10+10,400+10+10/5+2*equilateral_triangle_length+10+20,0])
        rotate([0,0,270])
        color("red")
                        polygon(points=[
                    [0,0],
                    [100,0],
                    [50,80*cos(45)],
                    ]);
          
         //远端从下数第二个三角形
         translate([340+5+5+10+10+70,400+10+10/5+60+10,0])
        rotate([0,0,90])
        color("red")
                        polygon(points=[
                    [0,-5],
                    [100,10],
                    [50,90*cos(45)],
                    ]);
                  
                  
          //近端从下数第三个三角形
         translate([340+5+5+10+10,400+10+10/5+2*100+120+10+20,0])
        rotate([0,0,270])
        color("blue")
                        polygon(points=[
                    [0,0],
                    [100,0],
                    [50,70*cos(45)],
                    ]);
                    
           //远从下数第三个三角形
         translate([340+5+5+10+10+50,400+10+10/5+150+10+20,0])
        rotate([0,0,90])
        color("blue")
                        polygon(points=[
                    [20,0],
                    [100,5],
                    [60,60*cos(45)],
                    ]);}        
 
   }
    
   
   
   }
   
   
   
   
        //近端横向固定孔-支架
        union(){
        translate([10+100+50+10,50+100+10,-5])
            linear_extrude(130)
            circle(d=10);  
        translate([10+100+130,50+100+100,-5])
            linear_extrude(130)
            circle(d=20); 
        translate([10+100+100+100+10,50+100+100+100,-5])
            linear_extrude(130)
            circle(d=10); }
        
   
       //远端竖向孔-支架
  
    union(){
    translate([500-15-20,160-20,-5])
                linear_extrude(130)
        circle(d=20); 
                
    translate([500-150*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+150*cos(atan((500-340-80)/(850-160))),-5])
 
        linear_extrude(125)
        circle(d=10);   
  
      translate([500-300*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+300*cos(atan((500-340-80)/(850-160))),-5])
 
        linear_extrude(120)
        circle(d=10);  
 
       translate([500-450*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+450*cos(atan((500-340-80)/(850-160))),-5])
 
        linear_extrude(110)
        circle(d=10);   
  
         translate([500-600*sin(atan((500-340-80)/(850-160)))-10*cos(atan((500-340-80)/(850-160))),160+600*cos(atan((500-340-80)/(850-160))),-5])
 
        linear_extrude(100)
        circle(d=10);}  
   
   }
    
    }  
 
 
module holder(){
    
 
    rotate([90,0,90]){
  
    linear_extrude(wing_thickness){
    difference(){
    polygon(points=[
    [base_tube_dimeter/2,0],
    [wing_wall_top_width/2,wing_height*cos(base_hole_cylinder_angle)],
    [-wing_wall_top_width/2,wing_height*cos(base_hole_cylinder_angle)],
    [-1*base_tube_dimeter/2,0]
    ]);
        //去掉下面的圆面
    circle(d=base_tube_dimeter);
         //新增的圆形漏洞
          translate([0,base_tube_dimeter])
            circle(d=base_tube_dimeter*0.6);   
          translate([0,base_tube_dimeter*1.8])
            circle(d=base_tube_dimeter*0.5);   
          translate([0,base_tube_dimeter*2.5])
            circle(d=base_tube_dimeter*0.4); 
        
        //新增的三角形漏洞
           translate([-90,120,0])
           color("red")
           polygon(points=[
           [0,0],
           [80*sin(60),30],
              [2,80],
           ]);
           
           mirror([1,0,0])
              translate([-90,120,0])
           color("red")
           polygon(points=[
           [0,0],
           [80*sin(60),30],
              [2,80],
           ]);
           
           
              translate([-80,320,0])
           color("red")
           polygon(points=[
           [0,0],
           [70*sin(60),40],
              [2,80],
           ]);
           
           mirror([1,0,0])
                 translate([-80,320,0])
           color("red")
           polygon(points=[
           [0,0],
           [70*sin(60),40],
              [2,80],
           ]);
           
           
                 translate([-70,510,0])
           color("red")
           polygon(points=[
           [0,0],
           [60*sin(60),40],
              [2,80],
           ]);
           
           mirror([1,0,0])
                    translate([-70,510,0])
           color("red")
           polygon(points=[
           [0,0],
           [60*sin(60),40],
              [2,80],
           ]);   
        
        
        }
    
    translate([0,wing_height*cos(base_hole_cylinder_angle)])
    circle(d=160);
   }
   
   translate([0,wing_height,-11])
rotate([0,0,180])
color("blue")
XRU8022_cross_roller_bearing();
 
          color("silver")
      translate([0,0,-40]){
   linear_extrude(20){
           translate([0,wing_height*cos(base_hole_cylinder_angle)])
    circle(d=100);

   }}
 
 /*  
   //要替换掉
   translate([0,0,-50])
   color("red")
   linear_extrude(50){
           translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    circle(d=120);
   }

 */     
             translate([0,0,-40+10]){
 
           translate([0,wing_height*cos(base_hole_cylinder_angle),-10]) 
          rotate([180,0,-1*tail_for_telescope_angle+180-rasa_array_angle])
           2047studio_dovetail_dule_saddle(195,2);
          }
          }
    }
 

module holder_with_motor(){
    
        translate([0,0,0]){
    //叉臂上的
    translate([28,0,wing_height])
    rotate([0,0,0]){
    color("grey")
    csf_25_100_2uh();
        }


    translate([180/2+20,5,wing_height-86/2]){
    color("black")
        rotate([0,0,180])
    86cme85_180();
        }
 
    translate([-12,0,wing_height])
    rotate([0,90,0])
    color("blue")
    XRU8022_cross_roller_bearing();
    }

    rotate([90,0,90]){

//竖立面-开始
    linear_extrude(wing_thickness){
    difference(){
    polygon(points=[
    [base_tube_dimeter/2,0],
    [wing_wall_top_width/2,wing_height*cos(base_hole_cylinder_angle)],
    [-wing_wall_top_width/2,wing_height*cos(base_hole_cylinder_angle)],
    [-1*base_tube_dimeter/2,0]
    ]);
        //去掉下面的圆面
    circle(d=base_tube_dimeter);
        
         //新增的圆形漏洞
          translate([0,base_tube_dimeter])
            circle(d=base_tube_dimeter*0.6);   
          translate([0,base_tube_dimeter*1.8])
            circle(d=base_tube_dimeter*0.5);   
          translate([0,base_tube_dimeter*2.5])
            circle(d=base_tube_dimeter*0.4); 
        
        //新增的三角形漏洞
           translate([-90,120,0])
           color("red")
           polygon(points=[
           [0,0],
           [80*sin(60),30],
              [2,80],
           ]);
           
           mirror([1,0,0])
              translate([-90,120,0])
           color("red")
           polygon(points=[
           [0,0],
           [80*sin(60),30],
              [2,80],
           ]);
           
           
              translate([-80,320,0])
           color("red")
           polygon(points=[
           [0,0],
           [70*sin(60),40],
              [2,80],
           ]);
           
           mirror([1,0,0])
                 translate([-80,320,0])
           color("red")
           polygon(points=[
           [0,0],
           [70*sin(60),40],
              [2,80],
           ]);
           
           
                 translate([-70,510,0])
           color("red")
           polygon(points=[
           [0,0],
           [60*sin(60),40],
              [2,80],
           ]);
           
           mirror([1,0,0])
                    translate([-70,510,0])
           color("red")
           polygon(points=[
           [0,0],
           [60*sin(60),40],
              [2,80],
           ]);   
        
        }
    
    translate([0,wing_height*cos(base_hole_cylinder_angle)])
    circle(d=wing_wall_top_width);
   }
   
//竖立面-结束   
   
   
    //用于支撑电机的圆板
    translate([0,0,30+20+5]){
    linear_extrude(wing_thickness)
       translate([0,wing_height*cos(base_hole_cylinder_angle)])
        circle(d=wing_wall_top_width); 
                            }
    //用于支撑电机的螺丝
 
    linear_extrude(60)
       translate([0,wing_height*cos(base_hole_cylinder_angle)])
        {
            for(i=[0:1:5])
                rotate([0,0,60*i])
                    translate([wing_wall_top_width/2-10,0,0])
                        circle(d=8); }



       color("silver")
      translate([0,0,-50+10]){
   linear_extrude(20){
           translate([0,wing_height*cos(base_hole_cylinder_angle)])
    circle(d=100);

   }}

   
      translate([0,0,-40+10]){
 
           translate([0,wing_height*cos(base_hole_cylinder_angle),-10]) 
          rotate([180,0,-1*tail_for_telescope_angle+180-rasa_array_angle])
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
 
 /*
 module rasa11(){
    cylinder(h=900,d=330);
     translate([0,0,900])
        cylinder(h=150,d=90);
    }
 */

 module rasa11_array(){
    
    rotate([90,0,90-rasa_array_angle]){
        
        color("grey"){
         cube([140,700,40],center=true);
            translate([0,350,0])
                cube([240,20,100],center=true);
            translate([0,175,0])
                cube([240,100,100],center=true);
            translate([0,-175,0])
                cube([240,100,100],center=true);
            translate([0,-350,0])
                cube([240,20,100],center=true);}
        
         translate([-300,330/2+10,330/2+10+50])
        rotate([0,90,0]){
            translate([0,0,700])
            rotate([0,0,90])
            RASA11(2);
            
            /*    cylinder(h=900,d=330);
                translate([0,0,900])
                cylinder(h=150,d=90);
            */
            }

         translate([-300,330/2+10,-330/2-10-50])
        rotate([0,90,0]){
            translate([0,0,700])
                        rotate([0,0,90])
            RASA11(1);
            }


         translate([-300,-330/2-10,330/2+10+50])
        rotate([0,90,0]){
            translate([0,0,700])
                        rotate([0,0,90])
            RASA11(2);
            }

         translate([-300,-330/2-10,-330/2-10-50])
        rotate([0,90,0]){
            translate([0,0,700])
                        rotate([0,0,90])
            RASA11(1);
            }
            } 
     }
    
    
//交叉轴承
module XRU8022_cross_roller_bearing(){
color("silver")
difference(){cylinder(h=22,d=165,center=true);
cylinder(h=24,d=80,center=true);
for(i=[0:36:360]){
    rotate([0,0,i])
    translate([0,74,0]){
        cylinder(h=24,d=9.5,center=true);
        }
    }
for(i=[0:36:360]){
    rotate([0,0,i])
    translate([0,48,0]){
        cylinder(h=24,d=6,center=true);
        }
    }
    
    
    
    difference(){cylinder(h=24,d=125,center=true);
cylinder(h=26,d=120,center=true);}

}

color("black")
    difference(){cylinder(h=16,d=125,center=true);
cylinder(h=10,d=120,center=true);
        cylinder(h=24,d=80,center=true);
        }
color("black")      
for(i=[0:36:360]){
    rotate([0,0,i])
    translate([0,74,0]){
        cylinder(h=10,d=9.5,center=true);
        }
    }}
    
//86电机
module 86cme85_180(){
    
        translate([50,0,43])
    rotate([0,90,0])
    {
    cylinder(h=32,d=14);
    translate([-43,-43,-140])
    cube([86,86,140]);}
       }
       
 module csf_25_100_2uh(){
rotate([0,-90,0])
translate([0,0,-26]){
translate([0,0,3])
cylinder(h=5,d=107,center=true);
translate([0,0,49/2])
cylinder(h=49,d=86,center=true);
translate([0,0,49/2])
cylinder(h=49,d=67,center=true);
}
     }
     
 
        //三脚架
     module tri_mount(){
    
      //固定筒
    translate([0,0,250-20])
       cylinder(h=20,d=base_tube_dimeter);  
         
             translate([0,0,250-60])
         color("grey")
       cylinder(h=15,d=base_tube_dimeter);  
         
    translate([0,0,0])
         color("grey")
       cylinder(h=20,d=base_tube_dimeter);  

    //固定动螺丝
                 for(i=[0:1:2])
        {rotate([0,0,i*120+30+60])
         translate([base_tube_dimeter/2-20,0,250/2])
         cylinder(h=250,d=20,center=true);}
               
    //三脚架
        for(i=[0:1:2])
        {rotate([0,0,i*120+30])

        translate([base_tube_dimeter/2,5,0])
        rotate([90,0,0]){
        linear_extrude(50){
        difference(){
        polygon(points=[
        [0,250],
        [250/tan(20),20],
        [250/tan(20)+50,20],
        [250/tan(20)+50,0],
        [0,0]
        ]);
        
        
        polygon(points=[
        [20,250-20/tan(20)+20],
        [250/tan(20)-20/tan(20),20],
        [20,20]
        ]);}
        
        
                //制作横杆
        rotate([0,0,-60])
        translate([0,140+10*tan(60)])
        color("red")
        square([20,280],center=true);

    translate([500,0])
    mirror([1,0,0])
{
            rotate([0,0,-60])
        translate([0,140+10*tan(60)])
        color("red")
        square([20,280],center=true);
    
    }
        
        }
        
           translate([250/tan(20)+25,20,25])
        rotate([90,0,0])
        color("black")
        cylinder(h=40,d=20,center=true);
    }
        
        }
 
  
  
    }
 
     
 
