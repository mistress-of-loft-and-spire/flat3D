import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.BitmapText;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import flat3D.Entity3D;
import flightdemo.Background;
import flightdemo.GroundMarker;
import flightdemo.Obstacle;
import flightdemo.Ship;
import flightdemo.ShipShadow;
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

class FlightDemo extends Scene
{

	public static var ship:Ship;
	
	override public function begin()
	{
		
		add(new Camera3D(0, 0, 0, 360));
		
		add(new Background());
		
		ship = new Ship(0, -60, 0);
		add(ship);
		
		add(new ShipShadow(0, 60, 0));
		
		for (j in 0...7)
		{
			for (i in 0...7)
			{
				add(new GroundMarker((j*200)-600, -1, i*70));
			}
		}
		
		add(new Debug3D());
		
		
		// Demo text
		var demoText:Text = new Text("Flight Demo\nPress 1 for debug info\nPress 2 to switch demos\n\nControls: Arrow keys\nPress 3 for inverted flight controls");
		demoText.color = 0xff5555;
		
		addGraphic(demoText, -10, 20, 30);
		
	}
	
	override public function update():Void
	{
		
		if (HXP.rand(140) == 1)
		{
			add(new Obstacle());
		}
		
		super.update();
		
	}

}