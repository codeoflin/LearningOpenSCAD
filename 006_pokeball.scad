//南半球颜色
CoverColor="red";
//北半球颜色
BottomColor="white";
//中环颜色
RingColor="Black";
//球半径
ball_r=200;
//按钮半径
button_r=ball_r/5;
button_height=ball_r/10;
//半球模型
module halfball(r)
{
	difference()
		{
			sphere(r=r,center=true);
			translate([0,0,r])cube([r*2,r*2,r*2],center=true);
		}
}

union()
{
	//南半球
	color(BottomColor) halfball(ball_r);
	//北半球
	color(CoverColor)	translate([0,0,0.1]) rotate([180,0,0])halfball(ball_r);
	//黑环 两个方案 二选一
	//color(RingColor) translate([0,0,-(ball_r/8)]) rotate_extrude(angle=360, convexity = 0) square([ball_r+3,(ball_r/4)]);
	color(RingColor) translate([0,0,0]) cylinder(h=ball_r/4,r=ball_r,center=true);
	//按钮黑边
	color(RingColor) translate([0,0,0]) rotate([90,0,0]) cylinder(h=ball_r,r=button_r*2,center=false);
	//按钮白边
	color(BottomColor) translate([0,0,0]) rotate([90,0,0]) cylinder(h=ball_r+1,r=button_r*1.5,center=false);
	//按钮
	color(BottomColor) translate([0,0,0]) rotate([90,0,0]) cylinder(h=ball_r+button_height,r=button_r,center=false);
}

