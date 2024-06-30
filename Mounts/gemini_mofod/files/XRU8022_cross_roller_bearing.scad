
XRU8022_cross_roller_bearing();
module XRU8022_cross_roller_bearing(){
color("silver")
difference(){cylinder(h=22,d=165,center=true);
cylinder(h=24,d=80,center=true);
for(i=[0:36:360]){
    rotate([0,0,i])
    translate([0,74,0]){
        cylinder(h=24,d=9.5,center=true);
        }
    }
for(i=[0:36:360]){
    rotate([0,0,i])
    translate([0,48,0]){
        cylinder(h=24,d=6,center=true);
        }
    }
    
    
    
    difference(){cylinder(h=24,d=125,center=true);
cylinder(h=26,d=120,center=true);}

}

color("black")
    difference(){cylinder(h=16,d=125,center=true);
cylinder(h=10,d=120,center=true);
        cylinder(h=24,d=80,center=true);
        }
color("black")      
for(i=[0:36:360]){
    rotate([0,0,i])
    translate([0,74,0]){
        cylinder(h=10,d=9.5,center=true);
        }
    }}