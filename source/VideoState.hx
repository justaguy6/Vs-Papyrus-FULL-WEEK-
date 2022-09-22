package;

import flixel.FlxCamera;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;
import extension.webview.WebView;

using StringTools;

class VideoState extends MusicBeatState
{
	public static var androidPath:String = 'file:///android_asset/';

	public var nextState:FlxState;

	var text:FlxText;

	//var firsttimeeaster:Bool = true;
	//Solucao burra

	public function new(source:String, toTrans:FlxState)
	{
		super();

		
			text = new FlxText(0, 0, 0, "toque para continuar", 48);
			text.screenCenter();
			text.alpha = 0;
			add(text);
		


		nextState = toTrans;

		WebView.onClose=onClose;
		WebView.onURLChanging=onURLChanging;

		WebView.open(androidPath + source + '.html', false, null, ['http://exitme(.*)']);
	}

	public override function update(dt:Float) {
		for (touch in FlxG.touches.list)
			if (touch.justReleased)
				onClose(); //hmmmm maybe

		super.update(dt);	
	}

	function onClose(){// not working
		text.alpha = 0;
		if(PlayState.sim) {
		PlayState.papyintro(doof);
		 	} else {
		FlxG.switchState(nextState);
		}
	}

	function onURLChanging(url:String) {
		text.alpha = 1;
		if (url == 'http://exitme(.*)') onClose(); // drity hack lol
	}
}
