$fn=100;
difference(){
translate([0,18,0]){
cube([72,36,4],center=true);
translate([0,18+22,0])
cube([40,44,4],center=true);}

translate([0,65,0])
cylinder(h=20,d=10,center=true);

translate([30,18,0])
cylinder(h=20,d=6,center=true);

translate([-30,18,0])
cylinder(h=20,d=6,center=true);

}

