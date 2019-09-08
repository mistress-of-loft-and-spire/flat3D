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
class Camera3D extends Entity
{
	
	public static var camera:Vector3D = new Vector3D(0, 0, 0);
	
	public static var offset:Vector3D = new Vector3D(0, 0, 0);
	
	public static var horizon_x:Float = 0; //or wherever you've placed it
	public static var horizon_y:Float = 0; //again, wherever else is fine
	
	public static var nearClipZ:Float = 500; //distance to the near clipping plane -- trial and error?
	public static var farClipZ:Float = 5000; //distance to the far clipping plane (everything beyond this will be faded away)
	
	public function new(x:Float=0, y:Float=0, z:Float=0) 
	{
		
		super(0, 0);
		
		horizon_x = HXP.halfWidth;
		horizon_y = 920;
		
		offset.setTo( -HXP.halfWidth, -HXP.halfHeight, 0);
		
	}
	
	override public function update():Void
	{
		
		super.update();
		
#if debug
		//change camera pos
		if (Input.check(Key.J))  { offset.x -= 2; }
		if (Input.check(Key.L))  { offset.x += 2; }
		if (Input.check(Key.O))  { offset.y -= 2; }
		if (Input.check(Key.U))  { offset.y += 2; }
		if (Input.check(Key.K))  { offset.z -= 2; }
		if (Input.check(Key.I))  { offset.z += 2; }
		
		//change horizon line
		if (Input.check(Key.Z))  { horizon_y -= 2; }
		if (Input.check(Key.H))  { horizon_y += 2; }
#end
		
	}
	
}