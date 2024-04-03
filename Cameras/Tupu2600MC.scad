use <../Accessories/usb3.scad>
use <../Accessories/usb2a.scad>

$fn=50; // 设置渲染时的分辨率
tupu2600mc();
module tupu2600mc(){
// 圆柱体参数
cylinder_diameter = 80; // 直径90毫米
cylinder_radius = cylinder_diameter / 2;
cylinder_height = 70; // 假定圆柱体高度为10毫米，可根据需要调整

// 透气罩子参数
vent_bar_thickness = 1; // 栅栏厚度0.5毫米
vent_bar_extension = 2; // 栅栏向圆心延伸2毫米
vent_spacing = 2; // 栅栏间距2毫米
vent_height = 40; // 栅栏高度20毫米
vent_rotate = 360*vent_bar_thickness/(PI*cylinder_diameter);

// 风扇保护罩弯线定义参数
line_diameter = 1; // 圆柱直径
line_radius = 5; // 转弯半径
line_bend_angle = 90; // 弯曲角度
straight_length = 25; // 每段直线部分的长度

// 风扇罩圆环的外径和线条直径（以毫米为单位）
module fan_cover(outer_diameter,line_diameter){
difference(){
cylinder(h=line_diameter,d=outer_diameter,center=true);
    translate([0,0,line_diameter])
cylinder(h=4*line_diameter,d=outer_diameter-line_diameter*2,center=true);}}


// 创建圆柱体
module base_cylinder(cylinder_diameter,cylinder_radius,cylinder_height) {
    //difference(){
    cylinder(h=cylinder_height,d=cylinder_diameter);
        translate([0,0,.5])
    cylinder(h=cylinder_height,d=cylinder_diameter-1*vent_bar_extension);
      //  }
}


// 添加通风栅栏
module vent_bars() {
for(i = [0:vent_rotate*2:60]){
rotate([0,0,i]){
translate([0,cylinder_radius-vent_bar_extension,0])
cube([vent_bar_thickness,vent_bar_extension,vent_height]);
}}
}


// 风扇保护罩弯曲部分
module bend_segment() {
    translate([0, line_radius, 0])
    rotate([0, 0, -90]) // 开始旋转的角度调整，使得弯曲和直线部分对齐
    rotate_extrude(angle=line_bend_angle)
    translate([line_radius, 0, 0])
    circle(d=line_diameter);
    
    rotate([0,-90,0])
cylinder(h=straight_length, d=line_diameter, center=false);;
translate([5,5,0])
rotate([-90,0,0])
cylinder(h=straight_length, d=line_diameter, center=false);;
    
    
}
//底部风扇口
color("black"){
translate([-6,-27,-1])
{
    cube([12,3,10]);
    }
    
translate([-6,-21,-1])
{
    cube([12,3,10]);
    }
    
translate([-6,-15,-1])
{
    cube([12,3,10]);
    }
    
translate([-21,-9,-1])
{
    cube([42,3,10]);
    }

translate([-21,-3,-1])
{
    cube([42,3,10]);
    }

translate([-21,3,-1])
{
    cube([42,3,10]);
    }

translate([-21,9,-1])
{
    cube([42,3,10]);
    }

translate([-13,15,-1])
{
    cube([34,3,10]);
    }  
}  
//USB口
    translate([-15,-23,4]){
 
        translate([-6,5,-5]){
        rotate([90,0,0])
    usb2a();
    translate([0,7,0])
         rotate([90,0,0])
    usb2a();}
        
 
// usb3.0口
        translate([24,12.1,-5]){
        rotate([90,0,0])
            usb3();}
        }



// 组装最终物件-将被从主体上移除的通风栅栏占位
difference(){
            color("blue")
base_cylinder(cylinder_diameter,cylinder_radius,cylinder_height);
    
    translate([0,0,cylinder_height-vent_height-3]){
vent_bars();
rotate([0,0,180])
vent_bars();}

//去掉usb2.0占位    
    translate([-21,-25,-1]){
         cube([12.5,14,20]);  
        }

//去掉usb3.0占位   
        translate([9,-23.9,-1]){
         cube([12.1,12.92,20]);  
        }   

}



// 组装最终物件-通风栅栏
translate([0,0,cylinder_height-vent_height-3])
rotate([0,0,vent_rotate]){
    color("black"){
vent_bars();
rotate([0,0,180])
vent_bars();}}

//防潮层
translate([0,0,cylinder_height]){

color("grey")
difference(){
base_cylinder(cylinder_diameter,cylinder_radius,17.5+7-1);
    translate([0,0,20])
        base_cylinder(50,50,10);}
    //望远镜连接环


    
            
       for(i=[30:180:360]){
        rotate([0,0,i]){
translate([cylinder_radius,0,8]){
    rotate([0,90,0])
    color("white")
    cylinder(h=1,d=10);}
    }} 
    
    }

//靶面调节环
translate([0,0,cylinder_height+17.5+7]){
    color("grey",1)
    base_cylinder(cylinder_diameter,cylinder_radius,4);
    for(i=[0:60:360]){
        rotate([0,0,i]){
translate([cylinder_radius-4,0,0]){
    cylinder(h=5,d=5);}
    }}

 
 
       for(i=[0:60:360]){
        rotate([0,0,i]){
translate([cylinder_radius-4,0,3]){
    color("silver")
    cylinder(h=2,d=3);}
    }} 
    
    }

//望远镜连接环
translate([0,0,cylinder_height+17.5+11])
            color("blue"){
                difference(){
base_cylinder(52,52,3);
                    translate([0,0,-2])
    base_cylinder(50,50,10);}
            }




//电源口
translate([-(55/2)*sin(45),(55/2)*sin(45)+1,4]){
    color("grey")
   difference(){
cube([8,10,10],center=true);
    translate([0,2,-5])
cylinder(h=20,d=5,center=true)    ;}
    translate([0,2,0])
color("white")
cylinder(h=10,d=3,center=true)    ;

translate([9,1,0])
color("white")
cylinder(h=10,d=4,center=true);

translate([17,1,0])
color("white")
cylinder(h=10,d=4,center=true);

translate([25,1,0])
color("white")
cylinder(h=10,d=4,center=true);

translate([33,1,0])
color("white")
cylinder(h=10,d=4,center=true);

}
    
    
////风扇
// translate([0,3,0])
//color("black")    
//        cylinder(h=1,d=52,center=true);
//color("white")
// translate([0,3,-1]){
////fan_cover(50+2,0.7); //外径50毫米,线条直径0.7毫米
//fan_cover(40+2,0.7); //外径50毫米,线条直径0.7毫米
//fan_cover(30,0.7); //外径50毫米,线条直径0.7毫米
//fan_cover(20,0.7); //外径50毫米,线条直径0.7毫米
//    translate([(55/2)*sin(45),(55/2)*sin(45),4])
//cylinder(h=10,d=5,center=true);
//    translate([(55/2)*sin(45),-(55/2)*sin(45),4])
//cylinder(h=10,d=5,center=true);
//    translate([-(55/2)*sin(45),(55/2)*sin(45),4])
//cylinder(h=10,d=5,center=true);
//    translate([-(55/2)*sin(45),-(55/2)*sin(45),4])
//cylinder(h=10,d=5,center=true);
//
//    translate([(55/2)*sin(45),(55/2)*sin(45)+10,4])
//cylinder(h=10,d=5,center=true);
//    translate([-(55/2)*sin(45),(55/2)*sin(45)+10,4])
//cylinder(h=10,d=5,center=true);
//}

////风扇保护罩弯线
//translate([-3,0,-1])
//rotate([0,0,45])
//bend_segment();
//
//translate([3,7,-1])
//rotate([0,0,225])
//bend_segment();


//边缘螺丝
color("white"){
    translate([(43/2)*sin(45)+5,-(43/2)*sin(45)-15,4])
cylinder(h=10,d=5,center=true);
    translate([-(43/2)*sin(45)-5,-(43/2)*sin(45)-15,4])
cylinder(h=10,d=5,center=true);}

color("white"){
    translate([(43/2)*sin(45)+5,(43/2)*sin(45)+15,4])
cylinder(h=10,d=5,center=true);
    translate([-(43/2)*sin(45)-5,(43/2)*sin(45)+15,4])
cylinder(h=10,d=5,center=true);}


//文字-型号
//translate([-16,37,0])
//color("white")
//rotate([0,180,180])
//text("ASI2600MC Pro",size=3.2,direction="ltr");

//USB文字
translate([-18,-25.5,0])
color("white")
rotate([0,180,180])
text("USB2.0                                         USB3.0",size=1.5,direction="ltr");


//DC文字
translate([-23,27,0])
color("white")
rotate([0,180,180])
text("DC 12V",size=1.5,direction="ltr");


////LOGO文字
//translate([-40,-8,0])
//color("white")
//rotate([0,180,180])
//text("ZWO",size=5,direction="ltr");
//
}