Shader "Custom/Whitey" {
	Properties{
		_Albedo("Albedo", Color) = (1,1,1)
		_Normal("Normal", Color) = (1,1,1)
		_Emission("Emission", Color) = (1,1,1)
		_Specular("Specular", Range(0,1)) = 0.0
		_Gloss("Gloss", Range(0,1)) = 0.0
		_Alpha("Alpha", Range(0,1)) = 0.0
	}
	
	SubShader{
		Tags{ "RenderType"="Opaque" }
		
		CGPROGRAM
#pragma surface surf Lambert
		struct Input {
		float4 color : COLOR;
	};

	fixed3 _Albedo;
	fixed3 _Normal;
	fixed3 _Emission;
	half _Specular;
	fixed _Gloss;
	fixed _Alpha;
	void surf(Input IN, inout SurfaceOutput o) {
		fixed3 c = _Albedo;
		fixed3 n = _Normal;
		fixed3 e = _Emission;
		half s = _Specular;
		fixed g = _Gloss;
		fixed a = _Alpha;
		o.Albedo = c.rgb;
		o.Normal = n.rgb;
		o.Emission = e.rgb;
		o.Specular = s;
		o.Gloss = g;
		o.Alpha = a;
	}
	ENDCG
	}
	Fallback "Diffuse"
}
