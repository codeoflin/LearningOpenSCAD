//长度
Lenght=51.3;
//宽度
Width=43;
//高度
Height=8;
//墙壁厚度
Thickness=1;

//自攻螺丝孔 参数:高度,半径,螺丝半径
module ScrewHole(height,r,screwr)
{
	difference()
	{
		cylinder(height,r=r, center=false);
		cylinder(height-1,r=screwr, center=false);
	};
}

union()
{
	difference()
	{
		cube([Width,Lenght,Height]);
		translate([Thickness,Thickness,0]) cube([Width-Thickness*2,Lenght-Thickness*2,Height-Thickness]);
		//USBPort
		translate([Width-(20.5+Thickness),0,0]) cube([15.3,15,10]);
		//DebugPort
		translate([Width-((4*4)+Thickness),18,0]) cube([4*4,4,Height]);
		//GPIO1
		translate([0,Thickness*2,0]) cube([Thickness,Lenght-(Thickness*2)-3,Height-Thickness]);
		//GPIO2
		translate([Thickness+7,Thickness+1,Thickness]) cube([6,Lenght-(Thickness*2)-2,Height]);
	}
	// */
	//定位螺丝口
	translate([Width-(3+Thickness),4.3,0]) ScrewHole(Height,1.8, 1);
	//定位螺丝口
	translate([Width-(23+Thickness),4.3,0]) ScrewHole(Height,1.8, 1);
	//支撑柱
	for(i=[1:17])translate([0,2+(2.54*i),0]) cube([0.5,0.5,Height]);
}

//translate([Width-(20.5+Thickness),17.5,Height*2]) cube([10.5,3,Thickness]);