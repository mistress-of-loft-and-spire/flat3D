package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;
import flixel.system.FlxAssets.FlxGraphicAsset;
import openfl.geom.Point;

/**
 * ...
 * @author voec
 */
class Oaky extends FlxSprite
{
	
	private var movement:Point = new Point(0, 0);
	private var direction:Float = 0;

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		loadGraphic("assets/gfx/oaky.png", true, 16, 32);
		
		animation.add("walk", [0, 1, 2, 3, 4, 5], 10);
		animation.add("stand", [0]);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		velocity.x *= 0.88; velocity.y *= 0.88;
		
		if (FlxG.keys.anyPressed(["LEFT", "A"])) { velocity.x -= 0.25; }
		if (FlxG.keys.anyPressed(["RIGHT", "D"])) { velocity.x += 0.25; }
		
		if (FlxG.keys.anyPressed(["UP", "W"])) { velocity.y -= 0.25; }
		if (FlxG.keys.anyPressed(["DOWN", "S"])) { velocity.y += 0.25; }
		
		//Zero Cutoff Margin
		if (Math.abs(movement.x) < 0.1) movement.x = 0;
		if (Math.abs(movement.y) < 0.1) movement.y = 0;
		
		if (movement.length > 0)
		{
			//direction = velocity.angleBetween(new FlxPoint(0, 0));
			
			//velocity = FlxVelocity.velocityFromAngle(direction, FlxMath.bound(movement.length, -2, 2));
		}
		
		//walk();
		
	}
	/*
	function walk() 
	{
		
		//Animation
		sprite.frame = Math.round(direction / 360 * 8);
		
		if (sprite.frame > 7) sprite.frame -= 8;
		if (sprite.frame < 0) sprite.frame += 8; //mod!!!
		
		if (movement.length > 0.2)
		{
			animation.play("walk");
		}
		else
		{
			animation.play("stand");
		}
		
		dummy_animate.rate = HXP.clamp(movement.length, -2, 2) / 1.8;
		
		set
		
		sprite.frame += dummy_animate.frame * 8;
		
		if (dummy_animate.frame == 2 || dummy_animate.frame == 6)
		{
			walk_sound();
		}
		
	}
	*/
	function walk_sound(param:String = "NULL") 
	{
		//Sound
		//if (!step_sand.playing) step_sand.play();
		
		//step_sand.volume = (movement.length / 4) + 0.4;
	}
	
	
	
}