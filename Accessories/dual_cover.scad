dual_cover("Yes");

//罩子

module dual_telescopes_cover(cover_diameter,cover_length,dual_telescopes_cover){
rotate([-90,-60,0])
difference(){
    $fn=12;
cylinder(h=cover_length,d=cover_diameter,center=true);
cylinder(h=cover_length*2,d=cover_diameter-40,center=true);
translate([0,cover_diameter/2,0])
cube([cover_diameter*2,cover_diameter,cover_length*2],center=true);

rotate([0,0,80])
translate([cover_diameter,0,0])
cube([cover_diameter*2,cover_diameter,cover_length*2],center=true);
}

}

module dual_cover(dual_telescopes_cover){

//罩子拼接下面的立柱
if (dual_telescopes_cover=="Yes")
{
    translate([-200,0,0])
dual_telescopes_cover(1200,1400);

translate([-200,-600,0])
cube([200,20,20]);
translate([-200,-600,-800])
cube([20,20,800]);

mirror([0,1,0])
{
    translate([-200,-600,0])
cube([200,20,20]);
translate([-200,-600,-800])
cube([20,20,800]);
    }
    
mirror([1,0,0])
    {
        translate([-200,0,0])
dual_telescopes_cover(1200,1400);

translate([-200,-600,0])
cube([200,20,20]);
translate([-200,-600,-800])
cube([20,20,800]);

mirror([0,1,0])
{
    translate([-200,-600,0])
cube([200,20,20]);
translate([-200,-600,-800])
cube([20,20,800]);
    }
        }
    }
}