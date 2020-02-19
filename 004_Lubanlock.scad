//大小比例控制
Scale=1;
//长度
Height=Scale*50;
//宽度
Width=Scale*10;

//根据id自动返回切割位置 参数:id,缩放级别,方条宽度
function cutoffice(id,scale,cubewidth,cubeheight)=cubewidth*1.5;
/* 把上面的结尾改成这个,可以修改每个部件的切割位置
=
	(id==0)?((cubeheight-(cubewidth*2))/2):
	(id==1)?(cubewidth*1.5):
	(id==2)?0:
	(id==3)?0:
	(id==4)?0:
	(id==5)?0:0;
	// */	

//根据id自动返回剪切器 参数:id,缩放级别,方条宽度
module cutter(id,scale,cubewidth)
{
	if(id==0)translate([0,0,cubewidth/2])	cube([cubewidth,cubewidth*2,cubewidth/2]);
	if(id==1)union()	{
		translate([0,0,cubewidth/2])cube([cubewidth/2,cubewidth*2,cubewidth/2]);
		translate([0,cubewidth,0])cube([cubewidth/2,cubewidth/2,cubewidth/2]);
		translate([cubewidth/2,0,cubewidth/2]) cube([cubewidth/2,cubewidth/2,cubewidth/2]);
		translate([cubewidth/2,cubewidth*1.5,cubewidth/2]) cube([cubewidth/2,cubewidth/2,cubewidth/2]);
	};
	if(id==2)union()	{
		translate([cubewidth/2,0,cubewidth/2])	cube([cubewidth/2,cubewidth*2,cubewidth/2]);
		translate([0,0,cubewidth/2])	cube([cubewidth/2,cubewidth,cubewidth/2]);
	}
	if(id==3)	union()	{
		translate([0,0,cubewidth/2])cube([cubewidth,cubewidth/2,cubewidth/2]);
		translate([0,cubewidth,cubewidth/2])cube([cubewidth,cubewidth,cubewidth/2]);
		translate([cubewidth/2,cubewidth/2,0])cube([cubewidth/2,cubewidth,cubewidth]);
	};
	if(id==4)	union()	{
		translate([0,cubewidth/2,0])cube([cubewidth/2,cubewidth,cubewidth/2]);
		translate([0,0,cubewidth/2])cube([cubewidth,cubewidth*2,cubewidth/2]);
	};
}
//调试剪切器
//translate([0,0,20])cutter(1,Scale,Width);

for(i=[0:5])
{
	translate([(Width+5)*i,0,0])	difference() {
		cube([Width,Height,Width]);
		translate([0,cutoffice(i,Scale,Width+0.1,Height),0]) cutter(i,Scale,Width);
	}
}

/* 另一个版本的6根锁,有空再研究
//根据id自动返回剪切器 参数:id,缩放级别,方条宽度
module cutter(id,scale,cubewidth)
{
	if(id==0)	translate([0,0,Width/2])	{
		cube([cubewidth,cubewidth,cubewidth/2]);
		translate([0,cubewidth*1.5,0]) cube([cubewidth,cubewidth/2,cubewidth/2]);
	};
	if(id==1)	union()	{
		cube([cubewidth/2,cubewidth*1.5,cubewidth]);
		translate([0,cubewidth/2,cubewidth/2]) cube([cubewidth,cubewidth,cubewidth/2]);
	};
		if(id==2)translate([0,0,cubewidth/2])	cube([cubewidth,cubewidth,cubewidth/2]);
	if(id==3)	union()	{
		cube([cubewidth/2,cubewidth*2,cubewidth]);
		translate([0,cubewidth/2,cubewidth/2]) cube([cubewidth,cubewidth,cubewidth/2]);
	};
}
// */
