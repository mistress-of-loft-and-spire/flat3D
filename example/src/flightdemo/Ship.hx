package flightdemo;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import flat3D.graphics.Image3D;
import flightdemo.WaterWave;
import openfl.display.BitmapData;
import openfl.geom.Point;
import flat3D.Camera3D;
import flat3D.Entity3D;
import openfl.geom.Rectangle;


class Ship extends Entity3D
{
	
	var sprite:Spritemap;
	
	var gfxArray:Array<Image3D> = new Array<Image3D>();

	public function new(x:Float=0, y:Float=0, z:Float=0) 
	{
		
		super(x, y, z, 0, true);
		
		for (i in 0...7)
		{
			
			var bittemp:BitmapData = new BitmapData(130, 35);
			
			bittemp.copyPixels(HXP.getBitmap("gfx/flightdemo/ship.png"), new Rectangle(i*130, 0, 130, 35), new Point(0, 0));
			
			var temp:Image3D = new Image3D(bittemp);
			temp.offset.z = i * 4;
			
			temp.centerOrigin();
			
			gfxArray.push(temp);
			
			addGraphic(temp);
			
			var temp:Image3D = new Image3D(bittemp);
			temp.offset.z = (i * 4) + 2;
			
			temp.centerOrigin();
			
			gfxArray.push(temp);
			
			addGraphic(temp);
		}
		
		Input.define("up", [Key.UP, Key.W]);
		Input.define("down", [Key.DOWN, Key.S]);
		Input.define("left", [Key.LEFT, Key.A]);
		Input.define("right", [Key.RIGHT, Key.D]);
		
	}
	
	var velocity:Point = new Point(0, 0);
	
	var speed:Float = 0.5;
	
	public var cameraAngle:Point = new Point(0, 0);
	
	public var shipAngle:Float = 0;
	
	var waterTimer:Float = 0;
	var doubletapTimer:Float = 0;
	
	var barrelroll:Bool = false;
	var rollAmount:Float = 0;
	
	var invertedControls:Int = 1;
	
	override public function update():Void
	{
		//MOVEMENT
		p.z += 5;
		
		velocity.x *= 0.9;
		velocity.y *= 0.9;
		
		if (Input.check("left")) velocity.x -= speed;
		if (Input.check("right")) velocity.x += speed;
		
		if (Input.pressed("left"))
		{
			if (doubletapTimer > 0)
			{
				doubletapTimer = 0;
				barrelroll = true;
			}
			else if (!barrelroll)
			{
				doubletapTimer = 20;
			}
		}
		
		if (doubletapTimer > 0) doubletapTimer -= 1;
		
		//going up and down -- Y
		if (Input.check("up")) velocity.y -= speed * invertedControls;
		if (Input.check("down")) velocity.y += speed * invertedControls;
		
		HXP.clampInRect(velocity, -8, -8, 16, 16);
		
		p.x += velocity.x;
		p.y += velocity.y;
		
		if (Math.abs(p.x) > 300) velocity.x *= 0.8;
		if (p.y < -380 || p.y > -20) velocity.y *= 0.8;
		
		HXP.clampInRect(p, -300, -380, 600, 360);
		
		cameraAngle.x = HXP.lerp(cameraAngle.x, velocity.x, 0.1);
		cameraAngle.y = HXP.lerp(cameraAngle.y, velocity.y, 0.1);
		
		if (barrelroll)
		{
			if (p.y > -80) HXP.lerp(p.y, -80, 0.4);
			
			rollAmount += 15;
			if (rollAmount > 350)
			{
				barrelroll = false;
				shipAngle -= 360;
				rollAmount = 0;
			}
		}
		
		shipAngle = HXP.lerp(shipAngle, cameraAngle.x * -4 + rollAmount, 0.2);
		
		
		if (p.y > -80)
		{
			shipAngle *= p.y/-80;
			
			waterTimer += 1;
			
			if (waterTimer >= 5)
			{
				scene.add(new WaterWave(p.x - 60, 0, p.z));
				scene.add(new WaterWave(p.x + 60, 0, p.z));
				
				waterTimer = 0;
			}
		}
		
		for (j in gfxArray)
		{
			j.angle = shipAngle;
			
			j.offset.x = cameraAngle.x * (j.offset.z * 0.1);
			j.offset.y = cameraAngle.y * (j.offset.z * 0.15);
		}
		
		Camera3D.rotation = cameraAngle.x;
		
		Camera3D.horizon.y = 360 - (cameraAngle.y * 10);
		
		Camera3D.camera.setTo(
		p.x / 1.5,
		(p.y - 10) / 1.5,
		p.z + 300);
		
		// Invert flight controls
		if (Input.pressed(Key.DIGIT_3)) invertedControls *= -1;
		
		super.update();
	}
	
	override public function render():Void
	{
		
		super.render();
		
	}
	
}