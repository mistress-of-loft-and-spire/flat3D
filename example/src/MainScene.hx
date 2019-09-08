import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.BitmapText;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import ent.Seed;
import flat3D.Entity3D;
import obj.CaveExit;
import obj.CaveFloor;
import obj.Cliff;
import flat3D.Debug3D;
import obj.Egg;
import ent.Tree;
import flat3D.Camera3D;
import obj.Ground;
import obj.Solid;
import obj.Wind;

class MainScene extends Scene
{

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
		
		/*
		for (i in 0...14)
		{
			add(new Egg(0, 0, 0, i));
		}
		*/
		
		add(new Seed());
		
		add(new Debug3D());
		
		add(new Wind());
		
		for (i in 0...10)
		{
			add(new CaveExit(0, 0, 0, i));
		}
		
		add(new CaveFloor(0, -400, 0));
		/*
		for (i in 0...10)
		{
			add(new Cliff(100, 100, 0, i));
		}*/
		
		for (i in 0...11)
		{
			add(new Solid(100, 100, 0, i));
		}
		
	}
	
	var angleChange:Float = 0;
	
	override public function update():Void
	{
		
		if (Input.pressed(Key.P))
		{
			//add(editObject = new Ground(0, 0, 0));
			
		}
		
		
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
		
		
		Camera3D.rotation += angleChange;
		
		if (Camera3D.rotation < 0) Camera3D.rotation += 360;
		
		Camera3D.rotation %= 360;
		
		
		//trace(Camera3D.camera + "  " + Camera3D.horizon_y);
	}

}