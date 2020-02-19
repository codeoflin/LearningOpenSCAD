//测试1,测试使用linear_extrude函数产生螺纹
module test1(width=5){
    height = width*4;
    //square,在中心点创建一个方形,通过不断向上延伸并旋转,来制造螺纹
    //linear_extrude修饰后会向上并旋转,参数为: 高度,向上延伸时旋转的总角度,向上衍生时缩放的总倍数,
    linear_extrude(height = height, twist =height*18, scale = 1, center = false, slices = 500)  square([width,width], center = true);//circle(r=width);//
    translate([50,50,0])square([10,10], center = true);
}
//test1(5);

//模块Pinhead_2d,创造一个2d针头  参数分别是:针体长度 针体宽度 针尖长度
module Pinhead_2d(bodylen=100,bodywidth=50,headlen=30){
	polygon(points=[[0,0],[bodylen,0],[bodylen+headlen,bodywidth/2],[bodylen,bodywidth],[0,bodywidth]]);
}

//把针头立起来,平面螺旋  似乎不行
rotate_extrude(angle=36l0, convexity = 0) Pinhead_2d(55,20,30);

//rotate_extrude(angle=270, convexity=10) Pinhead_2d(55,20,30);

//linear_extrude(height = 10, center = false, convexity = 10, twist = 360, $fn = 100)translate([2, 0, 0])Pinhead_2d(55,20,30);

module screw(type = 2, r1 = 15, r2 = 20, n = 7, h = 100)
{
	//linear_extrude(height = h, twist = 360*t/n, convexity = 8)
	difference() {
		circle(r2);
		for (i = [0:n-1]) {
				if (type == 1) rotate(i*360/n) polygon([
						[ 2*r2, 0 ],
						[ r2, 0 ],
						[ r1*cos(180/n), r1*sin(180/n) ],
						[ r2*cos(360/n), r2*sin(360/n) ],
						[ 2*r2*cos(360/n), 2*r2*sin(360/n) ],
				]);
				if (type == 2) rotate(i*360/n) polygon([
						[ 2*r2, 0 ],
						[ r2, 0 ],
						[ r1*cos(90/n), r1*sin(90/n) ],
						[ r1*cos(180/n), r1*sin(180/n) ],
						[ r2*cos(270/n), r2*sin(270/n) ],
						[ 2*r2*cos(270/n), 2*r2*sin(270/n) ],
				]);
		}
	}
}

module spring(r1 = 100, r2 = 10, h = 100, hr = 12)
{
	stepsize = 0.01;
	module segment(i1, i2) {
		alpha1 = i1 * 360*r2/hr;
		alpha2 = i2 * 360*r2/hr;
		len1 = sin(acos(i1*2-1))*r2;
		len2 = sin(acos(i2*2-1))*r2;
	
		if (len1 < 0.01)
			polygon([
				[ cos(alpha1)*r1, sin(alpha1)*r1 ],
				[ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
				[ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
			]);
		// */
		
		if (len2 < 0.01)
			polygon([
				[ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
				[ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
				[ cos(alpha2)*r1, sin(alpha2)*r1 ],
			]);
		// */
		//Pinhead_2d(55,20,30);
		if (len1 >= 0.01 && len2 >= 0.01)
			polygon([
				[ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
				[ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
				[ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
				[ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
			]);
		// */
	}
	linear_extrude(height = 100, twist = 180*h/hr,$fn = (hr/r2)/stepsize, convexity = 5) 
	for (i = [ stepsize : stepsize : 1+stepsize/2 ])	segment(i-stepsize, min(i, 1));
}
/*
linear_extrude(height = 10, center = false, convexity = 8, twist = 360, $fn = 200)
translate([1, 0, 0])
circle(r = 1);
// */
//translate([ -30, 0, 0 ]) screw(1);
//translate([ 30, 0, 0 ]) screw(2);
//translate([ 30, 0, 0 ]) nut();

//spring();