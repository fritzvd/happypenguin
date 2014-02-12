package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import entities.Penguin;

class GameScene extends Scene
{
	public var player:Penguin;
	private var cameraXOffset:Float;
	private var cameraYOffset:Float;

	public function new()
	{
		super();

		cameraXOffset = HXP.width / 2;
		cameraYOffset = HXP.height / 2;
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

        player = new Penguin(200, 50);
		add(player);
	}

	private function followPlayer()
	{

		HXP.camera.x = player.x - cameraXOffset;
		HXP.camera.y = player.y - cameraYOffset;
	}

	public override function update()
	{
		followPlayer();
		super.update();
	}
}