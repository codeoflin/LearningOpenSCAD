
//1个2D牙
module tooth_2d(bodylen=100,bodywidth=50,headlen=30){
	translate([0,-bodywidth/2,0])
	{
		polygon(points=[[0,0],
        [bodylen,0],
        [bodylen+headlen,bodywidth/2],
        [bodylen,bodywidth],
        [0,bodywidth]]);
	}
}

//循环生成18个2D牙并拉高
linear_extrude(height = 100, twist =0, scale = 1, center = false)
{
	for (i = [0:18]) {
					rotate([0,0,20*i])tooth_2d();
	}
}
