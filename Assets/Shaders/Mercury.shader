Shader "Custom/Mercury" {
	Properties {
		_MainTex ("Texture", 2D) = "white"{}
		_Cube ("CubeMap", CUBE)= "" {}
		_Amount("Amount", Range(-5,5)) = 0.0

	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		//LOD 200

		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Lambert

		struct Input {
			float2 uv_MainTex;
			float3 worldRefl;
		};

		sampler2D _MainTex;
		samplerCUBE _Cube;
		float _Amount;

		void surf(Input IN, inout SurfaceOutput o) {
			float a = _Amount;
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * a;
			o.Emission = texCUBE(_Cube, IN.worldRefl).rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
