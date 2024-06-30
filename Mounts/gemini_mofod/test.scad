
//$fn=360;
//////////////////////////////参数
    //底座
    base_tube_length=850;
    base_tube_dimeter=254;
//  base_tube_thickness=3;
         base_tube_thickness=20;    //3d打印专用
    base_hole_cube_up_length=500;
    base_hole_cube_up_width=180;
    base_hole_cylinder_dimeter=10;

    //支架
    wing_height=850;
//    wing_thickness=5;
    wing_thickness=20; //3d打印专用
    wing_wall_top_width=170;
    base_hole_cylinder_angle=asin(0.5*(base_tube_dimeter-wing_wall_top_width)/(wing_height-wing_thickness));
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
    
    
wing_support();
holder();

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