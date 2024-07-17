$fn=360;
rasa11_dew_diameter_out=150;
rasa11_dew_diameter_thickness=3;
sector_thickness=3;
sector_height=40;

difference(){
rotate([0,0,-15]){
rotate_extrude(angle=30,convexity=2){
translate([rasa11_dew_diameter_out-sector_thickness/2-rasa11_dew_diameter_thickness/2,0,0])
square([sector_thickness,sector_height],center=true);

translate([rasa11_dew_diameter_out+sector_thickness/2+rasa11_dew_diameter_thickness/2,0,0])
square([sector_thickness,sector_height],center=true);
}

translate([0,0,sector_height/2+sector_thickness/2])
 
rotate_extrude(angle=30,convexity=2){
translate([rasa11_dew_diameter_out,0,0])
square([rasa11_dew_diameter_thickness+2*sector_thickness,sector_thickness],center=true);
}}


 translate([rasa11_dew_diameter_out-rasa11_dew_diameter_thickness/2-sector_thickness-12.5/2+2,0,10+sector_thickness])
 cylinder(h=100,d=12.5,center=true);

}


 translate([rasa11_dew_diameter_out-rasa11_dew_diameter_thickness/2-sector_thickness-12.5/2+2,0,-10+5.5])
difference(){
translate([-1.5,0,-2.5])
cube([12.5+3,12.5+6,55+5],center=true);
color("red")
translate([0,0,1])
cylinder(h=55+2,d=12.5,center=true);
cylinder(h=75,d=5,center=true);}