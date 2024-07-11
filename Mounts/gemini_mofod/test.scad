/////////////////////////////Modules
 include <config.scad>;
 include <../../Telescopes/RASA11.scad>;
 include <modules.scad>;

rasa_array_angel=0;
 //RASA整列   
rasa11_array();
module rasa11_array(){
    
    rotate([90,0,rasa_array_angel]){
        
        cube([140,800,40],center=true);
        
         translate([-300,330/2+10,330/2+10+20])
        rotate([0,90,0]){
            translate([0,0,700])
            rotate([0,0,90])
            color("red")
            RASA11();
            
            /*    cylinder(h=900,d=330);
                translate([0,0,900])
                cylinder(h=150,d=90);
            */
            }

         translate([-300,330/2+10,-330/2-10-20])
        rotate([0,90,0]){
            translate([0,0,700])
                        rotate([0,0,90])
            RASA11();
            }


         translate([-300,-330/2-10,330/2+10+20])
        rotate([0,90,0]){
            translate([0,0,700])
                        rotate([0,0,90])
            RASA11();
            }

         translate([-300,-330/2-10,-330/2-10-20])
        rotate([0,90,0]){
            translate([0,0,700])
                        rotate([0,0,90])
            RASA11();
            }
            } 
   
   /*  
     rotate([0,0,90-rasa_array_angel]){
         translate([-500,330/2+10,330/2+10])
        rotate([0,90,0]){
                cylinder(h=900,d=330);
                translate([0,0,900])
                cylinder(h=150,d=90);}

         translate([-500,330/2+10,-330/2-10])
        rotate([0,90,0]){
                cylinder(h=900,d=330);
                translate([0,0,900])
                cylinder(h=150,d=90);}


         translate([-500,-330/2-10,330/2+10])
        rotate([0,90,0]){
                cylinder(h=900,d=330);
                translate([0,0,900])
                cylinder(h=150,d=90);}

         translate([-500,-330/2-10,-330/2-10])
        rotate([0,90,0]){
                cylinder(h=900,d=330);
                translate([0,0,900])
                cylinder(h=150,d=90);}
            }
            */
     
     }