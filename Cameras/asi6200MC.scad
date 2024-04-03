$fn=50; // 设置渲染时的分辨率

// 圆柱体参数
cylinder_diameter = 90; // 直径90毫米
cylinder_radius = cylinder_diameter / 2;
cylinder_height = 59.5; // 假定圆柱体高度为10毫米，可根据需要调整

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
    difference(){
    cylinder(h=cylinder_height,d=cylinder_diameter);
        translate([0,0,1])
    cylinder(h=cylinder_height,d=cylinder_diameter-2*vent_bar_extension);}
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






// 组装最终物件-将被从主体上移除的通风栅栏占位
difference(){
            color("red")
base_cylinder(cylinder_diameter,cylinder_radius,cylinder_height);
    translate([0,0,cylinder_height-vent_height]){
vent_bars();
rotate([0,0,180])
vent_bars();}}

// 组装最终物件-通风栅栏
translate([0,0,cylinder_height-vent_height])
rotate([0,0,vent_rotate]){
    color("black"){
vent_bars();
rotate([0,0,180])
vent_bars();}}

//防潮层
translate([0,0,cylinder_height+0.5]){
        color("red")
base_cylinder(cylinder_diameter,cylinder_radius,17.5);
       for(i=[30:180:360]){
        rotate([0,0,i]){
translate([cylinder_radius,0,8]){
    rotate([0,90,0])
    color("black")
    cylinder(h=1,d=10);}
    }} 
    
    }

//靶面调节环
translate([0,0,cylinder_height+17.5+1]){
color("red")
    difference()
{
    base_cylinder(cylinder_diameter,cylinder_radius,11);
    for(i=[0:60:360]){
        rotate([0,0,i]){
translate([cylinder_radius,0,6]){
    cylinder(h=5,d=5);}
    }}
    }
 
 
       for(i=[0:60:360]){
        rotate([0,0,i]){
translate([cylinder_radius-2,0,6]){
    color("silver")
    cylinder(h=2,d=3);}
    }} 
    
    }

//望远镜连接环
translate([0,0,cylinder_height+17.5+11+1.5])
            color("black")
base_cylinder(cylinder_diameter,cylinder_radius,5);
    

//USB口
    translate([0,-38,4]){
    color("white"){
    cube([15,5,10],center=true);
    translate([0,8,0])
        cube([15,5,10],center=true);}
        translate([15,5,0])
        color("blue")
    cube([10,12,10],center=true);}
    

//电源口
translate([(55/2)*sin(45)+10,-(55/2)*sin(45),,4]){
    color("grey")
   difference(){
cube([8,10,10],center=true);
    translate([0,2,-5])
cylinder(h=20,d=5,center=true)    ;}
    translate([0,2,0])
color("white")
cylinder(h=10,d=3,center=true)    ;

translate([0,-7,0])
color("black")
cylinder(h=10,d=1,center=true);
}
    
    
//风扇
 translate([0,3,0])
color("black")    
        cylinder(h=1,d=52,center=true);
color("white")
 translate([0,3,-1]){
//fan_cover(50+2,0.7); //外径50毫米,线条直径0.7毫米
fan_cover(40+2,0.7); //外径50毫米,线条直径0.7毫米
fan_cover(30,0.7); //外径50毫米,线条直径0.7毫米
fan_cover(20,0.7); //外径50毫米,线条直径0.7毫米
    translate([(55/2)*sin(45),(55/2)*sin(45),4])
cylinder(h=10,d=5,center=true);
    translate([(55/2)*sin(45),-(55/2)*sin(45),4])
cylinder(h=10,d=5,center=true);
    translate([-(55/2)*sin(45),(55/2)*sin(45),4])
cylinder(h=10,d=5,center=true);
    translate([-(55/2)*sin(45),-(55/2)*sin(45),4])
cylinder(h=10,d=5,center=true);

    translate([(55/2)*sin(45),(55/2)*sin(45)+10,4])
cylinder(h=10,d=5,center=true);
    translate([-(55/2)*sin(45),(55/2)*sin(45)+10,4])
cylinder(h=10,d=5,center=true);}

//风扇保护罩弯线
translate([-3,0,-1])
rotate([0,0,45])
bend_segment();

translate([3,7,-1])
rotate([0,0,225])
bend_segment();


//边缘螺丝
color("white"){
    translate([(43/2)*sin(45)+10,-(43/2)*sin(45)-15,4])
cylinder(h=10,d=5,center=true);
    translate([-(43/2)*sin(45)-10,-(43/2)*sin(45)-15,4])
cylinder(h=10,d=5,center=true);}


//文字-型号
translate([-16,37,0])
color("white")
rotate([0,180,180])
text("ASI6200MC Pro",size=3.2,direction="ltr");

//USB文字
translate([-7,-24,0])
color("white")
rotate([0,180,180])
text("USB2.0 OUT  USB3.0 IN",size=1.9,direction="ltr");


//DC文字
translate([25,-10,0])
color("white")
rotate([0,180,180])
text("DC 12V-3A",size=1.9,direction="ltr");


//LOGO文字
translate([-40,-8,0])
color("white")
rotate([0,180,180])
text("ZWO",size=5,direction="ltr");