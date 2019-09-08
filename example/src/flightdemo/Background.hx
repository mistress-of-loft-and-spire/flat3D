package flightdemo;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.HXP;
import com.haxepunk.Mask;
import com.haxepunk.graphics.Image;
import flat3D.Camera3D;
import flat3D.Entity3D;
import flat3D.graphics.Image3D;


class Background extends Entity3D
{

	var sprite:Image;
	
	public function new() 
	{
		
		super();
		
		sprite = new Image3D("gfx/flightdemo/background.png");
		
		addGraphic(sprite);
		
		sprite.centerOrigin();
		
		sprite.scaleX = sprite.scaleY = 8;
		
	}
	
	override public function update():Void
	{
		
		p.z = Camera3D.camera.z + 800;
		
		super.update();
	}
	
}