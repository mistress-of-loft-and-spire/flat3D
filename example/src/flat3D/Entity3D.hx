package flat3D;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Mask;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import flat3D.graphics.Image3D;
import flat3D.graphics.Spritemap3D;
import flat3D.graphics.Text3D;
import openfl.display.BitmapData;
import openfl.geom.Vector3D;

/**
 * ...
 * @author 
 */
class Entity3D extends Entity
{
	
	public var p:Vector3D = new Vector3D(0, 0, 0); // Entity position in 3D space
	
	private var depthFactor:Float = 1; // Determines how small + close to the horizon the Entity gets in the distance
	private var depthInverse:Float = 1;
	
	public var gfxScale:Float = 1; // Output used to adjust graphics of the Entity
	private var gfxAngle:Float = 0;
	
	private var addLayer:Int; // Modify draw layer
	
	private var rotate:Bool; // Calculate positional rotation?
	
	/**
	 * Constructor. Can be used to place the Entity in 3D space.
	 * @param	x			X position to place the Entity.
	 * @param	y			Y position to place the Entity.
	 * @param	z			Z position to place the Entity.
	 * @param	addLayer	(Optional) Modifies the graphic layer to draw Entity above/below their Z axis layer.
	 * 					    <p>
	 * 						For example: If you have leaves on a ground. You want to have both the floor and leaves on the same Z position (flat), but draw the leaves in front of the ground via 'addLayer = -1'.
	 * @param	rotate  	(Optional) If true, this Entity will rotate around the Camera perspective.
	 * 						<p>
	 * 						Mostly useful for top-down perspective.
	 */
	public function new(x:Float=0, y:Float=0, z:Float=0, addLayer:Int=0, rotate:Bool=false) 
	{
		
		this.rotate = rotate;
		
		this.addLayer = addLayer;
		
		super(0, 0);
		
		p.setTo(x, y, z);	
		
		render3D();
		
	}
	
	public function render3D():Void
	{
		
		if (graphic == null || visible == false)	return;
		
		// Near clipping z -> hide entity when behind camera view
		
		/*if ((p.z - Camera3D.camera.z) < -Camera3D.nearClipZ)
		{
			// Near clipping z -> hide entity when behind camera view
			visible = false;
		}
		else*/
		
		var vector3D:Vector3D = p;
		
		if (Std.is(graphic, Graphiclist))	// Entity has multiple graphics?
		{
			for (i in cast(graphic, Graphiclist).children)
			{
				if (Std.is(i, Image3D))	vector3D = p.add(cast(i, Image3D).offset);
				
				if ((vector3D.z - Camera3D.camera.z) < -Camera3D.nearClipZ-20)	return;
				
				Camera3D.renderGraphic(i, vector3D);
			}
		}
		else	// Singular graphic
		{
			//if (Std.is(graphic, Image3D) || Std.is(graphic, Spritemap3D) || Std.is(graphic, Text3D))
			if (Std.is(graphic, Image3D))	vector3D = p.add(cast(graphic, Image3D).offset);
			
			if ((vector3D.z - Camera3D.camera.z) < -Camera3D.nearClipZ-20)	return;
			
			Camera3D.renderGraphic(graphic, vector3D);
		}
		
		var test:Image = new Image();
		
		
		_point.x = _point.y = 0;
		_camera.x = _scene == null ? HXP.camera.x : _scene.camera.x;
		_camera.y = _scene == null ? HXP.camera.y : _scene.camera.y;
		if (_graphic.blit)
		{
			// THROW ERROR :(    _graphic.render((renderTarget != null) ? renderTarget : HXP.buffer, _point, _camera);
		}
		else
		{
			if (Std.is(graphic, Graphiclist))	// Entity has multiple graphics?
			{
				for (i in cast(graphic, Graphiclist).children)
				{
					if (Std.is(i, Image3D))	vector3D = p.add(cast(i, Image3D).offset);
					
					Camera3D.renderList.push({graphic:i, z:vector3D.z});
				}
			}
			else
			{
				Camera3D.renderList.push({graphic:graphic, z:vector3D.z});
			}
			//_graphic.renderAtlas(layer, _point, _camera);
			
		}
		
	}
	
	override public function update():Void
	{
		//EDIT
		/*if (MainScene.editMode && MainScene.editObject == this)
		{
			p.x = Input.mouseX;
			p.y = Input.mouseY;
			
			if (Input.check(Key.R))
			{
				gfxAngle = (gfxAngle % 360) + 2;
			}
		}*/
		
		
		
		
		// Set layer based on Z distance
		//layer = Math.round(p.z) + addLayer;
		
		
	}
	
	override public function render():Void
	{
		
		render3D();
		
	}
	
}