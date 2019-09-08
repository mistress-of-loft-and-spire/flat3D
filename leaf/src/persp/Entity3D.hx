package persp;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Mask;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import openfl.display.BitmapData;
import openfl.geom.Vector3D;

/**
 * ...
 * @author 
 */
class Entity3D extends Entity
{
	
	
	
	public var p:Vector3D = new Vector3D(0, 0, 0);
	
	private var depthFactor:Float = 1; //
	private var depthInverse:Float = 1; //the inverse of your depth factor
	
	private var gfxScale:Float = 1;
	
	private var addLayer:Int;
	
	private var isoFactor:Float = 0;
	
	private var rotate:Bool;

	public function new(x:Float=0, y:Float=0, z:Float=0, addToLayer:Int=0, rotate:Bool=false) 
	{
		
		this.rotate = rotate;
		
		super(x, y);
		
		addLayer = addToLayer + 100;
		
		p.setTo(x, y, z);	
		
		render3D();
		
	}
	
	public function render3D():Void
	{
		
		//deptFactor calc -> dertermines how small + close to the horizon an object gets in the distance
		depthFactor = Camera3D.nearClipZ / (Camera3D.nearClipZ + (p.z - Camera3D.camera.z));
		
		depthInverse = 1.0 - depthFactor; 
		
		if (rotate)
		{
			var targetAngle:Float = MainScene.rotationAngle * (Math.PI / -180);
			
			var newX:Float = (p.x * Math.cos(targetAngle)) - (p.y * Math.sin(targetAngle));
			var newY:Float = (p.x * Math.sin(targetAngle)) + (p.y * Math.cos(targetAngle));
			
			//pos
			y = ((newY - Camera3D.camera.y) * depthFactor) + (Camera3D.horizon_y * depthInverse);
			x = ((newX - Camera3D.camera.x) * depthFactor) + (Camera3D.horizon_x * depthInverse);
		}
		else
		{
			//pos
			y = ((p.y - Camera3D.camera.y) * depthFactor) + (Camera3D.horizon_y * depthInverse);
			x = ((p.x - Camera3D.camera.x) * depthFactor) + (Camera3D.horizon_x * depthInverse);
		}
		
		//scale
		gfxScale = depthFactor;
		
	}
	
	override public function update():Void
	{
		
		//set layer based on z distance
		layer = Math.round(p.z) + addLayer;
		
		visible = true;
		
		if ((p.z - Camera3D.camera.z) < -Camera3D.nearClipZ)
		{
			//near clipping z -> hide entity when behind camera view
			visible = false;
		}
		else if ((p.z - Camera3D.camera.z) < -Camera3D.nearClipZ-20)
		{
			//if really close to clip distance -> don't show, but still calculate to avoid render glitches when it shows up
			visible = false; render3D();
		}
		
	}
	
	override public function render():Void
	{
		
		super.render();
		
		render3D();
		
	}
	
}