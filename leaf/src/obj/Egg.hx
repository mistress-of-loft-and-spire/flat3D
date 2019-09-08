package obj;

import com.haxepunk.graphics.Spritemap;
import persp.Entity3D;

/**
 * ...
 * @author voec
 */
class Egg extends Entity3D
{
	
	var sprite:Spritemap = new Spritemap("gfx/egg.png", 90, 90);

	public function new(x:Float=0, y:Float=0, z:Float=0, frame:Int = 0) 
	{
		
		super(x, y, z - (frame*2), -1, true);
		
		addGraphic(sprite);
		
		sprite.frame = frame;
		
		sprite.centerOrigin();
		
	}
	
	override public function render():Void
	{
		super.render();
		sprite.scale = gfxScale;
		sprite.angle = MainScene.rotationAngle;
	}
	
}