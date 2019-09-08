package flightdemo;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import flat3D.graphics.Image3D;
import openfl.display.BitmapData;
import openfl.geom.Point;
import flat3D.Camera3D;
import flat3D.Entity3D;
import openfl.geom.Rectangle;


class ShipShadow extends Entity3D
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
			
			temp.color = 0x4f88a6;
			
			gfxArray.push(temp);
			
			addGraphic(temp);
			
			var temp:Image3D = new Image3D(bittemp);
			temp.offset.z = (i * 4) + 2;
			
			temp.centerOrigin();
			
			temp.color = 0x4f88a6;
			
			gfxArray.push(temp);
			
			addGraphic(temp);
		}
		
		
	}
	
	
	override public function update():Void
	{
		
		for (j in gfxArray)
		{
			j.angle = 180 - FlightDemo.ship.shipAngle;
			
			j.offset.x =  FlightDemo.ship.cameraAngle.x * (j.offset.z * 0.1);
			j.offset.y =  -FlightDemo.ship.cameraAngle.y * (j.offset.z * 0.15);
		}
		
		super.update();
	}
	
	override public function render():Void
	{
		
		p.x = FlightDemo.ship.p.x;
		p.z = FlightDemo.ship.p.z;
		
		p.y = 0 - FlightDemo.ship.p.y;
		
		super.render();
		
	}
	
}