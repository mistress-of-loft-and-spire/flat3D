package ent;

import com.haxepunk.graphics.Spritemap;
import flat3D.Camera3D;
import flat3D.Entity3D;

/**
 * ...
 * @author voec
 */
class Tree extends Entity3D
{
	
	var sprite:Spritemap;

	public function new(x:Float=0, y:Float=0, z:Float=0, part:String="bot", frame:Int = 0) 
	{
		
		if (part == "top") 		 z = z - (frame * 12);
		else if (part == "eyes") z = z - (frame * 6);
		else 					 z = z - (frame * 3);
		
		super(x, y, z, -1, true);
		
		if (part == "bot") sprite = new Spritemap("gfx/tree-bot.png", 380, 220);
		else if (part == "mid") sprite = new Spritemap("gfx/tree-mid.png", 200, 200);
		else if (part == "top") sprite = new Spritemap("gfx/tree-top.png", 380, 220);
		else if (part == "eyes") sprite = new Spritemap("gfx/tree-eyes.png", 200, 200);
		
		addGraphic(sprite);
		
		sprite.scaleX = sprite.scaleY = 1 - Math.abs(z)/240;
		
		sprite.frame = frame;
		
		sprite.centerOrigin();
		
	}
	
	override public function render():Void
	{
		super.render();
		sprite.scale = gfxScale;
		sprite.angle = Camera3D.rotation;
	}
	
}