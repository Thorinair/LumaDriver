Shader "LumaDriver/Driver"
{
    Properties
    {
        [MaterialToggle] _IsEnabled("Luma Glow Enabled", Float) = 1
        _MinimumBrightness ("Minimum Brightness", Range(0, 1)) = 0.005
        _PulseSpeed ("Pulse Speed", Float) = 6.1
        _RGBSpeed ("RGB Speed", Float) = 10

        _ShiftZ1 ("Zone 1 Color Shift", Range(0, 1)) = 0.00
        _ShiftZ2 ("Zone 2 Color Shift", Range(0, 1)) = 0.025
        _ShiftZ3 ("Zone 3 Color Shift", Range(0, 1)) = 0.025
        _ShiftZ4 ("Zone 4 Color Shift", Range(0, 1)) = 0.05

        [Header(Color Override)] [MaterialToggle] _ColorOverrideZ1("Zone 1 Enable", Float) = 0
        [MaterialToggle] _ColorOverrideZ2("Zone 2 Enable", Float) = 0
        [MaterialToggle] _ColorOverrideZ3("Zone 3 Enable", Float) = 0
        [MaterialToggle] _ColorOverrideZ4("Zone 4 Enable", Float) = 0
        _ColourZ1 ("Zone 1 Color Override", Color) = (1, 0, 0)
        _ColourZ2 ("Zone 2 Color Override", Color) = (0, 1, 0)
        _ColourZ3 ("Zone 3 Color Override", Color) = (0, 0, 1)
        _ColourZ4 ("Zone 4 Color Override", Color) = (1, 1, 0)
        
        [Header(AudioLink Integration)] [MaterialToggle] _ALOverride("Enabled", Float) = 0
        [MaterialToggle] _ALAutomatic("Automatic Switchover", Float) = 1
        [Enum(Passive,0,Color From Chords (Start),0.0039,Color From Chords (End),0.9961)] _ALccZ1("Zone 1 Color Control", Float) = 0.9961
        [Enum(Passive,0,Color From Chords (Start),0.0039,Color From Chords (End),0.9961)] _ALccZ2("Zone 2 Color Control", Float) = 0.9961
        [Enum(Passive,0,Color From Chords (Start),0.0039,Color From Chords (End),0.9961)] _ALccZ3("Zone 3 Color Control", Float) = 0.0039
        [Enum(Passive,0,Color From Chords (Start),0.0039,Color From Chords (End),0.9961)] _ALccZ4("Zone 4 Color Control", Float) = 0.0039
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ1("Zone 1 Audio Band", Float) = 0.0546
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ2("Zone 2 Audio Band", Float) = 0.0390
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ3("Zone 3 Audio Band", Float) = 0.0078
        [Enum(Bass,0.0078,Low Mids,0.0234,High Mids,0.0390,Treble,0.0546)] _BandZ4("Zone 4 Audio Band", Float) = 0.0234

        [Header(Debug)] [MaterialToggle] _DebugZone("Debug Zones", Float) = 0
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
            float _MinimumBrightness;
            float _PulseSpeed;
            float _RGBSpeed;

            float _ShiftZ1;
            float _ShiftZ2;
            float _ShiftZ3;
            float _ShiftZ4;

            float _ColorOverrideZ1;
            float _ColorOverrideZ2;
            float _ColorOverrideZ3;
            float _ColorOverrideZ4;

            float3 _ColourZ1;
            float3 _ColourZ2;
            float3 _ColourZ3;
            float3 _ColourZ4;

            float _ALOverride;
            float _ALAutomatic;

            float _ALccZ1;
            float _ALccZ2;
            float _ALccZ3;
            float _ALccZ4;

            float _BandZ1;
            float _BandZ2;
            float _BandZ3;
            float _BandZ4;

            float _DebugZone;

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
                if (useC == 0)
                    return fixed3(1.0, c.y / c.x, c.z / c.x);
                else if (useC == 1)
                    return fixed3(c.x / c.y, 1.0, c.z / c.y);
                else if (useC == 2)
                    return fixed3(c.x / c.z, c.y / c.z, 1.0);
                else
                    return fixed3(c.x, c.y, c.z);
            }

            float4 frag(v2f_customrendertexture IN) : COLOR {
                if (_IsEnabled == 1) {

                    if (_DebugZone == 1) {
                        // ZONE 1 - Upper Left
                        if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.8599 && IN.localTexcoord.y > 0.51411 && IN.localTexcoord.y < 0.52916)
                            return fixed4(1, 0, 0, 1);
                        // ZONE 2 - Lower Left
                        else if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.8599 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.51411)
                            return fixed4(0, 1, 0, 1);
                        // ZONE 3 - Upper Right
                        else if (IN.localTexcoord.x > 0.8599 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.51411 && IN.localTexcoord.y < 0.52916)
                            return fixed4(0, 0, 1, 1);
                        // ZONE 4 - Lower Right
                        else if (IN.localTexcoord.x > 0.8599 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.51411)
                            return fixed4(1, 1, 0, 1);
                    }

                    // Control Pixel
                    if (IN.localTexcoord.x > 0.625 && IN.localTexcoord.x <= 0.633307 && IN.localTexcoord.y > 0.50423 && IN.localTexcoord.y < 0.51834) {
                        return fixed4(1, 0, 0, 1);
                    }

                    else if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.52916) {
                        float time = _Time.y * 2 * 3.14159265;
                        fixed3 rgb = fixed3(0, 0, 0);
                        fixed3 rgbcc = fixed3(0, 0, 0);

                        // ZONE 1 - Upper Left
                        if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.8599 && IN.localTexcoord.y > 0.51411 && IN.localTexcoord.y < 0.52916) {
                            if (_ColorOverrideZ1 == 1) {
                                rgb = _ColourZ1;
                            }
                            else {
                                float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ1, 1.0, 1.0);
                                rgb = HSVToRGB(hsv);
                            }
                        }

                        // ZONE 2 - Lower Left
                        else if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.8599 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.51411) {
                            if (_ColorOverrideZ2 == 1) {
                                rgb = _ColourZ2;
                            }
                            else {
                                float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ2, 1.0, 1.0);
                                rgb = HSVToRGB(hsv);
                            }
                        }

                        // ZONE 3 - Upper Right
                        else if (IN.localTexcoord.x > 0.8599 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.51411 && IN.localTexcoord.y < 0.52916) {
                            if (_ColorOverrideZ3 == 1) {
                                rgb = _ColourZ3;
                            }
                            else {
                                float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ3, 1.0, 1.0);
                                rgb = HSVToRGB(hsv);
                            }
                        }

                        // ZONE 4 - Lower Right
                        else if (IN.localTexcoord.x > 0.8599 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.51411) {
                            if (_ColorOverrideZ4 == 1) {
                                rgb = _ColourZ4;
                            }
                            else {
                                float3 hsv = float3(_Time.y / _RGBSpeed + _ShiftZ4, 1.0, 1.0);
                                rgb = HSVToRGB(hsv);
                            }
                        }

                        // AUDIOLINK
                        if (_ALOverride == 0) {
                            return fixed4(rgb.x, rgb.y, rgb.z, 1) * min(((sin(time / _PulseSpeed) + 1) / 2) + _MinimumBrightness, 1.0);
                        }
                        else {
                            fixed isOn = 0;
                            if (_ALAutomatic == 1) {
                                [unroll] for (int i = 4; i < 6; i++) {
                                    [unroll] for (int j = 0; j < 128; j++) {
                                        isOn = max(isOn, tex2D(_AudioTexture, float2(0.0039 + 0.0078125 * j, 0.0078 + 0.0152 * i)).xxx);
                                    }
                                } 
                            }
                            if (isOn > 0) {
                                float val = 0;

                                // ZONE 1 - Upper Left
                                if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.8599 && IN.localTexcoord.y > 0.51411 && IN.localTexcoord.y < 0.52916) {
                                    float2 uv = float2(0.0039, _BandZ1);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALccZ1 != 0) {
                                        rgb = tex2D(_AudioTexture, float2(_ALccZ1, 0.3726));
                                        rgb = maximize(rgb);
                                    }
                                }

                                // ZONE 2 - Lower Left
                                else if (IN.localTexcoord.x > 0.85182 && IN.localTexcoord.x < 0.8599 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.51411) {
                                    float2 uv = float2(0.0039, _BandZ2);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALccZ2 != 0) {
                                        rgb = tex2D(_AudioTexture, float2(_ALccZ2, 0.3726));
                                        rgb = maximize(rgb);
                                    }
                                }

                                // ZONE 3 - Upper Right
                                else if (IN.localTexcoord.x > 0.8599 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.51411 && IN.localTexcoord.y < 0.52916) {
                                    float2 uv = float2(0.0039, _BandZ3);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALccZ3 != 0) {
                                        rgb = tex2D(_AudioTexture, float2(_ALccZ3, 0.3726));
                                        rgb = maximize(rgb);
                                    }
                                }

                                // ZONE 4 - Lower Right
                                else if (IN.localTexcoord.x > 0.8599 && IN.localTexcoord.x < 0.86823 && IN.localTexcoord.y > 0.5 && IN.localTexcoord.y < 0.51411) {
                                    float2 uv = float2(0.0039, _BandZ4);
                                    val = tex2D(_AudioTexture, uv).x;
                                    if (_ALccZ4 != 0) {
                                        rgb = tex2D(_AudioTexture, float2(_ALccZ4, 0.3726));
                                        rgb = maximize(rgb);
                                    }
                                }
                                return fixed4(rgb.x, rgb.y, rgb.z, 1) * max(val, _MinimumBrightness);
                            }
                            else {
                                return fixed4(rgb.x, rgb.y, rgb.z, 1) * min(((sin(time / _PulseSpeed) + 1) / 2) + _MinimumBrightness, 1.0);
                            }
                        }
                    }
                }
                return fixed4(0, 0, 0, 1);
            }
            ENDCG
        }
    }
}
