package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Graphiclist;
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

        var bgGround:Backdrop = new Backdrop("graphics/bg.png", true, false);
        var bgSnow:Backdrop = new Backdrop("graphics/bgtile.png", true, true);
        bgSnow.scrollY = 0.3;
        var bgSnow2:Backdrop = new Backdrop("graphics/bgsnow2.png", true, true);
        bgSnow2.scale = 0.4;
        bgSnow2.scrollY = 0.8;
        var bgSky:Backdrop = new Backdrop("graphics/bgsky.png", true, true);
        bgSky.scrollY = 0.9;
        var bgEntity:Entity = new Entity(0, 0);
        bgEntity.graphic = new Graphiclist([bgSky, bgSnow, bgSnow2, bgGround]);
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