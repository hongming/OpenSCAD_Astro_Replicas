$fn = 400;
ALT_adjust_angle = 30;
RA_rotate_angle = 0;
DEC_rotate_angle = 0;

//引用设备
use <Telescopes/C8HD.scad > ;
use <Telescopes/RASA11.scad > ;
use <Telescopes/widecamera16mm.scad > ;
use <Telescopes/widecamera146mm.scad > ;
use <Accessories/losmandy_style_dovetail_saddle.scad > ;
use <Accessories/2047studio_dovetail_dule_saddle.scad > ;
use <Accessories/dovetail_saddle.scad > ;
use <Accessories/dovetail_bar.scad > ;
use <Mounts/iOptron_Tri_Pier.scad > ;
use <Accessories/dual_cover.scad > ;
use <Mounts/cem120_mount_base.scad > ;
use <Mounts/cem120_mount_ra_dec.scad > ;

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


    ///////////////////////实现望远镜一整套/////////////////////////////    
    rotate([0,0,0])
    telescopes();

    ///////////////////////模块-赤道仪RA-DEC部分/////////////////////////////    
    translate([0, 0, mount_base_length + mount_base_thickness]) 
        mount_ra_dec(ALT_adjust_angle, RA_rotate_angle, DEC_rotate_angle);
    ///////////////////////模块-赤道仪基座/////////////////////////////
        rotate([0,0,180])
            translate([0,0,mount_base_thickness/2])
                cem120_mount_base();
    ///////////////////////模块-半立柱三脚架/////////////////////////////
            iOptron_Tri_Pier();
    
//实现防尘防雨罩
//dual_cover("Yes");  



///////////////////////望远镜组
module telescopes() {
    
translate([-40, 0, mount_base_length + mount_base_thickness]) 

    rotate([ALT_adjust_angle, 0, 0]){

    rotate([0, RA_rotate_angle, 0])
       
       rotate([0, 0, DEC_rotate_angle]) {


                    //DEC赤纬--双镜鸠尾板
                    //鸠尾板
                    translate([ - 245 + 100, 50, DEC_cylinder_extrusion_length + DEC_cylinder_cylinder_thickness * 2 + 27 - 30]) {
                        translate([ - 60, 0, 0]) rotate([90, 180, 90]){  
                           color("red")
                        linear_extrude(height = 450) {
                            polygon(points = [[0, 0], [100, 0], [100, 7], [75, 7], [91.5, 20], [8.5, 20], [25, 7], [0, 7]]);
                        }
                            }

                        //望远镜群
                        translate([230, -100, DEC_cylinder_extrusion_length + DEC_cylinder_cylinder_thickness * 2 - 50]) {
                            
                            
                            
                            
                                rotate([0, 0, 0]) {
        //C8hd
        translate([180 - 80 - 10-20, 200, -75]) rotate([ - 90, 0, 0]) {

            translate([0, -70, 50]) {
                c8hd();
                translate([0, 167, 10]) rotate([0, -90, 90])
                //c8hd上的广角镜
                widecamera16mm();
                //鸠尾板上的广角镜        
                translate([ - 120, 130, -150]) rotate([0, -90, 90]) widecamera146mm();
            }
        }
        //RASA11
        translate([ - 220, 400, 8]) rotate([ - 90, 0, 0]) RASA11();

    }
                            
                            
                            }

                        //DEC赤纬- - 安装望远镜的鸠尾槽1
                        translate([10, -50, 0])
                        //losmandy_style_dovetail_saddle(200,2);
                        2047studio_dovetail_dule_saddle(195, 2);

                        //DEC赤纬- - 安装望远镜的鸠尾槽2
                        translate([400 - 80-20, -50, 0]) {
                            dovetail_saddle(160, 1);
                            //losmandy_style_dovetail_saddle(160,2);
                            translate([0, 0, 9]) color("white") dovetail_bar(100);
                            //cube([100,180,15]);
                            translate([0, -90, 28]) color("black") cylinder(h = 10, d = 50, center = true);

                            translate([0, 85, 30]) color("black") cylinder(h = 40, d = 10, center = true);
                            translate([ - 50, -90, 7 + 27]) color("white") cube([100, 180, 15]);
                            translate([0, 0, 50]) losmandy_style_dovetail_saddle(160, 1);
                        }
                    }

                }
            ////////////DEC赤纬-鸠尾槽-结束////////////
            }
            }
