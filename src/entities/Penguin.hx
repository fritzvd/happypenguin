package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;

class Penguin extends Entity
{
    private var penguin:Spritemap;
    private var blow:Sfx;
    private var state:String;

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
		state = "alive";
	}

	private function blowUp() 
	{
		penguin.play("blowing");
		blow.play();
		state = "dead";
	}

	public override function update()
	{
		if (Input.mouseReleased) {
			if (state == "alive")
			{
				blowUp();			
			} else
			{
				state = "alive";
				penguin.play("idle");
			}
		}
		super.update();
	}
}