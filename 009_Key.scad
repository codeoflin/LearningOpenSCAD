$fn=100;

HeadWidth=15;

//键帽的头部
module head(headwidth)
{
    union()
    {
        difference(){
            cube([headwidth,headwidth,10],center=true);
            translate([0,0,47])rotate([0,95,0])cylinder(r=50,h=30,center=true);
        }
        translate([0,0,-6]) difference(){
            cube([headwidth,headwidth,3],center=true);
            cube([headwidth-1,headwidth-1,3],center=true);
        }
    }
}

//接口处
module foot(headwidth)
{
    difference()
    {
        //圆柱体和横梁
        union()
        {
            cylinder(h=5,r=2.5,center=true);
            translate([0,0,2.5])cube([1,headwidth,2],center=true);
            translate([0,0,2.5])cube([headwidth,1,2],center=true);
        }
        //两个插槽
        union(){
            cube([1.5,3.8,10],center=true);
            cube([4.1,1.7,10],center=true);
        }
    }
}

union()
{
    translate([0,0,8])head(HeadWidth);
    foot(HeadWidth);
}