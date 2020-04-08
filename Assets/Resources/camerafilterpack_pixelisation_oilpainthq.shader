Shader "CameraFilterPack/Pixelisation_OilPaintHQ" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0, 5)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 51268
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL3x
					#ifdef VERTEX
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#ifdef GL_ARB_shader_bit_encoding
					#extension GL_ARB_shader_bit_encoding : enable
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#ifdef GL_ARB_shader_bit_encoding
					#extension GL_ARB_shader_bit_encoding : enable
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec4 u_xlat10_9;
					vec4 u_xlat10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec4 u_xlat10_11;
					vec4 u_xlat12;
					vec4 u_xlat10_12;
					vec4 u_xlat13;
					vec4 u_xlat10_13;
					vec4 u_xlat14;
					vec4 u_xlat10_14;
					vec4 u_xlat15;
					vec4 u_xlat10_15;
					vec4 u_xlat16;
					vec4 u_xlat10_16;
					vec4 u_xlat17;
					vec4 u_xlat10_17;
					vec4 u_xlat18;
					vec4 u_xlat10_18;
					vec4 u_xlat19;
					vec4 u_xlat10_19;
					vec4 u_xlat20;
					vec4 u_xlat10_20;
					vec4 u_xlat21;
					vec4 u_xlat10_21;
					vec4 u_xlat22;
					vec4 u_xlat10_22;
					vec3 u_xlat23;
					vec3 u_xlat16_23;
					vec4 u_xlat10_23;
					vec3 u_xlat16_24;
					float u_xlat26;
					bool u_xlatb26;
					vec2 u_xlat50;
					float u_xlat76;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
					    u_xlat50.xy = vec2(_Value) / _ScreenResolution.xy;
					    u_xlat3 = u_xlat50.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat10_4.xyz;
					    u_xlat5 = u_xlat50.xyxy * vec4(2.0, 0.0, -1.0, -4.0) + u_xlat0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_2.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_6.xyz;
					    u_xlat6 = u_xlat50.xyxy * vec4(3.0, 0.0, 0.0, -4.0) + u_xlat0.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_2.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_7.xyz;
					    u_xlat7 = u_xlat50.xyxy * vec4(4.0, 0.0, -4.0, -3.0) + u_xlat0.xyxy;
					    u_xlat10_8 = texture(_MainTex, u_xlat7.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat7.zw);
					    u_xlat16_2.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_8.xyz;
					    u_xlat8 = u_xlat50.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + u_xlat0.xyxy;
					    u_xlat10_9 = texture(_MainTex, u_xlat8.xy);
					    u_xlat10_8 = texture(_MainTex, u_xlat8.zw);
					    u_xlat16_2.xyz = u_xlat10_9.xyz * u_xlat10_9.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_9.xyz;
					    u_xlat9.xy = u_xlat50.xy + u_xlat0.xy;
					    u_xlat10_9 = texture(_MainTex, u_xlat9.xy);
					    u_xlat16_2.xyz = u_xlat10_9.xyz * u_xlat10_9.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_9.xyz;
					    u_xlat9 = u_xlat50.xyxy * vec4(2.0, 1.0, -1.0, -3.0) + u_xlat0.xyxy;
					    u_xlat10_10 = texture(_MainTex, u_xlat9.xy);
					    u_xlat10_9 = texture(_MainTex, u_xlat9.zw);
					    u_xlat16_2.xyz = u_xlat10_10.xyz * u_xlat10_10.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_10.xyz;
					    u_xlat10 = u_xlat50.xyxy * vec4(3.0, 1.0, 0.0, -3.0) + u_xlat0.xyxy;
					    u_xlat10_11 = texture(_MainTex, u_xlat10.xy);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.zw);
					    u_xlat16_2.xyz = u_xlat10_11.xyz * u_xlat10_11.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_11.xyz;
					    u_xlat11 = u_xlat50.xyxy * vec4(4.0, 1.0, -4.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_12 = texture(_MainTex, u_xlat11.xy);
					    u_xlat10_11 = texture(_MainTex, u_xlat11.zw);
					    u_xlat16_2.xyz = u_xlat10_12.xyz * u_xlat10_12.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_12.xyz;
					    u_xlat12 = u_xlat50.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_13 = texture(_MainTex, u_xlat12.xy);
					    u_xlat10_12 = texture(_MainTex, u_xlat12.zw);
					    u_xlat16_2.xyz = u_xlat10_13.xyz * u_xlat10_13.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_13.xyz;
					    u_xlat13 = u_xlat50.xyxy * vec4(1.0, 2.0, -1.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_14 = texture(_MainTex, u_xlat13.xy);
					    u_xlat10_13 = texture(_MainTex, u_xlat13.zw);
					    u_xlat16_2.xyz = u_xlat10_14.xyz * u_xlat10_14.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_14.xyz;
					    u_xlat14.xy = u_xlat50.xy * vec2(2.0, 2.0) + u_xlat0.xy;
					    u_xlat10_14 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_2.xyz = u_xlat10_14.xyz * u_xlat10_14.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_14.xyz;
					    u_xlat14 = u_xlat50.xyxy * vec4(3.0, 2.0, 0.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_15 = texture(_MainTex, u_xlat14.xy);
					    u_xlat10_14 = texture(_MainTex, u_xlat14.zw);
					    u_xlat16_2.xyz = u_xlat10_15.xyz * u_xlat10_15.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_15.xyz;
					    u_xlat15 = u_xlat50.xyxy * vec4(4.0, 2.0, -4.0, -1.0) + u_xlat0.xyxy;
					    u_xlat10_16 = texture(_MainTex, u_xlat15.xy);
					    u_xlat10_15 = texture(_MainTex, u_xlat15.zw);
					    u_xlat16_2.xyz = u_xlat10_16.xyz * u_xlat10_16.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_16.xyz;
					    u_xlat16 = u_xlat50.xyxy * vec4(0.0, 3.0, -3.0, -1.0) + u_xlat0.xyxy;
					    u_xlat10_17 = texture(_MainTex, u_xlat16.xy);
					    u_xlat10_16 = texture(_MainTex, u_xlat16.zw);
					    u_xlat16_2.xyz = u_xlat10_17.xyz * u_xlat10_17.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_17.xyz;
					    u_xlat17 = u_xlat50.xyxy * vec4(1.0, 3.0, -2.0, -1.0) + u_xlat0.xyxy;
					    u_xlat10_18 = texture(_MainTex, u_xlat17.xy);
					    u_xlat10_17 = texture(_MainTex, u_xlat17.zw);
					    u_xlat16_2.xyz = u_xlat10_18.xyz * u_xlat10_18.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_18.xyz;
					    u_xlat18 = u_xlat50.xyxy * vec4(2.0, 3.0, 3.0, 3.0) + u_xlat0.xyxy;
					    u_xlat10_19 = texture(_MainTex, u_xlat18.xy);
					    u_xlat10_18 = texture(_MainTex, u_xlat18.zw);
					    u_xlat16_2.xyz = u_xlat10_19.xyz * u_xlat10_19.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_19.xyz;
					    u_xlat16_4.xyz = u_xlat10_18.xyz + u_xlat16_4.xyz;
					    u_xlat16_2.xyz = u_xlat10_18.xyz * u_xlat10_18.xyz + u_xlat16_2.xyz;
					    u_xlat18 = u_xlat50.xyxy * vec4(0.0, -1.0, 4.0, 3.0) + u_xlat0.xyxy;
					    u_xlat10_19 = texture(_MainTex, u_xlat18.zw);
					    u_xlat10_18 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_2.xyz = u_xlat10_19.xyz * u_xlat10_19.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_19.xyz;
					    u_xlat19 = u_xlat50.xyxy * vec4(-4.0, 0.0, 0.0, 4.0) + u_xlat0.xyxy;
					    u_xlat10_20 = texture(_MainTex, u_xlat19.zw);
					    u_xlat10_19 = texture(_MainTex, u_xlat19.xy);
					    u_xlat16_2.xyz = u_xlat10_20.xyz * u_xlat10_20.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_20.xyz;
					    u_xlat20 = u_xlat50.xyxy * vec4(-3.0, 0.0, 1.0, 4.0) + u_xlat0.xyxy;
					    u_xlat10_21 = texture(_MainTex, u_xlat20.zw);
					    u_xlat10_20 = texture(_MainTex, u_xlat20.xy);
					    u_xlat16_2.xyz = u_xlat10_21.xyz * u_xlat10_21.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_21.xyz;
					    u_xlat21 = u_xlat50.xyxy * vec4(-2.0, 0.0, 2.0, 4.0) + u_xlat0.xyxy;
					    u_xlat10_22 = texture(_MainTex, u_xlat21.zw);
					    u_xlat10_21 = texture(_MainTex, u_xlat21.xy);
					    u_xlat16_2.xyz = u_xlat10_22.xyz * u_xlat10_22.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_22.xyz;
					    u_xlat22 = u_xlat50.xyxy * vec4(-1.0, 0.0, 3.0, 4.0) + u_xlat0.xyxy;
					    u_xlat10_23 = texture(_MainTex, u_xlat22.zw);
					    u_xlat10_22 = texture(_MainTex, u_xlat22.xy);
					    u_xlat16_2.xyz = u_xlat10_23.xyz * u_xlat10_23.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_23.xyz;
					    u_xlat23.xy = u_xlat50.xy * vec2(4.0, 4.0) + u_xlat0.xy;
					    u_xlat10_23 = texture(_MainTex, u_xlat23.xy);
					    u_xlat16_2.xyz = u_xlat10_23.xyz * u_xlat10_23.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_23.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991);
					    u_xlat23.xyz = u_xlat4.xyz * u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + (-u_xlat23.xyz);
					    u_xlat76 = abs(u_xlat2.y) + abs(u_xlat2.x);
					    u_xlat76 = abs(u_xlat2.z) + u_xlat76;
					    u_xlat2 = u_xlat50.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + u_xlat0.xyxy;
					    u_xlat0.xy = (-u_xlat50.xy) + u_xlat0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_23 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_24.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
					    u_xlat16_24.xyz = u_xlat10_23.xyz * u_xlat10_23.xyz + u_xlat16_24.xyz;
					    u_xlat16_23.xyz = u_xlat10_2.xyz + u_xlat10_23.xyz;
					    u_xlat16_23.xyz = u_xlat10_3.xyz + u_xlat16_23.xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz + u_xlat16_24.xyz;
					    u_xlat16_3.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_3.xyz;
					    u_xlat16_5.xyz = u_xlat10_5.xyz + u_xlat16_23.xyz;
					    u_xlat16_5.xyz = u_xlat10_6.xyz + u_xlat16_5.xyz;
					    u_xlat16_3.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_3.xyz;
					    u_xlat16_5.xyz = u_xlat10_7.xyz + u_xlat16_5.xyz;
					    u_xlat16_5.xyz = u_xlat10_2.xyz + u_xlat16_5.xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_9.xyz * u_xlat10_9.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_10.xyz * u_xlat10_10.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_11.xyz * u_xlat10_11.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_12.xyz * u_xlat10_12.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_13.xyz * u_xlat10_13.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_14.xyz * u_xlat10_14.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_15.xyz * u_xlat10_15.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_16.xyz * u_xlat10_16.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_17.xyz * u_xlat10_17.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_18.xyz * u_xlat10_18.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_19.xyz * u_xlat10_19.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_20.xyz * u_xlat10_20.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_21.xyz * u_xlat10_21.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_22.xyz * u_xlat10_22.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.xyz = u_xlat10_8.xyz + u_xlat16_5.xyz;
					    u_xlat16_3.xyz = u_xlat10_9.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_10.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_11.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_8.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_13.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_14.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_15.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_16.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_17.xyz + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = u_xlat10_18.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_19.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_20.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_21.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_22.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat16_2.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + (-u_xlat1.xyz);
					    u_xlat1.x = abs(u_xlat1.y) + abs(u_xlat1.x);
					    u_xlat1.x = abs(u_xlat1.z) + u_xlat1.x;
					    u_xlat26 = min(u_xlat1.x, 100.0);
					    u_xlatb1 = u_xlat1.x<100.0;
					    u_xlatb26 = u_xlat76<u_xlat26;
					    u_xlat0.w = 1.0;
					    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0, vec4(bvec4(u_xlatb1)));
					    u_xlat4.w = 1.0;
					    SV_Target0 = (bool(u_xlatb26)) ? u_xlat4 : u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 97
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 %88 %89 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 9 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %17 Location 17 
					                                              OpDecorate %22 ArrayStride 22 
					                                              OpDecorate %23 ArrayStride 23 
					                                              OpMemberDecorate %24 0 Offset 24 
					                                              OpMemberDecorate %24 1 Offset 24 
					                                              OpDecorate %24 Block 
					                                              OpDecorate %26 DescriptorSet 26 
					                                              OpDecorate %26 Binding 26 
					                                              OpMemberDecorate %76 0 BuiltIn 76 
					                                              OpMemberDecorate %76 1 BuiltIn 76 
					                                              OpMemberDecorate %76 2 BuiltIn 76 
					                                              OpDecorate %76 Block 
					                                              OpDecorate %88 Location 88 
					                                              OpDecorate %89 Location 89 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Output %7 
					               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                      %10 = OpTypePointer Input %7 
					                         Input f32_2* %11 = OpVariable Input 
					                                      %13 = OpTypeVector %6 4 
					                                      %14 = OpTypePointer Private %13 
					                       Private f32_4* %15 = OpVariable Private 
					                                      %16 = OpTypePointer Input %13 
					                         Input f32_4* %17 = OpVariable Input 
					                                      %20 = OpTypeInt 32 0 
					                                  u32 %21 = OpConstant 4 
					                                      %22 = OpTypeArray %13 %21 
					                                      %23 = OpTypeArray %13 %21 
					                                      %24 = OpTypeStruct %22 %23 
					                                      %25 = OpTypePointer Uniform %24 
					Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
					                                      %27 = OpTypeInt 32 1 
					                                  i32 %28 = OpConstant 0 
					                                  i32 %29 = OpConstant 1 
					                                      %30 = OpTypePointer Uniform %13 
					                                  i32 %41 = OpConstant 2 
					                                  i32 %50 = OpConstant 3 
					                       Private f32_4* %54 = OpVariable Private 
					                                  u32 %74 = OpConstant 1 
					                                      %75 = OpTypeArray %6 %74 
					                                      %76 = OpTypeStruct %13 %6 %75 
					                                      %77 = OpTypePointer Output %76 
					 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
					                                      %86 = OpTypePointer Output %13 
					                        Output f32_4* %88 = OpVariable Output 
					                         Input f32_4* %89 = OpVariable Input 
					                                      %91 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                                f32_2 %12 = OpLoad %11 
					                                              OpStore vs_TEXCOORD0 %12 
					                                f32_4 %18 = OpLoad %17 
					                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
					                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
					                                f32_4 %32 = OpLoad %31 
					                                f32_4 %33 = OpFMul %19 %32 
					                                              OpStore %15 %33 
					                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
					                                f32_4 %35 = OpLoad %34 
					                                f32_4 %36 = OpLoad %17 
					                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
					                                f32_4 %38 = OpFMul %35 %37 
					                                f32_4 %39 = OpLoad %15 
					                                f32_4 %40 = OpFAdd %38 %39 
					                                              OpStore %15 %40 
					                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
					                                f32_4 %43 = OpLoad %42 
					                                f32_4 %44 = OpLoad %17 
					                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
					                                f32_4 %46 = OpFMul %43 %45 
					                                f32_4 %47 = OpLoad %15 
					                                f32_4 %48 = OpFAdd %46 %47 
					                                              OpStore %15 %48 
					                                f32_4 %49 = OpLoad %15 
					                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
					                                f32_4 %52 = OpLoad %51 
					                                f32_4 %53 = OpFAdd %49 %52 
					                                              OpStore %15 %53 
					                                f32_4 %55 = OpLoad %15 
					                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
					                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
					                                f32_4 %58 = OpLoad %57 
					                                f32_4 %59 = OpFMul %56 %58 
					                                              OpStore %54 %59 
					                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
					                                f32_4 %61 = OpLoad %60 
					                                f32_4 %62 = OpLoad %15 
					                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
					                                f32_4 %64 = OpFMul %61 %63 
					                                f32_4 %65 = OpLoad %54 
					                                f32_4 %66 = OpFAdd %64 %65 
					                                              OpStore %54 %66 
					                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
					                                f32_4 %68 = OpLoad %67 
					                                f32_4 %69 = OpLoad %15 
					                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
					                                f32_4 %71 = OpFMul %68 %70 
					                                f32_4 %72 = OpLoad %54 
					                                f32_4 %73 = OpFAdd %71 %72 
					                                              OpStore %54 %73 
					                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
					                                f32_4 %80 = OpLoad %79 
					                                f32_4 %81 = OpLoad %15 
					                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
					                                f32_4 %83 = OpFMul %80 %82 
					                                f32_4 %84 = OpLoad %54 
					                                f32_4 %85 = OpFAdd %83 %84 
					                        Output f32_4* %87 = OpAccessChain %78 %28 
					                                              OpStore %87 %85 
					                                f32_4 %90 = OpLoad %89 
					                                              OpStore %88 %90 
					                          Output f32* %92 = OpAccessChain %78 %28 %74 
					                                  f32 %93 = OpLoad %92 
					                                  f32 %94 = OpFNegate %93 
					                          Output f32* %95 = OpAccessChain %78 %28 %74 
					                                              OpStore %95 %94 
					                                              OpReturn
					                                              OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 1108
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %1101 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpMemberDecorate %14 2 RelaxedPrecision 
					                                             OpMemberDecorate %14 2 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %32 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %35 DescriptorSet 35 
					                                             OpDecorate %35 Binding 35 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %39 DescriptorSet 39 
					                                             OpDecorate %39 Binding 39 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %130 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %151 RelaxedPrecision 
					                                             OpDecorate %152 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %158 RelaxedPrecision 
					                                             OpDecorate %159 RelaxedPrecision 
					                                             OpDecorate %160 RelaxedPrecision 
					                                             OpDecorate %161 RelaxedPrecision 
					                                             OpDecorate %162 RelaxedPrecision 
					                                             OpDecorate %163 RelaxedPrecision 
					                                             OpDecorate %164 RelaxedPrecision 
					                                             OpDecorate %165 RelaxedPrecision 
					                                             OpDecorate %176 RelaxedPrecision 
					                                             OpDecorate %177 RelaxedPrecision 
					                                             OpDecorate %178 RelaxedPrecision 
					                                             OpDecorate %183 RelaxedPrecision 
					                                             OpDecorate %184 RelaxedPrecision 
					                                             OpDecorate %185 RelaxedPrecision 
					                                             OpDecorate %190 RelaxedPrecision 
					                                             OpDecorate %191 RelaxedPrecision 
					                                             OpDecorate %192 RelaxedPrecision 
					                                             OpDecorate %193 RelaxedPrecision 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %195 RelaxedPrecision 
					                                             OpDecorate %196 RelaxedPrecision 
					                                             OpDecorate %197 RelaxedPrecision 
					                                             OpDecorate %198 RelaxedPrecision 
					                                             OpDecorate %207 RelaxedPrecision 
					                                             OpDecorate %208 RelaxedPrecision 
					                                             OpDecorate %209 RelaxedPrecision 
					                                             OpDecorate %214 RelaxedPrecision 
					                                             OpDecorate %215 RelaxedPrecision 
					                                             OpDecorate %216 RelaxedPrecision 
					                                             OpDecorate %221 RelaxedPrecision 
					                                             OpDecorate %222 RelaxedPrecision 
					                                             OpDecorate %223 RelaxedPrecision 
					                                             OpDecorate %224 RelaxedPrecision 
					                                             OpDecorate %225 RelaxedPrecision 
					                                             OpDecorate %226 RelaxedPrecision 
					                                             OpDecorate %227 RelaxedPrecision 
					                                             OpDecorate %228 RelaxedPrecision 
					                                             OpDecorate %229 RelaxedPrecision 
					                                             OpDecorate %237 RelaxedPrecision 
					                                             OpDecorate %238 RelaxedPrecision 
					                                             OpDecorate %243 RelaxedPrecision 
					                                             OpDecorate %244 RelaxedPrecision 
					                                             OpDecorate %245 RelaxedPrecision 
					                                             OpDecorate %246 RelaxedPrecision 
					                                             OpDecorate %247 RelaxedPrecision 
					                                             OpDecorate %248 RelaxedPrecision 
					                                             OpDecorate %249 RelaxedPrecision 
					                                             OpDecorate %250 RelaxedPrecision 
					                                             OpDecorate %251 RelaxedPrecision 
					                                             OpDecorate %259 RelaxedPrecision 
					                                             OpDecorate %260 RelaxedPrecision 
					                                             OpDecorate %261 RelaxedPrecision 
					                                             OpDecorate %266 RelaxedPrecision 
					                                             OpDecorate %267 RelaxedPrecision 
					                                             OpDecorate %268 RelaxedPrecision 
					                                             OpDecorate %273 RelaxedPrecision 
					                                             OpDecorate %274 RelaxedPrecision 
					                                             OpDecorate %275 RelaxedPrecision 
					                                             OpDecorate %276 RelaxedPrecision 
					                                             OpDecorate %277 RelaxedPrecision 
					                                             OpDecorate %278 RelaxedPrecision 
					                                             OpDecorate %279 RelaxedPrecision 
					                                             OpDecorate %280 RelaxedPrecision 
					                                             OpDecorate %281 RelaxedPrecision 
					                                             OpDecorate %290 RelaxedPrecision 
					                                             OpDecorate %291 RelaxedPrecision 
					                                             OpDecorate %292 RelaxedPrecision 
					                                             OpDecorate %297 RelaxedPrecision 
					                                             OpDecorate %298 RelaxedPrecision 
					                                             OpDecorate %299 RelaxedPrecision 
					                                             OpDecorate %304 RelaxedPrecision 
					                                             OpDecorate %305 RelaxedPrecision 
					                                             OpDecorate %306 RelaxedPrecision 
					                                             OpDecorate %307 RelaxedPrecision 
					                                             OpDecorate %308 RelaxedPrecision 
					                                             OpDecorate %309 RelaxedPrecision 
					                                             OpDecorate %310 RelaxedPrecision 
					                                             OpDecorate %311 RelaxedPrecision 
					                                             OpDecorate %312 RelaxedPrecision 
					                                             OpDecorate %321 RelaxedPrecision 
					                                             OpDecorate %322 RelaxedPrecision 
					                                             OpDecorate %323 RelaxedPrecision 
					                                             OpDecorate %328 RelaxedPrecision 
					                                             OpDecorate %329 RelaxedPrecision 
					                                             OpDecorate %330 RelaxedPrecision 
					                                             OpDecorate %335 RelaxedPrecision 
					                                             OpDecorate %336 RelaxedPrecision 
					                                             OpDecorate %337 RelaxedPrecision 
					                                             OpDecorate %338 RelaxedPrecision 
					                                             OpDecorate %339 RelaxedPrecision 
					                                             OpDecorate %340 RelaxedPrecision 
					                                             OpDecorate %341 RelaxedPrecision 
					                                             OpDecorate %342 RelaxedPrecision 
					                                             OpDecorate %343 RelaxedPrecision 
					                                             OpDecorate %352 RelaxedPrecision 
					                                             OpDecorate %353 RelaxedPrecision 
					                                             OpDecorate %354 RelaxedPrecision 
					                                             OpDecorate %359 RelaxedPrecision 
					                                             OpDecorate %360 RelaxedPrecision 
					                                             OpDecorate %361 RelaxedPrecision 
					                                             OpDecorate %366 RelaxedPrecision 
					                                             OpDecorate %367 RelaxedPrecision 
					                                             OpDecorate %368 RelaxedPrecision 
					                                             OpDecorate %369 RelaxedPrecision 
					                                             OpDecorate %370 RelaxedPrecision 
					                                             OpDecorate %371 RelaxedPrecision 
					                                             OpDecorate %372 RelaxedPrecision 
					                                             OpDecorate %373 RelaxedPrecision 
					                                             OpDecorate %374 RelaxedPrecision 
					                                             OpDecorate %383 RelaxedPrecision 
					                                             OpDecorate %384 RelaxedPrecision 
					                                             OpDecorate %385 RelaxedPrecision 
					                                             OpDecorate %390 RelaxedPrecision 
					                                             OpDecorate %391 RelaxedPrecision 
					                                             OpDecorate %392 RelaxedPrecision 
					                                             OpDecorate %397 RelaxedPrecision 
					                                             OpDecorate %398 RelaxedPrecision 
					                                             OpDecorate %399 RelaxedPrecision 
					                                             OpDecorate %400 RelaxedPrecision 
					                                             OpDecorate %401 RelaxedPrecision 
					                                             OpDecorate %402 RelaxedPrecision 
					                                             OpDecorate %403 RelaxedPrecision 
					                                             OpDecorate %404 RelaxedPrecision 
					                                             OpDecorate %405 RelaxedPrecision 
					                                             OpDecorate %415 RelaxedPrecision 
					                                             OpDecorate %416 RelaxedPrecision 
					                                             OpDecorate %421 RelaxedPrecision 
					                                             OpDecorate %422 RelaxedPrecision 
					                                             OpDecorate %423 RelaxedPrecision 
					                                             OpDecorate %424 RelaxedPrecision 
					                                             OpDecorate %425 RelaxedPrecision 
					                                             OpDecorate %426 RelaxedPrecision 
					                                             OpDecorate %427 RelaxedPrecision 
					                                             OpDecorate %428 RelaxedPrecision 
					                                             OpDecorate %429 RelaxedPrecision 
					                                             OpDecorate %437 RelaxedPrecision 
					                                             OpDecorate %438 RelaxedPrecision 
					                                             OpDecorate %439 RelaxedPrecision 
					                                             OpDecorate %444 RelaxedPrecision 
					                                             OpDecorate %445 RelaxedPrecision 
					                                             OpDecorate %446 RelaxedPrecision 
					                                             OpDecorate %451 RelaxedPrecision 
					                                             OpDecorate %452 RelaxedPrecision 
					                                             OpDecorate %453 RelaxedPrecision 
					                                             OpDecorate %454 RelaxedPrecision 
					                                             OpDecorate %455 RelaxedPrecision 
					                                             OpDecorate %456 RelaxedPrecision 
					                                             OpDecorate %457 RelaxedPrecision 
					                                             OpDecorate %458 RelaxedPrecision 
					                                             OpDecorate %459 RelaxedPrecision 
					                                             OpDecorate %468 RelaxedPrecision 
					                                             OpDecorate %469 RelaxedPrecision 
					                                             OpDecorate %470 RelaxedPrecision 
					                                             OpDecorate %475 RelaxedPrecision 
					                                             OpDecorate %476 RelaxedPrecision 
					                                             OpDecorate %477 RelaxedPrecision 
					                                             OpDecorate %482 RelaxedPrecision 
					                                             OpDecorate %483 RelaxedPrecision 
					                                             OpDecorate %484 RelaxedPrecision 
					                                             OpDecorate %485 RelaxedPrecision 
					                                             OpDecorate %486 RelaxedPrecision 
					                                             OpDecorate %487 RelaxedPrecision 
					                                             OpDecorate %488 RelaxedPrecision 
					                                             OpDecorate %489 RelaxedPrecision 
					                                             OpDecorate %490 RelaxedPrecision 
					                                             OpDecorate %499 RelaxedPrecision 
					                                             OpDecorate %500 RelaxedPrecision 
					                                             OpDecorate %501 RelaxedPrecision 
					                                             OpDecorate %506 RelaxedPrecision 
					                                             OpDecorate %507 RelaxedPrecision 
					                                             OpDecorate %508 RelaxedPrecision 
					                                             OpDecorate %513 RelaxedPrecision 
					                                             OpDecorate %514 RelaxedPrecision 
					                                             OpDecorate %515 RelaxedPrecision 
					                                             OpDecorate %516 RelaxedPrecision 
					                                             OpDecorate %517 RelaxedPrecision 
					                                             OpDecorate %518 RelaxedPrecision 
					                                             OpDecorate %519 RelaxedPrecision 
					                                             OpDecorate %520 RelaxedPrecision 
					                                             OpDecorate %521 RelaxedPrecision 
					                                             OpDecorate %530 RelaxedPrecision 
					                                             OpDecorate %531 RelaxedPrecision 
					                                             OpDecorate %532 RelaxedPrecision 
					                                             OpDecorate %537 RelaxedPrecision 
					                                             OpDecorate %538 RelaxedPrecision 
					                                             OpDecorate %539 RelaxedPrecision 
					                                             OpDecorate %544 RelaxedPrecision 
					                                             OpDecorate %545 RelaxedPrecision 
					                                             OpDecorate %546 RelaxedPrecision 
					                                             OpDecorate %547 RelaxedPrecision 
					                                             OpDecorate %548 RelaxedPrecision 
					                                             OpDecorate %549 RelaxedPrecision 
					                                             OpDecorate %550 RelaxedPrecision 
					                                             OpDecorate %551 RelaxedPrecision 
					                                             OpDecorate %552 RelaxedPrecision 
					                                             OpDecorate %561 RelaxedPrecision 
					                                             OpDecorate %562 RelaxedPrecision 
					                                             OpDecorate %563 RelaxedPrecision 
					                                             OpDecorate %568 RelaxedPrecision 
					                                             OpDecorate %569 RelaxedPrecision 
					                                             OpDecorate %570 RelaxedPrecision 
					                                             OpDecorate %575 RelaxedPrecision 
					                                             OpDecorate %576 RelaxedPrecision 
					                                             OpDecorate %577 RelaxedPrecision 
					                                             OpDecorate %578 RelaxedPrecision 
					                                             OpDecorate %579 RelaxedPrecision 
					                                             OpDecorate %580 RelaxedPrecision 
					                                             OpDecorate %581 RelaxedPrecision 
					                                             OpDecorate %582 RelaxedPrecision 
					                                             OpDecorate %583 RelaxedPrecision 
					                                             OpDecorate %584 RelaxedPrecision 
					                                             OpDecorate %585 RelaxedPrecision 
					                                             OpDecorate %586 RelaxedPrecision 
					                                             OpDecorate %587 RelaxedPrecision 
					                                             OpDecorate %588 RelaxedPrecision 
					                                             OpDecorate %589 RelaxedPrecision 
					                                             OpDecorate %590 RelaxedPrecision 
					                                             OpDecorate %591 RelaxedPrecision 
					                                             OpDecorate %599 RelaxedPrecision 
					                                             OpDecorate %600 RelaxedPrecision 
					                                             OpDecorate %605 RelaxedPrecision 
					                                             OpDecorate %606 RelaxedPrecision 
					                                             OpDecorate %607 RelaxedPrecision 
					                                             OpDecorate %612 RelaxedPrecision 
					                                             OpDecorate %613 RelaxedPrecision 
					                                             OpDecorate %614 RelaxedPrecision 
					                                             OpDecorate %615 RelaxedPrecision 
					                                             OpDecorate %616 RelaxedPrecision 
					                                             OpDecorate %617 RelaxedPrecision 
					                                             OpDecorate %618 RelaxedPrecision 
					                                             OpDecorate %619 RelaxedPrecision 
					                                             OpDecorate %620 RelaxedPrecision 
					                                             OpDecorate %629 RelaxedPrecision 
					                                             OpDecorate %630 RelaxedPrecision 
					                                             OpDecorate %631 RelaxedPrecision 
					                                             OpDecorate %636 RelaxedPrecision 
					                                             OpDecorate %637 RelaxedPrecision 
					                                             OpDecorate %638 RelaxedPrecision 
					                                             OpDecorate %643 RelaxedPrecision 
					                                             OpDecorate %644 RelaxedPrecision 
					                                             OpDecorate %645 RelaxedPrecision 
					                                             OpDecorate %646 RelaxedPrecision 
					                                             OpDecorate %647 RelaxedPrecision 
					                                             OpDecorate %648 RelaxedPrecision 
					                                             OpDecorate %649 RelaxedPrecision 
					                                             OpDecorate %650 RelaxedPrecision 
					                                             OpDecorate %651 RelaxedPrecision 
					                                             OpDecorate %660 RelaxedPrecision 
					                                             OpDecorate %661 RelaxedPrecision 
					                                             OpDecorate %662 RelaxedPrecision 
					                                             OpDecorate %667 RelaxedPrecision 
					                                             OpDecorate %668 RelaxedPrecision 
					                                             OpDecorate %669 RelaxedPrecision 
					                                             OpDecorate %674 RelaxedPrecision 
					                                             OpDecorate %675 RelaxedPrecision 
					                                             OpDecorate %676 RelaxedPrecision 
					                                             OpDecorate %677 RelaxedPrecision 
					                                             OpDecorate %678 RelaxedPrecision 
					                                             OpDecorate %679 RelaxedPrecision 
					                                             OpDecorate %680 RelaxedPrecision 
					                                             OpDecorate %681 RelaxedPrecision 
					                                             OpDecorate %682 RelaxedPrecision 
					                                             OpDecorate %691 RelaxedPrecision 
					                                             OpDecorate %692 RelaxedPrecision 
					                                             OpDecorate %693 RelaxedPrecision 
					                                             OpDecorate %698 RelaxedPrecision 
					                                             OpDecorate %699 RelaxedPrecision 
					                                             OpDecorate %700 RelaxedPrecision 
					                                             OpDecorate %705 RelaxedPrecision 
					                                             OpDecorate %706 RelaxedPrecision 
					                                             OpDecorate %707 RelaxedPrecision 
					                                             OpDecorate %708 RelaxedPrecision 
					                                             OpDecorate %709 RelaxedPrecision 
					                                             OpDecorate %710 RelaxedPrecision 
					                                             OpDecorate %711 RelaxedPrecision 
					                                             OpDecorate %712 RelaxedPrecision 
					                                             OpDecorate %713 RelaxedPrecision 
					                                             OpDecorate %722 RelaxedPrecision 
					                                             OpDecorate %723 RelaxedPrecision 
					                                             OpDecorate %724 RelaxedPrecision 
					                                             OpDecorate %729 RelaxedPrecision 
					                                             OpDecorate %730 RelaxedPrecision 
					                                             OpDecorate %731 RelaxedPrecision 
					                                             OpDecorate %736 RelaxedPrecision 
					                                             OpDecorate %737 RelaxedPrecision 
					                                             OpDecorate %738 RelaxedPrecision 
					                                             OpDecorate %739 RelaxedPrecision 
					                                             OpDecorate %740 RelaxedPrecision 
					                                             OpDecorate %741 RelaxedPrecision 
					                                             OpDecorate %742 RelaxedPrecision 
					                                             OpDecorate %743 RelaxedPrecision 
					                                             OpDecorate %744 RelaxedPrecision 
					                                             OpDecorate %754 RelaxedPrecision 
					                                             OpDecorate %755 RelaxedPrecision 
					                                             OpDecorate %760 RelaxedPrecision 
					                                             OpDecorate %761 RelaxedPrecision 
					                                             OpDecorate %762 RelaxedPrecision 
					                                             OpDecorate %763 RelaxedPrecision 
					                                             OpDecorate %764 RelaxedPrecision 
					                                             OpDecorate %765 RelaxedPrecision 
					                                             OpDecorate %766 RelaxedPrecision 
					                                             OpDecorate %767 RelaxedPrecision 
					                                             OpDecorate %768 RelaxedPrecision 
					                                             OpDecorate %770 RelaxedPrecision 
					                                             OpDecorate %773 RelaxedPrecision 
					                                             OpDecorate %782 RelaxedPrecision 
					                                             OpDecorate %783 RelaxedPrecision 
					                                             OpDecorate %821 RelaxedPrecision 
					                                             OpDecorate %822 RelaxedPrecision 
					                                             OpDecorate %823 RelaxedPrecision 
					                                             OpDecorate %828 RelaxedPrecision 
					                                             OpDecorate %829 RelaxedPrecision 
					                                             OpDecorate %830 RelaxedPrecision 
					                                             OpDecorate %835 RelaxedPrecision 
					                                             OpDecorate %836 RelaxedPrecision 
					                                             OpDecorate %837 RelaxedPrecision 
					                                             OpDecorate %838 RelaxedPrecision 
					                                             OpDecorate %843 RelaxedPrecision 
					                                             OpDecorate %844 RelaxedPrecision 
					                                             OpDecorate %845 RelaxedPrecision 
					                                             OpDecorate %846 RelaxedPrecision 
					                                             OpDecorate %847 RelaxedPrecision 
					                                             OpDecorate %848 RelaxedPrecision 
					                                             OpDecorate %849 RelaxedPrecision 
					                                             OpDecorate %850 RelaxedPrecision 
					                                             OpDecorate %851 RelaxedPrecision 
					                                             OpDecorate %852 RelaxedPrecision 
					                                             OpDecorate %853 RelaxedPrecision 
					                                             OpDecorate %854 RelaxedPrecision 
					                                             OpDecorate %855 RelaxedPrecision 
					                                             OpDecorate %856 RelaxedPrecision 
					                                             OpDecorate %857 RelaxedPrecision 
					                                             OpDecorate %858 RelaxedPrecision 
					                                             OpDecorate %859 RelaxedPrecision 
					                                             OpDecorate %860 RelaxedPrecision 
					                                             OpDecorate %861 RelaxedPrecision 
					                                             OpDecorate %862 RelaxedPrecision 
					                                             OpDecorate %863 RelaxedPrecision 
					                                             OpDecorate %864 RelaxedPrecision 
					                                             OpDecorate %865 RelaxedPrecision 
					                                             OpDecorate %866 RelaxedPrecision 
					                                             OpDecorate %867 RelaxedPrecision 
					                                             OpDecorate %868 RelaxedPrecision 
					                                             OpDecorate %869 RelaxedPrecision 
					                                             OpDecorate %870 RelaxedPrecision 
					                                             OpDecorate %871 RelaxedPrecision 
					                                             OpDecorate %872 RelaxedPrecision 
					                                             OpDecorate %873 RelaxedPrecision 
					                                             OpDecorate %874 RelaxedPrecision 
					                                             OpDecorate %875 RelaxedPrecision 
					                                             OpDecorate %876 RelaxedPrecision 
					                                             OpDecorate %877 RelaxedPrecision 
					                                             OpDecorate %878 RelaxedPrecision 
					                                             OpDecorate %879 RelaxedPrecision 
					                                             OpDecorate %880 RelaxedPrecision 
					                                             OpDecorate %881 RelaxedPrecision 
					                                             OpDecorate %882 RelaxedPrecision 
					                                             OpDecorate %883 RelaxedPrecision 
					                                             OpDecorate %884 RelaxedPrecision 
					                                             OpDecorate %885 RelaxedPrecision 
					                                             OpDecorate %886 RelaxedPrecision 
					                                             OpDecorate %887 RelaxedPrecision 
					                                             OpDecorate %888 RelaxedPrecision 
					                                             OpDecorate %889 RelaxedPrecision 
					                                             OpDecorate %890 RelaxedPrecision 
					                                             OpDecorate %891 RelaxedPrecision 
					                                             OpDecorate %892 RelaxedPrecision 
					                                             OpDecorate %893 RelaxedPrecision 
					                                             OpDecorate %894 RelaxedPrecision 
					                                             OpDecorate %895 RelaxedPrecision 
					                                             OpDecorate %896 RelaxedPrecision 
					                                             OpDecorate %897 RelaxedPrecision 
					                                             OpDecorate %898 RelaxedPrecision 
					                                             OpDecorate %899 RelaxedPrecision 
					                                             OpDecorate %900 RelaxedPrecision 
					                                             OpDecorate %901 RelaxedPrecision 
					                                             OpDecorate %902 RelaxedPrecision 
					                                             OpDecorate %903 RelaxedPrecision 
					                                             OpDecorate %904 RelaxedPrecision 
					                                             OpDecorate %905 RelaxedPrecision 
					                                             OpDecorate %906 RelaxedPrecision 
					                                             OpDecorate %907 RelaxedPrecision 
					                                             OpDecorate %908 RelaxedPrecision 
					                                             OpDecorate %909 RelaxedPrecision 
					                                             OpDecorate %910 RelaxedPrecision 
					                                             OpDecorate %911 RelaxedPrecision 
					                                             OpDecorate %912 RelaxedPrecision 
					                                             OpDecorate %913 RelaxedPrecision 
					                                             OpDecorate %914 RelaxedPrecision 
					                                             OpDecorate %915 RelaxedPrecision 
					                                             OpDecorate %916 RelaxedPrecision 
					                                             OpDecorate %917 RelaxedPrecision 
					                                             OpDecorate %918 RelaxedPrecision 
					                                             OpDecorate %919 RelaxedPrecision 
					                                             OpDecorate %920 RelaxedPrecision 
					                                             OpDecorate %921 RelaxedPrecision 
					                                             OpDecorate %922 RelaxedPrecision 
					                                             OpDecorate %923 RelaxedPrecision 
					                                             OpDecorate %924 RelaxedPrecision 
					                                             OpDecorate %925 RelaxedPrecision 
					                                             OpDecorate %926 RelaxedPrecision 
					                                             OpDecorate %927 RelaxedPrecision 
					                                             OpDecorate %928 RelaxedPrecision 
					                                             OpDecorate %929 RelaxedPrecision 
					                                             OpDecorate %930 RelaxedPrecision 
					                                             OpDecorate %931 RelaxedPrecision 
					                                             OpDecorate %932 RelaxedPrecision 
					                                             OpDecorate %933 RelaxedPrecision 
					                                             OpDecorate %934 RelaxedPrecision 
					                                             OpDecorate %935 RelaxedPrecision 
					                                             OpDecorate %936 RelaxedPrecision 
					                                             OpDecorate %937 RelaxedPrecision 
					                                             OpDecorate %938 RelaxedPrecision 
					                                             OpDecorate %939 RelaxedPrecision 
					                                             OpDecorate %940 RelaxedPrecision 
					                                             OpDecorate %941 RelaxedPrecision 
					                                             OpDecorate %942 RelaxedPrecision 
					                                             OpDecorate %943 RelaxedPrecision 
					                                             OpDecorate %944 RelaxedPrecision 
					                                             OpDecorate %945 RelaxedPrecision 
					                                             OpDecorate %946 RelaxedPrecision 
					                                             OpDecorate %947 RelaxedPrecision 
					                                             OpDecorate %948 RelaxedPrecision 
					                                             OpDecorate %949 RelaxedPrecision 
					                                             OpDecorate %950 RelaxedPrecision 
					                                             OpDecorate %951 RelaxedPrecision 
					                                             OpDecorate %952 RelaxedPrecision 
					                                             OpDecorate %953 RelaxedPrecision 
					                                             OpDecorate %954 RelaxedPrecision 
					                                             OpDecorate %955 RelaxedPrecision 
					                                             OpDecorate %956 RelaxedPrecision 
					                                             OpDecorate %957 RelaxedPrecision 
					                                             OpDecorate %958 RelaxedPrecision 
					                                             OpDecorate %959 RelaxedPrecision 
					                                             OpDecorate %960 RelaxedPrecision 
					                                             OpDecorate %961 RelaxedPrecision 
					                                             OpDecorate %962 RelaxedPrecision 
					                                             OpDecorate %963 RelaxedPrecision 
					                                             OpDecorate %964 RelaxedPrecision 
					                                             OpDecorate %965 RelaxedPrecision 
					                                             OpDecorate %966 RelaxedPrecision 
					                                             OpDecorate %967 RelaxedPrecision 
					                                             OpDecorate %968 RelaxedPrecision 
					                                             OpDecorate %969 RelaxedPrecision 
					                                             OpDecorate %970 RelaxedPrecision 
					                                             OpDecorate %971 RelaxedPrecision 
					                                             OpDecorate %972 RelaxedPrecision 
					                                             OpDecorate %973 RelaxedPrecision 
					                                             OpDecorate %974 RelaxedPrecision 
					                                             OpDecorate %975 RelaxedPrecision 
					                                             OpDecorate %976 RelaxedPrecision 
					                                             OpDecorate %977 RelaxedPrecision 
					                                             OpDecorate %978 RelaxedPrecision 
					                                             OpDecorate %979 RelaxedPrecision 
					                                             OpDecorate %980 RelaxedPrecision 
					                                             OpDecorate %981 RelaxedPrecision 
					                                             OpDecorate %982 RelaxedPrecision 
					                                             OpDecorate %983 RelaxedPrecision 
					                                             OpDecorate %984 RelaxedPrecision 
					                                             OpDecorate %985 RelaxedPrecision 
					                                             OpDecorate %986 RelaxedPrecision 
					                                             OpDecorate %987 RelaxedPrecision 
					                                             OpDecorate %988 RelaxedPrecision 
					                                             OpDecorate %989 RelaxedPrecision 
					                                             OpDecorate %990 RelaxedPrecision 
					                                             OpDecorate %991 RelaxedPrecision 
					                                             OpDecorate %992 RelaxedPrecision 
					                                             OpDecorate %993 RelaxedPrecision 
					                                             OpDecorate %994 RelaxedPrecision 
					                                             OpDecorate %995 RelaxedPrecision 
					                                             OpDecorate %996 RelaxedPrecision 
					                                             OpDecorate %997 RelaxedPrecision 
					                                             OpDecorate %998 RelaxedPrecision 
					                                             OpDecorate %999 RelaxedPrecision 
					                                             OpDecorate %1000 RelaxedPrecision 
					                                             OpDecorate %1001 RelaxedPrecision 
					                                             OpDecorate %1002 RelaxedPrecision 
					                                             OpDecorate %1003 RelaxedPrecision 
					                                             OpDecorate %1004 RelaxedPrecision 
					                                             OpDecorate %1005 RelaxedPrecision 
					                                             OpDecorate %1006 RelaxedPrecision 
					                                             OpDecorate %1007 RelaxedPrecision 
					                                             OpDecorate %1008 RelaxedPrecision 
					                                             OpDecorate %1009 RelaxedPrecision 
					                                             OpDecorate %1010 RelaxedPrecision 
					                                             OpDecorate %1011 RelaxedPrecision 
					                                             OpDecorate %1012 RelaxedPrecision 
					                                             OpDecorate %1013 RelaxedPrecision 
					                                             OpDecorate %1014 RelaxedPrecision 
					                                             OpDecorate %1015 RelaxedPrecision 
					                                             OpDecorate %1016 RelaxedPrecision 
					                                             OpDecorate %1017 RelaxedPrecision 
					                                             OpDecorate %1018 RelaxedPrecision 
					                                             OpDecorate %1019 RelaxedPrecision 
					                                             OpDecorate %1020 RelaxedPrecision 
					                                             OpDecorate %1021 RelaxedPrecision 
					                                             OpDecorate %1022 RelaxedPrecision 
					                                             OpDecorate %1023 RelaxedPrecision 
					                                             OpDecorate %1024 RelaxedPrecision 
					                                             OpDecorate %1025 RelaxedPrecision 
					                                             OpDecorate %1026 RelaxedPrecision 
					                                             OpDecorate %1027 RelaxedPrecision 
					                                             OpDecorate %1028 RelaxedPrecision 
					                                             OpDecorate %1029 RelaxedPrecision 
					                                             OpDecorate %1030 RelaxedPrecision 
					                                             OpDecorate %1031 RelaxedPrecision 
					                                             OpDecorate %1032 RelaxedPrecision 
					                                             OpDecorate %1033 RelaxedPrecision 
					                                             OpDecorate %1034 RelaxedPrecision 
					                                             OpDecorate %1035 RelaxedPrecision 
					                                             OpDecorate %1036 RelaxedPrecision 
					                                             OpDecorate %1037 RelaxedPrecision 
					                                             OpDecorate %1038 RelaxedPrecision 
					                                             OpDecorate %1039 RelaxedPrecision 
					                                             OpDecorate %1040 RelaxedPrecision 
					                                             OpDecorate %1041 RelaxedPrecision 
					                                             OpDecorate %1042 RelaxedPrecision 
					                                             OpDecorate %1043 RelaxedPrecision 
					                                             OpDecorate %1044 RelaxedPrecision 
					                                             OpDecorate %1045 RelaxedPrecision 
					                                             OpDecorate %1054 RelaxedPrecision 
					                                             OpDecorate %1055 RelaxedPrecision 
					                                             OpDecorate %1101 Location 1101 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %14 = OpTypeStruct %7 %6 %7 
					                                     %15 = OpTypePointer Uniform %14 
					Uniform struct {f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 2 
					                                     %19 = OpTypePointer Uniform %7 
					                                     %30 = OpTypeVector %6 3 
					                                     %31 = OpTypePointer Private %30 
					                      Private f32_3* %32 = OpVariable Private 
					                                     %33 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %34 = OpTypePointer UniformConstant %33 
					UniformConstant read_only Texture2D* %35 = OpVariable UniformConstant 
					                                     %37 = OpTypeSampler 
					                                     %38 = OpTypePointer UniformConstant %37 
					            UniformConstant sampler* %39 = OpVariable UniformConstant 
					                                     %41 = OpTypeSampledImage %33 
					                      Private f32_3* %47 = OpVariable Private 
					                                     %51 = OpTypePointer Private %10 
					                      Private f32_2* %52 = OpVariable Private 
					                                 i32 %53 = OpConstant 1 
					                                     %54 = OpTypePointer Uniform %6 
					                                 i32 %58 = OpConstant 0 
					                      Private f32_4* %63 = OpVariable Private 
					                                 f32 %66 = OpConstant 3,674022E-40 
					                                 f32 %67 = OpConstant 3,674022E-40 
					                                 f32 %68 = OpConstant 3,674022E-40 
					                               f32_4 %69 = OpConstantComposite %66 %67 %68 %68 
					                      Private f32_3* %74 = OpVariable Private 
					                      Private f32_3* %82 = OpVariable Private 
					                      Private f32_3* %95 = OpVariable Private 
					                      Private f32_4* %99 = OpVariable Private 
					                                f32 %102 = OpConstant 3,674022E-40 
					                                f32 %103 = OpConstant 3,674022E-40 
					                                f32 %104 = OpConstant 3,674022E-40 
					                              f32_4 %105 = OpConstantComposite %102 %67 %103 %104 
					                     Private f32_3* %110 = OpVariable Private 
					                     Private f32_3* %118 = OpVariable Private 
					                     Private f32_4* %134 = OpVariable Private 
					                                f32 %137 = OpConstant 3,674022E-40 
					                              f32_4 %138 = OpConstantComposite %137 %67 %67 %104 
					                     Private f32_3* %143 = OpVariable Private 
					                     Private f32_4* %166 = OpVariable Private 
					                                f32 %169 = OpConstant 3,674022E-40 
					                                f32 %170 = OpConstant 3,674022E-40 
					                              f32_4 %171 = OpConstantComposite %169 %67 %104 %170 
					                     Private f32_3* %176 = OpVariable Private 
					                     Private f32_4* %199 = OpVariable Private 
					                              f32_4 %202 = OpConstantComposite %67 %66 %68 %170 
					                     Private f32_3* %207 = OpVariable Private 
					                     Private f32_4* %230 = OpVariable Private 
					                              f32_4 %254 = OpConstantComposite %102 %66 %103 %170 
					                     Private f32_3* %259 = OpVariable Private 
					                     Private f32_4* %282 = OpVariable Private 
					                              f32_4 %285 = OpConstantComposite %137 %66 %67 %170 
					                     Private f32_3* %290 = OpVariable Private 
					                     Private f32_4* %313 = OpVariable Private 
					                              f32_4 %316 = OpConstantComposite %169 %66 %104 %68 
					                     Private f32_3* %321 = OpVariable Private 
					                     Private f32_4* %344 = OpVariable Private 
					                              f32_4 %347 = OpConstantComposite %67 %102 %170 %68 
					                     Private f32_3* %352 = OpVariable Private 
					                     Private f32_4* %375 = OpVariable Private 
					                              f32_4 %378 = OpConstantComposite %66 %102 %103 %68 
					                     Private f32_3* %383 = OpVariable Private 
					                     Private f32_4* %406 = OpVariable Private 
					                              f32_2 %408 = OpConstantComposite %102 %102 
					                              f32_4 %432 = OpConstantComposite %137 %102 %67 %68 
					                     Private f32_3* %437 = OpVariable Private 
					                     Private f32_4* %460 = OpVariable Private 
					                              f32_4 %463 = OpConstantComposite %169 %102 %104 %103 
					                     Private f32_3* %468 = OpVariable Private 
					                     Private f32_4* %491 = OpVariable Private 
					                              f32_4 %494 = OpConstantComposite %67 %137 %170 %103 
					                     Private f32_3* %499 = OpVariable Private 
					                     Private f32_4* %522 = OpVariable Private 
					                              f32_4 %525 = OpConstantComposite %66 %137 %68 %103 
					                     Private f32_3* %530 = OpVariable Private 
					                     Private f32_4* %553 = OpVariable Private 
					                              f32_4 %556 = OpConstantComposite %102 %137 %137 %137 
					                     Private f32_3* %561 = OpVariable Private 
					                              f32_4 %594 = OpConstantComposite %67 %103 %169 %137 
					                     Private f32_4* %621 = OpVariable Private 
					                              f32_4 %624 = OpConstantComposite %104 %67 %67 %169 
					                     Private f32_3* %629 = OpVariable Private 
					                     Private f32_4* %652 = OpVariable Private 
					                              f32_4 %655 = OpConstantComposite %170 %67 %66 %169 
					                     Private f32_3* %660 = OpVariable Private 
					                     Private f32_4* %683 = OpVariable Private 
					                              f32_4 %686 = OpConstantComposite %68 %67 %102 %169 
					                     Private f32_3* %691 = OpVariable Private 
					                     Private f32_4* %714 = OpVariable Private 
					                              f32_4 %717 = OpConstantComposite %103 %67 %137 %169 
					                     Private f32_3* %722 = OpVariable Private 
					                     Private f32_3* %745 = OpVariable Private 
					                              f32_2 %747 = OpConstantComposite %169 %169 
					                     Private f32_4* %769 = OpVariable Private 
					                                f32 %771 = OpConstant 3,674022E-40 
					                              f32_3 %772 = OpConstantComposite %771 %771 %771 
					                     Private f32_4* %781 = OpVariable Private 
					                                    %789 = OpTypePointer Private %6 
					                       Private f32* %790 = OpVariable Private 
					                                    %791 = OpTypeInt 32 0 
					                                u32 %792 = OpConstant 1 
					                                u32 %796 = OpConstant 0 
					                                u32 %801 = OpConstant 2 
					                              f32_4 %809 = OpConstantComposite %104 %104 %170 %170 
					                     Private f32_3* %821 = OpVariable Private 
					                     Private f32_3* %836 = OpVariable Private 
					                     Private f32_3* %844 = OpVariable Private 
					                     Private f32_3* %853 = OpVariable Private 
					                     Private f32_3* %860 = OpVariable Private 
					                     Private f32_3* %871 = OpVariable Private 
					                    Private f32_3* %1022 = OpVariable Private 
					                    Private f32_3* %1048 = OpVariable Private 
					                      Private f32* %1074 = OpVariable Private 
					                               f32 %1077 = OpConstant 3,674022E-40 
					                                   %1079 = OpTypeBool 
					                                   %1080 = OpTypePointer Private %1079 
					                     Private bool* %1081 = OpVariable Private 
					                     Private bool* %1085 = OpVariable Private 
					                               u32 %1089 = OpConstant 3 
					                             f32_4 %1091 = OpConstantComposite %67 %67 %67 %67 
					                                   %1094 = OpTypeVector %1079 4 
					                             f32_4 %1096 = OpConstantComposite %66 %66 %66 %66 
					                                   %1100 = OpTypePointer Output %7 
					                     Output f32_4* %1101 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_2 %13 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %20 = OpAccessChain %16 %18 
					                               f32_4 %21 = OpLoad %20 
					                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                               f32_2 %23 = OpFMul %13 %22 
					                      Uniform f32_4* %24 = OpAccessChain %16 %18 
					                               f32_4 %25 = OpLoad %24 
					                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                               f32_2 %27 = OpFAdd %23 %26 
					                               f32_4 %28 = OpLoad %9 
					                               f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
					                                             OpStore %9 %29 
					                 read_only Texture2D %36 = OpLoad %35 
					                             sampler %40 = OpLoad %39 
					          read_only Texture2DSampled %42 = OpSampledImage %36 %40 
					                               f32_4 %43 = OpLoad %9 
					                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
					                               f32_4 %45 = OpImageSampleImplicitLod %42 %44 
					                               f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
					                                             OpStore %32 %46 
					                               f32_3 %48 = OpLoad %32 
					                               f32_3 %49 = OpLoad %32 
					                               f32_3 %50 = OpFMul %48 %49 
					                                             OpStore %47 %50 
					                        Uniform f32* %55 = OpAccessChain %16 %53 
					                                 f32 %56 = OpLoad %55 
					                               f32_2 %57 = OpCompositeConstruct %56 %56 
					                      Uniform f32_4* %59 = OpAccessChain %16 %58 
					                               f32_4 %60 = OpLoad %59 
					                               f32_2 %61 = OpVectorShuffle %60 %60 0 1 
					                               f32_2 %62 = OpFDiv %57 %61 
					                                             OpStore %52 %62 
					                               f32_2 %64 = OpLoad %52 
					                               f32_4 %65 = OpVectorShuffle %64 %64 0 1 0 1 
					                               f32_4 %70 = OpFMul %65 %69 
					                               f32_4 %71 = OpLoad %9 
					                               f32_4 %72 = OpVectorShuffle %71 %71 0 1 0 1 
					                               f32_4 %73 = OpFAdd %70 %72 
					                                             OpStore %63 %73 
					                 read_only Texture2D %75 = OpLoad %35 
					                             sampler %76 = OpLoad %39 
					          read_only Texture2DSampled %77 = OpSampledImage %75 %76 
					                               f32_4 %78 = OpLoad %63 
					                               f32_2 %79 = OpVectorShuffle %78 %78 0 1 
					                               f32_4 %80 = OpImageSampleImplicitLod %77 %79 
					                               f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
					                                             OpStore %74 %81 
					                 read_only Texture2D %83 = OpLoad %35 
					                             sampler %84 = OpLoad %39 
					          read_only Texture2DSampled %85 = OpSampledImage %83 %84 
					                               f32_4 %86 = OpLoad %63 
					                               f32_2 %87 = OpVectorShuffle %86 %86 2 3 
					                               f32_4 %88 = OpImageSampleImplicitLod %85 %87 
					                               f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
					                                             OpStore %82 %89 
					                               f32_3 %90 = OpLoad %74 
					                               f32_3 %91 = OpLoad %74 
					                               f32_3 %92 = OpFMul %90 %91 
					                               f32_3 %93 = OpLoad %47 
					                               f32_3 %94 = OpFAdd %92 %93 
					                                             OpStore %47 %94 
					                               f32_3 %96 = OpLoad %32 
					                               f32_3 %97 = OpLoad %74 
					                               f32_3 %98 = OpFAdd %96 %97 
					                                             OpStore %95 %98 
					                              f32_2 %100 = OpLoad %52 
					                              f32_4 %101 = OpVectorShuffle %100 %100 0 1 0 1 
					                              f32_4 %106 = OpFMul %101 %105 
					                              f32_4 %107 = OpLoad %9 
					                              f32_4 %108 = OpVectorShuffle %107 %107 0 1 0 1 
					                              f32_4 %109 = OpFAdd %106 %108 
					                                             OpStore %99 %109 
					                read_only Texture2D %111 = OpLoad %35 
					                            sampler %112 = OpLoad %39 
					         read_only Texture2DSampled %113 = OpSampledImage %111 %112 
					                              f32_4 %114 = OpLoad %99 
					                              f32_2 %115 = OpVectorShuffle %114 %114 0 1 
					                              f32_4 %116 = OpImageSampleImplicitLod %113 %115 
					                              f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
					                                             OpStore %110 %117 
					                read_only Texture2D %119 = OpLoad %35 
					                            sampler %120 = OpLoad %39 
					         read_only Texture2DSampled %121 = OpSampledImage %119 %120 
					                              f32_4 %122 = OpLoad %99 
					                              f32_2 %123 = OpVectorShuffle %122 %122 2 3 
					                              f32_4 %124 = OpImageSampleImplicitLod %121 %123 
					                              f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
					                                             OpStore %118 %125 
					                              f32_3 %126 = OpLoad %110 
					                              f32_3 %127 = OpLoad %110 
					                              f32_3 %128 = OpFMul %126 %127 
					                              f32_3 %129 = OpLoad %47 
					                              f32_3 %130 = OpFAdd %128 %129 
					                                             OpStore %47 %130 
					                              f32_3 %131 = OpLoad %95 
					                              f32_3 %132 = OpLoad %110 
					                              f32_3 %133 = OpFAdd %131 %132 
					                                             OpStore %95 %133 
					                              f32_2 %135 = OpLoad %52 
					                              f32_4 %136 = OpVectorShuffle %135 %135 0 1 0 1 
					                              f32_4 %139 = OpFMul %136 %138 
					                              f32_4 %140 = OpLoad %9 
					                              f32_4 %141 = OpVectorShuffle %140 %140 0 1 0 1 
					                              f32_4 %142 = OpFAdd %139 %141 
					                                             OpStore %134 %142 
					                read_only Texture2D %144 = OpLoad %35 
					                            sampler %145 = OpLoad %39 
					         read_only Texture2DSampled %146 = OpSampledImage %144 %145 
					                              f32_4 %147 = OpLoad %134 
					                              f32_2 %148 = OpVectorShuffle %147 %147 0 1 
					                              f32_4 %149 = OpImageSampleImplicitLod %146 %148 
					                              f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
					                                             OpStore %143 %150 
					                read_only Texture2D %151 = OpLoad %35 
					                            sampler %152 = OpLoad %39 
					         read_only Texture2DSampled %153 = OpSampledImage %151 %152 
					                              f32_4 %154 = OpLoad %134 
					                              f32_2 %155 = OpVectorShuffle %154 %154 2 3 
					                              f32_4 %156 = OpImageSampleImplicitLod %153 %155 
					                              f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
					                                             OpStore %110 %157 
					                              f32_3 %158 = OpLoad %143 
					                              f32_3 %159 = OpLoad %143 
					                              f32_3 %160 = OpFMul %158 %159 
					                              f32_3 %161 = OpLoad %47 
					                              f32_3 %162 = OpFAdd %160 %161 
					                                             OpStore %47 %162 
					                              f32_3 %163 = OpLoad %95 
					                              f32_3 %164 = OpLoad %143 
					                              f32_3 %165 = OpFAdd %163 %164 
					                                             OpStore %95 %165 
					                              f32_2 %167 = OpLoad %52 
					                              f32_4 %168 = OpVectorShuffle %167 %167 0 1 0 1 
					                              f32_4 %172 = OpFMul %168 %171 
					                              f32_4 %173 = OpLoad %9 
					                              f32_4 %174 = OpVectorShuffle %173 %173 0 1 0 1 
					                              f32_4 %175 = OpFAdd %172 %174 
					                                             OpStore %166 %175 
					                read_only Texture2D %177 = OpLoad %35 
					                            sampler %178 = OpLoad %39 
					         read_only Texture2DSampled %179 = OpSampledImage %177 %178 
					                              f32_4 %180 = OpLoad %166 
					                              f32_2 %181 = OpVectorShuffle %180 %180 0 1 
					                              f32_4 %182 = OpImageSampleImplicitLod %179 %181 
					                              f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
					                                             OpStore %176 %183 
					                read_only Texture2D %184 = OpLoad %35 
					                            sampler %185 = OpLoad %39 
					         read_only Texture2DSampled %186 = OpSampledImage %184 %185 
					                              f32_4 %187 = OpLoad %166 
					                              f32_2 %188 = OpVectorShuffle %187 %187 2 3 
					                              f32_4 %189 = OpImageSampleImplicitLod %186 %188 
					                              f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
					                                             OpStore %143 %190 
					                              f32_3 %191 = OpLoad %176 
					                              f32_3 %192 = OpLoad %176 
					                              f32_3 %193 = OpFMul %191 %192 
					                              f32_3 %194 = OpLoad %47 
					                              f32_3 %195 = OpFAdd %193 %194 
					                                             OpStore %47 %195 
					                              f32_3 %196 = OpLoad %95 
					                              f32_3 %197 = OpLoad %176 
					                              f32_3 %198 = OpFAdd %196 %197 
					                                             OpStore %95 %198 
					                              f32_2 %200 = OpLoad %52 
					                              f32_4 %201 = OpVectorShuffle %200 %200 0 1 0 1 
					                              f32_4 %203 = OpFMul %201 %202 
					                              f32_4 %204 = OpLoad %9 
					                              f32_4 %205 = OpVectorShuffle %204 %204 0 1 0 1 
					                              f32_4 %206 = OpFAdd %203 %205 
					                                             OpStore %199 %206 
					                read_only Texture2D %208 = OpLoad %35 
					                            sampler %209 = OpLoad %39 
					         read_only Texture2DSampled %210 = OpSampledImage %208 %209 
					                              f32_4 %211 = OpLoad %199 
					                              f32_2 %212 = OpVectorShuffle %211 %211 0 1 
					                              f32_4 %213 = OpImageSampleImplicitLod %210 %212 
					                              f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
					                                             OpStore %207 %214 
					                read_only Texture2D %215 = OpLoad %35 
					                            sampler %216 = OpLoad %39 
					         read_only Texture2DSampled %217 = OpSampledImage %215 %216 
					                              f32_4 %218 = OpLoad %199 
					                              f32_2 %219 = OpVectorShuffle %218 %218 2 3 
					                              f32_4 %220 = OpImageSampleImplicitLod %217 %219 
					                              f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
					                                             OpStore %176 %221 
					                              f32_3 %222 = OpLoad %207 
					                              f32_3 %223 = OpLoad %207 
					                              f32_3 %224 = OpFMul %222 %223 
					                              f32_3 %225 = OpLoad %47 
					                              f32_3 %226 = OpFAdd %224 %225 
					                                             OpStore %47 %226 
					                              f32_3 %227 = OpLoad %95 
					                              f32_3 %228 = OpLoad %207 
					                              f32_3 %229 = OpFAdd %227 %228 
					                                             OpStore %95 %229 
					                              f32_2 %231 = OpLoad %52 
					                              f32_4 %232 = OpLoad %9 
					                              f32_2 %233 = OpVectorShuffle %232 %232 0 1 
					                              f32_2 %234 = OpFAdd %231 %233 
					                              f32_4 %235 = OpLoad %230 
					                              f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
					                                             OpStore %230 %236 
					                read_only Texture2D %237 = OpLoad %35 
					                            sampler %238 = OpLoad %39 
					         read_only Texture2DSampled %239 = OpSampledImage %237 %238 
					                              f32_4 %240 = OpLoad %230 
					                              f32_2 %241 = OpVectorShuffle %240 %240 0 1 
					                              f32_4 %242 = OpImageSampleImplicitLod %239 %241 
					                              f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
					                                             OpStore %207 %243 
					                              f32_3 %244 = OpLoad %207 
					                              f32_3 %245 = OpLoad %207 
					                              f32_3 %246 = OpFMul %244 %245 
					                              f32_3 %247 = OpLoad %47 
					                              f32_3 %248 = OpFAdd %246 %247 
					                                             OpStore %47 %248 
					                              f32_3 %249 = OpLoad %95 
					                              f32_3 %250 = OpLoad %207 
					                              f32_3 %251 = OpFAdd %249 %250 
					                                             OpStore %95 %251 
					                              f32_2 %252 = OpLoad %52 
					                              f32_4 %253 = OpVectorShuffle %252 %252 0 1 0 1 
					                              f32_4 %255 = OpFMul %253 %254 
					                              f32_4 %256 = OpLoad %9 
					                              f32_4 %257 = OpVectorShuffle %256 %256 0 1 0 1 
					                              f32_4 %258 = OpFAdd %255 %257 
					                                             OpStore %230 %258 
					                read_only Texture2D %260 = OpLoad %35 
					                            sampler %261 = OpLoad %39 
					         read_only Texture2DSampled %262 = OpSampledImage %260 %261 
					                              f32_4 %263 = OpLoad %230 
					                              f32_2 %264 = OpVectorShuffle %263 %263 0 1 
					                              f32_4 %265 = OpImageSampleImplicitLod %262 %264 
					                              f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
					                                             OpStore %259 %266 
					                read_only Texture2D %267 = OpLoad %35 
					                            sampler %268 = OpLoad %39 
					         read_only Texture2DSampled %269 = OpSampledImage %267 %268 
					                              f32_4 %270 = OpLoad %230 
					                              f32_2 %271 = OpVectorShuffle %270 %270 2 3 
					                              f32_4 %272 = OpImageSampleImplicitLod %269 %271 
					                              f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
					                                             OpStore %207 %273 
					                              f32_3 %274 = OpLoad %259 
					                              f32_3 %275 = OpLoad %259 
					                              f32_3 %276 = OpFMul %274 %275 
					                              f32_3 %277 = OpLoad %47 
					                              f32_3 %278 = OpFAdd %276 %277 
					                                             OpStore %47 %278 
					                              f32_3 %279 = OpLoad %95 
					                              f32_3 %280 = OpLoad %259 
					                              f32_3 %281 = OpFAdd %279 %280 
					                                             OpStore %95 %281 
					                              f32_2 %283 = OpLoad %52 
					                              f32_4 %284 = OpVectorShuffle %283 %283 0 1 0 1 
					                              f32_4 %286 = OpFMul %284 %285 
					                              f32_4 %287 = OpLoad %9 
					                              f32_4 %288 = OpVectorShuffle %287 %287 0 1 0 1 
					                              f32_4 %289 = OpFAdd %286 %288 
					                                             OpStore %282 %289 
					                read_only Texture2D %291 = OpLoad %35 
					                            sampler %292 = OpLoad %39 
					         read_only Texture2DSampled %293 = OpSampledImage %291 %292 
					                              f32_4 %294 = OpLoad %282 
					                              f32_2 %295 = OpVectorShuffle %294 %294 0 1 
					                              f32_4 %296 = OpImageSampleImplicitLod %293 %295 
					                              f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
					                                             OpStore %290 %297 
					                read_only Texture2D %298 = OpLoad %35 
					                            sampler %299 = OpLoad %39 
					         read_only Texture2DSampled %300 = OpSampledImage %298 %299 
					                              f32_4 %301 = OpLoad %282 
					                              f32_2 %302 = OpVectorShuffle %301 %301 2 3 
					                              f32_4 %303 = OpImageSampleImplicitLod %300 %302 
					                              f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
					                                             OpStore %259 %304 
					                              f32_3 %305 = OpLoad %290 
					                              f32_3 %306 = OpLoad %290 
					                              f32_3 %307 = OpFMul %305 %306 
					                              f32_3 %308 = OpLoad %47 
					                              f32_3 %309 = OpFAdd %307 %308 
					                                             OpStore %47 %309 
					                              f32_3 %310 = OpLoad %95 
					                              f32_3 %311 = OpLoad %290 
					                              f32_3 %312 = OpFAdd %310 %311 
					                                             OpStore %95 %312 
					                              f32_2 %314 = OpLoad %52 
					                              f32_4 %315 = OpVectorShuffle %314 %314 0 1 0 1 
					                              f32_4 %317 = OpFMul %315 %316 
					                              f32_4 %318 = OpLoad %9 
					                              f32_4 %319 = OpVectorShuffle %318 %318 0 1 0 1 
					                              f32_4 %320 = OpFAdd %317 %319 
					                                             OpStore %313 %320 
					                read_only Texture2D %322 = OpLoad %35 
					                            sampler %323 = OpLoad %39 
					         read_only Texture2DSampled %324 = OpSampledImage %322 %323 
					                              f32_4 %325 = OpLoad %313 
					                              f32_2 %326 = OpVectorShuffle %325 %325 0 1 
					                              f32_4 %327 = OpImageSampleImplicitLod %324 %326 
					                              f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
					                                             OpStore %321 %328 
					                read_only Texture2D %329 = OpLoad %35 
					                            sampler %330 = OpLoad %39 
					         read_only Texture2DSampled %331 = OpSampledImage %329 %330 
					                              f32_4 %332 = OpLoad %313 
					                              f32_2 %333 = OpVectorShuffle %332 %332 2 3 
					                              f32_4 %334 = OpImageSampleImplicitLod %331 %333 
					                              f32_3 %335 = OpVectorShuffle %334 %334 0 1 2 
					                                             OpStore %290 %335 
					                              f32_3 %336 = OpLoad %321 
					                              f32_3 %337 = OpLoad %321 
					                              f32_3 %338 = OpFMul %336 %337 
					                              f32_3 %339 = OpLoad %47 
					                              f32_3 %340 = OpFAdd %338 %339 
					                                             OpStore %47 %340 
					                              f32_3 %341 = OpLoad %95 
					                              f32_3 %342 = OpLoad %321 
					                              f32_3 %343 = OpFAdd %341 %342 
					                                             OpStore %95 %343 
					                              f32_2 %345 = OpLoad %52 
					                              f32_4 %346 = OpVectorShuffle %345 %345 0 1 0 1 
					                              f32_4 %348 = OpFMul %346 %347 
					                              f32_4 %349 = OpLoad %9 
					                              f32_4 %350 = OpVectorShuffle %349 %349 0 1 0 1 
					                              f32_4 %351 = OpFAdd %348 %350 
					                                             OpStore %344 %351 
					                read_only Texture2D %353 = OpLoad %35 
					                            sampler %354 = OpLoad %39 
					         read_only Texture2DSampled %355 = OpSampledImage %353 %354 
					                              f32_4 %356 = OpLoad %344 
					                              f32_2 %357 = OpVectorShuffle %356 %356 0 1 
					                              f32_4 %358 = OpImageSampleImplicitLod %355 %357 
					                              f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
					                                             OpStore %352 %359 
					                read_only Texture2D %360 = OpLoad %35 
					                            sampler %361 = OpLoad %39 
					         read_only Texture2DSampled %362 = OpSampledImage %360 %361 
					                              f32_4 %363 = OpLoad %344 
					                              f32_2 %364 = OpVectorShuffle %363 %363 2 3 
					                              f32_4 %365 = OpImageSampleImplicitLod %362 %364 
					                              f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
					                                             OpStore %321 %366 
					                              f32_3 %367 = OpLoad %352 
					                              f32_3 %368 = OpLoad %352 
					                              f32_3 %369 = OpFMul %367 %368 
					                              f32_3 %370 = OpLoad %47 
					                              f32_3 %371 = OpFAdd %369 %370 
					                                             OpStore %47 %371 
					                              f32_3 %372 = OpLoad %95 
					                              f32_3 %373 = OpLoad %352 
					                              f32_3 %374 = OpFAdd %372 %373 
					                                             OpStore %95 %374 
					                              f32_2 %376 = OpLoad %52 
					                              f32_4 %377 = OpVectorShuffle %376 %376 0 1 0 1 
					                              f32_4 %379 = OpFMul %377 %378 
					                              f32_4 %380 = OpLoad %9 
					                              f32_4 %381 = OpVectorShuffle %380 %380 0 1 0 1 
					                              f32_4 %382 = OpFAdd %379 %381 
					                                             OpStore %375 %382 
					                read_only Texture2D %384 = OpLoad %35 
					                            sampler %385 = OpLoad %39 
					         read_only Texture2DSampled %386 = OpSampledImage %384 %385 
					                              f32_4 %387 = OpLoad %375 
					                              f32_2 %388 = OpVectorShuffle %387 %387 0 1 
					                              f32_4 %389 = OpImageSampleImplicitLod %386 %388 
					                              f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
					                                             OpStore %383 %390 
					                read_only Texture2D %391 = OpLoad %35 
					                            sampler %392 = OpLoad %39 
					         read_only Texture2DSampled %393 = OpSampledImage %391 %392 
					                              f32_4 %394 = OpLoad %375 
					                              f32_2 %395 = OpVectorShuffle %394 %394 2 3 
					                              f32_4 %396 = OpImageSampleImplicitLod %393 %395 
					                              f32_3 %397 = OpVectorShuffle %396 %396 0 1 2 
					                                             OpStore %352 %397 
					                              f32_3 %398 = OpLoad %383 
					                              f32_3 %399 = OpLoad %383 
					                              f32_3 %400 = OpFMul %398 %399 
					                              f32_3 %401 = OpLoad %47 
					                              f32_3 %402 = OpFAdd %400 %401 
					                                             OpStore %47 %402 
					                              f32_3 %403 = OpLoad %95 
					                              f32_3 %404 = OpLoad %383 
					                              f32_3 %405 = OpFAdd %403 %404 
					                                             OpStore %95 %405 
					                              f32_2 %407 = OpLoad %52 
					                              f32_2 %409 = OpFMul %407 %408 
					                              f32_4 %410 = OpLoad %9 
					                              f32_2 %411 = OpVectorShuffle %410 %410 0 1 
					                              f32_2 %412 = OpFAdd %409 %411 
					                              f32_4 %413 = OpLoad %406 
					                              f32_4 %414 = OpVectorShuffle %413 %412 4 5 2 3 
					                                             OpStore %406 %414 
					                read_only Texture2D %415 = OpLoad %35 
					                            sampler %416 = OpLoad %39 
					         read_only Texture2DSampled %417 = OpSampledImage %415 %416 
					                              f32_4 %418 = OpLoad %406 
					                              f32_2 %419 = OpVectorShuffle %418 %418 0 1 
					                              f32_4 %420 = OpImageSampleImplicitLod %417 %419 
					                              f32_3 %421 = OpVectorShuffle %420 %420 0 1 2 
					                                             OpStore %383 %421 
					                              f32_3 %422 = OpLoad %383 
					                              f32_3 %423 = OpLoad %383 
					                              f32_3 %424 = OpFMul %422 %423 
					                              f32_3 %425 = OpLoad %47 
					                              f32_3 %426 = OpFAdd %424 %425 
					                                             OpStore %47 %426 
					                              f32_3 %427 = OpLoad %95 
					                              f32_3 %428 = OpLoad %383 
					                              f32_3 %429 = OpFAdd %427 %428 
					                                             OpStore %95 %429 
					                              f32_2 %430 = OpLoad %52 
					                              f32_4 %431 = OpVectorShuffle %430 %430 0 1 0 1 
					                              f32_4 %433 = OpFMul %431 %432 
					                              f32_4 %434 = OpLoad %9 
					                              f32_4 %435 = OpVectorShuffle %434 %434 0 1 0 1 
					                              f32_4 %436 = OpFAdd %433 %435 
					                                             OpStore %406 %436 
					                read_only Texture2D %438 = OpLoad %35 
					                            sampler %439 = OpLoad %39 
					         read_only Texture2DSampled %440 = OpSampledImage %438 %439 
					                              f32_4 %441 = OpLoad %406 
					                              f32_2 %442 = OpVectorShuffle %441 %441 0 1 
					                              f32_4 %443 = OpImageSampleImplicitLod %440 %442 
					                              f32_3 %444 = OpVectorShuffle %443 %443 0 1 2 
					                                             OpStore %437 %444 
					                read_only Texture2D %445 = OpLoad %35 
					                            sampler %446 = OpLoad %39 
					         read_only Texture2DSampled %447 = OpSampledImage %445 %446 
					                              f32_4 %448 = OpLoad %406 
					                              f32_2 %449 = OpVectorShuffle %448 %448 2 3 
					                              f32_4 %450 = OpImageSampleImplicitLod %447 %449 
					                              f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
					                                             OpStore %383 %451 
					                              f32_3 %452 = OpLoad %437 
					                              f32_3 %453 = OpLoad %437 
					                              f32_3 %454 = OpFMul %452 %453 
					                              f32_3 %455 = OpLoad %47 
					                              f32_3 %456 = OpFAdd %454 %455 
					                                             OpStore %47 %456 
					                              f32_3 %457 = OpLoad %95 
					                              f32_3 %458 = OpLoad %437 
					                              f32_3 %459 = OpFAdd %457 %458 
					                                             OpStore %95 %459 
					                              f32_2 %461 = OpLoad %52 
					                              f32_4 %462 = OpVectorShuffle %461 %461 0 1 0 1 
					                              f32_4 %464 = OpFMul %462 %463 
					                              f32_4 %465 = OpLoad %9 
					                              f32_4 %466 = OpVectorShuffle %465 %465 0 1 0 1 
					                              f32_4 %467 = OpFAdd %464 %466 
					                                             OpStore %460 %467 
					                read_only Texture2D %469 = OpLoad %35 
					                            sampler %470 = OpLoad %39 
					         read_only Texture2DSampled %471 = OpSampledImage %469 %470 
					                              f32_4 %472 = OpLoad %460 
					                              f32_2 %473 = OpVectorShuffle %472 %472 0 1 
					                              f32_4 %474 = OpImageSampleImplicitLod %471 %473 
					                              f32_3 %475 = OpVectorShuffle %474 %474 0 1 2 
					                                             OpStore %468 %475 
					                read_only Texture2D %476 = OpLoad %35 
					                            sampler %477 = OpLoad %39 
					         read_only Texture2DSampled %478 = OpSampledImage %476 %477 
					                              f32_4 %479 = OpLoad %460 
					                              f32_2 %480 = OpVectorShuffle %479 %479 2 3 
					                              f32_4 %481 = OpImageSampleImplicitLod %478 %480 
					                              f32_3 %482 = OpVectorShuffle %481 %481 0 1 2 
					                                             OpStore %437 %482 
					                              f32_3 %483 = OpLoad %468 
					                              f32_3 %484 = OpLoad %468 
					                              f32_3 %485 = OpFMul %483 %484 
					                              f32_3 %486 = OpLoad %47 
					                              f32_3 %487 = OpFAdd %485 %486 
					                                             OpStore %47 %487 
					                              f32_3 %488 = OpLoad %95 
					                              f32_3 %489 = OpLoad %468 
					                              f32_3 %490 = OpFAdd %488 %489 
					                                             OpStore %95 %490 
					                              f32_2 %492 = OpLoad %52 
					                              f32_4 %493 = OpVectorShuffle %492 %492 0 1 0 1 
					                              f32_4 %495 = OpFMul %493 %494 
					                              f32_4 %496 = OpLoad %9 
					                              f32_4 %497 = OpVectorShuffle %496 %496 0 1 0 1 
					                              f32_4 %498 = OpFAdd %495 %497 
					                                             OpStore %491 %498 
					                read_only Texture2D %500 = OpLoad %35 
					                            sampler %501 = OpLoad %39 
					         read_only Texture2DSampled %502 = OpSampledImage %500 %501 
					                              f32_4 %503 = OpLoad %491 
					                              f32_2 %504 = OpVectorShuffle %503 %503 0 1 
					                              f32_4 %505 = OpImageSampleImplicitLod %502 %504 
					                              f32_3 %506 = OpVectorShuffle %505 %505 0 1 2 
					                                             OpStore %499 %506 
					                read_only Texture2D %507 = OpLoad %35 
					                            sampler %508 = OpLoad %39 
					         read_only Texture2DSampled %509 = OpSampledImage %507 %508 
					                              f32_4 %510 = OpLoad %491 
					                              f32_2 %511 = OpVectorShuffle %510 %510 2 3 
					                              f32_4 %512 = OpImageSampleImplicitLod %509 %511 
					                              f32_3 %513 = OpVectorShuffle %512 %512 0 1 2 
					                                             OpStore %468 %513 
					                              f32_3 %514 = OpLoad %499 
					                              f32_3 %515 = OpLoad %499 
					                              f32_3 %516 = OpFMul %514 %515 
					                              f32_3 %517 = OpLoad %47 
					                              f32_3 %518 = OpFAdd %516 %517 
					                                             OpStore %47 %518 
					                              f32_3 %519 = OpLoad %95 
					                              f32_3 %520 = OpLoad %499 
					                              f32_3 %521 = OpFAdd %519 %520 
					                                             OpStore %95 %521 
					                              f32_2 %523 = OpLoad %52 
					                              f32_4 %524 = OpVectorShuffle %523 %523 0 1 0 1 
					                              f32_4 %526 = OpFMul %524 %525 
					                              f32_4 %527 = OpLoad %9 
					                              f32_4 %528 = OpVectorShuffle %527 %527 0 1 0 1 
					                              f32_4 %529 = OpFAdd %526 %528 
					                                             OpStore %522 %529 
					                read_only Texture2D %531 = OpLoad %35 
					                            sampler %532 = OpLoad %39 
					         read_only Texture2DSampled %533 = OpSampledImage %531 %532 
					                              f32_4 %534 = OpLoad %522 
					                              f32_2 %535 = OpVectorShuffle %534 %534 0 1 
					                              f32_4 %536 = OpImageSampleImplicitLod %533 %535 
					                              f32_3 %537 = OpVectorShuffle %536 %536 0 1 2 
					                                             OpStore %530 %537 
					                read_only Texture2D %538 = OpLoad %35 
					                            sampler %539 = OpLoad %39 
					         read_only Texture2DSampled %540 = OpSampledImage %538 %539 
					                              f32_4 %541 = OpLoad %522 
					                              f32_2 %542 = OpVectorShuffle %541 %541 2 3 
					                              f32_4 %543 = OpImageSampleImplicitLod %540 %542 
					                              f32_3 %544 = OpVectorShuffle %543 %543 0 1 2 
					                                             OpStore %499 %544 
					                              f32_3 %545 = OpLoad %530 
					                              f32_3 %546 = OpLoad %530 
					                              f32_3 %547 = OpFMul %545 %546 
					                              f32_3 %548 = OpLoad %47 
					                              f32_3 %549 = OpFAdd %547 %548 
					                                             OpStore %47 %549 
					                              f32_3 %550 = OpLoad %95 
					                              f32_3 %551 = OpLoad %530 
					                              f32_3 %552 = OpFAdd %550 %551 
					                                             OpStore %95 %552 
					                              f32_2 %554 = OpLoad %52 
					                              f32_4 %555 = OpVectorShuffle %554 %554 0 1 0 1 
					                              f32_4 %557 = OpFMul %555 %556 
					                              f32_4 %558 = OpLoad %9 
					                              f32_4 %559 = OpVectorShuffle %558 %558 0 1 0 1 
					                              f32_4 %560 = OpFAdd %557 %559 
					                                             OpStore %553 %560 
					                read_only Texture2D %562 = OpLoad %35 
					                            sampler %563 = OpLoad %39 
					         read_only Texture2DSampled %564 = OpSampledImage %562 %563 
					                              f32_4 %565 = OpLoad %553 
					                              f32_2 %566 = OpVectorShuffle %565 %565 0 1 
					                              f32_4 %567 = OpImageSampleImplicitLod %564 %566 
					                              f32_3 %568 = OpVectorShuffle %567 %567 0 1 2 
					                                             OpStore %561 %568 
					                read_only Texture2D %569 = OpLoad %35 
					                            sampler %570 = OpLoad %39 
					         read_only Texture2DSampled %571 = OpSampledImage %569 %570 
					                              f32_4 %572 = OpLoad %553 
					                              f32_2 %573 = OpVectorShuffle %572 %572 2 3 
					                              f32_4 %574 = OpImageSampleImplicitLod %571 %573 
					                              f32_3 %575 = OpVectorShuffle %574 %574 0 1 2 
					                                             OpStore %530 %575 
					                              f32_3 %576 = OpLoad %561 
					                              f32_3 %577 = OpLoad %561 
					                              f32_3 %578 = OpFMul %576 %577 
					                              f32_3 %579 = OpLoad %47 
					                              f32_3 %580 = OpFAdd %578 %579 
					                                             OpStore %47 %580 
					                              f32_3 %581 = OpLoad %95 
					                              f32_3 %582 = OpLoad %561 
					                              f32_3 %583 = OpFAdd %581 %582 
					                                             OpStore %95 %583 
					                              f32_3 %584 = OpLoad %530 
					                              f32_3 %585 = OpLoad %95 
					                              f32_3 %586 = OpFAdd %584 %585 
					                                             OpStore %95 %586 
					                              f32_3 %587 = OpLoad %530 
					                              f32_3 %588 = OpLoad %530 
					                              f32_3 %589 = OpFMul %587 %588 
					                              f32_3 %590 = OpLoad %47 
					                              f32_3 %591 = OpFAdd %589 %590 
					                                             OpStore %47 %591 
					                              f32_2 %592 = OpLoad %52 
					                              f32_4 %593 = OpVectorShuffle %592 %592 0 1 0 1 
					                              f32_4 %595 = OpFMul %593 %594 
					                              f32_4 %596 = OpLoad %9 
					                              f32_4 %597 = OpVectorShuffle %596 %596 0 1 0 1 
					                              f32_4 %598 = OpFAdd %595 %597 
					                                             OpStore %553 %598 
					                read_only Texture2D %599 = OpLoad %35 
					                            sampler %600 = OpLoad %39 
					         read_only Texture2DSampled %601 = OpSampledImage %599 %600 
					                              f32_4 %602 = OpLoad %553 
					                              f32_2 %603 = OpVectorShuffle %602 %602 2 3 
					                              f32_4 %604 = OpImageSampleImplicitLod %601 %603 
					                              f32_3 %605 = OpVectorShuffle %604 %604 0 1 2 
					                                             OpStore %561 %605 
					                read_only Texture2D %606 = OpLoad %35 
					                            sampler %607 = OpLoad %39 
					         read_only Texture2DSampled %608 = OpSampledImage %606 %607 
					                              f32_4 %609 = OpLoad %553 
					                              f32_2 %610 = OpVectorShuffle %609 %609 0 1 
					                              f32_4 %611 = OpImageSampleImplicitLod %608 %610 
					                              f32_3 %612 = OpVectorShuffle %611 %611 0 1 2 
					                                             OpStore %530 %612 
					                              f32_3 %613 = OpLoad %561 
					                              f32_3 %614 = OpLoad %561 
					                              f32_3 %615 = OpFMul %613 %614 
					                              f32_3 %616 = OpLoad %47 
					                              f32_3 %617 = OpFAdd %615 %616 
					                                             OpStore %47 %617 
					                              f32_3 %618 = OpLoad %95 
					                              f32_3 %619 = OpLoad %561 
					                              f32_3 %620 = OpFAdd %618 %619 
					                                             OpStore %95 %620 
					                              f32_2 %622 = OpLoad %52 
					                              f32_4 %623 = OpVectorShuffle %622 %622 0 1 0 1 
					                              f32_4 %625 = OpFMul %623 %624 
					                              f32_4 %626 = OpLoad %9 
					                              f32_4 %627 = OpVectorShuffle %626 %626 0 1 0 1 
					                              f32_4 %628 = OpFAdd %625 %627 
					                                             OpStore %621 %628 
					                read_only Texture2D %630 = OpLoad %35 
					                            sampler %631 = OpLoad %39 
					         read_only Texture2DSampled %632 = OpSampledImage %630 %631 
					                              f32_4 %633 = OpLoad %621 
					                              f32_2 %634 = OpVectorShuffle %633 %633 2 3 
					                              f32_4 %635 = OpImageSampleImplicitLod %632 %634 
					                              f32_3 %636 = OpVectorShuffle %635 %635 0 1 2 
					                                             OpStore %629 %636 
					                read_only Texture2D %637 = OpLoad %35 
					                            sampler %638 = OpLoad %39 
					         read_only Texture2DSampled %639 = OpSampledImage %637 %638 
					                              f32_4 %640 = OpLoad %621 
					                              f32_2 %641 = OpVectorShuffle %640 %640 0 1 
					                              f32_4 %642 = OpImageSampleImplicitLod %639 %641 
					                              f32_3 %643 = OpVectorShuffle %642 %642 0 1 2 
					                                             OpStore %561 %643 
					                              f32_3 %644 = OpLoad %629 
					                              f32_3 %645 = OpLoad %629 
					                              f32_3 %646 = OpFMul %644 %645 
					                              f32_3 %647 = OpLoad %47 
					                              f32_3 %648 = OpFAdd %646 %647 
					                                             OpStore %47 %648 
					                              f32_3 %649 = OpLoad %95 
					                              f32_3 %650 = OpLoad %629 
					                              f32_3 %651 = OpFAdd %649 %650 
					                                             OpStore %95 %651 
					                              f32_2 %653 = OpLoad %52 
					                              f32_4 %654 = OpVectorShuffle %653 %653 0 1 0 1 
					                              f32_4 %656 = OpFMul %654 %655 
					                              f32_4 %657 = OpLoad %9 
					                              f32_4 %658 = OpVectorShuffle %657 %657 0 1 0 1 
					                              f32_4 %659 = OpFAdd %656 %658 
					                                             OpStore %652 %659 
					                read_only Texture2D %661 = OpLoad %35 
					                            sampler %662 = OpLoad %39 
					         read_only Texture2DSampled %663 = OpSampledImage %661 %662 
					                              f32_4 %664 = OpLoad %652 
					                              f32_2 %665 = OpVectorShuffle %664 %664 2 3 
					                              f32_4 %666 = OpImageSampleImplicitLod %663 %665 
					                              f32_3 %667 = OpVectorShuffle %666 %666 0 1 2 
					                                             OpStore %660 %667 
					                read_only Texture2D %668 = OpLoad %35 
					                            sampler %669 = OpLoad %39 
					         read_only Texture2DSampled %670 = OpSampledImage %668 %669 
					                              f32_4 %671 = OpLoad %652 
					                              f32_2 %672 = OpVectorShuffle %671 %671 0 1 
					                              f32_4 %673 = OpImageSampleImplicitLod %670 %672 
					                              f32_3 %674 = OpVectorShuffle %673 %673 0 1 2 
					                                             OpStore %629 %674 
					                              f32_3 %675 = OpLoad %660 
					                              f32_3 %676 = OpLoad %660 
					                              f32_3 %677 = OpFMul %675 %676 
					                              f32_3 %678 = OpLoad %47 
					                              f32_3 %679 = OpFAdd %677 %678 
					                                             OpStore %47 %679 
					                              f32_3 %680 = OpLoad %95 
					                              f32_3 %681 = OpLoad %660 
					                              f32_3 %682 = OpFAdd %680 %681 
					                                             OpStore %95 %682 
					                              f32_2 %684 = OpLoad %52 
					                              f32_4 %685 = OpVectorShuffle %684 %684 0 1 0 1 
					                              f32_4 %687 = OpFMul %685 %686 
					                              f32_4 %688 = OpLoad %9 
					                              f32_4 %689 = OpVectorShuffle %688 %688 0 1 0 1 
					                              f32_4 %690 = OpFAdd %687 %689 
					                                             OpStore %683 %690 
					                read_only Texture2D %692 = OpLoad %35 
					                            sampler %693 = OpLoad %39 
					         read_only Texture2DSampled %694 = OpSampledImage %692 %693 
					                              f32_4 %695 = OpLoad %683 
					                              f32_2 %696 = OpVectorShuffle %695 %695 2 3 
					                              f32_4 %697 = OpImageSampleImplicitLod %694 %696 
					                              f32_3 %698 = OpVectorShuffle %697 %697 0 1 2 
					                                             OpStore %691 %698 
					                read_only Texture2D %699 = OpLoad %35 
					                            sampler %700 = OpLoad %39 
					         read_only Texture2DSampled %701 = OpSampledImage %699 %700 
					                              f32_4 %702 = OpLoad %683 
					                              f32_2 %703 = OpVectorShuffle %702 %702 0 1 
					                              f32_4 %704 = OpImageSampleImplicitLod %701 %703 
					                              f32_3 %705 = OpVectorShuffle %704 %704 0 1 2 
					                                             OpStore %660 %705 
					                              f32_3 %706 = OpLoad %691 
					                              f32_3 %707 = OpLoad %691 
					                              f32_3 %708 = OpFMul %706 %707 
					                              f32_3 %709 = OpLoad %47 
					                              f32_3 %710 = OpFAdd %708 %709 
					                                             OpStore %47 %710 
					                              f32_3 %711 = OpLoad %95 
					                              f32_3 %712 = OpLoad %691 
					                              f32_3 %713 = OpFAdd %711 %712 
					                                             OpStore %95 %713 
					                              f32_2 %715 = OpLoad %52 
					                              f32_4 %716 = OpVectorShuffle %715 %715 0 1 0 1 
					                              f32_4 %718 = OpFMul %716 %717 
					                              f32_4 %719 = OpLoad %9 
					                              f32_4 %720 = OpVectorShuffle %719 %719 0 1 0 1 
					                              f32_4 %721 = OpFAdd %718 %720 
					                                             OpStore %714 %721 
					                read_only Texture2D %723 = OpLoad %35 
					                            sampler %724 = OpLoad %39 
					         read_only Texture2DSampled %725 = OpSampledImage %723 %724 
					                              f32_4 %726 = OpLoad %714 
					                              f32_2 %727 = OpVectorShuffle %726 %726 2 3 
					                              f32_4 %728 = OpImageSampleImplicitLod %725 %727 
					                              f32_3 %729 = OpVectorShuffle %728 %728 0 1 2 
					                                             OpStore %722 %729 
					                read_only Texture2D %730 = OpLoad %35 
					                            sampler %731 = OpLoad %39 
					         read_only Texture2DSampled %732 = OpSampledImage %730 %731 
					                              f32_4 %733 = OpLoad %714 
					                              f32_2 %734 = OpVectorShuffle %733 %733 0 1 
					                              f32_4 %735 = OpImageSampleImplicitLod %732 %734 
					                              f32_3 %736 = OpVectorShuffle %735 %735 0 1 2 
					                                             OpStore %691 %736 
					                              f32_3 %737 = OpLoad %722 
					                              f32_3 %738 = OpLoad %722 
					                              f32_3 %739 = OpFMul %737 %738 
					                              f32_3 %740 = OpLoad %47 
					                              f32_3 %741 = OpFAdd %739 %740 
					                                             OpStore %47 %741 
					                              f32_3 %742 = OpLoad %95 
					                              f32_3 %743 = OpLoad %722 
					                              f32_3 %744 = OpFAdd %742 %743 
					                                             OpStore %95 %744 
					                              f32_2 %746 = OpLoad %52 
					                              f32_2 %748 = OpFMul %746 %747 
					                              f32_4 %749 = OpLoad %9 
					                              f32_2 %750 = OpVectorShuffle %749 %749 0 1 
					                              f32_2 %751 = OpFAdd %748 %750 
					                              f32_3 %752 = OpLoad %745 
					                              f32_3 %753 = OpVectorShuffle %752 %751 3 4 2 
					                                             OpStore %745 %753 
					                read_only Texture2D %754 = OpLoad %35 
					                            sampler %755 = OpLoad %39 
					         read_only Texture2DSampled %756 = OpSampledImage %754 %755 
					                              f32_3 %757 = OpLoad %745 
					                              f32_2 %758 = OpVectorShuffle %757 %757 0 1 
					                              f32_4 %759 = OpImageSampleImplicitLod %756 %758 
					                              f32_3 %760 = OpVectorShuffle %759 %759 0 1 2 
					                                             OpStore %722 %760 
					                              f32_3 %761 = OpLoad %722 
					                              f32_3 %762 = OpLoad %722 
					                              f32_3 %763 = OpFMul %761 %762 
					                              f32_3 %764 = OpLoad %47 
					                              f32_3 %765 = OpFAdd %763 %764 
					                                             OpStore %47 %765 
					                              f32_3 %766 = OpLoad %95 
					                              f32_3 %767 = OpLoad %722 
					                              f32_3 %768 = OpFAdd %766 %767 
					                                             OpStore %95 %768 
					                              f32_3 %770 = OpLoad %95 
					                              f32_3 %773 = OpFMul %770 %772 
					                              f32_4 %774 = OpLoad %769 
					                              f32_4 %775 = OpVectorShuffle %774 %773 4 5 6 3 
					                                             OpStore %769 %775 
					                              f32_4 %776 = OpLoad %769 
					                              f32_3 %777 = OpVectorShuffle %776 %776 0 1 2 
					                              f32_4 %778 = OpLoad %769 
					                              f32_3 %779 = OpVectorShuffle %778 %778 0 1 2 
					                              f32_3 %780 = OpFMul %777 %779 
					                                             OpStore %745 %780 
					                              f32_3 %782 = OpLoad %47 
					                              f32_3 %783 = OpFMul %782 %772 
					                              f32_3 %784 = OpLoad %745 
					                              f32_3 %785 = OpFNegate %784 
					                              f32_3 %786 = OpFAdd %783 %785 
					                              f32_4 %787 = OpLoad %781 
					                              f32_4 %788 = OpVectorShuffle %787 %786 4 5 6 3 
					                                             OpStore %781 %788 
					                       Private f32* %793 = OpAccessChain %781 %792 
					                                f32 %794 = OpLoad %793 
					                                f32 %795 = OpExtInst %1 4 %794 
					                       Private f32* %797 = OpAccessChain %781 %796 
					                                f32 %798 = OpLoad %797 
					                                f32 %799 = OpExtInst %1 4 %798 
					                                f32 %800 = OpFAdd %795 %799 
					                                             OpStore %790 %800 
					                       Private f32* %802 = OpAccessChain %781 %801 
					                                f32 %803 = OpLoad %802 
					                                f32 %804 = OpExtInst %1 4 %803 
					                                f32 %805 = OpLoad %790 
					                                f32 %806 = OpFAdd %804 %805 
					                                             OpStore %790 %806 
					                              f32_2 %807 = OpLoad %52 
					                              f32_4 %808 = OpVectorShuffle %807 %807 0 1 0 1 
					                              f32_4 %810 = OpFMul %808 %809 
					                              f32_4 %811 = OpLoad %9 
					                              f32_4 %812 = OpVectorShuffle %811 %811 0 1 0 1 
					                              f32_4 %813 = OpFAdd %810 %812 
					                                             OpStore %781 %813 
					                              f32_2 %814 = OpLoad %52 
					                              f32_2 %815 = OpFNegate %814 
					                              f32_4 %816 = OpLoad %9 
					                              f32_2 %817 = OpVectorShuffle %816 %816 0 1 
					                              f32_2 %818 = OpFAdd %815 %817 
					                              f32_4 %819 = OpLoad %9 
					                              f32_4 %820 = OpVectorShuffle %819 %818 4 5 2 3 
					                                             OpStore %9 %820 
					                read_only Texture2D %822 = OpLoad %35 
					                            sampler %823 = OpLoad %39 
					         read_only Texture2DSampled %824 = OpSampledImage %822 %823 
					                              f32_4 %825 = OpLoad %9 
					                              f32_2 %826 = OpVectorShuffle %825 %825 0 1 
					                              f32_4 %827 = OpImageSampleImplicitLod %824 %826 
					                              f32_3 %828 = OpVectorShuffle %827 %827 0 1 2 
					                                             OpStore %821 %828 
					                read_only Texture2D %829 = OpLoad %35 
					                            sampler %830 = OpLoad %39 
					         read_only Texture2DSampled %831 = OpSampledImage %829 %830 
					                              f32_4 %832 = OpLoad %781 
					                              f32_2 %833 = OpVectorShuffle %832 %832 0 1 
					                              f32_4 %834 = OpImageSampleImplicitLod %831 %833 
					                              f32_3 %835 = OpVectorShuffle %834 %834 0 1 2 
					                                             OpStore %722 %835 
					                read_only Texture2D %837 = OpLoad %35 
					                            sampler %838 = OpLoad %39 
					         read_only Texture2DSampled %839 = OpSampledImage %837 %838 
					                              f32_4 %840 = OpLoad %781 
					                              f32_2 %841 = OpVectorShuffle %840 %840 2 3 
					                              f32_4 %842 = OpImageSampleImplicitLod %839 %841 
					                              f32_3 %843 = OpVectorShuffle %842 %842 0 1 2 
					                                             OpStore %836 %843 
					                              f32_3 %845 = OpLoad %836 
					                              f32_3 %846 = OpLoad %836 
					                              f32_3 %847 = OpFMul %845 %846 
					                                             OpStore %844 %847 
					                              f32_3 %848 = OpLoad %722 
					                              f32_3 %849 = OpLoad %722 
					                              f32_3 %850 = OpFMul %848 %849 
					                              f32_3 %851 = OpLoad %844 
					                              f32_3 %852 = OpFAdd %850 %851 
					                                             OpStore %844 %852 
					                              f32_3 %854 = OpLoad %836 
					                              f32_3 %855 = OpLoad %722 
					                              f32_3 %856 = OpFAdd %854 %855 
					                                             OpStore %853 %856 
					                              f32_3 %857 = OpLoad %82 
					                              f32_3 %858 = OpLoad %853 
					                              f32_3 %859 = OpFAdd %857 %858 
					                                             OpStore %853 %859 
					                              f32_3 %861 = OpLoad %82 
					                              f32_3 %862 = OpLoad %82 
					                              f32_3 %863 = OpFMul %861 %862 
					                              f32_3 %864 = OpLoad %844 
					                              f32_3 %865 = OpFAdd %863 %864 
					                                             OpStore %860 %865 
					                              f32_3 %866 = OpLoad %118 
					                              f32_3 %867 = OpLoad %118 
					                              f32_3 %868 = OpFMul %866 %867 
					                              f32_3 %869 = OpLoad %860 
					                              f32_3 %870 = OpFAdd %868 %869 
					                                             OpStore %860 %870 
					                              f32_3 %872 = OpLoad %118 
					                              f32_3 %873 = OpLoad %853 
					                              f32_3 %874 = OpFAdd %872 %873 
					                                             OpStore %871 %874 
					                              f32_3 %875 = OpLoad %110 
					                              f32_3 %876 = OpLoad %871 
					                              f32_3 %877 = OpFAdd %875 %876 
					                                             OpStore %871 %877 
					                              f32_3 %878 = OpLoad %110 
					                              f32_3 %879 = OpLoad %110 
					                              f32_3 %880 = OpFMul %878 %879 
					                              f32_3 %881 = OpLoad %860 
					                              f32_3 %882 = OpFAdd %880 %881 
					                                             OpStore %860 %882 
					                              f32_3 %883 = OpLoad %143 
					                              f32_3 %884 = OpLoad %143 
					                              f32_3 %885 = OpFMul %883 %884 
					                              f32_3 %886 = OpLoad %860 
					                              f32_3 %887 = OpFAdd %885 %886 
					                                             OpStore %860 %887 
					                              f32_3 %888 = OpLoad %143 
					                              f32_3 %889 = OpLoad %871 
					                              f32_3 %890 = OpFAdd %888 %889 
					                                             OpStore %871 %890 
					                              f32_3 %891 = OpLoad %836 
					                              f32_3 %892 = OpLoad %871 
					                              f32_3 %893 = OpFAdd %891 %892 
					                                             OpStore %871 %893 
					                              f32_3 %894 = OpLoad %836 
					                              f32_3 %895 = OpLoad %836 
					                              f32_3 %896 = OpFMul %894 %895 
					                              f32_3 %897 = OpLoad %860 
					                              f32_3 %898 = OpFAdd %896 %897 
					                                             OpStore %47 %898 
					                              f32_3 %899 = OpLoad %176 
					                              f32_3 %900 = OpLoad %176 
					                              f32_3 %901 = OpFMul %899 %900 
					                              f32_3 %902 = OpLoad %47 
					                              f32_3 %903 = OpFAdd %901 %902 
					                                             OpStore %47 %903 
					                              f32_3 %904 = OpLoad %207 
					                              f32_3 %905 = OpLoad %207 
					                              f32_3 %906 = OpFMul %904 %905 
					                              f32_3 %907 = OpLoad %47 
					                              f32_3 %908 = OpFAdd %906 %907 
					                                             OpStore %47 %908 
					                              f32_3 %909 = OpLoad %259 
					                              f32_3 %910 = OpLoad %259 
					                              f32_3 %911 = OpFMul %909 %910 
					                              f32_3 %912 = OpLoad %47 
					                              f32_3 %913 = OpFAdd %911 %912 
					                                             OpStore %47 %913 
					                              f32_3 %914 = OpLoad %290 
					                              f32_3 %915 = OpLoad %290 
					                              f32_3 %916 = OpFMul %914 %915 
					                              f32_3 %917 = OpLoad %47 
					                              f32_3 %918 = OpFAdd %916 %917 
					                                             OpStore %47 %918 
					                              f32_3 %919 = OpLoad %321 
					                              f32_3 %920 = OpLoad %321 
					                              f32_3 %921 = OpFMul %919 %920 
					                              f32_3 %922 = OpLoad %47 
					                              f32_3 %923 = OpFAdd %921 %922 
					                                             OpStore %47 %923 
					                              f32_3 %924 = OpLoad %176 
					                              f32_3 %925 = OpLoad %176 
					                              f32_3 %926 = OpFMul %924 %925 
					                              f32_3 %927 = OpLoad %47 
					                              f32_3 %928 = OpFAdd %926 %927 
					                                             OpStore %47 %928 
					                              f32_3 %929 = OpLoad %352 
					                              f32_3 %930 = OpLoad %352 
					                              f32_3 %931 = OpFMul %929 %930 
					                              f32_3 %932 = OpLoad %47 
					                              f32_3 %933 = OpFAdd %931 %932 
					                                             OpStore %47 %933 
					                              f32_3 %934 = OpLoad %383 
					                              f32_3 %935 = OpLoad %383 
					                              f32_3 %936 = OpFMul %934 %935 
					                              f32_3 %937 = OpLoad %47 
					                              f32_3 %938 = OpFAdd %936 %937 
					                                             OpStore %47 %938 
					                              f32_3 %939 = OpLoad %437 
					                              f32_3 %940 = OpLoad %437 
					                              f32_3 %941 = OpFMul %939 %940 
					                              f32_3 %942 = OpLoad %47 
					                              f32_3 %943 = OpFAdd %941 %942 
					                                             OpStore %47 %943 
					                              f32_3 %944 = OpLoad %468 
					                              f32_3 %945 = OpLoad %468 
					                              f32_3 %946 = OpFMul %944 %945 
					                              f32_3 %947 = OpLoad %47 
					                              f32_3 %948 = OpFAdd %946 %947 
					                                             OpStore %47 %948 
					                              f32_3 %949 = OpLoad %499 
					                              f32_3 %950 = OpLoad %499 
					                              f32_3 %951 = OpFMul %949 %950 
					                              f32_3 %952 = OpLoad %47 
					                              f32_3 %953 = OpFAdd %951 %952 
					                                             OpStore %47 %953 
					                              f32_3 %954 = OpLoad %821 
					                              f32_3 %955 = OpLoad %821 
					                              f32_3 %956 = OpFMul %954 %955 
					                              f32_3 %957 = OpLoad %47 
					                              f32_3 %958 = OpFAdd %956 %957 
					                                             OpStore %47 %958 
					                              f32_3 %959 = OpLoad %530 
					                              f32_3 %960 = OpLoad %530 
					                              f32_3 %961 = OpFMul %959 %960 
					                              f32_3 %962 = OpLoad %47 
					                              f32_3 %963 = OpFAdd %961 %962 
					                                             OpStore %47 %963 
					                              f32_3 %964 = OpLoad %561 
					                              f32_3 %965 = OpLoad %561 
					                              f32_3 %966 = OpFMul %964 %965 
					                              f32_3 %967 = OpLoad %47 
					                              f32_3 %968 = OpFAdd %966 %967 
					                                             OpStore %47 %968 
					                              f32_3 %969 = OpLoad %629 
					                              f32_3 %970 = OpLoad %629 
					                              f32_3 %971 = OpFMul %969 %970 
					                              f32_3 %972 = OpLoad %47 
					                              f32_3 %973 = OpFAdd %971 %972 
					                                             OpStore %47 %973 
					                              f32_3 %974 = OpLoad %660 
					                              f32_3 %975 = OpLoad %660 
					                              f32_3 %976 = OpFMul %974 %975 
					                              f32_3 %977 = OpLoad %47 
					                              f32_3 %978 = OpFAdd %976 %977 
					                                             OpStore %47 %978 
					                              f32_3 %979 = OpLoad %691 
					                              f32_3 %980 = OpLoad %691 
					                              f32_3 %981 = OpFMul %979 %980 
					                              f32_3 %982 = OpLoad %47 
					                              f32_3 %983 = OpFAdd %981 %982 
					                                             OpStore %47 %983 
					                              f32_3 %984 = OpLoad %32 
					                              f32_3 %985 = OpLoad %32 
					                              f32_3 %986 = OpFMul %984 %985 
					                              f32_3 %987 = OpLoad %47 
					                              f32_3 %988 = OpFAdd %986 %987 
					                                             OpStore %47 %988 
					                              f32_3 %989 = OpLoad %176 
					                              f32_3 %990 = OpLoad %871 
					                              f32_3 %991 = OpFAdd %989 %990 
					                                             OpStore %860 %991 
					                              f32_3 %992 = OpLoad %207 
					                              f32_3 %993 = OpLoad %860 
					                              f32_3 %994 = OpFAdd %992 %993 
					                                             OpStore %860 %994 
					                              f32_3 %995 = OpLoad %259 
					                              f32_3 %996 = OpLoad %860 
					                              f32_3 %997 = OpFAdd %995 %996 
					                                             OpStore %860 %997 
					                              f32_3 %998 = OpLoad %290 
					                              f32_3 %999 = OpLoad %860 
					                             f32_3 %1000 = OpFAdd %998 %999 
					                                             OpStore %860 %1000 
					                             f32_3 %1001 = OpLoad %321 
					                             f32_3 %1002 = OpLoad %860 
					                             f32_3 %1003 = OpFAdd %1001 %1002 
					                                             OpStore %860 %1003 
					                             f32_3 %1004 = OpLoad %176 
					                             f32_3 %1005 = OpLoad %860 
					                             f32_3 %1006 = OpFAdd %1004 %1005 
					                                             OpStore %860 %1006 
					                             f32_3 %1007 = OpLoad %352 
					                             f32_3 %1008 = OpLoad %860 
					                             f32_3 %1009 = OpFAdd %1007 %1008 
					                                             OpStore %860 %1009 
					                             f32_3 %1010 = OpLoad %383 
					                             f32_3 %1011 = OpLoad %860 
					                             f32_3 %1012 = OpFAdd %1010 %1011 
					                                             OpStore %860 %1012 
					                             f32_3 %1013 = OpLoad %437 
					                             f32_3 %1014 = OpLoad %860 
					                             f32_3 %1015 = OpFAdd %1013 %1014 
					                                             OpStore %860 %1015 
					                             f32_3 %1016 = OpLoad %468 
					                             f32_3 %1017 = OpLoad %860 
					                             f32_3 %1018 = OpFAdd %1016 %1017 
					                                             OpStore %860 %1018 
					                             f32_3 %1019 = OpLoad %499 
					                             f32_3 %1020 = OpLoad %860 
					                             f32_3 %1021 = OpFAdd %1019 %1020 
					                                             OpStore %860 %1021 
					                             f32_3 %1023 = OpLoad %821 
					                             f32_3 %1024 = OpLoad %860 
					                             f32_3 %1025 = OpFAdd %1023 %1024 
					                                             OpStore %1022 %1025 
					                             f32_3 %1026 = OpLoad %530 
					                             f32_3 %1027 = OpLoad %1022 
					                             f32_3 %1028 = OpFAdd %1026 %1027 
					                                             OpStore %1022 %1028 
					                             f32_3 %1029 = OpLoad %561 
					                             f32_3 %1030 = OpLoad %1022 
					                             f32_3 %1031 = OpFAdd %1029 %1030 
					                                             OpStore %1022 %1031 
					                             f32_3 %1032 = OpLoad %629 
					                             f32_3 %1033 = OpLoad %1022 
					                             f32_3 %1034 = OpFAdd %1032 %1033 
					                                             OpStore %1022 %1034 
					                             f32_3 %1035 = OpLoad %660 
					                             f32_3 %1036 = OpLoad %1022 
					                             f32_3 %1037 = OpFAdd %1035 %1036 
					                                             OpStore %1022 %1037 
					                             f32_3 %1038 = OpLoad %691 
					                             f32_3 %1039 = OpLoad %1022 
					                             f32_3 %1040 = OpFAdd %1038 %1039 
					                                             OpStore %1022 %1040 
					                             f32_3 %1041 = OpLoad %32 
					                             f32_3 %1042 = OpLoad %1022 
					                             f32_3 %1043 = OpFAdd %1041 %1042 
					                                             OpStore %1022 %1043 
					                             f32_3 %1044 = OpLoad %1022 
					                             f32_3 %1045 = OpFMul %1044 %772 
					                             f32_4 %1046 = OpLoad %9 
					                             f32_4 %1047 = OpVectorShuffle %1046 %1045 4 5 6 3 
					                                             OpStore %9 %1047 
					                             f32_4 %1049 = OpLoad %9 
					                             f32_3 %1050 = OpVectorShuffle %1049 %1049 0 1 2 
					                             f32_4 %1051 = OpLoad %9 
					                             f32_3 %1052 = OpVectorShuffle %1051 %1051 0 1 2 
					                             f32_3 %1053 = OpFMul %1050 %1052 
					                                             OpStore %1048 %1053 
					                             f32_3 %1054 = OpLoad %47 
					                             f32_3 %1055 = OpFMul %1054 %772 
					                             f32_3 %1056 = OpLoad %1048 
					                             f32_3 %1057 = OpFNegate %1056 
					                             f32_3 %1058 = OpFAdd %1055 %1057 
					                                             OpStore %1048 %1058 
					                      Private f32* %1059 = OpAccessChain %1048 %792 
					                               f32 %1060 = OpLoad %1059 
					                               f32 %1061 = OpExtInst %1 4 %1060 
					                      Private f32* %1062 = OpAccessChain %1048 %796 
					                               f32 %1063 = OpLoad %1062 
					                               f32 %1064 = OpExtInst %1 4 %1063 
					                               f32 %1065 = OpFAdd %1061 %1064 
					                      Private f32* %1066 = OpAccessChain %1048 %796 
					                                             OpStore %1066 %1065 
					                      Private f32* %1067 = OpAccessChain %1048 %801 
					                               f32 %1068 = OpLoad %1067 
					                               f32 %1069 = OpExtInst %1 4 %1068 
					                      Private f32* %1070 = OpAccessChain %1048 %796 
					                               f32 %1071 = OpLoad %1070 
					                               f32 %1072 = OpFAdd %1069 %1071 
					                      Private f32* %1073 = OpAccessChain %1048 %796 
					                                             OpStore %1073 %1072 
					                      Private f32* %1075 = OpAccessChain %1048 %796 
					                               f32 %1076 = OpLoad %1075 
					                               f32 %1078 = OpExtInst %1 37 %1076 %1077 
					                                             OpStore %1074 %1078 
					                      Private f32* %1082 = OpAccessChain %1048 %796 
					                               f32 %1083 = OpLoad %1082 
					                              bool %1084 = OpFOrdLessThan %1083 %1077 
					                                             OpStore %1081 %1084 
					                               f32 %1086 = OpLoad %790 
					                               f32 %1087 = OpLoad %1074 
					                              bool %1088 = OpFOrdLessThan %1086 %1087 
					                                             OpStore %1085 %1088 
					                      Private f32* %1090 = OpAccessChain %9 %1089 
					                                             OpStore %1090 %66 
					                             f32_4 %1092 = OpLoad %9 
					                              bool %1093 = OpLoad %1081 
					                            bool_4 %1095 = OpCompositeConstruct %1093 %1093 %1093 %1093 
					                             f32_4 %1097 = OpSelect %1095 %1096 %1091 
					                             f32_4 %1098 = OpExtInst %1 46 %1091 %1092 %1097 
					                                             OpStore %9 %1098 
					                      Private f32* %1099 = OpAccessChain %769 %1089 
					                                             OpStore %1099 %66 
					                              bool %1102 = OpLoad %1085 
					                             f32_4 %1103 = OpLoad %769 
					                             f32_4 %1104 = OpLoad %9 
					                            bool_4 %1105 = OpCompositeConstruct %1102 %1102 %1102 %1102 
					                             f32_4 %1106 = OpSelect %1105 %1103 %1104 
					                                             OpStore %1101 %1106 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
						float _Value;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec4 u_xlat10_9;
					vec4 u_xlat10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec4 u_xlat10_11;
					vec4 u_xlat12;
					vec4 u_xlat10_12;
					vec4 u_xlat13;
					vec4 u_xlat10_13;
					vec4 u_xlat14;
					vec4 u_xlat10_14;
					vec4 u_xlat15;
					vec4 u_xlat10_15;
					vec4 u_xlat16;
					vec4 u_xlat10_16;
					vec4 u_xlat17;
					vec4 u_xlat10_17;
					vec4 u_xlat18;
					vec4 u_xlat10_18;
					vec4 u_xlat19;
					vec4 u_xlat10_19;
					vec4 u_xlat20;
					vec4 u_xlat10_20;
					vec4 u_xlat21;
					vec4 u_xlat10_21;
					vec4 u_xlat22;
					vec4 u_xlat10_22;
					vec3 u_xlat23;
					vec3 u_xlat16_23;
					vec4 u_xlat10_23;
					vec3 u_xlat16_24;
					float u_xlat26;
					bool u_xlatb26;
					vec2 u_xlat50;
					float u_xlat76;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
					    u_xlat50.xy = vec2(_Value) / _ScreenResolution.xy;
					    u_xlat3 = u_xlat50.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat10_4.xyz;
					    u_xlat5 = u_xlat50.xyxy * vec4(2.0, 0.0, -1.0, -4.0) + u_xlat0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_2.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_6.xyz;
					    u_xlat6 = u_xlat50.xyxy * vec4(3.0, 0.0, 0.0, -4.0) + u_xlat0.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_2.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_7.xyz;
					    u_xlat7 = u_xlat50.xyxy * vec4(4.0, 0.0, -4.0, -3.0) + u_xlat0.xyxy;
					    u_xlat10_8 = texture(_MainTex, u_xlat7.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat7.zw);
					    u_xlat16_2.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_8.xyz;
					    u_xlat8 = u_xlat50.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + u_xlat0.xyxy;
					    u_xlat10_9 = texture(_MainTex, u_xlat8.xy);
					    u_xlat10_8 = texture(_MainTex, u_xlat8.zw);
					    u_xlat16_2.xyz = u_xlat10_9.xyz * u_xlat10_9.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_9.xyz;
					    u_xlat9.xy = u_xlat50.xy + u_xlat0.xy;
					    u_xlat10_9 = texture(_MainTex, u_xlat9.xy);
					    u_xlat16_2.xyz = u_xlat10_9.xyz * u_xlat10_9.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_9.xyz;
					    u_xlat9 = u_xlat50.xyxy * vec4(2.0, 1.0, -1.0, -3.0) + u_xlat0.xyxy;
					    u_xlat10_10 = texture(_MainTex, u_xlat9.xy);
					    u_xlat10_9 = texture(_MainTex, u_xlat9.zw);
					    u_xlat16_2.xyz = u_xlat10_10.xyz * u_xlat10_10.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_10.xyz;
					    u_xlat10 = u_xlat50.xyxy * vec4(3.0, 1.0, 0.0, -3.0) + u_xlat0.xyxy;
					    u_xlat10_11 = texture(_MainTex, u_xlat10.xy);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.zw);
					    u_xlat16_2.xyz = u_xlat10_11.xyz * u_xlat10_11.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_11.xyz;
					    u_xlat11 = u_xlat50.xyxy * vec4(4.0, 1.0, -4.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_12 = texture(_MainTex, u_xlat11.xy);
					    u_xlat10_11 = texture(_MainTex, u_xlat11.zw);
					    u_xlat16_2.xyz = u_xlat10_12.xyz * u_xlat10_12.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_12.xyz;
					    u_xlat12 = u_xlat50.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_13 = texture(_MainTex, u_xlat12.xy);
					    u_xlat10_12 = texture(_MainTex, u_xlat12.zw);
					    u_xlat16_2.xyz = u_xlat10_13.xyz * u_xlat10_13.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_13.xyz;
					    u_xlat13 = u_xlat50.xyxy * vec4(1.0, 2.0, -1.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_14 = texture(_MainTex, u_xlat13.xy);
					    u_xlat10_13 = texture(_MainTex, u_xlat13.zw);
					    u_xlat16_2.xyz = u_xlat10_14.xyz * u_xlat10_14.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_14.xyz;
					    u_xlat14.xy = u_xlat50.xy * vec2(2.0, 2.0) + u_xlat0.xy;
					    u_xlat10_14 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_2.xyz = u_xlat10_14.xyz * u_xlat10_14.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_14.xyz;
					    u_xlat14 = u_xlat50.xyxy * vec4(3.0, 2.0, 0.0, -2.0) + u_xlat0.xyxy;
					    u_xlat10_15 = texture(_MainTex, u_xlat14.xy);
					    u_xlat10_14 = texture(_MainTex, u_xlat14.zw);
					    u_xlat16_2.xyz = u_xlat10_15.xyz * u_xlat10_15.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_15.xyz;
					    u_xlat15 = u_xlat50.xyxy * vec4(4.0, 2.0, -4.0, -1.0) + u_xlat0.xyxy;
					    u_xlat10_16 = texture(_MainTex, u_xlat15.xy);
					    u_xlat10_15 = texture(_MainTex, u_xlat15.zw);
					    u_xlat16_2.xyz = u_xlat10_16.xyz * u_xlat10_16.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_16.xyz;
					    u_xlat16 = u_xlat50.xyxy * vec4(0.0, 3.0, -3.0, -1.0) + u_xlat0.xyxy;
					    u_xlat10_17 = texture(_MainTex, u_xlat16.xy);
					    u_xlat10_16 = texture(_MainTex, u_xlat16.zw);
					    u_xlat16_2.xyz = u_xlat10_17.xyz * u_xlat10_17.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_17.xyz;
					    u_xlat17 = u_xlat50.xyxy * vec4(1.0, 3.0, -2.0, -1.0) + u_xlat0.xyxy;
					    u_xlat10_18 = texture(_MainTex, u_xlat17.xy);
					    u_xlat10_17 = texture(_MainTex, u_xlat17.zw);
					    u_xlat16_2.xyz = u_xlat10_18.xyz * u_xlat10_18.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_18.xyz;
					    u_xlat18 = u_xlat50.xyxy * vec4(2.0, 3.0, 3.0, 3.0) + u_xlat0.xyxy;
					    u_xlat10_19 = texture(_MainTex, u_xlat18.xy);
					    u_xlat10_18 = texture(_MainTex, u_xlat18.zw);
					    u_xlat16_2.xyz = u_xlat10_19.xyz * u_xlat10_19.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_19.xyz;
					    u_xlat16_4.xyz = u_xlat10_18.xyz + u_xlat16_4.xyz;
					    u_xlat16_2.xyz = u_xlat10_18.xyz * u_xlat10_18.xyz + u_xlat16_2.xyz;
					    u_xlat18 = u_xlat50.xyxy * vec4(0.0, -1.0, 4.0, 3.0) + u_xlat0.xyxy;
					    u_xlat10_19 = texture(_MainTex, u_xlat18.zw);
					    u_xlat10_18 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_2.xyz = u_xlat10_19.xyz * u_xlat10_19.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_19.xyz;
					    u_xlat19 = u_xlat50.xyxy * vec4(-4.0, 0.0, 0.0, 4.0) + u_xlat0.xyxy;
					    u_xlat10_20 = texture(_MainTex, u_xlat19.zw);
					    u_xlat10_19 = texture(_MainTex, u_xlat19.xy);
					    u_xlat16_2.xyz = u_xlat10_20.xyz * u_xlat10_20.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_20.xyz;
					    u_xlat20 = u_xlat50.xyxy * vec4(-3.0, 0.0, 1.0, 4.0) + u_xlat0.xyxy;
					    u_xlat10_21 = texture(_MainTex, u_xlat20.zw);
					    u_xlat10_20 = texture(_MainTex, u_xlat20.xy);
					    u_xlat16_2.xyz = u_xlat10_21.xyz * u_xlat10_21.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_21.xyz;
					    u_xlat21 = u_xlat50.xyxy * vec4(-2.0, 0.0, 2.0, 4.0) + u_xlat0.xyxy;
					    u_xlat10_22 = texture(_MainTex, u_xlat21.zw);
					    u_xlat10_21 = texture(_MainTex, u_xlat21.xy);
					    u_xlat16_2.xyz = u_xlat10_22.xyz * u_xlat10_22.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_22.xyz;
					    u_xlat22 = u_xlat50.xyxy * vec4(-1.0, 0.0, 3.0, 4.0) + u_xlat0.xyxy;
					    u_xlat10_23 = texture(_MainTex, u_xlat22.zw);
					    u_xlat10_22 = texture(_MainTex, u_xlat22.xy);
					    u_xlat16_2.xyz = u_xlat10_23.xyz * u_xlat10_23.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_23.xyz;
					    u_xlat23.xy = u_xlat50.xy * vec2(4.0, 4.0) + u_xlat0.xy;
					    u_xlat10_23 = texture(_MainTex, u_xlat23.xy);
					    u_xlat16_2.xyz = u_xlat10_23.xyz * u_xlat10_23.xyz + u_xlat16_2.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_23.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991);
					    u_xlat23.xyz = u_xlat4.xyz * u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + (-u_xlat23.xyz);
					    u_xlat76 = abs(u_xlat2.y) + abs(u_xlat2.x);
					    u_xlat76 = abs(u_xlat2.z) + u_xlat76;
					    u_xlat2 = u_xlat50.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + u_xlat0.xyxy;
					    u_xlat0.xy = (-u_xlat50.xy) + u_xlat0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_23 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_24.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
					    u_xlat16_24.xyz = u_xlat10_23.xyz * u_xlat10_23.xyz + u_xlat16_24.xyz;
					    u_xlat16_23.xyz = u_xlat10_2.xyz + u_xlat10_23.xyz;
					    u_xlat16_23.xyz = u_xlat10_3.xyz + u_xlat16_23.xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz + u_xlat16_24.xyz;
					    u_xlat16_3.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_3.xyz;
					    u_xlat16_5.xyz = u_xlat10_5.xyz + u_xlat16_23.xyz;
					    u_xlat16_5.xyz = u_xlat10_6.xyz + u_xlat16_5.xyz;
					    u_xlat16_3.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_3.xyz;
					    u_xlat16_5.xyz = u_xlat10_7.xyz + u_xlat16_5.xyz;
					    u_xlat16_5.xyz = u_xlat10_2.xyz + u_xlat16_5.xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_9.xyz * u_xlat10_9.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_10.xyz * u_xlat10_10.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_11.xyz * u_xlat10_11.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_12.xyz * u_xlat10_12.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_13.xyz * u_xlat10_13.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_14.xyz * u_xlat10_14.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_15.xyz * u_xlat10_15.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_16.xyz * u_xlat10_16.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_17.xyz * u_xlat10_17.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_18.xyz * u_xlat10_18.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_19.xyz * u_xlat10_19.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_20.xyz * u_xlat10_20.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_21.xyz * u_xlat10_21.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_22.xyz * u_xlat10_22.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.xyz = u_xlat10_8.xyz + u_xlat16_5.xyz;
					    u_xlat16_3.xyz = u_xlat10_9.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_10.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_11.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_12.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_8.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_13.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_14.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_15.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_16.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_17.xyz + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = u_xlat10_18.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_19.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_20.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_21.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_22.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat16_2.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + (-u_xlat1.xyz);
					    u_xlat1.x = abs(u_xlat1.y) + abs(u_xlat1.x);
					    u_xlat1.x = abs(u_xlat1.z) + u_xlat1.x;
					    u_xlat26 = min(u_xlat1.x, 100.0);
					    u_xlatb1 = u_xlat1.x<100.0;
					    u_xlatb26 = u_xlat76<u_xlat26;
					    u_xlat0.w = 1.0;
					    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0, vec4(bvec4(u_xlatb1)));
					    u_xlat4.w = 1.0;
					    SV_Target0 = (bool(u_xlatb26)) ? u_xlat4 : u_xlat0;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
			}
		}
	}
}