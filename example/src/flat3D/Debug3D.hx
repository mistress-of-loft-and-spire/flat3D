package flat3D;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import flat3D.Camera3D;
import flat3D.Entity3D;


class Debug3D extends Entity
{
	
	/**
	 * The key used to toggle the Console on/off.
	 */
	public var toggleKey:Int;
	
	
	var axis:Spritemap = new Spritemap("gfx/debug-axis.png", 49, 49);
	var text:Text = new Text();
	
	/**
	 * 3D debug view, including 3D axis and horizont line.
	 *
	 * @param	toggleKey		Key used to toggle the console, `Key.DIGIT_1` (1) by default.
	 * @param	visible			Show 3D debug info, enabled by default.
	 */
	public function new(toggleKey = Key.DIGIT_1, visible:Bool = true)
	{
		
		//super(0, 0, 0, -10, true);
		super(0, 0);
		
		this.toggleKey = toggleKey;
		
		this.visible = visible;
		
		addGraphic(axis);
		addGraphic(text);
		
		text.x = 200;
		text.y = -100;
		
		axis.centerOrigin();
		
	}
	
	/**
	 * Show 3D debug info.
	 */
	public function show()
	{
		if (!visible)	visible = true;
	}
	
	/**
	 * Hide 3D debug info.
	 */
	public function hide()
	{
		if (visible)	visible = false;
	}
	
	
	override public function update():Void
	{
		
		// Debug view toggle.
		if (Input.pressed(toggleKey))	visible = !visible;
		
		// Quit if the debug view isn't visible.
		if (!visible)	return;
		
		axis.angle = Camera3D.rotation;
		
		text.text = "x " + Camera3D.camera.x + "\n" +
					"y " + Camera3D.camera.y + "\n" +
					"z " + Camera3D.camera.z + "\n" +
					"rotation " + Camera3D.rotation + "\n" +
					"horizont x " + Camera3D.horizon.x + "\n" +
					"horizont y " + Camera3D.horizon.y;
		visible = true;
		super.update();
		visible = true;
	}
	
	override public function render():Void
	{
		visible = true;
		super.render();
		
		//DEBUG
		visible = true;
		
		axis.scaleX = axis.scaleY = 3;
		
		x = 100;
		y = HXP.screen.height - 100;
		layer = -20;
	}
	
}