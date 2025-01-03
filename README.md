# KCNet-Godot-Test

In this repo, I am testing a basic game in Godot using GDScript. There will be some free assets in this that I am using mostly under the assets folder.

This game doesn't do much currently, you can move the knight character around and move between zones, the health system isn't implemented yet. 

I have a custom movement animation which only works when going left/right and a custom idle animation on the main character. Also the coin is animated too.

The coin I have setup to have a sound when picked up and the world1 interior has music that plays when you go in there.

Credit to MintoDog for the (sky_blue_street_climax_bpm180.ogg In use on world_1_interior): https://opengameart.org/content/sky-blue-street

---

I used globals to get the teleportation working with the doors in the current scene.
https://forum.godotengine.org/t/problem-getting-player-position-from-another-scene/54745

I added a couple doors with teleports on the local scenes, it took me a little while to figure out how to make a teleport work between scenes.
Now there is an entry/exit door in the mini castle that I created on the right side of world1.

I may remove the sky worlds and extras or just put them into a seperate Godot project.

I added a basic enemy which only has an animation for now, he is a fly on world1, once I implement the health system I'll try to make
the enemies attack the player.

### Character movement
To move the character around, you can use WASD like most games

You can use the mouse scroll wheel up to zoom the game in and the mouse scroll wheel down to zoom the game out.

Press the enter key to use doors.

I don't have jumping implemented just yet.

### TODO for project
* Implement health system
* Implement enemy movement
* Refactor movement for player, possibly add gravity and jumping.
* Add attacks for player, swing sword at enemies.
* Get this project to build on IOS/Android, currently it dies when launched on my Pixel 7a.

### More advanced TODO for project
I might be able to do these in the future once I learn more Godot 4
* Create a inventory system
* Create a multiplayer test game
* Add leaderboards to game
* Look into my addons/assets list for some ideas to use.

### Possible addons to use
* [Turnity turn management system](https://github.com/BananaHolograma/turnity/tree/main/addons/turnity)
* [DiceEngine - Simple DiceRoller - Godot Asset Library](https://godotengine.org/asset-library/asset/3275)
* [CopperDC - An in-game debug console - Godot Asset Library](https://godotengine.org/asset-library/asset/2478)



### Tutorials used for this project
* Some inspiration for the camera stuff came from here: https://www.nightquestgames.com/godot-4-camera2d-smooth-zoom-movement/
* All credit to Night Quest Games for the tips on how to make a camera zoom in and out.



### Credits
* Credit to Luke.RUSTLTD for the coin sounds: https://opengameart.org/content/10-8bit-coin-sounds
* Credit to MintoDog for the sky_blue_street_bpm and sky_blue_street_climax music files (sky_blue_street_climax_bpm180.ogg In use on world_1_interior): https://opengameart.org/content/sky-blue-street
* Credit to Frenchyboy for the mysyeriobossfight.wav (In use for my Main Menu in the future): https://opengameart.org/content/mysterious-boss-fight
* Credit to Spring Spring for the powerup sound effects: https://opengameart.org/content/power-up-sound-effects
* Credit to Godot for the amazing game engine: https://godotengine.org/