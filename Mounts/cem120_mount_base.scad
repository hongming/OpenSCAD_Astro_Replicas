mount_base_length=210;
mount_base_width=210;
mount_base_thickness=10;
mount_base_cylinder_diameter=200;
mount_base_cylinder_thickness=30;
mount_base_cylinder_length=135;
mount_base_column_thickness=20;
mount_base_column_width=120;
mount_base_column_height=80;

/////////////////////模块-赤道仪基座/////////////////////////////
cem120_mount_base();
module cem120_mount_base(){
//    color("silver")
cube([mount_base_length,mount_base_width,mount_base_thickness],center=true);


translate([0,0,mount_base_cylinder_thickness/2+mount_base_thickness/2]){
       //    color("silver")
    union(){
        
 
        translate([0,0,mount_base_cylinder_thickness/2+3])
            //基座大圆环商品的圆柱0.5里面
        cylinder(h=5,d=mount_base_cylinder_diameter,center=true);

    //基座大圆环
 
    cylinder(h=mount_base_cylinder_thickness,d=mount_base_cylinder_diameter,center=true);
        
        //后面的插座
    translate([0,(mount_base_length/2-mount_base_cylinder_length/2-2+2*mount_base_thickness),-mount_base_thickness])
        cube([mount_base_cylinder_length,mount_base_cylinder_length,mount_base_cylinder_thickness],center=true);
        //前面的突出部
        translate([0,-mount_base_cylinder_diameter/2/2,0])
        cube([110,110,mount_base_cylinder_thickness],center=true);
        
        
        
        }
        
    }

//立柱
translate([mount_base_cylinder_length/2-mount_base_column_thickness,-mount_base_column_width/2,mount_base_cylinder_thickness-mount_base_thickness/2])
    color("grey")
cube([mount_base_column_thickness,mount_base_column_width,mount_base_column_height]);
    
translate([-mount_base_cylinder_length/2,-mount_base_column_width/2,mount_base_cylinder_thickness-mount_base_thickness/2])
    color("grey")
cube([mount_base_column_thickness,mount_base_column_width,mount_base_column_height]);}