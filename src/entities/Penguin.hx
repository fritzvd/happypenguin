package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
#if mobile
import com.haxepunk.utils.Touch;
#end

class Penguin extends Entity
{
	private var speed:Int;
	private var acceleration:Float;
	public var state:String;

	public function new(x:Int, y:Int)
	{
		super(x, y);
		graphic = new Image("graphics/penguin.png");
		speed = 1;
		acceleration = 1;
		state = "falling";
		setHitbox(50, 50);
	}

	#if mobile
    private function handleTouch(touch:com.haxepunk.utils.Touch) 
    {
        
        if (touch.pressed){
        	trace(touch);
            acceleration = -1;
			state = "floating";
        }
    }
    #end

	private function gravity() 
	{
		if (state != "ground") {
			moveBy(0, speed * acceleration);
		}
		if (state == "falling" && acceleration < 3){
			acceleration += 1;		
		}
	}

	public override function update()
	{

		#if mobile
        Input.touchPoints(handleTouch);
        #end
		if (Input.mousePressed) {
			acceleration = -1;
			state = "floating";
		} else
		 if (Input.mouseReleased) {
			acceleration -= 10;
			state = "flying";
		} else {
			if (y > 380) {
				state = "ground";
			} else {
				state = "falling";
			}
		}

		
		gravity();
		super.update();
	}
}