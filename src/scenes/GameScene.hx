package scenes;

import com.haxepunk.Scene;
import entities.Penguin;

class GameScene extends Scene
{
	public function new()
	{
		super();
	}

	public override function begin()
	{
		add(new Penguin(200, 50));
	}
}