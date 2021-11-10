Shader "LumaDriver/Driver"
{
    Properties
    {
        [Enum(Main Options,0,Idle Animations,1,AudioLink,2,Color Overrides,3)] _Page("Options Page", Float) = 0

        [Header(Basic Options)]
        [Space(15)]
        [MaterialToggle] _IsEnabled("Luma Glow Enabled", Float) = 1
        [MaterialToggle] _LumaPixel("Use Original Luma Glow Pixel", Float) = 1
        [MaterialToggle] _ReactiveIdle("Audio Reactive Pixel On When Idle", Float) = 1
        [MaterialToggle] _DebugZone("Debug Zones", Float) = 0
        [Space(15)]

        [Header(Internal)]
        [Space(15)]
        [NoScaleOffset]_ALActiveTexture ("AudioLink Active CRT", 2D) = "black" {}

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
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ1("Zone 1 Audio Band", Float) = 0.0546
        [Space(10)]
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccZ2("Zone 2 Color Control", Float) = 0.2070
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ2("Zone 2 Audio Band", Float) = 0.0390
        [Space(10)]
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccZ3("Zone 3 Color Control", Float) = 0.2148
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ3("Zone 3 Audio Band", Float) = 0.0078
        [Space(10)]
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccZ4("Zone 4 Color Control", Float) = 0.2227
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ4("Zone 4 Audio Band", Float) = 0.0234
        [Space(15)]

        [Header(AudioLink Gradients)]
        [Space(15)]
        [MaterialToggle] _ALccG1("Enable Gradient 1 Color Control", Float) = 1
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG1StopA("Gradient 1 Stop A Color Control", Float) = 0.1992
        [Enum(Idle Animations Color,0,Blend Stops A and C,0.5,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG1StopB("Gradient 1 Stop B Color Control", Float) = 0.5
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG1StopC("Gradient 1 Stop C Color Control", Float) = 0.2148
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandG1("Gradient 1 Audio Band", Float) = 0.0078
        [MaterialToggle] _BandG1Reverse("Reverse Gradient 1 Audio", Float) = 0
        _BandG1Length ("Gradient 1 Audio Length", Range(0, 1)) = 0.2
        [Space(10)]
        [MaterialToggle] _ALccG2("Enable Gradient 2 Color Control", Float) = 1
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG2StopA("Gradient 2 Stop A Color Control", Float) = 0.2070
        [Enum(Idle Animations Color,0,Blend Stops A and C,0.5,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG2StopB("Gradient 2 Stop B Color Control", Float) = 0.5
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG2StopC("Gradient 2 Stop C Color Control", Float) = 0.2227
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandG2("Gradient 2 Audio Band", Float) = 0.0546
        [MaterialToggle] _BandG2Reverse("Reverse Gradient 2 Audio", Float) = 0
        _BandG2Length ("Gradient 2 Audio Length", Range(0, 1)) = 0.2
        [Space(10)]
        [MaterialToggle] _ALccG3("Enable Gradient 3 Color Control", Float) = 0
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG3StopA("Gradient 3 Stop A Color Control", Float) = 0
        [Enum(Idle Animations Color,0,Blend Stops A and C,0.5,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG3StopB("Gradient 3 Stop B Color Control", Float) = 0
        [Enum(Idle Animations Color,0,ColorChord 1,0.1992,ColorChord 2,0.2070,ColorChord 3,0.2148,ColorChord 4,0.2227)] _ALccG3StopC("Gradient 3 Stop C Color Control", Float) = 0
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

            uniform sampler2D _ALActiveTexture;

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
            float _ALReactivePixel;
            float _ReactiveBandLows;
            float _ReactiveBandHighs;

            float _ALccZ1;
            float _BandZ1;
            float _ALccZ2;
            float _BandZ2;
            float _ALccZ3;
            float _BandZ3;
            float _ALccZ4;
            float _BandZ4;

            float _ALccG1;
            float _ALccG1StopA;
            float _ALccG1StopB;
            float _ALccG1StopC;
            float _BandG1;
            float _BandG1Reverse;
            float _BandG1Length;

            float _ALccG2;
            float _ALccG2StopA;
            float _ALccG2StopB;
            float _ALccG2StopC;
            float _BandG2;
            float _BandG2Reverse;
            float _BandG2Length;

            float _ALccG3;
            float _ALccG3StopA;
            float _ALccG3StopB;
            float _ALccG3StopC;
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

            uniform sampler2D _AudioTexture;

            fixed3 HSVToRGB(float3 c) {
                float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
                float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
                return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
            }

            fixed3 maximize(fixed3 c) {
                fixed maxVal = c.x;
                int useC = 0;
                if (c.y > maxVal) {
                    maxVal = c.y;
                    useC = 1;
                }
                if (c.z > maxVal) {
                    maxVal = c.z;
                    useC = 2;
                }
                if (c.x == 0 && c.y == 0 && c.z == 0)
                    useC = 3;
                if (useC == 0)
                    return fixed3(1.0, c.y / c.x, c.z / c.x);
                else if (useC == 1)
                    return fixed3(c.x / c.y, 1.0, c.z / c.y);
                else if (useC == 2)
                    return fixed3(c.x / c.z, c.y / c.z, 1.0);
                else if (useC == 3)
                    return fixed3(1.0, 1.0, 1.0);
                else
                    return fixed3(c.x, c.y, c.z);
            }

            fixed isALActive() {
                if (_ALOverride == 1) {
                    if (_ALAutomatic == 1) {
                        if (tex2D(_ALActiveTexture, float2(0.5, 0.5)).r > 0)
                            return 1;
                        else
                            return 0;
                    }
                    return 1;
                }
                else {
                    return 0;
                }
            }

            fixed3 getALStop(fixed3 rgb, float ccStop) {
                if (ccStop != 0) {
                    rgb = tex2D(_AudioTexture, float2(ccStop, 0.3516));
                    rgb = maximize(rgb);
                }
                return rgb;
            }

            fixed3 getALStopMid(fixed3 rgb, float ccStop, float ccStopA, float ccStopB) {
                if (ccStop != 0) {
                    if (ccStop == 0.5) {
                        fixed3 ccA = tex2D(_AudioTexture, float2(ccStopA, 0.3516));
                        //ccA = maximize(ccA);
                        fixed3 ccB = tex2D(_AudioTexture, float2(ccStopB, 0.3516));
                        //ccB = maximize(ccB);
                        rgb = (ccA/2 + ccB/2);
                    }
                    else {
                        rgb = tex2D(_AudioTexture, float2(ccStop, 0.3516));
                    }
                    rgb = maximize(rgb);
                }
                return rgb;
            }

            fixed4 getGradientOutput(float x, fixed3 rgb, fixed3 rgbA, fixed3 rgbB, fixed3 rgbC, float ratio, float time, float val, float midStop, float fading, float3 debug) {
                if (_DebugZone == 1) {
                    float timeDebug = (_Time.y / 1.22 + 5.0 * ratio);
                    return fixed4(debug.x, debug.y, debug.z, 1) * min(((sin(timeDebug * 2 * 3.14159265) + 1) / 2), 1.0);
                }

                if (x < midStop)
                    rgb = rgbA * (0.5 - ratio) * 2 + rgbB * ratio * 2;
                else
                    rgb = rgbB * (1.0 - ratio) * 2 + rgbC * (ratio - 0.5) * 2;

                if (isALActive()) {
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

                    // Original Luma Control Pixel
                    if (_LumaPixel == 1 && IN.localTexcoord.x > 0.625 && IN.localTexcoord.x <= 0.633307 && IN.localTexcoord.y > 0.50423 && IN.localTexcoord.y < 0.51834) {
                        return fixed4(1, 0, 0, 1);
                    }

                    // Luma Zone Pixels
                    else if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.52916) {

                        float time = _Time.y * 2 * 3.14159265;
                        fixed3 rgb = fixed3(0, 0, 0);
                        fixed3 rgbcc = fixed3(0, 0, 0);
                        float val = 0;

                        // ZONE 1 - Upper Left
                        if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.8599 && IN.localTexcoord.y > 0.51411 && IN.localTexcoord.y < 0.52916) {
                            if (_DebugZone == 1)
                                return fixed4(1, 0, 0, 1);

                            if (_ColorOverrideZ1 == 1) {
                                return fixed4(_ColourZ1, 1);
                            }
                            else {
                                if (isALActive()) {
                                    float2 uv = float2(0.0039, _BandZ1);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALccZ1 != 0) {
                                        rgb = tex2D(_AudioTexture, float2(_ALccZ1, 0.3516));
                                        rgb = maximize(rgb);
                                    }
                                }
                                else {
                                    float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ1, 1.0, 1.0);
                                    rgb = HSVToRGB(hsv);
                                }
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
                                if (isALActive()) {
                                    float2 uv = float2(0.0039, _BandZ2);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALccZ2 != 0) {
                                        rgb = tex2D(_AudioTexture, float2(_ALccZ2, 0.3516));
                                        rgb = maximize(rgb);
                                    }
                                }
                                else {
                                    float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ2, 1.0, 1.0);
                                    rgb = HSVToRGB(hsv);
                                }
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
                                if (isALActive()) {
                                    float2 uv = float2(0.0039, _BandZ3);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALccZ3 != 0) {
                                        rgb = tex2D(_AudioTexture, float2(_ALccZ3, 0.3516));
                                        rgb = maximize(rgb);
                                    }
                                }
                                else {
                                    float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ3, 1.0, 1.0);
                                    rgb = HSVToRGB(hsv);
                                }
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
                                if (isALActive()) {
                                    float2 uv = float2(0.0039, _BandZ4);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALccZ4 != 0) {
                                        rgb = tex2D(_AudioTexture, float2(_ALccZ4, 0.3516));
                                        rgb = maximize(rgb);
                                    }
                                }
                                else {
                                    float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ4, 1.0, 1.0);
                                    rgb = HSVToRGB(hsv);
                                }
                            }
                        }

                        if (isALActive())
                            return fixed4(rgb.x, rgb.y, rgb.z, 1) * max(val, _MinimumBrightness);
                        else
                            return fixed4(rgb.x, rgb.y, rgb.z, 1) * min(((sin(time / _PulseSpeed) + 1) / 2) + _MinimumBrightness, 1.0);
                    }

                    // Gradient 1
                    else if (IN.localTexcoord.x > 0.56979 && IN.localTexcoord.x < 0.67708 && IN.localTexcoord.y > 0.48672 && IN.localTexcoord.y < 0.49922) {
                        float ratio = (IN.localTexcoord.x - 0.56979) / 0.10729;
                        float midStop = 0.56979 + 0.10729 * _MidG1Offset;

                        float time = (_Time.y / _FadeG1Time + _TimeG1Scale * ratio);
                        fixed3 rgb = fixed3(0, 0, 0);
                        fixed3 rgbA = fixed3(0, 0, 0);
                        fixed3 rgbB = fixed3(0, 0, 0);
                        fixed3 rgbC = fixed3(0, 0, 0);
                        float val = 0;

                        if (_ColorOverrideG1 == 1) {
                            rgbA = _ColourG1StopA;
                            rgbB = _ColourG1StopB;
                            rgbC = _ColourG1StopC;
                        }
                        else {
                            rgbB = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG1StopB, 1.0, 1.0));
                            rgbA = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG1StopA, 1.0, 1.0));
                            rgbC = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG1StopC, 1.0, 1.0));
                        }

                        // AUDIOLINK
                        if (isALActive()) {
                            if (_ALccG1 && _ColorOverrideG1 == 0) {
                                rgbA = getALStop(rgbA, _ALccG1StopA);
                                rgbB = getALStopMid(rgbB, _ALccG1StopB, _ALccG1StopA, _ALccG1StopC);
                                rgbC = getALStop(rgbC, _ALccG1StopC);
                            }

                            float2 uv;
                            if (_BandG1Length == 0) {
                                uv = float2(0.0039, _BandG1);
                            }
                            else {
                                if (_BandG1Reverse == 1)
                                    uv = float2(ratio * _BandG1Length, _BandG1);
                                else
                                    uv = float2((1 - ratio) * _BandG1Length, _BandG1);
                            }
                            val = tex2D(_AudioTexture, uv).x;
                        }

                        return getGradientOutput(IN.localTexcoord.x, rgb, rgbA, rgbB, rgbC, ratio, time, val, midStop, _FadingG1, fixed3(1, 0, 0));
                    }

                    // Gradient 2
                    else if (IN.localTexcoord.x > 0.68021 && IN.localTexcoord.x < 0.7875 && IN.localTexcoord.y > 0.48672 && IN.localTexcoord.y < 0.49922) {
                        float ratio = (IN.localTexcoord.x - 0.68021) / 0.10729;
                        float midStop = 0.68021 + 0.10729 * _MidG2Offset;

                        float time = (_Time.y / _FadeG2Time + _TimeG2Scale * ratio);
                        fixed3 rgb = fixed3(0, 0, 0);
                        fixed3 rgbA = fixed3(0, 0, 0);
                        fixed3 rgbB = fixed3(0, 0, 0);
                        fixed3 rgbC = fixed3(0, 0, 0);
                        float val = 0;

                        if (_ColorOverrideG2 == 1) {
                            rgbA = _ColourG2StopA;
                            rgbB = _ColourG2StopB;
                            rgbC = _ColourG2StopC;
                        }
                        else {
                            rgbB = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG2StopB, 1.0, 1.0));
                            rgbA = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG2StopA, 1.0, 1.0));
                            rgbC = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG2StopC, 1.0, 1.0));
                        }

                        // AUDIOLINK
                        if (isALActive()) {
                            if (_ALccG2 && _ColorOverrideG2 == 0) {
                                rgbA = getALStop(rgbA, _ALccG2StopA);
                                rgbB = getALStopMid(rgbB, _ALccG2StopB, _ALccG2StopA, _ALccG2StopC);
                                rgbC = getALStop(rgbC, _ALccG2StopC);
                            }

                            float2 uv;
                            if (_BandG2Length == 0) {
                                uv = float2(0.0039, _BandG2);
                            }
                            else {
                                if (_BandG2Reverse == 1)
                                    uv = float2(ratio * _BandG2Length, _BandG2);
                                else
                                    uv = float2((1 - ratio) * _BandG2Length, _BandG2);
                            }
                            val = tex2D(_AudioTexture, uv).x;
                        }

                        return getGradientOutput(IN.localTexcoord.x, rgb, rgbA, rgbB, rgbC, ratio, time, val, midStop, _FadingG2, fixed3(0, 1, 0));
                    }

                    // Gradient 3
                    else if (IN.localTexcoord.x > 0.79063 && IN.localTexcoord.x < 0.89792 && IN.localTexcoord.y > 0.48672 && IN.localTexcoord.y < 0.49922) {
                        float ratio = (IN.localTexcoord.x - 0.79063) / 0.10729;
                        float midStop = 0.79063 + 0.10729 * _MidG3Offset;

                        float time = (_Time.y / _FadeG3Time + _TimeG3Scale * ratio);
                        fixed3 rgb = fixed3(0, 0, 0);
                        fixed3 rgbA = fixed3(0, 0, 0);
                        fixed3 rgbB = fixed3(0, 0, 0);
                        fixed3 rgbC = fixed3(0, 0, 0);
                        float val = 0;

                        if (_ColorOverrideG3 == 1) {
                            rgbA = _ColourG3StopA;
                            rgbB = _ColourG3StopB;
                            rgbC = _ColourG3StopC;
                        }
                        else {
                            rgbB = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG3StopB, 1.0, 1.0));
                            rgbA = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG3StopA, 1.0, 1.0));
                            rgbC = HSVToRGB(float3(_Time.y / _RGBSpeed + _ShiftG3StopC, 1.0, 1.0));
                        }

                        // AUDIOLINK
                        if (isALActive()) {
                            if (_ALccG3 && _ColorOverrideG3 == 0) {
                                rgbA = getALStop(rgbA, _ALccG3StopA);
                                rgbB = getALStopMid(rgbB, _ALccG3StopB, _ALccG3StopA, _ALccG3StopC);
                                rgbC = getALStop(rgbC, _ALccG3StopC);
                            }

                            float2 uv;
                            if (_BandG3Length == 0) {
                                uv = float2(0.0039, _BandG3);
                            }
                            else {
                                if (_BandG3Reverse == 1)
                                    uv = float2(ratio * _BandG3Length, _BandG3);
                                else
                                    uv = float2((1 - ratio) * _BandG3Length, _BandG3);
                            }
                            val = tex2D(_AudioTexture, uv).x;
                        }

                        return getGradientOutput(IN.localTexcoord.x, rgb, rgbA, rgbB, rgbC, ratio, time, val, midStop, _FadingG3, fixed3(0, 0, 1));
                    }

                    // Audio Reactive Pixel
                    if (IN.localTexcoord.x > 0.56979 && IN.localTexcoord.x < 0.58594 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.52916) {
                        if (_DebugZone) {
                            float timeDebug = (_Time.y / 1.22 + 5.0);
                            float valL = min(((sin(timeDebug * 2 * 3.14159265) + 1) / 2), 1.0);
                            float valH = min(((sin(timeDebug * 8 * 3.14159265) + 1) / 2), 1.0);
                            return fixed4(valL, valH, 0, 1);
                        }

                        if (_ALOverride == 1 && _ALReactivePixel == 1) {
                            if (_ReactiveIdle == 1 && !isALActive()) {
                                return fixed4(1, 1, 0, 1);                          
                            }
                            else {
                                float2 uvLows = float2(0.0039, _ReactiveBandLows);
                                fixed valLows = tex2D(_AudioTexture, uvLows).x;
                                float2 uvHighs = float2(0.0039, _ReactiveBandHighs);
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
