
include <config.scad>;
include <../../Telescopes/RASA11.scad>;

rotate([0,0,rasa_array_angel]){
         translate([-300,330/2+10,330/2+10])
        rotate([0,90,0]){
            translate([0,0,700])
            rotate([0,0,90])
            RASA11();
            
            /*    cylinder(h=900,d=330);
                translate([0,0,900])
                cylinder(h=150,d=90);
            */
            }

         translate([-300,330/2+10,-330/2-10])
        rotate([0,90,0]){
            translate([0,0,700])
                        rotate([0,0,90])
            RASA11();
            }


         translate([-300,-330/2-10,330/2+10])
        rotate([0,90,0]){
            translate([0,0,700])
                        rotate([0,0,90])
            RASA11();
            }

         translate([-300,-330/2-10,-330/2-10])
        rotate([0,90,0]){
            translate([0,0,700])
                        rotate([0,0,90])
            RASA11();
            }
            }