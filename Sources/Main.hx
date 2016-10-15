// Initially based on https://github.com/lewislepton/kha-examples/tree/master/GAMEPAD

package;

import kha.System;
import kha.Scheduler;
import kha.Assets;

class Main {
	public static function main() {
		System.init({title:"Input Thing", width:1024, height:768}, function () {
			Assets.loadEverything(function () {
				var project = new Project();
				Scheduler.addTimeTask(project.onUpdate, 0.0, (1.0 / 60.0));
				System.notifyOnRender(project.onRender);
			});
		});
	}
}
