$fn=100;
//////////////////////////////参数
include <config.scad>;
include <modules.scad>;


//////////////////////////////基本代码
 
 
 
//上方望远镜
    //旋转底座
     rotate([0,270,0]){
     mount_base();
         
//        translate([300,0,0])
//        rotate([0,90,0])
//        rasa14(); 
   
    
     translate([0,0,-340-wing_move_length])
    rotate([0,90,0])
    holder();
 
     translate([0,0,340+wing_move_length])
    rotate([0,90,0])
        mirror([1,0,0])
    holder_with_motor();
   

         
   } 
 
 
    //叉臂上的
    translate([-340-20+5,0,wing_height])
    rotate([0,0,180]){
    color("grey")
    csf_25_100_2uh();
            translate([30,0,-30])
        cube([10,170,170],center=true);
        }


    translate([-340-170/2-25,5,wing_height-86/2]){
    color("black")
    86cme85_180();
        }
 
    translate([-340+15+5,0,wing_height])
    rotate([0,90,180])
    color("blue")
    XRU8022_cross_roller_bearing();
     
 
  
 
//底部支架


    //底盘上的电机
    translate([0,0,-100+2-10-10+42]){
        translate([0,0,35+10])
    color("blue")
    XRU8022_cross_roller_bearing();
        
 
           translate([0,0,11]) 
    rotate([0,90,0])
    color("grey")
    csf_25_100_2uh();
    translate([43,0,-80])
    color("black")
    rotate([0,-90,0])
    86cme85_180();
 
        }

    translate([0,0,-155-95+5-50]) 
        tri_mount();
    
       
 
 





 


 