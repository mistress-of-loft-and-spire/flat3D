package flightdemo;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import openfl.geom.Point;
import flat3D.Camera3D;
import flat3D.Entity3D;


class WaterWave extends Entity3D
{

	var sprite:Image;
	
	public function new(x:Float=0, y:Float=0, z:Float=0) 
	{
		
		super(x, y, z, 0, true);
		
		sprite = Image.createRect(10, 1, 0xFFFFFF);
		
		addGraphic(sprite);
		
		sprite.scaleX = 0.1;
		
		sprite.centerOrigin();
		
	}
	
	override public function update():Void
	{
		
		if(sprite.scaleX < 1) sprite.scaleX += 0.04;
		
		if (p.z - Camera3D.camera.z < -380) scene.remove(this);
		
		super.update();
	}
	
}