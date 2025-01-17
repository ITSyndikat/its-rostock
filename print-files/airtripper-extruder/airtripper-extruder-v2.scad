// Airtripper's Bowden 3D Printer Extruder
// by Airtripper May  � 2012
// airtripper.com
// It is licensed under the Creative Commons - GNU GPL license. 

// Printable extruder parts

translate([0,0,0]) rotate([0,0,270]) extruder_block();
//extruder_idler_608z();
//support_strut();
//axle_8mm();


// Assembled components

//extruder();
//idler_608z();
//stepper_kit();


// Non printable hardware components

//nema17();
//insert();
//bearing(5, 10, 4);
//bearing(8, 22, 7);
//m4_bolt(40);



nema_l=71.5; // Stepper total length
nema_x=42;
nema_y=42;
nema_z=47.4;
screw_l=30;
insert_l=15; // Filament gripper insert length



// ##########################################################

module axle_8mm() {
	cylinder(16,r=3.80, $fn=40);
	// Support flange while printing
	translate([-5,-0.5,0]) cube([10,1,1]);
	translate([-0.5,-5,0]) cube([1,10,1]);
	difference() {
		cylinder(1,r=10, $fn=40);
		translate([0,0,-1]) cylinder(3,r=5, $fn=40);
	}
}


// ##########################################################

module extruder_idler_608z() {
	//translate([0,0,6]) rotate([0,90,0]) bearing(8, 22, 7);
	difference() {
		union() {
			difference() {
				translate([0,0,7]) cube([20,42,14], center = true);
				// Bearing housing
				//translate([-6,0,8]) cube([10,50,20], center = true);
				translate([0,0,1]) cube([10,24,10], center = true);
				translate([-5,0,6]) rotate([0,90,0]) cylinder(10,r=12, $fn=60);
			}
			// Axle spacer
			translate([-8,0,6]) rotate([0,90,0]) cylinder(16,r=6, $fn=40);
			translate([0,0,3]) cube([16,12,6], center = true);
		}
		union() {
			// Bearing axle cut-out
			translate([-8,0,6]) rotate([0,90,0]) cylinder(16,r=4.25, $fn=40);
			translate([0,0,2]) cube([16,8.5,8], center = true);
			translate([-3.6,0,6]) rotate([0,90,0]) cylinder(7.2,r=12, $fn=60);
			// hook
			translate([-9,-15.5,6]) rotate([0,90,0]) cylinder(22,r=2, $fn=25);
			translate([0,-18.5,11]) cube([22,10,10], center = true);
			translate([9,-17,1]) cube([3,16,16], center = true);
			translate([-9,-17,1]) cube([3,16,16], center = true);
			translate([0,-21,0]) rotate([45,0,0]) cube([24,6,10], center = true);
			translate([-11,-12,9.6]) rotate([0,135,0]) cube([4,6,6], center = true);
			translate([11,-12,9.6]) rotate([0,45,0]) cube([4,6,6], center = true);
			// Bolt slots
			translate([6,20,7]) cube([3.5,10,16], center = true);
			translate([-6,20,7]) cube([3.5,10,16], center = true);
			translate([0,24,7]) rotate([154,0,0]) cube([22,10,26], center = true);
			translate([0,25.5,7]) cube([22,10,16], center = true);
			//Padding
			//translate([-9,-17,7]) cube([6,10,16], center = true);
		}
	}

}


// #########################################################

// Revision 2

module extruder_block() {
	difference() {
		union() {
			// Extruder base
			translate([0,0,1.5]) cube([42,42,3], center = true);

			// Bearing supports between screw columns and shaft bearing
			rotate([0,0,45]) translate([0,11,13]) cube([3,22,26], center = true);
			rotate([0,0,315]) translate([0,-11,13]) cube([3,22,26], center = true);
			difference() {
				translate([-3,0,22]) cylinder(8,r1=4, r2=4, $fn=50, center = true);
				rotate([0,90,0]) translate([-17,0,-10]) cylinder(8,r=4, $fn=50);
			}

			// M3 Screw columns for stepper attachment
			translate([-15.5,15.5,0]) cylinder(29,r=4, $fn=30);
			translate([-15.5,-15.5,0]) cylinder(23.5,r=4, $fn=30);

			// fixing plate
			difference() {
				translate([-20,0,10]) cube([3,74,20], center = true);
				union() {

					// fixing plate cutout
					translate([-20,0,12]) cube([6,30,18], center = true);
					translate([-20,34,0]) rotate([45,0,0]) cube([6,16,7], center = true);
					translate([-20,-34,0]) rotate([135,0,0]) cube([6,16,7], center = true);
					translate([-20,34,20]) rotate([135,0,0]) cube([6,16,7], center = true);
					translate([-20,-34,20]) rotate([45,0,0]) cube([6,16,7], center = true);
					// M6 bolt holes
					translate([-23,30.5,10]) rotate([0,90,0]) cylinder(6, r=3.5, $fn=25);
					translate([-23,-30.5,10]) rotate([0,90,0]) cylinder(6, r=3.5, $fn=25);
					// just holes
					translate([-23,21.5,10]) rotate([0,90,0]) cylinder(6, r=3, $fn=25);
					translate([-23.8,-21.5,10]) rotate([0,90,0]) cylinder(6, r=3, $fn=25);
				}
			} // End of fixing plate
		}
		union() {
			// Stepper shaft, gear insert and bearing cut-out
			translate([0,0,10]) cylinder(20,r1=13, r2=5, $fn=50, center = true);
			translate([0,0,22]) cylinder(5,r=5, $fn=50, center = true);
			translate([0,0,27]) cylinder(8	,r=4, $fn=50, center = true);
			translate([0,0,25.5]) cylinder(2,r1=5, r2=4, $fn=50, center = true);
			#translate([0,0,10.5]) cylinder(8	,r=7, $fn=100);
			#translate([0,0,18.5]) cylinder(3.5,r1=7, r2=3.5, $fn=50);

			// Reduce wall and screw shaft for strut placement
			translate([-15.5,-15.5,23.5]) cylinder(5,r=3, $fn=30);
			translate([-12.5,-15.5,25.5]) cube([12,9,4], center = true);
			translate([-11.4,-11.4,27.9]) rotate([25,0,315]) cube([5,10,5], center = true);

			// just a hole in walls
			//#translate([-13,-7,15]) rotate([90,0,45]) cylinder(6, r=4, $fn=25);
			//#translate([-6,9,15]) rotate([90,0,315]) cylinder(6, r=2, $fn=25);
			//#translate([-9,-4,22]) rotate([90,0,45]) cylinder(6, r=2, $fn=25);
			//#translate([-4,9,22]) rotate([90,0,315]) cylinder(6, r=2, $fn=25);

			// Just a hole in base
			translate([16,0,-1]) cylinder(5, r=2.5, $fn=25);
			translate([0,-16,-1]) cylinder(5, r=2.5, $fn=25);
			translate([-15,0,-1]) cylinder(5, r=2, $fn=25);

			// M3 screw holes
			for(r=[1:4]) {
				rotate([0,0,r*360/4]) translate([15.5,15.5,-1]) cylinder(40,r=1.75, $fs=.1);
			}
			translate([-15.5,15.5,26]) cylinder(4,r=3, $fn=30);
			translate([15.5,15.5,1]) cylinder(4,r=3.25, $fs=.1);

		}
	}
	// Filament in-feed bracket
	difference() {
		union() {
			translate([3.7,-22,10]) cube([10,3,20], center = true);
			translate([5,-15,7]) cube([3,12,12], center = true);
			translate([4.8,-9,15]) rotate([90,0,0]) cylinder(14, r=3.5, $fn=50);
		}
		translate([4.8,-8,15]) rotate([90,0,0]) cylinder(18, r=1.5, $fn=25);
		translate([4.8,-22,15]) rotate([90,0,0]) cylinder(4, r1=1.1, r2=4, $fn=25);
		translate([0,0,10]) cylinder(20,r1=13, r2=5, $fn=50, center = true);
		#translate([5,-12,13]) cube([10,10,20], center = true);
	}
	// Bowdon out-feed tube holder
	difference() {
		union() {
			translate([4.8,14,13]) cube([8,14,26], center = true);
			translate([4.8,24.5,10]) cube([14,8,20], center = true);
			translate([-5.5,12.5,13]) cube([13.5,3,26], center = true);
			//#translate([0,17,13]) cube([2,7,20], center = true);
			translate([3.3,20.5,13]) cube([11,2,26], center = true);
		}
		union() {
			// Tube and filament holes
			translate([4.8,37,15]) rotate([90,0,0]) cylinder(16, r=2.25, $fn=25);
			translate([4.8,24,15]) rotate([90,0,0]) cylinder(20, r=1.5, $fn=25);
			translate([5.3,10,15]) rotate([90,0,0]) cylinder(4, r1=0.4, r2=3, $fn=25);

			// Insert and idler clearance
			translate([0,0,10]) cylinder(20,r1=13, r2=5, $fn=50, center = true);

			// M3 bolt holes
			translate([3,17,20.5]) rotate([0,90,0]) cylinder(10, r=2.75, $fn=25);
			translate([3,17,9.5]) rotate([0,90,0]) cylinder(10, r=2.75, $fn=25);
			translate([-0.5,17,20.5]) rotate([0,90,0]) cylinder(10, r=2, $fn=25);
			translate([-0.5,17,9.5]) rotate([0,90,0]) cylinder(10, r=2, $fn=25);

			// m4 nut slot
			translate([4.8,24,16]) cube([7.2,3.2,9.2], center = true);
			translate([4.8,27,19.5]) cube([4.5,3.2,9.2], center = true);

			// just a hole
			translate([4.8,38,6]) rotate([90,0,0]) cylinder(16, r=4.5, $fn=25);
			translate([-3.5,16,9.5]) rotate([90,0,0]) cylinder(6, r=3.5, $fn=25);
			translate([-3.5,16,20.5]) rotate([90,0,0]) cylinder(6, r=3.5, $fn=25);

			// Bowden filament guide in-feed Cut off
			translate([8,7.5,14]) rotate([0,0,35]) cube([8,4,28], center = true);
			translate([4.5,8.5,23.5]) cube([10,4,10], center = true);
		}
	}
	
}

// #########################################################

//support_strut();

module support_strut() {

	difference() {
		union() {
			translate([-15.5,0,0]) color("red") cylinder(6, r=4, $fn=30);
			translate([15.5,0,0]) color("red") cylinder(6, r=4, $fn=30);
			translate([-15.5,-3.5,0]) color("red") cube([31,7,6]);
		}
		union() {
			// Screw holes
			translate([-15.5,0,-1]) color("red") cylinder(5, r=1.75, $fn=30);
			translate([15.5,0,-1]) color("red") cylinder(5, r=1.75, $fn=30);
			translate([-15.5,0,3]) color("red") cylinder(5, r=3, $fn=30);
			translate([15.5,0,3]) color("red") cylinder(5, r=3, $fn=30);
		}
	}
}


// #########################################################

module extruder() {
	translate([0,0,-nema_z]) stepper_kit();
	extruder_block();
	translate([10,0,15]) rotate([0,90,-2]) idler_608z();
	translate([0,-15.5,23.5]) support_strut();
	translate([15.5,-15.5,4]) spacer(3,6.5,3);
	translate([-1.4,17,20.5]) rotate([0,90,0]) m3_bolt(40);
	translate([-1.4,17,9.5]) rotate([0,90,0]) m3_bolt(40);
}

// #########################################################

module idler_608z() {
	translate([0,0,6]) rotate([0,90,0]) bearing(8, 22, 7);
	extruder_idler_608z();
}


// #########################################################


// stepper_kit();

module stepper_kit() {
	union() {
		nema17();
		translate([0,0,nema_l-2]) bearing(5, 10, 4);
		translate([0,0,nema_l-insert_l-4]) insert();
		// translate([13.57,0,nema_l-9]) bearing(4, 17.5, 8);
		rotate([90,0,0]) translate([4.825,nema_l-9,0]) color("blue") cylinder(100, r=0.875, center = true, $fs=.1);
	}

}


// #########################################################

//bearing(6, 19, 6);
module bearing(id, od, w) {
	difference() {
		union() {
			translate([0,0,0]) color("red") cylinder(w,r=od/2, center = true, $fs=.1);
		}
		union() {
			translate([0,0,0]) cylinder(w+2,r=od/2-1, center = true, $fs=.1);
		}
	}
	difference() {
		union() {
			translate([0,0,0]) color("red") cylinder(w,r=id/2+1, center = true, $fs=.1);
			translate([0,0,0]) color("black") cylinder(w-0.5,r=od/2-1, center = true, $fs=.1);
		}
		union() {
			translate([0,0,0]) cylinder(w+2,r=id/2, center = true, $fs=.1);
		}
	}
}

// #########################################################

//insert();
module insert() {
//insert_l=15; // Filament gripper insert length
	difference() {
		union() {
			translate([0,0,0]) color("gold") cylinder(5.3,r=6.25, $fa=60); // Nut part of insert
			translate([0,0,5.3]) color("gold") cylinder(9.7,r=3.95, $fs=.1); // Teeth part
		}
		union() {
			translate([0,0,-1]) cylinder(17,r=2.5, $fs=.1); // Insert bore
		}
	}
}

// #########################################################

module nema17() {
// Stepper body size
//nema_x=42;
//nema_y=42;
//nema_z=47.4;
//screw_l=16;
// Stepper body silver end caps z length
body = nema_z/100*50;
cap = nema_z/100*25;

	difference() {
		union() {
			translate([-nema_x/2,-nema_y/2,cap]) color("black") cube([nema_x,nema_y,body]);
			translate([-nema_x/2,-nema_y/2,0]) color("silver") cube([nema_x,nema_y,cap]);
			translate([-nema_x/2,-nema_y/2,cap+body]) color("silver") cube([nema_x,nema_y,cap]);
			translate([0,0,cap*2+body]) color("grey") cylinder(1.7,r=11, $fs=.1);
			translate([0,0,cap*2+body+1.7]) color("silver") cylinder(22.5,r=2.5, $fs=.1);
		}
		union() {
			for(r=[1:4]) {
				rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5]) cylinder(6,r=1.5, $fs=.1);
			}

		}
	}
	for(r=[1:4]) {
		rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5]) color("Goldenrod") cylinder(screw_l,r=1.5, $fs=.1);
		// rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5+screw_l]) color("Goldenrod") cylinder(1.8,r=2.8, $fs=3);
	}
}

// #########################################################

module screw() {
	for(r=[1:4]) {
		rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5]) color("Goldenrod") cylinder(screw_l,r=1.5, $fs=.1);
		rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5+screw_l]) color("Goldenrod") cylinder(1.8,r=2.8, $fs=3);
	}
}

// #########################################################

//spacer();

module spacer(h, od, id) {
	difference() {
		translate([0,0,0]) color("black") cylinder(h,r=od/2, $fs=.1);
		translate([0,0,-1]) color("black") cylinder(h+2,r=id/2, $fs=.1);
	}

}

// #########################################################

//m3_bolt();

module m3_bolt(l) {

		translate([0,0,2.2]) color("silver") cylinder(l,r=1.5, $fs=.1); // Bolt
		translate([0,0,0]) color("silver") cylinder(2.2,r=2.75, $fa=60); // Head


}
// #########################################################

//module_name();

module module_name() {
	difference() {
		union() {
			// Code1
		}
		union() {
			// Code 2
		}
	}
}
