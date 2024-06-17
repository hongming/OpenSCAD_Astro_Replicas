$fn=50;
 
 difference(){
rotate([0,90,0])
difference(){
cylinder(h=250,d=70,center=true);
cylinder(h=300,d=62,center=true);
}



translate([-60-250/2+20,-30-5,-3]){
rotate([90,0,0]){
translate([0,0,-30]){
rotate([-5.5,0,0]){
color("red")
translate([60,5,0])
cube([15,5,50]);

color("blue")
translate([60+15+15,5,0])
cube([15,5,50]);

color("blue")
translate([60+15+15+15+15,5,0])
cube([15,5,50]);}}

}
}

//镜像
mirror([0,1,0])
{
translate([-60-250/2+20,-30-5,-3]){
rotate([90,0,0]){
 



translate([0,0,-30]){
rotate([-5.5,0,0]){
color("red")
translate([60,5,0])
cube([15,5,50]);

color("blue")
translate([60+15+15,5,0])
cube([15,5,50]);

color("blue")
translate([60+15+15+15+15,5,0])
cube([15,5,50]);}}

}
}


}


//translate([-250/2-5+20,0,0])
//color("red")
//rotate([90,0,90])
//import("mount_part2.stl");
//
//translate([-60-250/2+20,-30-5,0]){
//rotate([90-5.5,0,0]){
//import("mount.stl");
//
//
//}
//
//}


mirror([1,0,0])
{

translate([-60-250/2+20,-30-5,-3]){
rotate([90,0,0]){
translate([0,0,-30]){
rotate([-5.5,0,0]){
color("red")
translate([60,5,0])
cube([15,5,50]);

color("blue")
translate([60+15+15,5,0])
cube([15,5,50]);

color("blue")
translate([60+15+15+15+15,5,0])
cube([15,5,50]);}}

}
}

//镜像
mirror([0,1,0])
{
translate([-60-250/2+20,-30-5,-3]){
rotate([90,0,0]){
 



translate([0,0,-30]){
rotate([-5.5,0,0]){
color("red")
translate([60,5,0])
cube([15,5,50]);

color("blue")
translate([60+15+15,5,0])
cube([15,5,50]);

color("blue")
translate([60+15+15+15+15,5,0])
cube([15,5,50]);}}

}
}


}
}


translate([0,0,26])
cube([200,50,20],center=true);



translate([0,0,-27])
cube([300,70,40],center=true);

}



difference(){
color("red")
translate([0,0,-5])
cube([250,70,5],center=true);

translate([0,0,-5])
cylinder(h=10,d=20,center=true);

translate([50,0,-5])
cylinder(h=10,d=20,center=true);


translate([100,0,-5])
cylinder(h=10,d=20,center=true);

translate([-50,0,-5])
cylinder(h=10,d=20,center=true);


translate([-100,0,-5])
cylinder(h=10,d=20,center=true);

for(i=[0:60:360]){
rotate([0,0,i])
translate([20,0,-5])
cylinder(h=10,d=6.5,center=true);
}
}