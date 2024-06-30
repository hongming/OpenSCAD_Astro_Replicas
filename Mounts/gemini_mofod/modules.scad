/////////////////////////////Modules
 
 
 
module mount_base(){
    
                       //下方半圆的对接平面
    translate([-base_tube_thickness/2-15,0,0])
        color("grey")
        cube([base_tube_thickness,base_tube_dimeter,base_tube_length+10],center=true);
     

  difference(){
              color("red")
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
     translate([-20-10/2,-base_tube_dimeter/2,-1*wing_move_length])
         color("grey")
 wing_support();}
  
        //支架镜像
        mirror([0,0,1])
        rotate([0,0,base_hole_cylinder_angle]){
     translate([-20-10/2,-base_tube_dimeter/2,-1*wing_move_length])
                     color("grey")
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
   rotate([90,90,0])
linear_extrude(wing_thickness)
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
  

module wing_support(){
   rotate([90,90,0])
linear_extrude(wing_thickness)
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
  
    linear_extrude(wing_thickness){
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
   
   translate([0,wing_height,-11])
rotate([0,0,180])
color("blue")
XRU8022_cross_roller_bearing();
 
          color("silver")
      translate([0,0,-40]){
   linear_extrude(20){
           translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
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
 
           translate([0,base_tube_length*cos(base_hole_cylinder_angle),-10]) 
          rotate([180,0,-1*tail_for_telescope_angle])
           2047studio_dovetail_dule_saddle(195,2);
          }
          }
    }

module holder_with_motor(){

    rotate([90,0,90]){
                color("silver")
    linear_extrude(wing_thickness){
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
    circle(d=wing_wall_top_width);
   }
  /* 
    color("silver")
   translate([0,0,30-2]){
   linear_extrude(5){
           translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    circle(d=wing_wall_top_width);

   }}

       color("silver")
   translate([0,0,-40]){
   linear_extrude(20){
           translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    circle(d=200);

   }}
  */ 
       color("silver")
      translate([0,0,-50+10]){
   linear_extrude(20){
           translate([0,base_tube_length*cos(base_hole_cylinder_angle)])
    circle(d=100);

   }}

   
      translate([0,0,-40+10]){
 
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

        

    color("grey",alpha=0.5)
    difference(){
    cylinder(h=250,d=base_tube_dimeter);
    translate([0,0,-5])
    cylinder(h=250,d=base_tube_dimeter-base_tube_thickness*2);}
               
    //三脚架
        for(i=[0:1:2])
        {rotate([0,0,i*120+30])

        translate([base_tube_dimeter/2,5,0])
        rotate([90,0,0])
        linear_extrude(40)
        difference(){
        polygon(points=[
        [0,250],
        [250/tan(20),0],
        [0,0]
        ]);
        polygon(points=[
        [10,230],
        [230/tan(20),10],
        [20,20]
        ]);}}
 
  
  
    }
 
