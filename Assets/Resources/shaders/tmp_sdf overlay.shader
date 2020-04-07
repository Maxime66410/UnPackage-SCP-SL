Shader "TextMeshPro/Distance Field Overlay" {
	Properties {
		_FaceTex ("Face Texture", 2D) = "white" {}
		_FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
		_FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
		_FaceColor ("Face Color", Vector) = (1,1,1,1)
		_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
		_OutlineColor ("Outline Color", Vector) = (0,0,0,1)
		_OutlineTex ("Outline Texture", 2D) = "white" {}
		_OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
		_OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
		_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
		_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
		_Bevel ("Bevel", Range(0, 1)) = 0.5
		_BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
		_BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
		_BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
		_BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
		_LightAngle ("Light Angle", Range(0, 6.283185)) = 3.1416
		_SpecularColor ("Specular", Vector) = (1,1,1,1)
		_SpecularPower ("Specular", Range(0, 4)) = 2
		_Reflectivity ("Reflectivity", Range(5, 15)) = 10
		_Diffuse ("Diffuse", Range(0, 1)) = 0.5
		_Ambient ("Ambient", Range(1, 0)) = 0.5
		_BumpMap ("Normal map", 2D) = "bump" {}
		_BumpOutline ("Bump Outline", Range(0, 1)) = 0
		_BumpFace ("Bump Face", Range(0, 1)) = 0
		_ReflectFaceColor ("Reflection Color", Vector) = (0,0,0,1)
		_ReflectOutlineColor ("Reflection Color", Vector) = (0,0,0,1)
		_Cube ("Reflection Cubemap", Cube) = "black" {}
		_EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
		_UnderlayColor ("Border Color", Vector) = (0,0,0,0.5)
		_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
		_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
		_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
		_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
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
		_MaskCoord ("Mask Coordinates", Vector) = (0,0,32767,32767)
		_ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
		_MaskSoftnessX ("Mask SoftnessX", Float) = 0
		_MaskSoftnessY ("Mask SoftnessY", Float) = 0
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_ColorMask ("Color Mask", Float) = 15
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
			Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
			ColorMask 0 -1
			ZTest Always
			ZWrite Off
			Cull Off
			Stencil {
				ReadMask 0
				WriteMask 0
				Comp Disabled
				Pass Keep
				Fail Keep
				ZFail Keep
			}
			Fog {
				Mode Off
			}
			GpuProgramID 5929
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 unused_0_3;
						float _OutlineWidth;
						vec4 unused_0_5[4];
						mat4x4 _EnvMatrix;
						vec4 unused_0_7[7];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_13[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD5;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat6;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat2.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = abs(u_xlat2.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = u_xlat2.ww / u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat2.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat2.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat2.xy;
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
					    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat2.x);
					    u_xlat8.x = abs(u_xlat8.x) * u_xlat12 + u_xlat2.x;
					    u_xlatb12 = glstate_matrix_projection[3].w==0.0;
					    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat12 = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat6.z = u_xlat8.x * 0.5;
					    vs_TEXCOORD1.yw = u_xlat6.xz;
					    u_xlat12 = 0.5 / u_xlat6.x;
					    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
					    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
					    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xyz = u_xlat1.yyy * _EnvMatrix[1].xyz;
					    u_xlat0.xyz = _EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = _EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
					    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat8.x = floor(u_xlat0.x);
					    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	float _FaceDilate;
					uniform 	float _OutlineSoftness;
					uniform 	float _OutlineWidth;
					uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
					uniform 	float _WeightNormal;
					uniform 	float _WeightBold;
					uniform 	float _ScaleRatioA;
					uniform 	float _VertexOffsetX;
					uniform 	float _VertexOffsetY;
					uniform 	vec4 _ClipRect;
					uniform 	float _MaskSoftnessX;
					uniform 	float _MaskSoftnessY;
					uniform 	float _GradientScale;
					uniform 	float _ScaleX;
					uniform 	float _ScaleY;
					uniform 	float _PerspectiveFilter;
					uniform 	vec4 _FaceTex_ST;
					uniform 	vec4 _OutlineTex_ST;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD5;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat6;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = abs(u_xlat2.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = u_xlat2.ww / u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat2.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat2.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat2.xy;
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
					    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat2.x);
					    u_xlat8.x = abs(u_xlat8.x) * u_xlat12 + u_xlat2.x;
					    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
					    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat12 = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat6.z = u_xlat8.x * 0.5;
					    vs_TEXCOORD1.yw = u_xlat6.xz;
					    u_xlat12 = 0.5 / u_xlat6.x;
					    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
					    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
					    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
					    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat8.x = floor(u_xlat0.x);
					    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
					in  vec4 vs_COLOR0;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat10_0.w + (-vs_TEXCOORD1.x);
					    u_xlat4 = (-u_xlat10_0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
					    u_xlat8.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
					    u_xlat4 = u_xlat8.x * u_xlat12;
					    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
					    u_xlat10_1 = texture(_OutlineTex, u_xlat8.xy);
					    u_xlat1 = u_xlat10_1 * _OutlineColor;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
					    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
					    u_xlat10_3 = texture(_FaceTex, u_xlat8.xy);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.xyz;
					    u_xlat3.w = u_xlat10_3.w * _FaceColor.w;
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
					    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
					    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x / u_xlat4;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 535
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %12 %121 %125 %126 %129 %131 %134 %261 %270 %376 %470 %503 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpDecorate %12 Location 12 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpDecorate %22 ArrayStride 22 
					                                                      OpMemberDecorate %23 0 Offset 23 
					                                                      OpMemberDecorate %23 1 Offset 23 
					                                                      OpMemberDecorate %23 2 Offset 23 
					                                                      OpMemberDecorate %23 3 Offset 23 
					                                                      OpMemberDecorate %23 4 Offset 23 
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
					                                                      OpDecorate %23 Block 
					                                                      OpDecorate %25 DescriptorSet 25 
					                                                      OpDecorate %25 Binding 25 
					                                                      OpMemberDecorate %119 0 BuiltIn 119 
					                                                      OpMemberDecorate %119 1 BuiltIn 119 
					                                                      OpMemberDecorate %119 2 BuiltIn 119 
					                                                      OpDecorate %119 Block 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %125 Location 125 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %126 Location 126 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 129 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %134 Location 134 
					                                                      OpDecorate vs_TEXCOORD2 Location 261 
					                                                      OpDecorate %270 Location 270 
					                                                      OpDecorate vs_TEXCOORD1 Location 376 
					                                                      OpDecorate vs_TEXCOORD3 Location 470 
					                                                      OpDecorate vs_TEXCOORD5 Location 503 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                                 Input f32_4* %12 = OpVariable Input 
					                                              %13 = OpTypeVector %6 2 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %10 %17 
					                                              %19 = OpTypeArray %10 %17 
					                                              %20 = OpTypeArray %10 %17 
					                                              %21 = OpTypeArray %10 %17 
					                                              %22 = OpTypeArray %10 %17 
					                                              %23 = OpTypeStruct %7 %10 %18 %19 %20 %21 %6 %6 %6 %22 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 %10 %10 
					                                              %24 = OpTypePointer Uniform %23 
					Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
					                                              %26 = OpTypeInt 32 1 
					                                          i32 %27 = OpConstant 13 
					                                              %28 = OpTypePointer Uniform %6 
					                                          i32 %31 = OpConstant 14 
					                                              %38 = OpTypePointer Private %10 
					                               Private f32_4* %39 = OpVariable Private 
					                                          i32 %42 = OpConstant 2 
					                                          i32 %43 = OpConstant 1 
					                                              %44 = OpTypePointer Uniform %10 
					                                          i32 %48 = OpConstant 0 
					                               Private f32_4* %63 = OpVariable Private 
					                                          i32 %65 = OpConstant 3 
					                                              %83 = OpTypePointer Uniform %7 
					                               Private f32_4* %89 = OpVariable Private 
					                                          i32 %92 = OpConstant 5 
					                                         u32 %117 = OpConstant 1 
					                                             %118 = OpTypeArray %6 %117 
					                                             %119 = OpTypeStruct %10 %6 %118 
					                                             %120 = OpTypePointer Output %119 
					        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
					                                             %123 = OpTypePointer Output %10 
					                               Output f32_4* %125 = OpVariable Output 
					                                Input f32_4* %126 = OpVariable Input 
					                                             %128 = OpTypePointer Output %13 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %130 = OpTypePointer Input %13 
					                                Input f32_2* %131 = OpVariable Input 
					                                             %133 = OpTypePointer Input %7 
					                                Input f32_3* %134 = OpVariable Input 
					                                         u32 %140 = OpConstant 0 
					                                             %141 = OpTypePointer Private %6 
					                                         u32 %154 = OpConstant 2 
					                                             %156 = OpTypePointer Private %13 
					                              Private f32_2* %157 = OpVariable Private 
					                                         i32 %201 = OpConstant 4 
					                                         i32 %223 = OpConstant 19 
					                                         i32 %226 = OpConstant 20 
					                                Private f32* %240 = OpVariable Private 
					                                         i32 %246 = OpConstant 16 
					                                         i32 %249 = OpConstant 17 
					                                         f32 %253 = OpConstant 3,674022E-40 
					                                       f32_2 %254 = OpConstantComposite %253 %253 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Private f32* %269 = OpVariable Private 
					                                Input f32_2* %270 = OpVariable Input 
					                                             %271 = OpTypePointer Input %6 
					                                         i32 %275 = OpConstant 18 
					                                         f32 %283 = OpConstant 3,674022E-40 
					                                         i32 %285 = OpConstant 21 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %313 = OpTypeBool 
					                                             %314 = OpTypePointer Private %313 
					                               Private bool* %315 = OpVariable Private 
					                                         u32 %316 = OpConstant 3 
					                                         f32 %319 = OpConstant 3,674022E-40 
					                              Private f32_3* %321 = OpVariable Private 
					                                             %323 = OpTypePointer Function %6 
					                               Private bool* %333 = OpVariable Private 
					                                         i32 %340 = OpConstant 10 
					                                         i32 %344 = OpConstant 11 
					                                         i32 %359 = OpConstant 6 
					                                         i32 %366 = OpConstant 12 
					                                         f32 %373 = OpConstant 3,674022E-40 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                         i32 %384 = OpConstant 8 
					                                         i32 %392 = OpConstant 7 
					                                             %412 = OpTypePointer Output %6 
					                                         i32 %425 = OpConstant 15 
					                                         f32 %428 = OpConstant 3,674022E-40 
					                                       f32_4 %429 = OpConstantComposite %428 %428 %428 %428 
					                                         f32 %432 = OpConstant 3,674022E-40 
					                                       f32_4 %433 = OpConstantComposite %432 %432 %432 %432 
					                                         f32 %437 = OpConstant 3,674022E-40 
					                                       f32_2 %438 = OpConstantComposite %437 %437 
					                                         i32 %456 = OpConstant 9 
					                                             %469 = OpTypePointer Output %7 
					                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
					                                         f32 %481 = OpConstant 3,674022E-40 
					                                         f32 %491 = OpConstant 3,674022E-40 
					                                         f32 %498 = OpConstant 3,674022E-40 
					                                       f32_2 %499 = OpConstantComposite %498 %498 
					                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
					                                         i32 %506 = OpConstant 22 
					                                         i32 %519 = OpConstant 23 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %324 = OpVariable Function 
					                                        f32_4 %14 = OpLoad %12 
					                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
					                                 Uniform f32* %29 = OpAccessChain %25 %27 
					                                          f32 %30 = OpLoad %29 
					                                 Uniform f32* %32 = OpAccessChain %25 %31 
					                                          f32 %33 = OpLoad %32 
					                                        f32_2 %34 = OpCompositeConstruct %30 %33 
					                                        f32_2 %35 = OpFAdd %15 %34 
					                                        f32_3 %36 = OpLoad %9 
					                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
					                                                      OpStore %9 %37 
					                                        f32_3 %40 = OpLoad %9 
					                                        f32_4 %41 = OpVectorShuffle %40 %40 1 1 1 1 
					                               Uniform f32_4* %45 = OpAccessChain %25 %42 %43 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_4 %47 = OpFMul %41 %46 
					                                                      OpStore %39 %47 
					                               Uniform f32_4* %49 = OpAccessChain %25 %42 %48 
					                                        f32_4 %50 = OpLoad %49 
					                                        f32_3 %51 = OpLoad %9 
					                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 0 0 
					                                        f32_4 %53 = OpFMul %50 %52 
					                                        f32_4 %54 = OpLoad %39 
					                                        f32_4 %55 = OpFAdd %53 %54 
					                                                      OpStore %39 %55 
					                               Uniform f32_4* %56 = OpAccessChain %25 %42 %42 
					                                        f32_4 %57 = OpLoad %56 
					                                        f32_4 %58 = OpLoad %12 
					                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
					                                        f32_4 %60 = OpFMul %57 %59 
					                                        f32_4 %61 = OpLoad %39 
					                                        f32_4 %62 = OpFAdd %60 %61 
					                                                      OpStore %39 %62 
					                                        f32_4 %64 = OpLoad %39 
					                               Uniform f32_4* %66 = OpAccessChain %25 %42 %65 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_4 %68 = OpFAdd %64 %67 
					                                                      OpStore %63 %68 
					                               Uniform f32_4* %69 = OpAccessChain %25 %42 %65 
					                                        f32_4 %70 = OpLoad %69 
					                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                        f32_4 %72 = OpLoad %12 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
					                                        f32_3 %74 = OpFMul %71 %73 
					                                        f32_4 %75 = OpLoad %39 
					                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
					                                        f32_3 %77 = OpFAdd %74 %76 
					                                        f32_4 %78 = OpLoad %39 
					                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
					                                                      OpStore %39 %79 
					                                        f32_4 %80 = OpLoad %39 
					                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
					                                        f32_3 %82 = OpFNegate %81 
					                               Uniform f32_3* %84 = OpAccessChain %25 %48 
					                                        f32_3 %85 = OpLoad %84 
					                                        f32_3 %86 = OpFAdd %82 %85 
					                                        f32_4 %87 = OpLoad %39 
					                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
					                                                      OpStore %39 %88 
					                                        f32_4 %90 = OpLoad %63 
					                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
					                               Uniform f32_4* %93 = OpAccessChain %25 %92 %43 
					                                        f32_4 %94 = OpLoad %93 
					                                        f32_4 %95 = OpFMul %91 %94 
					                                                      OpStore %89 %95 
					                               Uniform f32_4* %96 = OpAccessChain %25 %92 %48 
					                                        f32_4 %97 = OpLoad %96 
					                                        f32_4 %98 = OpLoad %63 
					                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
					                                       f32_4 %100 = OpFMul %97 %99 
					                                       f32_4 %101 = OpLoad %89 
					                                       f32_4 %102 = OpFAdd %100 %101 
					                                                      OpStore %89 %102 
					                              Uniform f32_4* %103 = OpAccessChain %25 %92 %42 
					                                       f32_4 %104 = OpLoad %103 
					                                       f32_4 %105 = OpLoad %63 
					                                       f32_4 %106 = OpVectorShuffle %105 %105 2 2 2 2 
					                                       f32_4 %107 = OpFMul %104 %106 
					                                       f32_4 %108 = OpLoad %89 
					                                       f32_4 %109 = OpFAdd %107 %108 
					                                                      OpStore %89 %109 
					                              Uniform f32_4* %110 = OpAccessChain %25 %92 %65 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_4 %112 = OpLoad %63 
					                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
					                                       f32_4 %114 = OpFMul %111 %113 
					                                       f32_4 %115 = OpLoad %89 
					                                       f32_4 %116 = OpFAdd %114 %115 
					                                                      OpStore %63 %116 
					                                       f32_4 %122 = OpLoad %63 
					                               Output f32_4* %124 = OpAccessChain %121 %48 
					                                                      OpStore %124 %122 
					                                       f32_4 %127 = OpLoad %126 
					                                                      OpStore %125 %127 
					                                       f32_2 %132 = OpLoad %131 
					                                                      OpStore vs_TEXCOORD0 %132 
					                                       f32_3 %135 = OpLoad %134 
					                              Uniform f32_4* %136 = OpAccessChain %25 %65 %48 
					                                       f32_4 %137 = OpLoad %136 
					                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
					                                         f32 %139 = OpDot %135 %138 
					                                Private f32* %142 = OpAccessChain %63 %140 
					                                                      OpStore %142 %139 
					                                       f32_3 %143 = OpLoad %134 
					                              Uniform f32_4* %144 = OpAccessChain %25 %65 %43 
					                                       f32_4 %145 = OpLoad %144 
					                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
					                                         f32 %147 = OpDot %143 %146 
					                                Private f32* %148 = OpAccessChain %63 %117 
					                                                      OpStore %148 %147 
					                                       f32_3 %149 = OpLoad %134 
					                              Uniform f32_4* %150 = OpAccessChain %25 %65 %42 
					                                       f32_4 %151 = OpLoad %150 
					                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
					                                         f32 %153 = OpDot %149 %152 
					                                Private f32* %155 = OpAccessChain %63 %154 
					                                                      OpStore %155 %153 
					                                       f32_4 %158 = OpLoad %63 
					                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                                       f32_4 %160 = OpLoad %63 
					                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
					                                         f32 %162 = OpDot %159 %161 
					                                Private f32* %163 = OpAccessChain %157 %140 
					                                                      OpStore %163 %162 
					                                Private f32* %164 = OpAccessChain %157 %140 
					                                         f32 %165 = OpLoad %164 
					                                         f32 %166 = OpExtInst %1 32 %165 
					                                Private f32* %167 = OpAccessChain %157 %140 
					                                                      OpStore %167 %166 
					                                       f32_2 %168 = OpLoad %157 
					                                       f32_3 %169 = OpVectorShuffle %168 %168 0 0 0 
					                                       f32_4 %170 = OpLoad %63 
					                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
					                                       f32_3 %172 = OpFMul %169 %171 
					                                       f32_4 %173 = OpLoad %63 
					                                       f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
					                                                      OpStore %63 %174 
					                                       f32_4 %175 = OpLoad %39 
					                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
					                                       f32_4 %177 = OpLoad %39 
					                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
					                                         f32 %179 = OpDot %176 %178 
					                                Private f32* %180 = OpAccessChain %157 %140 
					                                                      OpStore %180 %179 
					                                Private f32* %181 = OpAccessChain %157 %140 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpExtInst %1 32 %182 
					                                Private f32* %184 = OpAccessChain %157 %140 
					                                                      OpStore %184 %183 
					                                       f32_2 %185 = OpLoad %157 
					                                       f32_3 %186 = OpVectorShuffle %185 %185 0 0 0 
					                                       f32_4 %187 = OpLoad %39 
					                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
					                                       f32_3 %189 = OpFMul %186 %188 
					                                       f32_4 %190 = OpLoad %89 
					                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
					                                                      OpStore %89 %191 
					                                       f32_4 %192 = OpLoad %63 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                       f32_4 %194 = OpLoad %89 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                         f32 %196 = OpDot %193 %195 
					                                Private f32* %197 = OpAccessChain %157 %140 
					                                                      OpStore %197 %196 
					                              Uniform f32_4* %198 = OpAccessChain %25 %43 
					                                       f32_4 %199 = OpLoad %198 
					                                       f32_2 %200 = OpVectorShuffle %199 %199 1 1 
					                              Uniform f32_4* %202 = OpAccessChain %25 %201 %43 
					                                       f32_4 %203 = OpLoad %202 
					                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
					                                       f32_2 %205 = OpFMul %200 %204 
					                                       f32_4 %206 = OpLoad %63 
					                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 2 3 
					                                                      OpStore %63 %207 
					                              Uniform f32_4* %208 = OpAccessChain %25 %201 %48 
					                                       f32_4 %209 = OpLoad %208 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
					                              Uniform f32_4* %211 = OpAccessChain %25 %43 
					                                       f32_4 %212 = OpLoad %211 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 0 
					                                       f32_2 %214 = OpFMul %210 %213 
					                                       f32_4 %215 = OpLoad %63 
					                                       f32_2 %216 = OpVectorShuffle %215 %215 0 1 
					                                       f32_2 %217 = OpFAdd %214 %216 
					                                       f32_4 %218 = OpLoad %63 
					                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
					                                                      OpStore %63 %219 
					                                       f32_4 %220 = OpLoad %63 
					                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
					                                       f32_2 %222 = OpExtInst %1 4 %221 
					                                Uniform f32* %224 = OpAccessChain %25 %223 
					                                         f32 %225 = OpLoad %224 
					                                Uniform f32* %227 = OpAccessChain %25 %226 
					                                         f32 %228 = OpLoad %227 
					                                       f32_2 %229 = OpCompositeConstruct %225 %228 
					                                       f32_2 %230 = OpFMul %222 %229 
					                                       f32_4 %231 = OpLoad %63 
					                                       f32_4 %232 = OpVectorShuffle %231 %230 4 5 2 3 
					                                                      OpStore %63 %232 
					                                       f32_4 %233 = OpLoad %63 
					                                       f32_2 %234 = OpVectorShuffle %233 %233 3 3 
					                                       f32_4 %235 = OpLoad %63 
					                                       f32_2 %236 = OpVectorShuffle %235 %235 0 1 
					                                       f32_2 %237 = OpFDiv %234 %236 
					                                       f32_4 %238 = OpLoad %63 
					                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 2 3 
					                                                      OpStore %63 %239 
					                                       f32_4 %241 = OpLoad %63 
					                                       f32_2 %242 = OpVectorShuffle %241 %241 0 1 
					                                       f32_4 %243 = OpLoad %63 
					                                       f32_2 %244 = OpVectorShuffle %243 %243 0 1 
					                                         f32 %245 = OpDot %242 %244 
					                                                      OpStore %240 %245 
					                                Uniform f32* %247 = OpAccessChain %25 %246 
					                                         f32 %248 = OpLoad %247 
					                                Uniform f32* %250 = OpAccessChain %25 %249 
					                                         f32 %251 = OpLoad %250 
					                                       f32_2 %252 = OpCompositeConstruct %248 %251 
					                                       f32_2 %255 = OpFMul %252 %254 
					                                       f32_4 %256 = OpLoad %63 
					                                       f32_2 %257 = OpVectorShuffle %256 %256 0 1 
					                                       f32_2 %258 = OpFAdd %255 %257 
					                                       f32_4 %259 = OpLoad %63 
					                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 2 3 
					                                                      OpStore %63 %260 
					                                       f32_4 %262 = OpLoad %63 
					                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
					                                       f32_2 %264 = OpFDiv %254 %263 
					                                       f32_4 %265 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %266 = OpVectorShuffle %265 %264 0 1 4 5 
					                                                      OpStore vs_TEXCOORD2 %266 
					                                         f32 %267 = OpLoad %240 
					                                         f32 %268 = OpExtInst %1 32 %267 
					                                                      OpStore %240 %268 
					                                  Input f32* %272 = OpAccessChain %270 %117 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpExtInst %1 4 %273 
					                                Uniform f32* %276 = OpAccessChain %25 %275 
					                                         f32 %277 = OpLoad %276 
					                                         f32 %278 = OpFMul %274 %277 
					                                                      OpStore %269 %278 
					                                         f32 %279 = OpLoad %240 
					                                         f32 %280 = OpLoad %269 
					                                         f32 %281 = OpFMul %279 %280 
					                                                      OpStore %240 %281 
					                                         f32 %282 = OpLoad %240 
					                                         f32 %284 = OpFMul %282 %283 
					                                                      OpStore %269 %284 
					                                Uniform f32* %286 = OpAccessChain %25 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFNegate %287 
					                                         f32 %290 = OpFAdd %288 %289 
					                                Private f32* %291 = OpAccessChain %63 %140 
					                                                      OpStore %291 %290 
					                                         f32 %292 = OpLoad %269 
					                                         f32 %293 = OpExtInst %1 4 %292 
					                                Private f32* %294 = OpAccessChain %63 %140 
					                                         f32 %295 = OpLoad %294 
					                                         f32 %296 = OpFMul %293 %295 
					                                Private f32* %297 = OpAccessChain %63 %140 
					                                                      OpStore %297 %296 
					                                         f32 %298 = OpLoad %240 
					                                         f32 %299 = OpFMul %298 %283 
					                                Private f32* %300 = OpAccessChain %63 %140 
					                                         f32 %301 = OpLoad %300 
					                                         f32 %302 = OpFNegate %301 
					                                         f32 %303 = OpFAdd %299 %302 
					                                                      OpStore %240 %303 
					                                Private f32* %304 = OpAccessChain %157 %140 
					                                         f32 %305 = OpLoad %304 
					                                         f32 %306 = OpExtInst %1 4 %305 
					                                         f32 %307 = OpLoad %240 
					                                         f32 %308 = OpFMul %306 %307 
					                                Private f32* %309 = OpAccessChain %63 %140 
					                                         f32 %310 = OpLoad %309 
					                                         f32 %311 = OpFAdd %308 %310 
					                                Private f32* %312 = OpAccessChain %157 %140 
					                                                      OpStore %312 %311 
					                                Uniform f32* %317 = OpAccessChain %25 %201 %65 %316 
					                                         f32 %318 = OpLoad %317 
					                                        bool %320 = OpFOrdEqual %318 %319 
					                                                      OpStore %315 %320 
					                                        bool %322 = OpLoad %315 
					                                                      OpSelectionMerge %326 None 
					                                                      OpBranchConditional %322 %325 %329 
					                                             %325 = OpLabel 
					                                Private f32* %327 = OpAccessChain %157 %140 
					                                         f32 %328 = OpLoad %327 
					                                                      OpStore %324 %328 
					                                                      OpBranch %326 
					                                             %329 = OpLabel 
					                                         f32 %330 = OpLoad %269 
					                                                      OpStore %324 %330 
					                                                      OpBranch %326 
					                                             %326 = OpLabel 
					                                         f32 %331 = OpLoad %324 
					                                Private f32* %332 = OpAccessChain %321 %140 
					                                                      OpStore %332 %331 
					                                  Input f32* %334 = OpAccessChain %270 %117 
					                                         f32 %335 = OpLoad %334 
					                                        bool %336 = OpFOrdGreaterThanEqual %319 %335 
					                                                      OpStore %333 %336 
					                                        bool %337 = OpLoad %333 
					                                         f32 %338 = OpSelect %337 %289 %319 
					                                Private f32* %339 = OpAccessChain %157 %140 
					                                                      OpStore %339 %338 
					                                Uniform f32* %341 = OpAccessChain %25 %340 
					                                         f32 %342 = OpLoad %341 
					                                         f32 %343 = OpFNegate %342 
					                                Uniform f32* %345 = OpAccessChain %25 %344 
					                                         f32 %346 = OpLoad %345 
					                                         f32 %347 = OpFAdd %343 %346 
					                                                      OpStore %240 %347 
					                                Private f32* %348 = OpAccessChain %157 %140 
					                                         f32 %349 = OpLoad %348 
					                                         f32 %350 = OpLoad %240 
					                                         f32 %351 = OpFMul %349 %350 
					                                Uniform f32* %352 = OpAccessChain %25 %340 
					                                         f32 %353 = OpLoad %352 
					                                         f32 %354 = OpFAdd %351 %353 
					                                Private f32* %355 = OpAccessChain %157 %140 
					                                                      OpStore %355 %354 
					                                Private f32* %356 = OpAccessChain %157 %140 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %358 = OpFMul %357 %253 
					                                Uniform f32* %360 = OpAccessChain %25 %359 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpFAdd %358 %361 
					                                Private f32* %363 = OpAccessChain %157 %140 
					                                                      OpStore %363 %362 
					                                Private f32* %364 = OpAccessChain %157 %140 
					                                         f32 %365 = OpLoad %364 
					                                Uniform f32* %367 = OpAccessChain %25 %366 
					                                         f32 %368 = OpLoad %367 
					                                         f32 %369 = OpFMul %365 %368 
					                                Private f32* %370 = OpAccessChain %157 %140 
					                                                      OpStore %370 %369 
					                                Private f32* %371 = OpAccessChain %157 %140 
					                                         f32 %372 = OpLoad %371 
					                                         f32 %374 = OpFMul %372 %373 
					                                Private f32* %375 = OpAccessChain %321 %154 
					                                                      OpStore %375 %374 
					                                       f32_3 %377 = OpLoad %321 
					                                       f32_2 %378 = OpVectorShuffle %377 %377 0 2 
					                                       f32_4 %379 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %380 = OpVectorShuffle %379 %378 0 4 2 5 
					                                                      OpStore vs_TEXCOORD1 %380 
					                                Private f32* %381 = OpAccessChain %321 %140 
					                                         f32 %382 = OpLoad %381 
					                                         f32 %383 = OpFDiv %373 %382 
					                                                      OpStore %240 %383 
					                                Uniform f32* %385 = OpAccessChain %25 %384 
					                                         f32 %386 = OpLoad %385 
					                                         f32 %387 = OpFNegate %386 
					                                Uniform f32* %388 = OpAccessChain %25 %366 
					                                         f32 %389 = OpLoad %388 
					                                         f32 %390 = OpFMul %387 %389 
					                                         f32 %391 = OpFAdd %390 %289 
					                                                      OpStore %269 %391 
					                                Uniform f32* %393 = OpAccessChain %25 %392 
					                                         f32 %394 = OpLoad %393 
					                                         f32 %395 = OpFNegate %394 
					                                Uniform f32* %396 = OpAccessChain %25 %366 
					                                         f32 %397 = OpLoad %396 
					                                         f32 %398 = OpFMul %395 %397 
					                                         f32 %399 = OpLoad %269 
					                                         f32 %400 = OpFAdd %398 %399 
					                                                      OpStore %269 %400 
					                                         f32 %401 = OpLoad %269 
					                                         f32 %402 = OpFMul %401 %373 
					                                         f32 %403 = OpLoad %240 
					                                         f32 %404 = OpFNegate %403 
					                                         f32 %405 = OpFAdd %402 %404 
					                                                      OpStore %269 %405 
					                                Private f32* %406 = OpAccessChain %157 %140 
					                                         f32 %407 = OpLoad %406 
					                                         f32 %408 = OpFNegate %407 
					                                         f32 %409 = OpFMul %408 %373 
					                                         f32 %410 = OpLoad %269 
					                                         f32 %411 = OpFAdd %409 %410 
					                                 Output f32* %413 = OpAccessChain vs_TEXCOORD1 %140 
					                                                      OpStore %413 %411 
					                                Private f32* %414 = OpAccessChain %157 %140 
					                                         f32 %415 = OpLoad %414 
					                                         f32 %416 = OpFNegate %415 
					                                         f32 %417 = OpFMul %416 %373 
					                                         f32 %418 = OpFAdd %417 %373 
					                                Private f32* %419 = OpAccessChain %157 %140 
					                                                      OpStore %419 %418 
					                                         f32 %420 = OpLoad %240 
					                                Private f32* %421 = OpAccessChain %157 %140 
					                                         f32 %422 = OpLoad %421 
					                                         f32 %423 = OpFAdd %420 %422 
					                                 Output f32* %424 = OpAccessChain vs_TEXCOORD1 %154 
					                                                      OpStore %424 %423 
					                              Uniform f32_4* %426 = OpAccessChain %25 %425 
					                                       f32_4 %427 = OpLoad %426 
					                                       f32_4 %430 = OpExtInst %1 40 %427 %429 
					                                                      OpStore %63 %430 
					                                       f32_4 %431 = OpLoad %63 
					                                       f32_4 %434 = OpExtInst %1 37 %431 %433 
					                                                      OpStore %63 %434 
					                                       f32_3 %435 = OpLoad %9 
					                                       f32_2 %436 = OpVectorShuffle %435 %435 0 1 
					                                       f32_2 %439 = OpFMul %436 %438 
					                                       f32_4 %440 = OpLoad %63 
					                                       f32_2 %441 = OpVectorShuffle %440 %440 0 1 
					                                       f32_2 %442 = OpFNegate %441 
					                                       f32_2 %443 = OpFAdd %439 %442 
					                                       f32_3 %444 = OpLoad %9 
					                                       f32_3 %445 = OpVectorShuffle %444 %443 3 4 2 
					                                                      OpStore %9 %445 
					                                       f32_4 %446 = OpLoad %63 
					                                       f32_2 %447 = OpVectorShuffle %446 %446 2 3 
					                                       f32_2 %448 = OpFNegate %447 
					                                       f32_3 %449 = OpLoad %9 
					                                       f32_2 %450 = OpVectorShuffle %449 %449 0 1 
					                                       f32_2 %451 = OpFAdd %448 %450 
					                                       f32_4 %452 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %453 = OpVectorShuffle %452 %451 4 5 2 3 
					                                                      OpStore vs_TEXCOORD2 %453 
					                                       f32_4 %454 = OpLoad %39 
					                                       f32_3 %455 = OpVectorShuffle %454 %454 1 1 1 
					                              Uniform f32_4* %457 = OpAccessChain %25 %456 %43 
					                                       f32_4 %458 = OpLoad %457 
					                                       f32_3 %459 = OpVectorShuffle %458 %458 0 1 2 
					                                       f32_3 %460 = OpFMul %455 %459 
					                                                      OpStore %9 %460 
					                              Uniform f32_4* %461 = OpAccessChain %25 %456 %48 
					                                       f32_4 %462 = OpLoad %461 
					                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
					                                       f32_4 %464 = OpLoad %39 
					                                       f32_3 %465 = OpVectorShuffle %464 %464 0 0 0 
					                                       f32_3 %466 = OpFMul %463 %465 
					                                       f32_3 %467 = OpLoad %9 
					                                       f32_3 %468 = OpFAdd %466 %467 
					                                                      OpStore %9 %468 
					                              Uniform f32_4* %471 = OpAccessChain %25 %456 %42 
					                                       f32_4 %472 = OpLoad %471 
					                                       f32_3 %473 = OpVectorShuffle %472 %472 0 1 2 
					                                       f32_4 %474 = OpLoad %39 
					                                       f32_3 %475 = OpVectorShuffle %474 %474 2 2 2 
					                                       f32_3 %476 = OpFMul %473 %475 
					                                       f32_3 %477 = OpLoad %9 
					                                       f32_3 %478 = OpFAdd %476 %477 
					                                                      OpStore vs_TEXCOORD3 %478 
					                                  Input f32* %479 = OpAccessChain %270 %140 
					                                         f32 %480 = OpLoad %479 
					                                         f32 %482 = OpFMul %480 %481 
					                                Private f32* %483 = OpAccessChain %9 %140 
					                                                      OpStore %483 %482 
					                                Private f32* %484 = OpAccessChain %9 %140 
					                                         f32 %485 = OpLoad %484 
					                                         f32 %486 = OpExtInst %1 8 %485 
					                                Private f32* %487 = OpAccessChain %157 %140 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %157 %140 
					                                         f32 %489 = OpLoad %488 
					                                         f32 %490 = OpFNegate %489 
					                                         f32 %492 = OpFMul %490 %491 
					                                  Input f32* %493 = OpAccessChain %270 %140 
					                                         f32 %494 = OpLoad %493 
					                                         f32 %495 = OpFAdd %492 %494 
					                                Private f32* %496 = OpAccessChain %157 %117 
					                                                      OpStore %496 %495 
					                                       f32_2 %497 = OpLoad %157 
					                                       f32_2 %500 = OpFMul %497 %499 
					                                       f32_3 %501 = OpLoad %9 
					                                       f32_3 %502 = OpVectorShuffle %501 %500 3 4 2 
					                                                      OpStore %9 %502 
					                                       f32_3 %504 = OpLoad %9 
					                                       f32_2 %505 = OpVectorShuffle %504 %504 0 1 
					                              Uniform f32_4* %507 = OpAccessChain %25 %506 
					                                       f32_4 %508 = OpLoad %507 
					                                       f32_2 %509 = OpVectorShuffle %508 %508 0 1 
					                                       f32_2 %510 = OpFMul %505 %509 
					                              Uniform f32_4* %511 = OpAccessChain %25 %506 
					                                       f32_4 %512 = OpLoad %511 
					                                       f32_2 %513 = OpVectorShuffle %512 %512 2 3 
					                                       f32_2 %514 = OpFAdd %510 %513 
					                                       f32_4 %515 = OpLoad vs_TEXCOORD5 
					                                       f32_4 %516 = OpVectorShuffle %515 %514 4 5 2 3 
					                                                      OpStore vs_TEXCOORD5 %516 
					                                       f32_3 %517 = OpLoad %9 
					                                       f32_2 %518 = OpVectorShuffle %517 %517 0 1 
					                              Uniform f32_4* %520 = OpAccessChain %25 %519 
					                                       f32_4 %521 = OpLoad %520 
					                                       f32_2 %522 = OpVectorShuffle %521 %521 0 1 
					                                       f32_2 %523 = OpFMul %518 %522 
					                              Uniform f32_4* %524 = OpAccessChain %25 %519 
					                                       f32_4 %525 = OpLoad %524 
					                                       f32_2 %526 = OpVectorShuffle %525 %525 2 3 
					                                       f32_2 %527 = OpFAdd %523 %526 
					                                       f32_4 %528 = OpLoad vs_TEXCOORD5 
					                                       f32_4 %529 = OpVectorShuffle %528 %527 0 1 4 5 
					                                                      OpStore vs_TEXCOORD5 %529 
					                                 Output f32* %530 = OpAccessChain %121 %48 %117 
					                                         f32 %531 = OpLoad %530 
					                                         f32 %532 = OpFNegate %531 
					                                 Output f32* %533 = OpAccessChain %121 %48 %117 
					                                                      OpStore %533 %532 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 276
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %22 %35 %127 %147 %270 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %12 RelaxedPrecision 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %16 RelaxedPrecision 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %17 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 22 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 35 
					                                                      OpDecorate %44 RelaxedPrecision 
					                                                      OpDecorate %45 RelaxedPrecision 
					                                                      OpMemberDecorate %68 0 Offset 68 
					                                                      OpMemberDecorate %68 1 Offset 68 
					                                                      OpMemberDecorate %68 2 Offset 68 
					                                                      OpMemberDecorate %68 3 RelaxedPrecision 
					                                                      OpMemberDecorate %68 3 Offset 68 
					                                                      OpMemberDecorate %68 4 Offset 68 
					                                                      OpMemberDecorate %68 5 Offset 68 
					                                                      OpMemberDecorate %68 6 Offset 68 
					                                                      OpMemberDecorate %68 7 RelaxedPrecision 
					                                                      OpMemberDecorate %68 7 Offset 68 
					                                                      OpMemberDecorate %68 8 Offset 68 
					                                                      OpMemberDecorate %68 9 Offset 68 
					                                                      OpDecorate %68 Block 
					                                                      OpDecorate %70 DescriptorSet 70 
					                                                      OpDecorate %70 Binding 70 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD5 Location 127 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 DescriptorSet 131 
					                                                      OpDecorate %131 Binding 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %133 DescriptorSet 133 
					                                                      OpDecorate %133 Binding 133 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %147 Location 147 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %169 DescriptorSet 169 
					                                                      OpDecorate %169 Binding 169 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %171 DescriptorSet 171 
					                                                      OpDecorate %171 Binding 171 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
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
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %219 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %224 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %270 Location 270 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
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
					                                              %20 = OpTypeVector %6 2 
					                                              %21 = OpTypePointer Input %20 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %25 = OpTypeInt 32 0 
					                                          u32 %26 = OpConstant 3 
					                                          u32 %28 = OpConstant 0 
					                                              %29 = OpTypePointer Private %6 
					                                 Private f32* %31 = OpVariable Private 
					                                              %34 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                              %36 = OpTypePointer Input %6 
					                                              %41 = OpTypePointer Private %20 
					                               Private f32_2* %42 = OpVariable Private 
					                                          u32 %46 = OpConstant 2 
					                                              %51 = OpTypeBool 
					                                              %52 = OpTypePointer Private %51 
					                                Private bool* %53 = OpVariable Private 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                              %58 = OpTypeInt 32 1 
					                                          i32 %59 = OpConstant 0 
					                                          i32 %60 = OpConstant 1 
					                                          i32 %62 = OpConstant -1 
					                                              %68 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 
					                                              %69 = OpTypePointer Uniform %68 
					Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32;}* %70 = OpVariable Uniform 
					                                          i32 %71 = OpConstant 8 
					                                              %72 = OpTypePointer Uniform %6 
					                                          i32 %75 = OpConstant 9 
					                                          u32 %80 = OpConstant 1 
					                                 Private f32* %84 = OpVariable Private 
					                                          f32 %86 = OpConstant 3,674022E-40 
					                                 Private f32* %88 = OpVariable Private 
					                                          f32 %90 = OpConstant 3,674022E-40 
					                                 Private f32* %94 = OpVariable Private 
					                                         i32 %115 = OpConstant 5 
					                                         i32 %118 = OpConstant 6 
					                                             %122 = OpTypePointer Uniform %7 
					                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
					        UniformConstant read_only Texture2D* %131 = OpVariable UniformConstant 
					                    UniformConstant sampler* %133 = OpVariable UniformConstant 
					                              Private f32_4* %138 = OpVariable Private 
					                                         i32 %140 = OpConstant 7 
					                                             %144 = OpTypeVector %6 3 
					                                             %145 = OpTypePointer Private %144 
					                              Private f32_3* %146 = OpVariable Private 
					                                Input f32_4* %147 = OpVariable Input 
					                                         i32 %150 = OpConstant 3 
					                                         i32 %157 = OpConstant 2 
					                              Private f32_4* %168 = OpVariable Private 
					        UniformConstant read_only Texture2D* %169 = OpVariable UniformConstant 
					                    UniformConstant sampler* %171 = OpVariable UniformConstant 
					                              Private f32_4* %176 = OpVariable Private 
					                                Private f32* %183 = OpVariable Private 
					                                Private f32* %236 = OpVariable Private 
					                                         i32 %237 = OpConstant 4 
					                                Private f32* %243 = OpVariable Private 
					                                             %269 = OpTypePointer Output %7 
					                               Output f32_4* %270 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                          read_only Texture2D %13 = OpLoad %12 
					                                      sampler %17 = OpLoad %16 
					                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                          f32 %27 = OpCompositeExtract %24 3 
					                                 Private f32* %30 = OpAccessChain %9 %28 
					                                                      OpStore %30 %27 
					                                 Private f32* %32 = OpAccessChain %9 %28 
					                                          f32 %33 = OpLoad %32 
					                                   Input f32* %37 = OpAccessChain vs_TEXCOORD1 %28 
					                                          f32 %38 = OpLoad %37 
					                                          f32 %39 = OpFNegate %38 
					                                          f32 %40 = OpFAdd %33 %39 
					                                                      OpStore %31 %40 
					                                 Private f32* %43 = OpAccessChain %9 %28 
					                                          f32 %44 = OpLoad %43 
					                                          f32 %45 = OpFNegate %44 
					                                   Input f32* %47 = OpAccessChain vs_TEXCOORD1 %46 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpFAdd %45 %48 
					                                 Private f32* %50 = OpAccessChain %42 %28 
					                                                      OpStore %50 %49 
					                                          f32 %54 = OpLoad %31 
					                                         bool %56 = OpFOrdLessThan %54 %55 
					                                                      OpStore %53 %56 
					                                         bool %57 = OpLoad %53 
					                                          i32 %61 = OpSelect %57 %60 %59 
					                                          i32 %63 = OpIMul %61 %62 
					                                         bool %64 = OpINotEqual %63 %59 
					                                                      OpSelectionMerge %66 None 
					                                                      OpBranchConditional %64 %65 %66 
					                                              %65 = OpLabel 
					                                                      OpKill
					                                              %66 = OpLabel 
					                                 Uniform f32* %73 = OpAccessChain %70 %71 
					                                          f32 %74 = OpLoad %73 
					                                 Uniform f32* %76 = OpAccessChain %70 %75 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpFMul %74 %77 
					                                                      OpStore %31 %78 
					                                          f32 %79 = OpLoad %31 
					                                   Input f32* %81 = OpAccessChain vs_TEXCOORD1 %80 
					                                          f32 %82 = OpLoad %81 
					                                          f32 %83 = OpFMul %79 %82 
					                                                      OpStore %31 %83 
					                                          f32 %85 = OpLoad %31 
					                                          f32 %87 = OpExtInst %1 37 %85 %86 
					                                                      OpStore %84 %87 
					                                          f32 %89 = OpLoad %31 
					                                          f32 %91 = OpFMul %89 %90 
					                                                      OpStore %88 %91 
					                                          f32 %92 = OpLoad %84 
					                                          f32 %93 = OpExtInst %1 31 %92 
					                                                      OpStore %84 %93 
					                                 Private f32* %95 = OpAccessChain %42 %28 
					                                          f32 %96 = OpLoad %95 
					                                   Input f32* %97 = OpAccessChain vs_TEXCOORD1 %80 
					                                          f32 %98 = OpLoad %97 
					                                          f32 %99 = OpFMul %96 %98 
					                                         f32 %100 = OpLoad %88 
					                                         f32 %101 = OpFAdd %99 %100 
					                                                      OpStore %94 %101 
					                                         f32 %102 = OpLoad %94 
					                                         f32 %103 = OpExtInst %1 43 %102 %55 %86 
					                                                      OpStore %94 %103 
					                                Private f32* %104 = OpAccessChain %42 %28 
					                                         f32 %105 = OpLoad %104 
					                                  Input f32* %106 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFMul %105 %107 
					                                         f32 %109 = OpLoad %88 
					                                         f32 %110 = OpFNegate %109 
					                                         f32 %111 = OpFAdd %108 %110 
					                                                      OpStore %88 %111 
					                                         f32 %112 = OpLoad %84 
					                                         f32 %113 = OpLoad %94 
					                                         f32 %114 = OpFMul %112 %113 
					                                                      OpStore %84 %114 
					                                Uniform f32* %116 = OpAccessChain %70 %115 
					                                         f32 %117 = OpLoad %116 
					                                Uniform f32* %119 = OpAccessChain %70 %118 
					                                         f32 %120 = OpLoad %119 
					                                       f32_2 %121 = OpCompositeConstruct %117 %120 
					                              Uniform f32_4* %123 = OpAccessChain %70 %59 
					                                       f32_4 %124 = OpLoad %123 
					                                       f32_2 %125 = OpVectorShuffle %124 %124 1 1 
					                                       f32_2 %126 = OpFMul %121 %125 
					                                       f32_4 %128 = OpLoad vs_TEXCOORD5 
					                                       f32_2 %129 = OpVectorShuffle %128 %128 2 3 
					                                       f32_2 %130 = OpFAdd %126 %129 
					                                                      OpStore %42 %130 
					                         read_only Texture2D %132 = OpLoad %131 
					                                     sampler %134 = OpLoad %133 
					                  read_only Texture2DSampled %135 = OpSampledImage %132 %134 
					                                       f32_2 %136 = OpLoad %42 
					                                       f32_4 %137 = OpImageSampleImplicitLod %135 %136 
					                                                      OpStore %9 %137 
					                                       f32_4 %139 = OpLoad %9 
					                              Uniform f32_4* %141 = OpAccessChain %70 %140 
					                                       f32_4 %142 = OpLoad %141 
					                                       f32_4 %143 = OpFMul %139 %142 
					                                                      OpStore %138 %143 
					                                       f32_4 %148 = OpLoad %147 
					                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
					                              Uniform f32_4* %151 = OpAccessChain %70 %150 
					                                       f32_4 %152 = OpLoad %151 
					                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
					                                       f32_3 %154 = OpFMul %149 %153 
					                                                      OpStore %146 %154 
					                                Uniform f32* %155 = OpAccessChain %70 %60 
					                                         f32 %156 = OpLoad %155 
					                                Uniform f32* %158 = OpAccessChain %70 %157 
					                                         f32 %159 = OpLoad %158 
					                                       f32_2 %160 = OpCompositeConstruct %156 %159 
					                              Uniform f32_4* %161 = OpAccessChain %70 %59 
					                                       f32_4 %162 = OpLoad %161 
					                                       f32_2 %163 = OpVectorShuffle %162 %162 1 1 
					                                       f32_2 %164 = OpFMul %160 %163 
					                                       f32_4 %165 = OpLoad vs_TEXCOORD5 
					                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
					                                       f32_2 %167 = OpFAdd %164 %166 
					                                                      OpStore %42 %167 
					                         read_only Texture2D %170 = OpLoad %169 
					                                     sampler %172 = OpLoad %171 
					                  read_only Texture2DSampled %173 = OpSampledImage %170 %172 
					                                       f32_2 %174 = OpLoad %42 
					                                       f32_4 %175 = OpImageSampleImplicitLod %173 %174 
					                                                      OpStore %168 %175 
					                                       f32_3 %177 = OpLoad %146 
					                                       f32_4 %178 = OpLoad %168 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                       f32_3 %180 = OpFMul %177 %179 
					                                       f32_4 %181 = OpLoad %176 
					                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
					                                                      OpStore %176 %182 
					                                Private f32* %184 = OpAccessChain %168 %26 
					                                         f32 %185 = OpLoad %184 
					                                Uniform f32* %186 = OpAccessChain %70 %150 %26 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFMul %185 %187 
					                                                      OpStore %183 %188 
					                                       f32_4 %189 = OpLoad %176 
					                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
					                                         f32 %191 = OpLoad %183 
					                                       f32_3 %192 = OpCompositeConstruct %191 %191 %191 
					                                       f32_3 %193 = OpFMul %190 %192 
					                                                      OpStore %146 %193 
					                                       f32_4 %194 = OpLoad %138 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                       f32_4 %196 = OpLoad %138 
					                                       f32_3 %197 = OpVectorShuffle %196 %196 3 3 3 
					                                       f32_3 %198 = OpFMul %195 %197 
					                                       f32_3 %199 = OpLoad %146 
					                                       f32_3 %200 = OpFNegate %199 
					                                       f32_3 %201 = OpFAdd %198 %200 
					                                       f32_4 %202 = OpLoad %138 
					                                       f32_4 %203 = OpVectorShuffle %202 %201 4 5 6 3 
					                                                      OpStore %138 %203 
					                                Uniform f32* %204 = OpAccessChain %70 %140 %26 
					                                         f32 %205 = OpLoad %204 
					                                Private f32* %206 = OpAccessChain %9 %26 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFMul %205 %207 
					                                         f32 %209 = OpLoad %183 
					                                         f32 %210 = OpFNegate %209 
					                                         f32 %211 = OpFAdd %208 %210 
					                                Private f32* %212 = OpAccessChain %138 %26 
					                                                      OpStore %212 %211 
					                                         f32 %213 = OpLoad %84 
					                                       f32_4 %214 = OpCompositeConstruct %213 %213 %213 %213 
					                                       f32_4 %215 = OpLoad %138 
					                                       f32_4 %216 = OpFMul %214 %215 
					                                                      OpStore %138 %216 
					                                       f32_4 %217 = OpLoad %176 
					                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
					                                         f32 %219 = OpLoad %183 
					                                       f32_3 %220 = OpCompositeConstruct %219 %219 %219 
					                                       f32_3 %221 = OpFMul %218 %220 
					                                       f32_4 %222 = OpLoad %138 
					                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
					                                       f32_3 %224 = OpFAdd %221 %223 
					                                       f32_4 %225 = OpLoad %176 
					                                       f32_4 %226 = OpVectorShuffle %225 %224 4 5 6 3 
					                                                      OpStore %176 %226 
					                                Uniform f32* %227 = OpAccessChain %70 %150 %26 
					                                         f32 %228 = OpLoad %227 
					                                Private f32* %229 = OpAccessChain %168 %26 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFMul %228 %230 
					                                Private f32* %232 = OpAccessChain %138 %26 
					                                         f32 %233 = OpLoad %232 
					                                         f32 %234 = OpFAdd %231 %233 
					                                Private f32* %235 = OpAccessChain %176 %26 
					                                                      OpStore %235 %234 
					                                Uniform f32* %238 = OpAccessChain %70 %237 
					                                         f32 %239 = OpLoad %238 
					                                Uniform f32* %240 = OpAccessChain %70 %75 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpFMul %239 %241 
					                                                      OpStore %236 %242 
					                                         f32 %244 = OpLoad %236 
					                                  Input f32* %245 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %246 = OpLoad %245 
					                                         f32 %247 = OpFMul %244 %246 
					                                                      OpStore %243 %247 
					                                         f32 %248 = OpLoad %236 
					                                  Input f32* %249 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %250 = OpLoad %249 
					                                         f32 %251 = OpFMul %248 %250 
					                                         f32 %252 = OpFAdd %251 %86 
					                                                      OpStore %84 %252 
					                                         f32 %253 = OpLoad %243 
					                                         f32 %254 = OpFMul %253 %90 
					                                         f32 %255 = OpLoad %88 
					                                         f32 %256 = OpFAdd %254 %255 
					                                                      OpStore %88 %256 
					                                         f32 %257 = OpLoad %88 
					                                         f32 %258 = OpLoad %84 
					                                         f32 %259 = OpFDiv %257 %258 
					                                                      OpStore %84 %259 
					                                         f32 %260 = OpLoad %84 
					                                         f32 %261 = OpExtInst %1 43 %260 %55 %86 
					                                                      OpStore %84 %261 
					                                         f32 %262 = OpLoad %84 
					                                         f32 %263 = OpFNegate %262 
					                                         f32 %264 = OpFAdd %263 %86 
					                                                      OpStore %84 %264 
					                                       f32_4 %265 = OpLoad %176 
					                                         f32 %266 = OpLoad %84 
					                                       f32_4 %267 = OpCompositeConstruct %266 %266 %266 %266 
					                                       f32_4 %268 = OpFMul %265 %267 
					                                                      OpStore %176 %268 
					                                       f32_4 %271 = OpLoad %176 
					                                       f32_4 %272 = OpLoad %147 
					                                       f32_4 %273 = OpVectorShuffle %272 %272 3 3 3 3 
					                                       f32_4 %274 = OpFMul %271 %273 
					                                                      OpStore %270 %274 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_ALPHACLIP" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 unused_0_3;
						float _OutlineWidth;
						vec4 unused_0_5[4];
						mat4x4 _EnvMatrix;
						vec4 unused_0_7[7];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_13[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD5;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat6;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat2.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = abs(u_xlat2.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = u_xlat2.ww / u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat2.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat2.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat2.xy;
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
					    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat2.x);
					    u_xlat8.x = abs(u_xlat8.x) * u_xlat12 + u_xlat2.x;
					    u_xlatb12 = glstate_matrix_projection[3].w==0.0;
					    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat12 = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat6.z = u_xlat8.x * 0.5;
					    vs_TEXCOORD1.yw = u_xlat6.xz;
					    u_xlat12 = 0.5 / u_xlat6.x;
					    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
					    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
					    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xyz = u_xlat1.yyy * _EnvMatrix[1].xyz;
					    u_xlat0.xyz = _EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = _EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
					    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat8.x = floor(u_xlat0.x);
					    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "UNITY_UI_ALPHACLIP" }
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
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	float _FaceDilate;
					uniform 	float _OutlineSoftness;
					uniform 	float _OutlineWidth;
					uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
					uniform 	float _WeightNormal;
					uniform 	float _WeightBold;
					uniform 	float _ScaleRatioA;
					uniform 	float _VertexOffsetX;
					uniform 	float _VertexOffsetY;
					uniform 	vec4 _ClipRect;
					uniform 	float _MaskSoftnessX;
					uniform 	float _MaskSoftnessY;
					uniform 	float _GradientScale;
					uniform 	float _ScaleX;
					uniform 	float _ScaleY;
					uniform 	float _PerspectiveFilter;
					uniform 	vec4 _FaceTex_ST;
					uniform 	vec4 _OutlineTex_ST;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD5;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat6;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = abs(u_xlat2.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = u_xlat2.ww / u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat2.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat2.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat2.xy;
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
					    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat2.x);
					    u_xlat8.x = abs(u_xlat8.x) * u_xlat12 + u_xlat2.x;
					    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
					    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat12 = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat6.z = u_xlat8.x * 0.5;
					    vs_TEXCOORD1.yw = u_xlat6.xz;
					    u_xlat12 = 0.5 / u_xlat6.x;
					    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
					    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
					    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
					    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat8.x = floor(u_xlat0.x);
					    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
					in  vec4 vs_COLOR0;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0.w + (-vs_TEXCOORD1.x);
					    u_xlat4 = (-u_xlat10_0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0 = _OutlineWidth * _ScaleRatioA;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD1.y;
					    u_xlat8.x = min(u_xlat0, 1.0);
					    u_xlat0 = u_xlat0 * 0.5;
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0 = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0);
					    u_xlat4 = u_xlat8.x * u_xlat12;
					    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
					    u_xlat10_1 = texture(_OutlineTex, u_xlat8.xy);
					    u_xlat1 = u_xlat10_1 * _OutlineColor;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
					    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
					    u_xlat10_3 = texture(_FaceTex, u_xlat8.xy);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.xyz;
					    u_xlat3.w = u_xlat10_3.w * _FaceColor.w;
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
					    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
					    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0 = u_xlat8.x * 0.5 + u_xlat0;
					    u_xlat0 = u_xlat0 / u_xlat4;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat4 = u_xlat1.w * u_xlat0 + -0.00100000005;
					    u_xlat1 = vec4(u_xlat0) * u_xlat1;
					    SV_Target0 = u_xlat1 * vs_COLOR0.wwww;
					    u_xlatb0 = u_xlat4<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "UNITY_UI_ALPHACLIP" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 535
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %12 %121 %125 %126 %129 %131 %134 %261 %270 %376 %470 %503 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpDecorate %12 Location 12 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpDecorate %22 ArrayStride 22 
					                                                      OpMemberDecorate %23 0 Offset 23 
					                                                      OpMemberDecorate %23 1 Offset 23 
					                                                      OpMemberDecorate %23 2 Offset 23 
					                                                      OpMemberDecorate %23 3 Offset 23 
					                                                      OpMemberDecorate %23 4 Offset 23 
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
					                                                      OpDecorate %23 Block 
					                                                      OpDecorate %25 DescriptorSet 25 
					                                                      OpDecorate %25 Binding 25 
					                                                      OpMemberDecorate %119 0 BuiltIn 119 
					                                                      OpMemberDecorate %119 1 BuiltIn 119 
					                                                      OpMemberDecorate %119 2 BuiltIn 119 
					                                                      OpDecorate %119 Block 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %125 Location 125 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %126 Location 126 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 129 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %134 Location 134 
					                                                      OpDecorate vs_TEXCOORD2 Location 261 
					                                                      OpDecorate %270 Location 270 
					                                                      OpDecorate vs_TEXCOORD1 Location 376 
					                                                      OpDecorate vs_TEXCOORD3 Location 470 
					                                                      OpDecorate vs_TEXCOORD5 Location 503 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                                 Input f32_4* %12 = OpVariable Input 
					                                              %13 = OpTypeVector %6 2 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %10 %17 
					                                              %19 = OpTypeArray %10 %17 
					                                              %20 = OpTypeArray %10 %17 
					                                              %21 = OpTypeArray %10 %17 
					                                              %22 = OpTypeArray %10 %17 
					                                              %23 = OpTypeStruct %7 %10 %18 %19 %20 %21 %6 %6 %6 %22 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 %10 %10 
					                                              %24 = OpTypePointer Uniform %23 
					Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
					                                              %26 = OpTypeInt 32 1 
					                                          i32 %27 = OpConstant 13 
					                                              %28 = OpTypePointer Uniform %6 
					                                          i32 %31 = OpConstant 14 
					                                              %38 = OpTypePointer Private %10 
					                               Private f32_4* %39 = OpVariable Private 
					                                          i32 %42 = OpConstant 2 
					                                          i32 %43 = OpConstant 1 
					                                              %44 = OpTypePointer Uniform %10 
					                                          i32 %48 = OpConstant 0 
					                               Private f32_4* %63 = OpVariable Private 
					                                          i32 %65 = OpConstant 3 
					                                              %83 = OpTypePointer Uniform %7 
					                               Private f32_4* %89 = OpVariable Private 
					                                          i32 %92 = OpConstant 5 
					                                         u32 %117 = OpConstant 1 
					                                             %118 = OpTypeArray %6 %117 
					                                             %119 = OpTypeStruct %10 %6 %118 
					                                             %120 = OpTypePointer Output %119 
					        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
					                                             %123 = OpTypePointer Output %10 
					                               Output f32_4* %125 = OpVariable Output 
					                                Input f32_4* %126 = OpVariable Input 
					                                             %128 = OpTypePointer Output %13 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %130 = OpTypePointer Input %13 
					                                Input f32_2* %131 = OpVariable Input 
					                                             %133 = OpTypePointer Input %7 
					                                Input f32_3* %134 = OpVariable Input 
					                                         u32 %140 = OpConstant 0 
					                                             %141 = OpTypePointer Private %6 
					                                         u32 %154 = OpConstant 2 
					                                             %156 = OpTypePointer Private %13 
					                              Private f32_2* %157 = OpVariable Private 
					                                         i32 %201 = OpConstant 4 
					                                         i32 %223 = OpConstant 19 
					                                         i32 %226 = OpConstant 20 
					                                Private f32* %240 = OpVariable Private 
					                                         i32 %246 = OpConstant 16 
					                                         i32 %249 = OpConstant 17 
					                                         f32 %253 = OpConstant 3,674022E-40 
					                                       f32_2 %254 = OpConstantComposite %253 %253 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Private f32* %269 = OpVariable Private 
					                                Input f32_2* %270 = OpVariable Input 
					                                             %271 = OpTypePointer Input %6 
					                                         i32 %275 = OpConstant 18 
					                                         f32 %283 = OpConstant 3,674022E-40 
					                                         i32 %285 = OpConstant 21 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %313 = OpTypeBool 
					                                             %314 = OpTypePointer Private %313 
					                               Private bool* %315 = OpVariable Private 
					                                         u32 %316 = OpConstant 3 
					                                         f32 %319 = OpConstant 3,674022E-40 
					                              Private f32_3* %321 = OpVariable Private 
					                                             %323 = OpTypePointer Function %6 
					                               Private bool* %333 = OpVariable Private 
					                                         i32 %340 = OpConstant 10 
					                                         i32 %344 = OpConstant 11 
					                                         i32 %359 = OpConstant 6 
					                                         i32 %366 = OpConstant 12 
					                                         f32 %373 = OpConstant 3,674022E-40 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                         i32 %384 = OpConstant 8 
					                                         i32 %392 = OpConstant 7 
					                                             %412 = OpTypePointer Output %6 
					                                         i32 %425 = OpConstant 15 
					                                         f32 %428 = OpConstant 3,674022E-40 
					                                       f32_4 %429 = OpConstantComposite %428 %428 %428 %428 
					                                         f32 %432 = OpConstant 3,674022E-40 
					                                       f32_4 %433 = OpConstantComposite %432 %432 %432 %432 
					                                         f32 %437 = OpConstant 3,674022E-40 
					                                       f32_2 %438 = OpConstantComposite %437 %437 
					                                         i32 %456 = OpConstant 9 
					                                             %469 = OpTypePointer Output %7 
					                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
					                                         f32 %481 = OpConstant 3,674022E-40 
					                                         f32 %491 = OpConstant 3,674022E-40 
					                                         f32 %498 = OpConstant 3,674022E-40 
					                                       f32_2 %499 = OpConstantComposite %498 %498 
					                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
					                                         i32 %506 = OpConstant 22 
					                                         i32 %519 = OpConstant 23 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %324 = OpVariable Function 
					                                        f32_4 %14 = OpLoad %12 
					                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
					                                 Uniform f32* %29 = OpAccessChain %25 %27 
					                                          f32 %30 = OpLoad %29 
					                                 Uniform f32* %32 = OpAccessChain %25 %31 
					                                          f32 %33 = OpLoad %32 
					                                        f32_2 %34 = OpCompositeConstruct %30 %33 
					                                        f32_2 %35 = OpFAdd %15 %34 
					                                        f32_3 %36 = OpLoad %9 
					                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
					                                                      OpStore %9 %37 
					                                        f32_3 %40 = OpLoad %9 
					                                        f32_4 %41 = OpVectorShuffle %40 %40 1 1 1 1 
					                               Uniform f32_4* %45 = OpAccessChain %25 %42 %43 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_4 %47 = OpFMul %41 %46 
					                                                      OpStore %39 %47 
					                               Uniform f32_4* %49 = OpAccessChain %25 %42 %48 
					                                        f32_4 %50 = OpLoad %49 
					                                        f32_3 %51 = OpLoad %9 
					                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 0 0 
					                                        f32_4 %53 = OpFMul %50 %52 
					                                        f32_4 %54 = OpLoad %39 
					                                        f32_4 %55 = OpFAdd %53 %54 
					                                                      OpStore %39 %55 
					                               Uniform f32_4* %56 = OpAccessChain %25 %42 %42 
					                                        f32_4 %57 = OpLoad %56 
					                                        f32_4 %58 = OpLoad %12 
					                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
					                                        f32_4 %60 = OpFMul %57 %59 
					                                        f32_4 %61 = OpLoad %39 
					                                        f32_4 %62 = OpFAdd %60 %61 
					                                                      OpStore %39 %62 
					                                        f32_4 %64 = OpLoad %39 
					                               Uniform f32_4* %66 = OpAccessChain %25 %42 %65 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_4 %68 = OpFAdd %64 %67 
					                                                      OpStore %63 %68 
					                               Uniform f32_4* %69 = OpAccessChain %25 %42 %65 
					                                        f32_4 %70 = OpLoad %69 
					                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                        f32_4 %72 = OpLoad %12 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
					                                        f32_3 %74 = OpFMul %71 %73 
					                                        f32_4 %75 = OpLoad %39 
					                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
					                                        f32_3 %77 = OpFAdd %74 %76 
					                                        f32_4 %78 = OpLoad %39 
					                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
					                                                      OpStore %39 %79 
					                                        f32_4 %80 = OpLoad %39 
					                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
					                                        f32_3 %82 = OpFNegate %81 
					                               Uniform f32_3* %84 = OpAccessChain %25 %48 
					                                        f32_3 %85 = OpLoad %84 
					                                        f32_3 %86 = OpFAdd %82 %85 
					                                        f32_4 %87 = OpLoad %39 
					                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
					                                                      OpStore %39 %88 
					                                        f32_4 %90 = OpLoad %63 
					                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
					                               Uniform f32_4* %93 = OpAccessChain %25 %92 %43 
					                                        f32_4 %94 = OpLoad %93 
					                                        f32_4 %95 = OpFMul %91 %94 
					                                                      OpStore %89 %95 
					                               Uniform f32_4* %96 = OpAccessChain %25 %92 %48 
					                                        f32_4 %97 = OpLoad %96 
					                                        f32_4 %98 = OpLoad %63 
					                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
					                                       f32_4 %100 = OpFMul %97 %99 
					                                       f32_4 %101 = OpLoad %89 
					                                       f32_4 %102 = OpFAdd %100 %101 
					                                                      OpStore %89 %102 
					                              Uniform f32_4* %103 = OpAccessChain %25 %92 %42 
					                                       f32_4 %104 = OpLoad %103 
					                                       f32_4 %105 = OpLoad %63 
					                                       f32_4 %106 = OpVectorShuffle %105 %105 2 2 2 2 
					                                       f32_4 %107 = OpFMul %104 %106 
					                                       f32_4 %108 = OpLoad %89 
					                                       f32_4 %109 = OpFAdd %107 %108 
					                                                      OpStore %89 %109 
					                              Uniform f32_4* %110 = OpAccessChain %25 %92 %65 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_4 %112 = OpLoad %63 
					                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
					                                       f32_4 %114 = OpFMul %111 %113 
					                                       f32_4 %115 = OpLoad %89 
					                                       f32_4 %116 = OpFAdd %114 %115 
					                                                      OpStore %63 %116 
					                                       f32_4 %122 = OpLoad %63 
					                               Output f32_4* %124 = OpAccessChain %121 %48 
					                                                      OpStore %124 %122 
					                                       f32_4 %127 = OpLoad %126 
					                                                      OpStore %125 %127 
					                                       f32_2 %132 = OpLoad %131 
					                                                      OpStore vs_TEXCOORD0 %132 
					                                       f32_3 %135 = OpLoad %134 
					                              Uniform f32_4* %136 = OpAccessChain %25 %65 %48 
					                                       f32_4 %137 = OpLoad %136 
					                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
					                                         f32 %139 = OpDot %135 %138 
					                                Private f32* %142 = OpAccessChain %63 %140 
					                                                      OpStore %142 %139 
					                                       f32_3 %143 = OpLoad %134 
					                              Uniform f32_4* %144 = OpAccessChain %25 %65 %43 
					                                       f32_4 %145 = OpLoad %144 
					                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
					                                         f32 %147 = OpDot %143 %146 
					                                Private f32* %148 = OpAccessChain %63 %117 
					                                                      OpStore %148 %147 
					                                       f32_3 %149 = OpLoad %134 
					                              Uniform f32_4* %150 = OpAccessChain %25 %65 %42 
					                                       f32_4 %151 = OpLoad %150 
					                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
					                                         f32 %153 = OpDot %149 %152 
					                                Private f32* %155 = OpAccessChain %63 %154 
					                                                      OpStore %155 %153 
					                                       f32_4 %158 = OpLoad %63 
					                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                                       f32_4 %160 = OpLoad %63 
					                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
					                                         f32 %162 = OpDot %159 %161 
					                                Private f32* %163 = OpAccessChain %157 %140 
					                                                      OpStore %163 %162 
					                                Private f32* %164 = OpAccessChain %157 %140 
					                                         f32 %165 = OpLoad %164 
					                                         f32 %166 = OpExtInst %1 32 %165 
					                                Private f32* %167 = OpAccessChain %157 %140 
					                                                      OpStore %167 %166 
					                                       f32_2 %168 = OpLoad %157 
					                                       f32_3 %169 = OpVectorShuffle %168 %168 0 0 0 
					                                       f32_4 %170 = OpLoad %63 
					                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
					                                       f32_3 %172 = OpFMul %169 %171 
					                                       f32_4 %173 = OpLoad %63 
					                                       f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
					                                                      OpStore %63 %174 
					                                       f32_4 %175 = OpLoad %39 
					                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
					                                       f32_4 %177 = OpLoad %39 
					                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
					                                         f32 %179 = OpDot %176 %178 
					                                Private f32* %180 = OpAccessChain %157 %140 
					                                                      OpStore %180 %179 
					                                Private f32* %181 = OpAccessChain %157 %140 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpExtInst %1 32 %182 
					                                Private f32* %184 = OpAccessChain %157 %140 
					                                                      OpStore %184 %183 
					                                       f32_2 %185 = OpLoad %157 
					                                       f32_3 %186 = OpVectorShuffle %185 %185 0 0 0 
					                                       f32_4 %187 = OpLoad %39 
					                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
					                                       f32_3 %189 = OpFMul %186 %188 
					                                       f32_4 %190 = OpLoad %89 
					                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
					                                                      OpStore %89 %191 
					                                       f32_4 %192 = OpLoad %63 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                       f32_4 %194 = OpLoad %89 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                         f32 %196 = OpDot %193 %195 
					                                Private f32* %197 = OpAccessChain %157 %140 
					                                                      OpStore %197 %196 
					                              Uniform f32_4* %198 = OpAccessChain %25 %43 
					                                       f32_4 %199 = OpLoad %198 
					                                       f32_2 %200 = OpVectorShuffle %199 %199 1 1 
					                              Uniform f32_4* %202 = OpAccessChain %25 %201 %43 
					                                       f32_4 %203 = OpLoad %202 
					                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
					                                       f32_2 %205 = OpFMul %200 %204 
					                                       f32_4 %206 = OpLoad %63 
					                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 2 3 
					                                                      OpStore %63 %207 
					                              Uniform f32_4* %208 = OpAccessChain %25 %201 %48 
					                                       f32_4 %209 = OpLoad %208 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
					                              Uniform f32_4* %211 = OpAccessChain %25 %43 
					                                       f32_4 %212 = OpLoad %211 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 0 
					                                       f32_2 %214 = OpFMul %210 %213 
					                                       f32_4 %215 = OpLoad %63 
					                                       f32_2 %216 = OpVectorShuffle %215 %215 0 1 
					                                       f32_2 %217 = OpFAdd %214 %216 
					                                       f32_4 %218 = OpLoad %63 
					                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
					                                                      OpStore %63 %219 
					                                       f32_4 %220 = OpLoad %63 
					                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
					                                       f32_2 %222 = OpExtInst %1 4 %221 
					                                Uniform f32* %224 = OpAccessChain %25 %223 
					                                         f32 %225 = OpLoad %224 
					                                Uniform f32* %227 = OpAccessChain %25 %226 
					                                         f32 %228 = OpLoad %227 
					                                       f32_2 %229 = OpCompositeConstruct %225 %228 
					                                       f32_2 %230 = OpFMul %222 %229 
					                                       f32_4 %231 = OpLoad %63 
					                                       f32_4 %232 = OpVectorShuffle %231 %230 4 5 2 3 
					                                                      OpStore %63 %232 
					                                       f32_4 %233 = OpLoad %63 
					                                       f32_2 %234 = OpVectorShuffle %233 %233 3 3 
					                                       f32_4 %235 = OpLoad %63 
					                                       f32_2 %236 = OpVectorShuffle %235 %235 0 1 
					                                       f32_2 %237 = OpFDiv %234 %236 
					                                       f32_4 %238 = OpLoad %63 
					                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 2 3 
					                                                      OpStore %63 %239 
					                                       f32_4 %241 = OpLoad %63 
					                                       f32_2 %242 = OpVectorShuffle %241 %241 0 1 
					                                       f32_4 %243 = OpLoad %63 
					                                       f32_2 %244 = OpVectorShuffle %243 %243 0 1 
					                                         f32 %245 = OpDot %242 %244 
					                                                      OpStore %240 %245 
					                                Uniform f32* %247 = OpAccessChain %25 %246 
					                                         f32 %248 = OpLoad %247 
					                                Uniform f32* %250 = OpAccessChain %25 %249 
					                                         f32 %251 = OpLoad %250 
					                                       f32_2 %252 = OpCompositeConstruct %248 %251 
					                                       f32_2 %255 = OpFMul %252 %254 
					                                       f32_4 %256 = OpLoad %63 
					                                       f32_2 %257 = OpVectorShuffle %256 %256 0 1 
					                                       f32_2 %258 = OpFAdd %255 %257 
					                                       f32_4 %259 = OpLoad %63 
					                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 2 3 
					                                                      OpStore %63 %260 
					                                       f32_4 %262 = OpLoad %63 
					                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
					                                       f32_2 %264 = OpFDiv %254 %263 
					                                       f32_4 %265 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %266 = OpVectorShuffle %265 %264 0 1 4 5 
					                                                      OpStore vs_TEXCOORD2 %266 
					                                         f32 %267 = OpLoad %240 
					                                         f32 %268 = OpExtInst %1 32 %267 
					                                                      OpStore %240 %268 
					                                  Input f32* %272 = OpAccessChain %270 %117 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpExtInst %1 4 %273 
					                                Uniform f32* %276 = OpAccessChain %25 %275 
					                                         f32 %277 = OpLoad %276 
					                                         f32 %278 = OpFMul %274 %277 
					                                                      OpStore %269 %278 
					                                         f32 %279 = OpLoad %240 
					                                         f32 %280 = OpLoad %269 
					                                         f32 %281 = OpFMul %279 %280 
					                                                      OpStore %240 %281 
					                                         f32 %282 = OpLoad %240 
					                                         f32 %284 = OpFMul %282 %283 
					                                                      OpStore %269 %284 
					                                Uniform f32* %286 = OpAccessChain %25 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFNegate %287 
					                                         f32 %290 = OpFAdd %288 %289 
					                                Private f32* %291 = OpAccessChain %63 %140 
					                                                      OpStore %291 %290 
					                                         f32 %292 = OpLoad %269 
					                                         f32 %293 = OpExtInst %1 4 %292 
					                                Private f32* %294 = OpAccessChain %63 %140 
					                                         f32 %295 = OpLoad %294 
					                                         f32 %296 = OpFMul %293 %295 
					                                Private f32* %297 = OpAccessChain %63 %140 
					                                                      OpStore %297 %296 
					                                         f32 %298 = OpLoad %240 
					                                         f32 %299 = OpFMul %298 %283 
					                                Private f32* %300 = OpAccessChain %63 %140 
					                                         f32 %301 = OpLoad %300 
					                                         f32 %302 = OpFNegate %301 
					                                         f32 %303 = OpFAdd %299 %302 
					                                                      OpStore %240 %303 
					                                Private f32* %304 = OpAccessChain %157 %140 
					                                         f32 %305 = OpLoad %304 
					                                         f32 %306 = OpExtInst %1 4 %305 
					                                         f32 %307 = OpLoad %240 
					                                         f32 %308 = OpFMul %306 %307 
					                                Private f32* %309 = OpAccessChain %63 %140 
					                                         f32 %310 = OpLoad %309 
					                                         f32 %311 = OpFAdd %308 %310 
					                                Private f32* %312 = OpAccessChain %157 %140 
					                                                      OpStore %312 %311 
					                                Uniform f32* %317 = OpAccessChain %25 %201 %65 %316 
					                                         f32 %318 = OpLoad %317 
					                                        bool %320 = OpFOrdEqual %318 %319 
					                                                      OpStore %315 %320 
					                                        bool %322 = OpLoad %315 
					                                                      OpSelectionMerge %326 None 
					                                                      OpBranchConditional %322 %325 %329 
					                                             %325 = OpLabel 
					                                Private f32* %327 = OpAccessChain %157 %140 
					                                         f32 %328 = OpLoad %327 
					                                                      OpStore %324 %328 
					                                                      OpBranch %326 
					                                             %329 = OpLabel 
					                                         f32 %330 = OpLoad %269 
					                                                      OpStore %324 %330 
					                                                      OpBranch %326 
					                                             %326 = OpLabel 
					                                         f32 %331 = OpLoad %324 
					                                Private f32* %332 = OpAccessChain %321 %140 
					                                                      OpStore %332 %331 
					                                  Input f32* %334 = OpAccessChain %270 %117 
					                                         f32 %335 = OpLoad %334 
					                                        bool %336 = OpFOrdGreaterThanEqual %319 %335 
					                                                      OpStore %333 %336 
					                                        bool %337 = OpLoad %333 
					                                         f32 %338 = OpSelect %337 %289 %319 
					                                Private f32* %339 = OpAccessChain %157 %140 
					                                                      OpStore %339 %338 
					                                Uniform f32* %341 = OpAccessChain %25 %340 
					                                         f32 %342 = OpLoad %341 
					                                         f32 %343 = OpFNegate %342 
					                                Uniform f32* %345 = OpAccessChain %25 %344 
					                                         f32 %346 = OpLoad %345 
					                                         f32 %347 = OpFAdd %343 %346 
					                                                      OpStore %240 %347 
					                                Private f32* %348 = OpAccessChain %157 %140 
					                                         f32 %349 = OpLoad %348 
					                                         f32 %350 = OpLoad %240 
					                                         f32 %351 = OpFMul %349 %350 
					                                Uniform f32* %352 = OpAccessChain %25 %340 
					                                         f32 %353 = OpLoad %352 
					                                         f32 %354 = OpFAdd %351 %353 
					                                Private f32* %355 = OpAccessChain %157 %140 
					                                                      OpStore %355 %354 
					                                Private f32* %356 = OpAccessChain %157 %140 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %358 = OpFMul %357 %253 
					                                Uniform f32* %360 = OpAccessChain %25 %359 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpFAdd %358 %361 
					                                Private f32* %363 = OpAccessChain %157 %140 
					                                                      OpStore %363 %362 
					                                Private f32* %364 = OpAccessChain %157 %140 
					                                         f32 %365 = OpLoad %364 
					                                Uniform f32* %367 = OpAccessChain %25 %366 
					                                         f32 %368 = OpLoad %367 
					                                         f32 %369 = OpFMul %365 %368 
					                                Private f32* %370 = OpAccessChain %157 %140 
					                                                      OpStore %370 %369 
					                                Private f32* %371 = OpAccessChain %157 %140 
					                                         f32 %372 = OpLoad %371 
					                                         f32 %374 = OpFMul %372 %373 
					                                Private f32* %375 = OpAccessChain %321 %154 
					                                                      OpStore %375 %374 
					                                       f32_3 %377 = OpLoad %321 
					                                       f32_2 %378 = OpVectorShuffle %377 %377 0 2 
					                                       f32_4 %379 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %380 = OpVectorShuffle %379 %378 0 4 2 5 
					                                                      OpStore vs_TEXCOORD1 %380 
					                                Private f32* %381 = OpAccessChain %321 %140 
					                                         f32 %382 = OpLoad %381 
					                                         f32 %383 = OpFDiv %373 %382 
					                                                      OpStore %240 %383 
					                                Uniform f32* %385 = OpAccessChain %25 %384 
					                                         f32 %386 = OpLoad %385 
					                                         f32 %387 = OpFNegate %386 
					                                Uniform f32* %388 = OpAccessChain %25 %366 
					                                         f32 %389 = OpLoad %388 
					                                         f32 %390 = OpFMul %387 %389 
					                                         f32 %391 = OpFAdd %390 %289 
					                                                      OpStore %269 %391 
					                                Uniform f32* %393 = OpAccessChain %25 %392 
					                                         f32 %394 = OpLoad %393 
					                                         f32 %395 = OpFNegate %394 
					                                Uniform f32* %396 = OpAccessChain %25 %366 
					                                         f32 %397 = OpLoad %396 
					                                         f32 %398 = OpFMul %395 %397 
					                                         f32 %399 = OpLoad %269 
					                                         f32 %400 = OpFAdd %398 %399 
					                                                      OpStore %269 %400 
					                                         f32 %401 = OpLoad %269 
					                                         f32 %402 = OpFMul %401 %373 
					                                         f32 %403 = OpLoad %240 
					                                         f32 %404 = OpFNegate %403 
					                                         f32 %405 = OpFAdd %402 %404 
					                                                      OpStore %269 %405 
					                                Private f32* %406 = OpAccessChain %157 %140 
					                                         f32 %407 = OpLoad %406 
					                                         f32 %408 = OpFNegate %407 
					                                         f32 %409 = OpFMul %408 %373 
					                                         f32 %410 = OpLoad %269 
					                                         f32 %411 = OpFAdd %409 %410 
					                                 Output f32* %413 = OpAccessChain vs_TEXCOORD1 %140 
					                                                      OpStore %413 %411 
					                                Private f32* %414 = OpAccessChain %157 %140 
					                                         f32 %415 = OpLoad %414 
					                                         f32 %416 = OpFNegate %415 
					                                         f32 %417 = OpFMul %416 %373 
					                                         f32 %418 = OpFAdd %417 %373 
					                                Private f32* %419 = OpAccessChain %157 %140 
					                                                      OpStore %419 %418 
					                                         f32 %420 = OpLoad %240 
					                                Private f32* %421 = OpAccessChain %157 %140 
					                                         f32 %422 = OpLoad %421 
					                                         f32 %423 = OpFAdd %420 %422 
					                                 Output f32* %424 = OpAccessChain vs_TEXCOORD1 %154 
					                                                      OpStore %424 %423 
					                              Uniform f32_4* %426 = OpAccessChain %25 %425 
					                                       f32_4 %427 = OpLoad %426 
					                                       f32_4 %430 = OpExtInst %1 40 %427 %429 
					                                                      OpStore %63 %430 
					                                       f32_4 %431 = OpLoad %63 
					                                       f32_4 %434 = OpExtInst %1 37 %431 %433 
					                                                      OpStore %63 %434 
					                                       f32_3 %435 = OpLoad %9 
					                                       f32_2 %436 = OpVectorShuffle %435 %435 0 1 
					                                       f32_2 %439 = OpFMul %436 %438 
					                                       f32_4 %440 = OpLoad %63 
					                                       f32_2 %441 = OpVectorShuffle %440 %440 0 1 
					                                       f32_2 %442 = OpFNegate %441 
					                                       f32_2 %443 = OpFAdd %439 %442 
					                                       f32_3 %444 = OpLoad %9 
					                                       f32_3 %445 = OpVectorShuffle %444 %443 3 4 2 
					                                                      OpStore %9 %445 
					                                       f32_4 %446 = OpLoad %63 
					                                       f32_2 %447 = OpVectorShuffle %446 %446 2 3 
					                                       f32_2 %448 = OpFNegate %447 
					                                       f32_3 %449 = OpLoad %9 
					                                       f32_2 %450 = OpVectorShuffle %449 %449 0 1 
					                                       f32_2 %451 = OpFAdd %448 %450 
					                                       f32_4 %452 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %453 = OpVectorShuffle %452 %451 4 5 2 3 
					                                                      OpStore vs_TEXCOORD2 %453 
					                                       f32_4 %454 = OpLoad %39 
					                                       f32_3 %455 = OpVectorShuffle %454 %454 1 1 1 
					                              Uniform f32_4* %457 = OpAccessChain %25 %456 %43 
					                                       f32_4 %458 = OpLoad %457 
					                                       f32_3 %459 = OpVectorShuffle %458 %458 0 1 2 
					                                       f32_3 %460 = OpFMul %455 %459 
					                                                      OpStore %9 %460 
					                              Uniform f32_4* %461 = OpAccessChain %25 %456 %48 
					                                       f32_4 %462 = OpLoad %461 
					                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
					                                       f32_4 %464 = OpLoad %39 
					                                       f32_3 %465 = OpVectorShuffle %464 %464 0 0 0 
					                                       f32_3 %466 = OpFMul %463 %465 
					                                       f32_3 %467 = OpLoad %9 
					                                       f32_3 %468 = OpFAdd %466 %467 
					                                                      OpStore %9 %468 
					                              Uniform f32_4* %471 = OpAccessChain %25 %456 %42 
					                                       f32_4 %472 = OpLoad %471 
					                                       f32_3 %473 = OpVectorShuffle %472 %472 0 1 2 
					                                       f32_4 %474 = OpLoad %39 
					                                       f32_3 %475 = OpVectorShuffle %474 %474 2 2 2 
					                                       f32_3 %476 = OpFMul %473 %475 
					                                       f32_3 %477 = OpLoad %9 
					                                       f32_3 %478 = OpFAdd %476 %477 
					                                                      OpStore vs_TEXCOORD3 %478 
					                                  Input f32* %479 = OpAccessChain %270 %140 
					                                         f32 %480 = OpLoad %479 
					                                         f32 %482 = OpFMul %480 %481 
					                                Private f32* %483 = OpAccessChain %9 %140 
					                                                      OpStore %483 %482 
					                                Private f32* %484 = OpAccessChain %9 %140 
					                                         f32 %485 = OpLoad %484 
					                                         f32 %486 = OpExtInst %1 8 %485 
					                                Private f32* %487 = OpAccessChain %157 %140 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %157 %140 
					                                         f32 %489 = OpLoad %488 
					                                         f32 %490 = OpFNegate %489 
					                                         f32 %492 = OpFMul %490 %491 
					                                  Input f32* %493 = OpAccessChain %270 %140 
					                                         f32 %494 = OpLoad %493 
					                                         f32 %495 = OpFAdd %492 %494 
					                                Private f32* %496 = OpAccessChain %157 %117 
					                                                      OpStore %496 %495 
					                                       f32_2 %497 = OpLoad %157 
					                                       f32_2 %500 = OpFMul %497 %499 
					                                       f32_3 %501 = OpLoad %9 
					                                       f32_3 %502 = OpVectorShuffle %501 %500 3 4 2 
					                                                      OpStore %9 %502 
					                                       f32_3 %504 = OpLoad %9 
					                                       f32_2 %505 = OpVectorShuffle %504 %504 0 1 
					                              Uniform f32_4* %507 = OpAccessChain %25 %506 
					                                       f32_4 %508 = OpLoad %507 
					                                       f32_2 %509 = OpVectorShuffle %508 %508 0 1 
					                                       f32_2 %510 = OpFMul %505 %509 
					                              Uniform f32_4* %511 = OpAccessChain %25 %506 
					                                       f32_4 %512 = OpLoad %511 
					                                       f32_2 %513 = OpVectorShuffle %512 %512 2 3 
					                                       f32_2 %514 = OpFAdd %510 %513 
					                                       f32_4 %515 = OpLoad vs_TEXCOORD5 
					                                       f32_4 %516 = OpVectorShuffle %515 %514 4 5 2 3 
					                                                      OpStore vs_TEXCOORD5 %516 
					                                       f32_3 %517 = OpLoad %9 
					                                       f32_2 %518 = OpVectorShuffle %517 %517 0 1 
					                              Uniform f32_4* %520 = OpAccessChain %25 %519 
					                                       f32_4 %521 = OpLoad %520 
					                                       f32_2 %522 = OpVectorShuffle %521 %521 0 1 
					                                       f32_2 %523 = OpFMul %518 %522 
					                              Uniform f32_4* %524 = OpAccessChain %25 %519 
					                                       f32_4 %525 = OpLoad %524 
					                                       f32_2 %526 = OpVectorShuffle %525 %525 2 3 
					                                       f32_2 %527 = OpFAdd %523 %526 
					                                       f32_4 %528 = OpLoad vs_TEXCOORD5 
					                                       f32_4 %529 = OpVectorShuffle %528 %527 0 1 4 5 
					                                                      OpStore vs_TEXCOORD5 %529 
					                                 Output f32* %530 = OpAccessChain %121 %48 %117 
					                                         f32 %531 = OpLoad %530 
					                                         f32 %532 = OpFNegate %531 
					                                 Output f32* %533 = OpAccessChain %121 %48 %117 
					                                                      OpStore %533 %532 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 298
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %22 %35 %127 %145 %282 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %12 RelaxedPrecision 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %16 RelaxedPrecision 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %17 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 22 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 35 
					                                                      OpDecorate %44 RelaxedPrecision 
					                                                      OpDecorate %45 RelaxedPrecision 
					                                                      OpMemberDecorate %68 0 Offset 68 
					                                                      OpMemberDecorate %68 1 Offset 68 
					                                                      OpMemberDecorate %68 2 Offset 68 
					                                                      OpMemberDecorate %68 3 RelaxedPrecision 
					                                                      OpMemberDecorate %68 3 Offset 68 
					                                                      OpMemberDecorate %68 4 Offset 68 
					                                                      OpMemberDecorate %68 5 Offset 68 
					                                                      OpMemberDecorate %68 6 Offset 68 
					                                                      OpMemberDecorate %68 7 RelaxedPrecision 
					                                                      OpMemberDecorate %68 7 Offset 68 
					                                                      OpMemberDecorate %68 8 Offset 68 
					                                                      OpMemberDecorate %68 9 Offset 68 
					                                                      OpDecorate %68 Block 
					                                                      OpDecorate %70 DescriptorSet 70 
					                                                      OpDecorate %70 Binding 70 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD5 Location 127 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 DescriptorSet 131 
					                                                      OpDecorate %131 Binding 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %133 DescriptorSet 133 
					                                                      OpDecorate %133 Binding 133 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %145 Location 145 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %170 DescriptorSet 170 
					                                                      OpDecorate %170 Binding 170 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %172 DescriptorSet 172 
					                                                      OpDecorate %172 Binding 172 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %212 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %219 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %232 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %282 Location 282 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
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
					                                              %20 = OpTypeVector %6 2 
					                                              %21 = OpTypePointer Input %20 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %25 = OpTypeInt 32 0 
					                                          u32 %26 = OpConstant 3 
					                                          u32 %28 = OpConstant 0 
					                                              %29 = OpTypePointer Private %6 
					                                 Private f32* %31 = OpVariable Private 
					                                              %34 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                              %36 = OpTypePointer Input %6 
					                                              %41 = OpTypePointer Private %20 
					                               Private f32_2* %42 = OpVariable Private 
					                                          u32 %46 = OpConstant 2 
					                                              %51 = OpTypeBool 
					                                              %52 = OpTypePointer Private %51 
					                                Private bool* %53 = OpVariable Private 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                              %58 = OpTypeInt 32 1 
					                                          i32 %59 = OpConstant 0 
					                                          i32 %60 = OpConstant 1 
					                                          i32 %62 = OpConstant -1 
					                                              %68 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 
					                                              %69 = OpTypePointer Uniform %68 
					Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32;}* %70 = OpVariable Uniform 
					                                          i32 %71 = OpConstant 8 
					                                              %72 = OpTypePointer Uniform %6 
					                                          i32 %75 = OpConstant 9 
					                                          u32 %80 = OpConstant 1 
					                                 Private f32* %84 = OpVariable Private 
					                                          f32 %86 = OpConstant 3,674022E-40 
					                                 Private f32* %88 = OpVariable Private 
					                                          f32 %90 = OpConstant 3,674022E-40 
					                                 Private f32* %94 = OpVariable Private 
					                                         i32 %115 = OpConstant 5 
					                                         i32 %118 = OpConstant 6 
					                                             %122 = OpTypePointer Uniform %7 
					                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
					        UniformConstant read_only Texture2D* %131 = OpVariable UniformConstant 
					                    UniformConstant sampler* %133 = OpVariable UniformConstant 
					                              Private f32_4* %138 = OpVariable Private 
					                                         i32 %140 = OpConstant 7 
					                              Private f32_4* %144 = OpVariable Private 
					                                Input f32_4* %145 = OpVariable Input 
					                                             %146 = OpTypeVector %6 3 
					                                         i32 %149 = OpConstant 3 
					                                         i32 %158 = OpConstant 2 
					                              Private f32_4* %169 = OpVariable Private 
					        UniformConstant read_only Texture2D* %170 = OpVariable UniformConstant 
					                    UniformConstant sampler* %172 = OpVariable UniformConstant 
					                              Private f32_4* %177 = OpVariable Private 
					                                Private f32* %185 = OpVariable Private 
					                                         i32 %241 = OpConstant 4 
					                                         f32 %275 = OpConstant 3,674022E-40 
					                                             %281 = OpTypePointer Output %7 
					                               Output f32_4* %282 = OpVariable Output 
					                               Private bool* %287 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                          read_only Texture2D %13 = OpLoad %12 
					                                      sampler %17 = OpLoad %16 
					                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                          f32 %27 = OpCompositeExtract %24 3 
					                                 Private f32* %30 = OpAccessChain %9 %28 
					                                                      OpStore %30 %27 
					                                 Private f32* %32 = OpAccessChain %9 %28 
					                                          f32 %33 = OpLoad %32 
					                                   Input f32* %37 = OpAccessChain vs_TEXCOORD1 %28 
					                                          f32 %38 = OpLoad %37 
					                                          f32 %39 = OpFNegate %38 
					                                          f32 %40 = OpFAdd %33 %39 
					                                                      OpStore %31 %40 
					                                 Private f32* %43 = OpAccessChain %9 %28 
					                                          f32 %44 = OpLoad %43 
					                                          f32 %45 = OpFNegate %44 
					                                   Input f32* %47 = OpAccessChain vs_TEXCOORD1 %46 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpFAdd %45 %48 
					                                 Private f32* %50 = OpAccessChain %42 %28 
					                                                      OpStore %50 %49 
					                                          f32 %54 = OpLoad %31 
					                                         bool %56 = OpFOrdLessThan %54 %55 
					                                                      OpStore %53 %56 
					                                         bool %57 = OpLoad %53 
					                                          i32 %61 = OpSelect %57 %60 %59 
					                                          i32 %63 = OpIMul %61 %62 
					                                         bool %64 = OpINotEqual %63 %59 
					                                                      OpSelectionMerge %66 None 
					                                                      OpBranchConditional %64 %65 %66 
					                                              %65 = OpLabel 
					                                                      OpKill
					                                              %66 = OpLabel 
					                                 Uniform f32* %73 = OpAccessChain %70 %71 
					                                          f32 %74 = OpLoad %73 
					                                 Uniform f32* %76 = OpAccessChain %70 %75 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpFMul %74 %77 
					                                                      OpStore %31 %78 
					                                          f32 %79 = OpLoad %31 
					                                   Input f32* %81 = OpAccessChain vs_TEXCOORD1 %80 
					                                          f32 %82 = OpLoad %81 
					                                          f32 %83 = OpFMul %79 %82 
					                                                      OpStore %31 %83 
					                                          f32 %85 = OpLoad %31 
					                                          f32 %87 = OpExtInst %1 37 %85 %86 
					                                                      OpStore %84 %87 
					                                          f32 %89 = OpLoad %31 
					                                          f32 %91 = OpFMul %89 %90 
					                                                      OpStore %88 %91 
					                                          f32 %92 = OpLoad %84 
					                                          f32 %93 = OpExtInst %1 31 %92 
					                                                      OpStore %84 %93 
					                                 Private f32* %95 = OpAccessChain %42 %28 
					                                          f32 %96 = OpLoad %95 
					                                   Input f32* %97 = OpAccessChain vs_TEXCOORD1 %80 
					                                          f32 %98 = OpLoad %97 
					                                          f32 %99 = OpFMul %96 %98 
					                                         f32 %100 = OpLoad %88 
					                                         f32 %101 = OpFAdd %99 %100 
					                                                      OpStore %94 %101 
					                                         f32 %102 = OpLoad %94 
					                                         f32 %103 = OpExtInst %1 43 %102 %55 %86 
					                                                      OpStore %94 %103 
					                                Private f32* %104 = OpAccessChain %42 %28 
					                                         f32 %105 = OpLoad %104 
					                                  Input f32* %106 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFMul %105 %107 
					                                         f32 %109 = OpLoad %88 
					                                         f32 %110 = OpFNegate %109 
					                                         f32 %111 = OpFAdd %108 %110 
					                                                      OpStore %88 %111 
					                                         f32 %112 = OpLoad %84 
					                                         f32 %113 = OpLoad %94 
					                                         f32 %114 = OpFMul %112 %113 
					                                                      OpStore %84 %114 
					                                Uniform f32* %116 = OpAccessChain %70 %115 
					                                         f32 %117 = OpLoad %116 
					                                Uniform f32* %119 = OpAccessChain %70 %118 
					                                         f32 %120 = OpLoad %119 
					                                       f32_2 %121 = OpCompositeConstruct %117 %120 
					                              Uniform f32_4* %123 = OpAccessChain %70 %59 
					                                       f32_4 %124 = OpLoad %123 
					                                       f32_2 %125 = OpVectorShuffle %124 %124 1 1 
					                                       f32_2 %126 = OpFMul %121 %125 
					                                       f32_4 %128 = OpLoad vs_TEXCOORD5 
					                                       f32_2 %129 = OpVectorShuffle %128 %128 2 3 
					                                       f32_2 %130 = OpFAdd %126 %129 
					                                                      OpStore %42 %130 
					                         read_only Texture2D %132 = OpLoad %131 
					                                     sampler %134 = OpLoad %133 
					                  read_only Texture2DSampled %135 = OpSampledImage %132 %134 
					                                       f32_2 %136 = OpLoad %42 
					                                       f32_4 %137 = OpImageSampleImplicitLod %135 %136 
					                                                      OpStore %9 %137 
					                                       f32_4 %139 = OpLoad %9 
					                              Uniform f32_4* %141 = OpAccessChain %70 %140 
					                                       f32_4 %142 = OpLoad %141 
					                                       f32_4 %143 = OpFMul %139 %142 
					                                                      OpStore %138 %143 
					                                       f32_4 %147 = OpLoad %145 
					                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
					                              Uniform f32_4* %150 = OpAccessChain %70 %149 
					                                       f32_4 %151 = OpLoad %150 
					                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
					                                       f32_3 %153 = OpFMul %148 %152 
					                                       f32_4 %154 = OpLoad %144 
					                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
					                                                      OpStore %144 %155 
					                                Uniform f32* %156 = OpAccessChain %70 %60 
					                                         f32 %157 = OpLoad %156 
					                                Uniform f32* %159 = OpAccessChain %70 %158 
					                                         f32 %160 = OpLoad %159 
					                                       f32_2 %161 = OpCompositeConstruct %157 %160 
					                              Uniform f32_4* %162 = OpAccessChain %70 %59 
					                                       f32_4 %163 = OpLoad %162 
					                                       f32_2 %164 = OpVectorShuffle %163 %163 1 1 
					                                       f32_2 %165 = OpFMul %161 %164 
					                                       f32_4 %166 = OpLoad vs_TEXCOORD5 
					                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
					                                       f32_2 %168 = OpFAdd %165 %167 
					                                                      OpStore %42 %168 
					                         read_only Texture2D %171 = OpLoad %170 
					                                     sampler %173 = OpLoad %172 
					                  read_only Texture2DSampled %174 = OpSampledImage %171 %173 
					                                       f32_2 %175 = OpLoad %42 
					                                       f32_4 %176 = OpImageSampleImplicitLod %174 %175 
					                                                      OpStore %169 %176 
					                                       f32_4 %178 = OpLoad %144 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                       f32_4 %180 = OpLoad %169 
					                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
					                                       f32_3 %182 = OpFMul %179 %181 
					                                       f32_4 %183 = OpLoad %177 
					                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
					                                                      OpStore %177 %184 
					                                Private f32* %186 = OpAccessChain %169 %26 
					                                         f32 %187 = OpLoad %186 
					                                Uniform f32* %188 = OpAccessChain %70 %149 %26 
					                                         f32 %189 = OpLoad %188 
					                                         f32 %190 = OpFMul %187 %189 
					                                                      OpStore %185 %190 
					                                       f32_4 %191 = OpLoad %177 
					                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
					                                         f32 %193 = OpLoad %185 
					                                       f32_3 %194 = OpCompositeConstruct %193 %193 %193 
					                                       f32_3 %195 = OpFMul %192 %194 
					                                       f32_4 %196 = OpLoad %144 
					                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
					                                                      OpStore %144 %197 
					                                       f32_4 %198 = OpLoad %138 
					                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
					                                       f32_4 %200 = OpLoad %138 
					                                       f32_3 %201 = OpVectorShuffle %200 %200 3 3 3 
					                                       f32_3 %202 = OpFMul %199 %201 
					                                       f32_4 %203 = OpLoad %144 
					                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
					                                       f32_3 %205 = OpFNegate %204 
					                                       f32_3 %206 = OpFAdd %202 %205 
					                                       f32_4 %207 = OpLoad %138 
					                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
					                                                      OpStore %138 %208 
					                                Uniform f32* %209 = OpAccessChain %70 %140 %26 
					                                         f32 %210 = OpLoad %209 
					                                Private f32* %211 = OpAccessChain %9 %26 
					                                         f32 %212 = OpLoad %211 
					                                         f32 %213 = OpFMul %210 %212 
					                                         f32 %214 = OpLoad %185 
					                                         f32 %215 = OpFNegate %214 
					                                         f32 %216 = OpFAdd %213 %215 
					                                Private f32* %217 = OpAccessChain %138 %26 
					                                                      OpStore %217 %216 
					                                         f32 %218 = OpLoad %84 
					                                       f32_4 %219 = OpCompositeConstruct %218 %218 %218 %218 
					                                       f32_4 %220 = OpLoad %138 
					                                       f32_4 %221 = OpFMul %219 %220 
					                                                      OpStore %138 %221 
					                                Uniform f32* %222 = OpAccessChain %70 %149 %26 
					                                         f32 %223 = OpLoad %222 
					                                Private f32* %224 = OpAccessChain %169 %26 
					                                         f32 %225 = OpLoad %224 
					                                         f32 %226 = OpFMul %223 %225 
					                                Private f32* %227 = OpAccessChain %138 %26 
					                                         f32 %228 = OpLoad %227 
					                                         f32 %229 = OpFAdd %226 %228 
					                                Private f32* %230 = OpAccessChain %144 %26 
					                                                      OpStore %230 %229 
					                                       f32_4 %231 = OpLoad %177 
					                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
					                                         f32 %233 = OpLoad %185 
					                                       f32_3 %234 = OpCompositeConstruct %233 %233 %233 
					                                       f32_3 %235 = OpFMul %232 %234 
					                                       f32_4 %236 = OpLoad %138 
					                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
					                                       f32_3 %238 = OpFAdd %235 %237 
					                                       f32_4 %239 = OpLoad %144 
					                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
					                                                      OpStore %144 %240 
					                                Uniform f32* %242 = OpAccessChain %70 %241 
					                                         f32 %243 = OpLoad %242 
					                                Uniform f32* %244 = OpAccessChain %70 %75 
					                                         f32 %245 = OpLoad %244 
					                                         f32 %246 = OpFMul %243 %245 
					                                Private f32* %247 = OpAccessChain %42 %28 
					                                                      OpStore %247 %246 
					                                Private f32* %248 = OpAccessChain %42 %28 
					                                         f32 %249 = OpLoad %248 
					                                  Input f32* %250 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpFMul %249 %251 
					                                                      OpStore %31 %252 
					                                Private f32* %253 = OpAccessChain %42 %28 
					                                         f32 %254 = OpLoad %253 
					                                  Input f32* %255 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %256 = OpLoad %255 
					                                         f32 %257 = OpFMul %254 %256 
					                                         f32 %258 = OpFAdd %257 %86 
					                                                      OpStore %84 %258 
					                                         f32 %259 = OpLoad %31 
					                                         f32 %260 = OpFMul %259 %90 
					                                         f32 %261 = OpLoad %88 
					                                         f32 %262 = OpFAdd %260 %261 
					                                                      OpStore %88 %262 
					                                         f32 %263 = OpLoad %88 
					                                         f32 %264 = OpLoad %84 
					                                         f32 %265 = OpFDiv %263 %264 
					                                                      OpStore %84 %265 
					                                         f32 %266 = OpLoad %84 
					                                         f32 %267 = OpExtInst %1 43 %266 %55 %86 
					                                                      OpStore %84 %267 
					                                         f32 %268 = OpLoad %84 
					                                         f32 %269 = OpFNegate %268 
					                                         f32 %270 = OpFAdd %269 %86 
					                                                      OpStore %84 %270 
					                                Private f32* %271 = OpAccessChain %144 %26 
					                                         f32 %272 = OpLoad %271 
					                                         f32 %273 = OpLoad %84 
					                                         f32 %274 = OpFMul %272 %273 
					                                         f32 %276 = OpFAdd %274 %275 
					                                                      OpStore %88 %276 
					                                         f32 %277 = OpLoad %84 
					                                       f32_4 %278 = OpCompositeConstruct %277 %277 %277 %277 
					                                       f32_4 %279 = OpLoad %144 
					                                       f32_4 %280 = OpFMul %278 %279 
					                                                      OpStore %177 %280 
					                                       f32_4 %283 = OpLoad %177 
					                                       f32_4 %284 = OpLoad %145 
					                                       f32_4 %285 = OpVectorShuffle %284 %284 3 3 3 3 
					                                       f32_4 %286 = OpFMul %283 %285 
					                                                      OpStore %282 %286 
					                                         f32 %288 = OpLoad %88 
					                                        bool %289 = OpFOrdLessThan %288 %55 
					                                                      OpStore %287 %289 
					                                        bool %290 = OpLoad %287 
					                                         i32 %291 = OpSelect %290 %60 %59 
					                                         i32 %292 = OpIMul %291 %62 
					                                        bool %293 = OpINotEqual %292 %59 
					                                                      OpSelectionMerge %295 None 
					                                                      OpBranchConditional %293 %294 %295 
					                                             %294 = OpLabel 
					                                                      OpKill
					                                             %295 = OpLabel 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_CLIP_RECT" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 unused_0_3;
						float _OutlineWidth;
						vec4 unused_0_5[4];
						mat4x4 _EnvMatrix;
						vec4 unused_0_7[7];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_13[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD5;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat6;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat2.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = abs(u_xlat2.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = u_xlat2.ww / u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat2.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat2.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat2.xy;
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
					    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat2.x);
					    u_xlat8.x = abs(u_xlat8.x) * u_xlat12 + u_xlat2.x;
					    u_xlatb12 = glstate_matrix_projection[3].w==0.0;
					    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat12 = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat6.z = u_xlat8.x * 0.5;
					    vs_TEXCOORD1.yw = u_xlat6.xz;
					    u_xlat12 = 0.5 / u_xlat6.x;
					    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
					    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
					    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xyz = u_xlat1.yyy * _EnvMatrix[1].xyz;
					    u_xlat0.xyz = _EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = _EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
					    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat8.x = floor(u_xlat0.x);
					    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "UNITY_UI_CLIP_RECT" }
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
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	float _FaceDilate;
					uniform 	float _OutlineSoftness;
					uniform 	float _OutlineWidth;
					uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
					uniform 	float _WeightNormal;
					uniform 	float _WeightBold;
					uniform 	float _ScaleRatioA;
					uniform 	float _VertexOffsetX;
					uniform 	float _VertexOffsetY;
					uniform 	vec4 _ClipRect;
					uniform 	float _MaskSoftnessX;
					uniform 	float _MaskSoftnessY;
					uniform 	float _GradientScale;
					uniform 	float _ScaleX;
					uniform 	float _ScaleY;
					uniform 	float _PerspectiveFilter;
					uniform 	vec4 _FaceTex_ST;
					uniform 	vec4 _OutlineTex_ST;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD5;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat6;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = abs(u_xlat2.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = u_xlat2.ww / u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat2.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat2.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat2.xy;
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
					    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat2.x);
					    u_xlat8.x = abs(u_xlat8.x) * u_xlat12 + u_xlat2.x;
					    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
					    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat12 = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat6.z = u_xlat8.x * 0.5;
					    vs_TEXCOORD1.yw = u_xlat6.xz;
					    u_xlat12 = 0.5 / u_xlat6.x;
					    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
					    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
					    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
					    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat8.x = floor(u_xlat0.x);
					    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
					uniform 	float _FaceUVSpeedX;
					uniform 	float _FaceUVSpeedY;
					uniform 	vec4 _FaceColor;
					uniform 	float _OutlineSoftness;
					uniform 	float _OutlineUVSpeedX;
					uniform 	float _OutlineUVSpeedY;
					uniform 	vec4 _OutlineColor;
					uniform 	float _OutlineWidth;
					uniform 	float _ScaleRatioA;
					uniform 	vec4 _ClipRect;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
					UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
					in  vec4 vs_COLOR0;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat10_0.w + (-vs_TEXCOORD1.x);
					    u_xlat4 = (-u_xlat10_0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
					    u_xlat8.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
					    u_xlat4 = u_xlat8.x * u_xlat12;
					    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
					    u_xlat10_1 = texture(_OutlineTex, u_xlat8.xy);
					    u_xlat1 = u_xlat10_1 * _OutlineColor;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
					    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
					    u_xlat10_3 = texture(_FaceTex, u_xlat8.xy);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.xyz;
					    u_xlat3.w = u_xlat10_3.w * _FaceColor.w;
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
					    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
					    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x / u_xlat4;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "UNITY_UI_CLIP_RECT" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 535
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %12 %121 %125 %126 %129 %131 %134 %261 %270 %376 %470 %503 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpDecorate %12 Location 12 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpDecorate %22 ArrayStride 22 
					                                                      OpMemberDecorate %23 0 Offset 23 
					                                                      OpMemberDecorate %23 1 Offset 23 
					                                                      OpMemberDecorate %23 2 Offset 23 
					                                                      OpMemberDecorate %23 3 Offset 23 
					                                                      OpMemberDecorate %23 4 Offset 23 
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
					                                                      OpDecorate %23 Block 
					                                                      OpDecorate %25 DescriptorSet 25 
					                                                      OpDecorate %25 Binding 25 
					                                                      OpMemberDecorate %119 0 BuiltIn 119 
					                                                      OpMemberDecorate %119 1 BuiltIn 119 
					                                                      OpMemberDecorate %119 2 BuiltIn 119 
					                                                      OpDecorate %119 Block 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %125 Location 125 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %126 Location 126 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 129 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %134 Location 134 
					                                                      OpDecorate vs_TEXCOORD2 Location 261 
					                                                      OpDecorate %270 Location 270 
					                                                      OpDecorate vs_TEXCOORD1 Location 376 
					                                                      OpDecorate vs_TEXCOORD3 Location 470 
					                                                      OpDecorate vs_TEXCOORD5 Location 503 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                                 Input f32_4* %12 = OpVariable Input 
					                                              %13 = OpTypeVector %6 2 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %10 %17 
					                                              %19 = OpTypeArray %10 %17 
					                                              %20 = OpTypeArray %10 %17 
					                                              %21 = OpTypeArray %10 %17 
					                                              %22 = OpTypeArray %10 %17 
					                                              %23 = OpTypeStruct %7 %10 %18 %19 %20 %21 %6 %6 %6 %22 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 %10 %10 
					                                              %24 = OpTypePointer Uniform %23 
					Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
					                                              %26 = OpTypeInt 32 1 
					                                          i32 %27 = OpConstant 13 
					                                              %28 = OpTypePointer Uniform %6 
					                                          i32 %31 = OpConstant 14 
					                                              %38 = OpTypePointer Private %10 
					                               Private f32_4* %39 = OpVariable Private 
					                                          i32 %42 = OpConstant 2 
					                                          i32 %43 = OpConstant 1 
					                                              %44 = OpTypePointer Uniform %10 
					                                          i32 %48 = OpConstant 0 
					                               Private f32_4* %63 = OpVariable Private 
					                                          i32 %65 = OpConstant 3 
					                                              %83 = OpTypePointer Uniform %7 
					                               Private f32_4* %89 = OpVariable Private 
					                                          i32 %92 = OpConstant 5 
					                                         u32 %117 = OpConstant 1 
					                                             %118 = OpTypeArray %6 %117 
					                                             %119 = OpTypeStruct %10 %6 %118 
					                                             %120 = OpTypePointer Output %119 
					        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
					                                             %123 = OpTypePointer Output %10 
					                               Output f32_4* %125 = OpVariable Output 
					                                Input f32_4* %126 = OpVariable Input 
					                                             %128 = OpTypePointer Output %13 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %130 = OpTypePointer Input %13 
					                                Input f32_2* %131 = OpVariable Input 
					                                             %133 = OpTypePointer Input %7 
					                                Input f32_3* %134 = OpVariable Input 
					                                         u32 %140 = OpConstant 0 
					                                             %141 = OpTypePointer Private %6 
					                                         u32 %154 = OpConstant 2 
					                                             %156 = OpTypePointer Private %13 
					                              Private f32_2* %157 = OpVariable Private 
					                                         i32 %201 = OpConstant 4 
					                                         i32 %223 = OpConstant 19 
					                                         i32 %226 = OpConstant 20 
					                                Private f32* %240 = OpVariable Private 
					                                         i32 %246 = OpConstant 16 
					                                         i32 %249 = OpConstant 17 
					                                         f32 %253 = OpConstant 3,674022E-40 
					                                       f32_2 %254 = OpConstantComposite %253 %253 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Private f32* %269 = OpVariable Private 
					                                Input f32_2* %270 = OpVariable Input 
					                                             %271 = OpTypePointer Input %6 
					                                         i32 %275 = OpConstant 18 
					                                         f32 %283 = OpConstant 3,674022E-40 
					                                         i32 %285 = OpConstant 21 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %313 = OpTypeBool 
					                                             %314 = OpTypePointer Private %313 
					                               Private bool* %315 = OpVariable Private 
					                                         u32 %316 = OpConstant 3 
					                                         f32 %319 = OpConstant 3,674022E-40 
					                              Private f32_3* %321 = OpVariable Private 
					                                             %323 = OpTypePointer Function %6 
					                               Private bool* %333 = OpVariable Private 
					                                         i32 %340 = OpConstant 10 
					                                         i32 %344 = OpConstant 11 
					                                         i32 %359 = OpConstant 6 
					                                         i32 %366 = OpConstant 12 
					                                         f32 %373 = OpConstant 3,674022E-40 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                         i32 %384 = OpConstant 8 
					                                         i32 %392 = OpConstant 7 
					                                             %412 = OpTypePointer Output %6 
					                                         i32 %425 = OpConstant 15 
					                                         f32 %428 = OpConstant 3,674022E-40 
					                                       f32_4 %429 = OpConstantComposite %428 %428 %428 %428 
					                                         f32 %432 = OpConstant 3,674022E-40 
					                                       f32_4 %433 = OpConstantComposite %432 %432 %432 %432 
					                                         f32 %437 = OpConstant 3,674022E-40 
					                                       f32_2 %438 = OpConstantComposite %437 %437 
					                                         i32 %456 = OpConstant 9 
					                                             %469 = OpTypePointer Output %7 
					                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
					                                         f32 %481 = OpConstant 3,674022E-40 
					                                         f32 %491 = OpConstant 3,674022E-40 
					                                         f32 %498 = OpConstant 3,674022E-40 
					                                       f32_2 %499 = OpConstantComposite %498 %498 
					                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
					                                         i32 %506 = OpConstant 22 
					                                         i32 %519 = OpConstant 23 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %324 = OpVariable Function 
					                                        f32_4 %14 = OpLoad %12 
					                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
					                                 Uniform f32* %29 = OpAccessChain %25 %27 
					                                          f32 %30 = OpLoad %29 
					                                 Uniform f32* %32 = OpAccessChain %25 %31 
					                                          f32 %33 = OpLoad %32 
					                                        f32_2 %34 = OpCompositeConstruct %30 %33 
					                                        f32_2 %35 = OpFAdd %15 %34 
					                                        f32_3 %36 = OpLoad %9 
					                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
					                                                      OpStore %9 %37 
					                                        f32_3 %40 = OpLoad %9 
					                                        f32_4 %41 = OpVectorShuffle %40 %40 1 1 1 1 
					                               Uniform f32_4* %45 = OpAccessChain %25 %42 %43 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_4 %47 = OpFMul %41 %46 
					                                                      OpStore %39 %47 
					                               Uniform f32_4* %49 = OpAccessChain %25 %42 %48 
					                                        f32_4 %50 = OpLoad %49 
					                                        f32_3 %51 = OpLoad %9 
					                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 0 0 
					                                        f32_4 %53 = OpFMul %50 %52 
					                                        f32_4 %54 = OpLoad %39 
					                                        f32_4 %55 = OpFAdd %53 %54 
					                                                      OpStore %39 %55 
					                               Uniform f32_4* %56 = OpAccessChain %25 %42 %42 
					                                        f32_4 %57 = OpLoad %56 
					                                        f32_4 %58 = OpLoad %12 
					                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
					                                        f32_4 %60 = OpFMul %57 %59 
					                                        f32_4 %61 = OpLoad %39 
					                                        f32_4 %62 = OpFAdd %60 %61 
					                                                      OpStore %39 %62 
					                                        f32_4 %64 = OpLoad %39 
					                               Uniform f32_4* %66 = OpAccessChain %25 %42 %65 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_4 %68 = OpFAdd %64 %67 
					                                                      OpStore %63 %68 
					                               Uniform f32_4* %69 = OpAccessChain %25 %42 %65 
					                                        f32_4 %70 = OpLoad %69 
					                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                        f32_4 %72 = OpLoad %12 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
					                                        f32_3 %74 = OpFMul %71 %73 
					                                        f32_4 %75 = OpLoad %39 
					                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
					                                        f32_3 %77 = OpFAdd %74 %76 
					                                        f32_4 %78 = OpLoad %39 
					                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
					                                                      OpStore %39 %79 
					                                        f32_4 %80 = OpLoad %39 
					                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
					                                        f32_3 %82 = OpFNegate %81 
					                               Uniform f32_3* %84 = OpAccessChain %25 %48 
					                                        f32_3 %85 = OpLoad %84 
					                                        f32_3 %86 = OpFAdd %82 %85 
					                                        f32_4 %87 = OpLoad %39 
					                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
					                                                      OpStore %39 %88 
					                                        f32_4 %90 = OpLoad %63 
					                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
					                               Uniform f32_4* %93 = OpAccessChain %25 %92 %43 
					                                        f32_4 %94 = OpLoad %93 
					                                        f32_4 %95 = OpFMul %91 %94 
					                                                      OpStore %89 %95 
					                               Uniform f32_4* %96 = OpAccessChain %25 %92 %48 
					                                        f32_4 %97 = OpLoad %96 
					                                        f32_4 %98 = OpLoad %63 
					                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
					                                       f32_4 %100 = OpFMul %97 %99 
					                                       f32_4 %101 = OpLoad %89 
					                                       f32_4 %102 = OpFAdd %100 %101 
					                                                      OpStore %89 %102 
					                              Uniform f32_4* %103 = OpAccessChain %25 %92 %42 
					                                       f32_4 %104 = OpLoad %103 
					                                       f32_4 %105 = OpLoad %63 
					                                       f32_4 %106 = OpVectorShuffle %105 %105 2 2 2 2 
					                                       f32_4 %107 = OpFMul %104 %106 
					                                       f32_4 %108 = OpLoad %89 
					                                       f32_4 %109 = OpFAdd %107 %108 
					                                                      OpStore %89 %109 
					                              Uniform f32_4* %110 = OpAccessChain %25 %92 %65 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_4 %112 = OpLoad %63 
					                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
					                                       f32_4 %114 = OpFMul %111 %113 
					                                       f32_4 %115 = OpLoad %89 
					                                       f32_4 %116 = OpFAdd %114 %115 
					                                                      OpStore %63 %116 
					                                       f32_4 %122 = OpLoad %63 
					                               Output f32_4* %124 = OpAccessChain %121 %48 
					                                                      OpStore %124 %122 
					                                       f32_4 %127 = OpLoad %126 
					                                                      OpStore %125 %127 
					                                       f32_2 %132 = OpLoad %131 
					                                                      OpStore vs_TEXCOORD0 %132 
					                                       f32_3 %135 = OpLoad %134 
					                              Uniform f32_4* %136 = OpAccessChain %25 %65 %48 
					                                       f32_4 %137 = OpLoad %136 
					                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
					                                         f32 %139 = OpDot %135 %138 
					                                Private f32* %142 = OpAccessChain %63 %140 
					                                                      OpStore %142 %139 
					                                       f32_3 %143 = OpLoad %134 
					                              Uniform f32_4* %144 = OpAccessChain %25 %65 %43 
					                                       f32_4 %145 = OpLoad %144 
					                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
					                                         f32 %147 = OpDot %143 %146 
					                                Private f32* %148 = OpAccessChain %63 %117 
					                                                      OpStore %148 %147 
					                                       f32_3 %149 = OpLoad %134 
					                              Uniform f32_4* %150 = OpAccessChain %25 %65 %42 
					                                       f32_4 %151 = OpLoad %150 
					                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
					                                         f32 %153 = OpDot %149 %152 
					                                Private f32* %155 = OpAccessChain %63 %154 
					                                                      OpStore %155 %153 
					                                       f32_4 %158 = OpLoad %63 
					                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                                       f32_4 %160 = OpLoad %63 
					                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
					                                         f32 %162 = OpDot %159 %161 
					                                Private f32* %163 = OpAccessChain %157 %140 
					                                                      OpStore %163 %162 
					                                Private f32* %164 = OpAccessChain %157 %140 
					                                         f32 %165 = OpLoad %164 
					                                         f32 %166 = OpExtInst %1 32 %165 
					                                Private f32* %167 = OpAccessChain %157 %140 
					                                                      OpStore %167 %166 
					                                       f32_2 %168 = OpLoad %157 
					                                       f32_3 %169 = OpVectorShuffle %168 %168 0 0 0 
					                                       f32_4 %170 = OpLoad %63 
					                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
					                                       f32_3 %172 = OpFMul %169 %171 
					                                       f32_4 %173 = OpLoad %63 
					                                       f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
					                                                      OpStore %63 %174 
					                                       f32_4 %175 = OpLoad %39 
					                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
					                                       f32_4 %177 = OpLoad %39 
					                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
					                                         f32 %179 = OpDot %176 %178 
					                                Private f32* %180 = OpAccessChain %157 %140 
					                                                      OpStore %180 %179 
					                                Private f32* %181 = OpAccessChain %157 %140 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpExtInst %1 32 %182 
					                                Private f32* %184 = OpAccessChain %157 %140 
					                                                      OpStore %184 %183 
					                                       f32_2 %185 = OpLoad %157 
					                                       f32_3 %186 = OpVectorShuffle %185 %185 0 0 0 
					                                       f32_4 %187 = OpLoad %39 
					                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
					                                       f32_3 %189 = OpFMul %186 %188 
					                                       f32_4 %190 = OpLoad %89 
					                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
					                                                      OpStore %89 %191 
					                                       f32_4 %192 = OpLoad %63 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                       f32_4 %194 = OpLoad %89 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                         f32 %196 = OpDot %193 %195 
					                                Private f32* %197 = OpAccessChain %157 %140 
					                                                      OpStore %197 %196 
					                              Uniform f32_4* %198 = OpAccessChain %25 %43 
					                                       f32_4 %199 = OpLoad %198 
					                                       f32_2 %200 = OpVectorShuffle %199 %199 1 1 
					                              Uniform f32_4* %202 = OpAccessChain %25 %201 %43 
					                                       f32_4 %203 = OpLoad %202 
					                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
					                                       f32_2 %205 = OpFMul %200 %204 
					                                       f32_4 %206 = OpLoad %63 
					                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 2 3 
					                                                      OpStore %63 %207 
					                              Uniform f32_4* %208 = OpAccessChain %25 %201 %48 
					                                       f32_4 %209 = OpLoad %208 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
					                              Uniform f32_4* %211 = OpAccessChain %25 %43 
					                                       f32_4 %212 = OpLoad %211 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 0 
					                                       f32_2 %214 = OpFMul %210 %213 
					                                       f32_4 %215 = OpLoad %63 
					                                       f32_2 %216 = OpVectorShuffle %215 %215 0 1 
					                                       f32_2 %217 = OpFAdd %214 %216 
					                                       f32_4 %218 = OpLoad %63 
					                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
					                                                      OpStore %63 %219 
					                                       f32_4 %220 = OpLoad %63 
					                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
					                                       f32_2 %222 = OpExtInst %1 4 %221 
					                                Uniform f32* %224 = OpAccessChain %25 %223 
					                                         f32 %225 = OpLoad %224 
					                                Uniform f32* %227 = OpAccessChain %25 %226 
					                                         f32 %228 = OpLoad %227 
					                                       f32_2 %229 = OpCompositeConstruct %225 %228 
					                                       f32_2 %230 = OpFMul %222 %229 
					                                       f32_4 %231 = OpLoad %63 
					                                       f32_4 %232 = OpVectorShuffle %231 %230 4 5 2 3 
					                                                      OpStore %63 %232 
					                                       f32_4 %233 = OpLoad %63 
					                                       f32_2 %234 = OpVectorShuffle %233 %233 3 3 
					                                       f32_4 %235 = OpLoad %63 
					                                       f32_2 %236 = OpVectorShuffle %235 %235 0 1 
					                                       f32_2 %237 = OpFDiv %234 %236 
					                                       f32_4 %238 = OpLoad %63 
					                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 2 3 
					                                                      OpStore %63 %239 
					                                       f32_4 %241 = OpLoad %63 
					                                       f32_2 %242 = OpVectorShuffle %241 %241 0 1 
					                                       f32_4 %243 = OpLoad %63 
					                                       f32_2 %244 = OpVectorShuffle %243 %243 0 1 
					                                         f32 %245 = OpDot %242 %244 
					                                                      OpStore %240 %245 
					                                Uniform f32* %247 = OpAccessChain %25 %246 
					                                         f32 %248 = OpLoad %247 
					                                Uniform f32* %250 = OpAccessChain %25 %249 
					                                         f32 %251 = OpLoad %250 
					                                       f32_2 %252 = OpCompositeConstruct %248 %251 
					                                       f32_2 %255 = OpFMul %252 %254 
					                                       f32_4 %256 = OpLoad %63 
					                                       f32_2 %257 = OpVectorShuffle %256 %256 0 1 
					                                       f32_2 %258 = OpFAdd %255 %257 
					                                       f32_4 %259 = OpLoad %63 
					                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 2 3 
					                                                      OpStore %63 %260 
					                                       f32_4 %262 = OpLoad %63 
					                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
					                                       f32_2 %264 = OpFDiv %254 %263 
					                                       f32_4 %265 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %266 = OpVectorShuffle %265 %264 0 1 4 5 
					                                                      OpStore vs_TEXCOORD2 %266 
					                                         f32 %267 = OpLoad %240 
					                                         f32 %268 = OpExtInst %1 32 %267 
					                                                      OpStore %240 %268 
					                                  Input f32* %272 = OpAccessChain %270 %117 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpExtInst %1 4 %273 
					                                Uniform f32* %276 = OpAccessChain %25 %275 
					                                         f32 %277 = OpLoad %276 
					                                         f32 %278 = OpFMul %274 %277 
					                                                      OpStore %269 %278 
					                                         f32 %279 = OpLoad %240 
					                                         f32 %280 = OpLoad %269 
					                                         f32 %281 = OpFMul %279 %280 
					                                                      OpStore %240 %281 
					                                         f32 %282 = OpLoad %240 
					                                         f32 %284 = OpFMul %282 %283 
					                                                      OpStore %269 %284 
					                                Uniform f32* %286 = OpAccessChain %25 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFNegate %287 
					                                         f32 %290 = OpFAdd %288 %289 
					                                Private f32* %291 = OpAccessChain %63 %140 
					                                                      OpStore %291 %290 
					                                         f32 %292 = OpLoad %269 
					                                         f32 %293 = OpExtInst %1 4 %292 
					                                Private f32* %294 = OpAccessChain %63 %140 
					                                         f32 %295 = OpLoad %294 
					                                         f32 %296 = OpFMul %293 %295 
					                                Private f32* %297 = OpAccessChain %63 %140 
					                                                      OpStore %297 %296 
					                                         f32 %298 = OpLoad %240 
					                                         f32 %299 = OpFMul %298 %283 
					                                Private f32* %300 = OpAccessChain %63 %140 
					                                         f32 %301 = OpLoad %300 
					                                         f32 %302 = OpFNegate %301 
					                                         f32 %303 = OpFAdd %299 %302 
					                                                      OpStore %240 %303 
					                                Private f32* %304 = OpAccessChain %157 %140 
					                                         f32 %305 = OpLoad %304 
					                                         f32 %306 = OpExtInst %1 4 %305 
					                                         f32 %307 = OpLoad %240 
					                                         f32 %308 = OpFMul %306 %307 
					                                Private f32* %309 = OpAccessChain %63 %140 
					                                         f32 %310 = OpLoad %309 
					                                         f32 %311 = OpFAdd %308 %310 
					                                Private f32* %312 = OpAccessChain %157 %140 
					                                                      OpStore %312 %311 
					                                Uniform f32* %317 = OpAccessChain %25 %201 %65 %316 
					                                         f32 %318 = OpLoad %317 
					                                        bool %320 = OpFOrdEqual %318 %319 
					                                                      OpStore %315 %320 
					                                        bool %322 = OpLoad %315 
					                                                      OpSelectionMerge %326 None 
					                                                      OpBranchConditional %322 %325 %329 
					                                             %325 = OpLabel 
					                                Private f32* %327 = OpAccessChain %157 %140 
					                                         f32 %328 = OpLoad %327 
					                                                      OpStore %324 %328 
					                                                      OpBranch %326 
					                                             %329 = OpLabel 
					                                         f32 %330 = OpLoad %269 
					                                                      OpStore %324 %330 
					                                                      OpBranch %326 
					                                             %326 = OpLabel 
					                                         f32 %331 = OpLoad %324 
					                                Private f32* %332 = OpAccessChain %321 %140 
					                                                      OpStore %332 %331 
					                                  Input f32* %334 = OpAccessChain %270 %117 
					                                         f32 %335 = OpLoad %334 
					                                        bool %336 = OpFOrdGreaterThanEqual %319 %335 
					                                                      OpStore %333 %336 
					                                        bool %337 = OpLoad %333 
					                                         f32 %338 = OpSelect %337 %289 %319 
					                                Private f32* %339 = OpAccessChain %157 %140 
					                                                      OpStore %339 %338 
					                                Uniform f32* %341 = OpAccessChain %25 %340 
					                                         f32 %342 = OpLoad %341 
					                                         f32 %343 = OpFNegate %342 
					                                Uniform f32* %345 = OpAccessChain %25 %344 
					                                         f32 %346 = OpLoad %345 
					                                         f32 %347 = OpFAdd %343 %346 
					                                                      OpStore %240 %347 
					                                Private f32* %348 = OpAccessChain %157 %140 
					                                         f32 %349 = OpLoad %348 
					                                         f32 %350 = OpLoad %240 
					                                         f32 %351 = OpFMul %349 %350 
					                                Uniform f32* %352 = OpAccessChain %25 %340 
					                                         f32 %353 = OpLoad %352 
					                                         f32 %354 = OpFAdd %351 %353 
					                                Private f32* %355 = OpAccessChain %157 %140 
					                                                      OpStore %355 %354 
					                                Private f32* %356 = OpAccessChain %157 %140 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %358 = OpFMul %357 %253 
					                                Uniform f32* %360 = OpAccessChain %25 %359 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpFAdd %358 %361 
					                                Private f32* %363 = OpAccessChain %157 %140 
					                                                      OpStore %363 %362 
					                                Private f32* %364 = OpAccessChain %157 %140 
					                                         f32 %365 = OpLoad %364 
					                                Uniform f32* %367 = OpAccessChain %25 %366 
					                                         f32 %368 = OpLoad %367 
					                                         f32 %369 = OpFMul %365 %368 
					                                Private f32* %370 = OpAccessChain %157 %140 
					                                                      OpStore %370 %369 
					                                Private f32* %371 = OpAccessChain %157 %140 
					                                         f32 %372 = OpLoad %371 
					                                         f32 %374 = OpFMul %372 %373 
					                                Private f32* %375 = OpAccessChain %321 %154 
					                                                      OpStore %375 %374 
					                                       f32_3 %377 = OpLoad %321 
					                                       f32_2 %378 = OpVectorShuffle %377 %377 0 2 
					                                       f32_4 %379 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %380 = OpVectorShuffle %379 %378 0 4 2 5 
					                                                      OpStore vs_TEXCOORD1 %380 
					                                Private f32* %381 = OpAccessChain %321 %140 
					                                         f32 %382 = OpLoad %381 
					                                         f32 %383 = OpFDiv %373 %382 
					                                                      OpStore %240 %383 
					                                Uniform f32* %385 = OpAccessChain %25 %384 
					                                         f32 %386 = OpLoad %385 
					                                         f32 %387 = OpFNegate %386 
					                                Uniform f32* %388 = OpAccessChain %25 %366 
					                                         f32 %389 = OpLoad %388 
					                                         f32 %390 = OpFMul %387 %389 
					                                         f32 %391 = OpFAdd %390 %289 
					                                                      OpStore %269 %391 
					                                Uniform f32* %393 = OpAccessChain %25 %392 
					                                         f32 %394 = OpLoad %393 
					                                         f32 %395 = OpFNegate %394 
					                                Uniform f32* %396 = OpAccessChain %25 %366 
					                                         f32 %397 = OpLoad %396 
					                                         f32 %398 = OpFMul %395 %397 
					                                         f32 %399 = OpLoad %269 
					                                         f32 %400 = OpFAdd %398 %399 
					                                                      OpStore %269 %400 
					                                         f32 %401 = OpLoad %269 
					                                         f32 %402 = OpFMul %401 %373 
					                                         f32 %403 = OpLoad %240 
					                                         f32 %404 = OpFNegate %403 
					                                         f32 %405 = OpFAdd %402 %404 
					                                                      OpStore %269 %405 
					                                Private f32* %406 = OpAccessChain %157 %140 
					                                         f32 %407 = OpLoad %406 
					                                         f32 %408 = OpFNegate %407 
					                                         f32 %409 = OpFMul %408 %373 
					                                         f32 %410 = OpLoad %269 
					                                         f32 %411 = OpFAdd %409 %410 
					                                 Output f32* %413 = OpAccessChain vs_TEXCOORD1 %140 
					                                                      OpStore %413 %411 
					                                Private f32* %414 = OpAccessChain %157 %140 
					                                         f32 %415 = OpLoad %414 
					                                         f32 %416 = OpFNegate %415 
					                                         f32 %417 = OpFMul %416 %373 
					                                         f32 %418 = OpFAdd %417 %373 
					                                Private f32* %419 = OpAccessChain %157 %140 
					                                                      OpStore %419 %418 
					                                         f32 %420 = OpLoad %240 
					                                Private f32* %421 = OpAccessChain %157 %140 
					                                         f32 %422 = OpLoad %421 
					                                         f32 %423 = OpFAdd %420 %422 
					                                 Output f32* %424 = OpAccessChain vs_TEXCOORD1 %154 
					                                                      OpStore %424 %423 
					                              Uniform f32_4* %426 = OpAccessChain %25 %425 
					                                       f32_4 %427 = OpLoad %426 
					                                       f32_4 %430 = OpExtInst %1 40 %427 %429 
					                                                      OpStore %63 %430 
					                                       f32_4 %431 = OpLoad %63 
					                                       f32_4 %434 = OpExtInst %1 37 %431 %433 
					                                                      OpStore %63 %434 
					                                       f32_3 %435 = OpLoad %9 
					                                       f32_2 %436 = OpVectorShuffle %435 %435 0 1 
					                                       f32_2 %439 = OpFMul %436 %438 
					                                       f32_4 %440 = OpLoad %63 
					                                       f32_2 %441 = OpVectorShuffle %440 %440 0 1 
					                                       f32_2 %442 = OpFNegate %441 
					                                       f32_2 %443 = OpFAdd %439 %442 
					                                       f32_3 %444 = OpLoad %9 
					                                       f32_3 %445 = OpVectorShuffle %444 %443 3 4 2 
					                                                      OpStore %9 %445 
					                                       f32_4 %446 = OpLoad %63 
					                                       f32_2 %447 = OpVectorShuffle %446 %446 2 3 
					                                       f32_2 %448 = OpFNegate %447 
					                                       f32_3 %449 = OpLoad %9 
					                                       f32_2 %450 = OpVectorShuffle %449 %449 0 1 
					                                       f32_2 %451 = OpFAdd %448 %450 
					                                       f32_4 %452 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %453 = OpVectorShuffle %452 %451 4 5 2 3 
					                                                      OpStore vs_TEXCOORD2 %453 
					                                       f32_4 %454 = OpLoad %39 
					                                       f32_3 %455 = OpVectorShuffle %454 %454 1 1 1 
					                              Uniform f32_4* %457 = OpAccessChain %25 %456 %43 
					                                       f32_4 %458 = OpLoad %457 
					                                       f32_3 %459 = OpVectorShuffle %458 %458 0 1 2 
					                                       f32_3 %460 = OpFMul %455 %459 
					                                                      OpStore %9 %460 
					                              Uniform f32_4* %461 = OpAccessChain %25 %456 %48 
					                                       f32_4 %462 = OpLoad %461 
					                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
					                                       f32_4 %464 = OpLoad %39 
					                                       f32_3 %465 = OpVectorShuffle %464 %464 0 0 0 
					                                       f32_3 %466 = OpFMul %463 %465 
					                                       f32_3 %467 = OpLoad %9 
					                                       f32_3 %468 = OpFAdd %466 %467 
					                                                      OpStore %9 %468 
					                              Uniform f32_4* %471 = OpAccessChain %25 %456 %42 
					                                       f32_4 %472 = OpLoad %471 
					                                       f32_3 %473 = OpVectorShuffle %472 %472 0 1 2 
					                                       f32_4 %474 = OpLoad %39 
					                                       f32_3 %475 = OpVectorShuffle %474 %474 2 2 2 
					                                       f32_3 %476 = OpFMul %473 %475 
					                                       f32_3 %477 = OpLoad %9 
					                                       f32_3 %478 = OpFAdd %476 %477 
					                                                      OpStore vs_TEXCOORD3 %478 
					                                  Input f32* %479 = OpAccessChain %270 %140 
					                                         f32 %480 = OpLoad %479 
					                                         f32 %482 = OpFMul %480 %481 
					                                Private f32* %483 = OpAccessChain %9 %140 
					                                                      OpStore %483 %482 
					                                Private f32* %484 = OpAccessChain %9 %140 
					                                         f32 %485 = OpLoad %484 
					                                         f32 %486 = OpExtInst %1 8 %485 
					                                Private f32* %487 = OpAccessChain %157 %140 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %157 %140 
					                                         f32 %489 = OpLoad %488 
					                                         f32 %490 = OpFNegate %489 
					                                         f32 %492 = OpFMul %490 %491 
					                                  Input f32* %493 = OpAccessChain %270 %140 
					                                         f32 %494 = OpLoad %493 
					                                         f32 %495 = OpFAdd %492 %494 
					                                Private f32* %496 = OpAccessChain %157 %117 
					                                                      OpStore %496 %495 
					                                       f32_2 %497 = OpLoad %157 
					                                       f32_2 %500 = OpFMul %497 %499 
					                                       f32_3 %501 = OpLoad %9 
					                                       f32_3 %502 = OpVectorShuffle %501 %500 3 4 2 
					                                                      OpStore %9 %502 
					                                       f32_3 %504 = OpLoad %9 
					                                       f32_2 %505 = OpVectorShuffle %504 %504 0 1 
					                              Uniform f32_4* %507 = OpAccessChain %25 %506 
					                                       f32_4 %508 = OpLoad %507 
					                                       f32_2 %509 = OpVectorShuffle %508 %508 0 1 
					                                       f32_2 %510 = OpFMul %505 %509 
					                              Uniform f32_4* %511 = OpAccessChain %25 %506 
					                                       f32_4 %512 = OpLoad %511 
					                                       f32_2 %513 = OpVectorShuffle %512 %512 2 3 
					                                       f32_2 %514 = OpFAdd %510 %513 
					                                       f32_4 %515 = OpLoad vs_TEXCOORD5 
					                                       f32_4 %516 = OpVectorShuffle %515 %514 4 5 2 3 
					                                                      OpStore vs_TEXCOORD5 %516 
					                                       f32_3 %517 = OpLoad %9 
					                                       f32_2 %518 = OpVectorShuffle %517 %517 0 1 
					                              Uniform f32_4* %520 = OpAccessChain %25 %519 
					                                       f32_4 %521 = OpLoad %520 
					                                       f32_2 %522 = OpVectorShuffle %521 %521 0 1 
					                                       f32_2 %523 = OpFMul %518 %522 
					                              Uniform f32_4* %524 = OpAccessChain %25 %519 
					                                       f32_4 %525 = OpLoad %524 
					                                       f32_2 %526 = OpVectorShuffle %525 %525 2 3 
					                                       f32_2 %527 = OpFAdd %523 %526 
					                                       f32_4 %528 = OpLoad vs_TEXCOORD5 
					                                       f32_4 %529 = OpVectorShuffle %528 %527 0 1 4 5 
					                                                      OpStore vs_TEXCOORD5 %529 
					                                 Output f32* %530 = OpAccessChain %121 %48 %117 
					                                         f32 %531 = OpLoad %530 
					                                         f32 %532 = OpFNegate %531 
					                                 Output f32* %533 = OpAccessChain %121 %48 %117 
					                                                      OpStore %533 %532 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 312
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %22 %35 %127 %147 %282 %306 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %12 RelaxedPrecision 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %16 RelaxedPrecision 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %17 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 22 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 35 
					                                                      OpDecorate %44 RelaxedPrecision 
					                                                      OpDecorate %45 RelaxedPrecision 
					                                                      OpMemberDecorate %68 0 Offset 68 
					                                                      OpMemberDecorate %68 1 Offset 68 
					                                                      OpMemberDecorate %68 2 Offset 68 
					                                                      OpMemberDecorate %68 3 RelaxedPrecision 
					                                                      OpMemberDecorate %68 3 Offset 68 
					                                                      OpMemberDecorate %68 4 Offset 68 
					                                                      OpMemberDecorate %68 5 Offset 68 
					                                                      OpMemberDecorate %68 6 Offset 68 
					                                                      OpMemberDecorate %68 7 RelaxedPrecision 
					                                                      OpMemberDecorate %68 7 Offset 68 
					                                                      OpMemberDecorate %68 8 Offset 68 
					                                                      OpMemberDecorate %68 9 Offset 68 
					                                                      OpMemberDecorate %68 10 Offset 68 
					                                                      OpDecorate %68 Block 
					                                                      OpDecorate %70 DescriptorSet 70 
					                                                      OpDecorate %70 Binding 70 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD5 Location 127 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 DescriptorSet 131 
					                                                      OpDecorate %131 Binding 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %133 DescriptorSet 133 
					                                                      OpDecorate %133 Binding 133 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %147 Location 147 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %169 DescriptorSet 169 
					                                                      OpDecorate %169 Binding 169 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %171 DescriptorSet 171 
					                                                      OpDecorate %171 Binding 171 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
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
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %219 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %224 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 282 
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %304 RelaxedPrecision 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %306 Location 306 
					                                                      OpDecorate %307 RelaxedPrecision 
					                                                      OpDecorate %308 RelaxedPrecision 
					                                                      OpDecorate %309 RelaxedPrecision 
					                                                      OpDecorate %310 RelaxedPrecision 
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
					                                              %20 = OpTypeVector %6 2 
					                                              %21 = OpTypePointer Input %20 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %25 = OpTypeInt 32 0 
					                                          u32 %26 = OpConstant 3 
					                                          u32 %28 = OpConstant 0 
					                                              %29 = OpTypePointer Private %6 
					                                 Private f32* %31 = OpVariable Private 
					                                              %34 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                              %36 = OpTypePointer Input %6 
					                                              %41 = OpTypePointer Private %20 
					                               Private f32_2* %42 = OpVariable Private 
					                                          u32 %46 = OpConstant 2 
					                                              %51 = OpTypeBool 
					                                              %52 = OpTypePointer Private %51 
					                                Private bool* %53 = OpVariable Private 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                              %58 = OpTypeInt 32 1 
					                                          i32 %59 = OpConstant 0 
					                                          i32 %60 = OpConstant 1 
					                                          i32 %62 = OpConstant -1 
					                                              %68 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 %7 
					                                              %69 = OpTypePointer Uniform %68 
					Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32; f32_4;}* %70 = OpVariable Uniform 
					                                          i32 %71 = OpConstant 8 
					                                              %72 = OpTypePointer Uniform %6 
					                                          i32 %75 = OpConstant 9 
					                                          u32 %80 = OpConstant 1 
					                                 Private f32* %84 = OpVariable Private 
					                                          f32 %86 = OpConstant 3,674022E-40 
					                                 Private f32* %88 = OpVariable Private 
					                                          f32 %90 = OpConstant 3,674022E-40 
					                                 Private f32* %94 = OpVariable Private 
					                                         i32 %115 = OpConstant 5 
					                                         i32 %118 = OpConstant 6 
					                                             %122 = OpTypePointer Uniform %7 
					                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
					        UniformConstant read_only Texture2D* %131 = OpVariable UniformConstant 
					                    UniformConstant sampler* %133 = OpVariable UniformConstant 
					                              Private f32_4* %138 = OpVariable Private 
					                                         i32 %140 = OpConstant 7 
					                                             %144 = OpTypeVector %6 3 
					                                             %145 = OpTypePointer Private %144 
					                              Private f32_3* %146 = OpVariable Private 
					                                Input f32_4* %147 = OpVariable Input 
					                                         i32 %150 = OpConstant 3 
					                                         i32 %157 = OpConstant 2 
					                              Private f32_4* %168 = OpVariable Private 
					        UniformConstant read_only Texture2D* %169 = OpVariable UniformConstant 
					                    UniformConstant sampler* %171 = OpVariable UniformConstant 
					                              Private f32_4* %176 = OpVariable Private 
					                                Private f32* %183 = OpVariable Private 
					                              Private f32_2* %236 = OpVariable Private 
					                                         i32 %237 = OpConstant 4 
					                                Private f32* %244 = OpVariable Private 
					                                         i32 %272 = OpConstant 10 
					                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
					                                             %305 = OpTypePointer Output %7 
					                               Output f32_4* %306 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                          read_only Texture2D %13 = OpLoad %12 
					                                      sampler %17 = OpLoad %16 
					                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                          f32 %27 = OpCompositeExtract %24 3 
					                                 Private f32* %30 = OpAccessChain %9 %28 
					                                                      OpStore %30 %27 
					                                 Private f32* %32 = OpAccessChain %9 %28 
					                                          f32 %33 = OpLoad %32 
					                                   Input f32* %37 = OpAccessChain vs_TEXCOORD1 %28 
					                                          f32 %38 = OpLoad %37 
					                                          f32 %39 = OpFNegate %38 
					                                          f32 %40 = OpFAdd %33 %39 
					                                                      OpStore %31 %40 
					                                 Private f32* %43 = OpAccessChain %9 %28 
					                                          f32 %44 = OpLoad %43 
					                                          f32 %45 = OpFNegate %44 
					                                   Input f32* %47 = OpAccessChain vs_TEXCOORD1 %46 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpFAdd %45 %48 
					                                 Private f32* %50 = OpAccessChain %42 %28 
					                                                      OpStore %50 %49 
					                                          f32 %54 = OpLoad %31 
					                                         bool %56 = OpFOrdLessThan %54 %55 
					                                                      OpStore %53 %56 
					                                         bool %57 = OpLoad %53 
					                                          i32 %61 = OpSelect %57 %60 %59 
					                                          i32 %63 = OpIMul %61 %62 
					                                         bool %64 = OpINotEqual %63 %59 
					                                                      OpSelectionMerge %66 None 
					                                                      OpBranchConditional %64 %65 %66 
					                                              %65 = OpLabel 
					                                                      OpKill
					                                              %66 = OpLabel 
					                                 Uniform f32* %73 = OpAccessChain %70 %71 
					                                          f32 %74 = OpLoad %73 
					                                 Uniform f32* %76 = OpAccessChain %70 %75 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpFMul %74 %77 
					                                                      OpStore %31 %78 
					                                          f32 %79 = OpLoad %31 
					                                   Input f32* %81 = OpAccessChain vs_TEXCOORD1 %80 
					                                          f32 %82 = OpLoad %81 
					                                          f32 %83 = OpFMul %79 %82 
					                                                      OpStore %31 %83 
					                                          f32 %85 = OpLoad %31 
					                                          f32 %87 = OpExtInst %1 37 %85 %86 
					                                                      OpStore %84 %87 
					                                          f32 %89 = OpLoad %31 
					                                          f32 %91 = OpFMul %89 %90 
					                                                      OpStore %88 %91 
					                                          f32 %92 = OpLoad %84 
					                                          f32 %93 = OpExtInst %1 31 %92 
					                                                      OpStore %84 %93 
					                                 Private f32* %95 = OpAccessChain %42 %28 
					                                          f32 %96 = OpLoad %95 
					                                   Input f32* %97 = OpAccessChain vs_TEXCOORD1 %80 
					                                          f32 %98 = OpLoad %97 
					                                          f32 %99 = OpFMul %96 %98 
					                                         f32 %100 = OpLoad %88 
					                                         f32 %101 = OpFAdd %99 %100 
					                                                      OpStore %94 %101 
					                                         f32 %102 = OpLoad %94 
					                                         f32 %103 = OpExtInst %1 43 %102 %55 %86 
					                                                      OpStore %94 %103 
					                                Private f32* %104 = OpAccessChain %42 %28 
					                                         f32 %105 = OpLoad %104 
					                                  Input f32* %106 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFMul %105 %107 
					                                         f32 %109 = OpLoad %88 
					                                         f32 %110 = OpFNegate %109 
					                                         f32 %111 = OpFAdd %108 %110 
					                                                      OpStore %88 %111 
					                                         f32 %112 = OpLoad %84 
					                                         f32 %113 = OpLoad %94 
					                                         f32 %114 = OpFMul %112 %113 
					                                                      OpStore %84 %114 
					                                Uniform f32* %116 = OpAccessChain %70 %115 
					                                         f32 %117 = OpLoad %116 
					                                Uniform f32* %119 = OpAccessChain %70 %118 
					                                         f32 %120 = OpLoad %119 
					                                       f32_2 %121 = OpCompositeConstruct %117 %120 
					                              Uniform f32_4* %123 = OpAccessChain %70 %59 
					                                       f32_4 %124 = OpLoad %123 
					                                       f32_2 %125 = OpVectorShuffle %124 %124 1 1 
					                                       f32_2 %126 = OpFMul %121 %125 
					                                       f32_4 %128 = OpLoad vs_TEXCOORD5 
					                                       f32_2 %129 = OpVectorShuffle %128 %128 2 3 
					                                       f32_2 %130 = OpFAdd %126 %129 
					                                                      OpStore %42 %130 
					                         read_only Texture2D %132 = OpLoad %131 
					                                     sampler %134 = OpLoad %133 
					                  read_only Texture2DSampled %135 = OpSampledImage %132 %134 
					                                       f32_2 %136 = OpLoad %42 
					                                       f32_4 %137 = OpImageSampleImplicitLod %135 %136 
					                                                      OpStore %9 %137 
					                                       f32_4 %139 = OpLoad %9 
					                              Uniform f32_4* %141 = OpAccessChain %70 %140 
					                                       f32_4 %142 = OpLoad %141 
					                                       f32_4 %143 = OpFMul %139 %142 
					                                                      OpStore %138 %143 
					                                       f32_4 %148 = OpLoad %147 
					                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
					                              Uniform f32_4* %151 = OpAccessChain %70 %150 
					                                       f32_4 %152 = OpLoad %151 
					                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
					                                       f32_3 %154 = OpFMul %149 %153 
					                                                      OpStore %146 %154 
					                                Uniform f32* %155 = OpAccessChain %70 %60 
					                                         f32 %156 = OpLoad %155 
					                                Uniform f32* %158 = OpAccessChain %70 %157 
					                                         f32 %159 = OpLoad %158 
					                                       f32_2 %160 = OpCompositeConstruct %156 %159 
					                              Uniform f32_4* %161 = OpAccessChain %70 %59 
					                                       f32_4 %162 = OpLoad %161 
					                                       f32_2 %163 = OpVectorShuffle %162 %162 1 1 
					                                       f32_2 %164 = OpFMul %160 %163 
					                                       f32_4 %165 = OpLoad vs_TEXCOORD5 
					                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
					                                       f32_2 %167 = OpFAdd %164 %166 
					                                                      OpStore %42 %167 
					                         read_only Texture2D %170 = OpLoad %169 
					                                     sampler %172 = OpLoad %171 
					                  read_only Texture2DSampled %173 = OpSampledImage %170 %172 
					                                       f32_2 %174 = OpLoad %42 
					                                       f32_4 %175 = OpImageSampleImplicitLod %173 %174 
					                                                      OpStore %168 %175 
					                                       f32_3 %177 = OpLoad %146 
					                                       f32_4 %178 = OpLoad %168 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                       f32_3 %180 = OpFMul %177 %179 
					                                       f32_4 %181 = OpLoad %176 
					                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
					                                                      OpStore %176 %182 
					                                Private f32* %184 = OpAccessChain %168 %26 
					                                         f32 %185 = OpLoad %184 
					                                Uniform f32* %186 = OpAccessChain %70 %150 %26 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFMul %185 %187 
					                                                      OpStore %183 %188 
					                                       f32_4 %189 = OpLoad %176 
					                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
					                                         f32 %191 = OpLoad %183 
					                                       f32_3 %192 = OpCompositeConstruct %191 %191 %191 
					                                       f32_3 %193 = OpFMul %190 %192 
					                                                      OpStore %146 %193 
					                                       f32_4 %194 = OpLoad %138 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                       f32_4 %196 = OpLoad %138 
					                                       f32_3 %197 = OpVectorShuffle %196 %196 3 3 3 
					                                       f32_3 %198 = OpFMul %195 %197 
					                                       f32_3 %199 = OpLoad %146 
					                                       f32_3 %200 = OpFNegate %199 
					                                       f32_3 %201 = OpFAdd %198 %200 
					                                       f32_4 %202 = OpLoad %138 
					                                       f32_4 %203 = OpVectorShuffle %202 %201 4 5 6 3 
					                                                      OpStore %138 %203 
					                                Uniform f32* %204 = OpAccessChain %70 %140 %26 
					                                         f32 %205 = OpLoad %204 
					                                Private f32* %206 = OpAccessChain %9 %26 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFMul %205 %207 
					                                         f32 %209 = OpLoad %183 
					                                         f32 %210 = OpFNegate %209 
					                                         f32 %211 = OpFAdd %208 %210 
					                                Private f32* %212 = OpAccessChain %138 %26 
					                                                      OpStore %212 %211 
					                                         f32 %213 = OpLoad %84 
					                                       f32_4 %214 = OpCompositeConstruct %213 %213 %213 %213 
					                                       f32_4 %215 = OpLoad %138 
					                                       f32_4 %216 = OpFMul %214 %215 
					                                                      OpStore %138 %216 
					                                       f32_4 %217 = OpLoad %176 
					                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
					                                         f32 %219 = OpLoad %183 
					                                       f32_3 %220 = OpCompositeConstruct %219 %219 %219 
					                                       f32_3 %221 = OpFMul %218 %220 
					                                       f32_4 %222 = OpLoad %138 
					                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
					                                       f32_3 %224 = OpFAdd %221 %223 
					                                       f32_4 %225 = OpLoad %176 
					                                       f32_4 %226 = OpVectorShuffle %225 %224 4 5 6 3 
					                                                      OpStore %176 %226 
					                                Uniform f32* %227 = OpAccessChain %70 %150 %26 
					                                         f32 %228 = OpLoad %227 
					                                Private f32* %229 = OpAccessChain %168 %26 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFMul %228 %230 
					                                Private f32* %232 = OpAccessChain %138 %26 
					                                         f32 %233 = OpLoad %232 
					                                         f32 %234 = OpFAdd %231 %233 
					                                Private f32* %235 = OpAccessChain %176 %26 
					                                                      OpStore %235 %234 
					                                Uniform f32* %238 = OpAccessChain %70 %237 
					                                         f32 %239 = OpLoad %238 
					                                Uniform f32* %240 = OpAccessChain %70 %75 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpFMul %239 %241 
					                                Private f32* %243 = OpAccessChain %236 %28 
					                                                      OpStore %243 %242 
					                                Private f32* %245 = OpAccessChain %236 %28 
					                                         f32 %246 = OpLoad %245 
					                                  Input f32* %247 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %248 = OpLoad %247 
					                                         f32 %249 = OpFMul %246 %248 
					                                                      OpStore %244 %249 
					                                Private f32* %250 = OpAccessChain %236 %28 
					                                         f32 %251 = OpLoad %250 
					                                  Input f32* %252 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %253 = OpLoad %252 
					                                         f32 %254 = OpFMul %251 %253 
					                                         f32 %255 = OpFAdd %254 %86 
					                                                      OpStore %84 %255 
					                                         f32 %256 = OpLoad %244 
					                                         f32 %257 = OpFMul %256 %90 
					                                         f32 %258 = OpLoad %88 
					                                         f32 %259 = OpFAdd %257 %258 
					                                                      OpStore %88 %259 
					                                         f32 %260 = OpLoad %88 
					                                         f32 %261 = OpLoad %84 
					                                         f32 %262 = OpFDiv %260 %261 
					                                                      OpStore %84 %262 
					                                         f32 %263 = OpLoad %84 
					                                         f32 %264 = OpExtInst %1 43 %263 %55 %86 
					                                                      OpStore %84 %264 
					                                         f32 %265 = OpLoad %84 
					                                         f32 %266 = OpFNegate %265 
					                                         f32 %267 = OpFAdd %266 %86 
					                                                      OpStore %84 %267 
					                                       f32_4 %268 = OpLoad %176 
					                                         f32 %269 = OpLoad %84 
					                                       f32_4 %270 = OpCompositeConstruct %269 %269 %269 %269 
					                                       f32_4 %271 = OpFMul %268 %270 
					                                                      OpStore %176 %271 
					                              Uniform f32_4* %273 = OpAccessChain %70 %272 
					                                       f32_4 %274 = OpLoad %273 
					                                       f32_2 %275 = OpVectorShuffle %274 %274 0 1 
					                                       f32_2 %276 = OpFNegate %275 
					                              Uniform f32_4* %277 = OpAccessChain %70 %272 
					                                       f32_4 %278 = OpLoad %277 
					                                       f32_2 %279 = OpVectorShuffle %278 %278 2 3 
					                                       f32_2 %280 = OpFAdd %276 %279 
					                                                      OpStore %236 %280 
					                                       f32_2 %281 = OpLoad %236 
					                                       f32_4 %283 = OpLoad vs_TEXCOORD2 
					                                       f32_2 %284 = OpVectorShuffle %283 %283 0 1 
					                                       f32_2 %285 = OpExtInst %1 4 %284 
					                                       f32_2 %286 = OpFNegate %285 
					                                       f32_2 %287 = OpFAdd %281 %286 
					                                                      OpStore %236 %287 
					                                       f32_2 %288 = OpLoad %236 
					                                       f32_4 %289 = OpLoad vs_TEXCOORD2 
					                                       f32_2 %290 = OpVectorShuffle %289 %289 2 3 
					                                       f32_2 %291 = OpFMul %288 %290 
					                                                      OpStore %236 %291 
					                                       f32_2 %292 = OpLoad %236 
					                                       f32_2 %293 = OpCompositeConstruct %55 %55 
					                                       f32_2 %294 = OpCompositeConstruct %86 %86 
					                                       f32_2 %295 = OpExtInst %1 43 %292 %293 %294 
					                                                      OpStore %236 %295 
					                                Private f32* %296 = OpAccessChain %236 %80 
					                                         f32 %297 = OpLoad %296 
					                                Private f32* %298 = OpAccessChain %236 %28 
					                                         f32 %299 = OpLoad %298 
					                                         f32 %300 = OpFMul %297 %299 
					                                                      OpStore %84 %300 
					                                       f32_4 %301 = OpLoad %176 
					                                         f32 %302 = OpLoad %84 
					                                       f32_4 %303 = OpCompositeConstruct %302 %302 %302 %302 
					                                       f32_4 %304 = OpFMul %301 %303 
					                                                      OpStore %176 %304 
					                                       f32_4 %307 = OpLoad %176 
					                                       f32_4 %308 = OpLoad %147 
					                                       f32_4 %309 = OpVectorShuffle %308 %308 3 3 3 3 
					                                       f32_4 %310 = OpFMul %307 %309 
					                                                      OpStore %306 %310 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 unused_0_3;
						float _OutlineWidth;
						vec4 unused_0_5[4];
						mat4x4 _EnvMatrix;
						vec4 unused_0_7[7];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_13[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD5;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat6;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
					    u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat2.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = abs(u_xlat2.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = u_xlat2.ww / u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat2.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat2.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat2.xy;
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
					    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat2.x);
					    u_xlat8.x = abs(u_xlat8.x) * u_xlat12 + u_xlat2.x;
					    u_xlatb12 = glstate_matrix_projection[3].w==0.0;
					    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat12 = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat6.z = u_xlat8.x * 0.5;
					    vs_TEXCOORD1.yw = u_xlat6.xz;
					    u_xlat12 = 0.5 / u_xlat6.x;
					    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
					    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
					    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xyz = u_xlat1.yyy * _EnvMatrix[1].xyz;
					    u_xlat0.xyz = _EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = _EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
					    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat8.x = floor(u_xlat0.x);
					    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	float _FaceDilate;
					uniform 	float _OutlineSoftness;
					uniform 	float _OutlineWidth;
					uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
					uniform 	float _WeightNormal;
					uniform 	float _WeightBold;
					uniform 	float _ScaleRatioA;
					uniform 	float _VertexOffsetX;
					uniform 	float _VertexOffsetY;
					uniform 	vec4 _ClipRect;
					uniform 	float _MaskSoftnessX;
					uniform 	float _MaskSoftnessY;
					uniform 	float _GradientScale;
					uniform 	float _ScaleX;
					uniform 	float _ScaleY;
					uniform 	float _PerspectiveFilter;
					uniform 	vec4 _FaceTex_ST;
					uniform 	vec4 _OutlineTex_ST;
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD5;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat6;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    gl_Position = u_xlat2;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
					    u_xlat2.xy = abs(u_xlat2.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat2.xy = u_xlat2.ww / u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat2.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat2.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat2.xy;
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat12 = u_xlat12 * u_xlat13;
					    u_xlat13 = u_xlat12 * 1.5;
					    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
					    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat2.x);
					    u_xlat8.x = abs(u_xlat8.x) * u_xlat12 + u_xlat2.x;
					    u_xlatb12 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
					    u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat12 = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
					    u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
					    u_xlat8.x = u_xlat8.x * _ScaleRatioA;
					    u_xlat6.z = u_xlat8.x * 0.5;
					    vs_TEXCOORD1.yw = u_xlat6.xz;
					    u_xlat12 = 0.5 / u_xlat6.x;
					    u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
					    u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
					    vs_TEXCOORD1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
					    vs_TEXCOORD1.z = u_xlat12 + u_xlat8.x;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
					    u_xlat0.x = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat8.x = floor(u_xlat0.x);
					    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
					    u_xlat0.xy = u_xlat8.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
					    vs_TEXCOORD5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
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
					uniform 	float _FaceUVSpeedX;
					uniform 	float _FaceUVSpeedY;
					uniform 	vec4 _FaceColor;
					uniform 	float _OutlineSoftness;
					uniform 	float _OutlineUVSpeedX;
					uniform 	float _OutlineUVSpeedY;
					uniform 	vec4 _OutlineColor;
					uniform 	float _OutlineWidth;
					uniform 	float _ScaleRatioA;
					uniform 	vec4 _ClipRect;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _FaceTex;
					UNITY_LOCATION(2) uniform  sampler2D _OutlineTex;
					in  vec4 vs_COLOR0;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					float u_xlat5;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat10_0.w + (-vs_TEXCOORD1.x);
					    u_xlat4 = (-u_xlat10_0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
					    u_xlat8.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
					    u_xlat4 = u_xlat8.x * u_xlat12;
					    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
					    u_xlat10_1 = texture(_OutlineTex, u_xlat8.xy);
					    u_xlat1 = u_xlat10_1 * _OutlineColor;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
					    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
					    u_xlat10_3 = texture(_FaceTex, u_xlat8.xy);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.xyz;
					    u_xlat3.w = u_xlat10_3.w * _FaceColor.w;
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
					    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
					    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x / u_xlat4;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat5 = u_xlat0.w * u_xlat1.x + -0.00100000005;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
					    u_xlatb0 = u_xlat5<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 535
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %12 %121 %125 %126 %129 %131 %134 %261 %270 %376 %470 %503 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpDecorate %12 Location 12 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpDecorate %22 ArrayStride 22 
					                                                      OpMemberDecorate %23 0 Offset 23 
					                                                      OpMemberDecorate %23 1 Offset 23 
					                                                      OpMemberDecorate %23 2 Offset 23 
					                                                      OpMemberDecorate %23 3 Offset 23 
					                                                      OpMemberDecorate %23 4 Offset 23 
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
					                                                      OpDecorate %23 Block 
					                                                      OpDecorate %25 DescriptorSet 25 
					                                                      OpDecorate %25 Binding 25 
					                                                      OpMemberDecorate %119 0 BuiltIn 119 
					                                                      OpMemberDecorate %119 1 BuiltIn 119 
					                                                      OpMemberDecorate %119 2 BuiltIn 119 
					                                                      OpDecorate %119 Block 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %125 Location 125 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %126 Location 126 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 129 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %134 Location 134 
					                                                      OpDecorate vs_TEXCOORD2 Location 261 
					                                                      OpDecorate %270 Location 270 
					                                                      OpDecorate vs_TEXCOORD1 Location 376 
					                                                      OpDecorate vs_TEXCOORD3 Location 470 
					                                                      OpDecorate vs_TEXCOORD5 Location 503 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                                 Input f32_4* %12 = OpVariable Input 
					                                              %13 = OpTypeVector %6 2 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %10 %17 
					                                              %19 = OpTypeArray %10 %17 
					                                              %20 = OpTypeArray %10 %17 
					                                              %21 = OpTypeArray %10 %17 
					                                              %22 = OpTypeArray %10 %17 
					                                              %23 = OpTypeStruct %7 %10 %18 %19 %20 %21 %6 %6 %6 %22 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 %10 %10 
					                                              %24 = OpTypePointer Uniform %23 
					Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32; f32_4[4]; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %25 = OpVariable Uniform 
					                                              %26 = OpTypeInt 32 1 
					                                          i32 %27 = OpConstant 13 
					                                              %28 = OpTypePointer Uniform %6 
					                                          i32 %31 = OpConstant 14 
					                                              %38 = OpTypePointer Private %10 
					                               Private f32_4* %39 = OpVariable Private 
					                                          i32 %42 = OpConstant 2 
					                                          i32 %43 = OpConstant 1 
					                                              %44 = OpTypePointer Uniform %10 
					                                          i32 %48 = OpConstant 0 
					                               Private f32_4* %63 = OpVariable Private 
					                                          i32 %65 = OpConstant 3 
					                                              %83 = OpTypePointer Uniform %7 
					                               Private f32_4* %89 = OpVariable Private 
					                                          i32 %92 = OpConstant 5 
					                                         u32 %117 = OpConstant 1 
					                                             %118 = OpTypeArray %6 %117 
					                                             %119 = OpTypeStruct %10 %6 %118 
					                                             %120 = OpTypePointer Output %119 
					        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
					                                             %123 = OpTypePointer Output %10 
					                               Output f32_4* %125 = OpVariable Output 
					                                Input f32_4* %126 = OpVariable Input 
					                                             %128 = OpTypePointer Output %13 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %130 = OpTypePointer Input %13 
					                                Input f32_2* %131 = OpVariable Input 
					                                             %133 = OpTypePointer Input %7 
					                                Input f32_3* %134 = OpVariable Input 
					                                         u32 %140 = OpConstant 0 
					                                             %141 = OpTypePointer Private %6 
					                                         u32 %154 = OpConstant 2 
					                                             %156 = OpTypePointer Private %13 
					                              Private f32_2* %157 = OpVariable Private 
					                                         i32 %201 = OpConstant 4 
					                                         i32 %223 = OpConstant 19 
					                                         i32 %226 = OpConstant 20 
					                                Private f32* %240 = OpVariable Private 
					                                         i32 %246 = OpConstant 16 
					                                         i32 %249 = OpConstant 17 
					                                         f32 %253 = OpConstant 3,674022E-40 
					                                       f32_2 %254 = OpConstantComposite %253 %253 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Private f32* %269 = OpVariable Private 
					                                Input f32_2* %270 = OpVariable Input 
					                                             %271 = OpTypePointer Input %6 
					                                         i32 %275 = OpConstant 18 
					                                         f32 %283 = OpConstant 3,674022E-40 
					                                         i32 %285 = OpConstant 21 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %313 = OpTypeBool 
					                                             %314 = OpTypePointer Private %313 
					                               Private bool* %315 = OpVariable Private 
					                                         u32 %316 = OpConstant 3 
					                                         f32 %319 = OpConstant 3,674022E-40 
					                              Private f32_3* %321 = OpVariable Private 
					                                             %323 = OpTypePointer Function %6 
					                               Private bool* %333 = OpVariable Private 
					                                         i32 %340 = OpConstant 10 
					                                         i32 %344 = OpConstant 11 
					                                         i32 %359 = OpConstant 6 
					                                         i32 %366 = OpConstant 12 
					                                         f32 %373 = OpConstant 3,674022E-40 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                         i32 %384 = OpConstant 8 
					                                         i32 %392 = OpConstant 7 
					                                             %412 = OpTypePointer Output %6 
					                                         i32 %425 = OpConstant 15 
					                                         f32 %428 = OpConstant 3,674022E-40 
					                                       f32_4 %429 = OpConstantComposite %428 %428 %428 %428 
					                                         f32 %432 = OpConstant 3,674022E-40 
					                                       f32_4 %433 = OpConstantComposite %432 %432 %432 %432 
					                                         f32 %437 = OpConstant 3,674022E-40 
					                                       f32_2 %438 = OpConstantComposite %437 %437 
					                                         i32 %456 = OpConstant 9 
					                                             %469 = OpTypePointer Output %7 
					                       Output f32_3* vs_TEXCOORD3 = OpVariable Output 
					                                         f32 %481 = OpConstant 3,674022E-40 
					                                         f32 %491 = OpConstant 3,674022E-40 
					                                         f32 %498 = OpConstant 3,674022E-40 
					                                       f32_2 %499 = OpConstantComposite %498 %498 
					                       Output f32_4* vs_TEXCOORD5 = OpVariable Output 
					                                         i32 %506 = OpConstant 22 
					                                         i32 %519 = OpConstant 23 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %324 = OpVariable Function 
					                                        f32_4 %14 = OpLoad %12 
					                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
					                                 Uniform f32* %29 = OpAccessChain %25 %27 
					                                          f32 %30 = OpLoad %29 
					                                 Uniform f32* %32 = OpAccessChain %25 %31 
					                                          f32 %33 = OpLoad %32 
					                                        f32_2 %34 = OpCompositeConstruct %30 %33 
					                                        f32_2 %35 = OpFAdd %15 %34 
					                                        f32_3 %36 = OpLoad %9 
					                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
					                                                      OpStore %9 %37 
					                                        f32_3 %40 = OpLoad %9 
					                                        f32_4 %41 = OpVectorShuffle %40 %40 1 1 1 1 
					                               Uniform f32_4* %45 = OpAccessChain %25 %42 %43 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_4 %47 = OpFMul %41 %46 
					                                                      OpStore %39 %47 
					                               Uniform f32_4* %49 = OpAccessChain %25 %42 %48 
					                                        f32_4 %50 = OpLoad %49 
					                                        f32_3 %51 = OpLoad %9 
					                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 0 0 
					                                        f32_4 %53 = OpFMul %50 %52 
					                                        f32_4 %54 = OpLoad %39 
					                                        f32_4 %55 = OpFAdd %53 %54 
					                                                      OpStore %39 %55 
					                               Uniform f32_4* %56 = OpAccessChain %25 %42 %42 
					                                        f32_4 %57 = OpLoad %56 
					                                        f32_4 %58 = OpLoad %12 
					                                        f32_4 %59 = OpVectorShuffle %58 %58 2 2 2 2 
					                                        f32_4 %60 = OpFMul %57 %59 
					                                        f32_4 %61 = OpLoad %39 
					                                        f32_4 %62 = OpFAdd %60 %61 
					                                                      OpStore %39 %62 
					                                        f32_4 %64 = OpLoad %39 
					                               Uniform f32_4* %66 = OpAccessChain %25 %42 %65 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_4 %68 = OpFAdd %64 %67 
					                                                      OpStore %63 %68 
					                               Uniform f32_4* %69 = OpAccessChain %25 %42 %65 
					                                        f32_4 %70 = OpLoad %69 
					                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                        f32_4 %72 = OpLoad %12 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
					                                        f32_3 %74 = OpFMul %71 %73 
					                                        f32_4 %75 = OpLoad %39 
					                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
					                                        f32_3 %77 = OpFAdd %74 %76 
					                                        f32_4 %78 = OpLoad %39 
					                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
					                                                      OpStore %39 %79 
					                                        f32_4 %80 = OpLoad %39 
					                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
					                                        f32_3 %82 = OpFNegate %81 
					                               Uniform f32_3* %84 = OpAccessChain %25 %48 
					                                        f32_3 %85 = OpLoad %84 
					                                        f32_3 %86 = OpFAdd %82 %85 
					                                        f32_4 %87 = OpLoad %39 
					                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
					                                                      OpStore %39 %88 
					                                        f32_4 %90 = OpLoad %63 
					                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
					                               Uniform f32_4* %93 = OpAccessChain %25 %92 %43 
					                                        f32_4 %94 = OpLoad %93 
					                                        f32_4 %95 = OpFMul %91 %94 
					                                                      OpStore %89 %95 
					                               Uniform f32_4* %96 = OpAccessChain %25 %92 %48 
					                                        f32_4 %97 = OpLoad %96 
					                                        f32_4 %98 = OpLoad %63 
					                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
					                                       f32_4 %100 = OpFMul %97 %99 
					                                       f32_4 %101 = OpLoad %89 
					                                       f32_4 %102 = OpFAdd %100 %101 
					                                                      OpStore %89 %102 
					                              Uniform f32_4* %103 = OpAccessChain %25 %92 %42 
					                                       f32_4 %104 = OpLoad %103 
					                                       f32_4 %105 = OpLoad %63 
					                                       f32_4 %106 = OpVectorShuffle %105 %105 2 2 2 2 
					                                       f32_4 %107 = OpFMul %104 %106 
					                                       f32_4 %108 = OpLoad %89 
					                                       f32_4 %109 = OpFAdd %107 %108 
					                                                      OpStore %89 %109 
					                              Uniform f32_4* %110 = OpAccessChain %25 %92 %65 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_4 %112 = OpLoad %63 
					                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
					                                       f32_4 %114 = OpFMul %111 %113 
					                                       f32_4 %115 = OpLoad %89 
					                                       f32_4 %116 = OpFAdd %114 %115 
					                                                      OpStore %63 %116 
					                                       f32_4 %122 = OpLoad %63 
					                               Output f32_4* %124 = OpAccessChain %121 %48 
					                                                      OpStore %124 %122 
					                                       f32_4 %127 = OpLoad %126 
					                                                      OpStore %125 %127 
					                                       f32_2 %132 = OpLoad %131 
					                                                      OpStore vs_TEXCOORD0 %132 
					                                       f32_3 %135 = OpLoad %134 
					                              Uniform f32_4* %136 = OpAccessChain %25 %65 %48 
					                                       f32_4 %137 = OpLoad %136 
					                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
					                                         f32 %139 = OpDot %135 %138 
					                                Private f32* %142 = OpAccessChain %63 %140 
					                                                      OpStore %142 %139 
					                                       f32_3 %143 = OpLoad %134 
					                              Uniform f32_4* %144 = OpAccessChain %25 %65 %43 
					                                       f32_4 %145 = OpLoad %144 
					                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
					                                         f32 %147 = OpDot %143 %146 
					                                Private f32* %148 = OpAccessChain %63 %117 
					                                                      OpStore %148 %147 
					                                       f32_3 %149 = OpLoad %134 
					                              Uniform f32_4* %150 = OpAccessChain %25 %65 %42 
					                                       f32_4 %151 = OpLoad %150 
					                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
					                                         f32 %153 = OpDot %149 %152 
					                                Private f32* %155 = OpAccessChain %63 %154 
					                                                      OpStore %155 %153 
					                                       f32_4 %158 = OpLoad %63 
					                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                                       f32_4 %160 = OpLoad %63 
					                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
					                                         f32 %162 = OpDot %159 %161 
					                                Private f32* %163 = OpAccessChain %157 %140 
					                                                      OpStore %163 %162 
					                                Private f32* %164 = OpAccessChain %157 %140 
					                                         f32 %165 = OpLoad %164 
					                                         f32 %166 = OpExtInst %1 32 %165 
					                                Private f32* %167 = OpAccessChain %157 %140 
					                                                      OpStore %167 %166 
					                                       f32_2 %168 = OpLoad %157 
					                                       f32_3 %169 = OpVectorShuffle %168 %168 0 0 0 
					                                       f32_4 %170 = OpLoad %63 
					                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
					                                       f32_3 %172 = OpFMul %169 %171 
					                                       f32_4 %173 = OpLoad %63 
					                                       f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
					                                                      OpStore %63 %174 
					                                       f32_4 %175 = OpLoad %39 
					                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
					                                       f32_4 %177 = OpLoad %39 
					                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
					                                         f32 %179 = OpDot %176 %178 
					                                Private f32* %180 = OpAccessChain %157 %140 
					                                                      OpStore %180 %179 
					                                Private f32* %181 = OpAccessChain %157 %140 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpExtInst %1 32 %182 
					                                Private f32* %184 = OpAccessChain %157 %140 
					                                                      OpStore %184 %183 
					                                       f32_2 %185 = OpLoad %157 
					                                       f32_3 %186 = OpVectorShuffle %185 %185 0 0 0 
					                                       f32_4 %187 = OpLoad %39 
					                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
					                                       f32_3 %189 = OpFMul %186 %188 
					                                       f32_4 %190 = OpLoad %89 
					                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
					                                                      OpStore %89 %191 
					                                       f32_4 %192 = OpLoad %63 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                       f32_4 %194 = OpLoad %89 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                         f32 %196 = OpDot %193 %195 
					                                Private f32* %197 = OpAccessChain %157 %140 
					                                                      OpStore %197 %196 
					                              Uniform f32_4* %198 = OpAccessChain %25 %43 
					                                       f32_4 %199 = OpLoad %198 
					                                       f32_2 %200 = OpVectorShuffle %199 %199 1 1 
					                              Uniform f32_4* %202 = OpAccessChain %25 %201 %43 
					                                       f32_4 %203 = OpLoad %202 
					                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
					                                       f32_2 %205 = OpFMul %200 %204 
					                                       f32_4 %206 = OpLoad %63 
					                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 2 3 
					                                                      OpStore %63 %207 
					                              Uniform f32_4* %208 = OpAccessChain %25 %201 %48 
					                                       f32_4 %209 = OpLoad %208 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
					                              Uniform f32_4* %211 = OpAccessChain %25 %43 
					                                       f32_4 %212 = OpLoad %211 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 0 
					                                       f32_2 %214 = OpFMul %210 %213 
					                                       f32_4 %215 = OpLoad %63 
					                                       f32_2 %216 = OpVectorShuffle %215 %215 0 1 
					                                       f32_2 %217 = OpFAdd %214 %216 
					                                       f32_4 %218 = OpLoad %63 
					                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
					                                                      OpStore %63 %219 
					                                       f32_4 %220 = OpLoad %63 
					                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
					                                       f32_2 %222 = OpExtInst %1 4 %221 
					                                Uniform f32* %224 = OpAccessChain %25 %223 
					                                         f32 %225 = OpLoad %224 
					                                Uniform f32* %227 = OpAccessChain %25 %226 
					                                         f32 %228 = OpLoad %227 
					                                       f32_2 %229 = OpCompositeConstruct %225 %228 
					                                       f32_2 %230 = OpFMul %222 %229 
					                                       f32_4 %231 = OpLoad %63 
					                                       f32_4 %232 = OpVectorShuffle %231 %230 4 5 2 3 
					                                                      OpStore %63 %232 
					                                       f32_4 %233 = OpLoad %63 
					                                       f32_2 %234 = OpVectorShuffle %233 %233 3 3 
					                                       f32_4 %235 = OpLoad %63 
					                                       f32_2 %236 = OpVectorShuffle %235 %235 0 1 
					                                       f32_2 %237 = OpFDiv %234 %236 
					                                       f32_4 %238 = OpLoad %63 
					                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 2 3 
					                                                      OpStore %63 %239 
					                                       f32_4 %241 = OpLoad %63 
					                                       f32_2 %242 = OpVectorShuffle %241 %241 0 1 
					                                       f32_4 %243 = OpLoad %63 
					                                       f32_2 %244 = OpVectorShuffle %243 %243 0 1 
					                                         f32 %245 = OpDot %242 %244 
					                                                      OpStore %240 %245 
					                                Uniform f32* %247 = OpAccessChain %25 %246 
					                                         f32 %248 = OpLoad %247 
					                                Uniform f32* %250 = OpAccessChain %25 %249 
					                                         f32 %251 = OpLoad %250 
					                                       f32_2 %252 = OpCompositeConstruct %248 %251 
					                                       f32_2 %255 = OpFMul %252 %254 
					                                       f32_4 %256 = OpLoad %63 
					                                       f32_2 %257 = OpVectorShuffle %256 %256 0 1 
					                                       f32_2 %258 = OpFAdd %255 %257 
					                                       f32_4 %259 = OpLoad %63 
					                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 2 3 
					                                                      OpStore %63 %260 
					                                       f32_4 %262 = OpLoad %63 
					                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
					                                       f32_2 %264 = OpFDiv %254 %263 
					                                       f32_4 %265 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %266 = OpVectorShuffle %265 %264 0 1 4 5 
					                                                      OpStore vs_TEXCOORD2 %266 
					                                         f32 %267 = OpLoad %240 
					                                         f32 %268 = OpExtInst %1 32 %267 
					                                                      OpStore %240 %268 
					                                  Input f32* %272 = OpAccessChain %270 %117 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpExtInst %1 4 %273 
					                                Uniform f32* %276 = OpAccessChain %25 %275 
					                                         f32 %277 = OpLoad %276 
					                                         f32 %278 = OpFMul %274 %277 
					                                                      OpStore %269 %278 
					                                         f32 %279 = OpLoad %240 
					                                         f32 %280 = OpLoad %269 
					                                         f32 %281 = OpFMul %279 %280 
					                                                      OpStore %240 %281 
					                                         f32 %282 = OpLoad %240 
					                                         f32 %284 = OpFMul %282 %283 
					                                                      OpStore %269 %284 
					                                Uniform f32* %286 = OpAccessChain %25 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFNegate %287 
					                                         f32 %290 = OpFAdd %288 %289 
					                                Private f32* %291 = OpAccessChain %63 %140 
					                                                      OpStore %291 %290 
					                                         f32 %292 = OpLoad %269 
					                                         f32 %293 = OpExtInst %1 4 %292 
					                                Private f32* %294 = OpAccessChain %63 %140 
					                                         f32 %295 = OpLoad %294 
					                                         f32 %296 = OpFMul %293 %295 
					                                Private f32* %297 = OpAccessChain %63 %140 
					                                                      OpStore %297 %296 
					                                         f32 %298 = OpLoad %240 
					                                         f32 %299 = OpFMul %298 %283 
					                                Private f32* %300 = OpAccessChain %63 %140 
					                                         f32 %301 = OpLoad %300 
					                                         f32 %302 = OpFNegate %301 
					                                         f32 %303 = OpFAdd %299 %302 
					                                                      OpStore %240 %303 
					                                Private f32* %304 = OpAccessChain %157 %140 
					                                         f32 %305 = OpLoad %304 
					                                         f32 %306 = OpExtInst %1 4 %305 
					                                         f32 %307 = OpLoad %240 
					                                         f32 %308 = OpFMul %306 %307 
					                                Private f32* %309 = OpAccessChain %63 %140 
					                                         f32 %310 = OpLoad %309 
					                                         f32 %311 = OpFAdd %308 %310 
					                                Private f32* %312 = OpAccessChain %157 %140 
					                                                      OpStore %312 %311 
					                                Uniform f32* %317 = OpAccessChain %25 %201 %65 %316 
					                                         f32 %318 = OpLoad %317 
					                                        bool %320 = OpFOrdEqual %318 %319 
					                                                      OpStore %315 %320 
					                                        bool %322 = OpLoad %315 
					                                                      OpSelectionMerge %326 None 
					                                                      OpBranchConditional %322 %325 %329 
					                                             %325 = OpLabel 
					                                Private f32* %327 = OpAccessChain %157 %140 
					                                         f32 %328 = OpLoad %327 
					                                                      OpStore %324 %328 
					                                                      OpBranch %326 
					                                             %329 = OpLabel 
					                                         f32 %330 = OpLoad %269 
					                                                      OpStore %324 %330 
					                                                      OpBranch %326 
					                                             %326 = OpLabel 
					                                         f32 %331 = OpLoad %324 
					                                Private f32* %332 = OpAccessChain %321 %140 
					                                                      OpStore %332 %331 
					                                  Input f32* %334 = OpAccessChain %270 %117 
					                                         f32 %335 = OpLoad %334 
					                                        bool %336 = OpFOrdGreaterThanEqual %319 %335 
					                                                      OpStore %333 %336 
					                                        bool %337 = OpLoad %333 
					                                         f32 %338 = OpSelect %337 %289 %319 
					                                Private f32* %339 = OpAccessChain %157 %140 
					                                                      OpStore %339 %338 
					                                Uniform f32* %341 = OpAccessChain %25 %340 
					                                         f32 %342 = OpLoad %341 
					                                         f32 %343 = OpFNegate %342 
					                                Uniform f32* %345 = OpAccessChain %25 %344 
					                                         f32 %346 = OpLoad %345 
					                                         f32 %347 = OpFAdd %343 %346 
					                                                      OpStore %240 %347 
					                                Private f32* %348 = OpAccessChain %157 %140 
					                                         f32 %349 = OpLoad %348 
					                                         f32 %350 = OpLoad %240 
					                                         f32 %351 = OpFMul %349 %350 
					                                Uniform f32* %352 = OpAccessChain %25 %340 
					                                         f32 %353 = OpLoad %352 
					                                         f32 %354 = OpFAdd %351 %353 
					                                Private f32* %355 = OpAccessChain %157 %140 
					                                                      OpStore %355 %354 
					                                Private f32* %356 = OpAccessChain %157 %140 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %358 = OpFMul %357 %253 
					                                Uniform f32* %360 = OpAccessChain %25 %359 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpFAdd %358 %361 
					                                Private f32* %363 = OpAccessChain %157 %140 
					                                                      OpStore %363 %362 
					                                Private f32* %364 = OpAccessChain %157 %140 
					                                         f32 %365 = OpLoad %364 
					                                Uniform f32* %367 = OpAccessChain %25 %366 
					                                         f32 %368 = OpLoad %367 
					                                         f32 %369 = OpFMul %365 %368 
					                                Private f32* %370 = OpAccessChain %157 %140 
					                                                      OpStore %370 %369 
					                                Private f32* %371 = OpAccessChain %157 %140 
					                                         f32 %372 = OpLoad %371 
					                                         f32 %374 = OpFMul %372 %373 
					                                Private f32* %375 = OpAccessChain %321 %154 
					                                                      OpStore %375 %374 
					                                       f32_3 %377 = OpLoad %321 
					                                       f32_2 %378 = OpVectorShuffle %377 %377 0 2 
					                                       f32_4 %379 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %380 = OpVectorShuffle %379 %378 0 4 2 5 
					                                                      OpStore vs_TEXCOORD1 %380 
					                                Private f32* %381 = OpAccessChain %321 %140 
					                                         f32 %382 = OpLoad %381 
					                                         f32 %383 = OpFDiv %373 %382 
					                                                      OpStore %240 %383 
					                                Uniform f32* %385 = OpAccessChain %25 %384 
					                                         f32 %386 = OpLoad %385 
					                                         f32 %387 = OpFNegate %386 
					                                Uniform f32* %388 = OpAccessChain %25 %366 
					                                         f32 %389 = OpLoad %388 
					                                         f32 %390 = OpFMul %387 %389 
					                                         f32 %391 = OpFAdd %390 %289 
					                                                      OpStore %269 %391 
					                                Uniform f32* %393 = OpAccessChain %25 %392 
					                                         f32 %394 = OpLoad %393 
					                                         f32 %395 = OpFNegate %394 
					                                Uniform f32* %396 = OpAccessChain %25 %366 
					                                         f32 %397 = OpLoad %396 
					                                         f32 %398 = OpFMul %395 %397 
					                                         f32 %399 = OpLoad %269 
					                                         f32 %400 = OpFAdd %398 %399 
					                                                      OpStore %269 %400 
					                                         f32 %401 = OpLoad %269 
					                                         f32 %402 = OpFMul %401 %373 
					                                         f32 %403 = OpLoad %240 
					                                         f32 %404 = OpFNegate %403 
					                                         f32 %405 = OpFAdd %402 %404 
					                                                      OpStore %269 %405 
					                                Private f32* %406 = OpAccessChain %157 %140 
					                                         f32 %407 = OpLoad %406 
					                                         f32 %408 = OpFNegate %407 
					                                         f32 %409 = OpFMul %408 %373 
					                                         f32 %410 = OpLoad %269 
					                                         f32 %411 = OpFAdd %409 %410 
					                                 Output f32* %413 = OpAccessChain vs_TEXCOORD1 %140 
					                                                      OpStore %413 %411 
					                                Private f32* %414 = OpAccessChain %157 %140 
					                                         f32 %415 = OpLoad %414 
					                                         f32 %416 = OpFNegate %415 
					                                         f32 %417 = OpFMul %416 %373 
					                                         f32 %418 = OpFAdd %417 %373 
					                                Private f32* %419 = OpAccessChain %157 %140 
					                                                      OpStore %419 %418 
					                                         f32 %420 = OpLoad %240 
					                                Private f32* %421 = OpAccessChain %157 %140 
					                                         f32 %422 = OpLoad %421 
					                                         f32 %423 = OpFAdd %420 %422 
					                                 Output f32* %424 = OpAccessChain vs_TEXCOORD1 %154 
					                                                      OpStore %424 %423 
					                              Uniform f32_4* %426 = OpAccessChain %25 %425 
					                                       f32_4 %427 = OpLoad %426 
					                                       f32_4 %430 = OpExtInst %1 40 %427 %429 
					                                                      OpStore %63 %430 
					                                       f32_4 %431 = OpLoad %63 
					                                       f32_4 %434 = OpExtInst %1 37 %431 %433 
					                                                      OpStore %63 %434 
					                                       f32_3 %435 = OpLoad %9 
					                                       f32_2 %436 = OpVectorShuffle %435 %435 0 1 
					                                       f32_2 %439 = OpFMul %436 %438 
					                                       f32_4 %440 = OpLoad %63 
					                                       f32_2 %441 = OpVectorShuffle %440 %440 0 1 
					                                       f32_2 %442 = OpFNegate %441 
					                                       f32_2 %443 = OpFAdd %439 %442 
					                                       f32_3 %444 = OpLoad %9 
					                                       f32_3 %445 = OpVectorShuffle %444 %443 3 4 2 
					                                                      OpStore %9 %445 
					                                       f32_4 %446 = OpLoad %63 
					                                       f32_2 %447 = OpVectorShuffle %446 %446 2 3 
					                                       f32_2 %448 = OpFNegate %447 
					                                       f32_3 %449 = OpLoad %9 
					                                       f32_2 %450 = OpVectorShuffle %449 %449 0 1 
					                                       f32_2 %451 = OpFAdd %448 %450 
					                                       f32_4 %452 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %453 = OpVectorShuffle %452 %451 4 5 2 3 
					                                                      OpStore vs_TEXCOORD2 %453 
					                                       f32_4 %454 = OpLoad %39 
					                                       f32_3 %455 = OpVectorShuffle %454 %454 1 1 1 
					                              Uniform f32_4* %457 = OpAccessChain %25 %456 %43 
					                                       f32_4 %458 = OpLoad %457 
					                                       f32_3 %459 = OpVectorShuffle %458 %458 0 1 2 
					                                       f32_3 %460 = OpFMul %455 %459 
					                                                      OpStore %9 %460 
					                              Uniform f32_4* %461 = OpAccessChain %25 %456 %48 
					                                       f32_4 %462 = OpLoad %461 
					                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
					                                       f32_4 %464 = OpLoad %39 
					                                       f32_3 %465 = OpVectorShuffle %464 %464 0 0 0 
					                                       f32_3 %466 = OpFMul %463 %465 
					                                       f32_3 %467 = OpLoad %9 
					                                       f32_3 %468 = OpFAdd %466 %467 
					                                                      OpStore %9 %468 
					                              Uniform f32_4* %471 = OpAccessChain %25 %456 %42 
					                                       f32_4 %472 = OpLoad %471 
					                                       f32_3 %473 = OpVectorShuffle %472 %472 0 1 2 
					                                       f32_4 %474 = OpLoad %39 
					                                       f32_3 %475 = OpVectorShuffle %474 %474 2 2 2 
					                                       f32_3 %476 = OpFMul %473 %475 
					                                       f32_3 %477 = OpLoad %9 
					                                       f32_3 %478 = OpFAdd %476 %477 
					                                                      OpStore vs_TEXCOORD3 %478 
					                                  Input f32* %479 = OpAccessChain %270 %140 
					                                         f32 %480 = OpLoad %479 
					                                         f32 %482 = OpFMul %480 %481 
					                                Private f32* %483 = OpAccessChain %9 %140 
					                                                      OpStore %483 %482 
					                                Private f32* %484 = OpAccessChain %9 %140 
					                                         f32 %485 = OpLoad %484 
					                                         f32 %486 = OpExtInst %1 8 %485 
					                                Private f32* %487 = OpAccessChain %157 %140 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %157 %140 
					                                         f32 %489 = OpLoad %488 
					                                         f32 %490 = OpFNegate %489 
					                                         f32 %492 = OpFMul %490 %491 
					                                  Input f32* %493 = OpAccessChain %270 %140 
					                                         f32 %494 = OpLoad %493 
					                                         f32 %495 = OpFAdd %492 %494 
					                                Private f32* %496 = OpAccessChain %157 %117 
					                                                      OpStore %496 %495 
					                                       f32_2 %497 = OpLoad %157 
					                                       f32_2 %500 = OpFMul %497 %499 
					                                       f32_3 %501 = OpLoad %9 
					                                       f32_3 %502 = OpVectorShuffle %501 %500 3 4 2 
					                                                      OpStore %9 %502 
					                                       f32_3 %504 = OpLoad %9 
					                                       f32_2 %505 = OpVectorShuffle %504 %504 0 1 
					                              Uniform f32_4* %507 = OpAccessChain %25 %506 
					                                       f32_4 %508 = OpLoad %507 
					                                       f32_2 %509 = OpVectorShuffle %508 %508 0 1 
					                                       f32_2 %510 = OpFMul %505 %509 
					                              Uniform f32_4* %511 = OpAccessChain %25 %506 
					                                       f32_4 %512 = OpLoad %511 
					                                       f32_2 %513 = OpVectorShuffle %512 %512 2 3 
					                                       f32_2 %514 = OpFAdd %510 %513 
					                                       f32_4 %515 = OpLoad vs_TEXCOORD5 
					                                       f32_4 %516 = OpVectorShuffle %515 %514 4 5 2 3 
					                                                      OpStore vs_TEXCOORD5 %516 
					                                       f32_3 %517 = OpLoad %9 
					                                       f32_2 %518 = OpVectorShuffle %517 %517 0 1 
					                              Uniform f32_4* %520 = OpAccessChain %25 %519 
					                                       f32_4 %521 = OpLoad %520 
					                                       f32_2 %522 = OpVectorShuffle %521 %521 0 1 
					                                       f32_2 %523 = OpFMul %518 %522 
					                              Uniform f32_4* %524 = OpAccessChain %25 %519 
					                                       f32_4 %525 = OpLoad %524 
					                                       f32_2 %526 = OpVectorShuffle %525 %525 2 3 
					                                       f32_2 %527 = OpFAdd %523 %526 
					                                       f32_4 %528 = OpLoad vs_TEXCOORD5 
					                                       f32_4 %529 = OpVectorShuffle %528 %527 0 1 4 5 
					                                                      OpStore vs_TEXCOORD5 %529 
					                                 Output f32* %530 = OpAccessChain %121 %48 %117 
					                                         f32 %531 = OpLoad %530 
					                                         f32 %532 = OpFNegate %531 
					                                 Output f32* %533 = OpAccessChain %121 %48 %117 
					                                                      OpStore %533 %532 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 328
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %22 %35 %127 %147 %282 %312 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD5 "vs_TEXCOORD5" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %12 RelaxedPrecision 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %16 RelaxedPrecision 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %17 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 22 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 35 
					                                                      OpDecorate %44 RelaxedPrecision 
					                                                      OpDecorate %45 RelaxedPrecision 
					                                                      OpMemberDecorate %68 0 Offset 68 
					                                                      OpMemberDecorate %68 1 Offset 68 
					                                                      OpMemberDecorate %68 2 Offset 68 
					                                                      OpMemberDecorate %68 3 RelaxedPrecision 
					                                                      OpMemberDecorate %68 3 Offset 68 
					                                                      OpMemberDecorate %68 4 Offset 68 
					                                                      OpMemberDecorate %68 5 Offset 68 
					                                                      OpMemberDecorate %68 6 Offset 68 
					                                                      OpMemberDecorate %68 7 RelaxedPrecision 
					                                                      OpMemberDecorate %68 7 Offset 68 
					                                                      OpMemberDecorate %68 8 Offset 68 
					                                                      OpMemberDecorate %68 9 Offset 68 
					                                                      OpMemberDecorate %68 10 Offset 68 
					                                                      OpDecorate %68 Block 
					                                                      OpDecorate %70 DescriptorSet 70 
					                                                      OpDecorate %70 Binding 70 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD5 Location 127 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 DescriptorSet 131 
					                                                      OpDecorate %131 Binding 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %133 DescriptorSet 133 
					                                                      OpDecorate %133 Binding 133 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %147 Location 147 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %169 DescriptorSet 169 
					                                                      OpDecorate %169 Binding 169 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %171 DescriptorSet 171 
					                                                      OpDecorate %171 Binding 171 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
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
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %219 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %224 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 282 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %304 RelaxedPrecision 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %307 RelaxedPrecision 
					                                                      OpDecorate %308 RelaxedPrecision 
					                                                      OpDecorate %309 RelaxedPrecision 
					                                                      OpDecorate %310 RelaxedPrecision 
					                                                      OpDecorate %312 RelaxedPrecision 
					                                                      OpDecorate %312 Location 312 
					                                                      OpDecorate %313 RelaxedPrecision 
					                                                      OpDecorate %314 RelaxedPrecision 
					                                                      OpDecorate %315 RelaxedPrecision 
					                                                      OpDecorate %316 RelaxedPrecision 
					                                                      OpDecorate %318 RelaxedPrecision 
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
					                                              %20 = OpTypeVector %6 2 
					                                              %21 = OpTypePointer Input %20 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %25 = OpTypeInt 32 0 
					                                          u32 %26 = OpConstant 3 
					                                          u32 %28 = OpConstant 0 
					                                              %29 = OpTypePointer Private %6 
					                                 Private f32* %31 = OpVariable Private 
					                                              %34 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                              %36 = OpTypePointer Input %6 
					                                              %41 = OpTypePointer Private %20 
					                               Private f32_2* %42 = OpVariable Private 
					                                          u32 %46 = OpConstant 2 
					                                              %51 = OpTypeBool 
					                                              %52 = OpTypePointer Private %51 
					                                Private bool* %53 = OpVariable Private 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                              %58 = OpTypeInt 32 1 
					                                          i32 %59 = OpConstant 0 
					                                          i32 %60 = OpConstant 1 
					                                          i32 %62 = OpConstant -1 
					                                              %68 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 %7 %6 %6 %7 
					                                              %69 = OpTypePointer Uniform %68 
					Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32; f32_4; f32; f32; f32_4;}* %70 = OpVariable Uniform 
					                                          i32 %71 = OpConstant 8 
					                                              %72 = OpTypePointer Uniform %6 
					                                          i32 %75 = OpConstant 9 
					                                          u32 %80 = OpConstant 1 
					                                 Private f32* %84 = OpVariable Private 
					                                          f32 %86 = OpConstant 3,674022E-40 
					                                 Private f32* %88 = OpVariable Private 
					                                          f32 %90 = OpConstant 3,674022E-40 
					                                 Private f32* %94 = OpVariable Private 
					                                         i32 %115 = OpConstant 5 
					                                         i32 %118 = OpConstant 6 
					                                             %122 = OpTypePointer Uniform %7 
					                        Input f32_4* vs_TEXCOORD5 = OpVariable Input 
					        UniformConstant read_only Texture2D* %131 = OpVariable UniformConstant 
					                    UniformConstant sampler* %133 = OpVariable UniformConstant 
					                              Private f32_4* %138 = OpVariable Private 
					                                         i32 %140 = OpConstant 7 
					                                             %144 = OpTypeVector %6 3 
					                                             %145 = OpTypePointer Private %144 
					                              Private f32_3* %146 = OpVariable Private 
					                                Input f32_4* %147 = OpVariable Input 
					                                         i32 %150 = OpConstant 3 
					                                         i32 %157 = OpConstant 2 
					                              Private f32_4* %168 = OpVariable Private 
					        UniformConstant read_only Texture2D* %169 = OpVariable UniformConstant 
					                    UniformConstant sampler* %171 = OpVariable UniformConstant 
					                              Private f32_4* %176 = OpVariable Private 
					                                Private f32* %183 = OpVariable Private 
					                              Private f32_2* %236 = OpVariable Private 
					                                         i32 %237 = OpConstant 4 
					                                Private f32* %244 = OpVariable Private 
					                                         i32 %272 = OpConstant 10 
					                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
					                                         f32 %305 = OpConstant 3,674022E-40 
					                                             %311 = OpTypePointer Output %7 
					                               Output f32_4* %312 = OpVariable Output 
					                               Private bool* %317 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                          read_only Texture2D %13 = OpLoad %12 
					                                      sampler %17 = OpLoad %16 
					                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                          f32 %27 = OpCompositeExtract %24 3 
					                                 Private f32* %30 = OpAccessChain %9 %28 
					                                                      OpStore %30 %27 
					                                 Private f32* %32 = OpAccessChain %9 %28 
					                                          f32 %33 = OpLoad %32 
					                                   Input f32* %37 = OpAccessChain vs_TEXCOORD1 %28 
					                                          f32 %38 = OpLoad %37 
					                                          f32 %39 = OpFNegate %38 
					                                          f32 %40 = OpFAdd %33 %39 
					                                                      OpStore %31 %40 
					                                 Private f32* %43 = OpAccessChain %9 %28 
					                                          f32 %44 = OpLoad %43 
					                                          f32 %45 = OpFNegate %44 
					                                   Input f32* %47 = OpAccessChain vs_TEXCOORD1 %46 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpFAdd %45 %48 
					                                 Private f32* %50 = OpAccessChain %42 %28 
					                                                      OpStore %50 %49 
					                                          f32 %54 = OpLoad %31 
					                                         bool %56 = OpFOrdLessThan %54 %55 
					                                                      OpStore %53 %56 
					                                         bool %57 = OpLoad %53 
					                                          i32 %61 = OpSelect %57 %60 %59 
					                                          i32 %63 = OpIMul %61 %62 
					                                         bool %64 = OpINotEqual %63 %59 
					                                                      OpSelectionMerge %66 None 
					                                                      OpBranchConditional %64 %65 %66 
					                                              %65 = OpLabel 
					                                                      OpKill
					                                              %66 = OpLabel 
					                                 Uniform f32* %73 = OpAccessChain %70 %71 
					                                          f32 %74 = OpLoad %73 
					                                 Uniform f32* %76 = OpAccessChain %70 %75 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpFMul %74 %77 
					                                                      OpStore %31 %78 
					                                          f32 %79 = OpLoad %31 
					                                   Input f32* %81 = OpAccessChain vs_TEXCOORD1 %80 
					                                          f32 %82 = OpLoad %81 
					                                          f32 %83 = OpFMul %79 %82 
					                                                      OpStore %31 %83 
					                                          f32 %85 = OpLoad %31 
					                                          f32 %87 = OpExtInst %1 37 %85 %86 
					                                                      OpStore %84 %87 
					                                          f32 %89 = OpLoad %31 
					                                          f32 %91 = OpFMul %89 %90 
					                                                      OpStore %88 %91 
					                                          f32 %92 = OpLoad %84 
					                                          f32 %93 = OpExtInst %1 31 %92 
					                                                      OpStore %84 %93 
					                                 Private f32* %95 = OpAccessChain %42 %28 
					                                          f32 %96 = OpLoad %95 
					                                   Input f32* %97 = OpAccessChain vs_TEXCOORD1 %80 
					                                          f32 %98 = OpLoad %97 
					                                          f32 %99 = OpFMul %96 %98 
					                                         f32 %100 = OpLoad %88 
					                                         f32 %101 = OpFAdd %99 %100 
					                                                      OpStore %94 %101 
					                                         f32 %102 = OpLoad %94 
					                                         f32 %103 = OpExtInst %1 43 %102 %55 %86 
					                                                      OpStore %94 %103 
					                                Private f32* %104 = OpAccessChain %42 %28 
					                                         f32 %105 = OpLoad %104 
					                                  Input f32* %106 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFMul %105 %107 
					                                         f32 %109 = OpLoad %88 
					                                         f32 %110 = OpFNegate %109 
					                                         f32 %111 = OpFAdd %108 %110 
					                                                      OpStore %88 %111 
					                                         f32 %112 = OpLoad %84 
					                                         f32 %113 = OpLoad %94 
					                                         f32 %114 = OpFMul %112 %113 
					                                                      OpStore %84 %114 
					                                Uniform f32* %116 = OpAccessChain %70 %115 
					                                         f32 %117 = OpLoad %116 
					                                Uniform f32* %119 = OpAccessChain %70 %118 
					                                         f32 %120 = OpLoad %119 
					                                       f32_2 %121 = OpCompositeConstruct %117 %120 
					                              Uniform f32_4* %123 = OpAccessChain %70 %59 
					                                       f32_4 %124 = OpLoad %123 
					                                       f32_2 %125 = OpVectorShuffle %124 %124 1 1 
					                                       f32_2 %126 = OpFMul %121 %125 
					                                       f32_4 %128 = OpLoad vs_TEXCOORD5 
					                                       f32_2 %129 = OpVectorShuffle %128 %128 2 3 
					                                       f32_2 %130 = OpFAdd %126 %129 
					                                                      OpStore %42 %130 
					                         read_only Texture2D %132 = OpLoad %131 
					                                     sampler %134 = OpLoad %133 
					                  read_only Texture2DSampled %135 = OpSampledImage %132 %134 
					                                       f32_2 %136 = OpLoad %42 
					                                       f32_4 %137 = OpImageSampleImplicitLod %135 %136 
					                                                      OpStore %9 %137 
					                                       f32_4 %139 = OpLoad %9 
					                              Uniform f32_4* %141 = OpAccessChain %70 %140 
					                                       f32_4 %142 = OpLoad %141 
					                                       f32_4 %143 = OpFMul %139 %142 
					                                                      OpStore %138 %143 
					                                       f32_4 %148 = OpLoad %147 
					                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
					                              Uniform f32_4* %151 = OpAccessChain %70 %150 
					                                       f32_4 %152 = OpLoad %151 
					                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
					                                       f32_3 %154 = OpFMul %149 %153 
					                                                      OpStore %146 %154 
					                                Uniform f32* %155 = OpAccessChain %70 %60 
					                                         f32 %156 = OpLoad %155 
					                                Uniform f32* %158 = OpAccessChain %70 %157 
					                                         f32 %159 = OpLoad %158 
					                                       f32_2 %160 = OpCompositeConstruct %156 %159 
					                              Uniform f32_4* %161 = OpAccessChain %70 %59 
					                                       f32_4 %162 = OpLoad %161 
					                                       f32_2 %163 = OpVectorShuffle %162 %162 1 1 
					                                       f32_2 %164 = OpFMul %160 %163 
					                                       f32_4 %165 = OpLoad vs_TEXCOORD5 
					                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
					                                       f32_2 %167 = OpFAdd %164 %166 
					                                                      OpStore %42 %167 
					                         read_only Texture2D %170 = OpLoad %169 
					                                     sampler %172 = OpLoad %171 
					                  read_only Texture2DSampled %173 = OpSampledImage %170 %172 
					                                       f32_2 %174 = OpLoad %42 
					                                       f32_4 %175 = OpImageSampleImplicitLod %173 %174 
					                                                      OpStore %168 %175 
					                                       f32_3 %177 = OpLoad %146 
					                                       f32_4 %178 = OpLoad %168 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                       f32_3 %180 = OpFMul %177 %179 
					                                       f32_4 %181 = OpLoad %176 
					                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
					                                                      OpStore %176 %182 
					                                Private f32* %184 = OpAccessChain %168 %26 
					                                         f32 %185 = OpLoad %184 
					                                Uniform f32* %186 = OpAccessChain %70 %150 %26 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFMul %185 %187 
					                                                      OpStore %183 %188 
					                                       f32_4 %189 = OpLoad %176 
					                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
					                                         f32 %191 = OpLoad %183 
					                                       f32_3 %192 = OpCompositeConstruct %191 %191 %191 
					                                       f32_3 %193 = OpFMul %190 %192 
					                                                      OpStore %146 %193 
					                                       f32_4 %194 = OpLoad %138 
					                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                                       f32_4 %196 = OpLoad %138 
					                                       f32_3 %197 = OpVectorShuffle %196 %196 3 3 3 
					                                       f32_3 %198 = OpFMul %195 %197 
					                                       f32_3 %199 = OpLoad %146 
					                                       f32_3 %200 = OpFNegate %199 
					                                       f32_3 %201 = OpFAdd %198 %200 
					                                       f32_4 %202 = OpLoad %138 
					                                       f32_4 %203 = OpVectorShuffle %202 %201 4 5 6 3 
					                                                      OpStore %138 %203 
					                                Uniform f32* %204 = OpAccessChain %70 %140 %26 
					                                         f32 %205 = OpLoad %204 
					                                Private f32* %206 = OpAccessChain %9 %26 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFMul %205 %207 
					                                         f32 %209 = OpLoad %183 
					                                         f32 %210 = OpFNegate %209 
					                                         f32 %211 = OpFAdd %208 %210 
					                                Private f32* %212 = OpAccessChain %138 %26 
					                                                      OpStore %212 %211 
					                                         f32 %213 = OpLoad %84 
					                                       f32_4 %214 = OpCompositeConstruct %213 %213 %213 %213 
					                                       f32_4 %215 = OpLoad %138 
					                                       f32_4 %216 = OpFMul %214 %215 
					                                                      OpStore %138 %216 
					                                       f32_4 %217 = OpLoad %176 
					                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
					                                         f32 %219 = OpLoad %183 
					                                       f32_3 %220 = OpCompositeConstruct %219 %219 %219 
					                                       f32_3 %221 = OpFMul %218 %220 
					                                       f32_4 %222 = OpLoad %138 
					                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
					                                       f32_3 %224 = OpFAdd %221 %223 
					                                       f32_4 %225 = OpLoad %176 
					                                       f32_4 %226 = OpVectorShuffle %225 %224 4 5 6 3 
					                                                      OpStore %176 %226 
					                                Uniform f32* %227 = OpAccessChain %70 %150 %26 
					                                         f32 %228 = OpLoad %227 
					                                Private f32* %229 = OpAccessChain %168 %26 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFMul %228 %230 
					                                Private f32* %232 = OpAccessChain %138 %26 
					                                         f32 %233 = OpLoad %232 
					                                         f32 %234 = OpFAdd %231 %233 
					                                Private f32* %235 = OpAccessChain %176 %26 
					                                                      OpStore %235 %234 
					                                Uniform f32* %238 = OpAccessChain %70 %237 
					                                         f32 %239 = OpLoad %238 
					                                Uniform f32* %240 = OpAccessChain %70 %75 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpFMul %239 %241 
					                                Private f32* %243 = OpAccessChain %236 %28 
					                                                      OpStore %243 %242 
					                                Private f32* %245 = OpAccessChain %236 %28 
					                                         f32 %246 = OpLoad %245 
					                                  Input f32* %247 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %248 = OpLoad %247 
					                                         f32 %249 = OpFMul %246 %248 
					                                                      OpStore %244 %249 
					                                Private f32* %250 = OpAccessChain %236 %28 
					                                         f32 %251 = OpLoad %250 
					                                  Input f32* %252 = OpAccessChain vs_TEXCOORD1 %80 
					                                         f32 %253 = OpLoad %252 
					                                         f32 %254 = OpFMul %251 %253 
					                                         f32 %255 = OpFAdd %254 %86 
					                                                      OpStore %84 %255 
					                                         f32 %256 = OpLoad %244 
					                                         f32 %257 = OpFMul %256 %90 
					                                         f32 %258 = OpLoad %88 
					                                         f32 %259 = OpFAdd %257 %258 
					                                                      OpStore %88 %259 
					                                         f32 %260 = OpLoad %88 
					                                         f32 %261 = OpLoad %84 
					                                         f32 %262 = OpFDiv %260 %261 
					                                                      OpStore %84 %262 
					                                         f32 %263 = OpLoad %84 
					                                         f32 %264 = OpExtInst %1 43 %263 %55 %86 
					                                                      OpStore %84 %264 
					                                         f32 %265 = OpLoad %84 
					                                         f32 %266 = OpFNegate %265 
					                                         f32 %267 = OpFAdd %266 %86 
					                                                      OpStore %84 %267 
					                                       f32_4 %268 = OpLoad %176 
					                                         f32 %269 = OpLoad %84 
					                                       f32_4 %270 = OpCompositeConstruct %269 %269 %269 %269 
					                                       f32_4 %271 = OpFMul %268 %270 
					                                                      OpStore %176 %271 
					                              Uniform f32_4* %273 = OpAccessChain %70 %272 
					                                       f32_4 %274 = OpLoad %273 
					                                       f32_2 %275 = OpVectorShuffle %274 %274 0 1 
					                                       f32_2 %276 = OpFNegate %275 
					                              Uniform f32_4* %277 = OpAccessChain %70 %272 
					                                       f32_4 %278 = OpLoad %277 
					                                       f32_2 %279 = OpVectorShuffle %278 %278 2 3 
					                                       f32_2 %280 = OpFAdd %276 %279 
					                                                      OpStore %236 %280 
					                                       f32_2 %281 = OpLoad %236 
					                                       f32_4 %283 = OpLoad vs_TEXCOORD2 
					                                       f32_2 %284 = OpVectorShuffle %283 %283 0 1 
					                                       f32_2 %285 = OpExtInst %1 4 %284 
					                                       f32_2 %286 = OpFNegate %285 
					                                       f32_2 %287 = OpFAdd %281 %286 
					                                                      OpStore %236 %287 
					                                       f32_2 %288 = OpLoad %236 
					                                       f32_4 %289 = OpLoad vs_TEXCOORD2 
					                                       f32_2 %290 = OpVectorShuffle %289 %289 2 3 
					                                       f32_2 %291 = OpFMul %288 %290 
					                                                      OpStore %236 %291 
					                                       f32_2 %292 = OpLoad %236 
					                                       f32_2 %293 = OpCompositeConstruct %55 %55 
					                                       f32_2 %294 = OpCompositeConstruct %86 %86 
					                                       f32_2 %295 = OpExtInst %1 43 %292 %293 %294 
					                                                      OpStore %236 %295 
					                                Private f32* %296 = OpAccessChain %236 %80 
					                                         f32 %297 = OpLoad %296 
					                                Private f32* %298 = OpAccessChain %236 %28 
					                                         f32 %299 = OpLoad %298 
					                                         f32 %300 = OpFMul %297 %299 
					                                                      OpStore %84 %300 
					                                Private f32* %301 = OpAccessChain %176 %26 
					                                         f32 %302 = OpLoad %301 
					                                         f32 %303 = OpLoad %84 
					                                         f32 %304 = OpFMul %302 %303 
					                                         f32 %306 = OpFAdd %304 %305 
					                                                      OpStore %88 %306 
					                                       f32_4 %307 = OpLoad %176 
					                                         f32 %308 = OpLoad %84 
					                                       f32_4 %309 = OpCompositeConstruct %308 %308 %308 %308 
					                                       f32_4 %310 = OpFMul %307 %309 
					                                                      OpStore %176 %310 
					                                       f32_4 %313 = OpLoad %176 
					                                       f32_4 %314 = OpLoad %147 
					                                       f32_4 %315 = OpVectorShuffle %314 %314 3 3 3 3 
					                                       f32_4 %316 = OpFMul %313 %315 
					                                                      OpStore %312 %316 
					                                         f32 %318 = OpLoad %88 
					                                        bool %319 = OpFOrdLessThan %318 %55 
					                                                      OpStore %317 %319 
					                                        bool %320 = OpLoad %317 
					                                         i32 %321 = OpSelect %320 %60 %59 
					                                         i32 %322 = OpIMul %321 %62 
					                                        bool %323 = OpINotEqual %322 %59 
					                                                      OpSelectionMerge %325 None 
					                                                      OpBranchConditional %323 %324 %325 
					                                             %324 = OpLabel 
					                                                      OpKill
					                                             %325 = OpLabel 
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
						vec4 unused_0_0[2];
						float _FaceUVSpeedX;
						float _FaceUVSpeedY;
						vec4 _FaceColor;
						float _OutlineSoftness;
						float _OutlineUVSpeedX;
						float _OutlineUVSpeedY;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_9[15];
						float _ScaleRatioA;
						vec4 unused_0_11[8];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FaceTex;
					uniform  sampler2D _OutlineTex;
					in  vec4 vs_COLOR0;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat10_0.w + (-vs_TEXCOORD1.x);
					    u_xlat4 = (-u_xlat10_0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
					    u_xlat8.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
					    u_xlat4 = u_xlat8.x * u_xlat12;
					    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
					    u_xlat10_1 = texture(_OutlineTex, u_xlat8.xy);
					    u_xlat1 = u_xlat10_1 * _OutlineColor;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
					    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
					    u_xlat10_3 = texture(_FaceTex, u_xlat8.xy);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.xyz;
					    u_xlat3.w = u_xlat10_3.w * _FaceColor.w;
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
					    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
					    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x / u_xlat4;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_ALPHACLIP" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _FaceUVSpeedX;
						float _FaceUVSpeedY;
						vec4 _FaceColor;
						float _OutlineSoftness;
						float _OutlineUVSpeedX;
						float _OutlineUVSpeedY;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_9[15];
						float _ScaleRatioA;
						vec4 unused_0_11[8];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FaceTex;
					uniform  sampler2D _OutlineTex;
					in  vec4 vs_COLOR0;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0.w + (-vs_TEXCOORD1.x);
					    u_xlat4 = (-u_xlat10_0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0 = _OutlineWidth * _ScaleRatioA;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD1.y;
					    u_xlat8.x = min(u_xlat0, 1.0);
					    u_xlat0 = u_xlat0 * 0.5;
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0 = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0);
					    u_xlat4 = u_xlat8.x * u_xlat12;
					    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
					    u_xlat10_1 = texture(_OutlineTex, u_xlat8.xy);
					    u_xlat1 = u_xlat10_1 * _OutlineColor;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
					    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
					    u_xlat10_3 = texture(_FaceTex, u_xlat8.xy);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.xyz;
					    u_xlat3.w = u_xlat10_3.w * _FaceColor.w;
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
					    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
					    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0 = u_xlat8.x * 0.5 + u_xlat0;
					    u_xlat0 = u_xlat0 / u_xlat4;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat4 = u_xlat1.w * u_xlat0 + -0.00100000005;
					    u_xlat1 = vec4(u_xlat0) * u_xlat1;
					    SV_Target0 = u_xlat1 * vs_COLOR0.wwww;
					    u_xlatb0 = u_xlat4<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "UNITY_UI_ALPHACLIP" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "UNITY_UI_ALPHACLIP" }
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_CLIP_RECT" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _FaceUVSpeedX;
						float _FaceUVSpeedY;
						vec4 _FaceColor;
						float _OutlineSoftness;
						float _OutlineUVSpeedX;
						float _OutlineUVSpeedY;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_9[15];
						float _ScaleRatioA;
						vec4 unused_0_11[3];
						vec4 _ClipRect;
						vec4 unused_0_13[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FaceTex;
					uniform  sampler2D _OutlineTex;
					in  vec4 vs_COLOR0;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat10_0.w + (-vs_TEXCOORD1.x);
					    u_xlat4 = (-u_xlat10_0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
					    u_xlat8.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
					    u_xlat4 = u_xlat8.x * u_xlat12;
					    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
					    u_xlat10_1 = texture(_OutlineTex, u_xlat8.xy);
					    u_xlat1 = u_xlat10_1 * _OutlineColor;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
					    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
					    u_xlat10_3 = texture(_FaceTex, u_xlat8.xy);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.xyz;
					    u_xlat3.w = u_xlat10_3.w * _FaceColor.w;
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
					    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
					    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x / u_xlat4;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "UNITY_UI_CLIP_RECT" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "UNITY_UI_CLIP_RECT" }
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _FaceUVSpeedX;
						float _FaceUVSpeedY;
						vec4 _FaceColor;
						float _OutlineSoftness;
						float _OutlineUVSpeedX;
						float _OutlineUVSpeedY;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_9[15];
						float _ScaleRatioA;
						vec4 unused_0_11[3];
						vec4 _ClipRect;
						vec4 unused_0_13[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FaceTex;
					uniform  sampler2D _OutlineTex;
					in  vec4 vs_COLOR0;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					float u_xlat5;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat10_0.w + (-vs_TEXCOORD1.x);
					    u_xlat4 = (-u_xlat10_0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
					    u_xlat8.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
					    u_xlat4 = u_xlat8.x * u_xlat12;
					    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD5.zw;
					    u_xlat10_1 = texture(_OutlineTex, u_xlat8.xy);
					    u_xlat1 = u_xlat10_1 * _OutlineColor;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
					    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD5.xy;
					    u_xlat10_3 = texture(_FaceTex, u_xlat8.xy);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.xyz;
					    u_xlat3.w = u_xlat10_3.w * _FaceColor.w;
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
					    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
					    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x / u_xlat4;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat5 = u_xlat0.w * u_xlat1.x + -0.00100000005;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
					    u_xlatb0 = u_xlat5<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
					"!!vulkan"
				}
			}
		}
	}
	Fallback "TextMeshPro/Mobile/Distance Field"
	CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}