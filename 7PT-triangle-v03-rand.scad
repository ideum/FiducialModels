$fn = 50;

s = 1.3;

x = 55*s;
y = 41*s; 
z = 9.6;

ultra = 18*s;

cylHeight = 17.2;
cylRad = 9.6/2;

oddCylShift = ultra*sin(30);

module cyl(){
	cylinder(r=cylRad, h=cylHeight);
}

module centerEquilateralTriangle(count, distance){
	cir = 360;
	rot = cir/count;
	for(i = [1:count], randRot = i*rands(110,rot,1)[0]){
		echo("sub rotation ", i, randRot);
		rotate([0,0,randRot])
		translate([rands(14,distance,1)[0],0,0])
		cyl();
	}
}

module mainPart() {
	randFullRot = rands(0,360,1)[0];
	union(){
		cube([x,y,z]);
		
		cyl();
		
		translate([x,0,0])
		cyl();
		
		translate([0,y,0])
		cyl();

		translate([x,y,0])
		cyl();
		
		echo("full-rot:", randFullRot);
		translate([x/2, y/2,0])
		rotate([0,0,randFullRot])
		centerEquilateralTriangle(3, 16);
	}
}

mainPart();