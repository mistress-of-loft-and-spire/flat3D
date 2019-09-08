package obj;

import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import flash.display.BitmapData;
import flat3D.Entity3D;

/**
 * ...
 * @author voec
 */
class Wind extends Entity3D
{
	
	var sprite:Spritemap;

	public function new(x:Float=0, y:Float=0, z:Float=0) 
	{
		super(x, y, z);
		
		sprite = new Spritemap("gfx/wind.png", 200, 30);
		
		sprite.add("idle", [0, 1, 2, 3], 10);
		
		sprite.play("idle");
		
		addGraphic(sprite);
		
	}
	
	override public function update():Void
	{
		
		p.x -= 6;
		
		if (p.x < -2000)
		{
			p.x += 4000;
		}
		
		super.update();
		
	}
	
	override public function render():Void
	{
		super.render();
		
		sprite.angle = gfxAngle;
		sprite.scale = gfxScale;
		//sprite.angle = Camera3D.rotation;
	}
	
}