package obj;

import com.haxepunk.graphics.Image;
import flash.display.BitmapData;
import flat3D.Entity3D;

/**
 * ...
 * @author voec
 */
class Ground extends Entity3D
{
	
	var sprite:Image;

	public function new(x:Float=0, y:Float=0, z:Float=0) 
	{
		super(x, y, z);
		
		sprite = new Image(new BitmapData(250, 250, false, 0xaae2d7d2));
		
		addGraphic(sprite);
		
	}
	
	override public function render():Void
	{
		super.render();
		
		sprite.angle = gfxAngle;
		sprite.scale = gfxScale;
		//sprite.angle = Camera3D.rotation;
	}
	
}