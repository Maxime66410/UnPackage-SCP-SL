Shader "TextMeshPro/Mobile/Distance Field (Surface)" {
	Properties {
		_FaceTex ("Fill Texture", 2D) = "white" {}
		_FaceColor ("Fill Color", Vector) = (1,1,1,1)
		_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
		_OutlineColor ("Outline Color", Vector) = (0,0,0,1)
		_OutlineTex ("Outline Texture", 2D) = "white" {}
		_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
		_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
		_GlowColor ("Color", Vector) = (0,1,0,0.5)
		_GlowOffset ("Offset", Range(-1, 1)) = 0
		_GlowInner ("Inner", Range(0, 1)) = 0.05
		_GlowOuter ("Outer", Range(0, 1)) = 0.05
		_GlowPower ("Falloff", Range(1, 0)) = 0.75
		_WeightNormal ("Weight Normal", Float) = 0
		_WeightBold ("Weight Bold", Float) = 0.5
		_ShaderFlags ("Flags", Float) = 0
		_ScaleRatioA ("Scale RatioA", Float) = 1
		_ScaleRatioB ("Scale RatioB", Float) = 1
		_ScaleRatioC ("Scale RatioC", Float) = 1
		_MainTex ("Font Atlas", 2D) = "white" {}
		_TextureWidth ("Texture Width", Float) = 512
		_TextureHeight ("Texture Height", Float) = 512
		_GradientScale ("Gradient Scale", Float) = 5
		_ScaleX ("Scale X", Float) = 1
		_ScaleY ("Scale Y", Float) = 1
		_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
		_VertexOffsetX ("Vertex OffsetX", Float) = 0
		_VertexOffsetY ("Vertex OffsetY", Float) = 0
	}
	SubShader {
		LOD 300
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			LOD 300
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ColorMask RGB -1
			ZWrite Off
			Cull Off
			GpuProgramID 23212
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						float _FaceDilate;
						vec4 unused_0_2[6];
						mat4x4 _EnvMatrix;
						vec4 unused_0_4[7];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_10[4];
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						vec4 unused_0_15;
						vec4 _MainTex_ST;
						vec4 _FaceTex_ST;
						vec4 _OutlineTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[42];
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_5[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
						vec4 unused_3_4;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					int u_xlati5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat3.x = floor(u_xlat15);
					    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat16 = (-_WeightNormal) + _WeightBold;
					    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
					    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
					    u_xlat15 = u_xlat15 * _ScaleRatioA;
					    vs_TEXCOORD5.x = u_xlat15 * 0.5;
					    u_xlat15 = u_xlat2.y * unity_MatrixVP[1].w;
					    u_xlat15 = unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
					    u_xlat15 = unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
					    u_xlat15 = unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
					    u_xlat2.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat2.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat16 = u_xlat15 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat16 = u_xlat16 * u_xlat2.x;
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
					    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + unity_WorldToObject[3].xyz;
					    u_xlat0.z = in_POSITION0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
					    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati5) + u_xlati0;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat2.x = dot(u_xlat0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(u_xlat0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(u_xlat0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
					    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
					    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
					    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat15 + u_xlat16;
					    vs_TEXCOORD2.w = u_xlat1.x;
					    u_xlat3.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.w = u_xlat1.y;
					    vs_TEXCOORD4.w = u_xlat1.z;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD4.z = u_xlat2.w;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * _EnvMatrix[1].xyz;
					    u_xlat0.xyw = _EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = _EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD7.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "DIRECTIONAL" }
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
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 unity_SHBr;
					uniform 	vec4 unity_SHBg;
					uniform 	vec4 unity_SHBb;
					uniform 	vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_WorldTransformParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	float _FaceDilate;
					uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
					uniform 	float _WeightNormal;
					uniform 	float _WeightBold;
					uniform 	float _ScaleRatioA;
					uniform 	float _VertexOffsetX;
					uniform 	float _VertexOffsetY;
					uniform 	float _GradientScale;
					uniform 	float _ScaleX;
					uniform 	float _ScaleY;
					uniform 	float _PerspectiveFilter;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _FaceTex_ST;
					uniform 	vec4 _OutlineTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					int u_xlati5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat3.x = floor(u_xlat15);
					    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat16 = (-_WeightNormal) + _WeightBold;
					    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
					    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
					    u_xlat15 = u_xlat15 * _ScaleRatioA;
					    vs_TEXCOORD5.x = u_xlat15 * 0.5;
					    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
					    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
					    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
					    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
					    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat16 = u_xlat15 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat16 = u_xlat16 * u_xlat2.x;
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
					    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
					    u_xlat0.z = in_POSITION0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
					    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati5) + u_xlati0;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
					    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
					    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
					    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat15 + u_xlat16;
					    vs_TEXCOORD2.w = u_xlat1.x;
					    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.w = u_xlat1.y;
					    vs_TEXCOORD4.w = u_xlat1.z;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD4.z = u_xlat2.w;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD7.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
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
					uniform 	vec4 _Time;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 unity_SHAr;
					uniform 	vec4 unity_SHAg;
					uniform 	vec4 unity_SHAb;
					uniform 	vec4 _LightColor0;
					uniform 	float _FaceUVSpeedX;
					uniform 	float _FaceUVSpeedY;
					uniform 	vec4 _FaceColor;
					uniform 	float _OutlineSoftness;
					uniform 	float _OutlineUVSpeedX;
					uniform 	float _OutlineUVSpeedY;
					uniform 	vec4 _OutlineColor;
					uniform 	float _OutlineWidth;
					uniform 	float _ScaleRatioA;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
					UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat5;
					float u_xlat6;
					float u_xlat10;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
					    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
					    u_xlat1.x = vs_COLOR0.w * _OutlineColor.w;
					    u_xlat1.w = u_xlat10_0.w * u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.www;
					    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
					    u_xlat10_0 = texture(_FaceTex, u_xlat0.xy);
					    u_xlat2 = vs_COLOR0 * _FaceColor;
					    u_xlat0 = u_xlat10_0 * u_xlat2;
					    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2 = (-u_xlat10_2.w) + 0.5;
					    u_xlat2.x = u_xlat16_2 + (-vs_TEXCOORD5.x);
					    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y + 0.5;
					    u_xlat6 = _OutlineWidth * _ScaleRatioA;
					    u_xlat6 = u_xlat6 * vs_TEXCOORD5.y;
					    u_xlat10 = u_xlat6 * 0.5 + u_xlat2.x;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat6) * 0.5 + u_xlat2.x;
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat0 = vec4(u_xlat6) * u_xlat1 + u_xlat0;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat5 = u_xlat1.x * vs_TEXCOORD5.y;
					    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
					    u_xlat5 = u_xlat5 * 0.5 + u_xlat2.x;
					    u_xlat1.x = u_xlat5 / u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.x = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xxx;
					    SV_Target0.w = u_xlat0.w;
					    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat2.x = vs_TEXCOORD2.z;
					    u_xlat2.y = vs_TEXCOORD3.z;
					    u_xlat2.z = vs_TEXCOORD4.z;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat2);
					    u_xlat3.y = dot(unity_SHAg, u_xlat2);
					    u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    u_xlat12 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD7.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "DIRECTIONAL" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 688
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %105 %117 %143 %158 %170 %221 %386 %494 %498 %577 %581 %603 %604 %627 %673 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
					                                                      OpName vs_TEXCOORD6 "vs_TEXCOORD6" 
					                                                      OpName vs_TEXCOORD7 "vs_TEXCOORD7" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpDecorate %22 ArrayStride 22 
					                                                      OpMemberDecorate %23 0 Offset 23 
					                                                      OpMemberDecorate %23 1 Offset 23 
					                                                      OpMemberDecorate %23 2 RelaxedPrecision 
					                                                      OpMemberDecorate %23 2 Offset 23 
					                                                      OpMemberDecorate %23 3 RelaxedPrecision 
					                                                      OpMemberDecorate %23 3 Offset 23 
					                                                      OpMemberDecorate %23 4 RelaxedPrecision 
					                                                      OpMemberDecorate %23 4 Offset 23 
					                                                      OpMemberDecorate %23 5 RelaxedPrecision 
					                                                      OpMemberDecorate %23 5 Offset 23 
					                                                      OpMemberDecorate %23 6 Offset 23 
					                                                      OpMemberDecorate %23 7 Offset 23 
					                                                      OpMemberDecorate %23 8 Offset 23 
					                                                      OpMemberDecorate %23 9 Offset 23 
					                                                      OpMemberDecorate %23 10 Offset 23 
					                                                      OpMemberDecorate %23 11 Offset 23 
					                                                      OpMemberDecorate %23 12 Offset 23 
					                                                      OpMemberDecorate %23 13 Offset 23 
					                                                      OpMemberDecorate %23 14 Offset 23 
					                                                      OpMemberDecorate %23 15 Offset 23 
					                                                      OpMemberDecorate %23 16 Offset 23 
					                                                      OpMemberDecorate %23 17 Offset 23 
					                                                      OpMemberDecorate %23 18 Offset 23 
					                                                      OpMemberDecorate %23 19 Offset 23 
					                                                      OpMemberDecorate %23 20 Offset 23 
					                                                      OpMemberDecorate %23 21 Offset 23 
					                                                      OpMemberDecorate %23 22 Offset 23 
					                                                      OpMemberDecorate %23 23 Offset 23 
					                                                      OpMemberDecorate %23 24 Offset 23 
					                                                      OpDecorate %23 Block 
					                                                      OpDecorate %25 DescriptorSet 25 
					                                                      OpDecorate %25 Binding 25 
					                                                      OpMemberDecorate %103 0 BuiltIn 103 
					                                                      OpMemberDecorate %103 1 BuiltIn 103 
					                                                      OpMemberDecorate %103 2 BuiltIn 103 
					                                                      OpDecorate %103 Block 
					                                                      OpDecorate %117 Location 117 
					                                                      OpDecorate vs_TEXCOORD0 Location 143 
					                                                      OpDecorate vs_TEXCOORD1 Location 158 
					                                                      OpDecorate %170 Location 170 
					                                                      OpDecorate vs_TEXCOORD5 Location 221 
					                                                      OpDecorate %386 Location 386 
					                                                      OpDecorate vs_TEXCOORD2 Location 494 
					                                                      OpDecorate %498 Location 498 
					                                                      OpDecorate vs_TEXCOORD3 Location 577 
					                                                      OpDecorate vs_TEXCOORD4 Location 581 
					                                                      OpDecorate %603 RelaxedPrecision 
					                                                      OpDecorate %603 Location 603 
					                                                      OpDecorate %604 RelaxedPrecision 
					                                                      OpDecorate %604 Location 604 
					                                                      OpDecorate %605 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD6 Location 627 
					                                                      OpDecorate %637 RelaxedPrecision 
					                                                      OpDecorate %648 RelaxedPrecision 
					                                                      OpDecorate %649 RelaxedPrecision 
					                                                      OpDecorate %651 RelaxedPrecision 
					                                                      OpDecorate %656 RelaxedPrecision 
					                                                      OpDecorate %658 RelaxedPrecision 
					                                                      OpDecorate %659 RelaxedPrecision 
					                                                      OpDecorate %660 RelaxedPrecision 
					                                                      OpDecorate %663 RelaxedPrecision 
					                                                      OpDecorate %664 RelaxedPrecision 
					                                                      OpDecorate %665 RelaxedPrecision 
					                                                      OpDecorate %669 RelaxedPrecision 
					                                                      OpDecorate %670 RelaxedPrecision 
					                                                      OpDecorate %671 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 Location 673 
					                                                      OpDecorate %676 RelaxedPrecision 
					                                                      OpDecorate %677 RelaxedPrecision 
					                                                      OpDecorate %678 RelaxedPrecision 
					                                                      OpDecorate %679 RelaxedPrecision 
					                                                      OpDecorate %680 RelaxedPrecision 
					                                                      OpDecorate %681 RelaxedPrecision 
					                                                      OpDecorate %682 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                                 Input f32_4* %11 = OpVariable Input 
					                                              %12 = OpTypeVector %6 2 
					                                              %15 = OpTypeVector %6 3 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %7 %17 
					                                              %19 = OpTypeArray %7 %17 
					                                              %20 = OpTypeArray %7 %17 
					                                              %21 = OpTypeArray %7 %17 
					                                              %22 = OpTypeArray %7 %17 
					                                              %23 = OpTypeStruct %15 %7 %7 %7 %7 %7 %18 %19 %7 %20 %21 %6 %22 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %7 %7 
					                                              %24 = OpTypePointer Uniform %23 
					Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32; f32_4[4]; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32_4;}* %25 = OpVariable Uniform 
					                                              %26 = OpTypeInt 32 1 
					                                          i32 %27 = OpConstant 16 
					                                              %28 = OpTypePointer Uniform %6 
					                                          i32 %31 = OpConstant 17 
					                               Private f32_4* %38 = OpVariable Private 
					                                          i32 %41 = OpConstant 6 
					                                          i32 %42 = OpConstant 1 
					                                              %43 = OpTypePointer Uniform %7 
					                                          i32 %47 = OpConstant 0 
					                                          i32 %55 = OpConstant 2 
					                               Private f32_4* %63 = OpVariable Private 
					                                          i32 %65 = OpConstant 3 
					                               Private f32_4* %80 = OpVariable Private 
					                                          i32 %83 = OpConstant 10 
					                                         u32 %101 = OpConstant 1 
					                                             %102 = OpTypeArray %6 %101 
					                                             %103 = OpTypeStruct %7 %6 %102 
					                                             %104 = OpTypePointer Output %103 
					        Output struct {f32_4; f32; f32[1];}* %105 = OpVariable Output 
					                                             %113 = OpTypePointer Output %7 
					                                             %115 = OpTypePointer Private %6 
					                                Private f32* %116 = OpVariable Private 
					                                Input f32_4* %117 = OpVariable Input 
					                                         u32 %118 = OpConstant 0 
					                                             %119 = OpTypePointer Input %6 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                         f32 %130 = OpConstant 3,674022E-40 
					                                         f32 %138 = OpConstant 3,674022E-40 
					                                       f32_2 %139 = OpConstantComposite %138 %138 
					                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                                         i32 %146 = OpConstant 23 
					                                             %157 = OpTypePointer Output %12 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         i32 %161 = OpConstant 24 
					                                Input f32_4* %170 = OpVariable Input 
					                                         i32 %173 = OpConstant 22 
					                                             %184 = OpTypeBool 
					                                             %185 = OpTypePointer Private %184 
					                               Private bool* %186 = OpVariable Private 
					                                         f32 %187 = OpConstant 3,674022E-40 
					                                         f32 %192 = OpConstant 3,674022E-40 
					                                Private f32* %194 = OpVariable Private 
					                                         i32 %195 = OpConstant 13 
					                                         i32 %199 = OpConstant 14 
					                                         f32 %210 = OpConstant 3,674022E-40 
					                                         i32 %212 = OpConstant 11 
					                                         i32 %217 = OpConstant 15 
					                       Output f32_2* vs_TEXCOORD5 = OpVariable Output 
					                                         f32 %223 = OpConstant 3,674022E-40 
					                                             %225 = OpTypePointer Output %6 
					                                         u32 %229 = OpConstant 3 
					                                         u32 %242 = OpConstant 2 
					                                         i32 %258 = OpConstant 9 
					                                         i32 %279 = OpConstant 19 
					                                         i32 %282 = OpConstant 20 
					                                         i32 %306 = OpConstant 18 
					                                         f32 %314 = OpConstant 3,674022E-40 
					                                         i32 %316 = OpConstant 21 
					                                             %331 = OpTypePointer Uniform %15 
					                                         i32 %335 = OpConstant 7 
					                                             %385 = OpTypePointer Input %15 
					                                Input f32_3* %386 = OpVariable Input 
					                                             %392 = OpTypePointer Private %26 
					                                Private i32* %393 = OpVariable Private 
					                                         u32 %397 = OpConstant 4294967295 
					                                Private i32* %400 = OpVariable Private 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Input f32_4* %498 = OpVariable Input 
					                                             %543 = OpTypePointer Private %15 
					                              Private f32_3* %544 = OpVariable Private 
					                                         i32 %560 = OpConstant 8 
					                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
					                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
					                               Output f32_4* %603 = OpVariable Output 
					                                Input f32_4* %604 = OpVariable Input 
					                                         i32 %608 = OpConstant 12 
					                                             %626 = OpTypePointer Output %15 
					                       Output f32_3* vs_TEXCOORD6 = OpVariable Output 
					                                Private f32* %637 = OpVariable Private 
					                              Private f32_4* %651 = OpVariable Private 
					                              Private f32_3* %656 = OpVariable Private 
					                                         i32 %667 = OpConstant 4 
					                       Output f32_3* vs_TEXCOORD7 = OpVariable Output 
					                                         i32 %674 = OpConstant 5 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_4 %13 = OpLoad %11 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                 Uniform f32* %29 = OpAccessChain %25 %27 
					                                          f32 %30 = OpLoad %29 
					                                 Uniform f32* %32 = OpAccessChain %25 %31 
					                                          f32 %33 = OpLoad %32 
					                                        f32_2 %34 = OpCompositeConstruct %30 %33 
					                                        f32_2 %35 = OpFAdd %14 %34 
					                                        f32_4 %36 = OpLoad %9 
					                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
					                                                      OpStore %9 %37 
					                                        f32_4 %39 = OpLoad %9 
					                                        f32_4 %40 = OpVectorShuffle %39 %39 1 1 1 1 
					                               Uniform f32_4* %44 = OpAccessChain %25 %41 %42 
					                                        f32_4 %45 = OpLoad %44 
					                                        f32_4 %46 = OpFMul %40 %45 
					                                                      OpStore %38 %46 
					                               Uniform f32_4* %48 = OpAccessChain %25 %41 %47 
					                                        f32_4 %49 = OpLoad %48 
					                                        f32_4 %50 = OpLoad %9 
					                                        f32_4 %51 = OpVectorShuffle %50 %50 0 0 0 0 
					                                        f32_4 %52 = OpFMul %49 %51 
					                                        f32_4 %53 = OpLoad %38 
					                                        f32_4 %54 = OpFAdd %52 %53 
					                                                      OpStore %38 %54 
					                               Uniform f32_4* %56 = OpAccessChain %25 %41 %55 
					                                        f32_4 %57 = OpLoad %56 
					                                        f32_4 %58 = OpLoad %11 
					                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
					                                        f32_4 %60 = OpFMul %57 %59 
					                                        f32_4 %61 = OpLoad %38 
					                                        f32_4 %62 = OpFAdd %60 %61 
					                                                      OpStore %38 %62 
					                                        f32_4 %64 = OpLoad %38 
					                               Uniform f32_4* %66 = OpAccessChain %25 %41 %65 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_4 %68 = OpFAdd %64 %67 
					                                                      OpStore %63 %68 
					                               Uniform f32_4* %69 = OpAccessChain %25 %41 %65 
					                                        f32_4 %70 = OpLoad %69 
					                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                        f32_4 %72 = OpLoad %11 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
					                                        f32_3 %74 = OpFMul %71 %73 
					                                        f32_4 %75 = OpLoad %38 
					                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
					                                        f32_3 %77 = OpFAdd %74 %76 
					                                        f32_4 %78 = OpLoad %38 
					                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
					                                                      OpStore %38 %79 
					                                        f32_4 %81 = OpLoad %63 
					                                        f32_4 %82 = OpVectorShuffle %81 %81 1 1 1 1 
					                               Uniform f32_4* %84 = OpAccessChain %25 %83 %42 
					                                        f32_4 %85 = OpLoad %84 
					                                        f32_4 %86 = OpFMul %82 %85 
					                                                      OpStore %80 %86 
					                               Uniform f32_4* %87 = OpAccessChain %25 %83 %47 
					                                        f32_4 %88 = OpLoad %87 
					                                        f32_4 %89 = OpLoad %63 
					                                        f32_4 %90 = OpVectorShuffle %89 %89 0 0 0 0 
					                                        f32_4 %91 = OpFMul %88 %90 
					                                        f32_4 %92 = OpLoad %80 
					                                        f32_4 %93 = OpFAdd %91 %92 
					                                                      OpStore %80 %93 
					                               Uniform f32_4* %94 = OpAccessChain %25 %83 %55 
					                                        f32_4 %95 = OpLoad %94 
					                                        f32_4 %96 = OpLoad %63 
					                                        f32_4 %97 = OpVectorShuffle %96 %96 2 2 2 2 
					                                        f32_4 %98 = OpFMul %95 %97 
					                                        f32_4 %99 = OpLoad %80 
					                                       f32_4 %100 = OpFAdd %98 %99 
					                                                      OpStore %80 %100 
					                              Uniform f32_4* %106 = OpAccessChain %25 %83 %65 
					                                       f32_4 %107 = OpLoad %106 
					                                       f32_4 %108 = OpLoad %63 
					                                       f32_4 %109 = OpVectorShuffle %108 %108 3 3 3 3 
					                                       f32_4 %110 = OpFMul %107 %109 
					                                       f32_4 %111 = OpLoad %80 
					                                       f32_4 %112 = OpFAdd %110 %111 
					                               Output f32_4* %114 = OpAccessChain %105 %47 
					                                                      OpStore %114 %112 
					                                  Input f32* %120 = OpAccessChain %117 %118 
					                                         f32 %121 = OpLoad %120 
					                                         f32 %123 = OpFMul %121 %122 
					                                                      OpStore %116 %123 
					                                         f32 %124 = OpLoad %116 
					                                         f32 %125 = OpExtInst %1 8 %124 
					                                Private f32* %126 = OpAccessChain %80 %118 
					                                                      OpStore %126 %125 
					                                Private f32* %127 = OpAccessChain %80 %118 
					                                         f32 %128 = OpLoad %127 
					                                         f32 %129 = OpFNegate %128 
					                                         f32 %131 = OpFMul %129 %130 
					                                  Input f32* %132 = OpAccessChain %117 %118 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFAdd %131 %133 
					                                Private f32* %135 = OpAccessChain %80 %101 
					                                                      OpStore %135 %134 
					                                       f32_4 %136 = OpLoad %80 
					                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
					                                       f32_2 %140 = OpFMul %137 %139 
					                                       f32_4 %141 = OpLoad %80 
					                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 2 3 
					                                                      OpStore %80 %142 
					                                       f32_4 %144 = OpLoad %80 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
					                              Uniform f32_4* %147 = OpAccessChain %25 %146 
					                                       f32_4 %148 = OpLoad %147 
					                                       f32_2 %149 = OpVectorShuffle %148 %148 0 1 
					                                       f32_2 %150 = OpFMul %145 %149 
					                              Uniform f32_4* %151 = OpAccessChain %25 %146 
					                                       f32_4 %152 = OpLoad %151 
					                                       f32_2 %153 = OpVectorShuffle %152 %152 2 3 
					                                       f32_2 %154 = OpFAdd %150 %153 
					                                       f32_4 %155 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %156 = OpVectorShuffle %155 %154 0 1 4 5 
					                                                      OpStore vs_TEXCOORD0 %156 
					                                       f32_4 %159 = OpLoad %80 
					                                       f32_2 %160 = OpVectorShuffle %159 %159 0 1 
					                              Uniform f32_4* %162 = OpAccessChain %25 %161 
					                                       f32_4 %163 = OpLoad %162 
					                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
					                                       f32_2 %165 = OpFMul %160 %164 
					                              Uniform f32_4* %166 = OpAccessChain %25 %161 
					                                       f32_4 %167 = OpLoad %166 
					                                       f32_2 %168 = OpVectorShuffle %167 %167 2 3 
					                                       f32_2 %169 = OpFAdd %165 %168 
					                                                      OpStore vs_TEXCOORD1 %169 
					                                       f32_4 %171 = OpLoad %170 
					                                       f32_2 %172 = OpVectorShuffle %171 %171 0 1 
					                              Uniform f32_4* %174 = OpAccessChain %25 %173 
					                                       f32_4 %175 = OpLoad %174 
					                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
					                                       f32_2 %177 = OpFMul %172 %176 
					                              Uniform f32_4* %178 = OpAccessChain %25 %173 
					                                       f32_4 %179 = OpLoad %178 
					                                       f32_2 %180 = OpVectorShuffle %179 %179 2 3 
					                                       f32_2 %181 = OpFAdd %177 %180 
					                                       f32_4 %182 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 2 3 
					                                                      OpStore vs_TEXCOORD0 %183 
					                                  Input f32* %188 = OpAccessChain %117 %101 
					                                         f32 %189 = OpLoad %188 
					                                        bool %190 = OpFOrdGreaterThanEqual %187 %189 
					                                                      OpStore %186 %190 
					                                        bool %191 = OpLoad %186 
					                                         f32 %193 = OpSelect %191 %192 %187 
					                                                      OpStore %116 %193 
					                                Uniform f32* %196 = OpAccessChain %25 %195 
					                                         f32 %197 = OpLoad %196 
					                                         f32 %198 = OpFNegate %197 
					                                Uniform f32* %200 = OpAccessChain %25 %199 
					                                         f32 %201 = OpLoad %200 
					                                         f32 %202 = OpFAdd %198 %201 
					                                                      OpStore %194 %202 
					                                         f32 %203 = OpLoad %116 
					                                         f32 %204 = OpLoad %194 
					                                         f32 %205 = OpFMul %203 %204 
					                                Uniform f32* %206 = OpAccessChain %25 %195 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFAdd %205 %207 
					                                                      OpStore %116 %208 
					                                         f32 %209 = OpLoad %116 
					                                         f32 %211 = OpFMul %209 %210 
					                                Uniform f32* %213 = OpAccessChain %25 %212 
					                                         f32 %214 = OpLoad %213 
					                                         f32 %215 = OpFAdd %211 %214 
					                                                      OpStore %116 %215 
					                                         f32 %216 = OpLoad %116 
					                                Uniform f32* %218 = OpAccessChain %25 %217 
					                                         f32 %219 = OpLoad %218 
					                                         f32 %220 = OpFMul %216 %219 
					                                                      OpStore %116 %220 
					                                         f32 %222 = OpLoad %116 
					                                         f32 %224 = OpFMul %222 %223 
					                                 Output f32* %226 = OpAccessChain vs_TEXCOORD5 %118 
					                                                      OpStore %226 %224 
					                                Private f32* %227 = OpAccessChain %63 %101 
					                                         f32 %228 = OpLoad %227 
					                                Uniform f32* %230 = OpAccessChain %25 %83 %42 %229 
					                                         f32 %231 = OpLoad %230 
					                                         f32 %232 = OpFMul %228 %231 
					                                                      OpStore %116 %232 
					                                Uniform f32* %233 = OpAccessChain %25 %83 %47 %229 
					                                         f32 %234 = OpLoad %233 
					                                Private f32* %235 = OpAccessChain %63 %118 
					                                         f32 %236 = OpLoad %235 
					                                         f32 %237 = OpFMul %234 %236 
					                                         f32 %238 = OpLoad %116 
					                                         f32 %239 = OpFAdd %237 %238 
					                                                      OpStore %116 %239 
					                                Uniform f32* %240 = OpAccessChain %25 %83 %55 %229 
					                                         f32 %241 = OpLoad %240 
					                                Private f32* %243 = OpAccessChain %63 %242 
					                                         f32 %244 = OpLoad %243 
					                                         f32 %245 = OpFMul %241 %244 
					                                         f32 %246 = OpLoad %116 
					                                         f32 %247 = OpFAdd %245 %246 
					                                                      OpStore %116 %247 
					                                Uniform f32* %248 = OpAccessChain %25 %83 %65 %229 
					                                         f32 %249 = OpLoad %248 
					                                Private f32* %250 = OpAccessChain %63 %229 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpFMul %249 %251 
					                                         f32 %253 = OpLoad %116 
					                                         f32 %254 = OpFAdd %252 %253 
					                                                      OpStore %116 %254 
					                              Uniform f32_4* %255 = OpAccessChain %25 %42 
					                                       f32_4 %256 = OpLoad %255 
					                                       f32_2 %257 = OpVectorShuffle %256 %256 1 1 
					                              Uniform f32_4* %259 = OpAccessChain %25 %258 %42 
					                                       f32_4 %260 = OpLoad %259 
					                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
					                                       f32_2 %262 = OpFMul %257 %261 
					                                       f32_4 %263 = OpLoad %63 
					                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 2 3 
					                                                      OpStore %63 %264 
					                              Uniform f32_4* %265 = OpAccessChain %25 %258 %47 
					                                       f32_4 %266 = OpLoad %265 
					                                       f32_2 %267 = OpVectorShuffle %266 %266 0 1 
					                              Uniform f32_4* %268 = OpAccessChain %25 %42 
					                                       f32_4 %269 = OpLoad %268 
					                                       f32_2 %270 = OpVectorShuffle %269 %269 0 0 
					                                       f32_2 %271 = OpFMul %267 %270 
					                                       f32_4 %272 = OpLoad %63 
					                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
					                                       f32_2 %274 = OpFAdd %271 %273 
					                                       f32_4 %275 = OpLoad %63 
					                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 2 3 
					                                                      OpStore %63 %276 
					                                       f32_4 %277 = OpLoad %63 
					                                       f32_2 %278 = OpVectorShuffle %277 %277 0 1 
					                                Uniform f32* %280 = OpAccessChain %25 %279 
					                                         f32 %281 = OpLoad %280 
					                                Uniform f32* %283 = OpAccessChain %25 %282 
					                                         f32 %284 = OpLoad %283 
					                                       f32_2 %285 = OpCompositeConstruct %281 %284 
					                                       f32_2 %286 = OpFMul %278 %285 
					                                       f32_4 %287 = OpLoad %63 
					                                       f32_4 %288 = OpVectorShuffle %287 %286 4 5 2 3 
					                                                      OpStore %63 %288 
					                                         f32 %289 = OpLoad %116 
					                                       f32_2 %290 = OpCompositeConstruct %289 %289 
					                                       f32_4 %291 = OpLoad %63 
					                                       f32_2 %292 = OpVectorShuffle %291 %291 0 1 
					                                       f32_2 %293 = OpFDiv %290 %292 
					                                       f32_4 %294 = OpLoad %63 
					                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 2 3 
					                                                      OpStore %63 %295 
					                                       f32_4 %296 = OpLoad %63 
					                                       f32_2 %297 = OpVectorShuffle %296 %296 0 1 
					                                       f32_4 %298 = OpLoad %63 
					                                       f32_2 %299 = OpVectorShuffle %298 %298 0 1 
					                                         f32 %300 = OpDot %297 %299 
					                                                      OpStore %116 %300 
					                                         f32 %301 = OpLoad %116 
					                                         f32 %302 = OpExtInst %1 32 %301 
					                                                      OpStore %116 %302 
					                                  Input f32* %303 = OpAccessChain %117 %101 
					                                         f32 %304 = OpLoad %303 
					                                         f32 %305 = OpExtInst %1 4 %304 
					                                Uniform f32* %307 = OpAccessChain %25 %306 
					                                         f32 %308 = OpLoad %307 
					                                         f32 %309 = OpFMul %305 %308 
					                                                      OpStore %194 %309 
					                                         f32 %310 = OpLoad %116 
					                                         f32 %311 = OpLoad %194 
					                                         f32 %312 = OpFMul %310 %311 
					                                                      OpStore %116 %312 
					                                         f32 %313 = OpLoad %116 
					                                         f32 %315 = OpFMul %313 %314 
					                                                      OpStore %194 %315 
					                                Uniform f32* %317 = OpAccessChain %25 %316 
					                                         f32 %318 = OpLoad %317 
					                                         f32 %319 = OpFNegate %318 
					                                         f32 %320 = OpFAdd %319 %192 
					                                Private f32* %321 = OpAccessChain %63 %118 
					                                                      OpStore %321 %320 
					                                         f32 %322 = OpLoad %194 
					                                Private f32* %323 = OpAccessChain %63 %118 
					                                         f32 %324 = OpLoad %323 
					                                         f32 %325 = OpFMul %322 %324 
					                                                      OpStore %194 %325 
					                                         f32 %326 = OpLoad %116 
					                                         f32 %327 = OpFMul %326 %314 
					                                         f32 %328 = OpLoad %194 
					                                         f32 %329 = OpFNegate %328 
					                                         f32 %330 = OpFAdd %327 %329 
					                                                      OpStore %116 %330 
					                              Uniform f32_3* %332 = OpAccessChain %25 %47 
					                                       f32_3 %333 = OpLoad %332 
					                                       f32_3 %334 = OpVectorShuffle %333 %333 1 1 1 
					                              Uniform f32_4* %336 = OpAccessChain %25 %335 %42 
					                                       f32_4 %337 = OpLoad %336 
					                                       f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
					                                       f32_3 %339 = OpFMul %334 %338 
					                                       f32_4 %340 = OpLoad %63 
					                                       f32_4 %341 = OpVectorShuffle %340 %339 4 5 6 3 
					                                                      OpStore %63 %341 
					                              Uniform f32_4* %342 = OpAccessChain %25 %335 %47 
					                                       f32_4 %343 = OpLoad %342 
					                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
					                              Uniform f32_3* %345 = OpAccessChain %25 %47 
					                                       f32_3 %346 = OpLoad %345 
					                                       f32_3 %347 = OpVectorShuffle %346 %346 0 0 0 
					                                       f32_3 %348 = OpFMul %344 %347 
					                                       f32_4 %349 = OpLoad %63 
					                                       f32_3 %350 = OpVectorShuffle %349 %349 0 1 2 
					                                       f32_3 %351 = OpFAdd %348 %350 
					                                       f32_4 %352 = OpLoad %63 
					                                       f32_4 %353 = OpVectorShuffle %352 %351 4 5 6 3 
					                                                      OpStore %63 %353 
					                              Uniform f32_4* %354 = OpAccessChain %25 %335 %55 
					                                       f32_4 %355 = OpLoad %354 
					                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
					                              Uniform f32_3* %357 = OpAccessChain %25 %47 
					                                       f32_3 %358 = OpLoad %357 
					                                       f32_3 %359 = OpVectorShuffle %358 %358 2 2 2 
					                                       f32_3 %360 = OpFMul %356 %359 
					                                       f32_4 %361 = OpLoad %63 
					                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
					                                       f32_3 %363 = OpFAdd %360 %362 
					                                       f32_4 %364 = OpLoad %63 
					                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
					                                                      OpStore %63 %365 
					                                       f32_4 %366 = OpLoad %63 
					                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
					                              Uniform f32_4* %368 = OpAccessChain %25 %335 %65 
					                                       f32_4 %369 = OpLoad %368 
					                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
					                                       f32_3 %371 = OpFAdd %367 %370 
					                                       f32_4 %372 = OpLoad %63 
					                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
					                                                      OpStore %63 %373 
					                                  Input f32* %374 = OpAccessChain %11 %242 
					                                         f32 %375 = OpLoad %374 
					                                Private f32* %376 = OpAccessChain %9 %242 
					                                                      OpStore %376 %375 
					                                       f32_4 %377 = OpLoad %9 
					                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
					                                       f32_3 %379 = OpFNegate %378 
					                                       f32_4 %380 = OpLoad %63 
					                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
					                                       f32_3 %382 = OpFAdd %379 %381 
					                                       f32_4 %383 = OpLoad %9 
					                                       f32_4 %384 = OpVectorShuffle %383 %382 4 5 6 3 
					                                                      OpStore %9 %384 
					                                       f32_3 %387 = OpLoad %386 
					                                       f32_4 %388 = OpLoad %9 
					                                       f32_3 %389 = OpVectorShuffle %388 %388 0 1 2 
					                                         f32 %390 = OpDot %387 %389 
					                                Private f32* %391 = OpAccessChain %9 %118 
					                                                      OpStore %391 %390 
					                                Private f32* %394 = OpAccessChain %9 %118 
					                                         f32 %395 = OpLoad %394 
					                                        bool %396 = OpFOrdLessThan %187 %395 
					                                         u32 %398 = OpSelect %396 %397 %118 
					                                         i32 %399 = OpBitcast %398 
					                                                      OpStore %393 %399 
					                                Private f32* %401 = OpAccessChain %9 %118 
					                                         f32 %402 = OpLoad %401 
					                                        bool %403 = OpFOrdLessThan %402 %187 
					                                         u32 %404 = OpSelect %403 %397 %118 
					                                         i32 %405 = OpBitcast %404 
					                                                      OpStore %400 %405 
					                                         i32 %406 = OpLoad %393 
					                                         i32 %407 = OpSNegate %406 
					                                         i32 %408 = OpLoad %400 
					                                         i32 %409 = OpIAdd %407 %408 
					                                                      OpStore %400 %409 
					                                         i32 %410 = OpLoad %400 
					                                         f32 %411 = OpConvertSToF %410 
					                                Private f32* %412 = OpAccessChain %9 %118 
					                                                      OpStore %412 %411 
					                                       f32_4 %413 = OpLoad %9 
					                                       f32_3 %414 = OpVectorShuffle %413 %413 0 0 0 
					                                       f32_3 %415 = OpLoad %386 
					                                       f32_3 %416 = OpFMul %414 %415 
					                                       f32_4 %417 = OpLoad %9 
					                                       f32_4 %418 = OpVectorShuffle %417 %416 4 5 6 3 
					                                                      OpStore %9 %418 
					                                       f32_4 %419 = OpLoad %9 
					                                       f32_3 %420 = OpVectorShuffle %419 %419 0 1 2 
					                              Uniform f32_4* %421 = OpAccessChain %25 %335 %47 
					                                       f32_4 %422 = OpLoad %421 
					                                       f32_3 %423 = OpVectorShuffle %422 %422 0 1 2 
					                                         f32 %424 = OpDot %420 %423 
					                                Private f32* %425 = OpAccessChain %63 %118 
					                                                      OpStore %425 %424 
					                                       f32_4 %426 = OpLoad %9 
					                                       f32_3 %427 = OpVectorShuffle %426 %426 0 1 2 
					                              Uniform f32_4* %428 = OpAccessChain %25 %335 %42 
					                                       f32_4 %429 = OpLoad %428 
					                                       f32_3 %430 = OpVectorShuffle %429 %429 0 1 2 
					                                         f32 %431 = OpDot %427 %430 
					                                Private f32* %432 = OpAccessChain %63 %101 
					                                                      OpStore %432 %431 
					                                       f32_4 %433 = OpLoad %9 
					                                       f32_3 %434 = OpVectorShuffle %433 %433 0 1 2 
					                              Uniform f32_4* %435 = OpAccessChain %25 %335 %55 
					                                       f32_4 %436 = OpLoad %435 
					                                       f32_3 %437 = OpVectorShuffle %436 %436 0 1 2 
					                                         f32 %438 = OpDot %434 %437 
					                                Private f32* %439 = OpAccessChain %63 %242 
					                                                      OpStore %439 %438 
					                                       f32_4 %440 = OpLoad %63 
					                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
					                                       f32_4 %442 = OpLoad %63 
					                                       f32_3 %443 = OpVectorShuffle %442 %442 0 1 2 
					                                         f32 %444 = OpDot %441 %443 
					                                Private f32* %445 = OpAccessChain %9 %118 
					                                                      OpStore %445 %444 
					                                Private f32* %446 = OpAccessChain %9 %118 
					                                         f32 %447 = OpLoad %446 
					                                         f32 %448 = OpExtInst %1 32 %447 
					                                Private f32* %449 = OpAccessChain %9 %118 
					                                                      OpStore %449 %448 
					                                       f32_4 %450 = OpLoad %9 
					                                       f32_4 %451 = OpVectorShuffle %450 %450 0 0 0 0 
					                                       f32_4 %452 = OpLoad %63 
					                                       f32_4 %453 = OpVectorShuffle %452 %452 0 1 2 2 
					                                       f32_4 %454 = OpFMul %451 %453 
					                                                      OpStore %63 %454 
					                                       f32_4 %455 = OpLoad %38 
					                                       f32_3 %456 = OpVectorShuffle %455 %455 0 1 2 
					                                       f32_3 %457 = OpFNegate %456 
					                              Uniform f32_3* %458 = OpAccessChain %25 %47 
					                                       f32_3 %459 = OpLoad %458 
					                                       f32_3 %460 = OpFAdd %457 %459 
					                                       f32_4 %461 = OpLoad %9 
					                                       f32_4 %462 = OpVectorShuffle %461 %460 4 5 6 3 
					                                                      OpStore %9 %462 
					                                       f32_4 %463 = OpLoad %9 
					                                       f32_3 %464 = OpVectorShuffle %463 %463 0 1 2 
					                                       f32_4 %465 = OpLoad %9 
					                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
					                                         f32 %467 = OpDot %464 %466 
					                                Private f32* %468 = OpAccessChain %80 %118 
					                                                      OpStore %468 %467 
					                                Private f32* %469 = OpAccessChain %80 %118 
					                                         f32 %470 = OpLoad %469 
					                                         f32 %471 = OpExtInst %1 32 %470 
					                                Private f32* %472 = OpAccessChain %80 %118 
					                                                      OpStore %472 %471 
					                                       f32_4 %473 = OpLoad %9 
					                                       f32_3 %474 = OpVectorShuffle %473 %473 0 1 2 
					                                       f32_4 %475 = OpLoad %80 
					                                       f32_3 %476 = OpVectorShuffle %475 %475 0 0 0 
					                                       f32_3 %477 = OpFMul %474 %476 
					                                       f32_4 %478 = OpLoad %80 
					                                       f32_4 %479 = OpVectorShuffle %478 %477 4 5 6 3 
					                                                      OpStore %80 %479 
					                                       f32_4 %480 = OpLoad %63 
					                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 3 
					                                       f32_4 %482 = OpLoad %80 
					                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
					                                         f32 %484 = OpDot %481 %483 
					                                Private f32* %485 = OpAccessChain %80 %118 
					                                                      OpStore %485 %484 
					                                Private f32* %486 = OpAccessChain %80 %118 
					                                         f32 %487 = OpLoad %486 
					                                         f32 %488 = OpExtInst %1 4 %487 
					                                         f32 %489 = OpLoad %116 
					                                         f32 %490 = OpFMul %488 %489 
					                                         f32 %491 = OpLoad %194 
					                                         f32 %492 = OpFAdd %490 %491 
					                                 Output f32* %493 = OpAccessChain vs_TEXCOORD5 %101 
					                                                      OpStore %493 %492 
					                                Private f32* %495 = OpAccessChain %38 %118 
					                                         f32 %496 = OpLoad %495 
					                                 Output f32* %497 = OpAccessChain vs_TEXCOORD2 %229 
					                                                      OpStore %497 %496 
					                                       f32_4 %499 = OpLoad %498 
					                                       f32_3 %500 = OpVectorShuffle %499 %499 1 1 1 
					                              Uniform f32_4* %501 = OpAccessChain %25 %41 %42 
					                                       f32_4 %502 = OpLoad %501 
					                                       f32_3 %503 = OpVectorShuffle %502 %502 1 2 0 
					                                       f32_3 %504 = OpFMul %500 %503 
					                                       f32_4 %505 = OpLoad %80 
					                                       f32_4 %506 = OpVectorShuffle %505 %504 4 5 6 3 
					                                                      OpStore %80 %506 
					                              Uniform f32_4* %507 = OpAccessChain %25 %41 %47 
					                                       f32_4 %508 = OpLoad %507 
					                                       f32_3 %509 = OpVectorShuffle %508 %508 1 2 0 
					                                       f32_4 %510 = OpLoad %498 
					                                       f32_3 %511 = OpVectorShuffle %510 %510 0 0 0 
					                                       f32_3 %512 = OpFMul %509 %511 
					                                       f32_4 %513 = OpLoad %80 
					                                       f32_3 %514 = OpVectorShuffle %513 %513 0 1 2 
					                                       f32_3 %515 = OpFAdd %512 %514 
					                                       f32_4 %516 = OpLoad %80 
					                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
					                                                      OpStore %80 %517 
					                              Uniform f32_4* %518 = OpAccessChain %25 %41 %55 
					                                       f32_4 %519 = OpLoad %518 
					                                       f32_3 %520 = OpVectorShuffle %519 %519 1 2 0 
					                                       f32_4 %521 = OpLoad %498 
					                                       f32_3 %522 = OpVectorShuffle %521 %521 2 2 2 
					                                       f32_3 %523 = OpFMul %520 %522 
					                                       f32_4 %524 = OpLoad %80 
					                                       f32_3 %525 = OpVectorShuffle %524 %524 0 1 2 
					                                       f32_3 %526 = OpFAdd %523 %525 
					                                       f32_4 %527 = OpLoad %80 
					                                       f32_4 %528 = OpVectorShuffle %527 %526 4 5 6 3 
					                                                      OpStore %80 %528 
					                                       f32_4 %529 = OpLoad %80 
					                                       f32_3 %530 = OpVectorShuffle %529 %529 0 1 2 
					                                       f32_4 %531 = OpLoad %80 
					                                       f32_3 %532 = OpVectorShuffle %531 %531 0 1 2 
					                                         f32 %533 = OpDot %530 %532 
					                                                      OpStore %116 %533 
					                                         f32 %534 = OpLoad %116 
					                                         f32 %535 = OpExtInst %1 32 %534 
					                                                      OpStore %116 %535 
					                                         f32 %536 = OpLoad %116 
					                                       f32_3 %537 = OpCompositeConstruct %536 %536 %536 
					                                       f32_4 %538 = OpLoad %80 
					                                       f32_3 %539 = OpVectorShuffle %538 %538 0 1 2 
					                                       f32_3 %540 = OpFMul %537 %539 
					                                       f32_4 %541 = OpLoad %80 
					                                       f32_4 %542 = OpVectorShuffle %541 %540 4 5 6 3 
					                                                      OpStore %80 %542 
					                                       f32_4 %545 = OpLoad %63 
					                                       f32_3 %546 = OpVectorShuffle %545 %545 3 0 1 
					                                       f32_4 %547 = OpLoad %80 
					                                       f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
					                                       f32_3 %549 = OpFMul %546 %548 
					                                                      OpStore %544 %549 
					                                       f32_4 %550 = OpLoad %63 
					                                       f32_3 %551 = OpVectorShuffle %550 %550 1 3 0 
					                                       f32_4 %552 = OpLoad %80 
					                                       f32_3 %553 = OpVectorShuffle %552 %552 1 2 0 
					                                       f32_3 %554 = OpFMul %551 %553 
					                                       f32_3 %555 = OpLoad %544 
					                                       f32_3 %556 = OpFNegate %555 
					                                       f32_3 %557 = OpFAdd %554 %556 
					                                                      OpStore %544 %557 
					                                  Input f32* %558 = OpAccessChain %498 %229 
					                                         f32 %559 = OpLoad %558 
					                                Uniform f32* %561 = OpAccessChain %25 %560 %229 
					                                         f32 %562 = OpLoad %561 
					                                         f32 %563 = OpFMul %559 %562 
					                                                      OpStore %116 %563 
					                                         f32 %564 = OpLoad %116 
					                                       f32_3 %565 = OpCompositeConstruct %564 %564 %564 
					                                       f32_3 %566 = OpLoad %544 
					                                       f32_3 %567 = OpFMul %565 %566 
					                                                      OpStore %544 %567 
					                                Private f32* %568 = OpAccessChain %544 %118 
					                                         f32 %569 = OpLoad %568 
					                                 Output f32* %570 = OpAccessChain vs_TEXCOORD2 %101 
					                                                      OpStore %570 %569 
					                                Private f32* %571 = OpAccessChain %63 %118 
					                                         f32 %572 = OpLoad %571 
					                                 Output f32* %573 = OpAccessChain vs_TEXCOORD2 %242 
					                                                      OpStore %573 %572 
					                                Private f32* %574 = OpAccessChain %80 %242 
					                                         f32 %575 = OpLoad %574 
					                                 Output f32* %576 = OpAccessChain vs_TEXCOORD2 %118 
					                                                      OpStore %576 %575 
					                                Private f32* %578 = OpAccessChain %80 %118 
					                                         f32 %579 = OpLoad %578 
					                                 Output f32* %580 = OpAccessChain vs_TEXCOORD3 %118 
					                                                      OpStore %580 %579 
					                                Private f32* %582 = OpAccessChain %80 %101 
					                                         f32 %583 = OpLoad %582 
					                                 Output f32* %584 = OpAccessChain vs_TEXCOORD4 %118 
					                                                      OpStore %584 %583 
					                                Private f32* %585 = OpAccessChain %38 %101 
					                                         f32 %586 = OpLoad %585 
					                                 Output f32* %587 = OpAccessChain vs_TEXCOORD3 %229 
					                                                      OpStore %587 %586 
					                                Private f32* %588 = OpAccessChain %38 %242 
					                                         f32 %589 = OpLoad %588 
					                                 Output f32* %590 = OpAccessChain vs_TEXCOORD4 %229 
					                                                      OpStore %590 %589 
					                                Private f32* %591 = OpAccessChain %63 %101 
					                                         f32 %592 = OpLoad %591 
					                                 Output f32* %593 = OpAccessChain vs_TEXCOORD3 %242 
					                                                      OpStore %593 %592 
					                                Private f32* %594 = OpAccessChain %544 %101 
					                                         f32 %595 = OpLoad %594 
					                                 Output f32* %596 = OpAccessChain vs_TEXCOORD3 %101 
					                                                      OpStore %596 %595 
					                                Private f32* %597 = OpAccessChain %544 %242 
					                                         f32 %598 = OpLoad %597 
					                                 Output f32* %599 = OpAccessChain vs_TEXCOORD4 %101 
					                                                      OpStore %599 %598 
					                                Private f32* %600 = OpAccessChain %63 %229 
					                                         f32 %601 = OpLoad %600 
					                                 Output f32* %602 = OpAccessChain vs_TEXCOORD4 %242 
					                                                      OpStore %602 %601 
					                                       f32_4 %605 = OpLoad %604 
					                                                      OpStore %603 %605 
					                                       f32_4 %606 = OpLoad %9 
					                                       f32_3 %607 = OpVectorShuffle %606 %606 1 1 1 
					                              Uniform f32_4* %609 = OpAccessChain %25 %608 %42 
					                                       f32_4 %610 = OpLoad %609 
					                                       f32_3 %611 = OpVectorShuffle %610 %610 0 1 2 
					                                       f32_3 %612 = OpFMul %607 %611 
					                                       f32_4 %613 = OpLoad %38 
					                                       f32_4 %614 = OpVectorShuffle %613 %612 4 5 6 3 
					                                                      OpStore %38 %614 
					                              Uniform f32_4* %615 = OpAccessChain %25 %608 %47 
					                                       f32_4 %616 = OpLoad %615 
					                                       f32_3 %617 = OpVectorShuffle %616 %616 0 1 2 
					                                       f32_4 %618 = OpLoad %9 
					                                       f32_3 %619 = OpVectorShuffle %618 %618 0 0 0 
					                                       f32_3 %620 = OpFMul %617 %619 
					                                       f32_4 %621 = OpLoad %38 
					                                       f32_3 %622 = OpVectorShuffle %621 %621 0 1 2 
					                                       f32_3 %623 = OpFAdd %620 %622 
					                                       f32_4 %624 = OpLoad %9 
					                                       f32_4 %625 = OpVectorShuffle %624 %623 4 5 2 6 
					                                                      OpStore %9 %625 
					                              Uniform f32_4* %628 = OpAccessChain %25 %608 %55 
					                                       f32_4 %629 = OpLoad %628 
					                                       f32_3 %630 = OpVectorShuffle %629 %629 0 1 2 
					                                       f32_4 %631 = OpLoad %9 
					                                       f32_3 %632 = OpVectorShuffle %631 %631 2 2 2 
					                                       f32_3 %633 = OpFMul %630 %632 
					                                       f32_4 %634 = OpLoad %9 
					                                       f32_3 %635 = OpVectorShuffle %634 %634 0 1 3 
					                                       f32_3 %636 = OpFAdd %633 %635 
					                                                      OpStore vs_TEXCOORD6 %636 
					                                Private f32* %638 = OpAccessChain %63 %101 
					                                         f32 %639 = OpLoad %638 
					                                Private f32* %640 = OpAccessChain %63 %101 
					                                         f32 %641 = OpLoad %640 
					                                         f32 %642 = OpFMul %639 %641 
					                                                      OpStore %637 %642 
					                                Private f32* %643 = OpAccessChain %63 %118 
					                                         f32 %644 = OpLoad %643 
					                                Private f32* %645 = OpAccessChain %63 %118 
					                                         f32 %646 = OpLoad %645 
					                                         f32 %647 = OpFMul %644 %646 
					                                         f32 %648 = OpLoad %637 
					                                         f32 %649 = OpFNegate %648 
					                                         f32 %650 = OpFAdd %647 %649 
					                                                      OpStore %637 %650 
					                                       f32_4 %652 = OpLoad %63 
					                                       f32_4 %653 = OpVectorShuffle %652 %652 1 3 2 0 
					                                       f32_4 %654 = OpLoad %63 
					                                       f32_4 %655 = OpFMul %653 %654 
					                                                      OpStore %651 %655 
					                              Uniform f32_4* %657 = OpAccessChain %25 %55 
					                                       f32_4 %658 = OpLoad %657 
					                                       f32_4 %659 = OpLoad %651 
					                                         f32 %660 = OpDot %658 %659 
					                                Private f32* %661 = OpAccessChain %656 %118 
					                                                      OpStore %661 %660 
					                              Uniform f32_4* %662 = OpAccessChain %25 %65 
					                                       f32_4 %663 = OpLoad %662 
					                                       f32_4 %664 = OpLoad %651 
					                                         f32 %665 = OpDot %663 %664 
					                                Private f32* %666 = OpAccessChain %656 %101 
					                                                      OpStore %666 %665 
					                              Uniform f32_4* %668 = OpAccessChain %25 %667 
					                                       f32_4 %669 = OpLoad %668 
					                                       f32_4 %670 = OpLoad %651 
					                                         f32 %671 = OpDot %669 %670 
					                                Private f32* %672 = OpAccessChain %656 %242 
					                                                      OpStore %672 %671 
					                              Uniform f32_4* %675 = OpAccessChain %25 %674 
					                                       f32_4 %676 = OpLoad %675 
					                                       f32_3 %677 = OpVectorShuffle %676 %676 0 1 2 
					                                         f32 %678 = OpLoad %637 
					                                       f32_3 %679 = OpCompositeConstruct %678 %678 %678 
					                                       f32_3 %680 = OpFMul %677 %679 
					                                       f32_3 %681 = OpLoad %656 
					                                       f32_3 %682 = OpFAdd %680 %681 
					                                                      OpStore vs_TEXCOORD7 %682 
					                                 Output f32* %683 = OpAccessChain %105 %47 %101 
					                                         f32 %684 = OpLoad %683 
					                                         f32 %685 = OpFNegate %684 
					                                 Output f32* %686 = OpAccessChain %105 %47 %101 
					                                                      OpStore %686 %685 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 389
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %21 %43 %121 %144 %298 %304 %309 %313 %359 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
					                                                      OpName vs_TEXCOORD7 "vs_TEXCOORD7" 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %12 RelaxedPrecision 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %16 RelaxedPrecision 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %17 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 21 
					                                                      OpDecorate %28 RelaxedPrecision 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %35 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD5 Location 43 
					                                                      OpMemberDecorate %59 0 Offset 59 
					                                                      OpMemberDecorate %59 1 RelaxedPrecision 
					                                                      OpMemberDecorate %59 1 Offset 59 
					                                                      OpMemberDecorate %59 2 RelaxedPrecision 
					                                                      OpMemberDecorate %59 2 Offset 59 
					                                                      OpMemberDecorate %59 3 RelaxedPrecision 
					                                                      OpMemberDecorate %59 3 Offset 59 
					                                                      OpMemberDecorate %59 4 RelaxedPrecision 
					                                                      OpMemberDecorate %59 4 Offset 59 
					                                                      OpMemberDecorate %59 5 RelaxedPrecision 
					                                                      OpMemberDecorate %59 5 Offset 59 
					                                                      OpMemberDecorate %59 6 Offset 59 
					                                                      OpMemberDecorate %59 7 Offset 59 
					                                                      OpMemberDecorate %59 8 RelaxedPrecision 
					                                                      OpMemberDecorate %59 8 Offset 59 
					                                                      OpMemberDecorate %59 9 Offset 59 
					                                                      OpMemberDecorate %59 10 Offset 59 
					                                                      OpMemberDecorate %59 11 Offset 59 
					                                                      OpMemberDecorate %59 12 RelaxedPrecision 
					                                                      OpMemberDecorate %59 12 Offset 59 
					                                                      OpMemberDecorate %59 13 Offset 59 
					                                                      OpMemberDecorate %59 14 Offset 59 
					                                                      OpDecorate %59 Block 
					                                                      OpDecorate %61 DescriptorSet 61 
					                                                      OpDecorate %61 Binding 61 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 121 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %126 DescriptorSet 126 
					                                                      OpDecorate %126 Binding 126 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %128 DescriptorSet 128 
					                                                      OpDecorate %128 Binding 128 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %144 Location 144 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %174 DescriptorSet 174 
					                                                      OpDecorate %174 Binding 174 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %176 DescriptorSet 176 
					                                                      OpDecorate %176 Binding 176 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %239 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %298 Location 298 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 304 
					                                                      OpDecorate vs_TEXCOORD3 Location 309 
					                                                      OpDecorate vs_TEXCOORD4 Location 313 
					                                                      OpDecorate %333 RelaxedPrecision 
					                                                      OpDecorate %334 RelaxedPrecision 
					                                                      OpDecorate %340 RelaxedPrecision 
					                                                      OpDecorate %346 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %357 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 Location 359 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %361 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %366 RelaxedPrecision 
					                                                      OpDecorate %367 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %369 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %371 RelaxedPrecision 
					                                                      OpDecorate %374 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %376 RelaxedPrecision 
					                                                      OpDecorate %379 RelaxedPrecision 
					                                                      OpDecorate %380 RelaxedPrecision 
					                                                      OpDecorate %381 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %383 RelaxedPrecision 
					                                                      OpDecorate %384 RelaxedPrecision 
					                                                      OpDecorate %385 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %11 = OpTypePointer UniformConstant %10 
					         UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                              %14 = OpTypeSampler 
					                                              %15 = OpTypePointer UniformConstant %14 
					                     UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                              %18 = OpTypeSampledImage %10 
					                                              %20 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                              %22 = OpTypeVector %6 2 
					                                              %26 = OpTypeInt 32 0 
					                                          u32 %27 = OpConstant 3 
					                                          u32 %29 = OpConstant 0 
					                                              %30 = OpTypePointer Private %6 
					                               Private f32_4* %32 = OpVariable Private 
					                                          f32 %36 = OpConstant 3,674022E-40 
					                               Private f32_4* %39 = OpVariable Private 
					                                              %42 = OpTypePointer Input %22 
					                        Input f32_2* vs_TEXCOORD5 = OpVariable Input 
					                                              %44 = OpTypePointer Input %6 
					                                          u32 %52 = OpConstant 1 
					                                 Private f32* %58 = OpVariable Private 
					                                              %59 = OpTypeStruct %7 %7 %7 %7 %7 %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 
					                                              %60 = OpTypePointer Uniform %59 
					Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32;}* %61 = OpVariable Uniform 
					                                              %62 = OpTypeInt 32 1 
					                                          i32 %63 = OpConstant 13 
					                                              %64 = OpTypePointer Uniform %6 
					                                          i32 %67 = OpConstant 14 
					                               Private f32_4* %75 = OpVariable Private 
					                                          f32 %84 = OpConstant 3,674022E-40 
					                                          f32 %85 = OpConstant 3,674022E-40 
					                                              %88 = OpTypeVector %6 3 
					                                              %89 = OpTypePointer Private %88 
					                               Private f32_3* %90 = OpVariable Private 
					                                 Private f32* %98 = OpVariable Private 
					                                         i32 %108 = OpConstant 10 
					                                         i32 %111 = OpConstant 11 
					                                         i32 %115 = OpConstant 0 
					                                             %116 = OpTypePointer Uniform %7 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					        UniformConstant read_only Texture2D* %126 = OpVariable UniformConstant 
					                    UniformConstant sampler* %128 = OpVariable UniformConstant 
					                                         i32 %136 = OpConstant 12 
					                              Private f32_4* %143 = OpVariable Private 
					                                Input f32_4* %144 = OpVariable Input 
					                                Private f32* %151 = OpVariable Private 
					                                             %157 = OpTypePointer Private %22 
					                              Private f32_2* %158 = OpVariable Private 
					                                         i32 %159 = OpConstant 6 
					                                         i32 %162 = OpConstant 7 
					                              Private f32_4* %173 = OpVariable Private 
					        UniformConstant read_only Texture2D* %174 = OpVariable UniformConstant 
					                    UniformConstant sampler* %176 = OpVariable UniformConstant 
					                              Private f32_4* %181 = OpVariable Private 
					                                         i32 %183 = OpConstant 8 
					                              Private f32_4* %187 = OpVariable Private 
					                              Private f32_4* %191 = OpVariable Private 
					                                Private f32* %243 = OpVariable Private 
					                                         i32 %244 = OpConstant 9 
					                                Private f32* %250 = OpVariable Private 
					                              Private f32_3* %286 = OpVariable Private 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %297 = OpTypePointer Output %7 
					                               Output f32_4* %298 = OpVariable Output 
					                                             %301 = OpTypePointer Output %6 
					                              Private f32_3* %303 = OpVariable Private 
					                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
					                                         u32 %305 = OpConstant 2 
					                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
					                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
					                                Private f32* %317 = OpVariable Private 
					                                         i32 %331 = OpConstant 1 
					                                         i32 %338 = OpConstant 2 
					                                         i32 %344 = OpConstant 3 
					                                         i32 %350 = OpConstant 4 
					                                             %358 = OpTypePointer Input %88 
					                        Input f32_3* vs_TEXCOORD7 = OpVariable Input 
					                                       f32_4 %365 = OpConstantComposite %84 %84 %84 %84 
					                                         i32 %372 = OpConstant 5 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                          read_only Texture2D %13 = OpLoad %12 
					                                      sampler %17 = OpLoad %16 
					                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                        f32_4 %23 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %24 = OpVectorShuffle %23 %23 0 1 
					                                        f32_4 %25 = OpImageSampleImplicitLod %19 %24 
					                                          f32 %28 = OpCompositeExtract %25 3 
					                                 Private f32* %31 = OpAccessChain %9 %29 
					                                                      OpStore %31 %28 
					                                 Private f32* %33 = OpAccessChain %9 %29 
					                                          f32 %34 = OpLoad %33 
					                                          f32 %35 = OpFNegate %34 
					                                          f32 %37 = OpFAdd %35 %36 
					                                 Private f32* %38 = OpAccessChain %32 %29 
					                                                      OpStore %38 %37 
					                                 Private f32* %40 = OpAccessChain %32 %29 
					                                          f32 %41 = OpLoad %40 
					                                   Input f32* %45 = OpAccessChain vs_TEXCOORD5 %29 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %47 = OpFNegate %46 
					                                          f32 %48 = OpFAdd %41 %47 
					                                 Private f32* %49 = OpAccessChain %39 %29 
					                                                      OpStore %49 %48 
					                                 Private f32* %50 = OpAccessChain %39 %29 
					                                          f32 %51 = OpLoad %50 
					                                   Input f32* %53 = OpAccessChain vs_TEXCOORD5 %52 
					                                          f32 %54 = OpLoad %53 
					                                          f32 %55 = OpFMul %51 %54 
					                                          f32 %56 = OpFAdd %55 %36 
					                                 Private f32* %57 = OpAccessChain %39 %29 
					                                                      OpStore %57 %56 
					                                 Uniform f32* %65 = OpAccessChain %61 %63 
					                                          f32 %66 = OpLoad %65 
					                                 Uniform f32* %68 = OpAccessChain %61 %67 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpFMul %66 %69 
					                                                      OpStore %58 %70 
					                                          f32 %71 = OpLoad %58 
					                                   Input f32* %72 = OpAccessChain vs_TEXCOORD5 %52 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpFMul %71 %73 
					                                                      OpStore %58 %74 
					                                          f32 %76 = OpLoad %58 
					                                          f32 %77 = OpFMul %76 %36 
					                                 Private f32* %78 = OpAccessChain %39 %29 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFAdd %77 %79 
					                                 Private f32* %81 = OpAccessChain %75 %29 
					                                                      OpStore %81 %80 
					                                 Private f32* %82 = OpAccessChain %75 %29 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %86 = OpExtInst %1 43 %83 %84 %85 
					                                 Private f32* %87 = OpAccessChain %75 %29 
					                                                      OpStore %87 %86 
					                                          f32 %91 = OpLoad %58 
					                                          f32 %92 = OpFNegate %91 
					                                          f32 %93 = OpFMul %92 %36 
					                                 Private f32* %94 = OpAccessChain %39 %29 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFAdd %93 %95 
					                                 Private f32* %97 = OpAccessChain %90 %29 
					                                                      OpStore %97 %96 
					                                          f32 %99 = OpLoad %58 
					                                         f32 %100 = OpExtInst %1 37 %99 %85 
					                                                      OpStore %98 %100 
					                                         f32 %101 = OpLoad %98 
					                                         f32 %102 = OpExtInst %1 31 %101 
					                                                      OpStore %98 %102 
					                                         f32 %103 = OpLoad %98 
					                                Private f32* %104 = OpAccessChain %75 %29 
					                                         f32 %105 = OpLoad %104 
					                                         f32 %106 = OpFMul %103 %105 
					                                Private f32* %107 = OpAccessChain %75 %29 
					                                                      OpStore %107 %106 
					                                Uniform f32* %109 = OpAccessChain %61 %108 
					                                         f32 %110 = OpLoad %109 
					                                Uniform f32* %112 = OpAccessChain %61 %111 
					                                         f32 %113 = OpLoad %112 
					                                       f32_2 %114 = OpCompositeConstruct %110 %113 
					                              Uniform f32_4* %117 = OpAccessChain %61 %115 
					                                       f32_4 %118 = OpLoad %117 
					                                       f32_2 %119 = OpVectorShuffle %118 %118 1 1 
					                                       f32_2 %120 = OpFMul %114 %119 
					                                       f32_2 %122 = OpLoad vs_TEXCOORD1 
					                                       f32_2 %123 = OpFAdd %120 %122 
					                                       f32_4 %124 = OpLoad %39 
					                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 2 3 
					                                                      OpStore %39 %125 
					                         read_only Texture2D %127 = OpLoad %126 
					                                     sampler %129 = OpLoad %128 
					                  read_only Texture2DSampled %130 = OpSampledImage %127 %129 
					                                       f32_4 %131 = OpLoad %39 
					                                       f32_2 %132 = OpVectorShuffle %131 %131 0 1 
					                                       f32_4 %133 = OpImageSampleImplicitLod %130 %132 
					                                                      OpStore %9 %133 
					                                       f32_4 %134 = OpLoad %9 
					                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
					                              Uniform f32_4* %137 = OpAccessChain %61 %136 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
					                                       f32_3 %140 = OpFMul %135 %139 
					                                       f32_4 %141 = OpLoad %32 
					                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
					                                                      OpStore %32 %142 
					                                  Input f32* %145 = OpAccessChain %144 %27 
					                                         f32 %146 = OpLoad %145 
					                                Uniform f32* %147 = OpAccessChain %61 %136 %27 
					                                         f32 %148 = OpLoad %147 
					                                         f32 %149 = OpFMul %146 %148 
					                                Private f32* %150 = OpAccessChain %143 %29 
					                                                      OpStore %150 %149 
					                                Private f32* %152 = OpAccessChain %9 %27 
					                                         f32 %153 = OpLoad %152 
					                                Private f32* %154 = OpAccessChain %143 %29 
					                                         f32 %155 = OpLoad %154 
					                                         f32 %156 = OpFMul %153 %155 
					                                                      OpStore %151 %156 
					                                Uniform f32* %160 = OpAccessChain %61 %159 
					                                         f32 %161 = OpLoad %160 
					                                Uniform f32* %163 = OpAccessChain %61 %162 
					                                         f32 %164 = OpLoad %163 
					                                       f32_2 %165 = OpCompositeConstruct %161 %164 
					                              Uniform f32_4* %166 = OpAccessChain %61 %115 
					                                       f32_4 %167 = OpLoad %166 
					                                       f32_2 %168 = OpVectorShuffle %167 %167 1 1 
					                                       f32_2 %169 = OpFMul %165 %168 
					                                       f32_4 %170 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %171 = OpVectorShuffle %170 %170 2 3 
					                                       f32_2 %172 = OpFAdd %169 %171 
					                                                      OpStore %158 %172 
					                         read_only Texture2D %175 = OpLoad %174 
					                                     sampler %177 = OpLoad %176 
					                  read_only Texture2DSampled %178 = OpSampledImage %175 %177 
					                                       f32_2 %179 = OpLoad %158 
					                                       f32_4 %180 = OpImageSampleImplicitLod %178 %179 
					                                                      OpStore %173 %180 
					                                       f32_4 %182 = OpLoad %144 
					                              Uniform f32_4* %184 = OpAccessChain %61 %183 
					                                       f32_4 %185 = OpLoad %184 
					                                       f32_4 %186 = OpFMul %182 %185 
					                                                      OpStore %181 %186 
					                                       f32_4 %188 = OpLoad %173 
					                                       f32_4 %189 = OpLoad %181 
					                                       f32_4 %190 = OpFMul %188 %189 
					                                                      OpStore %187 %190 
					                                       f32_4 %192 = OpLoad %187 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
					                                       f32_4 %194 = OpLoad %187 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                       f32_3 %196 = OpFMul %193 %195 
					                                       f32_4 %197 = OpLoad %191 
					                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
					                                                      OpStore %191 %198 
					                                       f32_4 %199 = OpLoad %32 
					                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
					                                         f32 %201 = OpLoad %151 
					                                       f32_3 %202 = OpCompositeConstruct %201 %201 %201 
					                                       f32_3 %203 = OpFMul %200 %202 
					                                       f32_4 %204 = OpLoad %191 
					                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
					                                       f32_3 %206 = OpFNegate %205 
					                                       f32_3 %207 = OpFAdd %203 %206 
					                                       f32_4 %208 = OpLoad %191 
					                                       f32_4 %209 = OpVectorShuffle %208 %207 4 5 6 3 
					                                                      OpStore %191 %209 
					                                Private f32* %210 = OpAccessChain %143 %29 
					                                         f32 %211 = OpLoad %210 
					                                Private f32* %212 = OpAccessChain %9 %27 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpFMul %211 %213 
					                                Private f32* %215 = OpAccessChain %187 %27 
					                                         f32 %216 = OpLoad %215 
					                                         f32 %217 = OpFNegate %216 
					                                         f32 %218 = OpFAdd %214 %217 
					                                Private f32* %219 = OpAccessChain %191 %27 
					                                                      OpStore %219 %218 
					                                       f32_4 %220 = OpLoad %75 
					                                       f32_4 %221 = OpVectorShuffle %220 %220 0 0 0 0 
					                                       f32_4 %222 = OpLoad %191 
					                                       f32_4 %223 = OpFMul %221 %222 
					                                                      OpStore %32 %223 
					                                Private f32* %224 = OpAccessChain %181 %27 
					                                         f32 %225 = OpLoad %224 
					                                Private f32* %226 = OpAccessChain %173 %27 
					                                         f32 %227 = OpLoad %226 
					                                         f32 %228 = OpFMul %225 %227 
					                                Private f32* %229 = OpAccessChain %32 %27 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFAdd %228 %230 
					                                Private f32* %232 = OpAccessChain %143 %27 
					                                                      OpStore %232 %231 
					                                       f32_4 %233 = OpLoad %187 
					                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
					                                       f32_4 %235 = OpLoad %187 
					                                       f32_3 %236 = OpVectorShuffle %235 %235 3 3 3 
					                                       f32_3 %237 = OpFMul %234 %236 
					                                       f32_4 %238 = OpLoad %32 
					                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
					                                       f32_3 %240 = OpFAdd %237 %239 
					                                       f32_4 %241 = OpLoad %143 
					                                       f32_4 %242 = OpVectorShuffle %241 %240 4 5 6 3 
					                                                      OpStore %143 %242 
					                                Uniform f32* %245 = OpAccessChain %61 %244 
					                                         f32 %246 = OpLoad %245 
					                                Uniform f32* %247 = OpAccessChain %61 %67 
					                                         f32 %248 = OpLoad %247 
					                                         f32 %249 = OpFMul %246 %248 
					                                                      OpStore %243 %249 
					                                         f32 %251 = OpLoad %243 
					                                  Input f32* %252 = OpAccessChain vs_TEXCOORD5 %52 
					                                         f32 %253 = OpLoad %252 
					                                         f32 %254 = OpFMul %251 %253 
					                                                      OpStore %250 %254 
					                                         f32 %255 = OpLoad %243 
					                                  Input f32* %256 = OpAccessChain vs_TEXCOORD5 %52 
					                                         f32 %257 = OpLoad %256 
					                                         f32 %258 = OpFMul %255 %257 
					                                         f32 %259 = OpFAdd %258 %85 
					                                Private f32* %260 = OpAccessChain %75 %29 
					                                                      OpStore %260 %259 
					                                         f32 %261 = OpLoad %250 
					                                         f32 %262 = OpFMul %261 %36 
					                                Private f32* %263 = OpAccessChain %90 %29 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %265 = OpFAdd %262 %264 
					                                Private f32* %266 = OpAccessChain %90 %29 
					                                                      OpStore %266 %265 
					                                Private f32* %267 = OpAccessChain %90 %29 
					                                         f32 %268 = OpLoad %267 
					                                Private f32* %269 = OpAccessChain %75 %29 
					                                         f32 %270 = OpLoad %269 
					                                         f32 %271 = OpFDiv %268 %270 
					                                Private f32* %272 = OpAccessChain %75 %29 
					                                                      OpStore %272 %271 
					                                Private f32* %273 = OpAccessChain %75 %29 
					                                         f32 %274 = OpLoad %273 
					                                         f32 %275 = OpExtInst %1 43 %274 %84 %85 
					                                Private f32* %276 = OpAccessChain %75 %29 
					                                                      OpStore %276 %275 
					                                Private f32* %277 = OpAccessChain %75 %29 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFNegate %278 
					                                         f32 %280 = OpFAdd %279 %85 
					                                Private f32* %281 = OpAccessChain %75 %29 
					                                                      OpStore %281 %280 
					                                       f32_4 %282 = OpLoad %75 
					                                       f32_4 %283 = OpVectorShuffle %282 %282 0 0 0 0 
					                                       f32_4 %284 = OpLoad %143 
					                                       f32_4 %285 = OpFMul %283 %284 
					                                                      OpStore %32 %285 
					                                Private f32* %287 = OpAccessChain %32 %27 
					                                         f32 %288 = OpLoad %287 
					                                         f32 %290 = OpExtInst %1 40 %288 %289 
					                                Private f32* %291 = OpAccessChain %286 %29 
					                                                      OpStore %291 %290 
					                                       f32_4 %292 = OpLoad %32 
					                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
					                                       f32_3 %294 = OpLoad %286 
					                                       f32_3 %295 = OpVectorShuffle %294 %294 0 0 0 
					                                       f32_3 %296 = OpFDiv %293 %295 
					                                                      OpStore %286 %296 
					                                Private f32* %299 = OpAccessChain %32 %27 
					                                         f32 %300 = OpLoad %299 
					                                 Output f32* %302 = OpAccessChain %298 %27 
					                                                      OpStore %302 %300 
					                                  Input f32* %306 = OpAccessChain vs_TEXCOORD2 %305 
					                                         f32 %307 = OpLoad %306 
					                                Private f32* %308 = OpAccessChain %303 %29 
					                                                      OpStore %308 %307 
					                                  Input f32* %310 = OpAccessChain vs_TEXCOORD3 %305 
					                                         f32 %311 = OpLoad %310 
					                                Private f32* %312 = OpAccessChain %303 %52 
					                                                      OpStore %312 %311 
					                                  Input f32* %314 = OpAccessChain vs_TEXCOORD4 %305 
					                                         f32 %315 = OpLoad %314 
					                                Private f32* %316 = OpAccessChain %303 %305 
					                                                      OpStore %316 %315 
					                                       f32_3 %318 = OpLoad %303 
					                                       f32_3 %319 = OpLoad %303 
					                                         f32 %320 = OpDot %318 %319 
					                                                      OpStore %317 %320 
					                                         f32 %321 = OpLoad %317 
					                                         f32 %322 = OpExtInst %1 32 %321 
					                                                      OpStore %317 %322 
					                                         f32 %323 = OpLoad %317 
					                                       f32_3 %324 = OpCompositeConstruct %323 %323 %323 
					                                       f32_3 %325 = OpLoad %303 
					                                       f32_3 %326 = OpFMul %324 %325 
					                                       f32_4 %327 = OpLoad %39 
					                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 6 3 
					                                                      OpStore %39 %328 
					                                       f32_4 %329 = OpLoad %39 
					                                       f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
					                              Uniform f32_4* %332 = OpAccessChain %61 %331 
					                                       f32_4 %333 = OpLoad %332 
					                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
					                                         f32 %335 = OpDot %330 %334 
					                                Private f32* %336 = OpAccessChain %75 %29 
					                                                      OpStore %336 %335 
					                                Private f32* %337 = OpAccessChain %39 %27 
					                                                      OpStore %337 %85 
					                              Uniform f32_4* %339 = OpAccessChain %61 %338 
					                                       f32_4 %340 = OpLoad %339 
					                                       f32_4 %341 = OpLoad %39 
					                                         f32 %342 = OpDot %340 %341 
					                                Private f32* %343 = OpAccessChain %191 %29 
					                                                      OpStore %343 %342 
					                              Uniform f32_4* %345 = OpAccessChain %61 %344 
					                                       f32_4 %346 = OpLoad %345 
					                                       f32_4 %347 = OpLoad %39 
					                                         f32 %348 = OpDot %346 %347 
					                                Private f32* %349 = OpAccessChain %191 %52 
					                                                      OpStore %349 %348 
					                              Uniform f32_4* %351 = OpAccessChain %61 %350 
					                                       f32_4 %352 = OpLoad %351 
					                                       f32_4 %353 = OpLoad %39 
					                                         f32 %354 = OpDot %352 %353 
					                                Private f32* %355 = OpAccessChain %191 %305 
					                                                      OpStore %355 %354 
					                                       f32_4 %356 = OpLoad %191 
					                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
					                                       f32_3 %360 = OpLoad vs_TEXCOORD7 
					                                       f32_3 %361 = OpFAdd %357 %360 
					                                       f32_4 %362 = OpLoad %75 
					                                       f32_4 %363 = OpVectorShuffle %362 %361 0 4 5 6 
					                                                      OpStore %75 %363 
					                                       f32_4 %364 = OpLoad %75 
					                                       f32_4 %366 = OpExtInst %1 40 %364 %365 
					                                                      OpStore %75 %366 
					                                       f32_4 %367 = OpLoad %75 
					                                       f32_3 %368 = OpVectorShuffle %367 %367 1 2 3 
					                                       f32_3 %369 = OpLoad %286 
					                                       f32_3 %370 = OpFMul %368 %369 
					                                                      OpStore %90 %370 
					                                       f32_3 %371 = OpLoad %286 
					                              Uniform f32_4* %373 = OpAccessChain %61 %372 
					                                       f32_4 %374 = OpLoad %373 
					                                       f32_3 %375 = OpVectorShuffle %374 %374 0 1 2 
					                                       f32_3 %376 = OpFMul %371 %375 
					                                       f32_4 %377 = OpLoad %191 
					                                       f32_4 %378 = OpVectorShuffle %377 %376 4 5 6 3 
					                                                      OpStore %191 %378 
					                                       f32_4 %379 = OpLoad %191 
					                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
					                                       f32_4 %381 = OpLoad %75 
					                                       f32_3 %382 = OpVectorShuffle %381 %381 0 0 0 
					                                       f32_3 %383 = OpFMul %380 %382 
					                                       f32_3 %384 = OpLoad %90 
					                                       f32_3 %385 = OpFAdd %383 %384 
					                                       f32_4 %386 = OpLoad %298 
					                                       f32_4 %387 = OpVectorShuffle %386 %385 4 5 6 3 
					                                                      OpStore %298 %387 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						float _FaceDilate;
						vec4 unused_0_2[6];
						mat4x4 _EnvMatrix;
						vec4 unused_0_4[7];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_10[4];
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						vec4 unused_0_15;
						vec4 _MainTex_ST;
						vec4 _FaceTex_ST;
						vec4 _OutlineTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[42];
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_5[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
						vec4 unused_3_4;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					int u_xlati5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat3.x = floor(u_xlat15);
					    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat16 = (-_WeightNormal) + _WeightBold;
					    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
					    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
					    u_xlat15 = u_xlat15 * _ScaleRatioA;
					    vs_TEXCOORD5.x = u_xlat15 * 0.5;
					    u_xlat15 = u_xlat2.y * unity_MatrixVP[1].w;
					    u_xlat15 = unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
					    u_xlat15 = unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
					    u_xlat15 = unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
					    u_xlat2.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat2.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat16 = u_xlat15 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat16 = u_xlat16 * u_xlat2.x;
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
					    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + unity_WorldToObject[3].xyz;
					    u_xlat0.z = in_POSITION0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
					    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati5) + u_xlati0;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat2.x = dot(u_xlat0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(u_xlat0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(u_xlat0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
					    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
					    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
					    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat15 + u_xlat16;
					    vs_TEXCOORD2.w = u_xlat1.x;
					    u_xlat3.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.w = u_xlat1.y;
					    vs_TEXCOORD4.w = u_xlat1.z;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD4.z = u_xlat2.w;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * _EnvMatrix[1].xyz;
					    u_xlat0.xyw = _EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = _EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD7.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 unity_SHBr;
					uniform 	vec4 unity_SHBg;
					uniform 	vec4 unity_SHBb;
					uniform 	vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_WorldTransformParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	float _FaceDilate;
					uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
					uniform 	float _WeightNormal;
					uniform 	float _WeightBold;
					uniform 	float _ScaleRatioA;
					uniform 	float _VertexOffsetX;
					uniform 	float _VertexOffsetY;
					uniform 	float _GradientScale;
					uniform 	float _ScaleX;
					uniform 	float _ScaleY;
					uniform 	float _PerspectiveFilter;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _FaceTex_ST;
					uniform 	vec4 _OutlineTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					int u_xlati5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat3.x = floor(u_xlat15);
					    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat16 = (-_WeightNormal) + _WeightBold;
					    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
					    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
					    u_xlat15 = u_xlat15 * _ScaleRatioA;
					    vs_TEXCOORD5.x = u_xlat15 * 0.5;
					    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
					    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
					    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
					    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
					    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat16 = u_xlat15 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat16 = u_xlat16 * u_xlat2.x;
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
					    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
					    u_xlat0.z = in_POSITION0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
					    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati5) + u_xlati0;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
					    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
					    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
					    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat15 + u_xlat16;
					    vs_TEXCOORD2.w = u_xlat1.x;
					    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.w = u_xlat1.y;
					    vs_TEXCOORD4.w = u_xlat1.z;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD4.z = u_xlat2.w;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD7.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
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
					uniform 	vec4 _Time;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 unity_SHAr;
					uniform 	vec4 unity_SHAg;
					uniform 	vec4 unity_SHAb;
					uniform 	vec4 _LightColor0;
					uniform 	float _FaceUVSpeedX;
					uniform 	float _FaceUVSpeedY;
					uniform 	vec4 _FaceColor;
					uniform 	float _OutlineSoftness;
					uniform 	float _OutlineUVSpeedX;
					uniform 	float _OutlineUVSpeedY;
					uniform 	vec4 _OutlineColor;
					uniform 	float _OutlineWidth;
					uniform 	float _ScaleRatioA;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
					UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat5;
					float u_xlat6;
					float u_xlat10;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
					    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
					    u_xlat1.x = vs_COLOR0.w * _OutlineColor.w;
					    u_xlat1.w = u_xlat10_0.w * u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.www;
					    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
					    u_xlat10_0 = texture(_FaceTex, u_xlat0.xy);
					    u_xlat2 = vs_COLOR0 * _FaceColor;
					    u_xlat0 = u_xlat10_0 * u_xlat2;
					    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2 = (-u_xlat10_2.w) + 0.5;
					    u_xlat2.x = u_xlat16_2 + (-vs_TEXCOORD5.x);
					    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y + 0.5;
					    u_xlat6 = _OutlineWidth * _ScaleRatioA;
					    u_xlat6 = u_xlat6 * vs_TEXCOORD5.y;
					    u_xlat10 = u_xlat6 * 0.5 + u_xlat2.x;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat6) * 0.5 + u_xlat2.x;
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat0 = vec4(u_xlat6) * u_xlat1 + u_xlat0;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat5 = u_xlat1.x * vs_TEXCOORD5.y;
					    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
					    u_xlat5 = u_xlat5 * 0.5 + u_xlat2.x;
					    u_xlat1.x = u_xlat5 / u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.x = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xxx;
					    SV_Target0.w = u_xlat0.w;
					    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat2.x = vs_TEXCOORD2.z;
					    u_xlat2.y = vs_TEXCOORD3.z;
					    u_xlat2.z = vs_TEXCOORD4.z;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat2);
					    u_xlat3.y = dot(unity_SHAg, u_xlat2);
					    u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    u_xlat12 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD7.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 688
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %105 %117 %143 %158 %170 %221 %386 %494 %498 %577 %581 %603 %604 %627 %673 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
					                                                      OpName vs_TEXCOORD6 "vs_TEXCOORD6" 
					                                                      OpName vs_TEXCOORD7 "vs_TEXCOORD7" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpDecorate %22 ArrayStride 22 
					                                                      OpMemberDecorate %23 0 Offset 23 
					                                                      OpMemberDecorate %23 1 Offset 23 
					                                                      OpMemberDecorate %23 2 RelaxedPrecision 
					                                                      OpMemberDecorate %23 2 Offset 23 
					                                                      OpMemberDecorate %23 3 RelaxedPrecision 
					                                                      OpMemberDecorate %23 3 Offset 23 
					                                                      OpMemberDecorate %23 4 RelaxedPrecision 
					                                                      OpMemberDecorate %23 4 Offset 23 
					                                                      OpMemberDecorate %23 5 RelaxedPrecision 
					                                                      OpMemberDecorate %23 5 Offset 23 
					                                                      OpMemberDecorate %23 6 Offset 23 
					                                                      OpMemberDecorate %23 7 Offset 23 
					                                                      OpMemberDecorate %23 8 Offset 23 
					                                                      OpMemberDecorate %23 9 Offset 23 
					                                                      OpMemberDecorate %23 10 Offset 23 
					                                                      OpMemberDecorate %23 11 Offset 23 
					                                                      OpMemberDecorate %23 12 Offset 23 
					                                                      OpMemberDecorate %23 13 Offset 23 
					                                                      OpMemberDecorate %23 14 Offset 23 
					                                                      OpMemberDecorate %23 15 Offset 23 
					                                                      OpMemberDecorate %23 16 Offset 23 
					                                                      OpMemberDecorate %23 17 Offset 23 
					                                                      OpMemberDecorate %23 18 Offset 23 
					                                                      OpMemberDecorate %23 19 Offset 23 
					                                                      OpMemberDecorate %23 20 Offset 23 
					                                                      OpMemberDecorate %23 21 Offset 23 
					                                                      OpMemberDecorate %23 22 Offset 23 
					                                                      OpMemberDecorate %23 23 Offset 23 
					                                                      OpMemberDecorate %23 24 Offset 23 
					                                                      OpDecorate %23 Block 
					                                                      OpDecorate %25 DescriptorSet 25 
					                                                      OpDecorate %25 Binding 25 
					                                                      OpMemberDecorate %103 0 BuiltIn 103 
					                                                      OpMemberDecorate %103 1 BuiltIn 103 
					                                                      OpMemberDecorate %103 2 BuiltIn 103 
					                                                      OpDecorate %103 Block 
					                                                      OpDecorate %117 Location 117 
					                                                      OpDecorate vs_TEXCOORD0 Location 143 
					                                                      OpDecorate vs_TEXCOORD1 Location 158 
					                                                      OpDecorate %170 Location 170 
					                                                      OpDecorate vs_TEXCOORD5 Location 221 
					                                                      OpDecorate %386 Location 386 
					                                                      OpDecorate vs_TEXCOORD2 Location 494 
					                                                      OpDecorate %498 Location 498 
					                                                      OpDecorate vs_TEXCOORD3 Location 577 
					                                                      OpDecorate vs_TEXCOORD4 Location 581 
					                                                      OpDecorate %603 RelaxedPrecision 
					                                                      OpDecorate %603 Location 603 
					                                                      OpDecorate %604 RelaxedPrecision 
					                                                      OpDecorate %604 Location 604 
					                                                      OpDecorate %605 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD6 Location 627 
					                                                      OpDecorate %637 RelaxedPrecision 
					                                                      OpDecorate %648 RelaxedPrecision 
					                                                      OpDecorate %649 RelaxedPrecision 
					                                                      OpDecorate %651 RelaxedPrecision 
					                                                      OpDecorate %656 RelaxedPrecision 
					                                                      OpDecorate %658 RelaxedPrecision 
					                                                      OpDecorate %659 RelaxedPrecision 
					                                                      OpDecorate %660 RelaxedPrecision 
					                                                      OpDecorate %663 RelaxedPrecision 
					                                                      OpDecorate %664 RelaxedPrecision 
					                                                      OpDecorate %665 RelaxedPrecision 
					                                                      OpDecorate %669 RelaxedPrecision 
					                                                      OpDecorate %670 RelaxedPrecision 
					                                                      OpDecorate %671 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 Location 673 
					                                                      OpDecorate %676 RelaxedPrecision 
					                                                      OpDecorate %677 RelaxedPrecision 
					                                                      OpDecorate %678 RelaxedPrecision 
					                                                      OpDecorate %679 RelaxedPrecision 
					                                                      OpDecorate %680 RelaxedPrecision 
					                                                      OpDecorate %681 RelaxedPrecision 
					                                                      OpDecorate %682 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                                 Input f32_4* %11 = OpVariable Input 
					                                              %12 = OpTypeVector %6 2 
					                                              %15 = OpTypeVector %6 3 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %7 %17 
					                                              %19 = OpTypeArray %7 %17 
					                                              %20 = OpTypeArray %7 %17 
					                                              %21 = OpTypeArray %7 %17 
					                                              %22 = OpTypeArray %7 %17 
					                                              %23 = OpTypeStruct %15 %7 %7 %7 %7 %7 %18 %19 %7 %20 %21 %6 %22 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %7 %7 
					                                              %24 = OpTypePointer Uniform %23 
					Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32; f32_4[4]; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32_4;}* %25 = OpVariable Uniform 
					                                              %26 = OpTypeInt 32 1 
					                                          i32 %27 = OpConstant 16 
					                                              %28 = OpTypePointer Uniform %6 
					                                          i32 %31 = OpConstant 17 
					                               Private f32_4* %38 = OpVariable Private 
					                                          i32 %41 = OpConstant 6 
					                                          i32 %42 = OpConstant 1 
					                                              %43 = OpTypePointer Uniform %7 
					                                          i32 %47 = OpConstant 0 
					                                          i32 %55 = OpConstant 2 
					                               Private f32_4* %63 = OpVariable Private 
					                                          i32 %65 = OpConstant 3 
					                               Private f32_4* %80 = OpVariable Private 
					                                          i32 %83 = OpConstant 10 
					                                         u32 %101 = OpConstant 1 
					                                             %102 = OpTypeArray %6 %101 
					                                             %103 = OpTypeStruct %7 %6 %102 
					                                             %104 = OpTypePointer Output %103 
					        Output struct {f32_4; f32; f32[1];}* %105 = OpVariable Output 
					                                             %113 = OpTypePointer Output %7 
					                                             %115 = OpTypePointer Private %6 
					                                Private f32* %116 = OpVariable Private 
					                                Input f32_4* %117 = OpVariable Input 
					                                         u32 %118 = OpConstant 0 
					                                             %119 = OpTypePointer Input %6 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                         f32 %130 = OpConstant 3,674022E-40 
					                                         f32 %138 = OpConstant 3,674022E-40 
					                                       f32_2 %139 = OpConstantComposite %138 %138 
					                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                                         i32 %146 = OpConstant 23 
					                                             %157 = OpTypePointer Output %12 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         i32 %161 = OpConstant 24 
					                                Input f32_4* %170 = OpVariable Input 
					                                         i32 %173 = OpConstant 22 
					                                             %184 = OpTypeBool 
					                                             %185 = OpTypePointer Private %184 
					                               Private bool* %186 = OpVariable Private 
					                                         f32 %187 = OpConstant 3,674022E-40 
					                                         f32 %192 = OpConstant 3,674022E-40 
					                                Private f32* %194 = OpVariable Private 
					                                         i32 %195 = OpConstant 13 
					                                         i32 %199 = OpConstant 14 
					                                         f32 %210 = OpConstant 3,674022E-40 
					                                         i32 %212 = OpConstant 11 
					                                         i32 %217 = OpConstant 15 
					                       Output f32_2* vs_TEXCOORD5 = OpVariable Output 
					                                         f32 %223 = OpConstant 3,674022E-40 
					                                             %225 = OpTypePointer Output %6 
					                                         u32 %229 = OpConstant 3 
					                                         u32 %242 = OpConstant 2 
					                                         i32 %258 = OpConstant 9 
					                                         i32 %279 = OpConstant 19 
					                                         i32 %282 = OpConstant 20 
					                                         i32 %306 = OpConstant 18 
					                                         f32 %314 = OpConstant 3,674022E-40 
					                                         i32 %316 = OpConstant 21 
					                                             %331 = OpTypePointer Uniform %15 
					                                         i32 %335 = OpConstant 7 
					                                             %385 = OpTypePointer Input %15 
					                                Input f32_3* %386 = OpVariable Input 
					                                             %392 = OpTypePointer Private %26 
					                                Private i32* %393 = OpVariable Private 
					                                         u32 %397 = OpConstant 4294967295 
					                                Private i32* %400 = OpVariable Private 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Input f32_4* %498 = OpVariable Input 
					                                             %543 = OpTypePointer Private %15 
					                              Private f32_3* %544 = OpVariable Private 
					                                         i32 %560 = OpConstant 8 
					                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
					                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
					                               Output f32_4* %603 = OpVariable Output 
					                                Input f32_4* %604 = OpVariable Input 
					                                         i32 %608 = OpConstant 12 
					                                             %626 = OpTypePointer Output %15 
					                       Output f32_3* vs_TEXCOORD6 = OpVariable Output 
					                                Private f32* %637 = OpVariable Private 
					                              Private f32_4* %651 = OpVariable Private 
					                              Private f32_3* %656 = OpVariable Private 
					                                         i32 %667 = OpConstant 4 
					                       Output f32_3* vs_TEXCOORD7 = OpVariable Output 
					                                         i32 %674 = OpConstant 5 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_4 %13 = OpLoad %11 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                 Uniform f32* %29 = OpAccessChain %25 %27 
					                                          f32 %30 = OpLoad %29 
					                                 Uniform f32* %32 = OpAccessChain %25 %31 
					                                          f32 %33 = OpLoad %32 
					                                        f32_2 %34 = OpCompositeConstruct %30 %33 
					                                        f32_2 %35 = OpFAdd %14 %34 
					                                        f32_4 %36 = OpLoad %9 
					                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
					                                                      OpStore %9 %37 
					                                        f32_4 %39 = OpLoad %9 
					                                        f32_4 %40 = OpVectorShuffle %39 %39 1 1 1 1 
					                               Uniform f32_4* %44 = OpAccessChain %25 %41 %42 
					                                        f32_4 %45 = OpLoad %44 
					                                        f32_4 %46 = OpFMul %40 %45 
					                                                      OpStore %38 %46 
					                               Uniform f32_4* %48 = OpAccessChain %25 %41 %47 
					                                        f32_4 %49 = OpLoad %48 
					                                        f32_4 %50 = OpLoad %9 
					                                        f32_4 %51 = OpVectorShuffle %50 %50 0 0 0 0 
					                                        f32_4 %52 = OpFMul %49 %51 
					                                        f32_4 %53 = OpLoad %38 
					                                        f32_4 %54 = OpFAdd %52 %53 
					                                                      OpStore %38 %54 
					                               Uniform f32_4* %56 = OpAccessChain %25 %41 %55 
					                                        f32_4 %57 = OpLoad %56 
					                                        f32_4 %58 = OpLoad %11 
					                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
					                                        f32_4 %60 = OpFMul %57 %59 
					                                        f32_4 %61 = OpLoad %38 
					                                        f32_4 %62 = OpFAdd %60 %61 
					                                                      OpStore %38 %62 
					                                        f32_4 %64 = OpLoad %38 
					                               Uniform f32_4* %66 = OpAccessChain %25 %41 %65 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_4 %68 = OpFAdd %64 %67 
					                                                      OpStore %63 %68 
					                               Uniform f32_4* %69 = OpAccessChain %25 %41 %65 
					                                        f32_4 %70 = OpLoad %69 
					                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                        f32_4 %72 = OpLoad %11 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
					                                        f32_3 %74 = OpFMul %71 %73 
					                                        f32_4 %75 = OpLoad %38 
					                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
					                                        f32_3 %77 = OpFAdd %74 %76 
					                                        f32_4 %78 = OpLoad %38 
					                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
					                                                      OpStore %38 %79 
					                                        f32_4 %81 = OpLoad %63 
					                                        f32_4 %82 = OpVectorShuffle %81 %81 1 1 1 1 
					                               Uniform f32_4* %84 = OpAccessChain %25 %83 %42 
					                                        f32_4 %85 = OpLoad %84 
					                                        f32_4 %86 = OpFMul %82 %85 
					                                                      OpStore %80 %86 
					                               Uniform f32_4* %87 = OpAccessChain %25 %83 %47 
					                                        f32_4 %88 = OpLoad %87 
					                                        f32_4 %89 = OpLoad %63 
					                                        f32_4 %90 = OpVectorShuffle %89 %89 0 0 0 0 
					                                        f32_4 %91 = OpFMul %88 %90 
					                                        f32_4 %92 = OpLoad %80 
					                                        f32_4 %93 = OpFAdd %91 %92 
					                                                      OpStore %80 %93 
					                               Uniform f32_4* %94 = OpAccessChain %25 %83 %55 
					                                        f32_4 %95 = OpLoad %94 
					                                        f32_4 %96 = OpLoad %63 
					                                        f32_4 %97 = OpVectorShuffle %96 %96 2 2 2 2 
					                                        f32_4 %98 = OpFMul %95 %97 
					                                        f32_4 %99 = OpLoad %80 
					                                       f32_4 %100 = OpFAdd %98 %99 
					                                                      OpStore %80 %100 
					                              Uniform f32_4* %106 = OpAccessChain %25 %83 %65 
					                                       f32_4 %107 = OpLoad %106 
					                                       f32_4 %108 = OpLoad %63 
					                                       f32_4 %109 = OpVectorShuffle %108 %108 3 3 3 3 
					                                       f32_4 %110 = OpFMul %107 %109 
					                                       f32_4 %111 = OpLoad %80 
					                                       f32_4 %112 = OpFAdd %110 %111 
					                               Output f32_4* %114 = OpAccessChain %105 %47 
					                                                      OpStore %114 %112 
					                                  Input f32* %120 = OpAccessChain %117 %118 
					                                         f32 %121 = OpLoad %120 
					                                         f32 %123 = OpFMul %121 %122 
					                                                      OpStore %116 %123 
					                                         f32 %124 = OpLoad %116 
					                                         f32 %125 = OpExtInst %1 8 %124 
					                                Private f32* %126 = OpAccessChain %80 %118 
					                                                      OpStore %126 %125 
					                                Private f32* %127 = OpAccessChain %80 %118 
					                                         f32 %128 = OpLoad %127 
					                                         f32 %129 = OpFNegate %128 
					                                         f32 %131 = OpFMul %129 %130 
					                                  Input f32* %132 = OpAccessChain %117 %118 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFAdd %131 %133 
					                                Private f32* %135 = OpAccessChain %80 %101 
					                                                      OpStore %135 %134 
					                                       f32_4 %136 = OpLoad %80 
					                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
					                                       f32_2 %140 = OpFMul %137 %139 
					                                       f32_4 %141 = OpLoad %80 
					                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 2 3 
					                                                      OpStore %80 %142 
					                                       f32_4 %144 = OpLoad %80 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
					                              Uniform f32_4* %147 = OpAccessChain %25 %146 
					                                       f32_4 %148 = OpLoad %147 
					                                       f32_2 %149 = OpVectorShuffle %148 %148 0 1 
					                                       f32_2 %150 = OpFMul %145 %149 
					                              Uniform f32_4* %151 = OpAccessChain %25 %146 
					                                       f32_4 %152 = OpLoad %151 
					                                       f32_2 %153 = OpVectorShuffle %152 %152 2 3 
					                                       f32_2 %154 = OpFAdd %150 %153 
					                                       f32_4 %155 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %156 = OpVectorShuffle %155 %154 0 1 4 5 
					                                                      OpStore vs_TEXCOORD0 %156 
					                                       f32_4 %159 = OpLoad %80 
					                                       f32_2 %160 = OpVectorShuffle %159 %159 0 1 
					                              Uniform f32_4* %162 = OpAccessChain %25 %161 
					                                       f32_4 %163 = OpLoad %162 
					                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
					                                       f32_2 %165 = OpFMul %160 %164 
					                              Uniform f32_4* %166 = OpAccessChain %25 %161 
					                                       f32_4 %167 = OpLoad %166 
					                                       f32_2 %168 = OpVectorShuffle %167 %167 2 3 
					                                       f32_2 %169 = OpFAdd %165 %168 
					                                                      OpStore vs_TEXCOORD1 %169 
					                                       f32_4 %171 = OpLoad %170 
					                                       f32_2 %172 = OpVectorShuffle %171 %171 0 1 
					                              Uniform f32_4* %174 = OpAccessChain %25 %173 
					                                       f32_4 %175 = OpLoad %174 
					                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
					                                       f32_2 %177 = OpFMul %172 %176 
					                              Uniform f32_4* %178 = OpAccessChain %25 %173 
					                                       f32_4 %179 = OpLoad %178 
					                                       f32_2 %180 = OpVectorShuffle %179 %179 2 3 
					                                       f32_2 %181 = OpFAdd %177 %180 
					                                       f32_4 %182 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 2 3 
					                                                      OpStore vs_TEXCOORD0 %183 
					                                  Input f32* %188 = OpAccessChain %117 %101 
					                                         f32 %189 = OpLoad %188 
					                                        bool %190 = OpFOrdGreaterThanEqual %187 %189 
					                                                      OpStore %186 %190 
					                                        bool %191 = OpLoad %186 
					                                         f32 %193 = OpSelect %191 %192 %187 
					                                                      OpStore %116 %193 
					                                Uniform f32* %196 = OpAccessChain %25 %195 
					                                         f32 %197 = OpLoad %196 
					                                         f32 %198 = OpFNegate %197 
					                                Uniform f32* %200 = OpAccessChain %25 %199 
					                                         f32 %201 = OpLoad %200 
					                                         f32 %202 = OpFAdd %198 %201 
					                                                      OpStore %194 %202 
					                                         f32 %203 = OpLoad %116 
					                                         f32 %204 = OpLoad %194 
					                                         f32 %205 = OpFMul %203 %204 
					                                Uniform f32* %206 = OpAccessChain %25 %195 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFAdd %205 %207 
					                                                      OpStore %116 %208 
					                                         f32 %209 = OpLoad %116 
					                                         f32 %211 = OpFMul %209 %210 
					                                Uniform f32* %213 = OpAccessChain %25 %212 
					                                         f32 %214 = OpLoad %213 
					                                         f32 %215 = OpFAdd %211 %214 
					                                                      OpStore %116 %215 
					                                         f32 %216 = OpLoad %116 
					                                Uniform f32* %218 = OpAccessChain %25 %217 
					                                         f32 %219 = OpLoad %218 
					                                         f32 %220 = OpFMul %216 %219 
					                                                      OpStore %116 %220 
					                                         f32 %222 = OpLoad %116 
					                                         f32 %224 = OpFMul %222 %223 
					                                 Output f32* %226 = OpAccessChain vs_TEXCOORD5 %118 
					                                                      OpStore %226 %224 
					                                Private f32* %227 = OpAccessChain %63 %101 
					                                         f32 %228 = OpLoad %227 
					                                Uniform f32* %230 = OpAccessChain %25 %83 %42 %229 
					                                         f32 %231 = OpLoad %230 
					                                         f32 %232 = OpFMul %228 %231 
					                                                      OpStore %116 %232 
					                                Uniform f32* %233 = OpAccessChain %25 %83 %47 %229 
					                                         f32 %234 = OpLoad %233 
					                                Private f32* %235 = OpAccessChain %63 %118 
					                                         f32 %236 = OpLoad %235 
					                                         f32 %237 = OpFMul %234 %236 
					                                         f32 %238 = OpLoad %116 
					                                         f32 %239 = OpFAdd %237 %238 
					                                                      OpStore %116 %239 
					                                Uniform f32* %240 = OpAccessChain %25 %83 %55 %229 
					                                         f32 %241 = OpLoad %240 
					                                Private f32* %243 = OpAccessChain %63 %242 
					                                         f32 %244 = OpLoad %243 
					                                         f32 %245 = OpFMul %241 %244 
					                                         f32 %246 = OpLoad %116 
					                                         f32 %247 = OpFAdd %245 %246 
					                                                      OpStore %116 %247 
					                                Uniform f32* %248 = OpAccessChain %25 %83 %65 %229 
					                                         f32 %249 = OpLoad %248 
					                                Private f32* %250 = OpAccessChain %63 %229 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpFMul %249 %251 
					                                         f32 %253 = OpLoad %116 
					                                         f32 %254 = OpFAdd %252 %253 
					                                                      OpStore %116 %254 
					                              Uniform f32_4* %255 = OpAccessChain %25 %42 
					                                       f32_4 %256 = OpLoad %255 
					                                       f32_2 %257 = OpVectorShuffle %256 %256 1 1 
					                              Uniform f32_4* %259 = OpAccessChain %25 %258 %42 
					                                       f32_4 %260 = OpLoad %259 
					                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
					                                       f32_2 %262 = OpFMul %257 %261 
					                                       f32_4 %263 = OpLoad %63 
					                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 2 3 
					                                                      OpStore %63 %264 
					                              Uniform f32_4* %265 = OpAccessChain %25 %258 %47 
					                                       f32_4 %266 = OpLoad %265 
					                                       f32_2 %267 = OpVectorShuffle %266 %266 0 1 
					                              Uniform f32_4* %268 = OpAccessChain %25 %42 
					                                       f32_4 %269 = OpLoad %268 
					                                       f32_2 %270 = OpVectorShuffle %269 %269 0 0 
					                                       f32_2 %271 = OpFMul %267 %270 
					                                       f32_4 %272 = OpLoad %63 
					                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
					                                       f32_2 %274 = OpFAdd %271 %273 
					                                       f32_4 %275 = OpLoad %63 
					                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 2 3 
					                                                      OpStore %63 %276 
					                                       f32_4 %277 = OpLoad %63 
					                                       f32_2 %278 = OpVectorShuffle %277 %277 0 1 
					                                Uniform f32* %280 = OpAccessChain %25 %279 
					                                         f32 %281 = OpLoad %280 
					                                Uniform f32* %283 = OpAccessChain %25 %282 
					                                         f32 %284 = OpLoad %283 
					                                       f32_2 %285 = OpCompositeConstruct %281 %284 
					                                       f32_2 %286 = OpFMul %278 %285 
					                                       f32_4 %287 = OpLoad %63 
					                                       f32_4 %288 = OpVectorShuffle %287 %286 4 5 2 3 
					                                                      OpStore %63 %288 
					                                         f32 %289 = OpLoad %116 
					                                       f32_2 %290 = OpCompositeConstruct %289 %289 
					                                       f32_4 %291 = OpLoad %63 
					                                       f32_2 %292 = OpVectorShuffle %291 %291 0 1 
					                                       f32_2 %293 = OpFDiv %290 %292 
					                                       f32_4 %294 = OpLoad %63 
					                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 2 3 
					                                                      OpStore %63 %295 
					                                       f32_4 %296 = OpLoad %63 
					                                       f32_2 %297 = OpVectorShuffle %296 %296 0 1 
					                                       f32_4 %298 = OpLoad %63 
					                                       f32_2 %299 = OpVectorShuffle %298 %298 0 1 
					                                         f32 %300 = OpDot %297 %299 
					                                                      OpStore %116 %300 
					                                         f32 %301 = OpLoad %116 
					                                         f32 %302 = OpExtInst %1 32 %301 
					                                                      OpStore %116 %302 
					                                  Input f32* %303 = OpAccessChain %117 %101 
					                                         f32 %304 = OpLoad %303 
					                                         f32 %305 = OpExtInst %1 4 %304 
					                                Uniform f32* %307 = OpAccessChain %25 %306 
					                                         f32 %308 = OpLoad %307 
					                                         f32 %309 = OpFMul %305 %308 
					                                                      OpStore %194 %309 
					                                         f32 %310 = OpLoad %116 
					                                         f32 %311 = OpLoad %194 
					                                         f32 %312 = OpFMul %310 %311 
					                                                      OpStore %116 %312 
					                                         f32 %313 = OpLoad %116 
					                                         f32 %315 = OpFMul %313 %314 
					                                                      OpStore %194 %315 
					                                Uniform f32* %317 = OpAccessChain %25 %316 
					                                         f32 %318 = OpLoad %317 
					                                         f32 %319 = OpFNegate %318 
					                                         f32 %320 = OpFAdd %319 %192 
					                                Private f32* %321 = OpAccessChain %63 %118 
					                                                      OpStore %321 %320 
					                                         f32 %322 = OpLoad %194 
					                                Private f32* %323 = OpAccessChain %63 %118 
					                                         f32 %324 = OpLoad %323 
					                                         f32 %325 = OpFMul %322 %324 
					                                                      OpStore %194 %325 
					                                         f32 %326 = OpLoad %116 
					                                         f32 %327 = OpFMul %326 %314 
					                                         f32 %328 = OpLoad %194 
					                                         f32 %329 = OpFNegate %328 
					                                         f32 %330 = OpFAdd %327 %329 
					                                                      OpStore %116 %330 
					                              Uniform f32_3* %332 = OpAccessChain %25 %47 
					                                       f32_3 %333 = OpLoad %332 
					                                       f32_3 %334 = OpVectorShuffle %333 %333 1 1 1 
					                              Uniform f32_4* %336 = OpAccessChain %25 %335 %42 
					                                       f32_4 %337 = OpLoad %336 
					                                       f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
					                                       f32_3 %339 = OpFMul %334 %338 
					                                       f32_4 %340 = OpLoad %63 
					                                       f32_4 %341 = OpVectorShuffle %340 %339 4 5 6 3 
					                                                      OpStore %63 %341 
					                              Uniform f32_4* %342 = OpAccessChain %25 %335 %47 
					                                       f32_4 %343 = OpLoad %342 
					                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
					                              Uniform f32_3* %345 = OpAccessChain %25 %47 
					                                       f32_3 %346 = OpLoad %345 
					                                       f32_3 %347 = OpVectorShuffle %346 %346 0 0 0 
					                                       f32_3 %348 = OpFMul %344 %347 
					                                       f32_4 %349 = OpLoad %63 
					                                       f32_3 %350 = OpVectorShuffle %349 %349 0 1 2 
					                                       f32_3 %351 = OpFAdd %348 %350 
					                                       f32_4 %352 = OpLoad %63 
					                                       f32_4 %353 = OpVectorShuffle %352 %351 4 5 6 3 
					                                                      OpStore %63 %353 
					                              Uniform f32_4* %354 = OpAccessChain %25 %335 %55 
					                                       f32_4 %355 = OpLoad %354 
					                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
					                              Uniform f32_3* %357 = OpAccessChain %25 %47 
					                                       f32_3 %358 = OpLoad %357 
					                                       f32_3 %359 = OpVectorShuffle %358 %358 2 2 2 
					                                       f32_3 %360 = OpFMul %356 %359 
					                                       f32_4 %361 = OpLoad %63 
					                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
					                                       f32_3 %363 = OpFAdd %360 %362 
					                                       f32_4 %364 = OpLoad %63 
					                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
					                                                      OpStore %63 %365 
					                                       f32_4 %366 = OpLoad %63 
					                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
					                              Uniform f32_4* %368 = OpAccessChain %25 %335 %65 
					                                       f32_4 %369 = OpLoad %368 
					                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
					                                       f32_3 %371 = OpFAdd %367 %370 
					                                       f32_4 %372 = OpLoad %63 
					                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
					                                                      OpStore %63 %373 
					                                  Input f32* %374 = OpAccessChain %11 %242 
					                                         f32 %375 = OpLoad %374 
					                                Private f32* %376 = OpAccessChain %9 %242 
					                                                      OpStore %376 %375 
					                                       f32_4 %377 = OpLoad %9 
					                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
					                                       f32_3 %379 = OpFNegate %378 
					                                       f32_4 %380 = OpLoad %63 
					                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
					                                       f32_3 %382 = OpFAdd %379 %381 
					                                       f32_4 %383 = OpLoad %9 
					                                       f32_4 %384 = OpVectorShuffle %383 %382 4 5 6 3 
					                                                      OpStore %9 %384 
					                                       f32_3 %387 = OpLoad %386 
					                                       f32_4 %388 = OpLoad %9 
					                                       f32_3 %389 = OpVectorShuffle %388 %388 0 1 2 
					                                         f32 %390 = OpDot %387 %389 
					                                Private f32* %391 = OpAccessChain %9 %118 
					                                                      OpStore %391 %390 
					                                Private f32* %394 = OpAccessChain %9 %118 
					                                         f32 %395 = OpLoad %394 
					                                        bool %396 = OpFOrdLessThan %187 %395 
					                                         u32 %398 = OpSelect %396 %397 %118 
					                                         i32 %399 = OpBitcast %398 
					                                                      OpStore %393 %399 
					                                Private f32* %401 = OpAccessChain %9 %118 
					                                         f32 %402 = OpLoad %401 
					                                        bool %403 = OpFOrdLessThan %402 %187 
					                                         u32 %404 = OpSelect %403 %397 %118 
					                                         i32 %405 = OpBitcast %404 
					                                                      OpStore %400 %405 
					                                         i32 %406 = OpLoad %393 
					                                         i32 %407 = OpSNegate %406 
					                                         i32 %408 = OpLoad %400 
					                                         i32 %409 = OpIAdd %407 %408 
					                                                      OpStore %400 %409 
					                                         i32 %410 = OpLoad %400 
					                                         f32 %411 = OpConvertSToF %410 
					                                Private f32* %412 = OpAccessChain %9 %118 
					                                                      OpStore %412 %411 
					                                       f32_4 %413 = OpLoad %9 
					                                       f32_3 %414 = OpVectorShuffle %413 %413 0 0 0 
					                                       f32_3 %415 = OpLoad %386 
					                                       f32_3 %416 = OpFMul %414 %415 
					                                       f32_4 %417 = OpLoad %9 
					                                       f32_4 %418 = OpVectorShuffle %417 %416 4 5 6 3 
					                                                      OpStore %9 %418 
					                                       f32_4 %419 = OpLoad %9 
					                                       f32_3 %420 = OpVectorShuffle %419 %419 0 1 2 
					                              Uniform f32_4* %421 = OpAccessChain %25 %335 %47 
					                                       f32_4 %422 = OpLoad %421 
					                                       f32_3 %423 = OpVectorShuffle %422 %422 0 1 2 
					                                         f32 %424 = OpDot %420 %423 
					                                Private f32* %425 = OpAccessChain %63 %118 
					                                                      OpStore %425 %424 
					                                       f32_4 %426 = OpLoad %9 
					                                       f32_3 %427 = OpVectorShuffle %426 %426 0 1 2 
					                              Uniform f32_4* %428 = OpAccessChain %25 %335 %42 
					                                       f32_4 %429 = OpLoad %428 
					                                       f32_3 %430 = OpVectorShuffle %429 %429 0 1 2 
					                                         f32 %431 = OpDot %427 %430 
					                                Private f32* %432 = OpAccessChain %63 %101 
					                                                      OpStore %432 %431 
					                                       f32_4 %433 = OpLoad %9 
					                                       f32_3 %434 = OpVectorShuffle %433 %433 0 1 2 
					                              Uniform f32_4* %435 = OpAccessChain %25 %335 %55 
					                                       f32_4 %436 = OpLoad %435 
					                                       f32_3 %437 = OpVectorShuffle %436 %436 0 1 2 
					                                         f32 %438 = OpDot %434 %437 
					                                Private f32* %439 = OpAccessChain %63 %242 
					                                                      OpStore %439 %438 
					                                       f32_4 %440 = OpLoad %63 
					                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
					                                       f32_4 %442 = OpLoad %63 
					                                       f32_3 %443 = OpVectorShuffle %442 %442 0 1 2 
					                                         f32 %444 = OpDot %441 %443 
					                                Private f32* %445 = OpAccessChain %9 %118 
					                                                      OpStore %445 %444 
					                                Private f32* %446 = OpAccessChain %9 %118 
					                                         f32 %447 = OpLoad %446 
					                                         f32 %448 = OpExtInst %1 32 %447 
					                                Private f32* %449 = OpAccessChain %9 %118 
					                                                      OpStore %449 %448 
					                                       f32_4 %450 = OpLoad %9 
					                                       f32_4 %451 = OpVectorShuffle %450 %450 0 0 0 0 
					                                       f32_4 %452 = OpLoad %63 
					                                       f32_4 %453 = OpVectorShuffle %452 %452 0 1 2 2 
					                                       f32_4 %454 = OpFMul %451 %453 
					                                                      OpStore %63 %454 
					                                       f32_4 %455 = OpLoad %38 
					                                       f32_3 %456 = OpVectorShuffle %455 %455 0 1 2 
					                                       f32_3 %457 = OpFNegate %456 
					                              Uniform f32_3* %458 = OpAccessChain %25 %47 
					                                       f32_3 %459 = OpLoad %458 
					                                       f32_3 %460 = OpFAdd %457 %459 
					                                       f32_4 %461 = OpLoad %9 
					                                       f32_4 %462 = OpVectorShuffle %461 %460 4 5 6 3 
					                                                      OpStore %9 %462 
					                                       f32_4 %463 = OpLoad %9 
					                                       f32_3 %464 = OpVectorShuffle %463 %463 0 1 2 
					                                       f32_4 %465 = OpLoad %9 
					                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
					                                         f32 %467 = OpDot %464 %466 
					                                Private f32* %468 = OpAccessChain %80 %118 
					                                                      OpStore %468 %467 
					                                Private f32* %469 = OpAccessChain %80 %118 
					                                         f32 %470 = OpLoad %469 
					                                         f32 %471 = OpExtInst %1 32 %470 
					                                Private f32* %472 = OpAccessChain %80 %118 
					                                                      OpStore %472 %471 
					                                       f32_4 %473 = OpLoad %9 
					                                       f32_3 %474 = OpVectorShuffle %473 %473 0 1 2 
					                                       f32_4 %475 = OpLoad %80 
					                                       f32_3 %476 = OpVectorShuffle %475 %475 0 0 0 
					                                       f32_3 %477 = OpFMul %474 %476 
					                                       f32_4 %478 = OpLoad %80 
					                                       f32_4 %479 = OpVectorShuffle %478 %477 4 5 6 3 
					                                                      OpStore %80 %479 
					                                       f32_4 %480 = OpLoad %63 
					                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 3 
					                                       f32_4 %482 = OpLoad %80 
					                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
					                                         f32 %484 = OpDot %481 %483 
					                                Private f32* %485 = OpAccessChain %80 %118 
					                                                      OpStore %485 %484 
					                                Private f32* %486 = OpAccessChain %80 %118 
					                                         f32 %487 = OpLoad %486 
					                                         f32 %488 = OpExtInst %1 4 %487 
					                                         f32 %489 = OpLoad %116 
					                                         f32 %490 = OpFMul %488 %489 
					                                         f32 %491 = OpLoad %194 
					                                         f32 %492 = OpFAdd %490 %491 
					                                 Output f32* %493 = OpAccessChain vs_TEXCOORD5 %101 
					                                                      OpStore %493 %492 
					                                Private f32* %495 = OpAccessChain %38 %118 
					                                         f32 %496 = OpLoad %495 
					                                 Output f32* %497 = OpAccessChain vs_TEXCOORD2 %229 
					                                                      OpStore %497 %496 
					                                       f32_4 %499 = OpLoad %498 
					                                       f32_3 %500 = OpVectorShuffle %499 %499 1 1 1 
					                              Uniform f32_4* %501 = OpAccessChain %25 %41 %42 
					                                       f32_4 %502 = OpLoad %501 
					                                       f32_3 %503 = OpVectorShuffle %502 %502 1 2 0 
					                                       f32_3 %504 = OpFMul %500 %503 
					                                       f32_4 %505 = OpLoad %80 
					                                       f32_4 %506 = OpVectorShuffle %505 %504 4 5 6 3 
					                                                      OpStore %80 %506 
					                              Uniform f32_4* %507 = OpAccessChain %25 %41 %47 
					                                       f32_4 %508 = OpLoad %507 
					                                       f32_3 %509 = OpVectorShuffle %508 %508 1 2 0 
					                                       f32_4 %510 = OpLoad %498 
					                                       f32_3 %511 = OpVectorShuffle %510 %510 0 0 0 
					                                       f32_3 %512 = OpFMul %509 %511 
					                                       f32_4 %513 = OpLoad %80 
					                                       f32_3 %514 = OpVectorShuffle %513 %513 0 1 2 
					                                       f32_3 %515 = OpFAdd %512 %514 
					                                       f32_4 %516 = OpLoad %80 
					                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
					                                                      OpStore %80 %517 
					                              Uniform f32_4* %518 = OpAccessChain %25 %41 %55 
					                                       f32_4 %519 = OpLoad %518 
					                                       f32_3 %520 = OpVectorShuffle %519 %519 1 2 0 
					                                       f32_4 %521 = OpLoad %498 
					                                       f32_3 %522 = OpVectorShuffle %521 %521 2 2 2 
					                                       f32_3 %523 = OpFMul %520 %522 
					                                       f32_4 %524 = OpLoad %80 
					                                       f32_3 %525 = OpVectorShuffle %524 %524 0 1 2 
					                                       f32_3 %526 = OpFAdd %523 %525 
					                                       f32_4 %527 = OpLoad %80 
					                                       f32_4 %528 = OpVectorShuffle %527 %526 4 5 6 3 
					                                                      OpStore %80 %528 
					                                       f32_4 %529 = OpLoad %80 
					                                       f32_3 %530 = OpVectorShuffle %529 %529 0 1 2 
					                                       f32_4 %531 = OpLoad %80 
					                                       f32_3 %532 = OpVectorShuffle %531 %531 0 1 2 
					                                         f32 %533 = OpDot %530 %532 
					                                                      OpStore %116 %533 
					                                         f32 %534 = OpLoad %116 
					                                         f32 %535 = OpExtInst %1 32 %534 
					                                                      OpStore %116 %535 
					                                         f32 %536 = OpLoad %116 
					                                       f32_3 %537 = OpCompositeConstruct %536 %536 %536 
					                                       f32_4 %538 = OpLoad %80 
					                                       f32_3 %539 = OpVectorShuffle %538 %538 0 1 2 
					                                       f32_3 %540 = OpFMul %537 %539 
					                                       f32_4 %541 = OpLoad %80 
					                                       f32_4 %542 = OpVectorShuffle %541 %540 4 5 6 3 
					                                                      OpStore %80 %542 
					                                       f32_4 %545 = OpLoad %63 
					                                       f32_3 %546 = OpVectorShuffle %545 %545 3 0 1 
					                                       f32_4 %547 = OpLoad %80 
					                                       f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
					                                       f32_3 %549 = OpFMul %546 %548 
					                                                      OpStore %544 %549 
					                                       f32_4 %550 = OpLoad %63 
					                                       f32_3 %551 = OpVectorShuffle %550 %550 1 3 0 
					                                       f32_4 %552 = OpLoad %80 
					                                       f32_3 %553 = OpVectorShuffle %552 %552 1 2 0 
					                                       f32_3 %554 = OpFMul %551 %553 
					                                       f32_3 %555 = OpLoad %544 
					                                       f32_3 %556 = OpFNegate %555 
					                                       f32_3 %557 = OpFAdd %554 %556 
					                                                      OpStore %544 %557 
					                                  Input f32* %558 = OpAccessChain %498 %229 
					                                         f32 %559 = OpLoad %558 
					                                Uniform f32* %561 = OpAccessChain %25 %560 %229 
					                                         f32 %562 = OpLoad %561 
					                                         f32 %563 = OpFMul %559 %562 
					                                                      OpStore %116 %563 
					                                         f32 %564 = OpLoad %116 
					                                       f32_3 %565 = OpCompositeConstruct %564 %564 %564 
					                                       f32_3 %566 = OpLoad %544 
					                                       f32_3 %567 = OpFMul %565 %566 
					                                                      OpStore %544 %567 
					                                Private f32* %568 = OpAccessChain %544 %118 
					                                         f32 %569 = OpLoad %568 
					                                 Output f32* %570 = OpAccessChain vs_TEXCOORD2 %101 
					                                                      OpStore %570 %569 
					                                Private f32* %571 = OpAccessChain %63 %118 
					                                         f32 %572 = OpLoad %571 
					                                 Output f32* %573 = OpAccessChain vs_TEXCOORD2 %242 
					                                                      OpStore %573 %572 
					                                Private f32* %574 = OpAccessChain %80 %242 
					                                         f32 %575 = OpLoad %574 
					                                 Output f32* %576 = OpAccessChain vs_TEXCOORD2 %118 
					                                                      OpStore %576 %575 
					                                Private f32* %578 = OpAccessChain %80 %118 
					                                         f32 %579 = OpLoad %578 
					                                 Output f32* %580 = OpAccessChain vs_TEXCOORD3 %118 
					                                                      OpStore %580 %579 
					                                Private f32* %582 = OpAccessChain %80 %101 
					                                         f32 %583 = OpLoad %582 
					                                 Output f32* %584 = OpAccessChain vs_TEXCOORD4 %118 
					                                                      OpStore %584 %583 
					                                Private f32* %585 = OpAccessChain %38 %101 
					                                         f32 %586 = OpLoad %585 
					                                 Output f32* %587 = OpAccessChain vs_TEXCOORD3 %229 
					                                                      OpStore %587 %586 
					                                Private f32* %588 = OpAccessChain %38 %242 
					                                         f32 %589 = OpLoad %588 
					                                 Output f32* %590 = OpAccessChain vs_TEXCOORD4 %229 
					                                                      OpStore %590 %589 
					                                Private f32* %591 = OpAccessChain %63 %101 
					                                         f32 %592 = OpLoad %591 
					                                 Output f32* %593 = OpAccessChain vs_TEXCOORD3 %242 
					                                                      OpStore %593 %592 
					                                Private f32* %594 = OpAccessChain %544 %101 
					                                         f32 %595 = OpLoad %594 
					                                 Output f32* %596 = OpAccessChain vs_TEXCOORD3 %101 
					                                                      OpStore %596 %595 
					                                Private f32* %597 = OpAccessChain %544 %242 
					                                         f32 %598 = OpLoad %597 
					                                 Output f32* %599 = OpAccessChain vs_TEXCOORD4 %101 
					                                                      OpStore %599 %598 
					                                Private f32* %600 = OpAccessChain %63 %229 
					                                         f32 %601 = OpLoad %600 
					                                 Output f32* %602 = OpAccessChain vs_TEXCOORD4 %242 
					                                                      OpStore %602 %601 
					                                       f32_4 %605 = OpLoad %604 
					                                                      OpStore %603 %605 
					                                       f32_4 %606 = OpLoad %9 
					                                       f32_3 %607 = OpVectorShuffle %606 %606 1 1 1 
					                              Uniform f32_4* %609 = OpAccessChain %25 %608 %42 
					                                       f32_4 %610 = OpLoad %609 
					                                       f32_3 %611 = OpVectorShuffle %610 %610 0 1 2 
					                                       f32_3 %612 = OpFMul %607 %611 
					                                       f32_4 %613 = OpLoad %38 
					                                       f32_4 %614 = OpVectorShuffle %613 %612 4 5 6 3 
					                                                      OpStore %38 %614 
					                              Uniform f32_4* %615 = OpAccessChain %25 %608 %47 
					                                       f32_4 %616 = OpLoad %615 
					                                       f32_3 %617 = OpVectorShuffle %616 %616 0 1 2 
					                                       f32_4 %618 = OpLoad %9 
					                                       f32_3 %619 = OpVectorShuffle %618 %618 0 0 0 
					                                       f32_3 %620 = OpFMul %617 %619 
					                                       f32_4 %621 = OpLoad %38 
					                                       f32_3 %622 = OpVectorShuffle %621 %621 0 1 2 
					                                       f32_3 %623 = OpFAdd %620 %622 
					                                       f32_4 %624 = OpLoad %9 
					                                       f32_4 %625 = OpVectorShuffle %624 %623 4 5 2 6 
					                                                      OpStore %9 %625 
					                              Uniform f32_4* %628 = OpAccessChain %25 %608 %55 
					                                       f32_4 %629 = OpLoad %628 
					                                       f32_3 %630 = OpVectorShuffle %629 %629 0 1 2 
					                                       f32_4 %631 = OpLoad %9 
					                                       f32_3 %632 = OpVectorShuffle %631 %631 2 2 2 
					                                       f32_3 %633 = OpFMul %630 %632 
					                                       f32_4 %634 = OpLoad %9 
					                                       f32_3 %635 = OpVectorShuffle %634 %634 0 1 3 
					                                       f32_3 %636 = OpFAdd %633 %635 
					                                                      OpStore vs_TEXCOORD6 %636 
					                                Private f32* %638 = OpAccessChain %63 %101 
					                                         f32 %639 = OpLoad %638 
					                                Private f32* %640 = OpAccessChain %63 %101 
					                                         f32 %641 = OpLoad %640 
					                                         f32 %642 = OpFMul %639 %641 
					                                                      OpStore %637 %642 
					                                Private f32* %643 = OpAccessChain %63 %118 
					                                         f32 %644 = OpLoad %643 
					                                Private f32* %645 = OpAccessChain %63 %118 
					                                         f32 %646 = OpLoad %645 
					                                         f32 %647 = OpFMul %644 %646 
					                                         f32 %648 = OpLoad %637 
					                                         f32 %649 = OpFNegate %648 
					                                         f32 %650 = OpFAdd %647 %649 
					                                                      OpStore %637 %650 
					                                       f32_4 %652 = OpLoad %63 
					                                       f32_4 %653 = OpVectorShuffle %652 %652 1 3 2 0 
					                                       f32_4 %654 = OpLoad %63 
					                                       f32_4 %655 = OpFMul %653 %654 
					                                                      OpStore %651 %655 
					                              Uniform f32_4* %657 = OpAccessChain %25 %55 
					                                       f32_4 %658 = OpLoad %657 
					                                       f32_4 %659 = OpLoad %651 
					                                         f32 %660 = OpDot %658 %659 
					                                Private f32* %661 = OpAccessChain %656 %118 
					                                                      OpStore %661 %660 
					                              Uniform f32_4* %662 = OpAccessChain %25 %65 
					                                       f32_4 %663 = OpLoad %662 
					                                       f32_4 %664 = OpLoad %651 
					                                         f32 %665 = OpDot %663 %664 
					                                Private f32* %666 = OpAccessChain %656 %101 
					                                                      OpStore %666 %665 
					                              Uniform f32_4* %668 = OpAccessChain %25 %667 
					                                       f32_4 %669 = OpLoad %668 
					                                       f32_4 %670 = OpLoad %651 
					                                         f32 %671 = OpDot %669 %670 
					                                Private f32* %672 = OpAccessChain %656 %242 
					                                                      OpStore %672 %671 
					                              Uniform f32_4* %675 = OpAccessChain %25 %674 
					                                       f32_4 %676 = OpLoad %675 
					                                       f32_3 %677 = OpVectorShuffle %676 %676 0 1 2 
					                                         f32 %678 = OpLoad %637 
					                                       f32_3 %679 = OpCompositeConstruct %678 %678 %678 
					                                       f32_3 %680 = OpFMul %677 %679 
					                                       f32_3 %681 = OpLoad %656 
					                                       f32_3 %682 = OpFAdd %680 %681 
					                                                      OpStore vs_TEXCOORD7 %682 
					                                 Output f32* %683 = OpAccessChain %105 %47 %101 
					                                         f32 %684 = OpLoad %683 
					                                         f32 %685 = OpFNegate %684 
					                                 Output f32* %686 = OpAccessChain %105 %47 %101 
					                                                      OpStore %686 %685 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 389
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %21 %43 %121 %144 %298 %304 %309 %313 %359 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
					                                                      OpName vs_TEXCOORD7 "vs_TEXCOORD7" 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %12 RelaxedPrecision 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %16 RelaxedPrecision 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %17 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 21 
					                                                      OpDecorate %28 RelaxedPrecision 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %35 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD5 Location 43 
					                                                      OpMemberDecorate %59 0 Offset 59 
					                                                      OpMemberDecorate %59 1 RelaxedPrecision 
					                                                      OpMemberDecorate %59 1 Offset 59 
					                                                      OpMemberDecorate %59 2 RelaxedPrecision 
					                                                      OpMemberDecorate %59 2 Offset 59 
					                                                      OpMemberDecorate %59 3 RelaxedPrecision 
					                                                      OpMemberDecorate %59 3 Offset 59 
					                                                      OpMemberDecorate %59 4 RelaxedPrecision 
					                                                      OpMemberDecorate %59 4 Offset 59 
					                                                      OpMemberDecorate %59 5 RelaxedPrecision 
					                                                      OpMemberDecorate %59 5 Offset 59 
					                                                      OpMemberDecorate %59 6 Offset 59 
					                                                      OpMemberDecorate %59 7 Offset 59 
					                                                      OpMemberDecorate %59 8 RelaxedPrecision 
					                                                      OpMemberDecorate %59 8 Offset 59 
					                                                      OpMemberDecorate %59 9 Offset 59 
					                                                      OpMemberDecorate %59 10 Offset 59 
					                                                      OpMemberDecorate %59 11 Offset 59 
					                                                      OpMemberDecorate %59 12 RelaxedPrecision 
					                                                      OpMemberDecorate %59 12 Offset 59 
					                                                      OpMemberDecorate %59 13 Offset 59 
					                                                      OpMemberDecorate %59 14 Offset 59 
					                                                      OpDecorate %59 Block 
					                                                      OpDecorate %61 DescriptorSet 61 
					                                                      OpDecorate %61 Binding 61 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 121 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %126 DescriptorSet 126 
					                                                      OpDecorate %126 Binding 126 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %128 DescriptorSet 128 
					                                                      OpDecorate %128 Binding 128 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %144 Location 144 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %174 DescriptorSet 174 
					                                                      OpDecorate %174 Binding 174 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %176 DescriptorSet 176 
					                                                      OpDecorate %176 Binding 176 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %239 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %298 Location 298 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 304 
					                                                      OpDecorate vs_TEXCOORD3 Location 309 
					                                                      OpDecorate vs_TEXCOORD4 Location 313 
					                                                      OpDecorate %333 RelaxedPrecision 
					                                                      OpDecorate %334 RelaxedPrecision 
					                                                      OpDecorate %340 RelaxedPrecision 
					                                                      OpDecorate %346 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %357 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 Location 359 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %361 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %366 RelaxedPrecision 
					                                                      OpDecorate %367 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %369 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %371 RelaxedPrecision 
					                                                      OpDecorate %374 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %376 RelaxedPrecision 
					                                                      OpDecorate %379 RelaxedPrecision 
					                                                      OpDecorate %380 RelaxedPrecision 
					                                                      OpDecorate %381 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %383 RelaxedPrecision 
					                                                      OpDecorate %384 RelaxedPrecision 
					                                                      OpDecorate %385 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %11 = OpTypePointer UniformConstant %10 
					         UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                              %14 = OpTypeSampler 
					                                              %15 = OpTypePointer UniformConstant %14 
					                     UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                              %18 = OpTypeSampledImage %10 
					                                              %20 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                              %22 = OpTypeVector %6 2 
					                                              %26 = OpTypeInt 32 0 
					                                          u32 %27 = OpConstant 3 
					                                          u32 %29 = OpConstant 0 
					                                              %30 = OpTypePointer Private %6 
					                               Private f32_4* %32 = OpVariable Private 
					                                          f32 %36 = OpConstant 3,674022E-40 
					                               Private f32_4* %39 = OpVariable Private 
					                                              %42 = OpTypePointer Input %22 
					                        Input f32_2* vs_TEXCOORD5 = OpVariable Input 
					                                              %44 = OpTypePointer Input %6 
					                                          u32 %52 = OpConstant 1 
					                                 Private f32* %58 = OpVariable Private 
					                                              %59 = OpTypeStruct %7 %7 %7 %7 %7 %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 
					                                              %60 = OpTypePointer Uniform %59 
					Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32;}* %61 = OpVariable Uniform 
					                                              %62 = OpTypeInt 32 1 
					                                          i32 %63 = OpConstant 13 
					                                              %64 = OpTypePointer Uniform %6 
					                                          i32 %67 = OpConstant 14 
					                               Private f32_4* %75 = OpVariable Private 
					                                          f32 %84 = OpConstant 3,674022E-40 
					                                          f32 %85 = OpConstant 3,674022E-40 
					                                              %88 = OpTypeVector %6 3 
					                                              %89 = OpTypePointer Private %88 
					                               Private f32_3* %90 = OpVariable Private 
					                                 Private f32* %98 = OpVariable Private 
					                                         i32 %108 = OpConstant 10 
					                                         i32 %111 = OpConstant 11 
					                                         i32 %115 = OpConstant 0 
					                                             %116 = OpTypePointer Uniform %7 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					        UniformConstant read_only Texture2D* %126 = OpVariable UniformConstant 
					                    UniformConstant sampler* %128 = OpVariable UniformConstant 
					                                         i32 %136 = OpConstant 12 
					                              Private f32_4* %143 = OpVariable Private 
					                                Input f32_4* %144 = OpVariable Input 
					                                Private f32* %151 = OpVariable Private 
					                                             %157 = OpTypePointer Private %22 
					                              Private f32_2* %158 = OpVariable Private 
					                                         i32 %159 = OpConstant 6 
					                                         i32 %162 = OpConstant 7 
					                              Private f32_4* %173 = OpVariable Private 
					        UniformConstant read_only Texture2D* %174 = OpVariable UniformConstant 
					                    UniformConstant sampler* %176 = OpVariable UniformConstant 
					                              Private f32_4* %181 = OpVariable Private 
					                                         i32 %183 = OpConstant 8 
					                              Private f32_4* %187 = OpVariable Private 
					                              Private f32_4* %191 = OpVariable Private 
					                                Private f32* %243 = OpVariable Private 
					                                         i32 %244 = OpConstant 9 
					                                Private f32* %250 = OpVariable Private 
					                              Private f32_3* %286 = OpVariable Private 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %297 = OpTypePointer Output %7 
					                               Output f32_4* %298 = OpVariable Output 
					                                             %301 = OpTypePointer Output %6 
					                              Private f32_3* %303 = OpVariable Private 
					                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
					                                         u32 %305 = OpConstant 2 
					                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
					                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
					                                Private f32* %317 = OpVariable Private 
					                                         i32 %331 = OpConstant 1 
					                                         i32 %338 = OpConstant 2 
					                                         i32 %344 = OpConstant 3 
					                                         i32 %350 = OpConstant 4 
					                                             %358 = OpTypePointer Input %88 
					                        Input f32_3* vs_TEXCOORD7 = OpVariable Input 
					                                       f32_4 %365 = OpConstantComposite %84 %84 %84 %84 
					                                         i32 %372 = OpConstant 5 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                          read_only Texture2D %13 = OpLoad %12 
					                                      sampler %17 = OpLoad %16 
					                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                        f32_4 %23 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %24 = OpVectorShuffle %23 %23 0 1 
					                                        f32_4 %25 = OpImageSampleImplicitLod %19 %24 
					                                          f32 %28 = OpCompositeExtract %25 3 
					                                 Private f32* %31 = OpAccessChain %9 %29 
					                                                      OpStore %31 %28 
					                                 Private f32* %33 = OpAccessChain %9 %29 
					                                          f32 %34 = OpLoad %33 
					                                          f32 %35 = OpFNegate %34 
					                                          f32 %37 = OpFAdd %35 %36 
					                                 Private f32* %38 = OpAccessChain %32 %29 
					                                                      OpStore %38 %37 
					                                 Private f32* %40 = OpAccessChain %32 %29 
					                                          f32 %41 = OpLoad %40 
					                                   Input f32* %45 = OpAccessChain vs_TEXCOORD5 %29 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %47 = OpFNegate %46 
					                                          f32 %48 = OpFAdd %41 %47 
					                                 Private f32* %49 = OpAccessChain %39 %29 
					                                                      OpStore %49 %48 
					                                 Private f32* %50 = OpAccessChain %39 %29 
					                                          f32 %51 = OpLoad %50 
					                                   Input f32* %53 = OpAccessChain vs_TEXCOORD5 %52 
					                                          f32 %54 = OpLoad %53 
					                                          f32 %55 = OpFMul %51 %54 
					                                          f32 %56 = OpFAdd %55 %36 
					                                 Private f32* %57 = OpAccessChain %39 %29 
					                                                      OpStore %57 %56 
					                                 Uniform f32* %65 = OpAccessChain %61 %63 
					                                          f32 %66 = OpLoad %65 
					                                 Uniform f32* %68 = OpAccessChain %61 %67 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpFMul %66 %69 
					                                                      OpStore %58 %70 
					                                          f32 %71 = OpLoad %58 
					                                   Input f32* %72 = OpAccessChain vs_TEXCOORD5 %52 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpFMul %71 %73 
					                                                      OpStore %58 %74 
					                                          f32 %76 = OpLoad %58 
					                                          f32 %77 = OpFMul %76 %36 
					                                 Private f32* %78 = OpAccessChain %39 %29 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFAdd %77 %79 
					                                 Private f32* %81 = OpAccessChain %75 %29 
					                                                      OpStore %81 %80 
					                                 Private f32* %82 = OpAccessChain %75 %29 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %86 = OpExtInst %1 43 %83 %84 %85 
					                                 Private f32* %87 = OpAccessChain %75 %29 
					                                                      OpStore %87 %86 
					                                          f32 %91 = OpLoad %58 
					                                          f32 %92 = OpFNegate %91 
					                                          f32 %93 = OpFMul %92 %36 
					                                 Private f32* %94 = OpAccessChain %39 %29 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFAdd %93 %95 
					                                 Private f32* %97 = OpAccessChain %90 %29 
					                                                      OpStore %97 %96 
					                                          f32 %99 = OpLoad %58 
					                                         f32 %100 = OpExtInst %1 37 %99 %85 
					                                                      OpStore %98 %100 
					                                         f32 %101 = OpLoad %98 
					                                         f32 %102 = OpExtInst %1 31 %101 
					                                                      OpStore %98 %102 
					                                         f32 %103 = OpLoad %98 
					                                Private f32* %104 = OpAccessChain %75 %29 
					                                         f32 %105 = OpLoad %104 
					                                         f32 %106 = OpFMul %103 %105 
					                                Private f32* %107 = OpAccessChain %75 %29 
					                                                      OpStore %107 %106 
					                                Uniform f32* %109 = OpAccessChain %61 %108 
					                                         f32 %110 = OpLoad %109 
					                                Uniform f32* %112 = OpAccessChain %61 %111 
					                                         f32 %113 = OpLoad %112 
					                                       f32_2 %114 = OpCompositeConstruct %110 %113 
					                              Uniform f32_4* %117 = OpAccessChain %61 %115 
					                                       f32_4 %118 = OpLoad %117 
					                                       f32_2 %119 = OpVectorShuffle %118 %118 1 1 
					                                       f32_2 %120 = OpFMul %114 %119 
					                                       f32_2 %122 = OpLoad vs_TEXCOORD1 
					                                       f32_2 %123 = OpFAdd %120 %122 
					                                       f32_4 %124 = OpLoad %39 
					                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 2 3 
					                                                      OpStore %39 %125 
					                         read_only Texture2D %127 = OpLoad %126 
					                                     sampler %129 = OpLoad %128 
					                  read_only Texture2DSampled %130 = OpSampledImage %127 %129 
					                                       f32_4 %131 = OpLoad %39 
					                                       f32_2 %132 = OpVectorShuffle %131 %131 0 1 
					                                       f32_4 %133 = OpImageSampleImplicitLod %130 %132 
					                                                      OpStore %9 %133 
					                                       f32_4 %134 = OpLoad %9 
					                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
					                              Uniform f32_4* %137 = OpAccessChain %61 %136 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
					                                       f32_3 %140 = OpFMul %135 %139 
					                                       f32_4 %141 = OpLoad %32 
					                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
					                                                      OpStore %32 %142 
					                                  Input f32* %145 = OpAccessChain %144 %27 
					                                         f32 %146 = OpLoad %145 
					                                Uniform f32* %147 = OpAccessChain %61 %136 %27 
					                                         f32 %148 = OpLoad %147 
					                                         f32 %149 = OpFMul %146 %148 
					                                Private f32* %150 = OpAccessChain %143 %29 
					                                                      OpStore %150 %149 
					                                Private f32* %152 = OpAccessChain %9 %27 
					                                         f32 %153 = OpLoad %152 
					                                Private f32* %154 = OpAccessChain %143 %29 
					                                         f32 %155 = OpLoad %154 
					                                         f32 %156 = OpFMul %153 %155 
					                                                      OpStore %151 %156 
					                                Uniform f32* %160 = OpAccessChain %61 %159 
					                                         f32 %161 = OpLoad %160 
					                                Uniform f32* %163 = OpAccessChain %61 %162 
					                                         f32 %164 = OpLoad %163 
					                                       f32_2 %165 = OpCompositeConstruct %161 %164 
					                              Uniform f32_4* %166 = OpAccessChain %61 %115 
					                                       f32_4 %167 = OpLoad %166 
					                                       f32_2 %168 = OpVectorShuffle %167 %167 1 1 
					                                       f32_2 %169 = OpFMul %165 %168 
					                                       f32_4 %170 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %171 = OpVectorShuffle %170 %170 2 3 
					                                       f32_2 %172 = OpFAdd %169 %171 
					                                                      OpStore %158 %172 
					                         read_only Texture2D %175 = OpLoad %174 
					                                     sampler %177 = OpLoad %176 
					                  read_only Texture2DSampled %178 = OpSampledImage %175 %177 
					                                       f32_2 %179 = OpLoad %158 
					                                       f32_4 %180 = OpImageSampleImplicitLod %178 %179 
					                                                      OpStore %173 %180 
					                                       f32_4 %182 = OpLoad %144 
					                              Uniform f32_4* %184 = OpAccessChain %61 %183 
					                                       f32_4 %185 = OpLoad %184 
					                                       f32_4 %186 = OpFMul %182 %185 
					                                                      OpStore %181 %186 
					                                       f32_4 %188 = OpLoad %173 
					                                       f32_4 %189 = OpLoad %181 
					                                       f32_4 %190 = OpFMul %188 %189 
					                                                      OpStore %187 %190 
					                                       f32_4 %192 = OpLoad %187 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
					                                       f32_4 %194 = OpLoad %187 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                       f32_3 %196 = OpFMul %193 %195 
					                                       f32_4 %197 = OpLoad %191 
					                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
					                                                      OpStore %191 %198 
					                                       f32_4 %199 = OpLoad %32 
					                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
					                                         f32 %201 = OpLoad %151 
					                                       f32_3 %202 = OpCompositeConstruct %201 %201 %201 
					                                       f32_3 %203 = OpFMul %200 %202 
					                                       f32_4 %204 = OpLoad %191 
					                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
					                                       f32_3 %206 = OpFNegate %205 
					                                       f32_3 %207 = OpFAdd %203 %206 
					                                       f32_4 %208 = OpLoad %191 
					                                       f32_4 %209 = OpVectorShuffle %208 %207 4 5 6 3 
					                                                      OpStore %191 %209 
					                                Private f32* %210 = OpAccessChain %143 %29 
					                                         f32 %211 = OpLoad %210 
					                                Private f32* %212 = OpAccessChain %9 %27 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpFMul %211 %213 
					                                Private f32* %215 = OpAccessChain %187 %27 
					                                         f32 %216 = OpLoad %215 
					                                         f32 %217 = OpFNegate %216 
					                                         f32 %218 = OpFAdd %214 %217 
					                                Private f32* %219 = OpAccessChain %191 %27 
					                                                      OpStore %219 %218 
					                                       f32_4 %220 = OpLoad %75 
					                                       f32_4 %221 = OpVectorShuffle %220 %220 0 0 0 0 
					                                       f32_4 %222 = OpLoad %191 
					                                       f32_4 %223 = OpFMul %221 %222 
					                                                      OpStore %32 %223 
					                                Private f32* %224 = OpAccessChain %181 %27 
					                                         f32 %225 = OpLoad %224 
					                                Private f32* %226 = OpAccessChain %173 %27 
					                                         f32 %227 = OpLoad %226 
					                                         f32 %228 = OpFMul %225 %227 
					                                Private f32* %229 = OpAccessChain %32 %27 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFAdd %228 %230 
					                                Private f32* %232 = OpAccessChain %143 %27 
					                                                      OpStore %232 %231 
					                                       f32_4 %233 = OpLoad %187 
					                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
					                                       f32_4 %235 = OpLoad %187 
					                                       f32_3 %236 = OpVectorShuffle %235 %235 3 3 3 
					                                       f32_3 %237 = OpFMul %234 %236 
					                                       f32_4 %238 = OpLoad %32 
					                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
					                                       f32_3 %240 = OpFAdd %237 %239 
					                                       f32_4 %241 = OpLoad %143 
					                                       f32_4 %242 = OpVectorShuffle %241 %240 4 5 6 3 
					                                                      OpStore %143 %242 
					                                Uniform f32* %245 = OpAccessChain %61 %244 
					                                         f32 %246 = OpLoad %245 
					                                Uniform f32* %247 = OpAccessChain %61 %67 
					                                         f32 %248 = OpLoad %247 
					                                         f32 %249 = OpFMul %246 %248 
					                                                      OpStore %243 %249 
					                                         f32 %251 = OpLoad %243 
					                                  Input f32* %252 = OpAccessChain vs_TEXCOORD5 %52 
					                                         f32 %253 = OpLoad %252 
					                                         f32 %254 = OpFMul %251 %253 
					                                                      OpStore %250 %254 
					                                         f32 %255 = OpLoad %243 
					                                  Input f32* %256 = OpAccessChain vs_TEXCOORD5 %52 
					                                         f32 %257 = OpLoad %256 
					                                         f32 %258 = OpFMul %255 %257 
					                                         f32 %259 = OpFAdd %258 %85 
					                                Private f32* %260 = OpAccessChain %75 %29 
					                                                      OpStore %260 %259 
					                                         f32 %261 = OpLoad %250 
					                                         f32 %262 = OpFMul %261 %36 
					                                Private f32* %263 = OpAccessChain %90 %29 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %265 = OpFAdd %262 %264 
					                                Private f32* %266 = OpAccessChain %90 %29 
					                                                      OpStore %266 %265 
					                                Private f32* %267 = OpAccessChain %90 %29 
					                                         f32 %268 = OpLoad %267 
					                                Private f32* %269 = OpAccessChain %75 %29 
					                                         f32 %270 = OpLoad %269 
					                                         f32 %271 = OpFDiv %268 %270 
					                                Private f32* %272 = OpAccessChain %75 %29 
					                                                      OpStore %272 %271 
					                                Private f32* %273 = OpAccessChain %75 %29 
					                                         f32 %274 = OpLoad %273 
					                                         f32 %275 = OpExtInst %1 43 %274 %84 %85 
					                                Private f32* %276 = OpAccessChain %75 %29 
					                                                      OpStore %276 %275 
					                                Private f32* %277 = OpAccessChain %75 %29 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFNegate %278 
					                                         f32 %280 = OpFAdd %279 %85 
					                                Private f32* %281 = OpAccessChain %75 %29 
					                                                      OpStore %281 %280 
					                                       f32_4 %282 = OpLoad %75 
					                                       f32_4 %283 = OpVectorShuffle %282 %282 0 0 0 0 
					                                       f32_4 %284 = OpLoad %143 
					                                       f32_4 %285 = OpFMul %283 %284 
					                                                      OpStore %32 %285 
					                                Private f32* %287 = OpAccessChain %32 %27 
					                                         f32 %288 = OpLoad %287 
					                                         f32 %290 = OpExtInst %1 40 %288 %289 
					                                Private f32* %291 = OpAccessChain %286 %29 
					                                                      OpStore %291 %290 
					                                       f32_4 %292 = OpLoad %32 
					                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
					                                       f32_3 %294 = OpLoad %286 
					                                       f32_3 %295 = OpVectorShuffle %294 %294 0 0 0 
					                                       f32_3 %296 = OpFDiv %293 %295 
					                                                      OpStore %286 %296 
					                                Private f32* %299 = OpAccessChain %32 %27 
					                                         f32 %300 = OpLoad %299 
					                                 Output f32* %302 = OpAccessChain %298 %27 
					                                                      OpStore %302 %300 
					                                  Input f32* %306 = OpAccessChain vs_TEXCOORD2 %305 
					                                         f32 %307 = OpLoad %306 
					                                Private f32* %308 = OpAccessChain %303 %29 
					                                                      OpStore %308 %307 
					                                  Input f32* %310 = OpAccessChain vs_TEXCOORD3 %305 
					                                         f32 %311 = OpLoad %310 
					                                Private f32* %312 = OpAccessChain %303 %52 
					                                                      OpStore %312 %311 
					                                  Input f32* %314 = OpAccessChain vs_TEXCOORD4 %305 
					                                         f32 %315 = OpLoad %314 
					                                Private f32* %316 = OpAccessChain %303 %305 
					                                                      OpStore %316 %315 
					                                       f32_3 %318 = OpLoad %303 
					                                       f32_3 %319 = OpLoad %303 
					                                         f32 %320 = OpDot %318 %319 
					                                                      OpStore %317 %320 
					                                         f32 %321 = OpLoad %317 
					                                         f32 %322 = OpExtInst %1 32 %321 
					                                                      OpStore %317 %322 
					                                         f32 %323 = OpLoad %317 
					                                       f32_3 %324 = OpCompositeConstruct %323 %323 %323 
					                                       f32_3 %325 = OpLoad %303 
					                                       f32_3 %326 = OpFMul %324 %325 
					                                       f32_4 %327 = OpLoad %39 
					                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 6 3 
					                                                      OpStore %39 %328 
					                                       f32_4 %329 = OpLoad %39 
					                                       f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
					                              Uniform f32_4* %332 = OpAccessChain %61 %331 
					                                       f32_4 %333 = OpLoad %332 
					                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
					                                         f32 %335 = OpDot %330 %334 
					                                Private f32* %336 = OpAccessChain %75 %29 
					                                                      OpStore %336 %335 
					                                Private f32* %337 = OpAccessChain %39 %27 
					                                                      OpStore %337 %85 
					                              Uniform f32_4* %339 = OpAccessChain %61 %338 
					                                       f32_4 %340 = OpLoad %339 
					                                       f32_4 %341 = OpLoad %39 
					                                         f32 %342 = OpDot %340 %341 
					                                Private f32* %343 = OpAccessChain %191 %29 
					                                                      OpStore %343 %342 
					                              Uniform f32_4* %345 = OpAccessChain %61 %344 
					                                       f32_4 %346 = OpLoad %345 
					                                       f32_4 %347 = OpLoad %39 
					                                         f32 %348 = OpDot %346 %347 
					                                Private f32* %349 = OpAccessChain %191 %52 
					                                                      OpStore %349 %348 
					                              Uniform f32_4* %351 = OpAccessChain %61 %350 
					                                       f32_4 %352 = OpLoad %351 
					                                       f32_4 %353 = OpLoad %39 
					                                         f32 %354 = OpDot %352 %353 
					                                Private f32* %355 = OpAccessChain %191 %305 
					                                                      OpStore %355 %354 
					                                       f32_4 %356 = OpLoad %191 
					                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
					                                       f32_3 %360 = OpLoad vs_TEXCOORD7 
					                                       f32_3 %361 = OpFAdd %357 %360 
					                                       f32_4 %362 = OpLoad %75 
					                                       f32_4 %363 = OpVectorShuffle %362 %361 0 4 5 6 
					                                                      OpStore %75 %363 
					                                       f32_4 %364 = OpLoad %75 
					                                       f32_4 %366 = OpExtInst %1 40 %364 %365 
					                                                      OpStore %75 %366 
					                                       f32_4 %367 = OpLoad %75 
					                                       f32_3 %368 = OpVectorShuffle %367 %367 1 2 3 
					                                       f32_3 %369 = OpLoad %286 
					                                       f32_3 %370 = OpFMul %368 %369 
					                                                      OpStore %90 %370 
					                                       f32_3 %371 = OpLoad %286 
					                              Uniform f32_4* %373 = OpAccessChain %61 %372 
					                                       f32_4 %374 = OpLoad %373 
					                                       f32_3 %375 = OpVectorShuffle %374 %374 0 1 2 
					                                       f32_3 %376 = OpFMul %371 %375 
					                                       f32_4 %377 = OpLoad %191 
					                                       f32_4 %378 = OpVectorShuffle %377 %376 4 5 6 3 
					                                                      OpStore %191 %378 
					                                       f32_4 %379 = OpLoad %191 
					                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
					                                       f32_4 %381 = OpLoad %75 
					                                       f32_3 %382 = OpVectorShuffle %381 %381 0 0 0 
					                                       f32_3 %383 = OpFMul %380 %382 
					                                       f32_3 %384 = OpLoad %90 
					                                       f32_3 %385 = OpFAdd %383 %384 
					                                       f32_4 %386 = OpLoad %298 
					                                       f32_4 %387 = OpVectorShuffle %386 %385 4 5 6 3 
					                                                      OpStore %298 %387 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						float _FaceDilate;
						vec4 unused_0_2[6];
						mat4x4 _EnvMatrix;
						vec4 unused_0_4[7];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_10[4];
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						vec4 unused_0_15;
						vec4 _MainTex_ST;
						vec4 _FaceTex_ST;
						vec4 _OutlineTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[3];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_6[34];
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_11[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2;
						vec4 unity_WorldTransformParams;
						vec4 unused_3_4;
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					int u_xlati5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat3.x = floor(u_xlat15);
					    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat16 = (-_WeightNormal) + _WeightBold;
					    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
					    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
					    u_xlat15 = u_xlat15 * _ScaleRatioA;
					    vs_TEXCOORD5.x = u_xlat15 * 0.5;
					    u_xlat15 = u_xlat2.y * unity_MatrixVP[1].w;
					    u_xlat15 = unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
					    u_xlat15 = unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
					    u_xlat15 = unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
					    u_xlat2.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat2.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat16 = u_xlat15 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat16 = u_xlat16 * u_xlat2.x;
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
					    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + unity_WorldToObject[3].xyz;
					    u_xlat0.z = in_POSITION0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
					    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati5) + u_xlati0;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat2.x = dot(u_xlat0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(u_xlat0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(u_xlat0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
					    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
					    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
					    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat15 + u_xlat16;
					    u_xlat3.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD2.w = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD3.w = u_xlat1.y;
					    vs_TEXCOORD4.z = u_xlat2.w;
					    vs_TEXCOORD4.w = u_xlat1.z;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat3.xyz = u_xlat0.yyy * _EnvMatrix[1].xyz;
					    u_xlat0.xyw = _EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
					    vs_TEXCOORD6.xyz = _EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat2.yyyy * u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat2.xxxx + u_xlat3;
					    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
					    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
					    u_xlat1 = u_xlat1 * u_xlat2.wwzw + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat1;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat15 = u_xlat2.y * u_xlat2.y;
					    u_xlat15 = u_xlat2.x * u_xlat2.x + (-u_xlat15);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    vs_TEXCOORD7.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	vec4 unity_4LightAtten0;
					uniform 	vec4 unity_LightColor[8];
					uniform 	vec4 unity_SHBr;
					uniform 	vec4 unity_SHBg;
					uniform 	vec4 unity_SHBb;
					uniform 	vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_WorldTransformParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	float _FaceDilate;
					uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
					uniform 	float _WeightNormal;
					uniform 	float _WeightBold;
					uniform 	float _ScaleRatioA;
					uniform 	float _VertexOffsetX;
					uniform 	float _VertexOffsetY;
					uniform 	float _GradientScale;
					uniform 	float _ScaleX;
					uniform 	float _ScaleY;
					uniform 	float _PerspectiveFilter;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _FaceTex_ST;
					uniform 	vec4 _OutlineTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					int u_xlati5;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat3.x = floor(u_xlat15);
					    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat16 = (-_WeightNormal) + _WeightBold;
					    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
					    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
					    u_xlat15 = u_xlat15 * _ScaleRatioA;
					    vs_TEXCOORD5.x = u_xlat15 * 0.5;
					    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
					    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
					    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
					    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
					    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat16 = u_xlat15 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat16 = u_xlat16 * u_xlat2.x;
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
					    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
					    u_xlat0.z = in_POSITION0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
					    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati5) + u_xlati0;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
					    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
					    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
					    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
					    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat15 + u_xlat16;
					    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    vs_TEXCOORD2.y = u_xlat4.x;
					    vs_TEXCOORD2.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat3.z;
					    vs_TEXCOORD2.w = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat3.x;
					    vs_TEXCOORD4.x = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat4.y;
					    vs_TEXCOORD4.y = u_xlat4.z;
					    vs_TEXCOORD3.w = u_xlat1.y;
					    vs_TEXCOORD4.z = u_xlat2.w;
					    vs_TEXCOORD4.w = u_xlat1.z;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
					    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat2.yyyy * u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat2.xxxx + u_xlat3;
					    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
					    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
					    u_xlat1 = u_xlat1 * u_xlat2.wwzw + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat1;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat15 = u_xlat2.y * u_xlat2.y;
					    u_xlat15 = u_xlat2.x * u_xlat2.x + (-u_xlat15);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    vs_TEXCOORD7.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
					uniform 	vec4 _Time;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 unity_SHAr;
					uniform 	vec4 unity_SHAg;
					uniform 	vec4 unity_SHAb;
					uniform 	vec4 _LightColor0;
					uniform 	float _FaceUVSpeedX;
					uniform 	float _FaceUVSpeedY;
					uniform 	vec4 _FaceColor;
					uniform 	float _OutlineSoftness;
					uniform 	float _OutlineUVSpeedX;
					uniform 	float _OutlineUVSpeedY;
					uniform 	vec4 _OutlineColor;
					uniform 	float _OutlineWidth;
					uniform 	float _ScaleRatioA;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
					UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat5;
					float u_xlat6;
					float u_xlat10;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
					    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
					    u_xlat1.x = vs_COLOR0.w * _OutlineColor.w;
					    u_xlat1.w = u_xlat10_0.w * u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.www;
					    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
					    u_xlat10_0 = texture(_FaceTex, u_xlat0.xy);
					    u_xlat2 = vs_COLOR0 * _FaceColor;
					    u_xlat0 = u_xlat10_0 * u_xlat2;
					    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2 = (-u_xlat10_2.w) + 0.5;
					    u_xlat2.x = u_xlat16_2 + (-vs_TEXCOORD5.x);
					    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y + 0.5;
					    u_xlat6 = _OutlineWidth * _ScaleRatioA;
					    u_xlat6 = u_xlat6 * vs_TEXCOORD5.y;
					    u_xlat10 = u_xlat6 * 0.5 + u_xlat2.x;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat6) * 0.5 + u_xlat2.x;
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat0 = vec4(u_xlat6) * u_xlat1 + u_xlat0;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat5 = u_xlat1.x * vs_TEXCOORD5.y;
					    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
					    u_xlat5 = u_xlat5 * 0.5 + u_xlat2.x;
					    u_xlat1.x = u_xlat5 / u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.x = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xxx;
					    SV_Target0.w = u_xlat0.w;
					    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat2.x = vs_TEXCOORD2.z;
					    u_xlat2.y = vs_TEXCOORD3.z;
					    u_xlat2.z = vs_TEXCOORD4.z;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat2);
					    u_xlat3.y = dot(unity_SHAg, u_xlat2);
					    u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    u_xlat12 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD7.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 821
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %107 %119 %145 %160 %172 %223 %388 %496 %573 %586 %590 %612 %613 %636 %811 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
					                                                      OpName vs_TEXCOORD6 "vs_TEXCOORD6" 
					                                                      OpName vs_TEXCOORD7 "vs_TEXCOORD7" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpDecorate %22 ArrayStride 22 
					                                                      OpDecorate %23 ArrayStride 23 
					                                                      OpDecorate %24 ArrayStride 24 
					                                                      OpMemberDecorate %25 0 Offset 25 
					                                                      OpMemberDecorate %25 1 Offset 25 
					                                                      OpMemberDecorate %25 2 Offset 25 
					                                                      OpMemberDecorate %25 3 Offset 25 
					                                                      OpMemberDecorate %25 4 Offset 25 
					                                                      OpMemberDecorate %25 5 RelaxedPrecision 
					                                                      OpMemberDecorate %25 5 Offset 25 
					                                                      OpMemberDecorate %25 6 RelaxedPrecision 
					                                                      OpMemberDecorate %25 6 Offset 25 
					                                                      OpMemberDecorate %25 7 RelaxedPrecision 
					                                                      OpMemberDecorate %25 7 Offset 25 
					                                                      OpMemberDecorate %25 8 RelaxedPrecision 
					                                                      OpMemberDecorate %25 8 Offset 25 
					                                                      OpMemberDecorate %25 9 RelaxedPrecision 
					                                                      OpMemberDecorate %25 9 Offset 25 
					                                                      OpMemberDecorate %25 10 RelaxedPrecision 
					                                                      OpMemberDecorate %25 10 Offset 25 
					                                                      OpMemberDecorate %25 11 Offset 25 
					                                                      OpMemberDecorate %25 12 Offset 25 
					                                                      OpMemberDecorate %25 13 Offset 25 
					                                                      OpMemberDecorate %25 14 Offset 25 
					                                                      OpMemberDecorate %25 15 Offset 25 
					                                                      OpMemberDecorate %25 16 Offset 25 
					                                                      OpMemberDecorate %25 17 Offset 25 
					                                                      OpMemberDecorate %25 18 Offset 25 
					                                                      OpMemberDecorate %25 19 Offset 25 
					                                                      OpMemberDecorate %25 20 Offset 25 
					                                                      OpMemberDecorate %25 21 Offset 25 
					                                                      OpMemberDecorate %25 22 Offset 25 
					                                                      OpMemberDecorate %25 23 Offset 25 
					                                                      OpMemberDecorate %25 24 Offset 25 
					                                                      OpMemberDecorate %25 25 Offset 25 
					                                                      OpMemberDecorate %25 26 Offset 25 
					                                                      OpMemberDecorate %25 27 Offset 25 
					                                                      OpMemberDecorate %25 28 Offset 25 
					                                                      OpMemberDecorate %25 29 Offset 25 
					                                                      OpDecorate %25 Block 
					                                                      OpDecorate %27 DescriptorSet 27 
					                                                      OpDecorate %27 Binding 27 
					                                                      OpMemberDecorate %105 0 BuiltIn 105 
					                                                      OpMemberDecorate %105 1 BuiltIn 105 
					                                                      OpMemberDecorate %105 2 BuiltIn 105 
					                                                      OpDecorate %105 Block 
					                                                      OpDecorate %119 Location 119 
					                                                      OpDecorate vs_TEXCOORD0 Location 145 
					                                                      OpDecorate vs_TEXCOORD1 Location 160 
					                                                      OpDecorate %172 Location 172 
					                                                      OpDecorate vs_TEXCOORD5 Location 223 
					                                                      OpDecorate %388 Location 388 
					                                                      OpDecorate %496 Location 496 
					                                                      OpDecorate vs_TEXCOORD2 Location 573 
					                                                      OpDecorate vs_TEXCOORD3 Location 586 
					                                                      OpDecorate vs_TEXCOORD4 Location 590 
					                                                      OpDecorate %612 RelaxedPrecision 
					                                                      OpDecorate %612 Location 612 
					                                                      OpDecorate %613 RelaxedPrecision 
					                                                      OpDecorate %613 Location 613 
					                                                      OpDecorate %614 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD6 Location 636 
					                                                      OpDecorate %703 RelaxedPrecision 
					                                                      OpDecorate %722 RelaxedPrecision 
					                                                      OpDecorate %723 RelaxedPrecision 
					                                                      OpDecorate %728 RelaxedPrecision 
					                                                      OpDecorate %729 RelaxedPrecision 
					                                                      OpDecorate %739 RelaxedPrecision 
					                                                      OpDecorate %740 RelaxedPrecision 
					                                                      OpDecorate %750 RelaxedPrecision 
					                                                      OpDecorate %751 RelaxedPrecision 
					                                                      OpDecorate %761 RelaxedPrecision 
					                                                      OpDecorate %774 RelaxedPrecision 
					                                                      OpDecorate %775 RelaxedPrecision 
					                                                      OpDecorate %778 RelaxedPrecision 
					                                                      OpDecorate %783 RelaxedPrecision 
					                                                      OpDecorate %786 RelaxedPrecision 
					                                                      OpDecorate %787 RelaxedPrecision 
					                                                      OpDecorate %788 RelaxedPrecision 
					                                                      OpDecorate %792 RelaxedPrecision 
					                                                      OpDecorate %793 RelaxedPrecision 
					                                                      OpDecorate %794 RelaxedPrecision 
					                                                      OpDecorate %798 RelaxedPrecision 
					                                                      OpDecorate %799 RelaxedPrecision 
					                                                      OpDecorate %800 RelaxedPrecision 
					                                                      OpDecorate %804 RelaxedPrecision 
					                                                      OpDecorate %805 RelaxedPrecision 
					                                                      OpDecorate %806 RelaxedPrecision 
					                                                      OpDecorate %807 RelaxedPrecision 
					                                                      OpDecorate %808 RelaxedPrecision 
					                                                      OpDecorate %809 RelaxedPrecision 
					                                                      OpDecorate %810 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 Location 811 
					                                                      OpDecorate %814 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                                 Input f32_4* %11 = OpVariable Input 
					                                              %12 = OpTypeVector %6 2 
					                                              %15 = OpTypeVector %6 3 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 8 
					                                              %18 = OpTypeArray %7 %17 
					                                          u32 %19 = OpConstant 4 
					                                              %20 = OpTypeArray %7 %19 
					                                              %21 = OpTypeArray %7 %19 
					                                              %22 = OpTypeArray %7 %19 
					                                              %23 = OpTypeArray %7 %19 
					                                              %24 = OpTypeArray %7 %19 
					                                              %25 = OpTypeStruct %15 %7 %7 %7 %7 %7 %18 %7 %7 %7 %7 %20 %21 %7 %22 %23 %6 %24 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 %7 %7 
					                                              %26 = OpTypePointer Uniform %25 
					Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32; f32_4[4]; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32_4;}* %27 = OpVariable Uniform 
					                                              %28 = OpTypeInt 32 1 
					                                          i32 %29 = OpConstant 21 
					                                              %30 = OpTypePointer Uniform %6 
					                                          i32 %33 = OpConstant 22 
					                               Private f32_4* %40 = OpVariable Private 
					                                          i32 %43 = OpConstant 11 
					                                          i32 %44 = OpConstant 1 
					                                              %45 = OpTypePointer Uniform %7 
					                                          i32 %49 = OpConstant 0 
					                                          i32 %57 = OpConstant 2 
					                               Private f32_4* %65 = OpVariable Private 
					                                          i32 %67 = OpConstant 3 
					                               Private f32_4* %82 = OpVariable Private 
					                                          i32 %85 = OpConstant 15 
					                                         u32 %103 = OpConstant 1 
					                                             %104 = OpTypeArray %6 %103 
					                                             %105 = OpTypeStruct %7 %6 %104 
					                                             %106 = OpTypePointer Output %105 
					        Output struct {f32_4; f32; f32[1];}* %107 = OpVariable Output 
					                                             %115 = OpTypePointer Output %7 
					                                             %117 = OpTypePointer Private %6 
					                                Private f32* %118 = OpVariable Private 
					                                Input f32_4* %119 = OpVariable Input 
					                                         u32 %120 = OpConstant 0 
					                                             %121 = OpTypePointer Input %6 
					                                         f32 %124 = OpConstant 3,674022E-40 
					                                         f32 %132 = OpConstant 3,674022E-40 
					                                         f32 %140 = OpConstant 3,674022E-40 
					                                       f32_2 %141 = OpConstantComposite %140 %140 
					                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                                         i32 %148 = OpConstant 28 
					                                             %159 = OpTypePointer Output %12 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         i32 %163 = OpConstant 29 
					                                Input f32_4* %172 = OpVariable Input 
					                                         i32 %175 = OpConstant 27 
					                                             %186 = OpTypeBool 
					                                             %187 = OpTypePointer Private %186 
					                               Private bool* %188 = OpVariable Private 
					                                         f32 %189 = OpConstant 3,674022E-40 
					                                         f32 %194 = OpConstant 3,674022E-40 
					                                Private f32* %196 = OpVariable Private 
					                                         i32 %197 = OpConstant 18 
					                                         i32 %201 = OpConstant 19 
					                                         f32 %212 = OpConstant 3,674022E-40 
					                                         i32 %214 = OpConstant 16 
					                                         i32 %219 = OpConstant 20 
					                       Output f32_2* vs_TEXCOORD5 = OpVariable Output 
					                                         f32 %225 = OpConstant 3,674022E-40 
					                                             %227 = OpTypePointer Output %6 
					                                         u32 %231 = OpConstant 3 
					                                         u32 %244 = OpConstant 2 
					                                         i32 %260 = OpConstant 14 
					                                         i32 %281 = OpConstant 24 
					                                         i32 %284 = OpConstant 25 
					                                         i32 %308 = OpConstant 23 
					                                         f32 %316 = OpConstant 3,674022E-40 
					                                         i32 %318 = OpConstant 26 
					                                             %333 = OpTypePointer Uniform %15 
					                                         i32 %337 = OpConstant 12 
					                                             %387 = OpTypePointer Input %15 
					                                Input f32_3* %388 = OpVariable Input 
					                                             %394 = OpTypePointer Private %28 
					                                Private i32* %395 = OpVariable Private 
					                                         u32 %399 = OpConstant 4294967295 
					                                Private i32* %402 = OpVariable Private 
					                                Input f32_4* %496 = OpVariable Input 
					                              Private f32_4* %541 = OpVariable Private 
					                                         i32 %562 = OpConstant 13 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
					                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
					                               Output f32_4* %612 = OpVariable Output 
					                                Input f32_4* %613 = OpVariable Input 
					                                         i32 %617 = OpConstant 17 
					                                             %635 = OpTypePointer Output %15 
					                       Output f32_3* vs_TEXCOORD6 = OpVariable Output 
					                                         i32 %668 = OpConstant 4 
					                                         f32 %695 = OpConstant 3,674022E-40 
					                                       f32_4 %696 = OpConstantComposite %695 %695 %695 %695 
					                                         i32 %701 = OpConstant 5 
					                                       f32_4 %705 = OpConstantComposite %194 %194 %194 %194 
					                                       f32_4 %713 = OpConstantComposite %189 %189 %189 %189 
					                                         i32 %720 = OpConstant 6 
					                                             %760 = OpTypePointer Private %15 
					                              Private f32_3* %761 = OpVariable Private 
					                              Private f32_4* %778 = OpVariable Private 
					                              Private f32_3* %783 = OpVariable Private 
					                                         i32 %784 = OpConstant 7 
					                                         i32 %790 = OpConstant 8 
					                                         i32 %796 = OpConstant 9 
					                                         i32 %802 = OpConstant 10 
					                       Output f32_3* vs_TEXCOORD7 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_4 %13 = OpLoad %11 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                 Uniform f32* %31 = OpAccessChain %27 %29 
					                                          f32 %32 = OpLoad %31 
					                                 Uniform f32* %34 = OpAccessChain %27 %33 
					                                          f32 %35 = OpLoad %34 
					                                        f32_2 %36 = OpCompositeConstruct %32 %35 
					                                        f32_2 %37 = OpFAdd %14 %36 
					                                        f32_4 %38 = OpLoad %9 
					                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
					                                                      OpStore %9 %39 
					                                        f32_4 %41 = OpLoad %9 
					                                        f32_4 %42 = OpVectorShuffle %41 %41 1 1 1 1 
					                               Uniform f32_4* %46 = OpAccessChain %27 %43 %44 
					                                        f32_4 %47 = OpLoad %46 
					                                        f32_4 %48 = OpFMul %42 %47 
					                                                      OpStore %40 %48 
					                               Uniform f32_4* %50 = OpAccessChain %27 %43 %49 
					                                        f32_4 %51 = OpLoad %50 
					                                        f32_4 %52 = OpLoad %9 
					                                        f32_4 %53 = OpVectorShuffle %52 %52 0 0 0 0 
					                                        f32_4 %54 = OpFMul %51 %53 
					                                        f32_4 %55 = OpLoad %40 
					                                        f32_4 %56 = OpFAdd %54 %55 
					                                                      OpStore %40 %56 
					                               Uniform f32_4* %58 = OpAccessChain %27 %43 %57 
					                                        f32_4 %59 = OpLoad %58 
					                                        f32_4 %60 = OpLoad %11 
					                                        f32_4 %61 = OpVectorShuffle %60 %60 2 2 2 2 
					                                        f32_4 %62 = OpFMul %59 %61 
					                                        f32_4 %63 = OpLoad %40 
					                                        f32_4 %64 = OpFAdd %62 %63 
					                                                      OpStore %40 %64 
					                                        f32_4 %66 = OpLoad %40 
					                               Uniform f32_4* %68 = OpAccessChain %27 %43 %67 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpFAdd %66 %69 
					                                                      OpStore %65 %70 
					                               Uniform f32_4* %71 = OpAccessChain %27 %43 %67 
					                                        f32_4 %72 = OpLoad %71 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                                        f32_4 %74 = OpLoad %11 
					                                        f32_3 %75 = OpVectorShuffle %74 %74 3 3 3 
					                                        f32_3 %76 = OpFMul %73 %75 
					                                        f32_4 %77 = OpLoad %40 
					                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
					                                        f32_3 %79 = OpFAdd %76 %78 
					                                        f32_4 %80 = OpLoad %40 
					                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
					                                                      OpStore %40 %81 
					                                        f32_4 %83 = OpLoad %65 
					                                        f32_4 %84 = OpVectorShuffle %83 %83 1 1 1 1 
					                               Uniform f32_4* %86 = OpAccessChain %27 %85 %44 
					                                        f32_4 %87 = OpLoad %86 
					                                        f32_4 %88 = OpFMul %84 %87 
					                                                      OpStore %82 %88 
					                               Uniform f32_4* %89 = OpAccessChain %27 %85 %49 
					                                        f32_4 %90 = OpLoad %89 
					                                        f32_4 %91 = OpLoad %65 
					                                        f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
					                                        f32_4 %93 = OpFMul %90 %92 
					                                        f32_4 %94 = OpLoad %82 
					                                        f32_4 %95 = OpFAdd %93 %94 
					                                                      OpStore %82 %95 
					                               Uniform f32_4* %96 = OpAccessChain %27 %85 %57 
					                                        f32_4 %97 = OpLoad %96 
					                                        f32_4 %98 = OpLoad %65 
					                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
					                                       f32_4 %100 = OpFMul %97 %99 
					                                       f32_4 %101 = OpLoad %82 
					                                       f32_4 %102 = OpFAdd %100 %101 
					                                                      OpStore %82 %102 
					                              Uniform f32_4* %108 = OpAccessChain %27 %85 %67 
					                                       f32_4 %109 = OpLoad %108 
					                                       f32_4 %110 = OpLoad %65 
					                                       f32_4 %111 = OpVectorShuffle %110 %110 3 3 3 3 
					                                       f32_4 %112 = OpFMul %109 %111 
					                                       f32_4 %113 = OpLoad %82 
					                                       f32_4 %114 = OpFAdd %112 %113 
					                               Output f32_4* %116 = OpAccessChain %107 %49 
					                                                      OpStore %116 %114 
					                                  Input f32* %122 = OpAccessChain %119 %120 
					                                         f32 %123 = OpLoad %122 
					                                         f32 %125 = OpFMul %123 %124 
					                                                      OpStore %118 %125 
					                                         f32 %126 = OpLoad %118 
					                                         f32 %127 = OpExtInst %1 8 %126 
					                                Private f32* %128 = OpAccessChain %82 %120 
					                                                      OpStore %128 %127 
					                                Private f32* %129 = OpAccessChain %82 %120 
					                                         f32 %130 = OpLoad %129 
					                                         f32 %131 = OpFNegate %130 
					                                         f32 %133 = OpFMul %131 %132 
					                                  Input f32* %134 = OpAccessChain %119 %120 
					                                         f32 %135 = OpLoad %134 
					                                         f32 %136 = OpFAdd %133 %135 
					                                Private f32* %137 = OpAccessChain %82 %103 
					                                                      OpStore %137 %136 
					                                       f32_4 %138 = OpLoad %82 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                                       f32_2 %142 = OpFMul %139 %141 
					                                       f32_4 %143 = OpLoad %82 
					                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 2 3 
					                                                      OpStore %82 %144 
					                                       f32_4 %146 = OpLoad %82 
					                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
					                              Uniform f32_4* %149 = OpAccessChain %27 %148 
					                                       f32_4 %150 = OpLoad %149 
					                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
					                                       f32_2 %152 = OpFMul %147 %151 
					                              Uniform f32_4* %153 = OpAccessChain %27 %148 
					                                       f32_4 %154 = OpLoad %153 
					                                       f32_2 %155 = OpVectorShuffle %154 %154 2 3 
					                                       f32_2 %156 = OpFAdd %152 %155 
					                                       f32_4 %157 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %158 = OpVectorShuffle %157 %156 0 1 4 5 
					                                                      OpStore vs_TEXCOORD0 %158 
					                                       f32_4 %161 = OpLoad %82 
					                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
					                              Uniform f32_4* %164 = OpAccessChain %27 %163 
					                                       f32_4 %165 = OpLoad %164 
					                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
					                                       f32_2 %167 = OpFMul %162 %166 
					                              Uniform f32_4* %168 = OpAccessChain %27 %163 
					                                       f32_4 %169 = OpLoad %168 
					                                       f32_2 %170 = OpVectorShuffle %169 %169 2 3 
					                                       f32_2 %171 = OpFAdd %167 %170 
					                                                      OpStore vs_TEXCOORD1 %171 
					                                       f32_4 %173 = OpLoad %172 
					                                       f32_2 %174 = OpVectorShuffle %173 %173 0 1 
					                              Uniform f32_4* %176 = OpAccessChain %27 %175 
					                                       f32_4 %177 = OpLoad %176 
					                                       f32_2 %178 = OpVectorShuffle %177 %177 0 1 
					                                       f32_2 %179 = OpFMul %174 %178 
					                              Uniform f32_4* %180 = OpAccessChain %27 %175 
					                                       f32_4 %181 = OpLoad %180 
					                                       f32_2 %182 = OpVectorShuffle %181 %181 2 3 
					                                       f32_2 %183 = OpFAdd %179 %182 
					                                       f32_4 %184 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 2 3 
					                                                      OpStore vs_TEXCOORD0 %185 
					                                  Input f32* %190 = OpAccessChain %119 %103 
					                                         f32 %191 = OpLoad %190 
					                                        bool %192 = OpFOrdGreaterThanEqual %189 %191 
					                                                      OpStore %188 %192 
					                                        bool %193 = OpLoad %188 
					                                         f32 %195 = OpSelect %193 %194 %189 
					                                                      OpStore %118 %195 
					                                Uniform f32* %198 = OpAccessChain %27 %197 
					                                         f32 %199 = OpLoad %198 
					                                         f32 %200 = OpFNegate %199 
					                                Uniform f32* %202 = OpAccessChain %27 %201 
					                                         f32 %203 = OpLoad %202 
					                                         f32 %204 = OpFAdd %200 %203 
					                                                      OpStore %196 %204 
					                                         f32 %205 = OpLoad %118 
					                                         f32 %206 = OpLoad %196 
					                                         f32 %207 = OpFMul %205 %206 
					                                Uniform f32* %208 = OpAccessChain %27 %197 
					                                         f32 %209 = OpLoad %208 
					                                         f32 %210 = OpFAdd %207 %209 
					                                                      OpStore %118 %210 
					                                         f32 %211 = OpLoad %118 
					                                         f32 %213 = OpFMul %211 %212 
					                                Uniform f32* %215 = OpAccessChain %27 %214 
					                                         f32 %216 = OpLoad %215 
					                                         f32 %217 = OpFAdd %213 %216 
					                                                      OpStore %118 %217 
					                                         f32 %218 = OpLoad %118 
					                                Uniform f32* %220 = OpAccessChain %27 %219 
					                                         f32 %221 = OpLoad %220 
					                                         f32 %222 = OpFMul %218 %221 
					                                                      OpStore %118 %222 
					                                         f32 %224 = OpLoad %118 
					                                         f32 %226 = OpFMul %224 %225 
					                                 Output f32* %228 = OpAccessChain vs_TEXCOORD5 %120 
					                                                      OpStore %228 %226 
					                                Private f32* %229 = OpAccessChain %65 %103 
					                                         f32 %230 = OpLoad %229 
					                                Uniform f32* %232 = OpAccessChain %27 %85 %44 %231 
					                                         f32 %233 = OpLoad %232 
					                                         f32 %234 = OpFMul %230 %233 
					                                                      OpStore %118 %234 
					                                Uniform f32* %235 = OpAccessChain %27 %85 %49 %231 
					                                         f32 %236 = OpLoad %235 
					                                Private f32* %237 = OpAccessChain %65 %120 
					                                         f32 %238 = OpLoad %237 
					                                         f32 %239 = OpFMul %236 %238 
					                                         f32 %240 = OpLoad %118 
					                                         f32 %241 = OpFAdd %239 %240 
					                                                      OpStore %118 %241 
					                                Uniform f32* %242 = OpAccessChain %27 %85 %57 %231 
					                                         f32 %243 = OpLoad %242 
					                                Private f32* %245 = OpAccessChain %65 %244 
					                                         f32 %246 = OpLoad %245 
					                                         f32 %247 = OpFMul %243 %246 
					                                         f32 %248 = OpLoad %118 
					                                         f32 %249 = OpFAdd %247 %248 
					                                                      OpStore %118 %249 
					                                Uniform f32* %250 = OpAccessChain %27 %85 %67 %231 
					                                         f32 %251 = OpLoad %250 
					                                Private f32* %252 = OpAccessChain %65 %231 
					                                         f32 %253 = OpLoad %252 
					                                         f32 %254 = OpFMul %251 %253 
					                                         f32 %255 = OpLoad %118 
					                                         f32 %256 = OpFAdd %254 %255 
					                                                      OpStore %118 %256 
					                              Uniform f32_4* %257 = OpAccessChain %27 %44 
					                                       f32_4 %258 = OpLoad %257 
					                                       f32_2 %259 = OpVectorShuffle %258 %258 1 1 
					                              Uniform f32_4* %261 = OpAccessChain %27 %260 %44 
					                                       f32_4 %262 = OpLoad %261 
					                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
					                                       f32_2 %264 = OpFMul %259 %263 
					                                       f32_4 %265 = OpLoad %65 
					                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
					                                                      OpStore %65 %266 
					                              Uniform f32_4* %267 = OpAccessChain %27 %260 %49 
					                                       f32_4 %268 = OpLoad %267 
					                                       f32_2 %269 = OpVectorShuffle %268 %268 0 1 
					                              Uniform f32_4* %270 = OpAccessChain %27 %44 
					                                       f32_4 %271 = OpLoad %270 
					                                       f32_2 %272 = OpVectorShuffle %271 %271 0 0 
					                                       f32_2 %273 = OpFMul %269 %272 
					                                       f32_4 %274 = OpLoad %65 
					                                       f32_2 %275 = OpVectorShuffle %274 %274 0 1 
					                                       f32_2 %276 = OpFAdd %273 %275 
					                                       f32_4 %277 = OpLoad %65 
					                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 2 3 
					                                                      OpStore %65 %278 
					                                       f32_4 %279 = OpLoad %65 
					                                       f32_2 %280 = OpVectorShuffle %279 %279 0 1 
					                                Uniform f32* %282 = OpAccessChain %27 %281 
					                                         f32 %283 = OpLoad %282 
					                                Uniform f32* %285 = OpAccessChain %27 %284 
					                                         f32 %286 = OpLoad %285 
					                                       f32_2 %287 = OpCompositeConstruct %283 %286 
					                                       f32_2 %288 = OpFMul %280 %287 
					                                       f32_4 %289 = OpLoad %65 
					                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 2 3 
					                                                      OpStore %65 %290 
					                                         f32 %291 = OpLoad %118 
					                                       f32_2 %292 = OpCompositeConstruct %291 %291 
					                                       f32_4 %293 = OpLoad %65 
					                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
					                                       f32_2 %295 = OpFDiv %292 %294 
					                                       f32_4 %296 = OpLoad %65 
					                                       f32_4 %297 = OpVectorShuffle %296 %295 4 5 2 3 
					                                                      OpStore %65 %297 
					                                       f32_4 %298 = OpLoad %65 
					                                       f32_2 %299 = OpVectorShuffle %298 %298 0 1 
					                                       f32_4 %300 = OpLoad %65 
					                                       f32_2 %301 = OpVectorShuffle %300 %300 0 1 
					                                         f32 %302 = OpDot %299 %301 
					                                                      OpStore %118 %302 
					                                         f32 %303 = OpLoad %118 
					                                         f32 %304 = OpExtInst %1 32 %303 
					                                                      OpStore %118 %304 
					                                  Input f32* %305 = OpAccessChain %119 %103 
					                                         f32 %306 = OpLoad %305 
					                                         f32 %307 = OpExtInst %1 4 %306 
					                                Uniform f32* %309 = OpAccessChain %27 %308 
					                                         f32 %310 = OpLoad %309 
					                                         f32 %311 = OpFMul %307 %310 
					                                                      OpStore %196 %311 
					                                         f32 %312 = OpLoad %118 
					                                         f32 %313 = OpLoad %196 
					                                         f32 %314 = OpFMul %312 %313 
					                                                      OpStore %118 %314 
					                                         f32 %315 = OpLoad %118 
					                                         f32 %317 = OpFMul %315 %316 
					                                                      OpStore %196 %317 
					                                Uniform f32* %319 = OpAccessChain %27 %318 
					                                         f32 %320 = OpLoad %319 
					                                         f32 %321 = OpFNegate %320 
					                                         f32 %322 = OpFAdd %321 %194 
					                                Private f32* %323 = OpAccessChain %65 %120 
					                                                      OpStore %323 %322 
					                                         f32 %324 = OpLoad %196 
					                                Private f32* %325 = OpAccessChain %65 %120 
					                                         f32 %326 = OpLoad %325 
					                                         f32 %327 = OpFMul %324 %326 
					                                                      OpStore %196 %327 
					                                         f32 %328 = OpLoad %118 
					                                         f32 %329 = OpFMul %328 %316 
					                                         f32 %330 = OpLoad %196 
					                                         f32 %331 = OpFNegate %330 
					                                         f32 %332 = OpFAdd %329 %331 
					                                                      OpStore %118 %332 
					                              Uniform f32_3* %334 = OpAccessChain %27 %49 
					                                       f32_3 %335 = OpLoad %334 
					                                       f32_3 %336 = OpVectorShuffle %335 %335 1 1 1 
					                              Uniform f32_4* %338 = OpAccessChain %27 %337 %44 
					                                       f32_4 %339 = OpLoad %338 
					                                       f32_3 %340 = OpVectorShuffle %339 %339 0 1 2 
					                                       f32_3 %341 = OpFMul %336 %340 
					                                       f32_4 %342 = OpLoad %65 
					                                       f32_4 %343 = OpVectorShuffle %342 %341 4 5 6 3 
					                                                      OpStore %65 %343 
					                              Uniform f32_4* %344 = OpAccessChain %27 %337 %49 
					                                       f32_4 %345 = OpLoad %344 
					                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
					                              Uniform f32_3* %347 = OpAccessChain %27 %49 
					                                       f32_3 %348 = OpLoad %347 
					                                       f32_3 %349 = OpVectorShuffle %348 %348 0 0 0 
					                                       f32_3 %350 = OpFMul %346 %349 
					                                       f32_4 %351 = OpLoad %65 
					                                       f32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
					                                       f32_3 %353 = OpFAdd %350 %352 
					                                       f32_4 %354 = OpLoad %65 
					                                       f32_4 %355 = OpVectorShuffle %354 %353 4 5 6 3 
					                                                      OpStore %65 %355 
					                              Uniform f32_4* %356 = OpAccessChain %27 %337 %57 
					                                       f32_4 %357 = OpLoad %356 
					                                       f32_3 %358 = OpVectorShuffle %357 %357 0 1 2 
					                              Uniform f32_3* %359 = OpAccessChain %27 %49 
					                                       f32_3 %360 = OpLoad %359 
					                                       f32_3 %361 = OpVectorShuffle %360 %360 2 2 2 
					                                       f32_3 %362 = OpFMul %358 %361 
					                                       f32_4 %363 = OpLoad %65 
					                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
					                                       f32_3 %365 = OpFAdd %362 %364 
					                                       f32_4 %366 = OpLoad %65 
					                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
					                                                      OpStore %65 %367 
					                                       f32_4 %368 = OpLoad %65 
					                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
					                              Uniform f32_4* %370 = OpAccessChain %27 %337 %67 
					                                       f32_4 %371 = OpLoad %370 
					                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
					                                       f32_3 %373 = OpFAdd %369 %372 
					                                       f32_4 %374 = OpLoad %65 
					                                       f32_4 %375 = OpVectorShuffle %374 %373 4 5 6 3 
					                                                      OpStore %65 %375 
					                                  Input f32* %376 = OpAccessChain %11 %244 
					                                         f32 %377 = OpLoad %376 
					                                Private f32* %378 = OpAccessChain %9 %244 
					                                                      OpStore %378 %377 
					                                       f32_4 %379 = OpLoad %9 
					                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
					                                       f32_3 %381 = OpFNegate %380 
					                                       f32_4 %382 = OpLoad %65 
					                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
					                                       f32_3 %384 = OpFAdd %381 %383 
					                                       f32_4 %385 = OpLoad %9 
					                                       f32_4 %386 = OpVectorShuffle %385 %384 4 5 6 3 
					                                                      OpStore %9 %386 
					                                       f32_3 %389 = OpLoad %388 
					                                       f32_4 %390 = OpLoad %9 
					                                       f32_3 %391 = OpVectorShuffle %390 %390 0 1 2 
					                                         f32 %392 = OpDot %389 %391 
					                                Private f32* %393 = OpAccessChain %9 %120 
					                                                      OpStore %393 %392 
					                                Private f32* %396 = OpAccessChain %9 %120 
					                                         f32 %397 = OpLoad %396 
					                                        bool %398 = OpFOrdLessThan %189 %397 
					                                         u32 %400 = OpSelect %398 %399 %120 
					                                         i32 %401 = OpBitcast %400 
					                                                      OpStore %395 %401 
					                                Private f32* %403 = OpAccessChain %9 %120 
					                                         f32 %404 = OpLoad %403 
					                                        bool %405 = OpFOrdLessThan %404 %189 
					                                         u32 %406 = OpSelect %405 %399 %120 
					                                         i32 %407 = OpBitcast %406 
					                                                      OpStore %402 %407 
					                                         i32 %408 = OpLoad %395 
					                                         i32 %409 = OpSNegate %408 
					                                         i32 %410 = OpLoad %402 
					                                         i32 %411 = OpIAdd %409 %410 
					                                                      OpStore %402 %411 
					                                         i32 %412 = OpLoad %402 
					                                         f32 %413 = OpConvertSToF %412 
					                                Private f32* %414 = OpAccessChain %9 %120 
					                                                      OpStore %414 %413 
					                                       f32_4 %415 = OpLoad %9 
					                                       f32_3 %416 = OpVectorShuffle %415 %415 0 0 0 
					                                       f32_3 %417 = OpLoad %388 
					                                       f32_3 %418 = OpFMul %416 %417 
					                                       f32_4 %419 = OpLoad %9 
					                                       f32_4 %420 = OpVectorShuffle %419 %418 4 5 6 3 
					                                                      OpStore %9 %420 
					                                       f32_4 %421 = OpLoad %9 
					                                       f32_3 %422 = OpVectorShuffle %421 %421 0 1 2 
					                              Uniform f32_4* %423 = OpAccessChain %27 %337 %49 
					                                       f32_4 %424 = OpLoad %423 
					                                       f32_3 %425 = OpVectorShuffle %424 %424 0 1 2 
					                                         f32 %426 = OpDot %422 %425 
					                                Private f32* %427 = OpAccessChain %65 %120 
					                                                      OpStore %427 %426 
					                                       f32_4 %428 = OpLoad %9 
					                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
					                              Uniform f32_4* %430 = OpAccessChain %27 %337 %44 
					                                       f32_4 %431 = OpLoad %430 
					                                       f32_3 %432 = OpVectorShuffle %431 %431 0 1 2 
					                                         f32 %433 = OpDot %429 %432 
					                                Private f32* %434 = OpAccessChain %65 %103 
					                                                      OpStore %434 %433 
					                                       f32_4 %435 = OpLoad %9 
					                                       f32_3 %436 = OpVectorShuffle %435 %435 0 1 2 
					                              Uniform f32_4* %437 = OpAccessChain %27 %337 %57 
					                                       f32_4 %438 = OpLoad %437 
					                                       f32_3 %439 = OpVectorShuffle %438 %438 0 1 2 
					                                         f32 %440 = OpDot %436 %439 
					                                Private f32* %441 = OpAccessChain %65 %244 
					                                                      OpStore %441 %440 
					                                       f32_4 %442 = OpLoad %65 
					                                       f32_3 %443 = OpVectorShuffle %442 %442 0 1 2 
					                                       f32_4 %444 = OpLoad %65 
					                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
					                                         f32 %446 = OpDot %443 %445 
					                                Private f32* %447 = OpAccessChain %9 %120 
					                                                      OpStore %447 %446 
					                                Private f32* %448 = OpAccessChain %9 %120 
					                                         f32 %449 = OpLoad %448 
					                                         f32 %450 = OpExtInst %1 32 %449 
					                                Private f32* %451 = OpAccessChain %9 %120 
					                                                      OpStore %451 %450 
					                                       f32_4 %452 = OpLoad %9 
					                                       f32_4 %453 = OpVectorShuffle %452 %452 0 0 0 0 
					                                       f32_4 %454 = OpLoad %65 
					                                       f32_4 %455 = OpVectorShuffle %454 %454 0 1 2 2 
					                                       f32_4 %456 = OpFMul %453 %455 
					                                                      OpStore %65 %456 
					                                       f32_4 %457 = OpLoad %40 
					                                       f32_3 %458 = OpVectorShuffle %457 %457 0 1 2 
					                                       f32_3 %459 = OpFNegate %458 
					                              Uniform f32_3* %460 = OpAccessChain %27 %49 
					                                       f32_3 %461 = OpLoad %460 
					                                       f32_3 %462 = OpFAdd %459 %461 
					                                       f32_4 %463 = OpLoad %9 
					                                       f32_4 %464 = OpVectorShuffle %463 %462 4 5 6 3 
					                                                      OpStore %9 %464 
					                                       f32_4 %465 = OpLoad %9 
					                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
					                                       f32_4 %467 = OpLoad %9 
					                                       f32_3 %468 = OpVectorShuffle %467 %467 0 1 2 
					                                         f32 %469 = OpDot %466 %468 
					                                Private f32* %470 = OpAccessChain %82 %120 
					                                                      OpStore %470 %469 
					                                Private f32* %471 = OpAccessChain %82 %120 
					                                         f32 %472 = OpLoad %471 
					                                         f32 %473 = OpExtInst %1 32 %472 
					                                Private f32* %474 = OpAccessChain %82 %120 
					                                                      OpStore %474 %473 
					                                       f32_4 %475 = OpLoad %9 
					                                       f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
					                                       f32_4 %477 = OpLoad %82 
					                                       f32_3 %478 = OpVectorShuffle %477 %477 0 0 0 
					                                       f32_3 %479 = OpFMul %476 %478 
					                                       f32_4 %480 = OpLoad %82 
					                                       f32_4 %481 = OpVectorShuffle %480 %479 4 5 6 3 
					                                                      OpStore %82 %481 
					                                       f32_4 %482 = OpLoad %65 
					                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 3 
					                                       f32_4 %484 = OpLoad %82 
					                                       f32_3 %485 = OpVectorShuffle %484 %484 0 1 2 
					                                         f32 %486 = OpDot %483 %485 
					                                Private f32* %487 = OpAccessChain %82 %120 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %82 %120 
					                                         f32 %489 = OpLoad %488 
					                                         f32 %490 = OpExtInst %1 4 %489 
					                                         f32 %491 = OpLoad %118 
					                                         f32 %492 = OpFMul %490 %491 
					                                         f32 %493 = OpLoad %196 
					                                         f32 %494 = OpFAdd %492 %493 
					                                 Output f32* %495 = OpAccessChain vs_TEXCOORD5 %103 
					                                                      OpStore %495 %494 
					                                       f32_4 %497 = OpLoad %496 
					                                       f32_3 %498 = OpVectorShuffle %497 %497 1 1 1 
					                              Uniform f32_4* %499 = OpAccessChain %27 %43 %44 
					                                       f32_4 %500 = OpLoad %499 
					                                       f32_3 %501 = OpVectorShuffle %500 %500 1 2 0 
					                                       f32_3 %502 = OpFMul %498 %501 
					                                       f32_4 %503 = OpLoad %82 
					                                       f32_4 %504 = OpVectorShuffle %503 %502 4 5 6 3 
					                                                      OpStore %82 %504 
					                              Uniform f32_4* %505 = OpAccessChain %27 %43 %49 
					                                       f32_4 %506 = OpLoad %505 
					                                       f32_3 %507 = OpVectorShuffle %506 %506 1 2 0 
					                                       f32_4 %508 = OpLoad %496 
					                                       f32_3 %509 = OpVectorShuffle %508 %508 0 0 0 
					                                       f32_3 %510 = OpFMul %507 %509 
					                                       f32_4 %511 = OpLoad %82 
					                                       f32_3 %512 = OpVectorShuffle %511 %511 0 1 2 
					                                       f32_3 %513 = OpFAdd %510 %512 
					                                       f32_4 %514 = OpLoad %82 
					                                       f32_4 %515 = OpVectorShuffle %514 %513 4 5 6 3 
					                                                      OpStore %82 %515 
					                              Uniform f32_4* %516 = OpAccessChain %27 %43 %57 
					                                       f32_4 %517 = OpLoad %516 
					                                       f32_3 %518 = OpVectorShuffle %517 %517 1 2 0 
					                                       f32_4 %519 = OpLoad %496 
					                                       f32_3 %520 = OpVectorShuffle %519 %519 2 2 2 
					                                       f32_3 %521 = OpFMul %518 %520 
					                                       f32_4 %522 = OpLoad %82 
					                                       f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
					                                       f32_3 %524 = OpFAdd %521 %523 
					                                       f32_4 %525 = OpLoad %82 
					                                       f32_4 %526 = OpVectorShuffle %525 %524 4 5 6 3 
					                                                      OpStore %82 %526 
					                                       f32_4 %527 = OpLoad %82 
					                                       f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
					                                       f32_4 %529 = OpLoad %82 
					                                       f32_3 %530 = OpVectorShuffle %529 %529 0 1 2 
					                                         f32 %531 = OpDot %528 %530 
					                                                      OpStore %118 %531 
					                                         f32 %532 = OpLoad %118 
					                                         f32 %533 = OpExtInst %1 32 %532 
					                                                      OpStore %118 %533 
					                                         f32 %534 = OpLoad %118 
					                                       f32_3 %535 = OpCompositeConstruct %534 %534 %534 
					                                       f32_4 %536 = OpLoad %82 
					                                       f32_3 %537 = OpVectorShuffle %536 %536 0 1 2 
					                                       f32_3 %538 = OpFMul %535 %537 
					                                       f32_4 %539 = OpLoad %82 
					                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
					                                                      OpStore %82 %540 
					                                       f32_4 %542 = OpLoad %65 
					                                       f32_3 %543 = OpVectorShuffle %542 %542 3 0 1 
					                                       f32_4 %544 = OpLoad %82 
					                                       f32_3 %545 = OpVectorShuffle %544 %544 0 1 2 
					                                       f32_3 %546 = OpFMul %543 %545 
					                                       f32_4 %547 = OpLoad %541 
					                                       f32_4 %548 = OpVectorShuffle %547 %546 4 5 6 3 
					                                                      OpStore %541 %548 
					                                       f32_4 %549 = OpLoad %65 
					                                       f32_3 %550 = OpVectorShuffle %549 %549 1 3 0 
					                                       f32_4 %551 = OpLoad %82 
					                                       f32_3 %552 = OpVectorShuffle %551 %551 1 2 0 
					                                       f32_3 %553 = OpFMul %550 %552 
					                                       f32_4 %554 = OpLoad %541 
					                                       f32_3 %555 = OpVectorShuffle %554 %554 0 1 2 
					                                       f32_3 %556 = OpFNegate %555 
					                                       f32_3 %557 = OpFAdd %553 %556 
					                                       f32_4 %558 = OpLoad %541 
					                                       f32_4 %559 = OpVectorShuffle %558 %557 4 5 6 3 
					                                                      OpStore %541 %559 
					                                  Input f32* %560 = OpAccessChain %496 %231 
					                                         f32 %561 = OpLoad %560 
					                                Uniform f32* %563 = OpAccessChain %27 %562 %231 
					                                         f32 %564 = OpLoad %563 
					                                         f32 %565 = OpFMul %561 %564 
					                                                      OpStore %118 %565 
					                                         f32 %566 = OpLoad %118 
					                                       f32_3 %567 = OpCompositeConstruct %566 %566 %566 
					                                       f32_4 %568 = OpLoad %541 
					                                       f32_3 %569 = OpVectorShuffle %568 %568 0 1 2 
					                                       f32_3 %570 = OpFMul %567 %569 
					                                       f32_4 %571 = OpLoad %541 
					                                       f32_4 %572 = OpVectorShuffle %571 %570 4 5 6 3 
					                                                      OpStore %541 %572 
					                                Private f32* %574 = OpAccessChain %541 %120 
					                                         f32 %575 = OpLoad %574 
					                                 Output f32* %576 = OpAccessChain vs_TEXCOORD2 %103 
					                                                      OpStore %576 %575 
					                                Private f32* %577 = OpAccessChain %65 %120 
					                                         f32 %578 = OpLoad %577 
					                                 Output f32* %579 = OpAccessChain vs_TEXCOORD2 %244 
					                                                      OpStore %579 %578 
					                                Private f32* %580 = OpAccessChain %82 %244 
					                                         f32 %581 = OpLoad %580 
					                                 Output f32* %582 = OpAccessChain vs_TEXCOORD2 %120 
					                                                      OpStore %582 %581 
					                                Private f32* %583 = OpAccessChain %40 %120 
					                                         f32 %584 = OpLoad %583 
					                                 Output f32* %585 = OpAccessChain vs_TEXCOORD2 %231 
					                                                      OpStore %585 %584 
					                                Private f32* %587 = OpAccessChain %82 %120 
					                                         f32 %588 = OpLoad %587 
					                                 Output f32* %589 = OpAccessChain vs_TEXCOORD3 %120 
					                                                      OpStore %589 %588 
					                                Private f32* %591 = OpAccessChain %82 %103 
					                                         f32 %592 = OpLoad %591 
					                                 Output f32* %593 = OpAccessChain vs_TEXCOORD4 %120 
					                                                      OpStore %593 %592 
					                                Private f32* %594 = OpAccessChain %65 %103 
					                                         f32 %595 = OpLoad %594 
					                                 Output f32* %596 = OpAccessChain vs_TEXCOORD3 %244 
					                                                      OpStore %596 %595 
					                                Private f32* %597 = OpAccessChain %541 %103 
					                                         f32 %598 = OpLoad %597 
					                                 Output f32* %599 = OpAccessChain vs_TEXCOORD3 %103 
					                                                      OpStore %599 %598 
					                                Private f32* %600 = OpAccessChain %541 %244 
					                                         f32 %601 = OpLoad %600 
					                                 Output f32* %602 = OpAccessChain vs_TEXCOORD4 %103 
					                                                      OpStore %602 %601 
					                                Private f32* %603 = OpAccessChain %40 %103 
					                                         f32 %604 = OpLoad %603 
					                                 Output f32* %605 = OpAccessChain vs_TEXCOORD3 %231 
					                                                      OpStore %605 %604 
					                                Private f32* %606 = OpAccessChain %65 %231 
					                                         f32 %607 = OpLoad %606 
					                                 Output f32* %608 = OpAccessChain vs_TEXCOORD4 %244 
					                                                      OpStore %608 %607 
					                                Private f32* %609 = OpAccessChain %40 %244 
					                                         f32 %610 = OpLoad %609 
					                                 Output f32* %611 = OpAccessChain vs_TEXCOORD4 %231 
					                                                      OpStore %611 %610 
					                                       f32_4 %614 = OpLoad %613 
					                                                      OpStore %612 %614 
					                                       f32_4 %615 = OpLoad %9 
					                                       f32_3 %616 = OpVectorShuffle %615 %615 1 1 1 
					                              Uniform f32_4* %618 = OpAccessChain %27 %617 %44 
					                                       f32_4 %619 = OpLoad %618 
					                                       f32_3 %620 = OpVectorShuffle %619 %619 0 1 2 
					                                       f32_3 %621 = OpFMul %616 %620 
					                                       f32_4 %622 = OpLoad %82 
					                                       f32_4 %623 = OpVectorShuffle %622 %621 4 5 6 3 
					                                                      OpStore %82 %623 
					                              Uniform f32_4* %624 = OpAccessChain %27 %617 %49 
					                                       f32_4 %625 = OpLoad %624 
					                                       f32_3 %626 = OpVectorShuffle %625 %625 0 1 2 
					                                       f32_4 %627 = OpLoad %9 
					                                       f32_3 %628 = OpVectorShuffle %627 %627 0 0 0 
					                                       f32_3 %629 = OpFMul %626 %628 
					                                       f32_4 %630 = OpLoad %82 
					                                       f32_3 %631 = OpVectorShuffle %630 %630 0 1 2 
					                                       f32_3 %632 = OpFAdd %629 %631 
					                                       f32_4 %633 = OpLoad %9 
					                                       f32_4 %634 = OpVectorShuffle %633 %632 4 5 2 6 
					                                                      OpStore %9 %634 
					                              Uniform f32_4* %637 = OpAccessChain %27 %617 %57 
					                                       f32_4 %638 = OpLoad %637 
					                                       f32_3 %639 = OpVectorShuffle %638 %638 0 1 2 
					                                       f32_4 %640 = OpLoad %9 
					                                       f32_3 %641 = OpVectorShuffle %640 %640 2 2 2 
					                                       f32_3 %642 = OpFMul %639 %641 
					                                       f32_4 %643 = OpLoad %9 
					                                       f32_3 %644 = OpVectorShuffle %643 %643 0 1 3 
					                                       f32_3 %645 = OpFAdd %642 %644 
					                                                      OpStore vs_TEXCOORD6 %645 
					                                       f32_4 %646 = OpLoad %40 
					                                       f32_4 %647 = OpVectorShuffle %646 %646 1 1 1 1 
					                                       f32_4 %648 = OpFNegate %647 
					                              Uniform f32_4* %649 = OpAccessChain %27 %67 
					                                       f32_4 %650 = OpLoad %649 
					                                       f32_4 %651 = OpFAdd %648 %650 
					                                                      OpStore %9 %651 
					                                       f32_4 %652 = OpLoad %65 
					                                       f32_4 %653 = OpVectorShuffle %652 %652 1 1 1 1 
					                                       f32_4 %654 = OpLoad %9 
					                                       f32_4 %655 = OpFMul %653 %654 
					                                                      OpStore %82 %655 
					                                       f32_4 %656 = OpLoad %9 
					                                       f32_4 %657 = OpLoad %9 
					                                       f32_4 %658 = OpFMul %656 %657 
					                                                      OpStore %9 %658 
					                                       f32_4 %659 = OpLoad %40 
					                                       f32_4 %660 = OpVectorShuffle %659 %659 0 0 0 0 
					                                       f32_4 %661 = OpFNegate %660 
					                              Uniform f32_4* %662 = OpAccessChain %27 %57 
					                                       f32_4 %663 = OpLoad %662 
					                                       f32_4 %664 = OpFAdd %661 %663 
					                                                      OpStore %541 %664 
					                                       f32_4 %665 = OpLoad %40 
					                                       f32_4 %666 = OpVectorShuffle %665 %665 2 2 2 2 
					                                       f32_4 %667 = OpFNegate %666 
					                              Uniform f32_4* %669 = OpAccessChain %27 %668 
					                                       f32_4 %670 = OpLoad %669 
					                                       f32_4 %671 = OpFAdd %667 %670 
					                                                      OpStore %40 %671 
					                                       f32_4 %672 = OpLoad %541 
					                                       f32_4 %673 = OpLoad %65 
					                                       f32_4 %674 = OpVectorShuffle %673 %673 0 0 0 0 
					                                       f32_4 %675 = OpFMul %672 %674 
					                                       f32_4 %676 = OpLoad %82 
					                                       f32_4 %677 = OpFAdd %675 %676 
					                                                      OpStore %82 %677 
					                                       f32_4 %678 = OpLoad %541 
					                                       f32_4 %679 = OpLoad %541 
					                                       f32_4 %680 = OpFMul %678 %679 
					                                       f32_4 %681 = OpLoad %9 
					                                       f32_4 %682 = OpFAdd %680 %681 
					                                                      OpStore %9 %682 
					                                       f32_4 %683 = OpLoad %40 
					                                       f32_4 %684 = OpLoad %40 
					                                       f32_4 %685 = OpFMul %683 %684 
					                                       f32_4 %686 = OpLoad %9 
					                                       f32_4 %687 = OpFAdd %685 %686 
					                                                      OpStore %9 %687 
					                                       f32_4 %688 = OpLoad %40 
					                                       f32_4 %689 = OpLoad %65 
					                                       f32_4 %690 = OpVectorShuffle %689 %689 3 3 2 3 
					                                       f32_4 %691 = OpFMul %688 %690 
					                                       f32_4 %692 = OpLoad %82 
					                                       f32_4 %693 = OpFAdd %691 %692 
					                                                      OpStore %40 %693 
					                                       f32_4 %694 = OpLoad %9 
					                                       f32_4 %697 = OpExtInst %1 40 %694 %696 
					                                                      OpStore %9 %697 
					                                       f32_4 %698 = OpLoad %9 
					                                       f32_4 %699 = OpExtInst %1 32 %698 
					                                                      OpStore %82 %699 
					                                       f32_4 %700 = OpLoad %9 
					                              Uniform f32_4* %702 = OpAccessChain %27 %701 
					                                       f32_4 %703 = OpLoad %702 
					                                       f32_4 %704 = OpFMul %700 %703 
					                                       f32_4 %706 = OpFAdd %704 %705 
					                                                      OpStore %9 %706 
					                                       f32_4 %707 = OpLoad %9 
					                                       f32_4 %708 = OpFDiv %705 %707 
					                                                      OpStore %9 %708 
					                                       f32_4 %709 = OpLoad %40 
					                                       f32_4 %710 = OpLoad %82 
					                                       f32_4 %711 = OpFMul %709 %710 
					                                                      OpStore %40 %711 
					                                       f32_4 %712 = OpLoad %40 
					                                       f32_4 %714 = OpExtInst %1 40 %712 %713 
					                                                      OpStore %40 %714 
					                                       f32_4 %715 = OpLoad %9 
					                                       f32_4 %716 = OpLoad %40 
					                                       f32_4 %717 = OpFMul %715 %716 
					                                                      OpStore %9 %717 
					                                       f32_4 %718 = OpLoad %9 
					                                       f32_3 %719 = OpVectorShuffle %718 %718 1 1 1 
					                              Uniform f32_4* %721 = OpAccessChain %27 %720 %44 
					                                       f32_4 %722 = OpLoad %721 
					                                       f32_3 %723 = OpVectorShuffle %722 %722 0 1 2 
					                                       f32_3 %724 = OpFMul %719 %723 
					                                       f32_4 %725 = OpLoad %40 
					                                       f32_4 %726 = OpVectorShuffle %725 %724 4 5 6 3 
					                                                      OpStore %40 %726 
					                              Uniform f32_4* %727 = OpAccessChain %27 %720 %49 
					                                       f32_4 %728 = OpLoad %727 
					                                       f32_3 %729 = OpVectorShuffle %728 %728 0 1 2 
					                                       f32_4 %730 = OpLoad %9 
					                                       f32_3 %731 = OpVectorShuffle %730 %730 0 0 0 
					                                       f32_3 %732 = OpFMul %729 %731 
					                                       f32_4 %733 = OpLoad %40 
					                                       f32_3 %734 = OpVectorShuffle %733 %733 0 1 2 
					                                       f32_3 %735 = OpFAdd %732 %734 
					                                       f32_4 %736 = OpLoad %40 
					                                       f32_4 %737 = OpVectorShuffle %736 %735 4 5 6 3 
					                                                      OpStore %40 %737 
					                              Uniform f32_4* %738 = OpAccessChain %27 %720 %57 
					                                       f32_4 %739 = OpLoad %738 
					                                       f32_3 %740 = OpVectorShuffle %739 %739 0 1 2 
					                                       f32_4 %741 = OpLoad %9 
					                                       f32_3 %742 = OpVectorShuffle %741 %741 2 2 2 
					                                       f32_3 %743 = OpFMul %740 %742 
					                                       f32_4 %744 = OpLoad %40 
					                                       f32_3 %745 = OpVectorShuffle %744 %744 0 1 2 
					                                       f32_3 %746 = OpFAdd %743 %745 
					                                       f32_4 %747 = OpLoad %9 
					                                       f32_4 %748 = OpVectorShuffle %747 %746 4 5 6 3 
					                                                      OpStore %9 %748 
					                              Uniform f32_4* %749 = OpAccessChain %27 %720 %67 
					                                       f32_4 %750 = OpLoad %749 
					                                       f32_3 %751 = OpVectorShuffle %750 %750 0 1 2 
					                                       f32_4 %752 = OpLoad %9 
					                                       f32_3 %753 = OpVectorShuffle %752 %752 3 3 3 
					                                       f32_3 %754 = OpFMul %751 %753 
					                                       f32_4 %755 = OpLoad %9 
					                                       f32_3 %756 = OpVectorShuffle %755 %755 0 1 2 
					                                       f32_3 %757 = OpFAdd %754 %756 
					                                       f32_4 %758 = OpLoad %9 
					                                       f32_4 %759 = OpVectorShuffle %758 %757 4 5 6 3 
					                                                      OpStore %9 %759 
					                                Private f32* %762 = OpAccessChain %65 %103 
					                                         f32 %763 = OpLoad %762 
					                                Private f32* %764 = OpAccessChain %65 %103 
					                                         f32 %765 = OpLoad %764 
					                                         f32 %766 = OpFMul %763 %765 
					                                Private f32* %767 = OpAccessChain %761 %120 
					                                                      OpStore %767 %766 
					                                Private f32* %768 = OpAccessChain %65 %120 
					                                         f32 %769 = OpLoad %768 
					                                Private f32* %770 = OpAccessChain %65 %120 
					                                         f32 %771 = OpLoad %770 
					                                         f32 %772 = OpFMul %769 %771 
					                                Private f32* %773 = OpAccessChain %761 %120 
					                                         f32 %774 = OpLoad %773 
					                                         f32 %775 = OpFNegate %774 
					                                         f32 %776 = OpFAdd %772 %775 
					                                Private f32* %777 = OpAccessChain %761 %120 
					                                                      OpStore %777 %776 
					                                       f32_4 %779 = OpLoad %65 
					                                       f32_4 %780 = OpVectorShuffle %779 %779 1 3 2 0 
					                                       f32_4 %781 = OpLoad %65 
					                                       f32_4 %782 = OpFMul %780 %781 
					                                                      OpStore %778 %782 
					                              Uniform f32_4* %785 = OpAccessChain %27 %784 
					                                       f32_4 %786 = OpLoad %785 
					                                       f32_4 %787 = OpLoad %778 
					                                         f32 %788 = OpDot %786 %787 
					                                Private f32* %789 = OpAccessChain %783 %120 
					                                                      OpStore %789 %788 
					                              Uniform f32_4* %791 = OpAccessChain %27 %790 
					                                       f32_4 %792 = OpLoad %791 
					                                       f32_4 %793 = OpLoad %778 
					                                         f32 %794 = OpDot %792 %793 
					                                Private f32* %795 = OpAccessChain %783 %103 
					                                                      OpStore %795 %794 
					                              Uniform f32_4* %797 = OpAccessChain %27 %796 
					                                       f32_4 %798 = OpLoad %797 
					                                       f32_4 %799 = OpLoad %778 
					                                         f32 %800 = OpDot %798 %799 
					                                Private f32* %801 = OpAccessChain %783 %244 
					                                                      OpStore %801 %800 
					                              Uniform f32_4* %803 = OpAccessChain %27 %802 
					                                       f32_4 %804 = OpLoad %803 
					                                       f32_3 %805 = OpVectorShuffle %804 %804 0 1 2 
					                                       f32_3 %806 = OpLoad %761 
					                                       f32_3 %807 = OpVectorShuffle %806 %806 0 0 0 
					                                       f32_3 %808 = OpFMul %805 %807 
					                                       f32_3 %809 = OpLoad %783 
					                                       f32_3 %810 = OpFAdd %808 %809 
					                                                      OpStore %761 %810 
					                                       f32_4 %812 = OpLoad %9 
					                                       f32_3 %813 = OpVectorShuffle %812 %812 0 1 2 
					                                       f32_3 %814 = OpLoad %761 
					                                       f32_3 %815 = OpFAdd %813 %814 
					                                                      OpStore vs_TEXCOORD7 %815 
					                                 Output f32* %816 = OpAccessChain %107 %49 %103 
					                                         f32 %817 = OpLoad %816 
					                                         f32 %818 = OpFNegate %817 
					                                 Output f32* %819 = OpAccessChain %107 %49 %103 
					                                                      OpStore %819 %818 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 389
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %21 %43 %121 %144 %298 %304 %309 %313 %359 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
					                                                      OpName vs_TEXCOORD7 "vs_TEXCOORD7" 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %12 RelaxedPrecision 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %16 RelaxedPrecision 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %17 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 21 
					                                                      OpDecorate %28 RelaxedPrecision 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %35 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD5 Location 43 
					                                                      OpMemberDecorate %59 0 Offset 59 
					                                                      OpMemberDecorate %59 1 RelaxedPrecision 
					                                                      OpMemberDecorate %59 1 Offset 59 
					                                                      OpMemberDecorate %59 2 RelaxedPrecision 
					                                                      OpMemberDecorate %59 2 Offset 59 
					                                                      OpMemberDecorate %59 3 RelaxedPrecision 
					                                                      OpMemberDecorate %59 3 Offset 59 
					                                                      OpMemberDecorate %59 4 RelaxedPrecision 
					                                                      OpMemberDecorate %59 4 Offset 59 
					                                                      OpMemberDecorate %59 5 RelaxedPrecision 
					                                                      OpMemberDecorate %59 5 Offset 59 
					                                                      OpMemberDecorate %59 6 Offset 59 
					                                                      OpMemberDecorate %59 7 Offset 59 
					                                                      OpMemberDecorate %59 8 RelaxedPrecision 
					                                                      OpMemberDecorate %59 8 Offset 59 
					                                                      OpMemberDecorate %59 9 Offset 59 
					                                                      OpMemberDecorate %59 10 Offset 59 
					                                                      OpMemberDecorate %59 11 Offset 59 
					                                                      OpMemberDecorate %59 12 RelaxedPrecision 
					                                                      OpMemberDecorate %59 12 Offset 59 
					                                                      OpMemberDecorate %59 13 Offset 59 
					                                                      OpMemberDecorate %59 14 Offset 59 
					                                                      OpDecorate %59 Block 
					                                                      OpDecorate %61 DescriptorSet 61 
					                                                      OpDecorate %61 Binding 61 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 121 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %126 DescriptorSet 126 
					                                                      OpDecorate %126 Binding 126 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %128 DescriptorSet 128 
					                                                      OpDecorate %128 Binding 128 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %144 Location 144 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %174 DescriptorSet 174 
					                                                      OpDecorate %174 Binding 174 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %176 DescriptorSet 176 
					                                                      OpDecorate %176 Binding 176 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %239 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %298 Location 298 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 304 
					                                                      OpDecorate vs_TEXCOORD3 Location 309 
					                                                      OpDecorate vs_TEXCOORD4 Location 313 
					                                                      OpDecorate %333 RelaxedPrecision 
					                                                      OpDecorate %334 RelaxedPrecision 
					                                                      OpDecorate %340 RelaxedPrecision 
					                                                      OpDecorate %346 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %357 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD7 Location 359 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %361 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %366 RelaxedPrecision 
					                                                      OpDecorate %367 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %369 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %371 RelaxedPrecision 
					                                                      OpDecorate %374 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %376 RelaxedPrecision 
					                                                      OpDecorate %379 RelaxedPrecision 
					                                                      OpDecorate %380 RelaxedPrecision 
					                                                      OpDecorate %381 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %383 RelaxedPrecision 
					                                                      OpDecorate %384 RelaxedPrecision 
					                                                      OpDecorate %385 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %11 = OpTypePointer UniformConstant %10 
					         UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                              %14 = OpTypeSampler 
					                                              %15 = OpTypePointer UniformConstant %14 
					                     UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                              %18 = OpTypeSampledImage %10 
					                                              %20 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                              %22 = OpTypeVector %6 2 
					                                              %26 = OpTypeInt 32 0 
					                                          u32 %27 = OpConstant 3 
					                                          u32 %29 = OpConstant 0 
					                                              %30 = OpTypePointer Private %6 
					                               Private f32_4* %32 = OpVariable Private 
					                                          f32 %36 = OpConstant 3,674022E-40 
					                               Private f32_4* %39 = OpVariable Private 
					                                              %42 = OpTypePointer Input %22 
					                        Input f32_2* vs_TEXCOORD5 = OpVariable Input 
					                                              %44 = OpTypePointer Input %6 
					                                          u32 %52 = OpConstant 1 
					                                 Private f32* %58 = OpVariable Private 
					                                              %59 = OpTypeStruct %7 %7 %7 %7 %7 %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 
					                                              %60 = OpTypePointer Uniform %59 
					Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32;}* %61 = OpVariable Uniform 
					                                              %62 = OpTypeInt 32 1 
					                                          i32 %63 = OpConstant 13 
					                                              %64 = OpTypePointer Uniform %6 
					                                          i32 %67 = OpConstant 14 
					                               Private f32_4* %75 = OpVariable Private 
					                                          f32 %84 = OpConstant 3,674022E-40 
					                                          f32 %85 = OpConstant 3,674022E-40 
					                                              %88 = OpTypeVector %6 3 
					                                              %89 = OpTypePointer Private %88 
					                               Private f32_3* %90 = OpVariable Private 
					                                 Private f32* %98 = OpVariable Private 
					                                         i32 %108 = OpConstant 10 
					                                         i32 %111 = OpConstant 11 
					                                         i32 %115 = OpConstant 0 
					                                             %116 = OpTypePointer Uniform %7 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					        UniformConstant read_only Texture2D* %126 = OpVariable UniformConstant 
					                    UniformConstant sampler* %128 = OpVariable UniformConstant 
					                                         i32 %136 = OpConstant 12 
					                              Private f32_4* %143 = OpVariable Private 
					                                Input f32_4* %144 = OpVariable Input 
					                                Private f32* %151 = OpVariable Private 
					                                             %157 = OpTypePointer Private %22 
					                              Private f32_2* %158 = OpVariable Private 
					                                         i32 %159 = OpConstant 6 
					                                         i32 %162 = OpConstant 7 
					                              Private f32_4* %173 = OpVariable Private 
					        UniformConstant read_only Texture2D* %174 = OpVariable UniformConstant 
					                    UniformConstant sampler* %176 = OpVariable UniformConstant 
					                              Private f32_4* %181 = OpVariable Private 
					                                         i32 %183 = OpConstant 8 
					                              Private f32_4* %187 = OpVariable Private 
					                              Private f32_4* %191 = OpVariable Private 
					                                Private f32* %243 = OpVariable Private 
					                                         i32 %244 = OpConstant 9 
					                                Private f32* %250 = OpVariable Private 
					                              Private f32_3* %286 = OpVariable Private 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %297 = OpTypePointer Output %7 
					                               Output f32_4* %298 = OpVariable Output 
					                                             %301 = OpTypePointer Output %6 
					                              Private f32_3* %303 = OpVariable Private 
					                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
					                                         u32 %305 = OpConstant 2 
					                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
					                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
					                                Private f32* %317 = OpVariable Private 
					                                         i32 %331 = OpConstant 1 
					                                         i32 %338 = OpConstant 2 
					                                         i32 %344 = OpConstant 3 
					                                         i32 %350 = OpConstant 4 
					                                             %358 = OpTypePointer Input %88 
					                        Input f32_3* vs_TEXCOORD7 = OpVariable Input 
					                                       f32_4 %365 = OpConstantComposite %84 %84 %84 %84 
					                                         i32 %372 = OpConstant 5 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                          read_only Texture2D %13 = OpLoad %12 
					                                      sampler %17 = OpLoad %16 
					                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                        f32_4 %23 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %24 = OpVectorShuffle %23 %23 0 1 
					                                        f32_4 %25 = OpImageSampleImplicitLod %19 %24 
					                                          f32 %28 = OpCompositeExtract %25 3 
					                                 Private f32* %31 = OpAccessChain %9 %29 
					                                                      OpStore %31 %28 
					                                 Private f32* %33 = OpAccessChain %9 %29 
					                                          f32 %34 = OpLoad %33 
					                                          f32 %35 = OpFNegate %34 
					                                          f32 %37 = OpFAdd %35 %36 
					                                 Private f32* %38 = OpAccessChain %32 %29 
					                                                      OpStore %38 %37 
					                                 Private f32* %40 = OpAccessChain %32 %29 
					                                          f32 %41 = OpLoad %40 
					                                   Input f32* %45 = OpAccessChain vs_TEXCOORD5 %29 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %47 = OpFNegate %46 
					                                          f32 %48 = OpFAdd %41 %47 
					                                 Private f32* %49 = OpAccessChain %39 %29 
					                                                      OpStore %49 %48 
					                                 Private f32* %50 = OpAccessChain %39 %29 
					                                          f32 %51 = OpLoad %50 
					                                   Input f32* %53 = OpAccessChain vs_TEXCOORD5 %52 
					                                          f32 %54 = OpLoad %53 
					                                          f32 %55 = OpFMul %51 %54 
					                                          f32 %56 = OpFAdd %55 %36 
					                                 Private f32* %57 = OpAccessChain %39 %29 
					                                                      OpStore %57 %56 
					                                 Uniform f32* %65 = OpAccessChain %61 %63 
					                                          f32 %66 = OpLoad %65 
					                                 Uniform f32* %68 = OpAccessChain %61 %67 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpFMul %66 %69 
					                                                      OpStore %58 %70 
					                                          f32 %71 = OpLoad %58 
					                                   Input f32* %72 = OpAccessChain vs_TEXCOORD5 %52 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpFMul %71 %73 
					                                                      OpStore %58 %74 
					                                          f32 %76 = OpLoad %58 
					                                          f32 %77 = OpFMul %76 %36 
					                                 Private f32* %78 = OpAccessChain %39 %29 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFAdd %77 %79 
					                                 Private f32* %81 = OpAccessChain %75 %29 
					                                                      OpStore %81 %80 
					                                 Private f32* %82 = OpAccessChain %75 %29 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %86 = OpExtInst %1 43 %83 %84 %85 
					                                 Private f32* %87 = OpAccessChain %75 %29 
					                                                      OpStore %87 %86 
					                                          f32 %91 = OpLoad %58 
					                                          f32 %92 = OpFNegate %91 
					                                          f32 %93 = OpFMul %92 %36 
					                                 Private f32* %94 = OpAccessChain %39 %29 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFAdd %93 %95 
					                                 Private f32* %97 = OpAccessChain %90 %29 
					                                                      OpStore %97 %96 
					                                          f32 %99 = OpLoad %58 
					                                         f32 %100 = OpExtInst %1 37 %99 %85 
					                                                      OpStore %98 %100 
					                                         f32 %101 = OpLoad %98 
					                                         f32 %102 = OpExtInst %1 31 %101 
					                                                      OpStore %98 %102 
					                                         f32 %103 = OpLoad %98 
					                                Private f32* %104 = OpAccessChain %75 %29 
					                                         f32 %105 = OpLoad %104 
					                                         f32 %106 = OpFMul %103 %105 
					                                Private f32* %107 = OpAccessChain %75 %29 
					                                                      OpStore %107 %106 
					                                Uniform f32* %109 = OpAccessChain %61 %108 
					                                         f32 %110 = OpLoad %109 
					                                Uniform f32* %112 = OpAccessChain %61 %111 
					                                         f32 %113 = OpLoad %112 
					                                       f32_2 %114 = OpCompositeConstruct %110 %113 
					                              Uniform f32_4* %117 = OpAccessChain %61 %115 
					                                       f32_4 %118 = OpLoad %117 
					                                       f32_2 %119 = OpVectorShuffle %118 %118 1 1 
					                                       f32_2 %120 = OpFMul %114 %119 
					                                       f32_2 %122 = OpLoad vs_TEXCOORD1 
					                                       f32_2 %123 = OpFAdd %120 %122 
					                                       f32_4 %124 = OpLoad %39 
					                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 2 3 
					                                                      OpStore %39 %125 
					                         read_only Texture2D %127 = OpLoad %126 
					                                     sampler %129 = OpLoad %128 
					                  read_only Texture2DSampled %130 = OpSampledImage %127 %129 
					                                       f32_4 %131 = OpLoad %39 
					                                       f32_2 %132 = OpVectorShuffle %131 %131 0 1 
					                                       f32_4 %133 = OpImageSampleImplicitLod %130 %132 
					                                                      OpStore %9 %133 
					                                       f32_4 %134 = OpLoad %9 
					                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
					                              Uniform f32_4* %137 = OpAccessChain %61 %136 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
					                                       f32_3 %140 = OpFMul %135 %139 
					                                       f32_4 %141 = OpLoad %32 
					                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
					                                                      OpStore %32 %142 
					                                  Input f32* %145 = OpAccessChain %144 %27 
					                                         f32 %146 = OpLoad %145 
					                                Uniform f32* %147 = OpAccessChain %61 %136 %27 
					                                         f32 %148 = OpLoad %147 
					                                         f32 %149 = OpFMul %146 %148 
					                                Private f32* %150 = OpAccessChain %143 %29 
					                                                      OpStore %150 %149 
					                                Private f32* %152 = OpAccessChain %9 %27 
					                                         f32 %153 = OpLoad %152 
					                                Private f32* %154 = OpAccessChain %143 %29 
					                                         f32 %155 = OpLoad %154 
					                                         f32 %156 = OpFMul %153 %155 
					                                                      OpStore %151 %156 
					                                Uniform f32* %160 = OpAccessChain %61 %159 
					                                         f32 %161 = OpLoad %160 
					                                Uniform f32* %163 = OpAccessChain %61 %162 
					                                         f32 %164 = OpLoad %163 
					                                       f32_2 %165 = OpCompositeConstruct %161 %164 
					                              Uniform f32_4* %166 = OpAccessChain %61 %115 
					                                       f32_4 %167 = OpLoad %166 
					                                       f32_2 %168 = OpVectorShuffle %167 %167 1 1 
					                                       f32_2 %169 = OpFMul %165 %168 
					                                       f32_4 %170 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %171 = OpVectorShuffle %170 %170 2 3 
					                                       f32_2 %172 = OpFAdd %169 %171 
					                                                      OpStore %158 %172 
					                         read_only Texture2D %175 = OpLoad %174 
					                                     sampler %177 = OpLoad %176 
					                  read_only Texture2DSampled %178 = OpSampledImage %175 %177 
					                                       f32_2 %179 = OpLoad %158 
					                                       f32_4 %180 = OpImageSampleImplicitLod %178 %179 
					                                                      OpStore %173 %180 
					                                       f32_4 %182 = OpLoad %144 
					                              Uniform f32_4* %184 = OpAccessChain %61 %183 
					                                       f32_4 %185 = OpLoad %184 
					                                       f32_4 %186 = OpFMul %182 %185 
					                                                      OpStore %181 %186 
					                                       f32_4 %188 = OpLoad %173 
					                                       f32_4 %189 = OpLoad %181 
					                                       f32_4 %190 = OpFMul %188 %189 
					                                                      OpStore %187 %190 
					                                       f32_4 %192 = OpLoad %187 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
					                                       f32_4 %194 = OpLoad %187 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                       f32_3 %196 = OpFMul %193 %195 
					                                       f32_4 %197 = OpLoad %191 
					                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
					                                                      OpStore %191 %198 
					                                       f32_4 %199 = OpLoad %32 
					                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
					                                         f32 %201 = OpLoad %151 
					                                       f32_3 %202 = OpCompositeConstruct %201 %201 %201 
					                                       f32_3 %203 = OpFMul %200 %202 
					                                       f32_4 %204 = OpLoad %191 
					                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
					                                       f32_3 %206 = OpFNegate %205 
					                                       f32_3 %207 = OpFAdd %203 %206 
					                                       f32_4 %208 = OpLoad %191 
					                                       f32_4 %209 = OpVectorShuffle %208 %207 4 5 6 3 
					                                                      OpStore %191 %209 
					                                Private f32* %210 = OpAccessChain %143 %29 
					                                         f32 %211 = OpLoad %210 
					                                Private f32* %212 = OpAccessChain %9 %27 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpFMul %211 %213 
					                                Private f32* %215 = OpAccessChain %187 %27 
					                                         f32 %216 = OpLoad %215 
					                                         f32 %217 = OpFNegate %216 
					                                         f32 %218 = OpFAdd %214 %217 
					                                Private f32* %219 = OpAccessChain %191 %27 
					                                                      OpStore %219 %218 
					                                       f32_4 %220 = OpLoad %75 
					                                       f32_4 %221 = OpVectorShuffle %220 %220 0 0 0 0 
					                                       f32_4 %222 = OpLoad %191 
					                                       f32_4 %223 = OpFMul %221 %222 
					                                                      OpStore %32 %223 
					                                Private f32* %224 = OpAccessChain %181 %27 
					                                         f32 %225 = OpLoad %224 
					                                Private f32* %226 = OpAccessChain %173 %27 
					                                         f32 %227 = OpLoad %226 
					                                         f32 %228 = OpFMul %225 %227 
					                                Private f32* %229 = OpAccessChain %32 %27 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFAdd %228 %230 
					                                Private f32* %232 = OpAccessChain %143 %27 
					                                                      OpStore %232 %231 
					                                       f32_4 %233 = OpLoad %187 
					                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
					                                       f32_4 %235 = OpLoad %187 
					                                       f32_3 %236 = OpVectorShuffle %235 %235 3 3 3 
					                                       f32_3 %237 = OpFMul %234 %236 
					                                       f32_4 %238 = OpLoad %32 
					                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
					                                       f32_3 %240 = OpFAdd %237 %239 
					                                       f32_4 %241 = OpLoad %143 
					                                       f32_4 %242 = OpVectorShuffle %241 %240 4 5 6 3 
					                                                      OpStore %143 %242 
					                                Uniform f32* %245 = OpAccessChain %61 %244 
					                                         f32 %246 = OpLoad %245 
					                                Uniform f32* %247 = OpAccessChain %61 %67 
					                                         f32 %248 = OpLoad %247 
					                                         f32 %249 = OpFMul %246 %248 
					                                                      OpStore %243 %249 
					                                         f32 %251 = OpLoad %243 
					                                  Input f32* %252 = OpAccessChain vs_TEXCOORD5 %52 
					                                         f32 %253 = OpLoad %252 
					                                         f32 %254 = OpFMul %251 %253 
					                                                      OpStore %250 %254 
					                                         f32 %255 = OpLoad %243 
					                                  Input f32* %256 = OpAccessChain vs_TEXCOORD5 %52 
					                                         f32 %257 = OpLoad %256 
					                                         f32 %258 = OpFMul %255 %257 
					                                         f32 %259 = OpFAdd %258 %85 
					                                Private f32* %260 = OpAccessChain %75 %29 
					                                                      OpStore %260 %259 
					                                         f32 %261 = OpLoad %250 
					                                         f32 %262 = OpFMul %261 %36 
					                                Private f32* %263 = OpAccessChain %90 %29 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %265 = OpFAdd %262 %264 
					                                Private f32* %266 = OpAccessChain %90 %29 
					                                                      OpStore %266 %265 
					                                Private f32* %267 = OpAccessChain %90 %29 
					                                         f32 %268 = OpLoad %267 
					                                Private f32* %269 = OpAccessChain %75 %29 
					                                         f32 %270 = OpLoad %269 
					                                         f32 %271 = OpFDiv %268 %270 
					                                Private f32* %272 = OpAccessChain %75 %29 
					                                                      OpStore %272 %271 
					                                Private f32* %273 = OpAccessChain %75 %29 
					                                         f32 %274 = OpLoad %273 
					                                         f32 %275 = OpExtInst %1 43 %274 %84 %85 
					                                Private f32* %276 = OpAccessChain %75 %29 
					                                                      OpStore %276 %275 
					                                Private f32* %277 = OpAccessChain %75 %29 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFNegate %278 
					                                         f32 %280 = OpFAdd %279 %85 
					                                Private f32* %281 = OpAccessChain %75 %29 
					                                                      OpStore %281 %280 
					                                       f32_4 %282 = OpLoad %75 
					                                       f32_4 %283 = OpVectorShuffle %282 %282 0 0 0 0 
					                                       f32_4 %284 = OpLoad %143 
					                                       f32_4 %285 = OpFMul %283 %284 
					                                                      OpStore %32 %285 
					                                Private f32* %287 = OpAccessChain %32 %27 
					                                         f32 %288 = OpLoad %287 
					                                         f32 %290 = OpExtInst %1 40 %288 %289 
					                                Private f32* %291 = OpAccessChain %286 %29 
					                                                      OpStore %291 %290 
					                                       f32_4 %292 = OpLoad %32 
					                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
					                                       f32_3 %294 = OpLoad %286 
					                                       f32_3 %295 = OpVectorShuffle %294 %294 0 0 0 
					                                       f32_3 %296 = OpFDiv %293 %295 
					                                                      OpStore %286 %296 
					                                Private f32* %299 = OpAccessChain %32 %27 
					                                         f32 %300 = OpLoad %299 
					                                 Output f32* %302 = OpAccessChain %298 %27 
					                                                      OpStore %302 %300 
					                                  Input f32* %306 = OpAccessChain vs_TEXCOORD2 %305 
					                                         f32 %307 = OpLoad %306 
					                                Private f32* %308 = OpAccessChain %303 %29 
					                                                      OpStore %308 %307 
					                                  Input f32* %310 = OpAccessChain vs_TEXCOORD3 %305 
					                                         f32 %311 = OpLoad %310 
					                                Private f32* %312 = OpAccessChain %303 %52 
					                                                      OpStore %312 %311 
					                                  Input f32* %314 = OpAccessChain vs_TEXCOORD4 %305 
					                                         f32 %315 = OpLoad %314 
					                                Private f32* %316 = OpAccessChain %303 %305 
					                                                      OpStore %316 %315 
					                                       f32_3 %318 = OpLoad %303 
					                                       f32_3 %319 = OpLoad %303 
					                                         f32 %320 = OpDot %318 %319 
					                                                      OpStore %317 %320 
					                                         f32 %321 = OpLoad %317 
					                                         f32 %322 = OpExtInst %1 32 %321 
					                                                      OpStore %317 %322 
					                                         f32 %323 = OpLoad %317 
					                                       f32_3 %324 = OpCompositeConstruct %323 %323 %323 
					                                       f32_3 %325 = OpLoad %303 
					                                       f32_3 %326 = OpFMul %324 %325 
					                                       f32_4 %327 = OpLoad %39 
					                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 6 3 
					                                                      OpStore %39 %328 
					                                       f32_4 %329 = OpLoad %39 
					                                       f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
					                              Uniform f32_4* %332 = OpAccessChain %61 %331 
					                                       f32_4 %333 = OpLoad %332 
					                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
					                                         f32 %335 = OpDot %330 %334 
					                                Private f32* %336 = OpAccessChain %75 %29 
					                                                      OpStore %336 %335 
					                                Private f32* %337 = OpAccessChain %39 %27 
					                                                      OpStore %337 %85 
					                              Uniform f32_4* %339 = OpAccessChain %61 %338 
					                                       f32_4 %340 = OpLoad %339 
					                                       f32_4 %341 = OpLoad %39 
					                                         f32 %342 = OpDot %340 %341 
					                                Private f32* %343 = OpAccessChain %191 %29 
					                                                      OpStore %343 %342 
					                              Uniform f32_4* %345 = OpAccessChain %61 %344 
					                                       f32_4 %346 = OpLoad %345 
					                                       f32_4 %347 = OpLoad %39 
					                                         f32 %348 = OpDot %346 %347 
					                                Private f32* %349 = OpAccessChain %191 %52 
					                                                      OpStore %349 %348 
					                              Uniform f32_4* %351 = OpAccessChain %61 %350 
					                                       f32_4 %352 = OpLoad %351 
					                                       f32_4 %353 = OpLoad %39 
					                                         f32 %354 = OpDot %352 %353 
					                                Private f32* %355 = OpAccessChain %191 %305 
					                                                      OpStore %355 %354 
					                                       f32_4 %356 = OpLoad %191 
					                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
					                                       f32_3 %360 = OpLoad vs_TEXCOORD7 
					                                       f32_3 %361 = OpFAdd %357 %360 
					                                       f32_4 %362 = OpLoad %75 
					                                       f32_4 %363 = OpVectorShuffle %362 %361 0 4 5 6 
					                                                      OpStore %75 %363 
					                                       f32_4 %364 = OpLoad %75 
					                                       f32_4 %366 = OpExtInst %1 40 %364 %365 
					                                                      OpStore %75 %366 
					                                       f32_4 %367 = OpLoad %75 
					                                       f32_3 %368 = OpVectorShuffle %367 %367 1 2 3 
					                                       f32_3 %369 = OpLoad %286 
					                                       f32_3 %370 = OpFMul %368 %369 
					                                                      OpStore %90 %370 
					                                       f32_3 %371 = OpLoad %286 
					                              Uniform f32_4* %373 = OpAccessChain %61 %372 
					                                       f32_4 %374 = OpLoad %373 
					                                       f32_3 %375 = OpVectorShuffle %374 %374 0 1 2 
					                                       f32_3 %376 = OpFMul %371 %375 
					                                       f32_4 %377 = OpLoad %191 
					                                       f32_4 %378 = OpVectorShuffle %377 %376 4 5 6 3 
					                                                      OpStore %191 %378 
					                                       f32_4 %379 = OpLoad %191 
					                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
					                                       f32_4 %381 = OpLoad %75 
					                                       f32_3 %382 = OpVectorShuffle %381 %381 0 0 0 
					                                       f32_3 %383 = OpFMul %380 %382 
					                                       f32_3 %384 = OpLoad %90 
					                                       f32_3 %385 = OpFAdd %383 %384 
					                                       f32_4 %386 = OpLoad %298 
					                                       f32_4 %387 = OpVectorShuffle %386 %385 4 5 6 3 
					                                                      OpStore %298 %387 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						float _FaceUVSpeedX;
						float _FaceUVSpeedY;
						vec4 _FaceColor;
						float _OutlineSoftness;
						float _OutlineUVSpeedX;
						float _OutlineUVSpeedY;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_11[15];
						float _ScaleRatioA;
						vec4 unused_0_13[10];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_2_5[6];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FaceTex;
					uniform  sampler2D _OutlineTex;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat5;
					float u_xlat6;
					float u_xlat10;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
					    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
					    u_xlat1.x = vs_COLOR0.w * _OutlineColor.w;
					    u_xlat1.w = u_xlat10_0.w * u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.www;
					    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
					    u_xlat10_0 = texture(_FaceTex, u_xlat0.xy);
					    u_xlat2 = vs_COLOR0 * _FaceColor;
					    u_xlat0 = u_xlat10_0 * u_xlat2;
					    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2 = (-u_xlat10_2.w) + 0.5;
					    u_xlat2.x = u_xlat16_2 + (-vs_TEXCOORD5.x);
					    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y + 0.5;
					    u_xlat6 = _OutlineWidth * _ScaleRatioA;
					    u_xlat6 = u_xlat6 * vs_TEXCOORD5.y;
					    u_xlat10 = u_xlat6 * 0.5 + u_xlat2.x;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat6) * 0.5 + u_xlat2.x;
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat0 = vec4(u_xlat6) * u_xlat1 + u_xlat0;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat5 = u_xlat1.x * vs_TEXCOORD5.y;
					    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
					    u_xlat5 = u_xlat5 * 0.5 + u_xlat2.x;
					    u_xlat1.x = u_xlat5 / u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.x = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xxx;
					    SV_Target0.w = u_xlat0.w;
					    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat2.x = vs_TEXCOORD2.z;
					    u_xlat2.y = vs_TEXCOORD3.z;
					    u_xlat2.z = vs_TEXCOORD4.z;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat2);
					    u_xlat3.y = dot(unity_SHAg, u_xlat2);
					    u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    u_xlat12 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD7.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "DIRECTIONAL" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "DIRECTIONAL" }
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _LightColor0;
						vec4 unused_0_2;
						float _FaceUVSpeedX;
						float _FaceUVSpeedY;
						vec4 _FaceColor;
						float _OutlineSoftness;
						float _OutlineUVSpeedX;
						float _OutlineUVSpeedY;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_11[15];
						float _ScaleRatioA;
						vec4 unused_0_13[10];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_2_5[6];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FaceTex;
					uniform  sampler2D _OutlineTex;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD5;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat5;
					float u_xlat6;
					float u_xlat10;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
					    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
					    u_xlat1.x = vs_COLOR0.w * _OutlineColor.w;
					    u_xlat1.w = u_xlat10_0.w * u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.www;
					    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
					    u_xlat10_0 = texture(_FaceTex, u_xlat0.xy);
					    u_xlat2 = vs_COLOR0 * _FaceColor;
					    u_xlat0 = u_xlat10_0 * u_xlat2;
					    u_xlat0.xyz = u_xlat0.www * u_xlat0.xyz;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_2 = (-u_xlat10_2.w) + 0.5;
					    u_xlat2.x = u_xlat16_2 + (-vs_TEXCOORD5.x);
					    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y + 0.5;
					    u_xlat6 = _OutlineWidth * _ScaleRatioA;
					    u_xlat6 = u_xlat6 * vs_TEXCOORD5.y;
					    u_xlat10 = u_xlat6 * 0.5 + u_xlat2.x;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat6) * 0.5 + u_xlat2.x;
					    u_xlat6 = min(u_xlat6, 1.0);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat0 = vec4(u_xlat6) * u_xlat1 + u_xlat0;
					    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
					    u_xlat5 = u_xlat1.x * vs_TEXCOORD5.y;
					    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
					    u_xlat5 = u_xlat5 * 0.5 + u_xlat2.x;
					    u_xlat1.x = u_xlat5 / u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat1.x = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xxx;
					    SV_Target0.w = u_xlat0.w;
					    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat2.x = vs_TEXCOORD2.z;
					    u_xlat2.y = vs_TEXCOORD3.z;
					    u_xlat2.z = vs_TEXCOORD4.z;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat2);
					    u_xlat3.y = dot(unity_SHAg, u_xlat2);
					    u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    u_xlat12 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD7.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!vulkan"
				}
			}
		}
		Pass {
			Name "Caster"
			LOD 300
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			ColorMask RGB -1
			Cull Off
			Offset 1, 1
			Fog {
				Mode Off
			}
			GpuProgramID 74246
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 _OutlineTex_ST;
						float _OutlineWidth;
						float _FaceDilate;
						float _ScaleRatioA;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[5];
						vec4 unity_LightShadowBias;
						vec4 unused_1_2[20];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD3;
					out float vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					    u_xlat1.x = min(u_xlat1.x, 0.0);
					    u_xlat1.x = max(u_xlat1.x, -1.0);
					    u_xlat4 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = min(u_xlat0.w, u_xlat4);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
					    vs_TEXCOORD2 = u_xlat0.x * 0.5;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "SHADOWS_DEPTH" }
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
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _OutlineTex_ST;
					uniform 	float _OutlineWidth;
					uniform 	float _FaceDilate;
					uniform 	float _ScaleRatioA;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD3;
					out float vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat4 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
					    vs_TEXCOORD2 = u_xlat0.x * 0.5;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#ifdef GL_ARB_shader_bit_encoding
					#extension GL_ARB_shader_bit_encoding : enable
					#endif
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat10_0.w + (-vs_TEXCOORD2);
					    u_xlatb0 = u_xlat0<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "SHADOWS_DEPTH" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 192
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %111 %136 %137 %148 %182 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpMemberDecorate %18 4 Offset 18 
					                                                      OpMemberDecorate %18 5 Offset 18 
					                                                      OpMemberDecorate %18 6 Offset 18 
					                                                      OpMemberDecorate %18 7 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %109 0 BuiltIn 109 
					                                                      OpMemberDecorate %109 1 BuiltIn 109 
					                                                      OpMemberDecorate %109 2 BuiltIn 109 
					                                                      OpDecorate %109 Block 
					                                                      OpDecorate vs_TEXCOORD1 Location 136 
					                                                      OpDecorate %137 Location 137 
					                                                      OpDecorate vs_TEXCOORD3 Location 148 
					                                                      OpDecorate vs_TEXCOORD2 Location 182 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                                 Input f32_4* %11 = OpVariable Input 
					                                              %14 = OpTypeInt 32 0 
					                                          u32 %15 = OpConstant 4 
					                                              %16 = OpTypeArray %7 %15 
					                                              %17 = OpTypeArray %7 %15 
					                                              %18 = OpTypeStruct %7 %16 %17 %7 %7 %6 %6 %6 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32; f32;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 1 
					                                              %23 = OpTypePointer Uniform %7 
					                                          i32 %27 = OpConstant 0 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 0 
					                                              %76 = OpTypePointer Uniform %6 
					                                          u32 %79 = OpConstant 3 
					                                              %80 = OpTypePointer Private %6 
					                                          f32 %87 = OpConstant 3,674022E-40 
					                                          f32 %92 = OpConstant 3,674022E-40 
					                                 Private f32* %95 = OpVariable Private 
					                                          u32 %96 = OpConstant 2 
					                                         u32 %107 = OpConstant 1 
					                                             %108 = OpTypeArray %6 %107 
					                                             %109 = OpTypeStruct %7 %6 %108 
					                                             %110 = OpTypePointer Output %109 
					        Output struct {f32_4; f32; f32[1];}* %111 = OpVariable Output 
					                                             %112 = OpTypeVector %6 3 
					                                             %115 = OpTypePointer Output %7 
					                                             %132 = OpTypePointer Output %6 
					                                             %134 = OpTypeVector %6 2 
					                                             %135 = OpTypePointer Output %134 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %137 = OpVariable Input 
					                       Output f32_2* vs_TEXCOORD3 = OpVariable Output 
					                                         i32 %151 = OpConstant 4 
					                                         i32 %160 = OpConstant 5 
					                                         i32 %164 = OpConstant 7 
					                                         f32 %168 = OpConstant 3,674022E-40 
					                                         i32 %171 = OpConstant 6 
					                         Output f32* vs_TEXCOORD2 = OpVariable Output 
					                                         f32 %185 = OpConstant 3,674022E-40 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_4 %12 = OpLoad %11 
					                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                               Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
					                                        f32_4 %25 = OpLoad %24 
					                                        f32_4 %26 = OpFMul %13 %25 
					                                                      OpStore %9 %26 
					                               Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
					                                        f32_4 %29 = OpLoad %28 
					                                        f32_4 %30 = OpLoad %11 
					                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                        f32_4 %32 = OpFMul %29 %31 
					                                        f32_4 %33 = OpLoad %9 
					                                        f32_4 %34 = OpFAdd %32 %33 
					                                                      OpStore %9 %34 
					                               Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_4 %38 = OpLoad %11 
					                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                        f32_4 %40 = OpFMul %37 %39 
					                                        f32_4 %41 = OpLoad %9 
					                                        f32_4 %42 = OpFAdd %40 %41 
					                                                      OpStore %9 %42 
					                                        f32_4 %43 = OpLoad %9 
					                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_4 %47 = OpFAdd %43 %46 
					                                                      OpStore %9 %47 
					                                        f32_4 %49 = OpLoad %9 
					                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                               Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
					                                        f32_4 %52 = OpLoad %51 
					                                        f32_4 %53 = OpFMul %50 %52 
					                                                      OpStore %48 %53 
					                               Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
					                                        f32_4 %55 = OpLoad %54 
					                                        f32_4 %56 = OpLoad %9 
					                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                        f32_4 %58 = OpFMul %55 %57 
					                                        f32_4 %59 = OpLoad %48 
					                                        f32_4 %60 = OpFAdd %58 %59 
					                                                      OpStore %48 %60 
					                               Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
					                                        f32_4 %62 = OpLoad %61 
					                                        f32_4 %63 = OpLoad %9 
					                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                        f32_4 %65 = OpFMul %62 %64 
					                                        f32_4 %66 = OpLoad %48 
					                                        f32_4 %67 = OpFAdd %65 %66 
					                                                      OpStore %48 %67 
					                               Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                 Uniform f32* %77 = OpAccessChain %20 %27 %75 
					                                          f32 %78 = OpLoad %77 
					                                 Private f32* %81 = OpAccessChain %9 %79 
					                                          f32 %82 = OpLoad %81 
					                                          f32 %83 = OpFDiv %78 %82 
					                                 Private f32* %84 = OpAccessChain %48 %75 
					                                                      OpStore %84 %83 
					                                 Private f32* %85 = OpAccessChain %48 %75 
					                                          f32 %86 = OpLoad %85 
					                                          f32 %88 = OpExtInst %1 37 %86 %87 
					                                 Private f32* %89 = OpAccessChain %48 %75 
					                                                      OpStore %89 %88 
					                                 Private f32* %90 = OpAccessChain %48 %75 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %93 = OpExtInst %1 40 %91 %92 
					                                 Private f32* %94 = OpAccessChain %48 %75 
					                                                      OpStore %94 %93 
					                                 Private f32* %97 = OpAccessChain %9 %96 
					                                          f32 %98 = OpLoad %97 
					                                 Private f32* %99 = OpAccessChain %48 %75 
					                                         f32 %100 = OpLoad %99 
					                                         f32 %101 = OpFAdd %98 %100 
					                                                      OpStore %95 %101 
					                                Private f32* %102 = OpAccessChain %9 %79 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpLoad %95 
					                                         f32 %105 = OpExtInst %1 37 %103 %104 
					                                Private f32* %106 = OpAccessChain %48 %75 
					                                                      OpStore %106 %105 
					                                       f32_4 %113 = OpLoad %9 
					                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 3 
					                               Output f32_4* %116 = OpAccessChain %111 %27 
					                                       f32_4 %117 = OpLoad %116 
					                                       f32_4 %118 = OpVectorShuffle %117 %114 4 5 2 6 
					                                                      OpStore %116 %118 
					                                         f32 %119 = OpLoad %95 
					                                         f32 %120 = OpFNegate %119 
					                                Private f32* %121 = OpAccessChain %48 %75 
					                                         f32 %122 = OpLoad %121 
					                                         f32 %123 = OpFAdd %120 %122 
					                                Private f32* %124 = OpAccessChain %9 %75 
					                                                      OpStore %124 %123 
					                                Uniform f32* %125 = OpAccessChain %20 %27 %107 
					                                         f32 %126 = OpLoad %125 
					                                Private f32* %127 = OpAccessChain %9 %75 
					                                         f32 %128 = OpLoad %127 
					                                         f32 %129 = OpFMul %126 %128 
					                                         f32 %130 = OpLoad %95 
					                                         f32 %131 = OpFAdd %129 %130 
					                                 Output f32* %133 = OpAccessChain %111 %27 %96 
					                                                      OpStore %133 %131 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                              Uniform f32_4* %140 = OpAccessChain %20 %44 
					                                       f32_4 %141 = OpLoad %140 
					                                       f32_2 %142 = OpVectorShuffle %141 %141 0 1 
					                                       f32_2 %143 = OpFMul %139 %142 
					                              Uniform f32_4* %144 = OpAccessChain %20 %44 
					                                       f32_4 %145 = OpLoad %144 
					                                       f32_2 %146 = OpVectorShuffle %145 %145 2 3 
					                                       f32_2 %147 = OpFAdd %143 %146 
					                                                      OpStore vs_TEXCOORD1 %147 
					                                       f32_4 %149 = OpLoad %137 
					                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
					                              Uniform f32_4* %152 = OpAccessChain %20 %151 
					                                       f32_4 %153 = OpLoad %152 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
					                                       f32_2 %155 = OpFMul %150 %154 
					                              Uniform f32_4* %156 = OpAccessChain %20 %151 
					                                       f32_4 %157 = OpLoad %156 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 2 3 
					                                       f32_2 %159 = OpFAdd %155 %158 
					                                                      OpStore vs_TEXCOORD3 %159 
					                                Uniform f32* %161 = OpAccessChain %20 %160 
					                                         f32 %162 = OpLoad %161 
					                                         f32 %163 = OpFNegate %162 
					                                Uniform f32* %165 = OpAccessChain %20 %164 
					                                         f32 %166 = OpLoad %165 
					                                         f32 %167 = OpFMul %163 %166 
					                                         f32 %169 = OpFAdd %167 %168 
					                                Private f32* %170 = OpAccessChain %9 %75 
					                                                      OpStore %170 %169 
					                                Uniform f32* %172 = OpAccessChain %20 %171 
					                                         f32 %173 = OpLoad %172 
					                                         f32 %174 = OpFNegate %173 
					                                Uniform f32* %175 = OpAccessChain %20 %164 
					                                         f32 %176 = OpLoad %175 
					                                         f32 %177 = OpFMul %174 %176 
					                                Private f32* %178 = OpAccessChain %9 %75 
					                                         f32 %179 = OpLoad %178 
					                                         f32 %180 = OpFAdd %177 %179 
					                                Private f32* %181 = OpAccessChain %9 %75 
					                                                      OpStore %181 %180 
					                                Private f32* %183 = OpAccessChain %9 %75 
					                                         f32 %184 = OpLoad %183 
					                                         f32 %186 = OpFMul %184 %185 
					                                                      OpStore vs_TEXCOORD2 %186 
					                                 Output f32* %187 = OpAccessChain %111 %27 %107 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpFNegate %188 
					                                 Output f32* %190 = OpAccessChain %111 %27 %107 
					                                                      OpStore %190 %189 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 56
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %21 %31 %53 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                             OpDecorate %8 RelaxedPrecision 
					                                             OpDecorate %11 RelaxedPrecision 
					                                             OpDecorate %11 DescriptorSet 11 
					                                             OpDecorate %11 Binding 11 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %15 RelaxedPrecision 
					                                             OpDecorate %15 DescriptorSet 15 
					                                             OpDecorate %15 Binding 15 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 Location 21 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD2 Location 31 
					                                             OpDecorate %53 Location 53 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypePointer Private %6 
					                         Private f32* %8 = OpVariable Private 
					                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %10 = OpTypePointer UniformConstant %9 
					UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
					                                     %13 = OpTypeSampler 
					                                     %14 = OpTypePointer UniformConstant %13 
					            UniformConstant sampler* %15 = OpVariable UniformConstant 
					                                     %17 = OpTypeSampledImage %9 
					                                     %19 = OpTypeVector %6 2 
					                                     %20 = OpTypePointer Input %19 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %23 = OpTypeVector %6 4 
					                                     %25 = OpTypeInt 32 0 
					                                 u32 %26 = OpConstant 3 
					                        Private f32* %28 = OpVariable Private 
					                                     %30 = OpTypePointer Input %6 
					                 Input f32* vs_TEXCOORD2 = OpVariable Input 
					                                     %35 = OpTypeBool 
					                                     %36 = OpTypePointer Private %35 
					                       Private bool* %37 = OpVariable Private 
					                                 f32 %39 = OpConstant 3,674022E-40 
					                                     %42 = OpTypeInt 32 1 
					                                 i32 %43 = OpConstant 0 
					                                 i32 %44 = OpConstant 1 
					                                 i32 %46 = OpConstant -1 
					                                     %52 = OpTypePointer Output %23 
					                       Output f32_4* %53 = OpVariable Output 
					                               f32_4 %54 = OpConstantComposite %39 %39 %39 %39 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %12 = OpLoad %11 
					                             sampler %16 = OpLoad %15 
					          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                               f32_2 %22 = OpLoad vs_TEXCOORD1 
					                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
					                                 f32 %27 = OpCompositeExtract %24 3 
					                                             OpStore %8 %27 
					                                 f32 %29 = OpLoad %8 
					                                 f32 %32 = OpLoad vs_TEXCOORD2 
					                                 f32 %33 = OpFNegate %32 
					                                 f32 %34 = OpFAdd %29 %33 
					                                             OpStore %28 %34 
					                                 f32 %38 = OpLoad %28 
					                                bool %40 = OpFOrdLessThan %38 %39 
					                                             OpStore %37 %40 
					                                bool %41 = OpLoad %37 
					                                 i32 %45 = OpSelect %41 %44 %43 
					                                 i32 %47 = OpIMul %45 %46 
					                                bool %48 = OpINotEqual %47 %43 
					                                             OpSelectionMerge %50 None 
					                                             OpBranchConditional %48 %49 %50 
					                                     %49 = OpLabel 
					                                             OpKill
					                                     %50 = OpLabel 
					                                             OpStore %53 %54 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 _OutlineTex_ST;
						float _OutlineWidth;
						float _FaceDilate;
						float _ScaleRatioA;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[5];
						vec4 unity_LightShadowBias;
						vec4 unused_1_2[20];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD3;
					out float vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
					    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
					    gl_Position.xyw = u_xlat0.xyw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
					    vs_TEXCOORD2 = u_xlat0.x * 0.5;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "SHADOWS_CUBE" }
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
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _OutlineTex_ST;
					uniform 	float _OutlineWidth;
					uniform 	float _FaceDilate;
					uniform 	float _ScaleRatioA;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD3;
					out float vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
					    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
					    gl_Position.xyw = u_xlat0.xyw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
					    vs_TEXCOORD2 = u_xlat0.x * 0.5;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#ifdef GL_ARB_shader_bit_encoding
					#extension GL_ARB_shader_bit_encoding : enable
					#endif
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat10_0.w + (-vs_TEXCOORD2);
					    u_xlatb0 = u_xlat0<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "SHADOWS_CUBE" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 173
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %96 %117 %118 %129 %163 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpMemberDecorate %18 4 Offset 18 
					                                                      OpMemberDecorate %18 5 Offset 18 
					                                                      OpMemberDecorate %18 6 Offset 18 
					                                                      OpMemberDecorate %18 7 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %94 0 BuiltIn 94 
					                                                      OpMemberDecorate %94 1 BuiltIn 94 
					                                                      OpMemberDecorate %94 2 BuiltIn 94 
					                                                      OpDecorate %94 Block 
					                                                      OpDecorate vs_TEXCOORD1 Location 117 
					                                                      OpDecorate %118 Location 118 
					                                                      OpDecorate vs_TEXCOORD3 Location 129 
					                                                      OpDecorate vs_TEXCOORD2 Location 163 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                                 Input f32_4* %11 = OpVariable Input 
					                                              %14 = OpTypeInt 32 0 
					                                          u32 %15 = OpConstant 4 
					                                              %16 = OpTypeArray %7 %15 
					                                              %17 = OpTypeArray %7 %15 
					                                              %18 = OpTypeStruct %7 %16 %17 %7 %7 %6 %6 %6 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32; f32;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 1 
					                                              %23 = OpTypePointer Uniform %7 
					                                          i32 %27 = OpConstant 0 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 3 
					                                              %76 = OpTypePointer Private %6 
					                                          u32 %79 = OpConstant 2 
					                                          u32 %83 = OpConstant 0 
					                                          u32 %92 = OpConstant 1 
					                                              %93 = OpTypeArray %6 %92 
					                                              %94 = OpTypeStruct %7 %6 %93 
					                                              %95 = OpTypePointer Output %94 
					         Output struct {f32_4; f32; f32[1];}* %96 = OpVariable Output 
					                                              %97 = OpTypePointer Uniform %6 
					                                             %106 = OpTypePointer Output %6 
					                                             %108 = OpTypeVector %6 3 
					                                             %111 = OpTypePointer Output %7 
					                                             %115 = OpTypeVector %6 2 
					                                             %116 = OpTypePointer Output %115 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %118 = OpVariable Input 
					                       Output f32_2* vs_TEXCOORD3 = OpVariable Output 
					                                         i32 %132 = OpConstant 4 
					                                         i32 %141 = OpConstant 5 
					                                         i32 %145 = OpConstant 7 
					                                         f32 %149 = OpConstant 3,674022E-40 
					                                         i32 %152 = OpConstant 6 
					                         Output f32* vs_TEXCOORD2 = OpVariable Output 
					                                         f32 %166 = OpConstant 3,674022E-40 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_4 %12 = OpLoad %11 
					                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                               Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
					                                        f32_4 %25 = OpLoad %24 
					                                        f32_4 %26 = OpFMul %13 %25 
					                                                      OpStore %9 %26 
					                               Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
					                                        f32_4 %29 = OpLoad %28 
					                                        f32_4 %30 = OpLoad %11 
					                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                        f32_4 %32 = OpFMul %29 %31 
					                                        f32_4 %33 = OpLoad %9 
					                                        f32_4 %34 = OpFAdd %32 %33 
					                                                      OpStore %9 %34 
					                               Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_4 %38 = OpLoad %11 
					                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                        f32_4 %40 = OpFMul %37 %39 
					                                        f32_4 %41 = OpLoad %9 
					                                        f32_4 %42 = OpFAdd %40 %41 
					                                                      OpStore %9 %42 
					                                        f32_4 %43 = OpLoad %9 
					                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_4 %47 = OpFAdd %43 %46 
					                                                      OpStore %9 %47 
					                                        f32_4 %49 = OpLoad %9 
					                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                               Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
					                                        f32_4 %52 = OpLoad %51 
					                                        f32_4 %53 = OpFMul %50 %52 
					                                                      OpStore %48 %53 
					                               Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
					                                        f32_4 %55 = OpLoad %54 
					                                        f32_4 %56 = OpLoad %9 
					                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                        f32_4 %58 = OpFMul %55 %57 
					                                        f32_4 %59 = OpLoad %48 
					                                        f32_4 %60 = OpFAdd %58 %59 
					                                                      OpStore %48 %60 
					                               Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
					                                        f32_4 %62 = OpLoad %61 
					                                        f32_4 %63 = OpLoad %9 
					                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                        f32_4 %65 = OpFMul %62 %64 
					                                        f32_4 %66 = OpLoad %48 
					                                        f32_4 %67 = OpFAdd %65 %66 
					                                                      OpStore %48 %67 
					                               Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                 Private f32* %77 = OpAccessChain %9 %75 
					                                          f32 %78 = OpLoad %77 
					                                 Private f32* %80 = OpAccessChain %9 %79 
					                                          f32 %81 = OpLoad %80 
					                                          f32 %82 = OpExtInst %1 37 %78 %81 
					                                 Private f32* %84 = OpAccessChain %48 %83 
					                                                      OpStore %84 %82 
					                                 Private f32* %85 = OpAccessChain %9 %79 
					                                          f32 %86 = OpLoad %85 
					                                          f32 %87 = OpFNegate %86 
					                                 Private f32* %88 = OpAccessChain %48 %83 
					                                          f32 %89 = OpLoad %88 
					                                          f32 %90 = OpFAdd %87 %89 
					                                 Private f32* %91 = OpAccessChain %48 %83 
					                                                      OpStore %91 %90 
					                                 Uniform f32* %98 = OpAccessChain %20 %27 %92 
					                                          f32 %99 = OpLoad %98 
					                                Private f32* %100 = OpAccessChain %48 %83 
					                                         f32 %101 = OpLoad %100 
					                                         f32 %102 = OpFMul %99 %101 
					                                Private f32* %103 = OpAccessChain %9 %79 
					                                         f32 %104 = OpLoad %103 
					                                         f32 %105 = OpFAdd %102 %104 
					                                 Output f32* %107 = OpAccessChain %96 %27 %79 
					                                                      OpStore %107 %105 
					                                       f32_4 %109 = OpLoad %9 
					                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 3 
					                               Output f32_4* %112 = OpAccessChain %96 %27 
					                                       f32_4 %113 = OpLoad %112 
					                                       f32_4 %114 = OpVectorShuffle %113 %110 4 5 2 6 
					                                                      OpStore %112 %114 
					                                       f32_4 %119 = OpLoad %118 
					                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
					                              Uniform f32_4* %121 = OpAccessChain %20 %44 
					                                       f32_4 %122 = OpLoad %121 
					                                       f32_2 %123 = OpVectorShuffle %122 %122 0 1 
					                                       f32_2 %124 = OpFMul %120 %123 
					                              Uniform f32_4* %125 = OpAccessChain %20 %44 
					                                       f32_4 %126 = OpLoad %125 
					                                       f32_2 %127 = OpVectorShuffle %126 %126 2 3 
					                                       f32_2 %128 = OpFAdd %124 %127 
					                                                      OpStore vs_TEXCOORD1 %128 
					                                       f32_4 %130 = OpLoad %118 
					                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
					                              Uniform f32_4* %133 = OpAccessChain %20 %132 
					                                       f32_4 %134 = OpLoad %133 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFMul %131 %135 
					                              Uniform f32_4* %137 = OpAccessChain %20 %132 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
					                                       f32_2 %140 = OpFAdd %136 %139 
					                                                      OpStore vs_TEXCOORD3 %140 
					                                Uniform f32* %142 = OpAccessChain %20 %141 
					                                         f32 %143 = OpLoad %142 
					                                         f32 %144 = OpFNegate %143 
					                                Uniform f32* %146 = OpAccessChain %20 %145 
					                                         f32 %147 = OpLoad %146 
					                                         f32 %148 = OpFMul %144 %147 
					                                         f32 %150 = OpFAdd %148 %149 
					                                Private f32* %151 = OpAccessChain %9 %83 
					                                                      OpStore %151 %150 
					                                Uniform f32* %153 = OpAccessChain %20 %152 
					                                         f32 %154 = OpLoad %153 
					                                         f32 %155 = OpFNegate %154 
					                                Uniform f32* %156 = OpAccessChain %20 %145 
					                                         f32 %157 = OpLoad %156 
					                                         f32 %158 = OpFMul %155 %157 
					                                Private f32* %159 = OpAccessChain %9 %83 
					                                         f32 %160 = OpLoad %159 
					                                         f32 %161 = OpFAdd %158 %160 
					                                Private f32* %162 = OpAccessChain %9 %83 
					                                                      OpStore %162 %161 
					                                Private f32* %164 = OpAccessChain %9 %83 
					                                         f32 %165 = OpLoad %164 
					                                         f32 %167 = OpFMul %165 %166 
					                                                      OpStore vs_TEXCOORD2 %167 
					                                 Output f32* %168 = OpAccessChain %96 %27 %92 
					                                         f32 %169 = OpLoad %168 
					                                         f32 %170 = OpFNegate %169 
					                                 Output f32* %171 = OpAccessChain %96 %27 %92 
					                                                      OpStore %171 %170 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 56
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %21 %31 %53 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                             OpDecorate %8 RelaxedPrecision 
					                                             OpDecorate %11 RelaxedPrecision 
					                                             OpDecorate %11 DescriptorSet 11 
					                                             OpDecorate %11 Binding 11 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %15 RelaxedPrecision 
					                                             OpDecorate %15 DescriptorSet 15 
					                                             OpDecorate %15 Binding 15 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 Location 21 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD2 Location 31 
					                                             OpDecorate %53 Location 53 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypePointer Private %6 
					                         Private f32* %8 = OpVariable Private 
					                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %10 = OpTypePointer UniformConstant %9 
					UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
					                                     %13 = OpTypeSampler 
					                                     %14 = OpTypePointer UniformConstant %13 
					            UniformConstant sampler* %15 = OpVariable UniformConstant 
					                                     %17 = OpTypeSampledImage %9 
					                                     %19 = OpTypeVector %6 2 
					                                     %20 = OpTypePointer Input %19 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %23 = OpTypeVector %6 4 
					                                     %25 = OpTypeInt 32 0 
					                                 u32 %26 = OpConstant 3 
					                        Private f32* %28 = OpVariable Private 
					                                     %30 = OpTypePointer Input %6 
					                 Input f32* vs_TEXCOORD2 = OpVariable Input 
					                                     %35 = OpTypeBool 
					                                     %36 = OpTypePointer Private %35 
					                       Private bool* %37 = OpVariable Private 
					                                 f32 %39 = OpConstant 3,674022E-40 
					                                     %42 = OpTypeInt 32 1 
					                                 i32 %43 = OpConstant 0 
					                                 i32 %44 = OpConstant 1 
					                                 i32 %46 = OpConstant -1 
					                                     %52 = OpTypePointer Output %23 
					                       Output f32_4* %53 = OpVariable Output 
					                               f32_4 %54 = OpConstantComposite %39 %39 %39 %39 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %12 = OpLoad %11 
					                             sampler %16 = OpLoad %15 
					          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                               f32_2 %22 = OpLoad vs_TEXCOORD1 
					                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
					                                 f32 %27 = OpCompositeExtract %24 3 
					                                             OpStore %8 %27 
					                                 f32 %29 = OpLoad %8 
					                                 f32 %32 = OpLoad vs_TEXCOORD2 
					                                 f32 %33 = OpFNegate %32 
					                                 f32 %34 = OpFAdd %29 %33 
					                                             OpStore %28 %34 
					                                 f32 %38 = OpLoad %28 
					                                bool %40 = OpFOrdLessThan %38 %39 
					                                             OpStore %37 %40 
					                                bool %41 = OpLoad %37 
					                                 i32 %45 = OpSelect %41 %44 %43 
					                                 i32 %47 = OpIMul %45 %46 
					                                bool %48 = OpINotEqual %47 %43 
					                                             OpSelectionMerge %50 None 
					                                             OpBranchConditional %48 %49 %50 
					                                     %49 = OpLabel 
					                                             OpKill
					                                     %50 = OpLabel 
					                                             OpStore %53 %54 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat10_0.w + (-vs_TEXCOORD2);
					    u_xlatb0 = u_xlat0<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "SHADOWS_DEPTH" }
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat10_0.w + (-vs_TEXCOORD2);
					    u_xlatb0 = u_xlat0<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "SHADOWS_CUBE" }
					"!!vulkan"
				}
			}
		}
	}
	CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}