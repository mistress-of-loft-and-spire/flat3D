import com.haxepunk.RenderMode;
import com.haxepunk.debug.Console.TraceCapture;
import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Joystick;
import com.haxepunk.utils.Key;
import openfl.Lib;

class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable(TraceCapture.Yes, Key.F1);
		
		trace(HXP.VERSION);
#end
		
		//HXP.volume = 0.1;
		
		HXP.screen.color = 0xe2d7d2;
		
		HXP.screen.smoothing = false;
		
		HXP.stage.quality = LOW;
		
		HXP.screen.scale = 1;
		
		HXP.scene = new MainScene();
	}
	
	public static function restart():Void
	{
		HXP.scene = new MainScene();
	}
	
	override public function update():Void
	{
#if debug
		if (Input.pressed(Key.F5))
		{
			restart();
		}
#end
		if (Input.pressed(Key.F11) || Input.pressed(Key.F12))
		{
			HXP.fullscreen = !HXP.fullscreen;
		}
		
		super.update();
	}

	public static function main() { new Main(); }

}