$fn = 36;
// 望远镜阵列
rasa_array_angle = 30;
mount_base_angle=0;
wing_support_hole=1; //翅膀是否挖洞
wing_surpport_fixed_rod=1; //翅膀是否使用固定杆
holder_hole=1; //支撑面是否挖洞

////////////////////////////// 参数
include <config.scad>;
include <modules.scad>;

////////////////////////////// 基本代码

// 上部旋转支架
rotate([0, 270, mount_base_angle]) {
    mount_base();
    mount_base_wings();
    translate([0, 0, -340 - wing_move_length])
    rotate([0, 90, 0]) {
        holder(holder_hole);
        holder_attachment(rasa_array_angle);
    }
    translate([0, 0, 340 + wing_move_length])
    rotate([0, 90, 0])
    mirror([1, 0, 0]) {
        holder(holder_hole);
        holder_with_motor_attachment(rasa_array_angle);
    }
    // RASA整列
    //    translate([wing_height, 0, 0]) rasa11_array();
    // RASA整列    
}

// 底部支架
translate([0, 0, -155 - 95 + 5 - 50])
color("grey")
    tri_mount();

// 底盘上的电机
translate([0, 0, -100 + 2 - 10 - 10 + 42]) {
    translate([0, 0, 35 + 10])
    color("blue")
        XRU8022_cross_roller_bearing();
    translate([0, 0, 11])
    rotate([0, 90, 0])
    color("grey")
        csf_25_100_2uh();
    translate([43, 0, -80])
    color("black")
    rotate([0, -90, 0])
        motor_86cme85_180();
}
 

