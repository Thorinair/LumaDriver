# LumaDriver

The world-side Luma Glow support you have been waiting for!
Built up from scratch, inspired by workings of AudioLink. Now with
support for all 4 zones.

## Usage
1. Import the Unity package.
2. Drag the LumaDriver prefab into the scene.
3. Make sure it is far away from the scene. It should be on Y=1000000 by default.
4. You are done! Enjoy the beautiful glow once more! Check below for customization options for the driver...

## Customization
1. If you want to play around with the parameters, open the CustomRenderTexture in the location listed below, expand the shader parameters and modify them: `LumaDriver/CustomRenderTexture/LumaDriver_CRT`

![alt text](http://.png "LumaDriver parameters")

2. The default animation parameters are closest to emulating the passive Luma Glow in F.Y.N.N.'s Room, Luma Forest and other calm areas.
3. The Minimum Brightness parameter exists as a bandaid for an issue with Luma Glow where it flashes white when it is in the darkest point. This is why it is not suggested to set it to completely 0.
4. You can set a custom Color Override in the properties for each zone. You can use this to control the Luma Glow with Udon or for debugging which zones avatars have on them.
5. If you have AudioLink in your world, LumaDriver will automatically respond to it, which you can disable if you so wish. Below are some extra AudioLink details:
    - Audio Switchover option will return Luma Glow to its default animation when there is no data coming from AudioLink. You can disable it to enforce AudioLink always running.
    - With Zone Color Control, you can designate if you want a zone to run the default rainbow effect, or you want it to be affected by AudioLink's ColorChord feature. You can choose from two available colors sources.
    - Using Zone Audio Band options, you can customize the band used for each zone. Not all zones will be visible on all avatars.
6. You can use the Debug Zones to show red, green, blue and yellow colors on the four avatar zones for testing purposes. This can help identify the different zones that may get activated by Luma Glow.

## Making Your Own Shader
Want to make your own Luma Glow compatible shader? Please check the image below for a guide on which pixel locations are responsible for what.

![alt text](http://.png "Luma Glow control texture")