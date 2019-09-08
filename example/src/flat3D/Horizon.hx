package flat3D;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Mask;
import openfl.display.BitmapData;
import flat3D.Camera3D;

/**
 * ...
 * @author 
 */
class Horizon extends Entity
{
	
	private var groundBitmap:BitmapData;
	private var ground:Image;

	public function new() 
	{
		
		super();
		
		groundBitmap = new BitmapData(HXP.width, HXP.height, false, 0xFFFFFFFF);
		ground = new Image(groundBitmap);
		
		//ground.alpha = 0.3;
		
		addGraphic(ground);
		
		layer = Math.round(Camera3D.farClipZ);
		
	}
	
	override public function update():Void
	{
		
		ground.y = Camera3D.horizon_y;
		
		super.update();
		
	}
	
}