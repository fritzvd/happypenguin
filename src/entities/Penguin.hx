package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;

class Penguin extends Entity
{
	public function new(x:Int, y:Int)
	{
		super(x, y);
		graphic = new Image("graphics/penguin.png");
        // graphic.add("idle", [0], 6);
        // graphic.add("walk", [7,1,2,3,5,6], 10);
	}

	private function gravity() 
	{
		if (y < 320)
		{
			moveBy(0, 1);
		}

	}

	public override function update()
	{
		if (Input.mousePressed) {
			moveBy(0, -20);
		}
		gravity();
	}
}