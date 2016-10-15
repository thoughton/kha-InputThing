// Initially based on https://github.com/lewislepton/kha-examples/tree/master/GAMEPAD

package;

import kha.Assets;
import kha.input.Gamepad;
import kha.Framebuffer;
import zui.Zui;

class Project {
	var m_kDeadZone (default,never) : Float = 0.08;
	var m_axes : Array<Float>;
	var m_zui : Zui;

	public function new() {
		trace("-[ Input Thing ]-");

		m_axes = new Array();
		
		// Issue:
		// 	The font sizes passed to Zui here cause the unicode glyphs to fail to render when g.drawString is called for text of either of these sizes.
		// 	Changing these sizes changes the size of unicode glyphs that fail to draw.
		// 	Commenting out or removing this Zui instatiation will re-enable unicode glyph rendering at all font sizes. 
		m_zui = new Zui(Assets.fonts.NDS12, 24, 12, 0, 1.0, 1.0);

		Gamepad.get().notify(onGamepadAxis, onGamepadButton);
	}

	public function onUpdate():Void {

	}

	public function onRender(framebuffer:Framebuffer):Void {
		var g = framebuffer.g2;
		g.begin();
		{
			g.font = Assets.fonts.NDS12;
			g.fontGlyphs.push(0x2660);  // Spades
			g.fontGlyphs.push(0x2668);  // Hot springs

			var sizeBase = 10;
			var sizeStep = 1;
			var x = 50;
			var yBase = 50;
			for (i in 0...24)
			{
				g.fontSize = (sizeBase + (i * sizeStep));
				g.drawString(("♨" + " ♠ (Font size = " + g.fontSize + ")"), x, (yBase + (i * (20 + (i * 0.3)))));
			}
		}
		g.end();
	}
	
	public function onGamepadAxis(axis:Int, value:Float):Void {
		m_axes[axis] = value;
	}
	
	public function onGamepadButton(button:Int, value:Float):Void {

	}
}
