package flightdemo;

import com.haxepunk.HXP;
import flat3D.Camera3D;
import flat3D.Entity3D;
import flat3D.graphics.Image3D;
import openfl.display.BitmapData;
import openfl.geom.Point;


class Obstacle extends Entity3D
{

	public function new() 
	{
		
		super(0, 0, Camera3D.camera.z + 800, 0, true);
		
		p.x = HXP.rand(600) - 300;
		
		width = HXP.rand(50) + 100;
		height = HXP.rand(200) + 100;
		
		for (i in 0...4)
		{
			
			var fillColor:Int;
			
			if (i == 0)	fillColor = 0xFF9dafb2;
			else		fillColor = 0xFFd0d2d4;
			
			var bittemp:BitmapData = new BitmapData(width, height, false, fillColor);
			
			var temp:Image3D = new Image3D(bittemp);
			var tempReflection:Image3D = new Image3D(bittemp);
			
			temp.offset.z = tempReflection.offset.z = i * 8;
			
			temp.centerOrigin(); temp.originY = height;
			tempReflection.centerOrigin(); tempReflection.originY = 0;
			
			tempReflection.color = 0x4f88a6;
			
			addGraphic(temp);
			addGraphic(tempReflection);
			
		}
		
	}
	
	override public function update():Void
	{
		
		if (p.z - Camera3D.camera.z < -380) scene.remove(this);
		
		super.update();
	}
	
}