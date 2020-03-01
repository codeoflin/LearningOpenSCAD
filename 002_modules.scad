// 是否显示东西
show=true;

// 缩放
scale=1;

if (show)html();

module mycylinder(h=10,r=10,center=true)
{
	linear_extrude(height = h, twist =0, scale = 1, center = center) circle(r=r,center=center);
}

module html(){
	union()
	{
		//"#" 让东西高亮
		#translate([0,30*scale,0]) head([0,0.3,0]);
		translate([0,0,0]) body();
	}
}

/**
*	c1: 头部颜色
*/
module head(c1){
	color(c1) sphere(10*scale);
}

module body(){
	difference() {
		rotate([90,0,0])mycylinder(h=40*scale,r=20*scale, center=true);
		//加个文本
		linear_extrude(height=scale*20, convexity=1)	text("L", size=scale*10,font="Bitstream Vera Sans",		halign="center",valign="center");
	}
}

//translate([30,0,0])linear_extrude(height=10, convexity=0)	text("L", size=scale*10,font="Bitstream Vera Sans",		halign="center",valign="center");
