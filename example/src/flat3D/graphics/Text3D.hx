package flat3D.graphics;

import com.haxepunk.Graphic.ImageType;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import openfl.geom.Rectangle;
import openfl.geom.Vector3D;


class Text3D extends Text
{
	
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