﻿Shader "LumaDriver/GrabPass"
{
    Properties
    {
        //_MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        GrabPass {"_Stored"}
        Pass {
        CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            float4 vert (float4 v: POSITION) : SV_Position { return 1; }
            float4 frag (float4 f: SV_Position) : SV_Target { return 1; }
        ENDCG
        }
    }
}
