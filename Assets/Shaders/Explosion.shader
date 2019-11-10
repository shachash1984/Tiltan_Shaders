Shader "Custom/Explosion" {
	Properties{
		_MainTex("Texture", 2D) = "white" {}
		_BumpMap("Bumpmap", 2D) = "bump" {}
		_Amount("Extrusion Amount", Range(-1,1)) = 0.5
	}
		SubShader{
		Tags{ "RenderType" = "Opaque" }
		Cull Off
		CGPROGRAM
#pragma surface surf Lambert vertex:vert
		struct Input {
		float2 uv_MainTex;
		float2 uv_BumpMap;
		float3 worldPos;
	};
		float _Amount;
		void vert(inout appdata_full v) {
			v.vertex.xyz += v.normal * _Time.y * 5;
			
		}
		sampler2D _MainTex;
		sampler2D _BumpMap;
		void surf(Input IN, inout SurfaceOutput o) {
		//clip(frac((IN.worldPos.y + IN.worldPos.z*0.1) * 5) - 0.5);
		clip(frac((IN.worldPos.y + IN.worldPos.y*_Time.y) * 1.5) - _Time.y);
		//clip(frac((IN.worldPos.x + IN.worldPos.z*0.1) * 5) - 0.5);
		clip(frac((IN.worldPos.x + IN.worldPos.x*(-_Time.x)) * 1.5) - _Time.y);
			
		o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
	}
	ENDCG
	}
		Fallback "Diffuse"
}
