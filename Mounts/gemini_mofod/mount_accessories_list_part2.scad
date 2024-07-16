$fn = 36;
// 望远镜阵列
rasa_array_angle = 30;
mount_base_angle=0;
wing_support_hole=0; //翅膀是否挖洞
wing_surpport_fixed_rod=0; //翅膀是否使用固定杆
holder_hole=0; //支撑面是否挖洞

////////////////////////////// 参数
include <config.scad>;
include <modules.scad>;

////////////////////////////// 基本代码
//    rotate([0,90,0])
//        holder(holder_hole);

//translate([0,100,0])
//rotate([90,0,0])
// wing_support(wing_support_hole,wing_surpport_fixed_rod) ;
 
translate([400,-600,0])
        //用于支撑电机的圆板
        difference(){
        translate([0, 0, -5]) {
            linear_extrude(wing_thickness)
            translate([0, wing_height * cos(base_hole_cylinder_angle)])
            circle(d = wing_wall_top_width);
        }
        //用于支撑电机的螺丝
        translate([0,0,-10])
        linear_extrude(60)
        translate([0, wing_height * cos(base_hole_cylinder_angle)]) {
            for (i = [0: 1: 5]) rotate([0, 0, 60 * i])
            translate([wing_wall_top_width / 2 - 10, 0, 0])
            circle(d = 8);
        }}