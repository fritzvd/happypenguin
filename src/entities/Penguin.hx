package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;

class Penguin extends Entity
{
    private var penguin:Spritemap;
    private var blow:Sfx;

	public function new(x:Int, y:Int)
	{
		super(x, y);
		penguin = new Spritemap("graphics/penguinsprite.png", 500, 500);
        penguin.add("idle", [0], 6);
        penguin.add("blowing", [0, 1, 2, 3], 3, false);
        penguin.add("blown", [3], 12);
        penguin.play("idle");
        blow = new Sfx("audio/blam.wav");
		graphic = penguin;
	}

	private function blowUp() 
	{
		penguin.play("blowing");
		trace(penguin.complete);
		blow.play();
	}

	public override function update()
	{
		if (Input.mouseReleased) {
			blowUp();
		}
		super.update();
	}
}