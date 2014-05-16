$fn = 50;

s = 1.3;

x = 55*s;
y = 41*s; 
z = 9.6;

ultra = 18*s;

cylHeight = 17.2;
cylRad = 9.6/2;

oddCylShift = ultra*sin(45);
echo(oddCylShift);
module cyl(){
	cylinder(r=cylRad, h=cylHeight);
}

module mainPart() {
	union(){
		difference(){
			cube([x,y,z]);
			translate([x,y,ultra/3])
			rotate([0,0,45])
			%cube([ultra,ultra,ultra], center=true);
		}
		
		cyl();
		
		translate([x,0,0])
		cyl();
		
		translate([0,y,0])
		cyl();
	
		translate([x,y-oddCylShift,0])
		cyl();
		
		translate([x-oddCylShift,y,0])
		cyl();
	}
}

mainPart();