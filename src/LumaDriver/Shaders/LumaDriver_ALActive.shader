Shader "LumaDriver/Reactivity"
{
    Properties
    {
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

            uniform sampler2D _AudioTexture;

            float4 frag(v2f_customrendertexture IN) : COLOR {
                if (IN.localTexcoord.x <= 0.03125 && IN.localTexcoord.y < 0.03125) {
                    fixed isOn = 0;
                    [unroll] for (int i = 4; i < 6; i++) {
                        [unroll] for (int j = 0; j < 128; j++) {
                            isOn = max(isOn, tex2D(_AudioTexture, float2(0.0039 + 0.0078125 * j, 0.0078 + 0.0152 * i)).xxx);
                        }
                    }
                    if (isOn > 0) {
                        return fixed4(1, 0, 0, 1);
                    }
                    else {
                        return fixed4(0, 0, 0, 1);
                    }
                }
                else {
                    return fixed4(0, 0, 0, 1);
                }
            }
            ENDCG
        }
    }
}
