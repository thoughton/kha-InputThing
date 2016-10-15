// Initially based on https://github.com/lewislepton/kha-examples/tree/master/GAMEPAD

package;

import kha.Assets;
import kha.input.Gamepad;
//import kha.Font;
import kha.Framebuffer;
import zui.Zui;
//import zui.Id;

class Project {
	var m_kDeadZone (default,never) : Float = 0.08;
	var m_axes : Array<Float>;
	var m_zui : Zui;

	public function new() {
		trace("-[ Input Thing ]-");

		m_axes = new Array();

		//m_zui = new Zui(Assets.fonts.OpenSans, 17, 16, 0, 1.0);
		//m_zui = new Zui(Assets.fonts.Roboto_Regular, 17, 16, 0, 1.0);
		m_zui = new Zui(Assets.fonts.NDS12, 25, 13, 0, 1.0, 1.0);

		Gamepad.get().notify(onGamepadAxis, onGamepadButton);
	}

	public function onUpdate():Void {

	}

	public function onRender(framebuffer:Framebuffer):Void {
		var g = framebuffer.g2;
		g.begin();
		{
			// Draw non-UI things...

			g.font = Assets.fonts.NDS12;
			g.fontGlyphs.push(0x2660);  // Spades
			g.fontGlyphs.push(0x2668);  // Hot springs

			var y = 50;
			var s = 10;
			for (i in 0...24)
			{
				g.fontSize = (s + (i * 1));
				//g.drawString("♠"+" Click axis to calibrate. (Font size = "+g.fontSize+".)", 50.0, (y + (i * (20 + (i * 0.3)))));
				//g.drawString("♨"+" Click axis to calibrate. (Font size = "+g.fontSize+".)", 50.0, (y + (i * (20 + (i * 0.3)))));
				g.drawString("♨" + " ♠ (Font size = " + g.fontSize + ")", 50.0, (y + (i * (20 + (i * 0.3)))));
			}
		}
		g.end();

		/*
		m_zui.begin(g);
		{
			var x = 0;
			var y = 0;
			var w = framebuffer.width;
			var h = framebuffer.height;

			if (m_zui.window(Id.window(), x, y, w, h, Zui.LAYOUT_VERTICAL)) {
				if (m_zui.button("Hello")) {
					trace("World");
				}

				var aCount = 0;
				for (a in m_axes)
				{
					aCount++;
					m_zui.text(("" + a));
					m_zui.slider(Id.slider(), ("Axis " + aCount), -1.0, 1.0, true, 1000, a, true);
				}

				m_zui.slider(Id.slider(), "Temp.", -1.0, 1.0, true, 1000, 0, true);

				m_zui.text("♠ Click axis to calibrate.");
			}
		}
		m_zui.end();
		*/
	}
	
	public function onGamepadAxis(axis:Int, value:Float):Void {
		if ((value < -m_kDeadZone) || (value > m_kDeadZone))
		{
			trace("Axis " + axis + ": " + value);
		}

		m_axes[axis] = value;

		/*
		///LEFT ANALOG STICK
		if (axis == 0){
			if (value < -0.5){
				trace('LEFT');
			} else if (value > 0.5){
				trace('RIGHT');
			}
		}
		if (axis == 1){
			if (value > 0.5){
				trace('UP');
			} else if (value < -0.5){
				trace('DOWN');
			}
		}
		
		///RIGHT ANALOG STICK
		if (axis == 3){
			if (value > 0.5){
				trace('LEFT');
			} else if (value < -0.5){
				trace('RIGHT');
			}
		}
		if (axis == 4){
			if (value < -0.5){
				trace('UP');
			} else if (value > 0.5){
				trace('DOWN');
			}
		}
		
		if (axis == 2){
			if (value < -0.5){
				trace('LEFT TRIGGER');
			}
		}
		
		if (axis == 5){
			if (value < -0.5){
				trace('RIGHT TRIGGER');
			}
		}
		*/
	}
	
	public function onGamepadButton(button:Int, value:Float):Void {
		if ((value < -m_kDeadZone) || (value > m_kDeadZone))
		{
			trace("Button " + button + ": " + value);
		}
		
		/*
		///ABXY BUTTONS
		if (button == 0){
			trace('A');
		} else if (button == 1){
			trace('B');
		} else if (button == 2){
			trace('X');
		} else if (button == 3){
			trace('Y');
		}
		
		///BUMPER BUTTONS
		if (button == 4){
			trace('LEFT BUMPER');
		} else if (button == 5){
			trace('RIGHT BUMPER');
		}
		
		///ANALOG PRESS
		if (button == 6){
			trace('LEFT ANALOG PRESS');
		} else if (button == 7){
				trace('RIGHT ANALOG PRESS');
		}
		
		///START/BACK BUTTONS
		if (button == 8){
			trace('START BUTTON');
		} else if (button == 9){
			trace('BACK BUTTON');
		} else if (button == 10){
			trace('HOME BUTTON');
		}
		
		///DPAD BUTTONS
		if (button == 11){
			trace('DPAD UP');
		} else if (button == 12){
			trace('DPAD DOWN');
		} else if (button == 13){
			trace('DPAD LEFT');
		} else if (button == 14){
			trace('DPAD RIGHT');
		}
		
		///HOME BUTTON
		if (button == 15){
			trace('euhenuihe');
		} else if (button == 16){
			trace('sueitehuinteu');
		} else if (button == 17){
			trace('euineunitue');
		}
		*/
	}
}
