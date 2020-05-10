$fn=100;
module Front()
{
	difference()
	{
		cube([30,30,35],center=true);
		rotate([0,180,0])linear_extrude(height = 35, twist =0, scale = 20/26, center = true)circle(r=13);
		translate([0,50,0])cube([16,100,35],center=true);
	}
}

module Back(){
	difference()
	{
		cube([30,5,70],center=true);
		translate([0,2,28])rotate([90,00,0])cylinder(h=2,r=3,,center=true);
		translate([0,0,28])rotate([90,00,0])cylinder(h=100,r=1.5,,center=true);
		translate([0,2,-28])rotate([90,00,0])cylinder(h=2,r=3,,center=true);
		translate([0,0,-28])rotate([90,00,0])cylinder(h=100,r=1.5,,center=true);
	}
}

union()
{
	translate([0,-35.,0])Back();
	translate([0,-25,0])cube([30,20,35],center=true);
	Front();
}

//23
//9
//gap:16


//rotate([0,10,0])
/*
union(){
	cube([20,10,30]);
}
// */
