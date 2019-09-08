package ent;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import openfl.geom.Point;
import flat3D.Camera3D;
import flat3D.Entity3D;

/**
 * ...
 * @author voec
 */
class Seed extends Entity3D
{
	
	var sprite:Spritemap = new Spritemap("gfx/char.png", 24, 24);

	public function new(x:Float=0, y:Float=0, z:Float=0) 
	{
		
		super(x, y, z, -5, true);
		
		addGraphic(sprite);
		
		sprite.add("walk", [0, 1, 0, 2], 8);
		sprite.add("stand", [0]);
		
		sprite.centerOrigin();
		
	}
	
	var movement:Point = new Point(0, 0);
	var direction:Float = 0;
	
	var walkingSpeed:Float = 0.25;
	var maxSpeed:Float = 1.2;
	
	override public function update():Void
	{
		//MOVEMENT
		
		//going left and right -- X
		if (Input.check(Key.A)) movement.x -= walkingSpeed;
		if (Input.check(Key.D)) movement.x += walkingSpeed;
		
		//going up and down -- Y
		if (Input.check(Key.W)) movement.y -= walkingSpeed;
		if (Input.check(Key.S)) movement.y += walkingSpeed;
		
		if (Math.abs(movement.x) < 0.1) movement.x = 0;
		if (Math.abs(movement.y) < 0.1) movement.y = 0;
		
		//Zero Cutoff Margin
		if (movement.length > 0)
		{
			
			direction = HXP.angle(0, 0, movement.x, movement.y);
			
			sprite.play("walk");
			
			direction -= Camera3D.rotation;
			
			var moveX:Float = Math.cos(direction * (Math.PI / -180)) * HXP.clamp(movement.length,-(maxSpeed),maxSpeed);
			var moveY:Float = Math.sin(direction * (Math.PI / -180)) * HXP.clamp(movement.length,-(maxSpeed),maxSpeed);
			
			//COLLISION
			/*
			if (collideWith(MainScene.melonSlice[layerZ - 1], p.x + moveX + MainScene.melonSlice[layerZ - 1].x, p.y + MainScene.melonSlice[layerZ - 1].y - 5) != null)
			{
				if (layerZ > 1 && collideWith(MainScene.melonSlice[layerZ - 2], p.x + moveX + MainScene.melonSlice[layerZ - 2].x, p.y + MainScene.melonSlice[layerZ - 2].y - 5) != null)
				{
					moveX = 0;
				}
            }
			if (collideWith(MainScene.melonSlice[layerZ - 1], p.x + MainScene.melonSlice[layerZ - 1].x, p.y + moveY + MainScene.melonSlice[layerZ - 1].y - 5) != null)
			{
				if (layerZ > 1 && collideWith(MainScene.melonSlice[layerZ - 2], p.x + MainScene.melonSlice[layerZ - 2].x, p.y + moveY + MainScene.melonSlice[layerZ - 2].y - 5) != null)
				{
					moveY = 0;
				}
            }*/
			
			p.x += moveX;
			p.y += moveY;
			
        }
        else
		{
			//STANDING
			sprite.play("stand");
        }
		
		var friction:Float = 0.85;
		
		movement.x *= friction; movement.y *= friction;
		
		// FALL?
		
		// JUMP
		
		// CAMERA
		// this could be simpler? -> redundant
		var targetAngle:Float = Camera3D.rotation * (Math.PI / -180);
			
		var newX:Float = (p.x * Math.cos(targetAngle)) - (p.y * Math.sin(targetAngle));
		var newY:Float = (p.x * Math.sin(targetAngle)) + (p.y * Math.cos(targetAngle));
			
		Camera3D.camera.setTo(
		Camera3D.offset.x + newX,
		Camera3D.offset.y + newY,
		Camera3D.offset.z + p.z);
		
		
		super.update();
	}
	
	override public function render():Void
	{
		super.render();
		sprite.scale = gfxScale;
	}
	
}