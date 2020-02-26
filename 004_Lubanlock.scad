//大小比例控制
Scale=1;
//长度
Height=Scale*50;
//宽度
Width=Scale*10;
//角度
Angle=0;
//偏差
Deviation=0.5;
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

//https://jingyan.baidu.com/article/7908e85c9c8227af481ad2a7.html
//根据id自动返回剪切器 参数:id,缩放级别,方条宽度,误差
module cutter(id,scale,cubewidth,deviation)
{
	//全宽
	width=cubewidth;
	//加误差全宽
	adwidth=width+deviation;
	//减误差全宽
	sdwidth=width-deviation;
	//半宽
	hwidth=width/2;
	//加误差半宽
	adhwidth=adwidth/2;
	//减误差半宽
	sdhwidth=sdwidth/2;
	//2
	if(id==0)translate([0,0,sdhwidth])	cube([width,adwidth*2,adhwidth]);
	//5
	if(id==1)union()	{
		translate([0,adhwidth,0])cube([adhwidth,adwidth,width]);
		translate([0,0,sdhwidth]) cube([width,adhwidth,adhwidth]);
		translate([0,adwidth*1.5,sdhwidth]) cube([width,adhwidth,adhwidth]);
	};
	//1
	if(id==2)union()	{
		translate([0,0,sdhwidth])	cube([cubewidth,adwidth,adhwidth]);
		translate([sdhwidth,adhwidth,0])	cube([adhwidth,adwidth,width]);
	};
	//3
	if(id==3)	union()	{
		translate([0,width,sdhwidth])cube([width,adwidth,adhwidth]);
		translate([sdhwidth,adhwidth,0])cube([adhwidth,adwidth,width]);
	};
	//4
	if(id==4)	union()	{
		translate([0,adhwidth,0])cube([adhwidth,adwidth,adhwidth]);
		translate([0,0,sdhwidth])cube([width,adwidth*2,adhwidth]);
	};
}
//调试剪切器
//translate([0,0,20])cutter(1,Scale,Width,1);

for(i=[0:5])
{
	translate([(Width+10)*i,0,0])rotate([0,Angle,0]) 	difference() {
		cube([Width,Height,Width]);
		translate([0,cutoffice(i,Scale,Width,Height),0]) cutter(i,Scale,Width,Deviation);
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
