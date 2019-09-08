package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("graphics/debug/console_debug.png", "graphics/debug/console_debug.png");
			type.set ("graphics/debug/console_debug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_hidden.png", "graphics/debug/console_hidden.png");
			type.set ("graphics/debug/console_hidden.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_logo.png", "graphics/debug/console_logo.png");
			type.set ("graphics/debug/console_logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_output.png", "graphics/debug/console_output.png");
			type.set ("graphics/debug/console_output.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_pause.png", "graphics/debug/console_pause.png");
			type.set ("graphics/debug/console_pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_play.png", "graphics/debug/console_play.png");
			type.set ("graphics/debug/console_play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_step.png", "graphics/debug/console_step.png");
			type.set ("graphics/debug/console_step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_visible.png", "graphics/debug/console_visible.png");
			type.set ("graphics/debug/console_visible.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/preloader/haxepunk.png", "graphics/preloader/haxepunk.png");
			type.set ("graphics/preloader/haxepunk.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("font/04B_03__.ttf", "font/04B_03__.ttf");
			type.set ("font/04B_03__.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("font/04B_03__.ttf.png", "font/04B_03__.ttf.png");
			type.set ("font/04B_03__.ttf.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/cave-exit.png", "gfx/cave-exit.png");
			type.set ("gfx/cave-exit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/cave-floor.png", "gfx/cave-floor.png");
			type.set ("gfx/cave-floor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/char.png", "gfx/char.png");
			type.set ("gfx/char.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/cliff.png", "gfx/cliff.png");
			type.set ("gfx/cliff.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/debug-axis.png", "gfx/debug-axis.png");
			type.set ("gfx/debug-axis.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/flightdemo/background.png", "gfx/flightdemo/background.png");
			type.set ("gfx/flightdemo/background.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/flightdemo/ship.png", "gfx/flightdemo/ship.png");
			type.set ("gfx/flightdemo/ship.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/raft-bottom.png", "gfx/raft-bottom.png");
			type.set ("gfx/raft-bottom.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/raft-sail.png", "gfx/raft-sail.png");
			type.set ("gfx/raft-sail.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/shell.png", "gfx/shell.png");
			type.set ("gfx/shell.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/title.png", "gfx/title.png");
			type.set ("gfx/title.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/whale.png", "gfx/whale.png");
			type.set ("gfx/whale.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("gfx/wind.png", "gfx/wind.png");
			type.set ("gfx/wind.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
