$fn=200;

eaf();
module eaf(){

//主体
translate([0,2,0])
color("red")
cube([41,57,52]);

difference(){
//银色盖板    
color("silver")
cube([41,2,52]);

//旋转部件
translate([20.5,2,34]){
rotate([90,0,0]){
color("white")
cylinder(h=3,d=22); } 
    }
}
    
//旋转部件
translate([20.5,2,34]){
rotate([90,0,0]){
color("white")
cylinder(h=14,d=5);   } 
    }
 

//USB
translate([15.5,60,34-5])
rotate([90,0,0])
color("black")
cube([10,10,10]);

//手柄插孔
difference(){
translate([15.5+15,59.5,38])
rotate([90,0,0])
color("silver")
cylinder(h=1,d=6);

translate([15.5+15,60,38])
rotate([90,0,0])
color("black")
cylinder(h=2,d=4);}
translate([15.5+15,59,38])
rotate([90,0,0])
color("black")
cylinder(h=2,d=4);





//螺丝
color("black"){
for(i=[
  [3,0,3],[38,0,3],[3,0,49],[38,0,49]
])
translate(i)
rotate([90,0,0])
color("silver")
translate([0,0,-60])
cylinder(h=61,d=6);

for(i=[
  [6,0,30],[35,0,30]
])
translate(i)
rotate([90,0,0])
color("silver")
cylinder(h=1,d=8);

for(i=[
  [10,0,6],[31,0,6]
])
translate(i)
rotate([90,0,0])
color("silver")
cylinder(h=5,d=4);}

//支架
color("silver")
translate([5,-4,-10])
cube([30,4,20]);


color("silver")
translate([5,-4-10,-10])
cube([30,10,4]);

difference(){
color("silver")
translate([0,-55-4,-10])
cube([41,45,4]);

//镂空
translate([4,-20,-12])
cube([32,3,8]);
translate([4,-20-6,-12])
cube([32,3,8]);
translate([4,-20-6-6,-12])
cube([32,3,8]);
translate([4,-20-6-6-6,-12])
cube([32,3,8]);
translate([4,-20-6-6-6-6,-12])
cube([32,3,8]);

translate([4,-20-6-6-6-6-13,-12])
cube([32,3,8]);
}






color("silver")
difference(){
union(){
translate([0,-50,4-10])
cube([41,2,35]);
translate([0,-50-2,4-10])
cube([41,2,10]);
translate([0,-50+2,4-10])
cube([41,2,10]);
translate([20.5,-50+2+2,34]){
rotate([90,0,0]){
cylinder(h=4,d=41); } 
    }
}
//中间孔
color("silver")
translate([20.5,-50+5,34]){
rotate([90,0,0]){
cylinder(h=6,d=20); } 
    }
}




}