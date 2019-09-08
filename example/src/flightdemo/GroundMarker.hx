package flightdemo;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import openfl.geom.Point;
import flat3D.Camera3D;
import flat3D.Entity3D;


class GroundMarker extends Entity3D
{

	var sprite:Image;
	
	public function new(x:Float=0, y:Float=0, z:Float=0) 
	{
		
		super(x, y, z, 0, true);
		
		sprite = Image.createRect(2, 2, 0xFFFFFF);
		
		addGraphic(sprite);
		
		sprite.centerOrigin();
		
	}
	
	override public function update():Void
	{
		
		if (p.z - Camera3D.camera.z < -350) p.z += 490;
		
		super.update();
	}
	
}