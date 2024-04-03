//镜子的调价
ALT_adjust_angle = 30;
RA_rotate_angle = 30;
DEC_rotate_angle = 40;


/////////////////以下是Mount////////////////////
//mount_base
////参数
mount_base_length = 210;
mount_base_width = 210;
mount_base_thickness = 10;
mount_base_cylinder_diameter = 200;
mount_base_cylinder_thickness = 30;
mount_base_cylinder_length = 135;
mount_base_column_thickness = 20;
mount_base_column_width = 120;
mount_base_column_height = 80;

//参数 - RA-DEC
RA_cylinder_cylinder_length = 160;

//参数 - RA赤经-底部调节圈
RA_base_diameter = 300;
RA_base_axis_cave_height = 70;
RA_base_axis_cave_width = 240;
RA_base_axis_cave_angle = 30;
//参数 - RA赤经-赤经大圆环
RA_cylinder_extrusion_thickness = 10;
RA_cylinder_extrusion_length = 180;
RA_cylinder_cylinder_diameter = 230;
RA_cylinder_cylinder_thickness = 45;

//参数 - DEC赤纬-中间轴
DEC_cylinder_diameter = 120;
DEC_cylinder_height = 150;

//参数 - DEC赤纬-大圆盘
DEC_cylinder_extrusion_thickness = 10;
DEC_cylinder_extrusion_length = 180;
DEC_cylinder_cylinder_diameter = 230;
DEC_cylinder_cylinder_thickness = 30;

//参数 - DEC赤纬-鸠尾槽
losmandy_tail_width = 160;
losmandy_tail_length = 410;
losmandy_tail_thickness = 20;
losmandy_tail_cut1_length = 85;
losmandy_tail_cut2_length = 100;
losmandy_tail_cut3_thickness = 7;




mount_ra_dec(ALT_adjust_angle, RA_rotate_angle, DEC_rotate_angle);
/////////////////////模块-赤道仪的两个轴/////////////////////////////
module mount_ra_dec(ALT_adjust_angle, RA_rotate_angle, DEC_rotate_angle) {

    //RA赤经-底部调节圈
    difference() {

        translate([RA_cylinder_cylinder_length/2 - 5, 0, 0])

        for (i = [[0, 0, 0], [ - RA_cylinder_cylinder_length, 0, 0]]) {
            translate(i) {
                //    color("silver")
                difference() {
                    rotate([90, -1 * ALT_adjust_angle, 90]) {
                        difference() {
                            cylinder(h = 15, d = RA_base_diameter);
                            translate([ - RA_base_diameter/2, 0, -2]) cube([RA_base_diameter, RA_base_diameter, 20]);

                        }
                    }

                    rotate([ALT_adjust_angle, 0, 0]) {
                        translate([ - 15, -RA_base_axis_cave_width/2, -RA_base_axis_cave_height + 1]) difference() {
                            cube([40, RA_base_axis_cave_width, RA_base_axis_cave_height]);

                            translate([20, -(RA_base_axis_cave_height * cos(45)/2) * cos(60), (RA_base_axis_cave_height * cos(45)/2) * sin(60)]) rotate([30, 0, 0]) cube([60, RA_base_axis_cave_height, RA_base_axis_cave_height * 2], center = true);

                            translate([0, RA_base_axis_cave_width, 0]) rotate([0, 0, 180]) translate([ - 20, -(RA_base_axis_cave_height * cos(45)/2) * cos(60), (RA_base_axis_cave_height * cos(45)/2) * sin(60)]) rotate([30, 0, 0]) cube([60, RA_base_axis_cave_height, RA_base_axis_cave_height * 2], center = true);
                        }

                        //赤道仪上的高度角调节孔
                        translate([ - 200, 15, 13]) color("black") rotate([0, 90, 0]) rotate_extrude(angle = -80, convexity = 1) translate([RA_base_diameter/2 - 5, 0, 0]) square([10, 400]);
                    }

                }

            }
        }

        //做移除用途-开始

        rotate([ALT_adjust_angle, 0, 0])

        rotate([ - 90, 0, 0]) translate([0, 0, RA_cylinder_cylinder_thickness + RA_cylinder_cylinder_thickness/2 + 90]) {

            ///////////RA赤经-赤经大圆环 - 开始////////////// 
            union() {
                //大圆环
                //    color("silver")
                translate([0, 0, -RA_cylinder_cylinder_thickness/2]) cylinder(h = RA_cylinder_cylinder_thickness, d = RA_cylinder_cylinder_diameter, center = true);

                translate([0, 0, -RA_cylinder_cylinder_thickness - 35/2]) cylinder(h = 35, d = 140, center = true);

                //底部长方体
                translate([0, (30), -RA_cylinder_cylinder_thickness/2])
                //    color("silver")
                cube([RA_cylinder_extrusion_length, RA_cylinder_extrusion_length, RA_cylinder_cylinder_thickness], center = true);
            }

        }

    }
    //做移除用途-结束

    //RA赤经-底座赤经大圆环
    rotate([ALT_adjust_angle, 0, 0]){

    rotate([ - 90, 0, 0]) translate([0, 0, RA_cylinder_cylinder_thickness/2 + 90]) {

        ///////////RA赤经-赤经大圆环 - 开始////////////// 
        union() {
            //大圆环
            //    color("silver")
            translate([0, 0, -RA_cylinder_cylinder_thickness/2]) cylinder(h = RA_cylinder_cylinder_thickness, d = RA_cylinder_cylinder_diameter, center = true);

            translate([0, 0, -RA_cylinder_cylinder_thickness - 35/2])
            //    color("silver")
            cylinder(h = 35, d = 140, center = true);

            //底部长方体
            translate([0, (30), -RA_cylinder_cylinder_thickness/2])
            //    color("silver")
            cube([RA_cylinder_extrusion_length, RA_cylinder_extrusion_length, RA_cylinder_cylinder_thickness], center = true);
        }

    }}
    ///////////RA赤经-底座赤经大圆环 - 结束////////////// 
    ///////////RA赤经-赤经大圆环 - 重锤位置  -开始//////////////
    rotate([ALT_adjust_angle, 0, 0]) {
        rotate([ - 90, RA_rotate_angle, 0]) translate([0, 0, RA_cylinder_cylinder_thickness/2 + 120 + 35]) {
            //    color("silver")
            union() {
                translate([0, 0, -RA_cylinder_cylinder_thickness + 10]) cylinder(h = 50, d = 100, center = true);
                translate([0, (60), -RA_cylinder_cylinder_thickness + 10]) cube([60, 60, 50], center = true);
            }
            translate([0, 240 + 60, -RA_cylinder_cylinder_thickness + 10])

            rotate([90, 0, 0]) {
                //    color("silver")
                cylinder(h = 480, d = 40, center = true);

                //偏心重锤
                color("silver") translate([0, 0, 110]) {

                    cylinder(h = 50, d = 80, center = true);
                    translate([110, 0, 0]) rotate([0, 90, 0]) {
                        cylinder(h = 150, d = 25, center = true);
                        cylinder(h = 50, d = 80, center = true);
                    }

                }
                //以下为重锤
                //color("silver")

                cylinder(h = 50, d = 200, center = true);
                //  color("silver")
                translate([0, 0, -50 - 60]) cylinder(h = 50, d = 200, center = true);

                translate([0, 0, -50 - 50 - 60])
                //    color("silver")
                cylinder(h = 50, d = 200, center = true);
                //color("silver")
                translate([0, 0, -50 - 50 - 50 - 60]) cylinder(h = 50, d = 200, center = true);
                translate([0, 0, -50 - 50 - 50 - 50 - 40]) cylinder(h = 10, d = 50, center = true);

            }

        }
    }
    ///////////RA赤经-赤经大圆环 - 重锤位置  -结束////////////// 
    
    //////////RA赤经-赤经大圆环 - 后背插线板//////////
    rotate([ALT_adjust_angle, 0, 0]) {
        rotate([ - 90, 0, 0]) translate([0, 0, -RA_cylinder_cylinder_thickness/2]) {
            union() {
                translate([0, 0, -RA_base_diameter/2 + 50])
                //  color("silver")
                cylinder(h = 70, d = 110, center = true);
                //        //RA赤经-赤经大圆环 - 后背插线板上的dec轴
                //        translate([0,0,0])
                //            color("blue")
                //    cylinder(h=RA_cylinder_cylinder_thickness*6,d=100,center=true);
            }

        }
    }

    //////////RA赤经-赤经大圆环 - 中间的横轴
    rotate([ALT_adjust_angle, 0, 0]) {
        rotate([ - 90, 0, 0]) translate([0, 0, -RA_cylinder_cylinder_thickness/2]) {

            //RA赤经-赤经大圆环 - 后背插线板上的dec轴
            translate([0, 0, 0])
            //    color("siver")
            cylinder(h = RA_cylinder_cylinder_thickness * 6, d = 100, center = true);

        }
    }

    //////////DEC赤纬 - 竖立的主轴
    //参数 - DEC赤纬-中间轴

    rotate([ALT_adjust_angle, 0, 0])

    rotate([0, RA_rotate_angle, 0]) {

        //    color("silver")
        translate([0, -30, DEC_cylinder_height/2]) {
            cylinder(h = DEC_cylinder_height, d = DEC_cylinder_diameter, center = true);
            translate([0, 0, DEC_cylinder_height/2 - DEC_cylinder_cylinder_thickness/2])

            cylinder(h = DEC_cylinder_cylinder_thickness, d = DEC_cylinder_diameter + 20, center = true);

        }

        ////////////DEC赤纬-赤纬大圆环 -开始//////////////
        rotate([0, 0, 180]) {

            union() {
                translate([0, 0, DEC_cylinder_height + DEC_cylinder_cylinder_thickness])
                   color("silver")
                cylinder(h = DEC_cylinder_cylinder_thickness * 2, d = DEC_cylinder_cylinder_diameter, center = true);
                translate([0, (80), DEC_cylinder_height + DEC_cylinder_cylinder_thickness])
                    //color("red")
                cube([DEC_cylinder_extrusion_length, DEC_cylinder_extrusion_length, DEC_cylinder_cylinder_thickness * 2], center = true);
                //圆盘下方第一层
                //    color("silver")
                translate([0, (80), DEC_cylinder_height - DEC_cylinder_cylinder_thickness/2]) cube([DEC_cylinder_extrusion_length * 0.9, DEC_cylinder_extrusion_length, DEC_cylinder_cylinder_thickness], center = true);

                //圆盘下方第二层
                    //color("red")
                translate([0, DEC_cylinder_extrusion_length/2 + 35, DEC_cylinder_height - DEC_cylinder_cylinder_thickness/2 - DEC_cylinder_cylinder_thickness]) cube([DEC_cylinder_extrusion_length * 0.8, DEC_cylinder_extrusion_length * 0.5, DEC_cylinder_cylinder_thickness * 1.5], center = true);

            
                
                
                   ////////////DEC赤纬-赤纬大圆环 -开始//////////////
        rotate([0, 0, 180]) {
            
                            ////////////DEC赤纬-鸠尾槽-开始////////////    
                rotate([0, 0, DEC_rotate_angle + 180]) {

                    translate([ - losmandy_tail_length/2 + 50, -losmandy_tail_width/2, DEC_cylinder_extrusion_length + DEC_cylinder_cylinder_thickness * 2 - 30]) {
                        rotate([90, 0, 90]) 
                            //color("red") 
                                linear_extrude(losmandy_tail_length) polygon(points = [[0, 0], [losmandy_tail_width, 0],

                        //DEC赤纬-右上角
                        [losmandy_tail_width, losmandy_tail_thickness], [losmandy_tail_width - (losmandy_tail_width - losmandy_tail_cut1_length)/2, losmandy_tail_thickness],

                        [losmandy_tail_width - (losmandy_tail_width - losmandy_tail_cut2_length)/2, losmandy_tail_cut3_thickness],

                        [(losmandy_tail_width - losmandy_tail_cut2_length)/2, losmandy_tail_cut3_thickness],

                        [(losmandy_tail_width - losmandy_tail_cut1_length)/2, losmandy_tail_thickness],
                        //DEC赤纬--左上角
                        [0, losmandy_tail_thickness], ]);
                        translate([losmandy_tail_length - 120, 0, -40]) 
                        //color("red", 0.7) 
                        cube([120, losmandy_tail_width, 40]);
                    }}}
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                


            }


        }
    }

    ////////////DEC赤纬-赤纬大圆环 -开始//////////////
}

