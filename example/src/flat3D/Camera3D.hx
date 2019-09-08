package flat3D;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Mask;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import haxe.ds.ArraySort;
import openfl.display.BitmapData;
import openfl.geom.Point;
import openfl.geom.Vector3D;
import openfl.utils.Object;

/**
 * 3D Camera used to calculate perspective. There should be one in each 3D scene.
 */
class Camera3D extends Entity
{
	
	public static var camera:Vector3D = new Vector3D(0, 0, 0);
	
	public static var offset:Vector3D = new Vector3D(0, 0, 0);
	
	public static var rotation:Float = 0; // Rotation along the Z axis
	
	public static var horizon:Point = new Point(0, 0); // Horizon position, determines vanishing point of Entities in the distance
	
	public static var nearClipZ:Float = 500; // Distance to the near clipping plane
	public static var farClipZ:Float = 5000; // Distance to the far clipping plane (everything beyond this will be faded away)
	
	/**
	 * Constructor.
	 * @param	x			X position of the Camera.
	 * @param	y			Y position of the Camera.
	 * @param	z			Z position of the Camera.
	 */
	public function new(x:Float=0, y:Float=0, z:Float=0, horizonY:Float=0) 
	{
		
		horizon.x = HXP.halfWidth; // Change these values to manipulate the vanishing point
		horizon.y = horizonY;
		
		super(0, 0);
		
	}
	
	public static function renderGraphic(entityGraphic:Graphic, position:Vector3D):Void
	{
		
		// Set the origin point for translation and rotation
		var renderPoint:Vector3D = new Vector3D(position.x - camera.x, position.y - camera.y, position.z - camera.z);
		
		if (rotation != 0)
		{
			// Convert to radians
			var radianAngle:Float = rotation * (Math.PI / -180);
			
			// Precalculate cos and sin of angle
			var cosAngle:Float = Math.cos(radianAngle);
			var sinAngle:Float = Math.sin(radianAngle);
			
			// Calculate positional rotation around camera Z axis
			var tempX:Float = ((renderPoint.x) * cosAngle) - ((renderPoint.y) * sinAngle);
			renderPoint.y   = ((renderPoint.x) * sinAngle) + ((renderPoint.y) * cosAngle);
			renderPoint.x = tempX;
		}
		
		// Determines how small + close to the horizon the object should be rendered in the distance
		var depthFactor:Float = nearClipZ / (nearClipZ + (renderPoint.z));
		var depthInverse:Float = 1.0 - depthFactor;
		
		// Calculate 2D screen position based on 3D perspective position
		entityGraphic.x = ((renderPoint.x + HXP.halfWidth) * depthFactor) + (horizon.x * depthInverse);
		entityGraphic.y = ((renderPoint.y + HXP.halfHeight) * depthFactor) + (horizon.y * depthInverse);
		
		
		if (Std.is(entityGraphic, Image))
		{
			cast(entityGraphic, Image).scale = depthFactor;
			
			cast(entityGraphic, Image).angle = Camera3D.rotation;
		}
		
	}
	
	public static var renderList:Array<{graphic:Graphic, z:Float}> = new Array<{graphic:Graphic, z:Float}>();
	
	override public function render():Void
	{
		
		ArraySort.sort(renderList,
		function(a, b):Int
		{
			if (a.z > b.z)	return -1;
			else if (a.z < b.z)	return 1;
			return 0;
		});
		
		for (i in renderList)
		{
			i.graphic.renderAtlas(0, new Point(0, 0), new Point(0, 0));
		}
		
		renderList = [];
		
		super.render();
		
	}
	
	//debug
	override public function update():Void
	{
		
#if debug
		// Debug free-roam camera
		if (Input.check(Key.J))  { offset.x -= 2; }
		if (Input.check(Key.L))  { offset.x += 2; }
		if (Input.check(Key.O))  { offset.y -= 2; }
		if (Input.check(Key.U))  { offset.y += 2; }
		if (Input.check(Key.K))  { offset.z -= 2; }
		if (Input.check(Key.I))  { offset.z += 2; }
		
		// Change horizon line
		if (Input.check(Key.Z))  { horizon.y -= 2; }
		if (Input.check(Key.H))  { horizon.y += 2; }
#end
		
		super.update();
		
	}
	
}