package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;

class Penguin extends Entity
{
	private var speed:Int;
	private var acceleration:Float;
	public var STATE:String;

	public function new(x:Int, y:Int)
	{
		super(x, y);
		graphic = new Image("graphics/penguin.png");
		speed = 1;
		acceleration = 1;
		STATE = "idle";
	}

	private function gravity() 
	{
		if (y < 380 ) && (STATE != idle) ) {
			moveBy(0, speed * acceleration);
		}
		if (acceleration > 1){
			acceleration -= 1;		
		} else if (acceleration < 1){
			acceleration += 1;
		}

	}

	public override function update()
	{
		if (Input.mousePressed) {
			acceleration = 0;
		}
		if (Input.mouseReleased) {
			acceleration -= 10;
		}
		gravity();
		super.update();
	}
}