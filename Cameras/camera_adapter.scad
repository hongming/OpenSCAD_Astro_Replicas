$fn=30;
translate([0,-9,0])
difference(){
cube([34,34,3],center=true);

//固定孔位
translate([34/2-3,34/2-3,-1])
cylinder(h=3,d=2.2,center=true);
translate([34/2-3,34/2-3,2])
cylinder(h=4,d=3.5,center=true);

//对角  
translate([-1*(34/2-3),-1*(34/2-3),-1])
cylinder(h=3,d=2.2,center=true);
translate([-1*(34/2-3),-1*(34/2-3),2])
cylinder(h=4,d=3.5,center=true);
//线孔
translate([4,0,0])    
    cube([30,10,5],center=true); 
    }
 
    translate([-17,-6,1.5])
cube([5,14,80]);



    
    translate([-17,-13+3,+1.5+70-4+10])
cube([16,20,4]);
 