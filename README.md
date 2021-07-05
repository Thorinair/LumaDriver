# LumaDriver

The world-side [Furality Luma Glow Shader](https://furality.org/lumaglow) support you have been waiting for! Built up from scratch, inspired by workings of [AudioLink](https://github.com/llealloo/vrc-udon-audio-link), with support for AudioLink and with support for all 4 zones.

A live demo is available in the [Luminescent Ledge](https://vrchat.com/home/world/wrld_fb4edc80-6c48-43f2-9bd1-2fa9f1345621) VRChat world!

## Usage
1. Import the Unity package.
2. Drag the LumaDriver prefab into the scene.
3. Make sure it is far away from the scene. It should be on Y=1000000 by default.
4. You are done! Enjoy the beautiful glow once more! Check below for customization options for the driver...

## Customization
1. If you want to play around with the parameters, open the CustomRenderTexture in the following location: `LumaDriver/CustomRenderTexture/LumaDriver_CRT`, expand the shader parameters and modify them. Below is a screenshot of all available parameters.

![LumaDriver Parameters](https://raw.githubusercontent.com/Thorinair/LumaDriver/master/img/LumaDriverUI.png)

2. The default animation parameters are closest to emulating the passive Luma Glow in [F.Y.N.N.'s Room](https://vrchat.com/home/world/wrld_60bcdb81-aca1-4425-b8a0-1c5b721158b5), Luma Forest and other calm areas.
3. The Minimum Brightness parameter exists as a bandaid for an issue with Luma Glow where it flashes white when it is in the darkest point, and users have a minimum brightness set on their avatars. This is why it is not suggested to set it to completely 0.
4. You can set a custom Color Override in the properties for each zone. You can use this to control the Luma Glow with Udon or for debugging which zones avatars have on them.
5. If you have [AudioLink](https://github.com/llealloo/vrc-udon-audio-link) in your world, LumaDriver is capable of integrating with it if you enable this option. Below are some extra AudioLink options:
  * Audio Switchover option will return Luma Glow to its default animation when there is no data coming from AudioLink. You can disable this to enforce AudioLink integration to always run.
  * With Zone Color Control, you can designate if you want a zone to run the default rainbow effect, or you want it to be affected by AudioLink's ColorChord feature. You can choose from two available colors sources.
  * Using Zone Audio Band options, you can customize the band used for each zone. Not all zones will be visible on all avatars.
6. You can use the Debug Zones to show red, green, blue and yellow colors on the four avatar zones for testing purposes. This can help identify the different zones that may get activated by Luma Glow.

## Making Your Own Shader
Want to make your own Luma Glow compatible shader? Please check the image below for a guide on which pixel locations are responsible for what.

![Luma Glow Control Texture](https://raw.githubusercontent.com/Thorinair/LumaDriver/master/img/LumaGlowGuide.png)