package;

import kha.System;

class Main {
	public static function main() {
		System.init({title:"Input Thing", width:1024, height:768}, function () {
			new Project();
		});
	}
}
