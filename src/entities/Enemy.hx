package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Enemy extends Entity 
{
	public override function new(x:Int, y:Int)
	{
		super(x, y);
		setHitbox(30,30);
		graphic = new Image("graphics/penguin.png");
	}

	public override function update()
	{
		super.update();
	}
}