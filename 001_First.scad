//设定球半径
sphere_radius=8;
cube_lenght=15;

//Translate是一个根据给定的[X，Y，Z]参数移动对象的运算符。在这种情况下，它向下移动一个物体-24毫米的X轴。
translate([-24,0,0]) {
	//Union是一个运算符，它将大括号内的所有对象组合到一个Object中。
	union() {
		//Cube是一个创建立方体对象的Action。在这种情况下，每个立方体的边设置为15 mm，“center = true”语句告诉Action从中心绘制立方体。
		cube(cube_lenght, center=true);
		//Sphere是一个创建球体对象的Action。由于该数字尚未定义为半径或直径，因此OpenSCAD假定它是半径。
		sphere(sphere_radius);
	}
}

//如果想插入的对象,在中心,可以不用translate
//difference 差异运算符从另一个对象中减去一个对象，使其对创建孔和其他空间很有用。
difference() {
	cube(cube_lenght, center=true);
	sphere(sphere_radius);
}
	
translate([24,0,0]) {
 //intersection 交叉保留2个对象中交叉的部分
	intersection()
	{
		cube(cube_lenght, center=true);
		sphere(sphere_radius);
	}
}

echo(version=version());