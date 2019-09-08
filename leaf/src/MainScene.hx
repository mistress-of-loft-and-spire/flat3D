import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.BitmapText;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import ent.Seed;
import obj.Egg;
import ent.Tree;
import persp.Camera3D;

class MainScene extends Scene
{
	
	public static var rotationAngle:Float = 0;

	override public function begin()
	{
		
		add(new Camera3D(0, 0, 0));
		
		Camera3D.offset.setTo( -465, -500, 202);
		/*
		for (i in 0...4)
		{
			add(new Tree(0, 0, 0, "bot", i));
		}
		for (i in 0...20)
		{
			add(new Tree(0, 0, -12, "mid", i));
		}
		for (i in 0...10)
		{
			add(new Tree(0, 0, -12, "eyes", i));
		}
		for (i in 0...4)
		{
			add(new Tree(0, 0, -15, "top", i));
		}
		*/
		for (i in 0...14)
		{
			add(new Egg(0, 0, 0, i));
		}
		
		add(new Seed());
		
	}
	
	var angleChange:Float = 0;
	
	override public function update():Void
	{
		
		super.update();
		
		if (Input.check(Key.LEFT) || Input.joystick(0).check(4))
		{
			angleChange += 0.2;
        }
		if (Input.check(Key.RIGHT) || Input.joystick(0).check(5))
		{
			angleChange -= 0.2;
        }
		
		angleChange *= 0.8;
		
		if (angleChange > 1.6) { angleChange = 1.6; }
		
		
		rotationAngle += angleChange;
		
		if (rotationAngle < 0) rotationAngle += 360;
		
		rotationAngle %= 360;
		
		
		//trace(Camera3D.camera + "  " + Camera3D.horizon_y);
	}

}