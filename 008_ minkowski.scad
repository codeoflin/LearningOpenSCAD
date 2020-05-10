height = 10;
length = 10;
width = 20;
bevelRadius = 2;
$fn = 100;
translate([0,0,0])
difference()
{
    minkowski()
    {
      cylinder(r=bevelRadius,h=height/2,center=true);
      cube([length-2*bevelRadius, width-2*bevelRadius,height/2],center=true);
    }
    translate([0,0,1])minkowski()
    {
      cylinder(r=bevelRadius,h=height/2 ,center=true);
      cube([length-2*bevelRadius -1, width-2*bevelRadius-1,height/2],center=true);
    }
}

//sphere(r=32);