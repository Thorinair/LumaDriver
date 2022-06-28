Shader "LumaDriver/Driver"
{
    Properties
    {
        [Enum(Main Options,0,Idle Animations,1,AudioLink,2,Color Overrides,3,DMX Control,4)] _Page("Options Page", Float) = 0

        [Header(Basic Options)]
        [Space(15)]
        [MaterialToggle] _IsEnabled("Luma Glow Enabled", Float) = 1
        [MaterialToggle] _LumaPixel("Use Original Luma Glow Pixel", Float) = 1
        [MaterialToggle] _ReactiveIdle("Audio Reactive Pixel On When Idle", Float) = 1
        [MaterialToggle] _DebugZone("Debug Zones", Float) = 0

        [Header(Global Idle Animations)]
        [Space(15)]
        _RGBSpeed ("RGB Speed", Float) = 10
        [Space(15)]

        [Header(Zone Idle Animations)]
        [Space(15)]
        _ShiftZ1 ("Zone 1 Color Shift", Range(0, 1)) = 0.00
        _ShiftZ2 ("Zone 2 Color Shift", Range(0, 1)) = 0.025
        _ShiftZ3 ("Zone 3 Color Shift", Range(0, 1)) = 0.025
        _ShiftZ4 ("Zone 4 Color Shift", Range(0, 1)) = 0.05
        _PulseSpeed ("Pulse Speed", Float) = 6.1
        _MinimumBrightness ("Minimum Brightness", Range(0, 1)) = 0.005
        [Space(15)]

        [Header(Gradient Idle Animations)]
        [Space(15)]
        _ShiftG1StopA ("Gradient 1 Stop A Color Shift", Range(0, 1)) = 0.0
        _ShiftG1StopB ("Gradient 1 Stop B Color Shift", Range(0, 1)) = 0.025
        _ShiftG1StopC ("Gradient 1 Stop C Color Shift", Range(0, 1)) = 0.05
        [MaterialToggle] _FadingG1("Gradient 1 Fading", Float) = 1
        _FadeG1Time ("Gradient 1 Fade Time", Float) = 6.1
        _TimeG1Scale ("Gradient 1 Time Scale", Float) = 1.0
        _MidG1Offset ("Gradient 1 Mid Stop Offset", Range(0, 1)) = 0.5

        [Space(10)]
        _ShiftG2StopA ("Gradient 2 Stop A Color Shift", Range(0, 1)) = 0.0
        _ShiftG2StopB ("Gradient 2 Stop B Color Shift", Range(0, 1)) = 0.25
        _ShiftG2StopC ("Gradient 2 Stop C Color Shift", Range(0, 1)) = 0.5
        [MaterialToggle] _FadingG2("Gradient 2 Fading", Float) = 1
        _FadeG2Time ("Gradient 2 Fade Time", Float) = 12.2
        _TimeG2Scale ("Gradient 2 Time Scale", Float) = 0.5
        _MidG2Offset ("Gradient 2 Mid Stop Offset", Range(0, 1)) = 0.5

        [Space(10)]
        _ShiftG3StopA ("Gradient 3 Stop A Color Shift", Range(0, 1)) = 0.0
        _ShiftG3StopB ("Gradient 3 Stop B Color Shift", Range(0, 1)) = 0.333
        _ShiftG3StopC ("Gradient 3 Stop C Color Shift", Range(0, 1)) = 0.667
        [MaterialToggle] _FadingG3("Gradient 3 Fading", Float) = 1
        _FadeG3Time ("Gradient 3 Fade Time", Float) = 1.22
        _TimeG3Scale ("Gradient 3 Time Scale", Float) = 5.0
        _MidG3Offset ("Gradient 3 Mid Stop Offset", Range(0, 1)) = 0.5
        
        [Header(AudioLink Integration)]
        [Space(15)]
        [MaterialToggle] _ALOverride("Enabled", Float) = 0
        [MaterialToggle] _ALAutomatic("Automatic Switchover", Float) = 1
        [MaterialToggle] _ALMaximize("Maximize Colors", Float) = 1
        [MaterialToggle] _ALThemes("Use Theme Colors", Float) = 1
        [Space(15)]

        [Header(AudioLink Reactive Pixel)]
        [Space(15)]
        [MaterialToggle] _ALReactivePixel("Reactive Pixel Enabled", Float) = 1
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _ReactiveBandLows("Reactive Pixel Lows Band", Float) = 0.0078
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _ReactiveBandHighs("Reactive Pixel Highs Band", Float) = 0.0546

        [Space(15)]
        [Header(AudioLink Zones)] 
        [Space(15)]
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccZ1("Zone 1 Color Control", Float) = 0.1992
        [Space(15)]
        [Header(AudioLink Zones)]
        [Space(15)]
        [Enum(Idle Animations Color,0,Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttZ1("Zone 1 Color Control", Float) = 0.0039
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ1("Zone 1 Audio Band", Float) = 0.0546
        [Space(10)]
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccZ2("Zone 2 Color Control", Float) = 0.2070
        [Space(10)]
        [Enum(Idle Animations Color,0,Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttZ2("Zone 2 Color Control", Float) = 0.0117
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ2("Zone 2 Audio Band", Float) = 0.0390
        [Space(10)]
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccZ3("Zone 3 Color Control", Float) = 0.2148
        [Space(10)]
        [Enum(Idle Animations Color,0,Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttZ3("Zone 3 Color Control", Float) = 0.0195
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ3("Zone 3 Audio Band", Float) = 0.0078
        [Space(10)]
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccZ4("Zone 4 Color Control", Float) = 0.2227
        [Space(10)]
        [Enum(Idle Animations Color,0,Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttZ4("Zone 4 Color Control", Float) = 0.0273
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ4("Zone 4 Audio Band", Float) = 0.0234
        [Space(15)]

        [Header(AudioLink Gradients)]
        [Space(15)]
        [MaterialToggle] _ALccG1("Enable Gradient 1 Color Control", Float) = 1
        [Enum(ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG1StopA("Gradient 1 Stop A Color Control", Float) = 0.1992
        [Enum(ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG1StopC("Gradient 1 Stop C Color Control", Float) = 0.2070
        [Enum(Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttG1StopA("Gradient 1 Stop A Color Control", Float) = 0.0039
        [Enum(Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttG1StopC("Gradient 1 Stop C Color Control", Float) = 0.0117
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandG1("Gradient 1 Audio Band", Float) = 0.0078
        [MaterialToggle] _BandG1Reverse("Reverse Gradient 1 Audio", Float) = 0
        _BandG1Length ("Gradient 1 Audio Length", Range(0, 1)) = 0.2
        [Space(10)]
        [MaterialToggle] _ALccG2("Enable Gradient 2 Color Control", Float) = 1
        [Enum(ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG2StopA("Gradient 2 Stop A Color Control", Float) = 0.2148
        [Enum(ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG2StopC("Gradient 2 Stop C Color Control", Float) = 0.2227
        [Enum(Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttG2StopA("Gradient 2 Stop A Color Control", Float) = 0.0195
        [Enum(Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttG2StopC("Gradient 2 Stop C Color Control", Float) = 0.0273
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandG2("Gradient 2 Audio Band", Float) = 0.0546
        [MaterialToggle] _BandG2Reverse("Reverse Gradient 2 Audio", Float) = 0
        _BandG2Length ("Gradient 2 Audio Length", Range(0, 1)) = 0.2
        [Space(10)]
        [MaterialToggle] _ALccG3("Enable Gradient 3 Color Control", Float) = 0
        [Enum(ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG3StopA("Gradient 3 Stop A Color Control", Float) = 0.1992
        [Enum(ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG3StopC("Gradient 3 Stop C Color Control", Float) = 0.1992
        [Enum(Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttG3StopA("Gradient 3 Stop A Color Control", Float) = 0.0039
        [Enum(Theme Color 0,0.0039,Theme Color 1,0.0117,Theme Color 2,0.0195,Theme Color 3,0.0273)] _ALttG3StopC("Gradient 3 Stop C Color Control", Float) = 0.0039
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandG3("Gradient 3 Audio Band", Float) = 0.0390
        [MaterialToggle] _BandG3Reverse("Reverse Gradient 3 Audio", Float) = 0
        _BandG3Length ("Gradient 3 Audio Length", Range(0, 1)) = 1.0

        [Header(Zone Color Overrides)]
        [Space(15)]
        [MaterialToggle] _ColorOverrideZ1("Zone 1 Enable", Float) = 0
        _ColourZ1 ("Zone 1 Color Override", Color) = (1, 0, 0)
        [Space(10)]
        [MaterialToggle] _ColorOverrideZ2("Zone 2 Enable", Float) = 0
        _ColourZ2 ("Zone 2 Color Override", Color) = (0, 1, 0)
        [Space(10)]
        [MaterialToggle] _ColorOverrideZ3("Zone 3 Enable", Float) = 0
        _ColourZ3 ("Zone 3 Color Override", Color) = (0, 0, 1)
        [Space(10)]
        [MaterialToggle] _ColorOverrideZ4("Zone 4 Enable", Float) = 0
        _ColourZ4 ("Zone 4 Color Override", Color) = (1, 1, 0)
        [Space(15)]

        [Header(Gradient Color Overrides)]
        [Space(15)]
        [MaterialToggle] _ColorOverrideG1("Gradient 1 Enable", Float) = 0
        _ColourG1StopA ("Gradient 1 Stop A Color Override", Color) = (1, 0, 0)
        _ColourG1StopB ("Gradient 1 Stop B Color Override", Color) = (0, 1, 0)
        _ColourG1StopC ("Gradient 1 Stop C Color Override", Color) = (0, 0, 1)
        [Space(10)]
        [MaterialToggle] _ColorOverrideG2("Gradient 2 Enable", Float) = 0
        _ColourG2StopA ("Gradient 2 Stop A Color Override", Color) = (0, 0, 1)
        _ColourG2StopB ("Gradient 2 Stop B Color Override", Color) = (0, 1, 0)
        _ColourG2StopC ("Gradient 2 Stop C Color Override", Color) = (1, 0, 0)
        [Space(10)]
        [MaterialToggle] _ColorOverrideG3("Gradient 3 Enable", Float) = 0
        _ColourG3StopA ("Gradient 3 Stop A Color Override", Color) = (0, 0, 0)
        _ColourG3StopB ("Gradient 3 Stop B Color Override", Color) = (0.5, 0.5, 0.5)
        _ColourG3StopC ("Gradient 3 Stop C Color Override", Color) = (1, 1, 1)

        [Space(15)]
        [Header(DMX Control)]
        [Space(15)]
        [MaterialToggle] _DMXEnable("Enable DMX", Float) = 0
        _DMXFixtureID ("Fixture ID (NOTE: Uses 2 Sectors)", Float) = 0
        [Space(10)]
        [NoScaleOffset] _DMXTex ("DMX Render Texture", 2D) = "white" {}
        [Space(15)]

        [Header(DMX Intensity Control)]
        [Space(15)]
        [MaterialToggle] _DMXintZ1("Zone 1 DMX Intensity Control", Float) = 1
        [MaterialToggle] _DMXintZ2("Zone 2 DMX Intensity Control", Float) = 1
        [MaterialToggle] _DMXintZ3("Zone 3 DMX Intensity Control", Float) = 1
        [MaterialToggle] _DMXintZ4("Zone 4 DMX Intensity Control", Float) = 1
        [Space(10)]
        [MaterialToggle] _DMXintG1("Gradient 1 DMX Intensity Control", Float) = 1
        [MaterialToggle] _DMXintG2("Gradient 2 DMX Intensity Control", Float) = 1
        [MaterialToggle] _DMXintG3("Gradient 3 DMX Intensity Control", Float) = 1

        [Space(15)]
        [Header(DMX Strobe Control)]
        [Space(15)]
        [MaterialToggle] _DMXstrobe("DMX Strobe Control", Float) = 1

        [Space(15)]
        [Header(DMX Color Control)]
        [Space(15)]
        [MaterialToggle] _DMXccZ1Enable("Zone 1 DMX Color Enable", Float) = 1
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccZ1("Zone 1 DMX Color Source", Float) = 0
        [MaterialToggle] _DMXccZ2Enable("Zone 2 DMX Color Enable", Float) = 1
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccZ2("Zone 2 DMX Color Source", Float) = 1
        [MaterialToggle] _DMXccZ3Enable("Zone 3 DMX Color Enable", Float) = 1
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccZ3("Zone 3 DMX Color Source", Float) = 2
        [MaterialToggle] _DMXccZ4Enable("Zone 4 DMX Color Enable", Float) = 1
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccZ4("Zone 4 DMX Color Source", Float) = 3
        [Space(10)]
        [MaterialToggle] _DMXccG1Enable("Gradient 1 DMX Color Enable", Float) = 1
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccG1StopA("Gradient 1 Stop A DMX Color Source", Float) = 0
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccG1StopC("Gradient 1 Stop C DMX Color Source", Float) = 1
        [MaterialToggle] _DMXccG2Enable("Gradient 2 DMX Color Enable", Float) = 1
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccG2StopA("Gradient 2 Stop A DMX Color Source", Float) = 2
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccG2StopC("Gradient 2 Stop C DMX Color Source", Float) = 3
        [MaterialToggle] _DMXccG3Enable("Gradient 3 DMX Color Enable", Float) = 1
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccG3StopA("Gradient 3 Stop A DMX Color Source", Float) = 0
        [Enum(DMX Color 1,0,DMX Color 2,1,DMX Color 3,2,DMX Color 4,3)] _DMXccG3StopC("Gradient 3 Stop C DMX Color Source", Float) = 1
    }

    SubShader
    {
        Lighting Off
        Blend One Zero

        Pass
        {
            CGPROGRAM
            #include "UnityCustomRenderTexture.cginc"
            #pragma vertex CustomRenderTextureVertexShader
            #pragma fragment frag
            #pragma target 3.0

            #include "UnityCG.cginc"

            struct appdata {
                float2 uv : TEXCOORD0;
            };

            float _IsEnabled;
            float _LumaPixel;
            float _ReactiveIdle;
            float _DebugZone;

            float _RGBSpeed;

            float _ShiftZ1;
            float _ShiftZ2;
            float _ShiftZ3;
            float _ShiftZ4;
            float _PulseSpeed;
            float _MinimumBrightness;

            float _ShiftG1StopA;
            float _ShiftG1StopB;
            float _ShiftG1StopC;
            float _FadingG1;
            float _FadeG1Time;
            float _TimeG1Scale;
            float _MidG1Offset;

            float _ShiftG2StopA;
            float _ShiftG2StopB;
            float _ShiftG2StopC;
            float _FadingG2;
            float _FadeG2Time;
            float _TimeG2Scale;
            float _MidG2Offset;

            float _ShiftG3StopA;
            float _ShiftG3StopB;
            float _ShiftG3StopC;
            float _FadingG3;
            float _FadeG3Time;
            float _TimeG3Scale;
            float _MidG3Offset;

            float _ALOverride;
            float _ALAutomatic;
            float _ALMaximize;
            float _ALThemes;
            float _ALReactivePixel;
            float _ReactiveBandLows;
            float _ReactiveBandHighs;

            float _ALccZ1;
            float _ALttZ1;
            float _BandZ1;
            float _ALccZ2;
            float _ALttZ2;
            float _BandZ2;
            float _ALccZ3;
            float _ALttZ3;
            float _BandZ3;
            float _ALccZ4;
            float _ALttZ4;
            float _BandZ4;

            float _ALccG1;
            float _ALccG1StopA;
            float _ALccG1StopC;
            float _ALttG1StopA;
            float _ALttG1StopC;
            float _BandG1;
            float _BandG1Reverse;
            float _BandG1Length;

            float _ALccG2;
            float _ALccG2StopA;
            float _ALccG2StopC;
            float _ALttG2StopA;
            float _ALttG2StopC;
            float _BandG2;
            float _BandG2Reverse;
            float _BandG2Length;

            float _ALccG3;
            float _ALccG3StopA;
            float _ALccG3StopC;
            float _ALttG3StopA;
            float _ALttG3StopC;
            float _BandG3;
            float _BandG3Reverse;
            float _BandG3Length;

            float _ColorOverrideZ1;
            float3 _ColourZ1;
            float _ColorOverrideZ2;
            float3 _ColourZ2;
            float _ColorOverrideZ3;
            float3 _ColourZ3;
            float _ColorOverrideZ4;
            float3 _ColourZ4;

            float _ColorOverrideG1;
            float3 _ColourG1StopA;
            float3 _ColourG1StopB;
            float3 _ColourG1StopC;
            float _ColorOverrideG2;
            float3 _ColourG2StopA;
            float3 _ColourG2StopB;
            float3 _ColourG2StopC;
            float _ColorOverrideG3;
            float3 _ColourG3StopA;
            float3 _ColourG3StopB;
            float3 _ColourG3StopC;

            float _DMXEnable;
            float _DMXFixtureID;
            sampler2D _DMXTex;

            float _DMXintZ1;
            float _DMXintZ2;
            float _DMXintZ3;
            float _DMXintZ4;
            float _DMXintG1;
            float _DMXintG2;
            float _DMXintG3;

            float _DMXstrobe;

            float _DMXccZ1Enable;
            float _DMXccZ1;
            float _DMXccZ2Enable;
            float _DMXccZ2;
            float _DMXccZ3Enable;
            float _DMXccZ3;
            float _DMXccZ4Enable;
            float _DMXccZ4;
            float _DMXccG1Enable;
            float _DMXccG1StopA;
            float _DMXccG1StopC;
            float _DMXccG2Enable;
            float _DMXccG2StopA;
            float _DMXccG2StopC;
            float _DMXccG3Enable;
            float _DMXccG3StopA;
            float _DMXccG3StopC;

            uniform sampler2D _AudioTexture;

            fixed3 HSVToRGB(float3 c) {
                float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
                float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
                return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
            }

            fixed3 RGBToHSV(fixed3 c) {
                float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 P = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
                float4 Q = lerp(float4(P.xyw, c.r), float4(c.r, P.yzx), step(P.x, c.r));
                float  D = Q.x - min(Q.w, Q.y);
                float  E = 1e-10;
                return fixed3(abs(Q.z + (Q.w - Q.y)/(6.0 * D + E)), D / (Q.x + E), Q.x);
            }

            fixed3 maximize(fixed3 c) {
                if (_ALMaximize == 1) {
                    if (c.x == 0 && c.y == 0 && c.z == 0)
                        return fixed3(1.0, 1.0, 1.0);
                    else
                        return c / max(c.r, max(c.g, c.b));
                }
                else {
                    return c;
                }
            }

            bool isALActive() {
                if (_ALOverride == 1) {
                    if (_ALAutomatic == 1) {
                        if (tex2D(_SelfTexture2D, float2(1.0 / 1024, 1.0 / 576)).x > 0)
                            return true;
                        else
                            return false;
                    }
                    else {
                        return true;
                    }
                }
                else {
                    return false;
                }
                return false;
            }

            fixed3 getALStop(fixed3 rgb, float ccStop, float ttStop) {
                if (_ALThemes) {
                    if (ttStop != 0) {
                        rgb = tex2D(_AudioTexture, float2(ttStop, 1.0 / 128 + (1.0 / 64) * 23));
                        rgb = maximize(rgb);
                    }
                }
                else {
                    if (ccStop != 0) {
                        rgb = tex2D(_AudioTexture, float2(ccStop, 1.0 / 128 + (1.0 / 64) * 22));
                        rgb = maximize(rgb);
                    }
                }
                return rgb;
            }

            bool isDMXActive() {
                if (_DMXEnable == 1)
                    return tex2D(_DMXTex, float2(8.0 / 208, (8.0 / 1080) + (16.0 / 1080) * int(round(_DMXFixtureID)))).x >= 0.5;
                else
                    return false;
            }

            fixed3 getDMXColor(float color) {
                float x = (8.0 / 208) + (16.0 / 208) * color * 3;
                float y = (8.0 / 1080) + (16.0 / 1080) * (int(round(_DMXFixtureID)) + 1);
                fixed r = tex2D(_DMXTex, float2(x, y)).x;
                fixed g = tex2D(_DMXTex, float2(x + (16.0 / 208), y)).x;
                fixed b = tex2D(_DMXTex, float2(x + (16.0 / 208) * 2, y)).x;
                return fixed3(r, g, b);
            }

            fixed getDMXIntensity(bool isOn, float enable, float loc) {
                if (isOn && enable == 1) {
                    float x = (8.0 / 208) + (16.0 / 208) * loc;
                    float y = (8.0 / 1080) + (16.0 / 1080) * int(round(_DMXFixtureID));
                    return tex2D(_DMXTex, float2(x, y)).x;
                }
                else {
                    return 1;
                }
            }

            fixed getDMXStrobe(bool isOn, float time) {
                if (isOn && _DMXstrobe == 1) {
                    float x = (8.0 / 208) + (16.0 / 208) * 8;
                    float y = (8.0 / 1080) + (16.0 / 1080) * int(round(_DMXFixtureID));
                    float speed = tex2D(_DMXTex, float2(x, y)).x;
                    if (speed <= 0.05)
                        return 1;
                    else
                        return max(min(sin(time * speed * 90) * 1000, 1.0), _MinimumBrightness);
                }
                else {
                    return 1;
                }                
            }

            fixed4 getGradientOutput(
                    bool isALOn, bool isDMXOn, float x, 
                    fixed3 rgb, fixed3 rgbA, fixed3 rgbB, fixed3 rgbC, 
                    float ratio, float time, float val, float midStop, float fading, 
                    float shiftA, float shiftB, float shiftC, 
                    float useCC, float useCCDMX, float useIntDMX, float dmxLoc, float override, float3 debug) {

                if (_DebugZone == 1) {
                    float timeDebug = (_Time.y / 1.22 + 5.0 * ratio);
                    return fixed4(debug.x, debug.y, debug.z, 1) * min(((sin(timeDebug * 2 * 3.14159265) + 1) / 2), 1.0);
                }

                if ((isALOn && useCC) || (isDMXOn && useCCDMX)) {
                    fixed3 hsvA = RGBToHSV(rgbA);
                    fixed3 hsvC = RGBToHSV(rgbC);

                    if (hsvA.x - hsvC.x > 0.5)
                        hsvC.x += 1;
                    else if (hsvC.x - hsvA.x > 0.5)
                        hsvA.x += 1;

                    rgb = HSVToRGB(hsvA * ratio + hsvC * (1 - ratio));
                }
                else {
                    if (override) {
                        if (x < midStop) {
                            fixed3 hsvA = RGBToHSV(rgbA);
                            fixed3 hsvB = RGBToHSV(rgbB);
                            if (hsvA.x - hsvB.x > 0.5)
                                hsvB.x += 1;
                            else if (hsvB.x - hsvA.x > 0.5)
                                hsvA.x += 1;
                            rgb = HSVToRGB(hsvA * (0.5 - ratio) * 2 + hsvB * ratio * 2);
                        }
                        else {
                            fixed3 hsvB = RGBToHSV(rgbB);
                            fixed3 hsvC = RGBToHSV(rgbC);
                            if (hsvB.x - hsvC.x > 0.5)
                                hsvC.x += 1;
                            else if (hsvC.x - hsvB.x > 0.5)
                                hsvB.x += 1;
                            rgb = HSVToRGB(hsvB * (1.0 - ratio) * 2 + hsvC * (ratio - 0.5) * 2);
                        }
                    }
                    else {
                        if (x < midStop) {
                            fixed3 hsvA = RGBToHSV(rgbA);
                            fixed3 hsvB = RGBToHSV(rgbB);
                            if (shiftB > shiftA && hsvA.x > hsvB.x)
                                hsvB.x += 1;
                            else if (shiftA > shiftB && hsvB.x > hsvA.x)
                                hsvA.x += 1;
                            rgb = HSVToRGB(hsvA * (0.5 - ratio) * 2 + hsvB * ratio * 2);
                        }
                        else {
                            fixed3 hsvB = RGBToHSV(rgbB);
                            fixed3 hsvC = RGBToHSV(rgbC);
                            if (shiftC > shiftB && hsvB.x > hsvC.x)
                                hsvC.x += 1;
                            else if (shiftB > shiftC && hsvC.x > hsvB.x)
                                hsvB.x += 1;
                            rgb = HSVToRGB(hsvB * (1.0 - ratio) * 2 + hsvC * (ratio - 0.5) * 2);
                        }
                    }
                }

                rgb *= getDMXIntensity(isDMXOn, useIntDMX, dmxLoc);
                rgb *= getDMXStrobe(isDMXOn, _Time.y * 2 * 3.14159265);

                if (isALOn || isDMXOn) {
                    return fixed4(rgb.x, rgb.y, rgb.z, 1) * max(val, 0);
                }
                else {
                    if (fading == 0)                            
                        return fixed4(rgb.x, rgb.y, rgb.z, 1);
                    else
                        return fixed4(rgb.x, rgb.y, rgb.z, 1) * min(((sin(time * 2 * 3.14159265) + 1) / 2), 1.0);
                }
            }

            float4 frag(v2f_customrendertexture IN) : COLOR {
                if (_IsEnabled == 1) {

                    // Calculation for whether AudioLink is playing audio
                    if (IN.localTexcoord.x < 1.0 / 512 && IN.localTexcoord.y < 1.0 / 288) {
                        fixed isOn = 0;
                        [unroll] for (int i = 4; i < 6; i++) {
                            [unroll] for (int j = 0; j < 128; j++) {
                                isOn = max(isOn, tex2D(_AudioTexture, float2(1.0 / 256 + (1.0 / 128) * j, 1.0 / 128 + (1.0 / 64) * i)).z);
                            }
                        }
                        if (isOn > 0) {
                            return fixed4(1, 0, 0, 1);
                        }
                        else {
                            return fixed4(0, 0, 0, 1);
                        }
                    }

                    // Original Luma Control Pixel
                    else if (_LumaPixel == 1 && IN.localTexcoord.x > 0.625 && IN.localTexcoord.x < 0.633307 && IN.localTexcoord.y > 0.50423 && IN.localTexcoord.y < 0.51834) {
                        return fixed4(1, 0, 0, 1);
                    }

                    // Luma Zone Pixels
                    else if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.52916) {
                        bool isALOn = isALActive();
                        bool isDMXOn = isDMXActive();

                        float time = _Time.y * 2 * 3.14159265;
                        fixed3 rgb = fixed3(0, 0, 0);
                        fixed3 rgbcc = fixed3(0, 0, 0);
                        float val = 1;

                        // ZONE 1 - Upper Left
                        if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.8599 && IN.localTexcoord.y > 0.51411 && IN.localTexcoord.y < 0.52916) {
                            if (_DebugZone == 1)
                                return fixed4(1, 0, 0, 1);

                            if (_ColorOverrideZ1 == 1) {
                                return fixed4(_ColourZ1, 1);
                            }
                            else {
                                if (isDMXOn && _DMXccZ1Enable == 1) {
                                    rgb = getDMXColor(_DMXccZ1);
                                }
                                if (isALOn) {
                                    float2 uv = float2(1.0 / 256, _BandZ1);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALThemes) {
                                        if (_ALttZ1 != 0 && (!isDMXOn || _DMXccZ1Enable == 0)) {
                                            rgb = tex2D(_AudioTexture, float2(_ALttZ1, 1.0 / 128 + (1.0 / 64) * 23));
                                            rgb = maximize(rgb);
                                        }
                                    }
                                    else {
                                        if (_ALccZ1 != 0 && (!isDMXOn || _DMXccZ1Enable == 0)) {
                                            rgb = tex2D(_AudioTexture, float2(_ALccZ1, 1.0 / 128 + (1.0 / 64) * 22));
                                            rgb = maximize(rgb);
                                        }
                                    }
                                }
                                else if (!isDMXOn || _DMXccZ1Enable == 0) {
                                    float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ1, 1.0, 1.0);
                                    rgb = HSVToRGB(hsv);
                                }

                                rgb *= getDMXIntensity(isDMXOn, _DMXintZ1, 1);
                            }
                        }

                        // ZONE 2 - Lower Left
                        else if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.8599 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.51411) {
                            if (_DebugZone == 1)
                                return fixed4(0, 1, 0, 1);

                            if (_ColorOverrideZ2 == 1) {
                                return fixed4(_ColourZ2, 1);
                            }
                            else {
                                if (isDMXOn && _DMXccZ2Enable == 1) {
                                    rgb = getDMXColor(_DMXccZ2);
                                }
                                if (isALOn) {
                                    float2 uv = float2(1.0 / 256, _BandZ2);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALThemes) {
                                        if (_ALttZ2 != 0 && (!isDMXOn || _DMXccZ2Enable == 0)) {
                                            rgb = tex2D(_AudioTexture, float2(_ALttZ2, 1.0 / 128 + (1.0 / 64) * 23));
                                            rgb = maximize(rgb);
                                        }
                                    }
                                    else {
                                        if (_ALccZ2 != 0 && (!isDMXOn || _DMXccZ2Enable == 0)) {
                                            rgb = tex2D(_AudioTexture, float2(_ALccZ2, 1.0 / 128 + (1.0 / 64) * 22));
                                            rgb = maximize(rgb);
                                        }
                                    }
                                }
                                else if (!isDMXOn || _DMXccZ2Enable == 0) {
                                    float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ2, 1.0, 1.0);
                                    rgb = HSVToRGB(hsv);
                                }

                                rgb *= getDMXIntensity(isDMXOn, _DMXintZ2, 2);
                            }
                        }

                        // ZONE 3 - Upper Right
                        else if (IN.localTexcoord.x > 0.8599 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.51411 && IN.localTexcoord.y < 0.52916) {
                            if (_DebugZone == 1)
                                return fixed4(0, 0, 1, 1);

                            if (_ColorOverrideZ3 == 1) {
                                return fixed4(_ColourZ3, 1);
                            }
                            else {
                                if (isDMXOn && _DMXccZ3Enable == 1) {
                                    rgb = getDMXColor(_DMXccZ3);
                                }
                                if (isALOn) {
                                    float2 uv = float2(1.0 / 256, _BandZ3);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALThemes) {
                                        if (_ALttZ3 != 0 && (!isDMXOn || _DMXccZ3Enable == 0)) {
                                            rgb = tex2D(_AudioTexture, float2(_ALttZ3, 1.0 / 128 + (1.0 / 64) * 23));
                                            rgb = maximize(rgb);
                                        }
                                    }
                                    else {
                                        if (_ALccZ3 != 0 && (!isDMXOn || _DMXccZ3Enable == 0)) {
                                            rgb = tex2D(_AudioTexture, float2(_ALccZ3, 1.0 / 128 + (1.0 / 64) * 22));
                                            rgb = maximize(rgb);
                                        }                                        
                                    }
                                }
                                else if (!isDMXOn || _DMXccZ3Enable == 0) {
                                    float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ3, 1.0, 1.0);
                                    rgb = HSVToRGB(hsv);
                                }

                                rgb *= getDMXIntensity(isDMXOn, _DMXintZ3, 3);
                            }
                        }

                        // ZONE 4 - Lower Right
                        else if (IN.localTexcoord.x > 0.8599 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.51411) {
                            if (_DebugZone == 1)
                                return fixed4(1, 1, 0, 1);

                            if (_ColorOverrideZ4 == 1) {
                                return fixed4(_ColourZ4, 1);
                            }
                            else {
                                bool isDMXOn = isDMXActive();
                                if (isDMXOn && _DMXccZ4Enable == 1) {
                                    rgb = getDMXColor(_DMXccZ4);
                                }
                                if (isALOn) {
                                    float2 uv = float2(1.0 / 256, _BandZ4);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALThemes) {
                                        if (_ALttZ4 != 0 && (!isDMXOn || _DMXccZ4Enable == 0)) {
                                            rgb = tex2D(_AudioTexture, float2(_ALttZ4, 1.0 / 128 + (1.0 / 64) * 23));
                                            rgb = maximize(rgb);
                                        }
                                    }
                                    else {
                                        if (_ALccZ4 != 0 && (!isDMXOn || _DMXccZ4Enable == 0)) {
                                            rgb = tex2D(_AudioTexture, float2(_ALccZ4, 1.0 / 128 + (1.0 / 64) * 22));
                                            rgb = maximize(rgb);
                                        }
                                    }
                                }
                                else if (!isDMXOn || _DMXccZ4Enable == 0) {
                                    float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ4, 1.0, 1.0);
                                    rgb = HSVToRGB(hsv);
                                }

                                rgb *= getDMXIntensity(isDMXOn, _DMXintZ4, 4);
                            }
                        }

                        rgb *= getDMXStrobe(isDMXOn, time);

                        if (isALOn || isDMXOn)
                            return fixed4(rgb.x, rgb.y, rgb.z, 1) * max(val, _MinimumBrightness);
                        else
                            return fixed4(rgb.x, rgb.y, rgb.z, 1) * min(((sin(time / _PulseSpeed) + 1) / 2) + _MinimumBrightness, 1.0);
                    }

                    // Gradient 1
                    else if (IN.localTexcoord.x > 0.56979 && IN.localTexcoord.x < 0.67708 && IN.localTexcoord.y > 0.48672 && IN.localTexcoord.y < 0.49922) {
                        bool isALOn = isALActive();
                        bool isDMXOn = isDMXActive();

                        float ratio = (IN.localTexcoord.x - 0.56979) / 0.10729;
                        float midStop = 0.56979 + 0.10729 * _MidG1Offset;

                        float time = (_Time.y / _FadeG1Time + _TimeG1Scale * ratio);
                        fixed3 rgb = fixed3(0, 0, 0);
                        fixed3 rgbA = fixed3(0, 0, 0);
                        fixed3 rgbB = fixed3(0, 0, 0);
                        fixed3 rgbC = fixed3(0, 0, 0);
                        float val = 1;

                        if (_ColorOverrideG1 == 1) {
                            rgbA = _ColourG1StopA;
                            rgbB = _ColourG1StopB;
                            rgbC = _ColourG1StopC;
                        }
                        else {
                            if (isDMXOn && _DMXccG1Enable == 1) {
                                rgbA = getDMXColor(_DMXccG1StopA);
                                rgbC = getDMXColor(_DMXccG1StopC);
                            }
                            else {
                                rgbB = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG1StopB, 1.0, 1.0));
                                rgbA = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG1StopA, 1.0, 1.0));
                                rgbC = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG1StopC, 1.0, 1.0));                                
                            }
                        }

                        // AUDIOLINK
                        if (isALOn) {
                            if (_ALccG1 && _ColorOverrideG1 == 0 && (!isDMXOn || _DMXccG1Enable == 0)) {
                                rgbA = getALStop(rgbA, _ALccG1StopA, _ALttG1StopA);
                                rgbC = getALStop(rgbC, _ALccG1StopC, _ALttG1StopC);
                            }

                            float2 uv;
                            if (_BandG1Length == 0) {
                                uv = float2(1.0 / 256, _BandG1);
                            }
                            else {
                                if (_BandG1Reverse == 1)
                                    uv = float2(ratio * _BandG1Length, _BandG1);
                                else
                                    uv = float2((1 - ratio) * _BandG1Length, _BandG1);
                            }
                            val = tex2D(_AudioTexture, uv).x;
                        }

                        return getGradientOutput(isALOn, isDMXOn, IN.localTexcoord.x, rgb, rgbA, rgbB, rgbC, ratio, time, val, midStop, _FadingG1, _ShiftG1StopA, _ShiftG1StopB, _ShiftG1StopC, _ALccG1, _DMXccG1Enable, _DMXintG1, 5, _ColorOverrideG1, fixed3(1, 0, 0));
                    }

                    // Gradient 2
                    else if (IN.localTexcoord.x > 0.68021 && IN.localTexcoord.x < 0.7875 && IN.localTexcoord.y > 0.48672 && IN.localTexcoord.y < 0.49922) {
                        bool isALOn = isALActive();
                        bool isDMXOn = isDMXActive();

                        float ratio = (IN.localTexcoord.x - 0.68021) / 0.10729;
                        float midStop = 0.68021 + 0.10729 * _MidG2Offset;

                        float time = (_Time.y / _FadeG2Time + _TimeG2Scale * ratio);
                        fixed3 rgb = fixed3(0, 0, 0);
                        fixed3 rgbA = fixed3(0, 0, 0);
                        fixed3 rgbB = fixed3(0, 0, 0);
                        fixed3 rgbC = fixed3(0, 0, 0);
                        float val = 1;

                        if (_ColorOverrideG2 == 1) {
                            rgbA = _ColourG2StopA;
                            rgbB = _ColourG2StopB;
                            rgbC = _ColourG2StopC;
                        }
                        else {
                            if (isDMXOn && _DMXccG2Enable == 1) {
                                rgbA = getDMXColor(_DMXccG2StopA);
                                rgbC = getDMXColor(_DMXccG2StopC);
                            }
                            else {
                                rgbB = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG2StopB, 1.0, 1.0));
                                rgbA = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG2StopA, 1.0, 1.0));
                                rgbC = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG2StopC, 1.0, 1.0));
                            }
                        }

                        // AUDIOLINK
                        if (isALOn) {
                            if (_ALccG2 && _ColorOverrideG2 == 0 && (!isDMXOn || _DMXccG2Enable == 0)) {
                                rgbA = getALStop(rgbA, _ALccG2StopA, _ALttG2StopA);
                                rgbC = getALStop(rgbC, _ALccG2StopC, _ALttG2StopC);
                            }

                            float2 uv;
                            if (_BandG2Length == 0) {
                                uv = float2(1.0 / 256, _BandG2);
                            }
                            else {
                                if (_BandG2Reverse == 1)
                                    uv = float2(ratio * _BandG2Length, _BandG2);
                                else
                                    uv = float2((1 - ratio) * _BandG2Length, _BandG2);
                            }
                            val = tex2D(_AudioTexture, uv).x;
                        }

                        return getGradientOutput(isALOn, isDMXOn, IN.localTexcoord.x, rgb, rgbA, rgbB, rgbC, ratio, time, val, midStop, _FadingG2, _ShiftG2StopA, _ShiftG2StopB, _ShiftG2StopC, _ALccG2, _DMXccG2Enable, _DMXintG2, 6, _ColorOverrideG2, fixed3(0, 1, 0));
                    }

                    // Gradient 3
                    else if (IN.localTexcoord.x > 0.79063 && IN.localTexcoord.x < 0.89792 && IN.localTexcoord.y > 0.48672 && IN.localTexcoord.y < 0.49922) {
                        bool isALOn = isALActive();
                        bool isDMXOn = isDMXActive();

                        float ratio = (IN.localTexcoord.x - 0.79063) / 0.10729;
                        float midStop = 0.79063 + 0.10729 * _MidG3Offset;

                        float time = (_Time.y / _FadeG3Time + _TimeG3Scale * ratio);
                        fixed3 rgb = fixed3(0, 0, 0);
                        fixed3 rgbA = fixed3(0, 0, 0);
                        fixed3 rgbB = fixed3(0, 0, 0);
                        fixed3 rgbC = fixed3(0, 0, 0);
                        float val = 1;

                        if (_ColorOverrideG3 == 1) {
                            rgbA = _ColourG3StopA;
                            rgbB = _ColourG3StopB;
                            rgbC = _ColourG3StopC;
                        }
                        else {
                            if (isDMXOn && _DMXccG3Enable == 1) {
                                rgbA = getDMXColor(_DMXccG3StopA);
                                rgbC = getDMXColor(_DMXccG3StopC);
                            }
                            else {
                                rgbB = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG3StopB, 1.0, 1.0));
                                rgbA = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG3StopA, 1.0, 1.0));
                                rgbC = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG3StopC, 1.0, 1.0));
                            }
                        }

                        // AUDIOLINK
                        if (isALOn) {
                            if (_ALccG3 && _ColorOverrideG3 == 0 && (!isDMXOn || _DMXccG3Enable == 0)) {
                                rgbA = getALStop(rgbA, _ALccG3StopA, _ALttG3StopA);
                                rgbC = getALStop(rgbC, _ALccG3StopC, _ALttG3StopC);
                            }

                            float2 uv;
                            if (_BandG3Length == 0) {
                                uv = float2(1.0 / 256, _BandG3);
                            }
                            else {
                                if (_BandG3Reverse == 1)
                                    uv = float2(ratio * _BandG3Length, _BandG3);
                                else
                                    uv = float2((1 - ratio) * _BandG3Length, _BandG3);
                            }
                            val = tex2D(_AudioTexture, uv).x;
                        }

                        return getGradientOutput(isALOn, isDMXOn, IN.localTexcoord.x, rgb, rgbA, rgbB, rgbC, ratio, time, val, midStop, _FadingG3, _ShiftG3StopA, _ShiftG3StopB, _ShiftG3StopC, _ALccG3, _DMXccG3Enable, _DMXintG3, 7, _ColorOverrideG3, fixed3(0, 0, 1));
                    }

                    // Audio Reactive Pixel
                    if (IN.localTexcoord.x > 0.56979 && IN.localTexcoord.x < 0.58594 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.52916) {
                        bool isALOn = isALActive();

                        if (_DebugZone) {
                            float timeDebug = (_Time.y / 1.22 + 5.0);
                            float valL = min(((sin(timeDebug * 2 * 3.14159265) + 1) / 2), 1.0);
                            float valH = min(((sin(timeDebug * 8 * 3.14159265) + 1) / 2), 1.0);
                            return fixed4(valL, valH, 0, 1);
                        }

                        if (_ALOverride == 1 && _ALReactivePixel == 1) {
                            if (_ReactiveIdle == 1 && !isALOn) {
                                return fixed4(1, 1, 0, 1);                          
                            }
                            else {
                                float2 uvLows = float2(1.0 / 256, _ReactiveBandLows);
                                fixed valLows = tex2D(_AudioTexture, uvLows).x;
                                float2 uvHighs = float2(1.0 / 256, _ReactiveBandHighs);
                                fixed valHighs = tex2D(_AudioTexture, uvHighs).x;
                                return fixed4(valLows, valHighs, 0, 1);  
                            }
                        }
                        else {
                            if (_ReactiveIdle == 1)
                                return fixed4(1, 1, 0, 1);
                        }
                    }                    
                }

                return fixed4(0, 0, 0, 1);
            }
            ENDCG
        }
    }

    CustomEditor "LumaDriver_GUI"
}
