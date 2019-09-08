package obj;

import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import flat3D.Camera3D;
import flat3D.Entity3D;

/**
 * ...
 * @author voec
 */
class CaveFloor extends Entity3D
{
	
	var sprite:Image = new Image("gfx/cave-floor.png");

	public function new(x:Float=0, y:Float=0, z:Float=0, frame:Int = 0) 
	{
		
		super(x, y, z, -1, true);
		
		addGraphic(sprite);
		
		sprite.centerOrigin();
		
	}
	
	override public function render():Void
	{
		super.render();
		sprite.scale = gfxScale;
		sprite.angle = Camera3D.rotation;
	}
	
}