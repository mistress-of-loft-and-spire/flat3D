package flat3D.graphics;

import com.haxepunk.Graphic;
import openfl.geom.Vector3D;


class Graphic3D extends Graphic
{
	
	//graphic = new Graphic
	
	/**
	 * X, Y and Z offset of the image.
	 */
	public var offset:Vector3D = new Vector3D(0, 0, 0);
	
	/**
	 * X scale of the image.
	 */
	private var scale3D:Float;
	
	/**
	 * X scale of the image.
	 */
	private var angle3D:Float;
	
}