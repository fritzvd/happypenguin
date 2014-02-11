package scenes;

import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import entities.Penguin;

class GameScene extends Scene
{
	public function new()
	{
		super();
	}

	public override function begin()
	{

		var bitmap:Image = new Image("graphics/bg.png");
        bitmap.x = - bitmap.width / 2;
        bitmap.y = - bitmap.height / 2;
        var bgEntity:Entity = new Entity(0,0,bitmap);
        bgEntity.x =  (bitmap.width/2);
        bgEntity.y =  (bitmap.height/2);
        add(bgEntity);
		add(new Penguin(200, 50));
	}
}