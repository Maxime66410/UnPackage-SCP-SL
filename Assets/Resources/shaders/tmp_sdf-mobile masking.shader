Shader "TextMeshPro/Mobile/Distance Field - Masking" {
	Properties {
		_FaceColor ("Face Color", Vector) = (1,1,1,1)
		_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
		_OutlineColor ("Outline Color", Vector) = (0,0,0,1)
		_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
		_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
		_UnderlayColor ("Border Color", Vector) = (0,0,0,0.5)
		_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
		_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
		_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
		_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
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
		_ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
		_MaskSoftnessX ("Mask SoftnessX", Float) = 0
		_MaskSoftnessY ("Mask SoftnessY", Float) = 0
		_MaskTex ("Mask Texture", 2D) = "white" {}
		_MaskInverse ("Inverse", Float) = 0
		_MaskEdgeColor ("Edge Color", Vector) = (1,1,1,1)
		_MaskEdgeSoftness ("Edge Softness", Range(0, 1)) = 0.01
		_MaskWipeControl ("Wipe Position", Range(0, 1)) = 0.5
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_ColorMask ("Color Mask", Float) = 15
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
			ColorMask 0 -1
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
			GpuProgramID 59255
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						vec4 unused_0_20[3];
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
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
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
					uniform 	vec4 _FaceColor;
					uniform 	float _FaceDilate;
					uniform 	float _OutlineSoftness;
					uniform 	vec4 _OutlineColor;
					uniform 	float _OutlineWidth;
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
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
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
					uniform 	float _MaskWipeControl;
					uniform 	float _MaskEdgeSoftness;
					uniform 	vec4 _MaskEdgeColor;
					uniform 	int _MaskInverse;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MaskTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
					    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.zw);
					    u_xlat0 = u_xlat0 + (-u_xlat10_1.w);
					    u_xlat3.x = (-_MaskWipeControl) + 1.0;
					    u_xlat0 = u_xlat3.x * _MaskEdgeSoftness + abs(u_xlat0);
					    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
					    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat1.w = u_xlat3.x * vs_COLOR0.w;
					    u_xlat2.xyz = u_xlat1.www * _MaskEdgeColor.xyz;
					    u_xlat3.xyz = vs_COLOR0.xyz * u_xlat3.xxx + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(u_xlat0) * u_xlat3.xyz + u_xlat2.xyz;
					    SV_Target0 = vec4(u_xlat0) * u_xlat1;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 517
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %12 %118 %123 %136 %155 %266 %390 %430 %437 %439 %509 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate %12 Location 12 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpMemberDecorate %22 0 Offset 22 
					                                                      OpMemberDecorate %22 1 Offset 22 
					                                                      OpMemberDecorate %22 2 Offset 22 
					                                                      OpMemberDecorate %22 3 Offset 22 
					                                                      OpMemberDecorate %22 4 Offset 22 
					                                                      OpMemberDecorate %22 5 Offset 22 
					                                                      OpMemberDecorate %22 6 RelaxedPrecision 
					                                                      OpMemberDecorate %22 6 Offset 22 
					                                                      OpMemberDecorate %22 7 Offset 22 
					                                                      OpMemberDecorate %22 8 Offset 22 
					                                                      OpMemberDecorate %22 9 RelaxedPrecision 
					                                                      OpMemberDecorate %22 9 Offset 22 
					                                                      OpMemberDecorate %22 10 Offset 22 
					                                                      OpMemberDecorate %22 11 Offset 22 
					                                                      OpMemberDecorate %22 12 Offset 22 
					                                                      OpMemberDecorate %22 13 Offset 22 
					                                                      OpMemberDecorate %22 14 Offset 22 
					                                                      OpMemberDecorate %22 15 Offset 22 
					                                                      OpMemberDecorate %22 16 Offset 22 
					                                                      OpMemberDecorate %22 17 Offset 22 
					                                                      OpMemberDecorate %22 18 Offset 22 
					                                                      OpMemberDecorate %22 19 Offset 22 
					                                                      OpMemberDecorate %22 20 Offset 22 
					                                                      OpMemberDecorate %22 21 Offset 22 
					                                                      OpMemberDecorate %22 22 Offset 22 
					                                                      OpDecorate %22 Block 
					                                                      OpDecorate %24 DescriptorSet 24 
					                                                      OpDecorate %24 Binding 24 
					                                                      OpMemberDecorate %116 0 BuiltIn 116 
					                                                      OpMemberDecorate %116 1 BuiltIn 116 
					                                                      OpMemberDecorate %116 2 BuiltIn 116 
					                                                      OpDecorate %116 Block 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %123 Location 123 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %136 Location 136 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %155 Location 155 
					                                                      OpDecorate %266 Location 266 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %359 RelaxedPrecision 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %369 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %377 RelaxedPrecision 
					                                                      OpDecorate %378 RelaxedPrecision 
					                                                      OpDecorate %380 RelaxedPrecision 
					                                                      OpDecorate %381 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %388 RelaxedPrecision 
					                                                      OpDecorate %390 RelaxedPrecision 
					                                                      OpDecorate %390 Location 390 
					                                                      OpDecorate vs_TEXCOORD0 Location 430 
					                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 437 
					                                                      OpDecorate %439 Location 439 
					                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 509 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                                 Input f32_4* %12 = OpVariable Input 
					                                              %15 = OpTypeVector %6 3 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %10 %17 
					                                              %19 = OpTypeArray %10 %17 
					                                              %20 = OpTypeArray %10 %17 
					                                              %21 = OpTypeArray %10 %17 
					                                              %22 = OpTypeStruct %15 %10 %18 %19 %20 %21 %10 %6 %6 %10 %6 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 
					                                              %23 = OpTypePointer Uniform %22 
					Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32;}* %24 = OpVariable Uniform 
					                                              %25 = OpTypeInt 32 1 
					                                          i32 %26 = OpConstant 14 
					                                              %27 = OpTypePointer Uniform %6 
					                                          i32 %30 = OpConstant 15 
					                                              %35 = OpTypePointer Private %10 
					                               Private f32_4* %36 = OpVariable Private 
					                                          i32 %39 = OpConstant 2 
					                                          i32 %40 = OpConstant 1 
					                                              %41 = OpTypePointer Uniform %10 
					                                          i32 %45 = OpConstant 0 
					                               Private f32_4* %60 = OpVariable Private 
					                                          i32 %62 = OpConstant 3 
					                                              %80 = OpTypePointer Uniform %15 
					                               Private f32_4* %86 = OpVariable Private 
					                                          i32 %89 = OpConstant 5 
					                                         u32 %114 = OpConstant 1 
					                                             %115 = OpTypeArray %6 %114 
					                                             %116 = OpTypeStruct %10 %6 %115 
					                                             %117 = OpTypePointer Output %116 
					        Output struct {f32_4; f32; f32[1];}* %118 = OpVariable Output 
					                                             %120 = OpTypePointer Output %10 
					                              Private f32_4* %122 = OpVariable Private 
					                                Input f32_4* %123 = OpVariable Input 
					                                         i32 %125 = OpConstant 6 
					                               Output f32_4* %136 = OpVariable Output 
					                                             %138 = OpTypePointer Private %6 
					                                Private f32* %139 = OpVariable Private 
					                                             %154 = OpTypePointer Input %15 
					                                Input f32_3* %155 = OpVariable Input 
					                                         u32 %161 = OpConstant 0 
					                                         u32 %174 = OpConstant 2 
					                                         i32 %198 = OpConstant 4 
					                                         i32 %220 = OpConstant 20 
					                                         i32 %223 = OpConstant 21 
					                                Private f32* %237 = OpVariable Private 
					                                         i32 %243 = OpConstant 17 
					                                         i32 %246 = OpConstant 18 
					                                         f32 %250 = OpConstant 3,674022E-40 
					                                       f32_2 %251 = OpConstantComposite %250 %250 
					                                             %265 = OpTypePointer Input %7 
					                                Input f32_2* %266 = OpVariable Input 
					                                             %267 = OpTypePointer Input %6 
					                                         i32 %271 = OpConstant 19 
					                                         f32 %281 = OpConstant 3,674022E-40 
					                                Private f32* %284 = OpVariable Private 
					                                         i32 %285 = OpConstant 22 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %307 = OpTypeBool 
					                                             %308 = OpTypePointer Private %307 
					                               Private bool* %309 = OpVariable Private 
					                                         u32 %310 = OpConstant 3 
					                                         f32 %313 = OpConstant 3,674022E-40 
					                                             %316 = OpTypePointer Function %6 
					                                         i32 %325 = OpConstant 8 
					                                         i32 %328 = OpConstant 13 
					                                         i32 %340 = OpConstant 10 
					                              Private f32_4* %354 = OpVariable Private 
					                                         i32 %357 = OpConstant 9 
					                               Output f32_4* %390 = OpVariable Output 
					                                         i32 %392 = OpConstant 16 
					                                         f32 %395 = OpConstant 3,674022E-40 
					                                       f32_4 %396 = OpConstantComposite %395 %395 %395 %395 
					                                         f32 %399 = OpConstant 3,674022E-40 
					                                       f32_4 %400 = OpConstantComposite %399 %399 %399 %399 
					                                         f32 %410 = OpConstant 3,674022E-40 
					                                       f32_2 %411 = OpConstantComposite %410 %410 
					                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Input f32_2* %439 = OpVariable Input 
					                               Private bool* %443 = OpVariable Private 
					                                Private f32* %450 = OpVariable Private 
					                                         i32 %451 = OpConstant 11 
					                                         i32 %455 = OpConstant 12 
					                                         i32 %470 = OpConstant 7 
					                                         f32 %484 = OpConstant 3,674022E-40 
					                                         f32 %493 = OpConstant 3,674022E-40 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                             %511 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %317 = OpVariable Function 
					                                        f32_4 %13 = OpLoad %12 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                 Uniform f32* %28 = OpAccessChain %24 %26 
					                                          f32 %29 = OpLoad %28 
					                                 Uniform f32* %31 = OpAccessChain %24 %30 
					                                          f32 %32 = OpLoad %31 
					                                        f32_2 %33 = OpCompositeConstruct %29 %32 
					                                        f32_2 %34 = OpFAdd %14 %33 
					                                                      OpStore %9 %34 
					                                        f32_2 %37 = OpLoad %9 
					                                        f32_4 %38 = OpVectorShuffle %37 %37 1 1 1 1 
					                               Uniform f32_4* %42 = OpAccessChain %24 %39 %40 
					                                        f32_4 %43 = OpLoad %42 
					                                        f32_4 %44 = OpFMul %38 %43 
					                                                      OpStore %36 %44 
					                               Uniform f32_4* %46 = OpAccessChain %24 %39 %45 
					                                        f32_4 %47 = OpLoad %46 
					                                        f32_2 %48 = OpLoad %9 
					                                        f32_4 %49 = OpVectorShuffle %48 %48 0 0 0 0 
					                                        f32_4 %50 = OpFMul %47 %49 
					                                        f32_4 %51 = OpLoad %36 
					                                        f32_4 %52 = OpFAdd %50 %51 
					                                                      OpStore %36 %52 
					                               Uniform f32_4* %53 = OpAccessChain %24 %39 %39 
					                                        f32_4 %54 = OpLoad %53 
					                                        f32_4 %55 = OpLoad %12 
					                                        f32_4 %56 = OpVectorShuffle %55 %55 2 2 2 2 
					                                        f32_4 %57 = OpFMul %54 %56 
					                                        f32_4 %58 = OpLoad %36 
					                                        f32_4 %59 = OpFAdd %57 %58 
					                                                      OpStore %36 %59 
					                                        f32_4 %61 = OpLoad %36 
					                               Uniform f32_4* %63 = OpAccessChain %24 %39 %62 
					                                        f32_4 %64 = OpLoad %63 
					                                        f32_4 %65 = OpFAdd %61 %64 
					                                                      OpStore %60 %65 
					                               Uniform f32_4* %66 = OpAccessChain %24 %39 %62 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                        f32_4 %69 = OpLoad %12 
					                                        f32_3 %70 = OpVectorShuffle %69 %69 3 3 3 
					                                        f32_3 %71 = OpFMul %68 %70 
					                                        f32_4 %72 = OpLoad %36 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                                        f32_3 %74 = OpFAdd %71 %73 
					                                        f32_4 %75 = OpLoad %36 
					                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
					                                                      OpStore %36 %76 
					                                        f32_4 %77 = OpLoad %36 
					                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
					                                        f32_3 %79 = OpFNegate %78 
					                               Uniform f32_3* %81 = OpAccessChain %24 %45 
					                                        f32_3 %82 = OpLoad %81 
					                                        f32_3 %83 = OpFAdd %79 %82 
					                                        f32_4 %84 = OpLoad %36 
					                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
					                                                      OpStore %36 %85 
					                                        f32_4 %87 = OpLoad %60 
					                                        f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
					                               Uniform f32_4* %90 = OpAccessChain %24 %89 %40 
					                                        f32_4 %91 = OpLoad %90 
					                                        f32_4 %92 = OpFMul %88 %91 
					                                                      OpStore %86 %92 
					                               Uniform f32_4* %93 = OpAccessChain %24 %89 %45 
					                                        f32_4 %94 = OpLoad %93 
					                                        f32_4 %95 = OpLoad %60 
					                                        f32_4 %96 = OpVectorShuffle %95 %95 0 0 0 0 
					                                        f32_4 %97 = OpFMul %94 %96 
					                                        f32_4 %98 = OpLoad %86 
					                                        f32_4 %99 = OpFAdd %97 %98 
					                                                      OpStore %86 %99 
					                              Uniform f32_4* %100 = OpAccessChain %24 %89 %39 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_4 %102 = OpLoad %60 
					                                       f32_4 %103 = OpVectorShuffle %102 %102 2 2 2 2 
					                                       f32_4 %104 = OpFMul %101 %103 
					                                       f32_4 %105 = OpLoad %86 
					                                       f32_4 %106 = OpFAdd %104 %105 
					                                                      OpStore %86 %106 
					                              Uniform f32_4* %107 = OpAccessChain %24 %89 %62 
					                                       f32_4 %108 = OpLoad %107 
					                                       f32_4 %109 = OpLoad %60 
					                                       f32_4 %110 = OpVectorShuffle %109 %109 3 3 3 3 
					                                       f32_4 %111 = OpFMul %108 %110 
					                                       f32_4 %112 = OpLoad %86 
					                                       f32_4 %113 = OpFAdd %111 %112 
					                                                      OpStore %60 %113 
					                                       f32_4 %119 = OpLoad %60 
					                               Output f32_4* %121 = OpAccessChain %118 %45 
					                                                      OpStore %121 %119 
					                                       f32_4 %124 = OpLoad %123 
					                              Uniform f32_4* %126 = OpAccessChain %24 %125 
					                                       f32_4 %127 = OpLoad %126 
					                                       f32_4 %128 = OpFMul %124 %127 
					                                                      OpStore %122 %128 
					                                       f32_4 %129 = OpLoad %122 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 3 3 3 
					                                       f32_4 %131 = OpLoad %122 
					                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                       f32_3 %133 = OpFMul %130 %132 
					                                       f32_4 %134 = OpLoad %122 
					                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
					                                                      OpStore %122 %135 
					                                       f32_4 %137 = OpLoad %122 
					                                                      OpStore %136 %137 
					                                       f32_4 %140 = OpLoad %36 
					                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
					                                       f32_4 %142 = OpLoad %36 
					                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
					                                         f32 %144 = OpDot %141 %143 
					                                                      OpStore %139 %144 
					                                         f32 %145 = OpLoad %139 
					                                         f32 %146 = OpExtInst %1 32 %145 
					                                                      OpStore %139 %146 
					                                         f32 %147 = OpLoad %139 
					                                       f32_3 %148 = OpCompositeConstruct %147 %147 %147 
					                                       f32_4 %149 = OpLoad %36 
					                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
					                                       f32_3 %151 = OpFMul %148 %150 
					                                       f32_4 %152 = OpLoad %36 
					                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
					                                                      OpStore %36 %153 
					                                       f32_3 %156 = OpLoad %155 
					                              Uniform f32_4* %157 = OpAccessChain %24 %62 %45 
					                                       f32_4 %158 = OpLoad %157 
					                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                                         f32 %160 = OpDot %156 %159 
					                                Private f32* %162 = OpAccessChain %60 %161 
					                                                      OpStore %162 %160 
					                                       f32_3 %163 = OpLoad %155 
					                              Uniform f32_4* %164 = OpAccessChain %24 %62 %40 
					                                       f32_4 %165 = OpLoad %164 
					                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
					                                         f32 %167 = OpDot %163 %166 
					                                Private f32* %168 = OpAccessChain %60 %114 
					                                                      OpStore %168 %167 
					                                       f32_3 %169 = OpLoad %155 
					                              Uniform f32_4* %170 = OpAccessChain %24 %62 %39 
					                                       f32_4 %171 = OpLoad %170 
					                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
					                                         f32 %173 = OpDot %169 %172 
					                                Private f32* %175 = OpAccessChain %60 %174 
					                                                      OpStore %175 %173 
					                                       f32_4 %176 = OpLoad %60 
					                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
					                                       f32_4 %178 = OpLoad %60 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                         f32 %180 = OpDot %177 %179 
					                                                      OpStore %139 %180 
					                                         f32 %181 = OpLoad %139 
					                                         f32 %182 = OpExtInst %1 32 %181 
					                                                      OpStore %139 %182 
					                                         f32 %183 = OpLoad %139 
					                                       f32_3 %184 = OpCompositeConstruct %183 %183 %183 
					                                       f32_4 %185 = OpLoad %60 
					                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
					                                       f32_3 %187 = OpFMul %184 %186 
					                                       f32_4 %188 = OpLoad %60 
					                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
					                                                      OpStore %60 %189 
					                                       f32_4 %190 = OpLoad %60 
					                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
					                                       f32_4 %192 = OpLoad %36 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                         f32 %194 = OpDot %191 %193 
					                                                      OpStore %139 %194 
					                              Uniform f32_4* %195 = OpAccessChain %24 %40 
					                                       f32_4 %196 = OpLoad %195 
					                                       f32_2 %197 = OpVectorShuffle %196 %196 1 1 
					                              Uniform f32_4* %199 = OpAccessChain %24 %198 %40 
					                                       f32_4 %200 = OpLoad %199 
					                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
					                                       f32_2 %202 = OpFMul %197 %201 
					                                       f32_4 %203 = OpLoad %36 
					                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 2 3 
					                                                      OpStore %36 %204 
					                              Uniform f32_4* %205 = OpAccessChain %24 %198 %45 
					                                       f32_4 %206 = OpLoad %205 
					                                       f32_2 %207 = OpVectorShuffle %206 %206 0 1 
					                              Uniform f32_4* %208 = OpAccessChain %24 %40 
					                                       f32_4 %209 = OpLoad %208 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 0 
					                                       f32_2 %211 = OpFMul %207 %210 
					                                       f32_4 %212 = OpLoad %36 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
					                                       f32_2 %214 = OpFAdd %211 %213 
					                                       f32_4 %215 = OpLoad %36 
					                                       f32_4 %216 = OpVectorShuffle %215 %214 4 5 2 3 
					                                                      OpStore %36 %216 
					                                       f32_4 %217 = OpLoad %36 
					                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
					                                       f32_2 %219 = OpExtInst %1 4 %218 
					                                Uniform f32* %221 = OpAccessChain %24 %220 
					                                         f32 %222 = OpLoad %221 
					                                Uniform f32* %224 = OpAccessChain %24 %223 
					                                         f32 %225 = OpLoad %224 
					                                       f32_2 %226 = OpCompositeConstruct %222 %225 
					                                       f32_2 %227 = OpFMul %219 %226 
					                                       f32_4 %228 = OpLoad %36 
					                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 2 3 
					                                                      OpStore %36 %229 
					                                       f32_4 %230 = OpLoad %60 
					                                       f32_2 %231 = OpVectorShuffle %230 %230 3 3 
					                                       f32_4 %232 = OpLoad %36 
					                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
					                                       f32_2 %234 = OpFDiv %231 %233 
					                                       f32_4 %235 = OpLoad %36 
					                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
					                                                      OpStore %36 %236 
					                                       f32_4 %238 = OpLoad %36 
					                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
					                                       f32_4 %240 = OpLoad %36 
					                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
					                                         f32 %242 = OpDot %239 %241 
					                                                      OpStore %237 %242 
					                                Uniform f32* %244 = OpAccessChain %24 %243 
					                                         f32 %245 = OpLoad %244 
					                                Uniform f32* %247 = OpAccessChain %24 %246 
					                                         f32 %248 = OpLoad %247 
					                                       f32_2 %249 = OpCompositeConstruct %245 %248 
					                                       f32_2 %252 = OpFMul %249 %251 
					                                       f32_4 %253 = OpLoad %36 
					                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
					                                       f32_2 %255 = OpFAdd %252 %254 
					                                       f32_4 %256 = OpLoad %36 
					                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 2 3 
					                                                      OpStore %36 %257 
					                                       f32_4 %258 = OpLoad %36 
					                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
					                                       f32_2 %260 = OpFDiv %251 %259 
					                                       f32_4 %261 = OpLoad %36 
					                                       f32_4 %262 = OpVectorShuffle %261 %260 0 1 4 5 
					                                                      OpStore %36 %262 
					                                         f32 %263 = OpLoad %237 
					                                         f32 %264 = OpExtInst %1 32 %263 
					                                                      OpStore %237 %264 
					                                  Input f32* %268 = OpAccessChain %266 %114 
					                                         f32 %269 = OpLoad %268 
					                                         f32 %270 = OpExtInst %1 4 %269 
					                                Uniform f32* %272 = OpAccessChain %24 %271 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpFMul %270 %273 
					                                Private f32* %275 = OpAccessChain %60 %161 
					                                                      OpStore %275 %274 
					                                         f32 %276 = OpLoad %237 
					                                Private f32* %277 = OpAccessChain %60 %161 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFMul %276 %278 
					                                                      OpStore %237 %279 
					                                         f32 %280 = OpLoad %237 
					                                         f32 %282 = OpFMul %280 %281 
					                                Private f32* %283 = OpAccessChain %60 %161 
					                                                      OpStore %283 %282 
					                                Uniform f32* %286 = OpAccessChain %24 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFNegate %287 
					                                         f32 %290 = OpFAdd %288 %289 
					                                                      OpStore %284 %290 
					                                         f32 %291 = OpLoad %284 
					                                Private f32* %292 = OpAccessChain %60 %161 
					                                         f32 %293 = OpLoad %292 
					                                         f32 %294 = OpExtInst %1 4 %293 
					                                         f32 %295 = OpFMul %291 %294 
					                                                      OpStore %284 %295 
					                                         f32 %296 = OpLoad %237 
					                                         f32 %297 = OpFMul %296 %281 
					                                         f32 %298 = OpLoad %284 
					                                         f32 %299 = OpFNegate %298 
					                                         f32 %300 = OpFAdd %297 %299 
					                                                      OpStore %237 %300 
					                                         f32 %301 = OpLoad %139 
					                                         f32 %302 = OpExtInst %1 4 %301 
					                                         f32 %303 = OpLoad %237 
					                                         f32 %304 = OpFMul %302 %303 
					                                         f32 %305 = OpLoad %284 
					                                         f32 %306 = OpFAdd %304 %305 
					                                                      OpStore %139 %306 
					                                Uniform f32* %311 = OpAccessChain %24 %198 %62 %310 
					                                         f32 %312 = OpLoad %311 
					                                        bool %314 = OpFOrdEqual %312 %313 
					                                                      OpStore %309 %314 
					                                        bool %315 = OpLoad %309 
					                                                      OpSelectionMerge %319 None 
					                                                      OpBranchConditional %315 %318 %321 
					                                             %318 = OpLabel 
					                                         f32 %320 = OpLoad %139 
					                                                      OpStore %317 %320 
					                                                      OpBranch %319 
					                                             %321 = OpLabel 
					                                Private f32* %322 = OpAccessChain %60 %161 
					                                         f32 %323 = OpLoad %322 
					                                                      OpStore %317 %323 
					                                                      OpBranch %319 
					                                             %319 = OpLabel 
					                                         f32 %324 = OpLoad %317 
					                                                      OpStore %139 %324 
					                                Uniform f32* %326 = OpAccessChain %24 %325 
					                                         f32 %327 = OpLoad %326 
					                                Uniform f32* %329 = OpAccessChain %24 %328 
					                                         f32 %330 = OpLoad %329 
					                                         f32 %331 = OpFMul %327 %330 
					                                                      OpStore %237 %331 
					                                         f32 %332 = OpLoad %237 
					                                         f32 %333 = OpLoad %139 
					                                         f32 %334 = OpFMul %332 %333 
					                                         f32 %335 = OpFAdd %334 %289 
					                                                      OpStore %237 %335 
					                                         f32 %336 = OpLoad %139 
					                                         f32 %337 = OpLoad %237 
					                                         f32 %338 = OpFDiv %336 %337 
					                                Private f32* %339 = OpAccessChain %60 %161 
					                                                      OpStore %339 %338 
					                                Uniform f32* %341 = OpAccessChain %24 %340 
					                                         f32 %342 = OpLoad %341 
					                                Uniform f32* %343 = OpAccessChain %24 %328 
					                                         f32 %344 = OpLoad %343 
					                                         f32 %345 = OpFMul %342 %344 
					                                                      OpStore %139 %345 
					                                Private f32* %346 = OpAccessChain %60 %161 
					                                         f32 %347 = OpLoad %346 
					                                         f32 %348 = OpLoad %139 
					                                         f32 %349 = OpFMul %347 %348 
					                                                      OpStore %139 %349 
					                                         f32 %350 = OpLoad %139 
					                                         f32 %351 = OpExtInst %1 37 %350 %289 
					                                                      OpStore %237 %351 
					                                         f32 %352 = OpLoad %237 
					                                         f32 %353 = OpExtInst %1 31 %352 
					                                                      OpStore %237 %353 
					                                  Input f32* %355 = OpAccessChain %123 %310 
					                                         f32 %356 = OpLoad %355 
					                                Uniform f32* %358 = OpAccessChain %24 %357 %310 
					                                         f32 %359 = OpLoad %358 
					                                         f32 %360 = OpFMul %356 %359 
					                                Private f32* %361 = OpAccessChain %354 %161 
					                                                      OpStore %361 %360 
					                              Uniform f32_4* %362 = OpAccessChain %24 %357 
					                                       f32_4 %363 = OpLoad %362 
					                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
					                                       f32_4 %365 = OpLoad %354 
					                                       f32_3 %366 = OpVectorShuffle %365 %365 0 0 0 
					                                       f32_3 %367 = OpFMul %364 %366 
					                                       f32_4 %368 = OpLoad %122 
					                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
					                                       f32_3 %370 = OpFNegate %369 
					                                       f32_3 %371 = OpFAdd %367 %370 
					                                       f32_4 %372 = OpLoad %354 
					                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
					                                                      OpStore %354 %373 
					                                Uniform f32* %374 = OpAccessChain %24 %357 %310 
					                                         f32 %375 = OpLoad %374 
					                                  Input f32* %376 = OpAccessChain %123 %310 
					                                         f32 %377 = OpLoad %376 
					                                         f32 %378 = OpFMul %375 %377 
					                                Private f32* %379 = OpAccessChain %122 %310 
					                                         f32 %380 = OpLoad %379 
					                                         f32 %381 = OpFNegate %380 
					                                         f32 %382 = OpFAdd %378 %381 
					                                Private f32* %383 = OpAccessChain %354 %310 
					                                                      OpStore %383 %382 
					                                         f32 %384 = OpLoad %237 
					                                       f32_4 %385 = OpCompositeConstruct %384 %384 %384 %384 
					                                       f32_4 %386 = OpLoad %354 
					                                       f32_4 %387 = OpFMul %385 %386 
					                                       f32_4 %388 = OpLoad %122 
					                                       f32_4 %389 = OpFAdd %387 %388 
					                                                      OpStore %86 %389 
					                                       f32_4 %391 = OpLoad %86 
					                                                      OpStore %390 %391 
					                              Uniform f32_4* %393 = OpAccessChain %24 %392 
					                                       f32_4 %394 = OpLoad %393 
					                                       f32_4 %397 = OpExtInst %1 40 %394 %396 
					                                                      OpStore %86 %397 
					                                       f32_4 %398 = OpLoad %86 
					                                       f32_4 %401 = OpExtInst %1 37 %398 %400 
					                                                      OpStore %86 %401 
					                                       f32_2 %402 = OpLoad %9 
					                                       f32_4 %403 = OpLoad %86 
					                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
					                                       f32_2 %405 = OpFNegate %404 
					                                       f32_2 %406 = OpFAdd %402 %405 
					                                       f32_4 %407 = OpLoad %354 
					                                       f32_4 %408 = OpVectorShuffle %407 %406 4 5 2 3 
					                                                      OpStore %354 %408 
					                                       f32_2 %409 = OpLoad %9 
					                                       f32_2 %412 = OpFMul %409 %411 
					                                       f32_4 %413 = OpLoad %86 
					                                       f32_2 %414 = OpVectorShuffle %413 %413 0 1 
					                                       f32_2 %415 = OpFNegate %414 
					                                       f32_2 %416 = OpFAdd %412 %415 
					                                                      OpStore %9 %416 
					                                       f32_4 %417 = OpLoad %86 
					                                       f32_2 %418 = OpVectorShuffle %417 %417 2 3 
					                                       f32_2 %419 = OpFNegate %418 
					                                       f32_2 %420 = OpLoad %9 
					                                       f32_2 %421 = OpFAdd %419 %420 
					                                       f32_4 %422 = OpLoad %36 
					                                       f32_4 %423 = OpVectorShuffle %422 %421 4 5 2 3 
					                                                      OpStore %36 %423 
					                                       f32_4 %424 = OpLoad %86 
					                                       f32_2 %425 = OpVectorShuffle %424 %424 0 1 
					                                       f32_2 %426 = OpFNegate %425 
					                                       f32_4 %427 = OpLoad %86 
					                                       f32_2 %428 = OpVectorShuffle %427 %427 2 3 
					                                       f32_2 %429 = OpFAdd %426 %428 
					                                                      OpStore %9 %429 
					                                       f32_4 %431 = OpLoad %354 
					                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
					                                       f32_2 %433 = OpLoad %9 
					                                       f32_2 %434 = OpFDiv %432 %433 
					                                       f32_4 %435 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %436 = OpVectorShuffle %435 %434 0 1 4 5 
					                                                      OpStore vs_TEXCOORD0 %436 
					                                       f32_4 %438 = OpLoad %36 
					                                                      OpStore vs_TEXCOORD2 %438 
					                                       f32_2 %440 = OpLoad %439 
					                                       f32_4 %441 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %442 = OpVectorShuffle %441 %440 4 5 2 3 
					                                                      OpStore vs_TEXCOORD0 %442 
					                                  Input f32* %444 = OpAccessChain %266 %114 
					                                         f32 %445 = OpLoad %444 
					                                        bool %446 = OpFOrdGreaterThanEqual %313 %445 
					                                                      OpStore %443 %446 
					                                        bool %447 = OpLoad %443 
					                                         f32 %448 = OpSelect %447 %289 %313 
					                                Private f32* %449 = OpAccessChain %9 %161 
					                                                      OpStore %449 %448 
					                                Uniform f32* %452 = OpAccessChain %24 %451 
					                                         f32 %453 = OpLoad %452 
					                                         f32 %454 = OpFNegate %453 
					                                Uniform f32* %456 = OpAccessChain %24 %455 
					                                         f32 %457 = OpLoad %456 
					                                         f32 %458 = OpFAdd %454 %457 
					                                                      OpStore %450 %458 
					                                Private f32* %459 = OpAccessChain %9 %161 
					                                         f32 %460 = OpLoad %459 
					                                         f32 %461 = OpLoad %450 
					                                         f32 %462 = OpFMul %460 %461 
					                                Uniform f32* %463 = OpAccessChain %24 %451 
					                                         f32 %464 = OpLoad %463 
					                                         f32 %465 = OpFAdd %462 %464 
					                                Private f32* %466 = OpAccessChain %9 %161 
					                                                      OpStore %466 %465 
					                                Private f32* %467 = OpAccessChain %9 %161 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %469 = OpFMul %468 %250 
					                                Uniform f32* %471 = OpAccessChain %24 %470 
					                                         f32 %472 = OpLoad %471 
					                                         f32 %473 = OpFAdd %469 %472 
					                                Private f32* %474 = OpAccessChain %9 %161 
					                                                      OpStore %474 %473 
					                                Private f32* %475 = OpAccessChain %9 %161 
					                                         f32 %476 = OpLoad %475 
					                                Uniform f32* %477 = OpAccessChain %24 %328 
					                                         f32 %478 = OpLoad %477 
					                                         f32 %479 = OpFMul %476 %478 
					                                Private f32* %480 = OpAccessChain %9 %161 
					                                                      OpStore %480 %479 
					                                Private f32* %481 = OpAccessChain %9 %161 
					                                         f32 %482 = OpLoad %481 
					                                         f32 %483 = OpFNegate %482 
					                                         f32 %485 = OpFMul %483 %484 
					                                         f32 %486 = OpFAdd %485 %484 
					                                Private f32* %487 = OpAccessChain %9 %161 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %9 %161 
					                                         f32 %489 = OpLoad %488 
					                                Private f32* %490 = OpAccessChain %60 %161 
					                                         f32 %491 = OpLoad %490 
					                                         f32 %492 = OpFMul %489 %491 
					                                         f32 %494 = OpFAdd %492 %493 
					                                Private f32* %495 = OpAccessChain %60 %310 
					                                                      OpStore %495 %494 
					                                         f32 %496 = OpLoad %139 
					                                         f32 %497 = OpFNegate %496 
					                                         f32 %498 = OpFMul %497 %484 
					                                Private f32* %499 = OpAccessChain %60 %310 
					                                         f32 %500 = OpLoad %499 
					                                         f32 %501 = OpFAdd %498 %500 
					                                Private f32* %502 = OpAccessChain %60 %114 
					                                                      OpStore %502 %501 
					                                         f32 %503 = OpLoad %139 
					                                         f32 %504 = OpFMul %503 %484 
					                                Private f32* %505 = OpAccessChain %60 %310 
					                                         f32 %506 = OpLoad %505 
					                                         f32 %507 = OpFAdd %504 %506 
					                                Private f32* %508 = OpAccessChain %60 %174 
					                                                      OpStore %508 %507 
					                                       f32_4 %510 = OpLoad %60 
					                                                      OpStore vs_TEXCOORD1 %510 
					                                 Output f32* %512 = OpAccessChain %118 %45 %114 
					                                         f32 %513 = OpLoad %512 
					                                         f32 %514 = OpFNegate %513 
					                                 Output f32* %515 = OpAccessChain %118 %45 %114 
					                                                      OpStore %515 %514 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 146
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %36 %89 %102 %143 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                OpMemberDecorate %11 0 Offset 11 
					                                                OpMemberDecorate %11 1 Offset 11 
					                                                OpMemberDecorate %11 2 RelaxedPrecision 
					                                                OpMemberDecorate %11 2 Offset 11 
					                                                OpMemberDecorate %11 3 Offset 11 
					                                                OpDecorate %11 Block 
					                                                OpDecorate %13 DescriptorSet 13 
					                                                OpDecorate %13 Binding 13 
					                                                OpDecorate %24 RelaxedPrecision 
					                                                OpDecorate %27 RelaxedPrecision 
					                                                OpDecorate %27 DescriptorSet 27 
					                                                OpDecorate %27 Binding 27 
					                                                OpDecorate %28 RelaxedPrecision 
					                                                OpDecorate %31 RelaxedPrecision 
					                                                OpDecorate %31 DescriptorSet 31 
					                                                OpDecorate %31 Binding 31 
					                                                OpDecorate %32 RelaxedPrecision 
					                                                OpDecorate vs_TEXCOORD0 Location 36 
					                                                OpDecorate %43 RelaxedPrecision 
					                                                OpDecorate %44 RelaxedPrecision 
					                                                OpDecorate %45 RelaxedPrecision 
					                                                OpDecorate %78 RelaxedPrecision 
					                                                OpDecorate %78 DescriptorSet 78 
					                                                OpDecorate %78 Binding 78 
					                                                OpDecorate %79 RelaxedPrecision 
					                                                OpDecorate %80 RelaxedPrecision 
					                                                OpDecorate %80 DescriptorSet 80 
					                                                OpDecorate %80 Binding 80 
					                                                OpDecorate %81 RelaxedPrecision 
					                                                OpDecorate %86 RelaxedPrecision 
					                                                OpDecorate %87 RelaxedPrecision 
					                                                OpDecorate %88 RelaxedPrecision 
					                                                OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                OpDecorate vs_TEXCOORD1 Location 89 
					                                                OpDecorate %92 RelaxedPrecision 
					                                                OpDecorate %93 RelaxedPrecision 
					                                                OpDecorate %95 RelaxedPrecision 
					                                                OpDecorate %96 RelaxedPrecision 
					                                                OpDecorate %97 RelaxedPrecision 
					                                                OpDecorate %98 RelaxedPrecision 
					                                                OpDecorate %99 RelaxedPrecision 
					                                                OpDecorate %100 RelaxedPrecision 
					                                                OpDecorate %101 RelaxedPrecision 
					                                                OpDecorate %102 RelaxedPrecision 
					                                                OpDecorate %102 Location 102 
					                                                OpDecorate %104 RelaxedPrecision 
					                                                OpDecorate %105 RelaxedPrecision 
					                                                OpDecorate %106 RelaxedPrecision 
					                                                OpDecorate %107 RelaxedPrecision 
					                                                OpDecorate %108 RelaxedPrecision 
					                                                OpDecorate %112 RelaxedPrecision 
					                                                OpDecorate %113 RelaxedPrecision 
					                                                OpDecorate %114 RelaxedPrecision 
					                                                OpDecorate %118 RelaxedPrecision 
					                                                OpDecorate %121 RelaxedPrecision 
					                                                OpDecorate %122 RelaxedPrecision 
					                                                OpDecorate %123 RelaxedPrecision 
					                                                OpDecorate %124 RelaxedPrecision 
					                                                OpDecorate %125 RelaxedPrecision 
					                                                OpDecorate %126 RelaxedPrecision 
					                                                OpDecorate %127 RelaxedPrecision 
					                                                OpDecorate %128 RelaxedPrecision 
					                                                OpDecorate %129 RelaxedPrecision 
					                                                OpDecorate %131 RelaxedPrecision 
					                                                OpDecorate %132 RelaxedPrecision 
					                                                OpDecorate %133 RelaxedPrecision 
					                                                OpDecorate %134 RelaxedPrecision 
					                                                OpDecorate %135 RelaxedPrecision 
					                                                OpDecorate %143 RelaxedPrecision 
					                                                OpDecorate %143 Location 143 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypePointer Private %6 
					                            Private f32* %8 = OpVariable Private 
					                                         %9 = OpTypeVector %6 4 
					                                        %10 = OpTypeInt 32 1 
					                                        %11 = OpTypeStruct %6 %6 %9 %10 
					                                        %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32_4; i32;}* %13 = OpVariable Uniform 
					                                    i32 %14 = OpConstant 3 
					                                        %15 = OpTypePointer Uniform %10 
					                                    i32 %18 = OpConstant 0 
					                                        %19 = OpTypeBool 
					                                    f32 %21 = OpConstant 3,674022E-40 
					                                    f32 %22 = OpConstant 3,674022E-40 
					                           Private f32* %24 = OpVariable Private 
					                                        %25 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %26 = OpTypePointer UniformConstant %25 
					   UniformConstant read_only Texture2D* %27 = OpVariable UniformConstant 
					                                        %29 = OpTypeSampler 
					                                        %30 = OpTypePointer UniformConstant %29 
					               UniformConstant sampler* %31 = OpVariable UniformConstant 
					                                        %33 = OpTypeSampledImage %25 
					                                        %35 = OpTypePointer Input %9 
					                  Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                        %37 = OpTypeVector %6 2 
					                                        %41 = OpTypeInt 32 0 
					                                    u32 %42 = OpConstant 3 
					                                        %48 = OpTypeVector %6 3 
					                                        %49 = OpTypePointer Private %48 
					                         Private f32_3* %50 = OpVariable Private 
					                                        %51 = OpTypePointer Uniform %6 
					                                    u32 %56 = OpConstant 0 
					                                    i32 %60 = OpConstant 1 
					   UniformConstant read_only Texture2D* %78 = OpVariable UniformConstant 
					               UniformConstant sampler* %80 = OpVariable UniformConstant 
					                           Private f32* %87 = OpVariable Private 
					                  Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                        %90 = OpTypePointer Input %6 
					                          Private f32* %100 = OpVariable Private 
					                          Input f32_4* %102 = OpVariable Input 
					                        Private f32_3* %106 = OpVariable Private 
					                                   i32 %109 = OpConstant 2 
					                                       %110 = OpTypePointer Uniform %9 
					                                       %115 = OpTypePointer Private %9 
					                        Private f32_4* %116 = OpVariable Private 
					                        Private f32_3* %121 = OpVariable Private 
					                                       %142 = OpTypePointer Output %9 
					                         Output f32_4* %143 = OpVariable Output 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                           Uniform i32* %16 = OpAccessChain %13 %14 
					                                    i32 %17 = OpLoad %16 
					                                   bool %20 = OpINotEqual %17 %18 
					                                    f32 %23 = OpSelect %20 %21 %22 
					                                                OpStore %8 %23 
					                    read_only Texture2D %28 = OpLoad %27 
					                                sampler %32 = OpLoad %31 
					             read_only Texture2DSampled %34 = OpSampledImage %28 %32 
					                                  f32_4 %38 = OpLoad vs_TEXCOORD0 
					                                  f32_2 %39 = OpVectorShuffle %38 %38 2 3 
					                                  f32_4 %40 = OpImageSampleImplicitLod %34 %39 
					                                    f32 %43 = OpCompositeExtract %40 3 
					                                                OpStore %24 %43 
					                                    f32 %44 = OpLoad %24 
					                                    f32 %45 = OpFNegate %44 
					                                    f32 %46 = OpLoad %8 
					                                    f32 %47 = OpFAdd %45 %46 
					                                                OpStore %8 %47 
					                           Uniform f32* %52 = OpAccessChain %13 %18 
					                                    f32 %53 = OpLoad %52 
					                                    f32 %54 = OpFNegate %53 
					                                    f32 %55 = OpFAdd %54 %21 
					                           Private f32* %57 = OpAccessChain %50 %56 
					                                                OpStore %57 %55 
					                           Private f32* %58 = OpAccessChain %50 %56 
					                                    f32 %59 = OpLoad %58 
					                           Uniform f32* %61 = OpAccessChain %13 %60 
					                                    f32 %62 = OpLoad %61 
					                                    f32 %63 = OpFMul %59 %62 
					                                    f32 %64 = OpLoad %8 
					                                    f32 %65 = OpExtInst %1 4 %64 
					                                    f32 %66 = OpFAdd %63 %65 
					                                                OpStore %8 %66 
					                                    f32 %67 = OpLoad %8 
					                           Uniform f32* %68 = OpAccessChain %13 %18 
					                                    f32 %69 = OpLoad %68 
					                                    f32 %70 = OpFNegate %69 
					                                    f32 %71 = OpFAdd %67 %70 
					                                                OpStore %8 %71 
					                                    f32 %72 = OpLoad %8 
					                           Uniform f32* %73 = OpAccessChain %13 %60 
					                                    f32 %74 = OpLoad %73 
					                                    f32 %75 = OpFDiv %72 %74 
					                                                OpStore %8 %75 
					                                    f32 %76 = OpLoad %8 
					                                    f32 %77 = OpExtInst %1 43 %76 %22 %21 
					                                                OpStore %8 %77 
					                    read_only Texture2D %79 = OpLoad %78 
					                                sampler %81 = OpLoad %80 
					             read_only Texture2DSampled %82 = OpSampledImage %79 %81 
					                                  f32_4 %83 = OpLoad vs_TEXCOORD0 
					                                  f32_2 %84 = OpVectorShuffle %83 %83 0 1 
					                                  f32_4 %85 = OpImageSampleImplicitLod %82 %84 
					                                    f32 %86 = OpCompositeExtract %85 3 
					                                                OpStore %24 %86 
					                                    f32 %88 = OpLoad %24 
					                             Input f32* %91 = OpAccessChain vs_TEXCOORD1 %56 
					                                    f32 %92 = OpLoad %91 
					                                    f32 %93 = OpFMul %88 %92 
					                             Input f32* %94 = OpAccessChain vs_TEXCOORD1 %42 
					                                    f32 %95 = OpLoad %94 
					                                    f32 %96 = OpFNegate %95 
					                                    f32 %97 = OpFAdd %93 %96 
					                                                OpStore %87 %97 
					                                    f32 %98 = OpLoad %87 
					                                    f32 %99 = OpExtInst %1 43 %98 %22 %21 
					                                                OpStore %87 %99 
					                                   f32 %101 = OpLoad %87 
					                            Input f32* %103 = OpAccessChain %102 %42 
					                                   f32 %104 = OpLoad %103 
					                                   f32 %105 = OpFMul %101 %104 
					                                                OpStore %100 %105 
					                                   f32 %107 = OpLoad %100 
					                                 f32_3 %108 = OpCompositeConstruct %107 %107 %107 
					                        Uniform f32_4* %111 = OpAccessChain %13 %109 
					                                 f32_4 %112 = OpLoad %111 
					                                 f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
					                                 f32_3 %114 = OpFMul %108 %113 
					                                                OpStore %106 %114 
					                                   f32 %117 = OpLoad %8 
					                                   f32 %118 = OpLoad %100 
					                                   f32 %119 = OpFMul %117 %118 
					                          Private f32* %120 = OpAccessChain %116 %42 
					                                                OpStore %120 %119 
					                                 f32_4 %122 = OpLoad %102 
					                                 f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
					                                   f32 %124 = OpLoad %87 
					                                 f32_3 %125 = OpCompositeConstruct %124 %124 %124 
					                                 f32_3 %126 = OpFMul %123 %125 
					                                 f32_3 %127 = OpLoad %106 
					                                 f32_3 %128 = OpFNegate %127 
					                                 f32_3 %129 = OpFAdd %126 %128 
					                                                OpStore %121 %129 
					                                   f32 %130 = OpLoad %8 
					                                 f32_3 %131 = OpCompositeConstruct %130 %130 %130 
					                                 f32_3 %132 = OpLoad %121 
					                                 f32_3 %133 = OpFMul %131 %132 
					                                 f32_3 %134 = OpLoad %106 
					                                 f32_3 %135 = OpFAdd %133 %134 
					                                                OpStore %50 %135 
					                                   f32 %136 = OpLoad %8 
					                                 f32_3 %137 = OpCompositeConstruct %136 %136 %136 
					                                 f32_3 %138 = OpLoad %50 
					                                 f32_3 %139 = OpFMul %137 %138 
					                                 f32_4 %140 = OpLoad %116 
					                                 f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
					                                                OpStore %116 %141 
					                                 f32_4 %144 = OpLoad %116 
					                                                OpStore %143 %144 
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
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						vec4 unused_0_20[3];
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
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
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
					uniform 	vec4 _FaceColor;
					uniform 	float _FaceDilate;
					uniform 	float _OutlineSoftness;
					uniform 	vec4 _OutlineColor;
					uniform 	float _OutlineWidth;
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
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
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
					uniform 	float _MaskWipeControl;
					uniform 	float _MaskEdgeSoftness;
					uniform 	vec4 _MaskEdgeColor;
					uniform 	int _MaskInverse;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MaskTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = (_MaskInverse != 0) ? 1.0 : 0.0;
					    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.x + (-u_xlat10_1.w);
					    u_xlat3.x = (-_MaskWipeControl) + 1.0;
					    u_xlat0.x = u_xlat3.x * _MaskEdgeSoftness + abs(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_MaskWipeControl);
					    u_xlat0.x = u_xlat0.x / _MaskEdgeSoftness;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat1.w = u_xlat3.x * vs_COLOR0.w;
					    u_xlat2.xyz = u_xlat1.www * _MaskEdgeColor.xyz;
					    u_xlat6 = u_xlat1.w * u_xlat0.x + -0.00100000005;
					    u_xlatb6 = u_xlat6<0.0;
					    if(((int(u_xlatb6) * int(0xffffffffu)))!=0){discard;}
					    u_xlat3.xyz = vs_COLOR0.xyz * u_xlat3.xxx + (-u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat0;
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
					; Bound: 517
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %12 %118 %123 %136 %155 %266 %390 %430 %437 %439 %509 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate %12 Location 12 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpMemberDecorate %22 0 Offset 22 
					                                                      OpMemberDecorate %22 1 Offset 22 
					                                                      OpMemberDecorate %22 2 Offset 22 
					                                                      OpMemberDecorate %22 3 Offset 22 
					                                                      OpMemberDecorate %22 4 Offset 22 
					                                                      OpMemberDecorate %22 5 Offset 22 
					                                                      OpMemberDecorate %22 6 RelaxedPrecision 
					                                                      OpMemberDecorate %22 6 Offset 22 
					                                                      OpMemberDecorate %22 7 Offset 22 
					                                                      OpMemberDecorate %22 8 Offset 22 
					                                                      OpMemberDecorate %22 9 RelaxedPrecision 
					                                                      OpMemberDecorate %22 9 Offset 22 
					                                                      OpMemberDecorate %22 10 Offset 22 
					                                                      OpMemberDecorate %22 11 Offset 22 
					                                                      OpMemberDecorate %22 12 Offset 22 
					                                                      OpMemberDecorate %22 13 Offset 22 
					                                                      OpMemberDecorate %22 14 Offset 22 
					                                                      OpMemberDecorate %22 15 Offset 22 
					                                                      OpMemberDecorate %22 16 Offset 22 
					                                                      OpMemberDecorate %22 17 Offset 22 
					                                                      OpMemberDecorate %22 18 Offset 22 
					                                                      OpMemberDecorate %22 19 Offset 22 
					                                                      OpMemberDecorate %22 20 Offset 22 
					                                                      OpMemberDecorate %22 21 Offset 22 
					                                                      OpMemberDecorate %22 22 Offset 22 
					                                                      OpDecorate %22 Block 
					                                                      OpDecorate %24 DescriptorSet 24 
					                                                      OpDecorate %24 Binding 24 
					                                                      OpMemberDecorate %116 0 BuiltIn 116 
					                                                      OpMemberDecorate %116 1 BuiltIn 116 
					                                                      OpMemberDecorate %116 2 BuiltIn 116 
					                                                      OpDecorate %116 Block 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %123 Location 123 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %136 Location 136 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %155 Location 155 
					                                                      OpDecorate %266 Location 266 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %359 RelaxedPrecision 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %369 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %377 RelaxedPrecision 
					                                                      OpDecorate %378 RelaxedPrecision 
					                                                      OpDecorate %380 RelaxedPrecision 
					                                                      OpDecorate %381 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %388 RelaxedPrecision 
					                                                      OpDecorate %390 RelaxedPrecision 
					                                                      OpDecorate %390 Location 390 
					                                                      OpDecorate vs_TEXCOORD0 Location 430 
					                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 437 
					                                                      OpDecorate %439 Location 439 
					                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 509 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                                 Input f32_4* %12 = OpVariable Input 
					                                              %15 = OpTypeVector %6 3 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %10 %17 
					                                              %19 = OpTypeArray %10 %17 
					                                              %20 = OpTypeArray %10 %17 
					                                              %21 = OpTypeArray %10 %17 
					                                              %22 = OpTypeStruct %15 %10 %18 %19 %20 %21 %10 %6 %6 %10 %6 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 
					                                              %23 = OpTypePointer Uniform %22 
					Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32;}* %24 = OpVariable Uniform 
					                                              %25 = OpTypeInt 32 1 
					                                          i32 %26 = OpConstant 14 
					                                              %27 = OpTypePointer Uniform %6 
					                                          i32 %30 = OpConstant 15 
					                                              %35 = OpTypePointer Private %10 
					                               Private f32_4* %36 = OpVariable Private 
					                                          i32 %39 = OpConstant 2 
					                                          i32 %40 = OpConstant 1 
					                                              %41 = OpTypePointer Uniform %10 
					                                          i32 %45 = OpConstant 0 
					                               Private f32_4* %60 = OpVariable Private 
					                                          i32 %62 = OpConstant 3 
					                                              %80 = OpTypePointer Uniform %15 
					                               Private f32_4* %86 = OpVariable Private 
					                                          i32 %89 = OpConstant 5 
					                                         u32 %114 = OpConstant 1 
					                                             %115 = OpTypeArray %6 %114 
					                                             %116 = OpTypeStruct %10 %6 %115 
					                                             %117 = OpTypePointer Output %116 
					        Output struct {f32_4; f32; f32[1];}* %118 = OpVariable Output 
					                                             %120 = OpTypePointer Output %10 
					                              Private f32_4* %122 = OpVariable Private 
					                                Input f32_4* %123 = OpVariable Input 
					                                         i32 %125 = OpConstant 6 
					                               Output f32_4* %136 = OpVariable Output 
					                                             %138 = OpTypePointer Private %6 
					                                Private f32* %139 = OpVariable Private 
					                                             %154 = OpTypePointer Input %15 
					                                Input f32_3* %155 = OpVariable Input 
					                                         u32 %161 = OpConstant 0 
					                                         u32 %174 = OpConstant 2 
					                                         i32 %198 = OpConstant 4 
					                                         i32 %220 = OpConstant 20 
					                                         i32 %223 = OpConstant 21 
					                                Private f32* %237 = OpVariable Private 
					                                         i32 %243 = OpConstant 17 
					                                         i32 %246 = OpConstant 18 
					                                         f32 %250 = OpConstant 3,674022E-40 
					                                       f32_2 %251 = OpConstantComposite %250 %250 
					                                             %265 = OpTypePointer Input %7 
					                                Input f32_2* %266 = OpVariable Input 
					                                             %267 = OpTypePointer Input %6 
					                                         i32 %271 = OpConstant 19 
					                                         f32 %281 = OpConstant 3,674022E-40 
					                                Private f32* %284 = OpVariable Private 
					                                         i32 %285 = OpConstant 22 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %307 = OpTypeBool 
					                                             %308 = OpTypePointer Private %307 
					                               Private bool* %309 = OpVariable Private 
					                                         u32 %310 = OpConstant 3 
					                                         f32 %313 = OpConstant 3,674022E-40 
					                                             %316 = OpTypePointer Function %6 
					                                         i32 %325 = OpConstant 8 
					                                         i32 %328 = OpConstant 13 
					                                         i32 %340 = OpConstant 10 
					                              Private f32_4* %354 = OpVariable Private 
					                                         i32 %357 = OpConstant 9 
					                               Output f32_4* %390 = OpVariable Output 
					                                         i32 %392 = OpConstant 16 
					                                         f32 %395 = OpConstant 3,674022E-40 
					                                       f32_4 %396 = OpConstantComposite %395 %395 %395 %395 
					                                         f32 %399 = OpConstant 3,674022E-40 
					                                       f32_4 %400 = OpConstantComposite %399 %399 %399 %399 
					                                         f32 %410 = OpConstant 3,674022E-40 
					                                       f32_2 %411 = OpConstantComposite %410 %410 
					                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Input f32_2* %439 = OpVariable Input 
					                               Private bool* %443 = OpVariable Private 
					                                Private f32* %450 = OpVariable Private 
					                                         i32 %451 = OpConstant 11 
					                                         i32 %455 = OpConstant 12 
					                                         i32 %470 = OpConstant 7 
					                                         f32 %484 = OpConstant 3,674022E-40 
					                                         f32 %493 = OpConstant 3,674022E-40 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                             %511 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %317 = OpVariable Function 
					                                        f32_4 %13 = OpLoad %12 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                 Uniform f32* %28 = OpAccessChain %24 %26 
					                                          f32 %29 = OpLoad %28 
					                                 Uniform f32* %31 = OpAccessChain %24 %30 
					                                          f32 %32 = OpLoad %31 
					                                        f32_2 %33 = OpCompositeConstruct %29 %32 
					                                        f32_2 %34 = OpFAdd %14 %33 
					                                                      OpStore %9 %34 
					                                        f32_2 %37 = OpLoad %9 
					                                        f32_4 %38 = OpVectorShuffle %37 %37 1 1 1 1 
					                               Uniform f32_4* %42 = OpAccessChain %24 %39 %40 
					                                        f32_4 %43 = OpLoad %42 
					                                        f32_4 %44 = OpFMul %38 %43 
					                                                      OpStore %36 %44 
					                               Uniform f32_4* %46 = OpAccessChain %24 %39 %45 
					                                        f32_4 %47 = OpLoad %46 
					                                        f32_2 %48 = OpLoad %9 
					                                        f32_4 %49 = OpVectorShuffle %48 %48 0 0 0 0 
					                                        f32_4 %50 = OpFMul %47 %49 
					                                        f32_4 %51 = OpLoad %36 
					                                        f32_4 %52 = OpFAdd %50 %51 
					                                                      OpStore %36 %52 
					                               Uniform f32_4* %53 = OpAccessChain %24 %39 %39 
					                                        f32_4 %54 = OpLoad %53 
					                                        f32_4 %55 = OpLoad %12 
					                                        f32_4 %56 = OpVectorShuffle %55 %55 2 2 2 2 
					                                        f32_4 %57 = OpFMul %54 %56 
					                                        f32_4 %58 = OpLoad %36 
					                                        f32_4 %59 = OpFAdd %57 %58 
					                                                      OpStore %36 %59 
					                                        f32_4 %61 = OpLoad %36 
					                               Uniform f32_4* %63 = OpAccessChain %24 %39 %62 
					                                        f32_4 %64 = OpLoad %63 
					                                        f32_4 %65 = OpFAdd %61 %64 
					                                                      OpStore %60 %65 
					                               Uniform f32_4* %66 = OpAccessChain %24 %39 %62 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                        f32_4 %69 = OpLoad %12 
					                                        f32_3 %70 = OpVectorShuffle %69 %69 3 3 3 
					                                        f32_3 %71 = OpFMul %68 %70 
					                                        f32_4 %72 = OpLoad %36 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                                        f32_3 %74 = OpFAdd %71 %73 
					                                        f32_4 %75 = OpLoad %36 
					                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
					                                                      OpStore %36 %76 
					                                        f32_4 %77 = OpLoad %36 
					                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
					                                        f32_3 %79 = OpFNegate %78 
					                               Uniform f32_3* %81 = OpAccessChain %24 %45 
					                                        f32_3 %82 = OpLoad %81 
					                                        f32_3 %83 = OpFAdd %79 %82 
					                                        f32_4 %84 = OpLoad %36 
					                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
					                                                      OpStore %36 %85 
					                                        f32_4 %87 = OpLoad %60 
					                                        f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
					                               Uniform f32_4* %90 = OpAccessChain %24 %89 %40 
					                                        f32_4 %91 = OpLoad %90 
					                                        f32_4 %92 = OpFMul %88 %91 
					                                                      OpStore %86 %92 
					                               Uniform f32_4* %93 = OpAccessChain %24 %89 %45 
					                                        f32_4 %94 = OpLoad %93 
					                                        f32_4 %95 = OpLoad %60 
					                                        f32_4 %96 = OpVectorShuffle %95 %95 0 0 0 0 
					                                        f32_4 %97 = OpFMul %94 %96 
					                                        f32_4 %98 = OpLoad %86 
					                                        f32_4 %99 = OpFAdd %97 %98 
					                                                      OpStore %86 %99 
					                              Uniform f32_4* %100 = OpAccessChain %24 %89 %39 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_4 %102 = OpLoad %60 
					                                       f32_4 %103 = OpVectorShuffle %102 %102 2 2 2 2 
					                                       f32_4 %104 = OpFMul %101 %103 
					                                       f32_4 %105 = OpLoad %86 
					                                       f32_4 %106 = OpFAdd %104 %105 
					                                                      OpStore %86 %106 
					                              Uniform f32_4* %107 = OpAccessChain %24 %89 %62 
					                                       f32_4 %108 = OpLoad %107 
					                                       f32_4 %109 = OpLoad %60 
					                                       f32_4 %110 = OpVectorShuffle %109 %109 3 3 3 3 
					                                       f32_4 %111 = OpFMul %108 %110 
					                                       f32_4 %112 = OpLoad %86 
					                                       f32_4 %113 = OpFAdd %111 %112 
					                                                      OpStore %60 %113 
					                                       f32_4 %119 = OpLoad %60 
					                               Output f32_4* %121 = OpAccessChain %118 %45 
					                                                      OpStore %121 %119 
					                                       f32_4 %124 = OpLoad %123 
					                              Uniform f32_4* %126 = OpAccessChain %24 %125 
					                                       f32_4 %127 = OpLoad %126 
					                                       f32_4 %128 = OpFMul %124 %127 
					                                                      OpStore %122 %128 
					                                       f32_4 %129 = OpLoad %122 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 3 3 3 
					                                       f32_4 %131 = OpLoad %122 
					                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                       f32_3 %133 = OpFMul %130 %132 
					                                       f32_4 %134 = OpLoad %122 
					                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
					                                                      OpStore %122 %135 
					                                       f32_4 %137 = OpLoad %122 
					                                                      OpStore %136 %137 
					                                       f32_4 %140 = OpLoad %36 
					                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
					                                       f32_4 %142 = OpLoad %36 
					                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
					                                         f32 %144 = OpDot %141 %143 
					                                                      OpStore %139 %144 
					                                         f32 %145 = OpLoad %139 
					                                         f32 %146 = OpExtInst %1 32 %145 
					                                                      OpStore %139 %146 
					                                         f32 %147 = OpLoad %139 
					                                       f32_3 %148 = OpCompositeConstruct %147 %147 %147 
					                                       f32_4 %149 = OpLoad %36 
					                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
					                                       f32_3 %151 = OpFMul %148 %150 
					                                       f32_4 %152 = OpLoad %36 
					                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
					                                                      OpStore %36 %153 
					                                       f32_3 %156 = OpLoad %155 
					                              Uniform f32_4* %157 = OpAccessChain %24 %62 %45 
					                                       f32_4 %158 = OpLoad %157 
					                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                                         f32 %160 = OpDot %156 %159 
					                                Private f32* %162 = OpAccessChain %60 %161 
					                                                      OpStore %162 %160 
					                                       f32_3 %163 = OpLoad %155 
					                              Uniform f32_4* %164 = OpAccessChain %24 %62 %40 
					                                       f32_4 %165 = OpLoad %164 
					                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
					                                         f32 %167 = OpDot %163 %166 
					                                Private f32* %168 = OpAccessChain %60 %114 
					                                                      OpStore %168 %167 
					                                       f32_3 %169 = OpLoad %155 
					                              Uniform f32_4* %170 = OpAccessChain %24 %62 %39 
					                                       f32_4 %171 = OpLoad %170 
					                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
					                                         f32 %173 = OpDot %169 %172 
					                                Private f32* %175 = OpAccessChain %60 %174 
					                                                      OpStore %175 %173 
					                                       f32_4 %176 = OpLoad %60 
					                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
					                                       f32_4 %178 = OpLoad %60 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                         f32 %180 = OpDot %177 %179 
					                                                      OpStore %139 %180 
					                                         f32 %181 = OpLoad %139 
					                                         f32 %182 = OpExtInst %1 32 %181 
					                                                      OpStore %139 %182 
					                                         f32 %183 = OpLoad %139 
					                                       f32_3 %184 = OpCompositeConstruct %183 %183 %183 
					                                       f32_4 %185 = OpLoad %60 
					                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
					                                       f32_3 %187 = OpFMul %184 %186 
					                                       f32_4 %188 = OpLoad %60 
					                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
					                                                      OpStore %60 %189 
					                                       f32_4 %190 = OpLoad %60 
					                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
					                                       f32_4 %192 = OpLoad %36 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                         f32 %194 = OpDot %191 %193 
					                                                      OpStore %139 %194 
					                              Uniform f32_4* %195 = OpAccessChain %24 %40 
					                                       f32_4 %196 = OpLoad %195 
					                                       f32_2 %197 = OpVectorShuffle %196 %196 1 1 
					                              Uniform f32_4* %199 = OpAccessChain %24 %198 %40 
					                                       f32_4 %200 = OpLoad %199 
					                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
					                                       f32_2 %202 = OpFMul %197 %201 
					                                       f32_4 %203 = OpLoad %36 
					                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 2 3 
					                                                      OpStore %36 %204 
					                              Uniform f32_4* %205 = OpAccessChain %24 %198 %45 
					                                       f32_4 %206 = OpLoad %205 
					                                       f32_2 %207 = OpVectorShuffle %206 %206 0 1 
					                              Uniform f32_4* %208 = OpAccessChain %24 %40 
					                                       f32_4 %209 = OpLoad %208 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 0 
					                                       f32_2 %211 = OpFMul %207 %210 
					                                       f32_4 %212 = OpLoad %36 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
					                                       f32_2 %214 = OpFAdd %211 %213 
					                                       f32_4 %215 = OpLoad %36 
					                                       f32_4 %216 = OpVectorShuffle %215 %214 4 5 2 3 
					                                                      OpStore %36 %216 
					                                       f32_4 %217 = OpLoad %36 
					                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
					                                       f32_2 %219 = OpExtInst %1 4 %218 
					                                Uniform f32* %221 = OpAccessChain %24 %220 
					                                         f32 %222 = OpLoad %221 
					                                Uniform f32* %224 = OpAccessChain %24 %223 
					                                         f32 %225 = OpLoad %224 
					                                       f32_2 %226 = OpCompositeConstruct %222 %225 
					                                       f32_2 %227 = OpFMul %219 %226 
					                                       f32_4 %228 = OpLoad %36 
					                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 2 3 
					                                                      OpStore %36 %229 
					                                       f32_4 %230 = OpLoad %60 
					                                       f32_2 %231 = OpVectorShuffle %230 %230 3 3 
					                                       f32_4 %232 = OpLoad %36 
					                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
					                                       f32_2 %234 = OpFDiv %231 %233 
					                                       f32_4 %235 = OpLoad %36 
					                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
					                                                      OpStore %36 %236 
					                                       f32_4 %238 = OpLoad %36 
					                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
					                                       f32_4 %240 = OpLoad %36 
					                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
					                                         f32 %242 = OpDot %239 %241 
					                                                      OpStore %237 %242 
					                                Uniform f32* %244 = OpAccessChain %24 %243 
					                                         f32 %245 = OpLoad %244 
					                                Uniform f32* %247 = OpAccessChain %24 %246 
					                                         f32 %248 = OpLoad %247 
					                                       f32_2 %249 = OpCompositeConstruct %245 %248 
					                                       f32_2 %252 = OpFMul %249 %251 
					                                       f32_4 %253 = OpLoad %36 
					                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
					                                       f32_2 %255 = OpFAdd %252 %254 
					                                       f32_4 %256 = OpLoad %36 
					                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 2 3 
					                                                      OpStore %36 %257 
					                                       f32_4 %258 = OpLoad %36 
					                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
					                                       f32_2 %260 = OpFDiv %251 %259 
					                                       f32_4 %261 = OpLoad %36 
					                                       f32_4 %262 = OpVectorShuffle %261 %260 0 1 4 5 
					                                                      OpStore %36 %262 
					                                         f32 %263 = OpLoad %237 
					                                         f32 %264 = OpExtInst %1 32 %263 
					                                                      OpStore %237 %264 
					                                  Input f32* %268 = OpAccessChain %266 %114 
					                                         f32 %269 = OpLoad %268 
					                                         f32 %270 = OpExtInst %1 4 %269 
					                                Uniform f32* %272 = OpAccessChain %24 %271 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpFMul %270 %273 
					                                Private f32* %275 = OpAccessChain %60 %161 
					                                                      OpStore %275 %274 
					                                         f32 %276 = OpLoad %237 
					                                Private f32* %277 = OpAccessChain %60 %161 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFMul %276 %278 
					                                                      OpStore %237 %279 
					                                         f32 %280 = OpLoad %237 
					                                         f32 %282 = OpFMul %280 %281 
					                                Private f32* %283 = OpAccessChain %60 %161 
					                                                      OpStore %283 %282 
					                                Uniform f32* %286 = OpAccessChain %24 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFNegate %287 
					                                         f32 %290 = OpFAdd %288 %289 
					                                                      OpStore %284 %290 
					                                         f32 %291 = OpLoad %284 
					                                Private f32* %292 = OpAccessChain %60 %161 
					                                         f32 %293 = OpLoad %292 
					                                         f32 %294 = OpExtInst %1 4 %293 
					                                         f32 %295 = OpFMul %291 %294 
					                                                      OpStore %284 %295 
					                                         f32 %296 = OpLoad %237 
					                                         f32 %297 = OpFMul %296 %281 
					                                         f32 %298 = OpLoad %284 
					                                         f32 %299 = OpFNegate %298 
					                                         f32 %300 = OpFAdd %297 %299 
					                                                      OpStore %237 %300 
					                                         f32 %301 = OpLoad %139 
					                                         f32 %302 = OpExtInst %1 4 %301 
					                                         f32 %303 = OpLoad %237 
					                                         f32 %304 = OpFMul %302 %303 
					                                         f32 %305 = OpLoad %284 
					                                         f32 %306 = OpFAdd %304 %305 
					                                                      OpStore %139 %306 
					                                Uniform f32* %311 = OpAccessChain %24 %198 %62 %310 
					                                         f32 %312 = OpLoad %311 
					                                        bool %314 = OpFOrdEqual %312 %313 
					                                                      OpStore %309 %314 
					                                        bool %315 = OpLoad %309 
					                                                      OpSelectionMerge %319 None 
					                                                      OpBranchConditional %315 %318 %321 
					                                             %318 = OpLabel 
					                                         f32 %320 = OpLoad %139 
					                                                      OpStore %317 %320 
					                                                      OpBranch %319 
					                                             %321 = OpLabel 
					                                Private f32* %322 = OpAccessChain %60 %161 
					                                         f32 %323 = OpLoad %322 
					                                                      OpStore %317 %323 
					                                                      OpBranch %319 
					                                             %319 = OpLabel 
					                                         f32 %324 = OpLoad %317 
					                                                      OpStore %139 %324 
					                                Uniform f32* %326 = OpAccessChain %24 %325 
					                                         f32 %327 = OpLoad %326 
					                                Uniform f32* %329 = OpAccessChain %24 %328 
					                                         f32 %330 = OpLoad %329 
					                                         f32 %331 = OpFMul %327 %330 
					                                                      OpStore %237 %331 
					                                         f32 %332 = OpLoad %237 
					                                         f32 %333 = OpLoad %139 
					                                         f32 %334 = OpFMul %332 %333 
					                                         f32 %335 = OpFAdd %334 %289 
					                                                      OpStore %237 %335 
					                                         f32 %336 = OpLoad %139 
					                                         f32 %337 = OpLoad %237 
					                                         f32 %338 = OpFDiv %336 %337 
					                                Private f32* %339 = OpAccessChain %60 %161 
					                                                      OpStore %339 %338 
					                                Uniform f32* %341 = OpAccessChain %24 %340 
					                                         f32 %342 = OpLoad %341 
					                                Uniform f32* %343 = OpAccessChain %24 %328 
					                                         f32 %344 = OpLoad %343 
					                                         f32 %345 = OpFMul %342 %344 
					                                                      OpStore %139 %345 
					                                Private f32* %346 = OpAccessChain %60 %161 
					                                         f32 %347 = OpLoad %346 
					                                         f32 %348 = OpLoad %139 
					                                         f32 %349 = OpFMul %347 %348 
					                                                      OpStore %139 %349 
					                                         f32 %350 = OpLoad %139 
					                                         f32 %351 = OpExtInst %1 37 %350 %289 
					                                                      OpStore %237 %351 
					                                         f32 %352 = OpLoad %237 
					                                         f32 %353 = OpExtInst %1 31 %352 
					                                                      OpStore %237 %353 
					                                  Input f32* %355 = OpAccessChain %123 %310 
					                                         f32 %356 = OpLoad %355 
					                                Uniform f32* %358 = OpAccessChain %24 %357 %310 
					                                         f32 %359 = OpLoad %358 
					                                         f32 %360 = OpFMul %356 %359 
					                                Private f32* %361 = OpAccessChain %354 %161 
					                                                      OpStore %361 %360 
					                              Uniform f32_4* %362 = OpAccessChain %24 %357 
					                                       f32_4 %363 = OpLoad %362 
					                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
					                                       f32_4 %365 = OpLoad %354 
					                                       f32_3 %366 = OpVectorShuffle %365 %365 0 0 0 
					                                       f32_3 %367 = OpFMul %364 %366 
					                                       f32_4 %368 = OpLoad %122 
					                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
					                                       f32_3 %370 = OpFNegate %369 
					                                       f32_3 %371 = OpFAdd %367 %370 
					                                       f32_4 %372 = OpLoad %354 
					                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
					                                                      OpStore %354 %373 
					                                Uniform f32* %374 = OpAccessChain %24 %357 %310 
					                                         f32 %375 = OpLoad %374 
					                                  Input f32* %376 = OpAccessChain %123 %310 
					                                         f32 %377 = OpLoad %376 
					                                         f32 %378 = OpFMul %375 %377 
					                                Private f32* %379 = OpAccessChain %122 %310 
					                                         f32 %380 = OpLoad %379 
					                                         f32 %381 = OpFNegate %380 
					                                         f32 %382 = OpFAdd %378 %381 
					                                Private f32* %383 = OpAccessChain %354 %310 
					                                                      OpStore %383 %382 
					                                         f32 %384 = OpLoad %237 
					                                       f32_4 %385 = OpCompositeConstruct %384 %384 %384 %384 
					                                       f32_4 %386 = OpLoad %354 
					                                       f32_4 %387 = OpFMul %385 %386 
					                                       f32_4 %388 = OpLoad %122 
					                                       f32_4 %389 = OpFAdd %387 %388 
					                                                      OpStore %86 %389 
					                                       f32_4 %391 = OpLoad %86 
					                                                      OpStore %390 %391 
					                              Uniform f32_4* %393 = OpAccessChain %24 %392 
					                                       f32_4 %394 = OpLoad %393 
					                                       f32_4 %397 = OpExtInst %1 40 %394 %396 
					                                                      OpStore %86 %397 
					                                       f32_4 %398 = OpLoad %86 
					                                       f32_4 %401 = OpExtInst %1 37 %398 %400 
					                                                      OpStore %86 %401 
					                                       f32_2 %402 = OpLoad %9 
					                                       f32_4 %403 = OpLoad %86 
					                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
					                                       f32_2 %405 = OpFNegate %404 
					                                       f32_2 %406 = OpFAdd %402 %405 
					                                       f32_4 %407 = OpLoad %354 
					                                       f32_4 %408 = OpVectorShuffle %407 %406 4 5 2 3 
					                                                      OpStore %354 %408 
					                                       f32_2 %409 = OpLoad %9 
					                                       f32_2 %412 = OpFMul %409 %411 
					                                       f32_4 %413 = OpLoad %86 
					                                       f32_2 %414 = OpVectorShuffle %413 %413 0 1 
					                                       f32_2 %415 = OpFNegate %414 
					                                       f32_2 %416 = OpFAdd %412 %415 
					                                                      OpStore %9 %416 
					                                       f32_4 %417 = OpLoad %86 
					                                       f32_2 %418 = OpVectorShuffle %417 %417 2 3 
					                                       f32_2 %419 = OpFNegate %418 
					                                       f32_2 %420 = OpLoad %9 
					                                       f32_2 %421 = OpFAdd %419 %420 
					                                       f32_4 %422 = OpLoad %36 
					                                       f32_4 %423 = OpVectorShuffle %422 %421 4 5 2 3 
					                                                      OpStore %36 %423 
					                                       f32_4 %424 = OpLoad %86 
					                                       f32_2 %425 = OpVectorShuffle %424 %424 0 1 
					                                       f32_2 %426 = OpFNegate %425 
					                                       f32_4 %427 = OpLoad %86 
					                                       f32_2 %428 = OpVectorShuffle %427 %427 2 3 
					                                       f32_2 %429 = OpFAdd %426 %428 
					                                                      OpStore %9 %429 
					                                       f32_4 %431 = OpLoad %354 
					                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
					                                       f32_2 %433 = OpLoad %9 
					                                       f32_2 %434 = OpFDiv %432 %433 
					                                       f32_4 %435 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %436 = OpVectorShuffle %435 %434 0 1 4 5 
					                                                      OpStore vs_TEXCOORD0 %436 
					                                       f32_4 %438 = OpLoad %36 
					                                                      OpStore vs_TEXCOORD2 %438 
					                                       f32_2 %440 = OpLoad %439 
					                                       f32_4 %441 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %442 = OpVectorShuffle %441 %440 4 5 2 3 
					                                                      OpStore vs_TEXCOORD0 %442 
					                                  Input f32* %444 = OpAccessChain %266 %114 
					                                         f32 %445 = OpLoad %444 
					                                        bool %446 = OpFOrdGreaterThanEqual %313 %445 
					                                                      OpStore %443 %446 
					                                        bool %447 = OpLoad %443 
					                                         f32 %448 = OpSelect %447 %289 %313 
					                                Private f32* %449 = OpAccessChain %9 %161 
					                                                      OpStore %449 %448 
					                                Uniform f32* %452 = OpAccessChain %24 %451 
					                                         f32 %453 = OpLoad %452 
					                                         f32 %454 = OpFNegate %453 
					                                Uniform f32* %456 = OpAccessChain %24 %455 
					                                         f32 %457 = OpLoad %456 
					                                         f32 %458 = OpFAdd %454 %457 
					                                                      OpStore %450 %458 
					                                Private f32* %459 = OpAccessChain %9 %161 
					                                         f32 %460 = OpLoad %459 
					                                         f32 %461 = OpLoad %450 
					                                         f32 %462 = OpFMul %460 %461 
					                                Uniform f32* %463 = OpAccessChain %24 %451 
					                                         f32 %464 = OpLoad %463 
					                                         f32 %465 = OpFAdd %462 %464 
					                                Private f32* %466 = OpAccessChain %9 %161 
					                                                      OpStore %466 %465 
					                                Private f32* %467 = OpAccessChain %9 %161 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %469 = OpFMul %468 %250 
					                                Uniform f32* %471 = OpAccessChain %24 %470 
					                                         f32 %472 = OpLoad %471 
					                                         f32 %473 = OpFAdd %469 %472 
					                                Private f32* %474 = OpAccessChain %9 %161 
					                                                      OpStore %474 %473 
					                                Private f32* %475 = OpAccessChain %9 %161 
					                                         f32 %476 = OpLoad %475 
					                                Uniform f32* %477 = OpAccessChain %24 %328 
					                                         f32 %478 = OpLoad %477 
					                                         f32 %479 = OpFMul %476 %478 
					                                Private f32* %480 = OpAccessChain %9 %161 
					                                                      OpStore %480 %479 
					                                Private f32* %481 = OpAccessChain %9 %161 
					                                         f32 %482 = OpLoad %481 
					                                         f32 %483 = OpFNegate %482 
					                                         f32 %485 = OpFMul %483 %484 
					                                         f32 %486 = OpFAdd %485 %484 
					                                Private f32* %487 = OpAccessChain %9 %161 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %9 %161 
					                                         f32 %489 = OpLoad %488 
					                                Private f32* %490 = OpAccessChain %60 %161 
					                                         f32 %491 = OpLoad %490 
					                                         f32 %492 = OpFMul %489 %491 
					                                         f32 %494 = OpFAdd %492 %493 
					                                Private f32* %495 = OpAccessChain %60 %310 
					                                                      OpStore %495 %494 
					                                         f32 %496 = OpLoad %139 
					                                         f32 %497 = OpFNegate %496 
					                                         f32 %498 = OpFMul %497 %484 
					                                Private f32* %499 = OpAccessChain %60 %310 
					                                         f32 %500 = OpLoad %499 
					                                         f32 %501 = OpFAdd %498 %500 
					                                Private f32* %502 = OpAccessChain %60 %114 
					                                                      OpStore %502 %501 
					                                         f32 %503 = OpLoad %139 
					                                         f32 %504 = OpFMul %503 %484 
					                                Private f32* %505 = OpAccessChain %60 %310 
					                                         f32 %506 = OpLoad %505 
					                                         f32 %507 = OpFAdd %504 %506 
					                                Private f32* %508 = OpAccessChain %60 %174 
					                                                      OpStore %508 %507 
					                                       f32_4 %510 = OpLoad %60 
					                                                      OpStore vs_TEXCOORD1 %510 
					                                 Output f32* %512 = OpAccessChain %118 %45 %114 
					                                         f32 %513 = OpLoad %512 
					                                         f32 %514 = OpFNegate %513 
					                                 Output f32* %515 = OpAccessChain %118 %45 %114 
					                                                      OpStore %515 %514 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 164
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %36 %89 %102 %161 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                OpMemberDecorate %11 0 Offset 11 
					                                                OpMemberDecorate %11 1 Offset 11 
					                                                OpMemberDecorate %11 2 RelaxedPrecision 
					                                                OpMemberDecorate %11 2 Offset 11 
					                                                OpMemberDecorate %11 3 Offset 11 
					                                                OpDecorate %11 Block 
					                                                OpDecorate %13 DescriptorSet 13 
					                                                OpDecorate %13 Binding 13 
					                                                OpDecorate %24 RelaxedPrecision 
					                                                OpDecorate %27 RelaxedPrecision 
					                                                OpDecorate %27 DescriptorSet 27 
					                                                OpDecorate %27 Binding 27 
					                                                OpDecorate %28 RelaxedPrecision 
					                                                OpDecorate %31 RelaxedPrecision 
					                                                OpDecorate %31 DescriptorSet 31 
					                                                OpDecorate %31 Binding 31 
					                                                OpDecorate %32 RelaxedPrecision 
					                                                OpDecorate vs_TEXCOORD0 Location 36 
					                                                OpDecorate %43 RelaxedPrecision 
					                                                OpDecorate %44 RelaxedPrecision 
					                                                OpDecorate %45 RelaxedPrecision 
					                                                OpDecorate %78 RelaxedPrecision 
					                                                OpDecorate %78 DescriptorSet 78 
					                                                OpDecorate %78 Binding 78 
					                                                OpDecorate %79 RelaxedPrecision 
					                                                OpDecorate %80 RelaxedPrecision 
					                                                OpDecorate %80 DescriptorSet 80 
					                                                OpDecorate %80 Binding 80 
					                                                OpDecorate %81 RelaxedPrecision 
					                                                OpDecorate %86 RelaxedPrecision 
					                                                OpDecorate %87 RelaxedPrecision 
					                                                OpDecorate %88 RelaxedPrecision 
					                                                OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                OpDecorate vs_TEXCOORD1 Location 89 
					                                                OpDecorate %92 RelaxedPrecision 
					                                                OpDecorate %93 RelaxedPrecision 
					                                                OpDecorate %95 RelaxedPrecision 
					                                                OpDecorate %96 RelaxedPrecision 
					                                                OpDecorate %97 RelaxedPrecision 
					                                                OpDecorate %98 RelaxedPrecision 
					                                                OpDecorate %99 RelaxedPrecision 
					                                                OpDecorate %100 RelaxedPrecision 
					                                                OpDecorate %101 RelaxedPrecision 
					                                                OpDecorate %102 RelaxedPrecision 
					                                                OpDecorate %102 Location 102 
					                                                OpDecorate %104 RelaxedPrecision 
					                                                OpDecorate %105 RelaxedPrecision 
					                                                OpDecorate %106 RelaxedPrecision 
					                                                OpDecorate %107 RelaxedPrecision 
					                                                OpDecorate %114 RelaxedPrecision 
					                                                OpDecorate %124 RelaxedPrecision 
					                                                OpDecorate %125 RelaxedPrecision 
					                                                OpDecorate %126 RelaxedPrecision 
					                                                OpDecorate %130 RelaxedPrecision 
					                                                OpDecorate %131 RelaxedPrecision 
					                                                OpDecorate %132 RelaxedPrecision 
					                                                OpDecorate %136 RelaxedPrecision 
					                                                OpDecorate %139 RelaxedPrecision 
					                                                OpDecorate %140 RelaxedPrecision 
					                                                OpDecorate %141 RelaxedPrecision 
					                                                OpDecorate %142 RelaxedPrecision 
					                                                OpDecorate %143 RelaxedPrecision 
					                                                OpDecorate %144 RelaxedPrecision 
					                                                OpDecorate %145 RelaxedPrecision 
					                                                OpDecorate %146 RelaxedPrecision 
					                                                OpDecorate %147 RelaxedPrecision 
					                                                OpDecorate %149 RelaxedPrecision 
					                                                OpDecorate %150 RelaxedPrecision 
					                                                OpDecorate %151 RelaxedPrecision 
					                                                OpDecorate %152 RelaxedPrecision 
					                                                OpDecorate %153 RelaxedPrecision 
					                                                OpDecorate %161 RelaxedPrecision 
					                                                OpDecorate %161 Location 161 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypePointer Private %6 
					                            Private f32* %8 = OpVariable Private 
					                                         %9 = OpTypeVector %6 4 
					                                        %10 = OpTypeInt 32 1 
					                                        %11 = OpTypeStruct %6 %6 %9 %10 
					                                        %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32_4; i32;}* %13 = OpVariable Uniform 
					                                    i32 %14 = OpConstant 3 
					                                        %15 = OpTypePointer Uniform %10 
					                                    i32 %18 = OpConstant 0 
					                                        %19 = OpTypeBool 
					                                    f32 %21 = OpConstant 3,674022E-40 
					                                    f32 %22 = OpConstant 3,674022E-40 
					                           Private f32* %24 = OpVariable Private 
					                                        %25 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %26 = OpTypePointer UniformConstant %25 
					   UniformConstant read_only Texture2D* %27 = OpVariable UniformConstant 
					                                        %29 = OpTypeSampler 
					                                        %30 = OpTypePointer UniformConstant %29 
					               UniformConstant sampler* %31 = OpVariable UniformConstant 
					                                        %33 = OpTypeSampledImage %25 
					                                        %35 = OpTypePointer Input %9 
					                  Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                        %37 = OpTypeVector %6 2 
					                                        %41 = OpTypeInt 32 0 
					                                    u32 %42 = OpConstant 3 
					                                        %48 = OpTypeVector %6 3 
					                                        %49 = OpTypePointer Private %48 
					                         Private f32_3* %50 = OpVariable Private 
					                                        %51 = OpTypePointer Uniform %6 
					                                    u32 %56 = OpConstant 0 
					                                    i32 %60 = OpConstant 1 
					   UniformConstant read_only Texture2D* %78 = OpVariable UniformConstant 
					               UniformConstant sampler* %80 = OpVariable UniformConstant 
					                           Private f32* %87 = OpVariable Private 
					                  Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                        %90 = OpTypePointer Input %6 
					                          Private f32* %100 = OpVariable Private 
					                          Input f32_4* %102 = OpVariable Input 
					                          Private f32* %106 = OpVariable Private 
					                                   f32 %110 = OpConstant 3,674022E-40 
					                                       %112 = OpTypePointer Private %19 
					                         Private bool* %113 = OpVariable Private 
					                                   i32 %118 = OpConstant -1 
					                        Private f32_3* %124 = OpVariable Private 
					                                   i32 %127 = OpConstant 2 
					                                       %128 = OpTypePointer Uniform %9 
					                                       %133 = OpTypePointer Private %9 
					                        Private f32_4* %134 = OpVariable Private 
					                        Private f32_3* %139 = OpVariable Private 
					                                       %160 = OpTypePointer Output %9 
					                         Output f32_4* %161 = OpVariable Output 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                           Uniform i32* %16 = OpAccessChain %13 %14 
					                                    i32 %17 = OpLoad %16 
					                                   bool %20 = OpINotEqual %17 %18 
					                                    f32 %23 = OpSelect %20 %21 %22 
					                                                OpStore %8 %23 
					                    read_only Texture2D %28 = OpLoad %27 
					                                sampler %32 = OpLoad %31 
					             read_only Texture2DSampled %34 = OpSampledImage %28 %32 
					                                  f32_4 %38 = OpLoad vs_TEXCOORD0 
					                                  f32_2 %39 = OpVectorShuffle %38 %38 2 3 
					                                  f32_4 %40 = OpImageSampleImplicitLod %34 %39 
					                                    f32 %43 = OpCompositeExtract %40 3 
					                                                OpStore %24 %43 
					                                    f32 %44 = OpLoad %24 
					                                    f32 %45 = OpFNegate %44 
					                                    f32 %46 = OpLoad %8 
					                                    f32 %47 = OpFAdd %45 %46 
					                                                OpStore %8 %47 
					                           Uniform f32* %52 = OpAccessChain %13 %18 
					                                    f32 %53 = OpLoad %52 
					                                    f32 %54 = OpFNegate %53 
					                                    f32 %55 = OpFAdd %54 %21 
					                           Private f32* %57 = OpAccessChain %50 %56 
					                                                OpStore %57 %55 
					                           Private f32* %58 = OpAccessChain %50 %56 
					                                    f32 %59 = OpLoad %58 
					                           Uniform f32* %61 = OpAccessChain %13 %60 
					                                    f32 %62 = OpLoad %61 
					                                    f32 %63 = OpFMul %59 %62 
					                                    f32 %64 = OpLoad %8 
					                                    f32 %65 = OpExtInst %1 4 %64 
					                                    f32 %66 = OpFAdd %63 %65 
					                                                OpStore %8 %66 
					                                    f32 %67 = OpLoad %8 
					                           Uniform f32* %68 = OpAccessChain %13 %18 
					                                    f32 %69 = OpLoad %68 
					                                    f32 %70 = OpFNegate %69 
					                                    f32 %71 = OpFAdd %67 %70 
					                                                OpStore %8 %71 
					                                    f32 %72 = OpLoad %8 
					                           Uniform f32* %73 = OpAccessChain %13 %60 
					                                    f32 %74 = OpLoad %73 
					                                    f32 %75 = OpFDiv %72 %74 
					                                                OpStore %8 %75 
					                                    f32 %76 = OpLoad %8 
					                                    f32 %77 = OpExtInst %1 43 %76 %22 %21 
					                                                OpStore %8 %77 
					                    read_only Texture2D %79 = OpLoad %78 
					                                sampler %81 = OpLoad %80 
					             read_only Texture2DSampled %82 = OpSampledImage %79 %81 
					                                  f32_4 %83 = OpLoad vs_TEXCOORD0 
					                                  f32_2 %84 = OpVectorShuffle %83 %83 0 1 
					                                  f32_4 %85 = OpImageSampleImplicitLod %82 %84 
					                                    f32 %86 = OpCompositeExtract %85 3 
					                                                OpStore %24 %86 
					                                    f32 %88 = OpLoad %24 
					                             Input f32* %91 = OpAccessChain vs_TEXCOORD1 %56 
					                                    f32 %92 = OpLoad %91 
					                                    f32 %93 = OpFMul %88 %92 
					                             Input f32* %94 = OpAccessChain vs_TEXCOORD1 %42 
					                                    f32 %95 = OpLoad %94 
					                                    f32 %96 = OpFNegate %95 
					                                    f32 %97 = OpFAdd %93 %96 
					                                                OpStore %87 %97 
					                                    f32 %98 = OpLoad %87 
					                                    f32 %99 = OpExtInst %1 43 %98 %22 %21 
					                                                OpStore %87 %99 
					                                   f32 %101 = OpLoad %87 
					                            Input f32* %103 = OpAccessChain %102 %42 
					                                   f32 %104 = OpLoad %103 
					                                   f32 %105 = OpFMul %101 %104 
					                                                OpStore %100 %105 
					                                   f32 %107 = OpLoad %100 
					                                   f32 %108 = OpLoad %8 
					                                   f32 %109 = OpFMul %107 %108 
					                                   f32 %111 = OpFAdd %109 %110 
					                                                OpStore %106 %111 
					                                   f32 %114 = OpLoad %106 
					                                  bool %115 = OpFOrdLessThan %114 %22 
					                                                OpStore %113 %115 
					                                  bool %116 = OpLoad %113 
					                                   i32 %117 = OpSelect %116 %60 %18 
					                                   i32 %119 = OpIMul %117 %118 
					                                  bool %120 = OpINotEqual %119 %18 
					                                                OpSelectionMerge %122 None 
					                                                OpBranchConditional %120 %121 %122 
					                                       %121 = OpLabel 
					                                                OpKill
					                                       %122 = OpLabel 
					                                   f32 %125 = OpLoad %100 
					                                 f32_3 %126 = OpCompositeConstruct %125 %125 %125 
					                        Uniform f32_4* %129 = OpAccessChain %13 %127 
					                                 f32_4 %130 = OpLoad %129 
					                                 f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
					                                 f32_3 %132 = OpFMul %126 %131 
					                                                OpStore %124 %132 
					                                   f32 %135 = OpLoad %8 
					                                   f32 %136 = OpLoad %100 
					                                   f32 %137 = OpFMul %135 %136 
					                          Private f32* %138 = OpAccessChain %134 %42 
					                                                OpStore %138 %137 
					                                 f32_4 %140 = OpLoad %102 
					                                 f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
					                                   f32 %142 = OpLoad %87 
					                                 f32_3 %143 = OpCompositeConstruct %142 %142 %142 
					                                 f32_3 %144 = OpFMul %141 %143 
					                                 f32_3 %145 = OpLoad %124 
					                                 f32_3 %146 = OpFNegate %145 
					                                 f32_3 %147 = OpFAdd %144 %146 
					                                                OpStore %139 %147 
					                                   f32 %148 = OpLoad %8 
					                                 f32_3 %149 = OpCompositeConstruct %148 %148 %148 
					                                 f32_3 %150 = OpLoad %139 
					                                 f32_3 %151 = OpFMul %149 %150 
					                                 f32_3 %152 = OpLoad %124 
					                                 f32_3 %153 = OpFAdd %151 %152 
					                                                OpStore %50 %153 
					                                   f32 %154 = OpLoad %8 
					                                 f32_3 %155 = OpCompositeConstruct %154 %154 %154 
					                                 f32_3 %156 = OpLoad %50 
					                                 f32_3 %157 = OpFMul %155 %156 
					                                 f32_4 %158 = OpLoad %134 
					                                 f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
					                                                OpStore %134 %159 
					                                 f32_4 %162 = OpLoad %134 
					                                                OpStore %161 %162 
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
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						vec4 unused_0_20[3];
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
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
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
					uniform 	vec4 _FaceColor;
					uniform 	float _FaceDilate;
					uniform 	float _OutlineSoftness;
					uniform 	vec4 _OutlineColor;
					uniform 	float _OutlineWidth;
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
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
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
					uniform 	vec4 _ClipRect;
					uniform 	float _MaskWipeControl;
					uniform 	float _MaskEdgeSoftness;
					uniform 	vec4 _MaskEdgeColor;
					uniform 	int _MaskInverse;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MaskTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat8;
					void main()
					{
					    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
					    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.zw);
					    u_xlat0 = u_xlat0 + (-u_xlat10_1.w);
					    u_xlat4.x = (-_MaskWipeControl) + 1.0;
					    u_xlat0 = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0);
					    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
					    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
					    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
					    u_xlat4.x = u_xlat4.y * u_xlat4.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat8 = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat8) * vs_COLOR0;
					    u_xlat2.w = u_xlat4.x * u_xlat1.w;
					    u_xlat3.xyz = u_xlat2.www * _MaskEdgeColor.xyz;
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xxx + (-u_xlat3.xyz);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat4.xyz + u_xlat3.xyz;
					    SV_Target0 = vec4(u_xlat0) * u_xlat2;
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
					; Bound: 517
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %12 %118 %123 %136 %155 %266 %390 %430 %437 %439 %509 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate %12 Location 12 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpMemberDecorate %22 0 Offset 22 
					                                                      OpMemberDecorate %22 1 Offset 22 
					                                                      OpMemberDecorate %22 2 Offset 22 
					                                                      OpMemberDecorate %22 3 Offset 22 
					                                                      OpMemberDecorate %22 4 Offset 22 
					                                                      OpMemberDecorate %22 5 Offset 22 
					                                                      OpMemberDecorate %22 6 RelaxedPrecision 
					                                                      OpMemberDecorate %22 6 Offset 22 
					                                                      OpMemberDecorate %22 7 Offset 22 
					                                                      OpMemberDecorate %22 8 Offset 22 
					                                                      OpMemberDecorate %22 9 RelaxedPrecision 
					                                                      OpMemberDecorate %22 9 Offset 22 
					                                                      OpMemberDecorate %22 10 Offset 22 
					                                                      OpMemberDecorate %22 11 Offset 22 
					                                                      OpMemberDecorate %22 12 Offset 22 
					                                                      OpMemberDecorate %22 13 Offset 22 
					                                                      OpMemberDecorate %22 14 Offset 22 
					                                                      OpMemberDecorate %22 15 Offset 22 
					                                                      OpMemberDecorate %22 16 Offset 22 
					                                                      OpMemberDecorate %22 17 Offset 22 
					                                                      OpMemberDecorate %22 18 Offset 22 
					                                                      OpMemberDecorate %22 19 Offset 22 
					                                                      OpMemberDecorate %22 20 Offset 22 
					                                                      OpMemberDecorate %22 21 Offset 22 
					                                                      OpMemberDecorate %22 22 Offset 22 
					                                                      OpDecorate %22 Block 
					                                                      OpDecorate %24 DescriptorSet 24 
					                                                      OpDecorate %24 Binding 24 
					                                                      OpMemberDecorate %116 0 BuiltIn 116 
					                                                      OpMemberDecorate %116 1 BuiltIn 116 
					                                                      OpMemberDecorate %116 2 BuiltIn 116 
					                                                      OpDecorate %116 Block 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %123 Location 123 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %136 Location 136 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %155 Location 155 
					                                                      OpDecorate %266 Location 266 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %359 RelaxedPrecision 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %369 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %377 RelaxedPrecision 
					                                                      OpDecorate %378 RelaxedPrecision 
					                                                      OpDecorate %380 RelaxedPrecision 
					                                                      OpDecorate %381 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %388 RelaxedPrecision 
					                                                      OpDecorate %390 RelaxedPrecision 
					                                                      OpDecorate %390 Location 390 
					                                                      OpDecorate vs_TEXCOORD0 Location 430 
					                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 437 
					                                                      OpDecorate %439 Location 439 
					                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 509 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                                 Input f32_4* %12 = OpVariable Input 
					                                              %15 = OpTypeVector %6 3 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %10 %17 
					                                              %19 = OpTypeArray %10 %17 
					                                              %20 = OpTypeArray %10 %17 
					                                              %21 = OpTypeArray %10 %17 
					                                              %22 = OpTypeStruct %15 %10 %18 %19 %20 %21 %10 %6 %6 %10 %6 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 
					                                              %23 = OpTypePointer Uniform %22 
					Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32;}* %24 = OpVariable Uniform 
					                                              %25 = OpTypeInt 32 1 
					                                          i32 %26 = OpConstant 14 
					                                              %27 = OpTypePointer Uniform %6 
					                                          i32 %30 = OpConstant 15 
					                                              %35 = OpTypePointer Private %10 
					                               Private f32_4* %36 = OpVariable Private 
					                                          i32 %39 = OpConstant 2 
					                                          i32 %40 = OpConstant 1 
					                                              %41 = OpTypePointer Uniform %10 
					                                          i32 %45 = OpConstant 0 
					                               Private f32_4* %60 = OpVariable Private 
					                                          i32 %62 = OpConstant 3 
					                                              %80 = OpTypePointer Uniform %15 
					                               Private f32_4* %86 = OpVariable Private 
					                                          i32 %89 = OpConstant 5 
					                                         u32 %114 = OpConstant 1 
					                                             %115 = OpTypeArray %6 %114 
					                                             %116 = OpTypeStruct %10 %6 %115 
					                                             %117 = OpTypePointer Output %116 
					        Output struct {f32_4; f32; f32[1];}* %118 = OpVariable Output 
					                                             %120 = OpTypePointer Output %10 
					                              Private f32_4* %122 = OpVariable Private 
					                                Input f32_4* %123 = OpVariable Input 
					                                         i32 %125 = OpConstant 6 
					                               Output f32_4* %136 = OpVariable Output 
					                                             %138 = OpTypePointer Private %6 
					                                Private f32* %139 = OpVariable Private 
					                                             %154 = OpTypePointer Input %15 
					                                Input f32_3* %155 = OpVariable Input 
					                                         u32 %161 = OpConstant 0 
					                                         u32 %174 = OpConstant 2 
					                                         i32 %198 = OpConstant 4 
					                                         i32 %220 = OpConstant 20 
					                                         i32 %223 = OpConstant 21 
					                                Private f32* %237 = OpVariable Private 
					                                         i32 %243 = OpConstant 17 
					                                         i32 %246 = OpConstant 18 
					                                         f32 %250 = OpConstant 3,674022E-40 
					                                       f32_2 %251 = OpConstantComposite %250 %250 
					                                             %265 = OpTypePointer Input %7 
					                                Input f32_2* %266 = OpVariable Input 
					                                             %267 = OpTypePointer Input %6 
					                                         i32 %271 = OpConstant 19 
					                                         f32 %281 = OpConstant 3,674022E-40 
					                                Private f32* %284 = OpVariable Private 
					                                         i32 %285 = OpConstant 22 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %307 = OpTypeBool 
					                                             %308 = OpTypePointer Private %307 
					                               Private bool* %309 = OpVariable Private 
					                                         u32 %310 = OpConstant 3 
					                                         f32 %313 = OpConstant 3,674022E-40 
					                                             %316 = OpTypePointer Function %6 
					                                         i32 %325 = OpConstant 8 
					                                         i32 %328 = OpConstant 13 
					                                         i32 %340 = OpConstant 10 
					                              Private f32_4* %354 = OpVariable Private 
					                                         i32 %357 = OpConstant 9 
					                               Output f32_4* %390 = OpVariable Output 
					                                         i32 %392 = OpConstant 16 
					                                         f32 %395 = OpConstant 3,674022E-40 
					                                       f32_4 %396 = OpConstantComposite %395 %395 %395 %395 
					                                         f32 %399 = OpConstant 3,674022E-40 
					                                       f32_4 %400 = OpConstantComposite %399 %399 %399 %399 
					                                         f32 %410 = OpConstant 3,674022E-40 
					                                       f32_2 %411 = OpConstantComposite %410 %410 
					                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Input f32_2* %439 = OpVariable Input 
					                               Private bool* %443 = OpVariable Private 
					                                Private f32* %450 = OpVariable Private 
					                                         i32 %451 = OpConstant 11 
					                                         i32 %455 = OpConstant 12 
					                                         i32 %470 = OpConstant 7 
					                                         f32 %484 = OpConstant 3,674022E-40 
					                                         f32 %493 = OpConstant 3,674022E-40 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                             %511 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %317 = OpVariable Function 
					                                        f32_4 %13 = OpLoad %12 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                 Uniform f32* %28 = OpAccessChain %24 %26 
					                                          f32 %29 = OpLoad %28 
					                                 Uniform f32* %31 = OpAccessChain %24 %30 
					                                          f32 %32 = OpLoad %31 
					                                        f32_2 %33 = OpCompositeConstruct %29 %32 
					                                        f32_2 %34 = OpFAdd %14 %33 
					                                                      OpStore %9 %34 
					                                        f32_2 %37 = OpLoad %9 
					                                        f32_4 %38 = OpVectorShuffle %37 %37 1 1 1 1 
					                               Uniform f32_4* %42 = OpAccessChain %24 %39 %40 
					                                        f32_4 %43 = OpLoad %42 
					                                        f32_4 %44 = OpFMul %38 %43 
					                                                      OpStore %36 %44 
					                               Uniform f32_4* %46 = OpAccessChain %24 %39 %45 
					                                        f32_4 %47 = OpLoad %46 
					                                        f32_2 %48 = OpLoad %9 
					                                        f32_4 %49 = OpVectorShuffle %48 %48 0 0 0 0 
					                                        f32_4 %50 = OpFMul %47 %49 
					                                        f32_4 %51 = OpLoad %36 
					                                        f32_4 %52 = OpFAdd %50 %51 
					                                                      OpStore %36 %52 
					                               Uniform f32_4* %53 = OpAccessChain %24 %39 %39 
					                                        f32_4 %54 = OpLoad %53 
					                                        f32_4 %55 = OpLoad %12 
					                                        f32_4 %56 = OpVectorShuffle %55 %55 2 2 2 2 
					                                        f32_4 %57 = OpFMul %54 %56 
					                                        f32_4 %58 = OpLoad %36 
					                                        f32_4 %59 = OpFAdd %57 %58 
					                                                      OpStore %36 %59 
					                                        f32_4 %61 = OpLoad %36 
					                               Uniform f32_4* %63 = OpAccessChain %24 %39 %62 
					                                        f32_4 %64 = OpLoad %63 
					                                        f32_4 %65 = OpFAdd %61 %64 
					                                                      OpStore %60 %65 
					                               Uniform f32_4* %66 = OpAccessChain %24 %39 %62 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                        f32_4 %69 = OpLoad %12 
					                                        f32_3 %70 = OpVectorShuffle %69 %69 3 3 3 
					                                        f32_3 %71 = OpFMul %68 %70 
					                                        f32_4 %72 = OpLoad %36 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                                        f32_3 %74 = OpFAdd %71 %73 
					                                        f32_4 %75 = OpLoad %36 
					                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
					                                                      OpStore %36 %76 
					                                        f32_4 %77 = OpLoad %36 
					                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
					                                        f32_3 %79 = OpFNegate %78 
					                               Uniform f32_3* %81 = OpAccessChain %24 %45 
					                                        f32_3 %82 = OpLoad %81 
					                                        f32_3 %83 = OpFAdd %79 %82 
					                                        f32_4 %84 = OpLoad %36 
					                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
					                                                      OpStore %36 %85 
					                                        f32_4 %87 = OpLoad %60 
					                                        f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
					                               Uniform f32_4* %90 = OpAccessChain %24 %89 %40 
					                                        f32_4 %91 = OpLoad %90 
					                                        f32_4 %92 = OpFMul %88 %91 
					                                                      OpStore %86 %92 
					                               Uniform f32_4* %93 = OpAccessChain %24 %89 %45 
					                                        f32_4 %94 = OpLoad %93 
					                                        f32_4 %95 = OpLoad %60 
					                                        f32_4 %96 = OpVectorShuffle %95 %95 0 0 0 0 
					                                        f32_4 %97 = OpFMul %94 %96 
					                                        f32_4 %98 = OpLoad %86 
					                                        f32_4 %99 = OpFAdd %97 %98 
					                                                      OpStore %86 %99 
					                              Uniform f32_4* %100 = OpAccessChain %24 %89 %39 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_4 %102 = OpLoad %60 
					                                       f32_4 %103 = OpVectorShuffle %102 %102 2 2 2 2 
					                                       f32_4 %104 = OpFMul %101 %103 
					                                       f32_4 %105 = OpLoad %86 
					                                       f32_4 %106 = OpFAdd %104 %105 
					                                                      OpStore %86 %106 
					                              Uniform f32_4* %107 = OpAccessChain %24 %89 %62 
					                                       f32_4 %108 = OpLoad %107 
					                                       f32_4 %109 = OpLoad %60 
					                                       f32_4 %110 = OpVectorShuffle %109 %109 3 3 3 3 
					                                       f32_4 %111 = OpFMul %108 %110 
					                                       f32_4 %112 = OpLoad %86 
					                                       f32_4 %113 = OpFAdd %111 %112 
					                                                      OpStore %60 %113 
					                                       f32_4 %119 = OpLoad %60 
					                               Output f32_4* %121 = OpAccessChain %118 %45 
					                                                      OpStore %121 %119 
					                                       f32_4 %124 = OpLoad %123 
					                              Uniform f32_4* %126 = OpAccessChain %24 %125 
					                                       f32_4 %127 = OpLoad %126 
					                                       f32_4 %128 = OpFMul %124 %127 
					                                                      OpStore %122 %128 
					                                       f32_4 %129 = OpLoad %122 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 3 3 3 
					                                       f32_4 %131 = OpLoad %122 
					                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                       f32_3 %133 = OpFMul %130 %132 
					                                       f32_4 %134 = OpLoad %122 
					                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
					                                                      OpStore %122 %135 
					                                       f32_4 %137 = OpLoad %122 
					                                                      OpStore %136 %137 
					                                       f32_4 %140 = OpLoad %36 
					                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
					                                       f32_4 %142 = OpLoad %36 
					                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
					                                         f32 %144 = OpDot %141 %143 
					                                                      OpStore %139 %144 
					                                         f32 %145 = OpLoad %139 
					                                         f32 %146 = OpExtInst %1 32 %145 
					                                                      OpStore %139 %146 
					                                         f32 %147 = OpLoad %139 
					                                       f32_3 %148 = OpCompositeConstruct %147 %147 %147 
					                                       f32_4 %149 = OpLoad %36 
					                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
					                                       f32_3 %151 = OpFMul %148 %150 
					                                       f32_4 %152 = OpLoad %36 
					                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
					                                                      OpStore %36 %153 
					                                       f32_3 %156 = OpLoad %155 
					                              Uniform f32_4* %157 = OpAccessChain %24 %62 %45 
					                                       f32_4 %158 = OpLoad %157 
					                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                                         f32 %160 = OpDot %156 %159 
					                                Private f32* %162 = OpAccessChain %60 %161 
					                                                      OpStore %162 %160 
					                                       f32_3 %163 = OpLoad %155 
					                              Uniform f32_4* %164 = OpAccessChain %24 %62 %40 
					                                       f32_4 %165 = OpLoad %164 
					                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
					                                         f32 %167 = OpDot %163 %166 
					                                Private f32* %168 = OpAccessChain %60 %114 
					                                                      OpStore %168 %167 
					                                       f32_3 %169 = OpLoad %155 
					                              Uniform f32_4* %170 = OpAccessChain %24 %62 %39 
					                                       f32_4 %171 = OpLoad %170 
					                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
					                                         f32 %173 = OpDot %169 %172 
					                                Private f32* %175 = OpAccessChain %60 %174 
					                                                      OpStore %175 %173 
					                                       f32_4 %176 = OpLoad %60 
					                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
					                                       f32_4 %178 = OpLoad %60 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                         f32 %180 = OpDot %177 %179 
					                                                      OpStore %139 %180 
					                                         f32 %181 = OpLoad %139 
					                                         f32 %182 = OpExtInst %1 32 %181 
					                                                      OpStore %139 %182 
					                                         f32 %183 = OpLoad %139 
					                                       f32_3 %184 = OpCompositeConstruct %183 %183 %183 
					                                       f32_4 %185 = OpLoad %60 
					                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
					                                       f32_3 %187 = OpFMul %184 %186 
					                                       f32_4 %188 = OpLoad %60 
					                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
					                                                      OpStore %60 %189 
					                                       f32_4 %190 = OpLoad %60 
					                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
					                                       f32_4 %192 = OpLoad %36 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                         f32 %194 = OpDot %191 %193 
					                                                      OpStore %139 %194 
					                              Uniform f32_4* %195 = OpAccessChain %24 %40 
					                                       f32_4 %196 = OpLoad %195 
					                                       f32_2 %197 = OpVectorShuffle %196 %196 1 1 
					                              Uniform f32_4* %199 = OpAccessChain %24 %198 %40 
					                                       f32_4 %200 = OpLoad %199 
					                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
					                                       f32_2 %202 = OpFMul %197 %201 
					                                       f32_4 %203 = OpLoad %36 
					                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 2 3 
					                                                      OpStore %36 %204 
					                              Uniform f32_4* %205 = OpAccessChain %24 %198 %45 
					                                       f32_4 %206 = OpLoad %205 
					                                       f32_2 %207 = OpVectorShuffle %206 %206 0 1 
					                              Uniform f32_4* %208 = OpAccessChain %24 %40 
					                                       f32_4 %209 = OpLoad %208 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 0 
					                                       f32_2 %211 = OpFMul %207 %210 
					                                       f32_4 %212 = OpLoad %36 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
					                                       f32_2 %214 = OpFAdd %211 %213 
					                                       f32_4 %215 = OpLoad %36 
					                                       f32_4 %216 = OpVectorShuffle %215 %214 4 5 2 3 
					                                                      OpStore %36 %216 
					                                       f32_4 %217 = OpLoad %36 
					                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
					                                       f32_2 %219 = OpExtInst %1 4 %218 
					                                Uniform f32* %221 = OpAccessChain %24 %220 
					                                         f32 %222 = OpLoad %221 
					                                Uniform f32* %224 = OpAccessChain %24 %223 
					                                         f32 %225 = OpLoad %224 
					                                       f32_2 %226 = OpCompositeConstruct %222 %225 
					                                       f32_2 %227 = OpFMul %219 %226 
					                                       f32_4 %228 = OpLoad %36 
					                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 2 3 
					                                                      OpStore %36 %229 
					                                       f32_4 %230 = OpLoad %60 
					                                       f32_2 %231 = OpVectorShuffle %230 %230 3 3 
					                                       f32_4 %232 = OpLoad %36 
					                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
					                                       f32_2 %234 = OpFDiv %231 %233 
					                                       f32_4 %235 = OpLoad %36 
					                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
					                                                      OpStore %36 %236 
					                                       f32_4 %238 = OpLoad %36 
					                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
					                                       f32_4 %240 = OpLoad %36 
					                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
					                                         f32 %242 = OpDot %239 %241 
					                                                      OpStore %237 %242 
					                                Uniform f32* %244 = OpAccessChain %24 %243 
					                                         f32 %245 = OpLoad %244 
					                                Uniform f32* %247 = OpAccessChain %24 %246 
					                                         f32 %248 = OpLoad %247 
					                                       f32_2 %249 = OpCompositeConstruct %245 %248 
					                                       f32_2 %252 = OpFMul %249 %251 
					                                       f32_4 %253 = OpLoad %36 
					                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
					                                       f32_2 %255 = OpFAdd %252 %254 
					                                       f32_4 %256 = OpLoad %36 
					                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 2 3 
					                                                      OpStore %36 %257 
					                                       f32_4 %258 = OpLoad %36 
					                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
					                                       f32_2 %260 = OpFDiv %251 %259 
					                                       f32_4 %261 = OpLoad %36 
					                                       f32_4 %262 = OpVectorShuffle %261 %260 0 1 4 5 
					                                                      OpStore %36 %262 
					                                         f32 %263 = OpLoad %237 
					                                         f32 %264 = OpExtInst %1 32 %263 
					                                                      OpStore %237 %264 
					                                  Input f32* %268 = OpAccessChain %266 %114 
					                                         f32 %269 = OpLoad %268 
					                                         f32 %270 = OpExtInst %1 4 %269 
					                                Uniform f32* %272 = OpAccessChain %24 %271 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpFMul %270 %273 
					                                Private f32* %275 = OpAccessChain %60 %161 
					                                                      OpStore %275 %274 
					                                         f32 %276 = OpLoad %237 
					                                Private f32* %277 = OpAccessChain %60 %161 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFMul %276 %278 
					                                                      OpStore %237 %279 
					                                         f32 %280 = OpLoad %237 
					                                         f32 %282 = OpFMul %280 %281 
					                                Private f32* %283 = OpAccessChain %60 %161 
					                                                      OpStore %283 %282 
					                                Uniform f32* %286 = OpAccessChain %24 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFNegate %287 
					                                         f32 %290 = OpFAdd %288 %289 
					                                                      OpStore %284 %290 
					                                         f32 %291 = OpLoad %284 
					                                Private f32* %292 = OpAccessChain %60 %161 
					                                         f32 %293 = OpLoad %292 
					                                         f32 %294 = OpExtInst %1 4 %293 
					                                         f32 %295 = OpFMul %291 %294 
					                                                      OpStore %284 %295 
					                                         f32 %296 = OpLoad %237 
					                                         f32 %297 = OpFMul %296 %281 
					                                         f32 %298 = OpLoad %284 
					                                         f32 %299 = OpFNegate %298 
					                                         f32 %300 = OpFAdd %297 %299 
					                                                      OpStore %237 %300 
					                                         f32 %301 = OpLoad %139 
					                                         f32 %302 = OpExtInst %1 4 %301 
					                                         f32 %303 = OpLoad %237 
					                                         f32 %304 = OpFMul %302 %303 
					                                         f32 %305 = OpLoad %284 
					                                         f32 %306 = OpFAdd %304 %305 
					                                                      OpStore %139 %306 
					                                Uniform f32* %311 = OpAccessChain %24 %198 %62 %310 
					                                         f32 %312 = OpLoad %311 
					                                        bool %314 = OpFOrdEqual %312 %313 
					                                                      OpStore %309 %314 
					                                        bool %315 = OpLoad %309 
					                                                      OpSelectionMerge %319 None 
					                                                      OpBranchConditional %315 %318 %321 
					                                             %318 = OpLabel 
					                                         f32 %320 = OpLoad %139 
					                                                      OpStore %317 %320 
					                                                      OpBranch %319 
					                                             %321 = OpLabel 
					                                Private f32* %322 = OpAccessChain %60 %161 
					                                         f32 %323 = OpLoad %322 
					                                                      OpStore %317 %323 
					                                                      OpBranch %319 
					                                             %319 = OpLabel 
					                                         f32 %324 = OpLoad %317 
					                                                      OpStore %139 %324 
					                                Uniform f32* %326 = OpAccessChain %24 %325 
					                                         f32 %327 = OpLoad %326 
					                                Uniform f32* %329 = OpAccessChain %24 %328 
					                                         f32 %330 = OpLoad %329 
					                                         f32 %331 = OpFMul %327 %330 
					                                                      OpStore %237 %331 
					                                         f32 %332 = OpLoad %237 
					                                         f32 %333 = OpLoad %139 
					                                         f32 %334 = OpFMul %332 %333 
					                                         f32 %335 = OpFAdd %334 %289 
					                                                      OpStore %237 %335 
					                                         f32 %336 = OpLoad %139 
					                                         f32 %337 = OpLoad %237 
					                                         f32 %338 = OpFDiv %336 %337 
					                                Private f32* %339 = OpAccessChain %60 %161 
					                                                      OpStore %339 %338 
					                                Uniform f32* %341 = OpAccessChain %24 %340 
					                                         f32 %342 = OpLoad %341 
					                                Uniform f32* %343 = OpAccessChain %24 %328 
					                                         f32 %344 = OpLoad %343 
					                                         f32 %345 = OpFMul %342 %344 
					                                                      OpStore %139 %345 
					                                Private f32* %346 = OpAccessChain %60 %161 
					                                         f32 %347 = OpLoad %346 
					                                         f32 %348 = OpLoad %139 
					                                         f32 %349 = OpFMul %347 %348 
					                                                      OpStore %139 %349 
					                                         f32 %350 = OpLoad %139 
					                                         f32 %351 = OpExtInst %1 37 %350 %289 
					                                                      OpStore %237 %351 
					                                         f32 %352 = OpLoad %237 
					                                         f32 %353 = OpExtInst %1 31 %352 
					                                                      OpStore %237 %353 
					                                  Input f32* %355 = OpAccessChain %123 %310 
					                                         f32 %356 = OpLoad %355 
					                                Uniform f32* %358 = OpAccessChain %24 %357 %310 
					                                         f32 %359 = OpLoad %358 
					                                         f32 %360 = OpFMul %356 %359 
					                                Private f32* %361 = OpAccessChain %354 %161 
					                                                      OpStore %361 %360 
					                              Uniform f32_4* %362 = OpAccessChain %24 %357 
					                                       f32_4 %363 = OpLoad %362 
					                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
					                                       f32_4 %365 = OpLoad %354 
					                                       f32_3 %366 = OpVectorShuffle %365 %365 0 0 0 
					                                       f32_3 %367 = OpFMul %364 %366 
					                                       f32_4 %368 = OpLoad %122 
					                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
					                                       f32_3 %370 = OpFNegate %369 
					                                       f32_3 %371 = OpFAdd %367 %370 
					                                       f32_4 %372 = OpLoad %354 
					                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
					                                                      OpStore %354 %373 
					                                Uniform f32* %374 = OpAccessChain %24 %357 %310 
					                                         f32 %375 = OpLoad %374 
					                                  Input f32* %376 = OpAccessChain %123 %310 
					                                         f32 %377 = OpLoad %376 
					                                         f32 %378 = OpFMul %375 %377 
					                                Private f32* %379 = OpAccessChain %122 %310 
					                                         f32 %380 = OpLoad %379 
					                                         f32 %381 = OpFNegate %380 
					                                         f32 %382 = OpFAdd %378 %381 
					                                Private f32* %383 = OpAccessChain %354 %310 
					                                                      OpStore %383 %382 
					                                         f32 %384 = OpLoad %237 
					                                       f32_4 %385 = OpCompositeConstruct %384 %384 %384 %384 
					                                       f32_4 %386 = OpLoad %354 
					                                       f32_4 %387 = OpFMul %385 %386 
					                                       f32_4 %388 = OpLoad %122 
					                                       f32_4 %389 = OpFAdd %387 %388 
					                                                      OpStore %86 %389 
					                                       f32_4 %391 = OpLoad %86 
					                                                      OpStore %390 %391 
					                              Uniform f32_4* %393 = OpAccessChain %24 %392 
					                                       f32_4 %394 = OpLoad %393 
					                                       f32_4 %397 = OpExtInst %1 40 %394 %396 
					                                                      OpStore %86 %397 
					                                       f32_4 %398 = OpLoad %86 
					                                       f32_4 %401 = OpExtInst %1 37 %398 %400 
					                                                      OpStore %86 %401 
					                                       f32_2 %402 = OpLoad %9 
					                                       f32_4 %403 = OpLoad %86 
					                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
					                                       f32_2 %405 = OpFNegate %404 
					                                       f32_2 %406 = OpFAdd %402 %405 
					                                       f32_4 %407 = OpLoad %354 
					                                       f32_4 %408 = OpVectorShuffle %407 %406 4 5 2 3 
					                                                      OpStore %354 %408 
					                                       f32_2 %409 = OpLoad %9 
					                                       f32_2 %412 = OpFMul %409 %411 
					                                       f32_4 %413 = OpLoad %86 
					                                       f32_2 %414 = OpVectorShuffle %413 %413 0 1 
					                                       f32_2 %415 = OpFNegate %414 
					                                       f32_2 %416 = OpFAdd %412 %415 
					                                                      OpStore %9 %416 
					                                       f32_4 %417 = OpLoad %86 
					                                       f32_2 %418 = OpVectorShuffle %417 %417 2 3 
					                                       f32_2 %419 = OpFNegate %418 
					                                       f32_2 %420 = OpLoad %9 
					                                       f32_2 %421 = OpFAdd %419 %420 
					                                       f32_4 %422 = OpLoad %36 
					                                       f32_4 %423 = OpVectorShuffle %422 %421 4 5 2 3 
					                                                      OpStore %36 %423 
					                                       f32_4 %424 = OpLoad %86 
					                                       f32_2 %425 = OpVectorShuffle %424 %424 0 1 
					                                       f32_2 %426 = OpFNegate %425 
					                                       f32_4 %427 = OpLoad %86 
					                                       f32_2 %428 = OpVectorShuffle %427 %427 2 3 
					                                       f32_2 %429 = OpFAdd %426 %428 
					                                                      OpStore %9 %429 
					                                       f32_4 %431 = OpLoad %354 
					                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
					                                       f32_2 %433 = OpLoad %9 
					                                       f32_2 %434 = OpFDiv %432 %433 
					                                       f32_4 %435 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %436 = OpVectorShuffle %435 %434 0 1 4 5 
					                                                      OpStore vs_TEXCOORD0 %436 
					                                       f32_4 %438 = OpLoad %36 
					                                                      OpStore vs_TEXCOORD2 %438 
					                                       f32_2 %440 = OpLoad %439 
					                                       f32_4 %441 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %442 = OpVectorShuffle %441 %440 4 5 2 3 
					                                                      OpStore vs_TEXCOORD0 %442 
					                                  Input f32* %444 = OpAccessChain %266 %114 
					                                         f32 %445 = OpLoad %444 
					                                        bool %446 = OpFOrdGreaterThanEqual %313 %445 
					                                                      OpStore %443 %446 
					                                        bool %447 = OpLoad %443 
					                                         f32 %448 = OpSelect %447 %289 %313 
					                                Private f32* %449 = OpAccessChain %9 %161 
					                                                      OpStore %449 %448 
					                                Uniform f32* %452 = OpAccessChain %24 %451 
					                                         f32 %453 = OpLoad %452 
					                                         f32 %454 = OpFNegate %453 
					                                Uniform f32* %456 = OpAccessChain %24 %455 
					                                         f32 %457 = OpLoad %456 
					                                         f32 %458 = OpFAdd %454 %457 
					                                                      OpStore %450 %458 
					                                Private f32* %459 = OpAccessChain %9 %161 
					                                         f32 %460 = OpLoad %459 
					                                         f32 %461 = OpLoad %450 
					                                         f32 %462 = OpFMul %460 %461 
					                                Uniform f32* %463 = OpAccessChain %24 %451 
					                                         f32 %464 = OpLoad %463 
					                                         f32 %465 = OpFAdd %462 %464 
					                                Private f32* %466 = OpAccessChain %9 %161 
					                                                      OpStore %466 %465 
					                                Private f32* %467 = OpAccessChain %9 %161 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %469 = OpFMul %468 %250 
					                                Uniform f32* %471 = OpAccessChain %24 %470 
					                                         f32 %472 = OpLoad %471 
					                                         f32 %473 = OpFAdd %469 %472 
					                                Private f32* %474 = OpAccessChain %9 %161 
					                                                      OpStore %474 %473 
					                                Private f32* %475 = OpAccessChain %9 %161 
					                                         f32 %476 = OpLoad %475 
					                                Uniform f32* %477 = OpAccessChain %24 %328 
					                                         f32 %478 = OpLoad %477 
					                                         f32 %479 = OpFMul %476 %478 
					                                Private f32* %480 = OpAccessChain %9 %161 
					                                                      OpStore %480 %479 
					                                Private f32* %481 = OpAccessChain %9 %161 
					                                         f32 %482 = OpLoad %481 
					                                         f32 %483 = OpFNegate %482 
					                                         f32 %485 = OpFMul %483 %484 
					                                         f32 %486 = OpFAdd %485 %484 
					                                Private f32* %487 = OpAccessChain %9 %161 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %9 %161 
					                                         f32 %489 = OpLoad %488 
					                                Private f32* %490 = OpAccessChain %60 %161 
					                                         f32 %491 = OpLoad %490 
					                                         f32 %492 = OpFMul %489 %491 
					                                         f32 %494 = OpFAdd %492 %493 
					                                Private f32* %495 = OpAccessChain %60 %310 
					                                                      OpStore %495 %494 
					                                         f32 %496 = OpLoad %139 
					                                         f32 %497 = OpFNegate %496 
					                                         f32 %498 = OpFMul %497 %484 
					                                Private f32* %499 = OpAccessChain %60 %310 
					                                         f32 %500 = OpLoad %499 
					                                         f32 %501 = OpFAdd %498 %500 
					                                Private f32* %502 = OpAccessChain %60 %114 
					                                                      OpStore %502 %501 
					                                         f32 %503 = OpLoad %139 
					                                         f32 %504 = OpFMul %503 %484 
					                                Private f32* %505 = OpAccessChain %60 %310 
					                                         f32 %506 = OpLoad %505 
					                                         f32 %507 = OpFAdd %504 %506 
					                                Private f32* %508 = OpAccessChain %60 %174 
					                                                      OpStore %508 %507 
					                                       f32_4 %510 = OpLoad %60 
					                                                      OpStore vs_TEXCOORD1 %510 
					                                 Output f32* %512 = OpAccessChain %118 %45 %114 
					                                         f32 %513 = OpLoad %512 
					                                         f32 %514 = OpFNegate %513 
					                                 Output f32* %515 = OpAccessChain %118 %45 %114 
					                                                      OpStore %515 %514 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 192
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %30 %75 %83 %97 %189 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 RelaxedPrecision 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 30 
					                                                      OpDecorate %31 RelaxedPrecision 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %40 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate %55 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %67 RelaxedPrecision 
					                                                      OpDecorate %67 DescriptorSet 67 
					                                                      OpDecorate %67 Binding 67 
					                                                      OpDecorate %68 RelaxedPrecision 
					                                                      OpDecorate %71 RelaxedPrecision 
					                                                      OpDecorate %71 DescriptorSet 71 
					                                                      OpDecorate %71 Binding 71 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 75 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %81 RelaxedPrecision 
					                                                      OpDecorate %82 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 83 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %89 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %97 Location 97 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %132 DescriptorSet 132 
					                                                      OpDecorate %132 Binding 132 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %134 DescriptorSet 134 
					                                                      OpDecorate %134 Binding 134 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %189 Location 189 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeInt 32 1 
					                                              %11 = OpTypeStruct %7 %6 %6 %7 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32; f32; f32_4; i32;}* %13 = OpVariable Uniform 
					                                          i32 %14 = OpConstant 0 
					                                              %15 = OpTypeVector %6 2 
					                                              %16 = OpTypePointer Uniform %7 
					                                              %29 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
					                                          f32 %47 = OpConstant 3,674022E-40 
					                                          f32 %48 = OpConstant 3,674022E-40 
					                                              %54 = OpTypePointer Private %6 
					                                 Private f32* %55 = OpVariable Private 
					                                              %56 = OpTypeInt 32 0 
					                                          u32 %57 = OpConstant 1 
					                                          u32 %60 = OpConstant 0 
					                                 Private f32* %64 = OpVariable Private 
					                                              %65 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %66 = OpTypePointer UniformConstant %65 
					         UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
					                                              %69 = OpTypeSampler 
					                                              %70 = OpTypePointer UniformConstant %69 
					                     UniformConstant sampler* %71 = OpVariable UniformConstant 
					                                              %73 = OpTypeSampledImage %65 
					                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                          u32 %79 = OpConstant 3 
					                                 Private f32* %81 = OpVariable Private 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                              %84 = OpTypePointer Input %6 
					                               Private f32_4* %94 = OpVariable Private 
					                                 Input f32_4* %97 = OpVariable Input 
					                                             %104 = OpTypeVector %6 3 
					                                             %105 = OpTypePointer Private %104 
					                              Private f32_3* %106 = OpVariable Private 
					                                         i32 %109 = OpConstant 3 
					                              Private f32_3* %114 = OpVariable Private 
					                                Private f32* %123 = OpVariable Private 
					                                         i32 %124 = OpConstant 4 
					                                             %125 = OpTypePointer Uniform %10 
					                                             %128 = OpTypeBool 
					                                Private f32* %131 = OpVariable Private 
					        UniformConstant read_only Texture2D* %132 = OpVariable UniformConstant 
					                    UniformConstant sampler* %134 = OpVariable UniformConstant 
					                                Private f32* %145 = OpVariable Private 
					                                         i32 %146 = OpConstant 1 
					                                             %147 = OpTypePointer Uniform %6 
					                                         i32 %153 = OpConstant 2 
					                              Private f32_3* %171 = OpVariable Private 
					                                             %188 = OpTypePointer Output %7 
					                               Output f32_4* %189 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Uniform f32_4* %17 = OpAccessChain %13 %14 
					                                        f32_4 %18 = OpLoad %17 
					                                        f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                                        f32_2 %20 = OpFNegate %19 
					                               Uniform f32_4* %21 = OpAccessChain %13 %14 
					                                        f32_4 %22 = OpLoad %21 
					                                        f32_2 %23 = OpVectorShuffle %22 %22 2 3 
					                                        f32_2 %24 = OpFAdd %20 %23 
					                                        f32_4 %25 = OpLoad %9 
					                                        f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
					                                                      OpStore %9 %26 
					                                        f32_4 %27 = OpLoad %9 
					                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
					                                        f32_4 %31 = OpLoad vs_TEXCOORD2 
					                                        f32_2 %32 = OpVectorShuffle %31 %31 0 1 
					                                        f32_2 %33 = OpExtInst %1 4 %32 
					                                        f32_2 %34 = OpFNegate %33 
					                                        f32_2 %35 = OpFAdd %28 %34 
					                                        f32_4 %36 = OpLoad %9 
					                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
					                                                      OpStore %9 %37 
					                                        f32_4 %38 = OpLoad %9 
					                                        f32_2 %39 = OpVectorShuffle %38 %38 0 1 
					                                        f32_4 %40 = OpLoad vs_TEXCOORD2 
					                                        f32_2 %41 = OpVectorShuffle %40 %40 2 3 
					                                        f32_2 %42 = OpFMul %39 %41 
					                                        f32_4 %43 = OpLoad %9 
					                                        f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
					                                                      OpStore %9 %44 
					                                        f32_4 %45 = OpLoad %9 
					                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                        f32_2 %49 = OpCompositeConstruct %47 %47 
					                                        f32_2 %50 = OpCompositeConstruct %48 %48 
					                                        f32_2 %51 = OpExtInst %1 43 %46 %49 %50 
					                                        f32_4 %52 = OpLoad %9 
					                                        f32_4 %53 = OpVectorShuffle %52 %51 4 5 2 3 
					                                                      OpStore %9 %53 
					                                 Private f32* %58 = OpAccessChain %9 %57 
					                                          f32 %59 = OpLoad %58 
					                                 Private f32* %61 = OpAccessChain %9 %60 
					                                          f32 %62 = OpLoad %61 
					                                          f32 %63 = OpFMul %59 %62 
					                                                      OpStore %55 %63 
					                          read_only Texture2D %68 = OpLoad %67 
					                                      sampler %72 = OpLoad %71 
					                   read_only Texture2DSampled %74 = OpSampledImage %68 %72 
					                                        f32_4 %76 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
					                                        f32_4 %78 = OpImageSampleImplicitLod %74 %77 
					                                          f32 %80 = OpCompositeExtract %78 3 
					                                                      OpStore %64 %80 
					                                          f32 %82 = OpLoad %64 
					                                   Input f32* %85 = OpAccessChain vs_TEXCOORD1 %60 
					                                          f32 %86 = OpLoad %85 
					                                          f32 %87 = OpFMul %82 %86 
					                                   Input f32* %88 = OpAccessChain vs_TEXCOORD1 %79 
					                                          f32 %89 = OpLoad %88 
					                                          f32 %90 = OpFNegate %89 
					                                          f32 %91 = OpFAdd %87 %90 
					                                                      OpStore %81 %91 
					                                          f32 %92 = OpLoad %81 
					                                          f32 %93 = OpExtInst %1 43 %92 %47 %48 
					                                                      OpStore %81 %93 
					                                          f32 %95 = OpLoad %81 
					                                        f32_4 %96 = OpCompositeConstruct %95 %95 %95 %95 
					                                        f32_4 %98 = OpLoad %97 
					                                        f32_4 %99 = OpFMul %96 %98 
					                                                      OpStore %94 %99 
					                                         f32 %100 = OpLoad %55 
					                                Private f32* %101 = OpAccessChain %94 %79 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpFMul %100 %102 
					                                                      OpStore %81 %103 
					                                         f32 %107 = OpLoad %81 
					                                       f32_3 %108 = OpCompositeConstruct %107 %107 %107 
					                              Uniform f32_4* %110 = OpAccessChain %13 %109 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
					                                       f32_3 %113 = OpFMul %108 %112 
					                                                      OpStore %106 %113 
					                                       f32_4 %115 = OpLoad %94 
					                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
					                                         f32 %117 = OpLoad %55 
					                                       f32_3 %118 = OpCompositeConstruct %117 %117 %117 
					                                       f32_3 %119 = OpFMul %116 %118 
					                                       f32_3 %120 = OpLoad %106 
					                                       f32_3 %121 = OpFNegate %120 
					                                       f32_3 %122 = OpFAdd %119 %121 
					                                                      OpStore %114 %122 
					                                Uniform i32* %126 = OpAccessChain %13 %124 
					                                         i32 %127 = OpLoad %126 
					                                        bool %129 = OpINotEqual %127 %14 
					                                         f32 %130 = OpSelect %129 %48 %47 
					                                                      OpStore %123 %130 
					                         read_only Texture2D %133 = OpLoad %132 
					                                     sampler %135 = OpLoad %134 
					                  read_only Texture2DSampled %136 = OpSampledImage %133 %135 
					                                       f32_4 %137 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %138 = OpVectorShuffle %137 %137 2 3 
					                                       f32_4 %139 = OpImageSampleImplicitLod %136 %138 
					                                         f32 %140 = OpCompositeExtract %139 3 
					                                                      OpStore %131 %140 
					                                         f32 %141 = OpLoad %123 
					                                         f32 %142 = OpLoad %131 
					                                         f32 %143 = OpFNegate %142 
					                                         f32 %144 = OpFAdd %141 %143 
					                                                      OpStore %123 %144 
					                                Uniform f32* %148 = OpAccessChain %13 %146 
					                                         f32 %149 = OpLoad %148 
					                                         f32 %150 = OpFNegate %149 
					                                         f32 %151 = OpFAdd %150 %48 
					                                                      OpStore %145 %151 
					                                         f32 %152 = OpLoad %145 
					                                Uniform f32* %154 = OpAccessChain %13 %153 
					                                         f32 %155 = OpLoad %154 
					                                         f32 %156 = OpFMul %152 %155 
					                                         f32 %157 = OpLoad %123 
					                                         f32 %158 = OpExtInst %1 4 %157 
					                                         f32 %159 = OpFAdd %156 %158 
					                                                      OpStore %123 %159 
					                                         f32 %160 = OpLoad %123 
					                                Uniform f32* %161 = OpAccessChain %13 %146 
					                                         f32 %162 = OpLoad %161 
					                                         f32 %163 = OpFNegate %162 
					                                         f32 %164 = OpFAdd %160 %163 
					                                                      OpStore %123 %164 
					                                         f32 %165 = OpLoad %123 
					                                Uniform f32* %166 = OpAccessChain %13 %153 
					                                         f32 %167 = OpLoad %166 
					                                         f32 %168 = OpFDiv %165 %167 
					                                                      OpStore %123 %168 
					                                         f32 %169 = OpLoad %123 
					                                         f32 %170 = OpExtInst %1 43 %169 %47 %48 
					                                                      OpStore %123 %170 
					                                         f32 %172 = OpLoad %123 
					                                       f32_3 %173 = OpCompositeConstruct %172 %172 %172 
					                                       f32_3 %174 = OpLoad %114 
					                                       f32_3 %175 = OpFMul %173 %174 
					                                       f32_3 %176 = OpLoad %106 
					                                       f32_3 %177 = OpFAdd %175 %176 
					                                                      OpStore %171 %177 
					                                         f32 %178 = OpLoad %123 
					                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
					                                       f32_3 %180 = OpLoad %171 
					                                       f32_3 %181 = OpFMul %179 %180 
					                                       f32_4 %182 = OpLoad %9 
					                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
					                                                      OpStore %9 %183 
					                                         f32 %184 = OpLoad %81 
					                                         f32 %185 = OpLoad %123 
					                                         f32 %186 = OpFMul %184 %185 
					                                Private f32* %187 = OpAccessChain %9 %79 
					                                                      OpStore %187 %186 
					                                       f32_4 %190 = OpLoad %9 
					                                                      OpStore %189 %190 
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
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
						vec4 unused_0_20[3];
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
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
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
					uniform 	vec4 _FaceColor;
					uniform 	float _FaceDilate;
					uniform 	float _OutlineSoftness;
					uniform 	vec4 _OutlineColor;
					uniform 	float _OutlineWidth;
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
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat3 = in_COLOR0 * _FaceColor;
					    u_xlat3.xyz = u_xlat3.www * u_xlat3.xyz;
					    vs_COLOR0 = u_xlat3;
					    u_xlat4.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat4.xyz = u_xlat4.www * _OutlineColor.xyz;
					    u_xlat4 = (-u_xlat3) + u_xlat4;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat1.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = hlslcc_mtx4x4glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat15 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
					    u_xlat1.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat1.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat4 + u_xlat3;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
					    u_xlat0.x = u_xlat0.x * _ScaleRatioA;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat1.w = u_xlat0.x * u_xlat1.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat1.x + u_xlat1.w;
					    vs_TEXCOORD1.xw = u_xlat1.xw;
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
					uniform 	vec4 _ClipRect;
					uniform 	float _MaskWipeControl;
					uniform 	float _MaskEdgeSoftness;
					uniform 	vec4 _MaskEdgeColor;
					uniform 	int _MaskInverse;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MaskTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat8;
					bool u_xlatb8;
					void main()
					{
					    u_xlat0.x = (_MaskInverse != 0) ? 1.0 : 0.0;
					    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.x + (-u_xlat10_1.w);
					    u_xlat4.x = (-_MaskWipeControl) + 1.0;
					    u_xlat0.x = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_MaskWipeControl);
					    u_xlat0.x = u_xlat0.x / _MaskEdgeSoftness;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
					    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
					    u_xlat4.x = u_xlat4.y * u_xlat4.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat8 = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat8) * vs_COLOR0;
					    u_xlat2.w = u_xlat4.x * u_xlat1.w;
					    u_xlat3.xyz = u_xlat2.www * _MaskEdgeColor.xyz;
					    u_xlat8 = u_xlat2.w * u_xlat0.x + -0.00100000005;
					    u_xlatb8 = u_xlat8<0.0;
					    if(((int(u_xlatb8) * int(0xffffffffu)))!=0){discard;}
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xxx + (-u_xlat3.xyz);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat3.xyz;
					    u_xlat0 = u_xlat0.xxxx * u_xlat2;
					    SV_Target0 = u_xlat0;
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
					; Bound: 517
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %12 %118 %123 %136 %155 %266 %390 %430 %437 %439 %509 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate %12 Location 12 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpDecorate %19 ArrayStride 19 
					                                                      OpDecorate %20 ArrayStride 20 
					                                                      OpDecorate %21 ArrayStride 21 
					                                                      OpMemberDecorate %22 0 Offset 22 
					                                                      OpMemberDecorate %22 1 Offset 22 
					                                                      OpMemberDecorate %22 2 Offset 22 
					                                                      OpMemberDecorate %22 3 Offset 22 
					                                                      OpMemberDecorate %22 4 Offset 22 
					                                                      OpMemberDecorate %22 5 Offset 22 
					                                                      OpMemberDecorate %22 6 RelaxedPrecision 
					                                                      OpMemberDecorate %22 6 Offset 22 
					                                                      OpMemberDecorate %22 7 Offset 22 
					                                                      OpMemberDecorate %22 8 Offset 22 
					                                                      OpMemberDecorate %22 9 RelaxedPrecision 
					                                                      OpMemberDecorate %22 9 Offset 22 
					                                                      OpMemberDecorate %22 10 Offset 22 
					                                                      OpMemberDecorate %22 11 Offset 22 
					                                                      OpMemberDecorate %22 12 Offset 22 
					                                                      OpMemberDecorate %22 13 Offset 22 
					                                                      OpMemberDecorate %22 14 Offset 22 
					                                                      OpMemberDecorate %22 15 Offset 22 
					                                                      OpMemberDecorate %22 16 Offset 22 
					                                                      OpMemberDecorate %22 17 Offset 22 
					                                                      OpMemberDecorate %22 18 Offset 22 
					                                                      OpMemberDecorate %22 19 Offset 22 
					                                                      OpMemberDecorate %22 20 Offset 22 
					                                                      OpMemberDecorate %22 21 Offset 22 
					                                                      OpMemberDecorate %22 22 Offset 22 
					                                                      OpDecorate %22 Block 
					                                                      OpDecorate %24 DescriptorSet 24 
					                                                      OpDecorate %24 Binding 24 
					                                                      OpMemberDecorate %116 0 BuiltIn 116 
					                                                      OpMemberDecorate %116 1 BuiltIn 116 
					                                                      OpMemberDecorate %116 2 BuiltIn 116 
					                                                      OpDecorate %116 Block 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %123 Location 123 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %136 Location 136 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %155 Location 155 
					                                                      OpDecorate %266 Location 266 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %359 RelaxedPrecision 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %369 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %377 RelaxedPrecision 
					                                                      OpDecorate %378 RelaxedPrecision 
					                                                      OpDecorate %380 RelaxedPrecision 
					                                                      OpDecorate %381 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %388 RelaxedPrecision 
					                                                      OpDecorate %390 RelaxedPrecision 
					                                                      OpDecorate %390 Location 390 
					                                                      OpDecorate vs_TEXCOORD0 Location 430 
					                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 437 
					                                                      OpDecorate %439 Location 439 
					                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 509 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                                 Input f32_4* %12 = OpVariable Input 
					                                              %15 = OpTypeVector %6 3 
					                                              %16 = OpTypeInt 32 0 
					                                          u32 %17 = OpConstant 4 
					                                              %18 = OpTypeArray %10 %17 
					                                              %19 = OpTypeArray %10 %17 
					                                              %20 = OpTypeArray %10 %17 
					                                              %21 = OpTypeArray %10 %17 
					                                              %22 = OpTypeStruct %15 %10 %18 %19 %20 %21 %10 %6 %6 %10 %6 %6 %6 %6 %6 %6 %10 %6 %6 %6 %6 %6 %6 
					                                              %23 = OpTypePointer Uniform %22 
					Uniform struct {f32_3; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32; f32; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32;}* %24 = OpVariable Uniform 
					                                              %25 = OpTypeInt 32 1 
					                                          i32 %26 = OpConstant 14 
					                                              %27 = OpTypePointer Uniform %6 
					                                          i32 %30 = OpConstant 15 
					                                              %35 = OpTypePointer Private %10 
					                               Private f32_4* %36 = OpVariable Private 
					                                          i32 %39 = OpConstant 2 
					                                          i32 %40 = OpConstant 1 
					                                              %41 = OpTypePointer Uniform %10 
					                                          i32 %45 = OpConstant 0 
					                               Private f32_4* %60 = OpVariable Private 
					                                          i32 %62 = OpConstant 3 
					                                              %80 = OpTypePointer Uniform %15 
					                               Private f32_4* %86 = OpVariable Private 
					                                          i32 %89 = OpConstant 5 
					                                         u32 %114 = OpConstant 1 
					                                             %115 = OpTypeArray %6 %114 
					                                             %116 = OpTypeStruct %10 %6 %115 
					                                             %117 = OpTypePointer Output %116 
					        Output struct {f32_4; f32; f32[1];}* %118 = OpVariable Output 
					                                             %120 = OpTypePointer Output %10 
					                              Private f32_4* %122 = OpVariable Private 
					                                Input f32_4* %123 = OpVariable Input 
					                                         i32 %125 = OpConstant 6 
					                               Output f32_4* %136 = OpVariable Output 
					                                             %138 = OpTypePointer Private %6 
					                                Private f32* %139 = OpVariable Private 
					                                             %154 = OpTypePointer Input %15 
					                                Input f32_3* %155 = OpVariable Input 
					                                         u32 %161 = OpConstant 0 
					                                         u32 %174 = OpConstant 2 
					                                         i32 %198 = OpConstant 4 
					                                         i32 %220 = OpConstant 20 
					                                         i32 %223 = OpConstant 21 
					                                Private f32* %237 = OpVariable Private 
					                                         i32 %243 = OpConstant 17 
					                                         i32 %246 = OpConstant 18 
					                                         f32 %250 = OpConstant 3,674022E-40 
					                                       f32_2 %251 = OpConstantComposite %250 %250 
					                                             %265 = OpTypePointer Input %7 
					                                Input f32_2* %266 = OpVariable Input 
					                                             %267 = OpTypePointer Input %6 
					                                         i32 %271 = OpConstant 19 
					                                         f32 %281 = OpConstant 3,674022E-40 
					                                Private f32* %284 = OpVariable Private 
					                                         i32 %285 = OpConstant 22 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                             %307 = OpTypeBool 
					                                             %308 = OpTypePointer Private %307 
					                               Private bool* %309 = OpVariable Private 
					                                         u32 %310 = OpConstant 3 
					                                         f32 %313 = OpConstant 3,674022E-40 
					                                             %316 = OpTypePointer Function %6 
					                                         i32 %325 = OpConstant 8 
					                                         i32 %328 = OpConstant 13 
					                                         i32 %340 = OpConstant 10 
					                              Private f32_4* %354 = OpVariable Private 
					                                         i32 %357 = OpConstant 9 
					                               Output f32_4* %390 = OpVariable Output 
					                                         i32 %392 = OpConstant 16 
					                                         f32 %395 = OpConstant 3,674022E-40 
					                                       f32_4 %396 = OpConstantComposite %395 %395 %395 %395 
					                                         f32 %399 = OpConstant 3,674022E-40 
					                                       f32_4 %400 = OpConstantComposite %399 %399 %399 %399 
					                                         f32 %410 = OpConstant 3,674022E-40 
					                                       f32_2 %411 = OpConstantComposite %410 %410 
					                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
					                                Input f32_2* %439 = OpVariable Input 
					                               Private bool* %443 = OpVariable Private 
					                                Private f32* %450 = OpVariable Private 
					                                         i32 %451 = OpConstant 11 
					                                         i32 %455 = OpConstant 12 
					                                         i32 %470 = OpConstant 7 
					                                         f32 %484 = OpConstant 3,674022E-40 
					                                         f32 %493 = OpConstant 3,674022E-40 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                             %511 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %317 = OpVariable Function 
					                                        f32_4 %13 = OpLoad %12 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                 Uniform f32* %28 = OpAccessChain %24 %26 
					                                          f32 %29 = OpLoad %28 
					                                 Uniform f32* %31 = OpAccessChain %24 %30 
					                                          f32 %32 = OpLoad %31 
					                                        f32_2 %33 = OpCompositeConstruct %29 %32 
					                                        f32_2 %34 = OpFAdd %14 %33 
					                                                      OpStore %9 %34 
					                                        f32_2 %37 = OpLoad %9 
					                                        f32_4 %38 = OpVectorShuffle %37 %37 1 1 1 1 
					                               Uniform f32_4* %42 = OpAccessChain %24 %39 %40 
					                                        f32_4 %43 = OpLoad %42 
					                                        f32_4 %44 = OpFMul %38 %43 
					                                                      OpStore %36 %44 
					                               Uniform f32_4* %46 = OpAccessChain %24 %39 %45 
					                                        f32_4 %47 = OpLoad %46 
					                                        f32_2 %48 = OpLoad %9 
					                                        f32_4 %49 = OpVectorShuffle %48 %48 0 0 0 0 
					                                        f32_4 %50 = OpFMul %47 %49 
					                                        f32_4 %51 = OpLoad %36 
					                                        f32_4 %52 = OpFAdd %50 %51 
					                                                      OpStore %36 %52 
					                               Uniform f32_4* %53 = OpAccessChain %24 %39 %39 
					                                        f32_4 %54 = OpLoad %53 
					                                        f32_4 %55 = OpLoad %12 
					                                        f32_4 %56 = OpVectorShuffle %55 %55 2 2 2 2 
					                                        f32_4 %57 = OpFMul %54 %56 
					                                        f32_4 %58 = OpLoad %36 
					                                        f32_4 %59 = OpFAdd %57 %58 
					                                                      OpStore %36 %59 
					                                        f32_4 %61 = OpLoad %36 
					                               Uniform f32_4* %63 = OpAccessChain %24 %39 %62 
					                                        f32_4 %64 = OpLoad %63 
					                                        f32_4 %65 = OpFAdd %61 %64 
					                                                      OpStore %60 %65 
					                               Uniform f32_4* %66 = OpAccessChain %24 %39 %62 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                        f32_4 %69 = OpLoad %12 
					                                        f32_3 %70 = OpVectorShuffle %69 %69 3 3 3 
					                                        f32_3 %71 = OpFMul %68 %70 
					                                        f32_4 %72 = OpLoad %36 
					                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                                        f32_3 %74 = OpFAdd %71 %73 
					                                        f32_4 %75 = OpLoad %36 
					                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
					                                                      OpStore %36 %76 
					                                        f32_4 %77 = OpLoad %36 
					                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
					                                        f32_3 %79 = OpFNegate %78 
					                               Uniform f32_3* %81 = OpAccessChain %24 %45 
					                                        f32_3 %82 = OpLoad %81 
					                                        f32_3 %83 = OpFAdd %79 %82 
					                                        f32_4 %84 = OpLoad %36 
					                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
					                                                      OpStore %36 %85 
					                                        f32_4 %87 = OpLoad %60 
					                                        f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
					                               Uniform f32_4* %90 = OpAccessChain %24 %89 %40 
					                                        f32_4 %91 = OpLoad %90 
					                                        f32_4 %92 = OpFMul %88 %91 
					                                                      OpStore %86 %92 
					                               Uniform f32_4* %93 = OpAccessChain %24 %89 %45 
					                                        f32_4 %94 = OpLoad %93 
					                                        f32_4 %95 = OpLoad %60 
					                                        f32_4 %96 = OpVectorShuffle %95 %95 0 0 0 0 
					                                        f32_4 %97 = OpFMul %94 %96 
					                                        f32_4 %98 = OpLoad %86 
					                                        f32_4 %99 = OpFAdd %97 %98 
					                                                      OpStore %86 %99 
					                              Uniform f32_4* %100 = OpAccessChain %24 %89 %39 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_4 %102 = OpLoad %60 
					                                       f32_4 %103 = OpVectorShuffle %102 %102 2 2 2 2 
					                                       f32_4 %104 = OpFMul %101 %103 
					                                       f32_4 %105 = OpLoad %86 
					                                       f32_4 %106 = OpFAdd %104 %105 
					                                                      OpStore %86 %106 
					                              Uniform f32_4* %107 = OpAccessChain %24 %89 %62 
					                                       f32_4 %108 = OpLoad %107 
					                                       f32_4 %109 = OpLoad %60 
					                                       f32_4 %110 = OpVectorShuffle %109 %109 3 3 3 3 
					                                       f32_4 %111 = OpFMul %108 %110 
					                                       f32_4 %112 = OpLoad %86 
					                                       f32_4 %113 = OpFAdd %111 %112 
					                                                      OpStore %60 %113 
					                                       f32_4 %119 = OpLoad %60 
					                               Output f32_4* %121 = OpAccessChain %118 %45 
					                                                      OpStore %121 %119 
					                                       f32_4 %124 = OpLoad %123 
					                              Uniform f32_4* %126 = OpAccessChain %24 %125 
					                                       f32_4 %127 = OpLoad %126 
					                                       f32_4 %128 = OpFMul %124 %127 
					                                                      OpStore %122 %128 
					                                       f32_4 %129 = OpLoad %122 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 3 3 3 
					                                       f32_4 %131 = OpLoad %122 
					                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                       f32_3 %133 = OpFMul %130 %132 
					                                       f32_4 %134 = OpLoad %122 
					                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
					                                                      OpStore %122 %135 
					                                       f32_4 %137 = OpLoad %122 
					                                                      OpStore %136 %137 
					                                       f32_4 %140 = OpLoad %36 
					                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
					                                       f32_4 %142 = OpLoad %36 
					                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
					                                         f32 %144 = OpDot %141 %143 
					                                                      OpStore %139 %144 
					                                         f32 %145 = OpLoad %139 
					                                         f32 %146 = OpExtInst %1 32 %145 
					                                                      OpStore %139 %146 
					                                         f32 %147 = OpLoad %139 
					                                       f32_3 %148 = OpCompositeConstruct %147 %147 %147 
					                                       f32_4 %149 = OpLoad %36 
					                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
					                                       f32_3 %151 = OpFMul %148 %150 
					                                       f32_4 %152 = OpLoad %36 
					                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
					                                                      OpStore %36 %153 
					                                       f32_3 %156 = OpLoad %155 
					                              Uniform f32_4* %157 = OpAccessChain %24 %62 %45 
					                                       f32_4 %158 = OpLoad %157 
					                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                                         f32 %160 = OpDot %156 %159 
					                                Private f32* %162 = OpAccessChain %60 %161 
					                                                      OpStore %162 %160 
					                                       f32_3 %163 = OpLoad %155 
					                              Uniform f32_4* %164 = OpAccessChain %24 %62 %40 
					                                       f32_4 %165 = OpLoad %164 
					                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
					                                         f32 %167 = OpDot %163 %166 
					                                Private f32* %168 = OpAccessChain %60 %114 
					                                                      OpStore %168 %167 
					                                       f32_3 %169 = OpLoad %155 
					                              Uniform f32_4* %170 = OpAccessChain %24 %62 %39 
					                                       f32_4 %171 = OpLoad %170 
					                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
					                                         f32 %173 = OpDot %169 %172 
					                                Private f32* %175 = OpAccessChain %60 %174 
					                                                      OpStore %175 %173 
					                                       f32_4 %176 = OpLoad %60 
					                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
					                                       f32_4 %178 = OpLoad %60 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                         f32 %180 = OpDot %177 %179 
					                                                      OpStore %139 %180 
					                                         f32 %181 = OpLoad %139 
					                                         f32 %182 = OpExtInst %1 32 %181 
					                                                      OpStore %139 %182 
					                                         f32 %183 = OpLoad %139 
					                                       f32_3 %184 = OpCompositeConstruct %183 %183 %183 
					                                       f32_4 %185 = OpLoad %60 
					                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
					                                       f32_3 %187 = OpFMul %184 %186 
					                                       f32_4 %188 = OpLoad %60 
					                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
					                                                      OpStore %60 %189 
					                                       f32_4 %190 = OpLoad %60 
					                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
					                                       f32_4 %192 = OpLoad %36 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                         f32 %194 = OpDot %191 %193 
					                                                      OpStore %139 %194 
					                              Uniform f32_4* %195 = OpAccessChain %24 %40 
					                                       f32_4 %196 = OpLoad %195 
					                                       f32_2 %197 = OpVectorShuffle %196 %196 1 1 
					                              Uniform f32_4* %199 = OpAccessChain %24 %198 %40 
					                                       f32_4 %200 = OpLoad %199 
					                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
					                                       f32_2 %202 = OpFMul %197 %201 
					                                       f32_4 %203 = OpLoad %36 
					                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 2 3 
					                                                      OpStore %36 %204 
					                              Uniform f32_4* %205 = OpAccessChain %24 %198 %45 
					                                       f32_4 %206 = OpLoad %205 
					                                       f32_2 %207 = OpVectorShuffle %206 %206 0 1 
					                              Uniform f32_4* %208 = OpAccessChain %24 %40 
					                                       f32_4 %209 = OpLoad %208 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 0 
					                                       f32_2 %211 = OpFMul %207 %210 
					                                       f32_4 %212 = OpLoad %36 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
					                                       f32_2 %214 = OpFAdd %211 %213 
					                                       f32_4 %215 = OpLoad %36 
					                                       f32_4 %216 = OpVectorShuffle %215 %214 4 5 2 3 
					                                                      OpStore %36 %216 
					                                       f32_4 %217 = OpLoad %36 
					                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
					                                       f32_2 %219 = OpExtInst %1 4 %218 
					                                Uniform f32* %221 = OpAccessChain %24 %220 
					                                         f32 %222 = OpLoad %221 
					                                Uniform f32* %224 = OpAccessChain %24 %223 
					                                         f32 %225 = OpLoad %224 
					                                       f32_2 %226 = OpCompositeConstruct %222 %225 
					                                       f32_2 %227 = OpFMul %219 %226 
					                                       f32_4 %228 = OpLoad %36 
					                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 2 3 
					                                                      OpStore %36 %229 
					                                       f32_4 %230 = OpLoad %60 
					                                       f32_2 %231 = OpVectorShuffle %230 %230 3 3 
					                                       f32_4 %232 = OpLoad %36 
					                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
					                                       f32_2 %234 = OpFDiv %231 %233 
					                                       f32_4 %235 = OpLoad %36 
					                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
					                                                      OpStore %36 %236 
					                                       f32_4 %238 = OpLoad %36 
					                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
					                                       f32_4 %240 = OpLoad %36 
					                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
					                                         f32 %242 = OpDot %239 %241 
					                                                      OpStore %237 %242 
					                                Uniform f32* %244 = OpAccessChain %24 %243 
					                                         f32 %245 = OpLoad %244 
					                                Uniform f32* %247 = OpAccessChain %24 %246 
					                                         f32 %248 = OpLoad %247 
					                                       f32_2 %249 = OpCompositeConstruct %245 %248 
					                                       f32_2 %252 = OpFMul %249 %251 
					                                       f32_4 %253 = OpLoad %36 
					                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
					                                       f32_2 %255 = OpFAdd %252 %254 
					                                       f32_4 %256 = OpLoad %36 
					                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 2 3 
					                                                      OpStore %36 %257 
					                                       f32_4 %258 = OpLoad %36 
					                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
					                                       f32_2 %260 = OpFDiv %251 %259 
					                                       f32_4 %261 = OpLoad %36 
					                                       f32_4 %262 = OpVectorShuffle %261 %260 0 1 4 5 
					                                                      OpStore %36 %262 
					                                         f32 %263 = OpLoad %237 
					                                         f32 %264 = OpExtInst %1 32 %263 
					                                                      OpStore %237 %264 
					                                  Input f32* %268 = OpAccessChain %266 %114 
					                                         f32 %269 = OpLoad %268 
					                                         f32 %270 = OpExtInst %1 4 %269 
					                                Uniform f32* %272 = OpAccessChain %24 %271 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpFMul %270 %273 
					                                Private f32* %275 = OpAccessChain %60 %161 
					                                                      OpStore %275 %274 
					                                         f32 %276 = OpLoad %237 
					                                Private f32* %277 = OpAccessChain %60 %161 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFMul %276 %278 
					                                                      OpStore %237 %279 
					                                         f32 %280 = OpLoad %237 
					                                         f32 %282 = OpFMul %280 %281 
					                                Private f32* %283 = OpAccessChain %60 %161 
					                                                      OpStore %283 %282 
					                                Uniform f32* %286 = OpAccessChain %24 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFNegate %287 
					                                         f32 %290 = OpFAdd %288 %289 
					                                                      OpStore %284 %290 
					                                         f32 %291 = OpLoad %284 
					                                Private f32* %292 = OpAccessChain %60 %161 
					                                         f32 %293 = OpLoad %292 
					                                         f32 %294 = OpExtInst %1 4 %293 
					                                         f32 %295 = OpFMul %291 %294 
					                                                      OpStore %284 %295 
					                                         f32 %296 = OpLoad %237 
					                                         f32 %297 = OpFMul %296 %281 
					                                         f32 %298 = OpLoad %284 
					                                         f32 %299 = OpFNegate %298 
					                                         f32 %300 = OpFAdd %297 %299 
					                                                      OpStore %237 %300 
					                                         f32 %301 = OpLoad %139 
					                                         f32 %302 = OpExtInst %1 4 %301 
					                                         f32 %303 = OpLoad %237 
					                                         f32 %304 = OpFMul %302 %303 
					                                         f32 %305 = OpLoad %284 
					                                         f32 %306 = OpFAdd %304 %305 
					                                                      OpStore %139 %306 
					                                Uniform f32* %311 = OpAccessChain %24 %198 %62 %310 
					                                         f32 %312 = OpLoad %311 
					                                        bool %314 = OpFOrdEqual %312 %313 
					                                                      OpStore %309 %314 
					                                        bool %315 = OpLoad %309 
					                                                      OpSelectionMerge %319 None 
					                                                      OpBranchConditional %315 %318 %321 
					                                             %318 = OpLabel 
					                                         f32 %320 = OpLoad %139 
					                                                      OpStore %317 %320 
					                                                      OpBranch %319 
					                                             %321 = OpLabel 
					                                Private f32* %322 = OpAccessChain %60 %161 
					                                         f32 %323 = OpLoad %322 
					                                                      OpStore %317 %323 
					                                                      OpBranch %319 
					                                             %319 = OpLabel 
					                                         f32 %324 = OpLoad %317 
					                                                      OpStore %139 %324 
					                                Uniform f32* %326 = OpAccessChain %24 %325 
					                                         f32 %327 = OpLoad %326 
					                                Uniform f32* %329 = OpAccessChain %24 %328 
					                                         f32 %330 = OpLoad %329 
					                                         f32 %331 = OpFMul %327 %330 
					                                                      OpStore %237 %331 
					                                         f32 %332 = OpLoad %237 
					                                         f32 %333 = OpLoad %139 
					                                         f32 %334 = OpFMul %332 %333 
					                                         f32 %335 = OpFAdd %334 %289 
					                                                      OpStore %237 %335 
					                                         f32 %336 = OpLoad %139 
					                                         f32 %337 = OpLoad %237 
					                                         f32 %338 = OpFDiv %336 %337 
					                                Private f32* %339 = OpAccessChain %60 %161 
					                                                      OpStore %339 %338 
					                                Uniform f32* %341 = OpAccessChain %24 %340 
					                                         f32 %342 = OpLoad %341 
					                                Uniform f32* %343 = OpAccessChain %24 %328 
					                                         f32 %344 = OpLoad %343 
					                                         f32 %345 = OpFMul %342 %344 
					                                                      OpStore %139 %345 
					                                Private f32* %346 = OpAccessChain %60 %161 
					                                         f32 %347 = OpLoad %346 
					                                         f32 %348 = OpLoad %139 
					                                         f32 %349 = OpFMul %347 %348 
					                                                      OpStore %139 %349 
					                                         f32 %350 = OpLoad %139 
					                                         f32 %351 = OpExtInst %1 37 %350 %289 
					                                                      OpStore %237 %351 
					                                         f32 %352 = OpLoad %237 
					                                         f32 %353 = OpExtInst %1 31 %352 
					                                                      OpStore %237 %353 
					                                  Input f32* %355 = OpAccessChain %123 %310 
					                                         f32 %356 = OpLoad %355 
					                                Uniform f32* %358 = OpAccessChain %24 %357 %310 
					                                         f32 %359 = OpLoad %358 
					                                         f32 %360 = OpFMul %356 %359 
					                                Private f32* %361 = OpAccessChain %354 %161 
					                                                      OpStore %361 %360 
					                              Uniform f32_4* %362 = OpAccessChain %24 %357 
					                                       f32_4 %363 = OpLoad %362 
					                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
					                                       f32_4 %365 = OpLoad %354 
					                                       f32_3 %366 = OpVectorShuffle %365 %365 0 0 0 
					                                       f32_3 %367 = OpFMul %364 %366 
					                                       f32_4 %368 = OpLoad %122 
					                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
					                                       f32_3 %370 = OpFNegate %369 
					                                       f32_3 %371 = OpFAdd %367 %370 
					                                       f32_4 %372 = OpLoad %354 
					                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
					                                                      OpStore %354 %373 
					                                Uniform f32* %374 = OpAccessChain %24 %357 %310 
					                                         f32 %375 = OpLoad %374 
					                                  Input f32* %376 = OpAccessChain %123 %310 
					                                         f32 %377 = OpLoad %376 
					                                         f32 %378 = OpFMul %375 %377 
					                                Private f32* %379 = OpAccessChain %122 %310 
					                                         f32 %380 = OpLoad %379 
					                                         f32 %381 = OpFNegate %380 
					                                         f32 %382 = OpFAdd %378 %381 
					                                Private f32* %383 = OpAccessChain %354 %310 
					                                                      OpStore %383 %382 
					                                         f32 %384 = OpLoad %237 
					                                       f32_4 %385 = OpCompositeConstruct %384 %384 %384 %384 
					                                       f32_4 %386 = OpLoad %354 
					                                       f32_4 %387 = OpFMul %385 %386 
					                                       f32_4 %388 = OpLoad %122 
					                                       f32_4 %389 = OpFAdd %387 %388 
					                                                      OpStore %86 %389 
					                                       f32_4 %391 = OpLoad %86 
					                                                      OpStore %390 %391 
					                              Uniform f32_4* %393 = OpAccessChain %24 %392 
					                                       f32_4 %394 = OpLoad %393 
					                                       f32_4 %397 = OpExtInst %1 40 %394 %396 
					                                                      OpStore %86 %397 
					                                       f32_4 %398 = OpLoad %86 
					                                       f32_4 %401 = OpExtInst %1 37 %398 %400 
					                                                      OpStore %86 %401 
					                                       f32_2 %402 = OpLoad %9 
					                                       f32_4 %403 = OpLoad %86 
					                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
					                                       f32_2 %405 = OpFNegate %404 
					                                       f32_2 %406 = OpFAdd %402 %405 
					                                       f32_4 %407 = OpLoad %354 
					                                       f32_4 %408 = OpVectorShuffle %407 %406 4 5 2 3 
					                                                      OpStore %354 %408 
					                                       f32_2 %409 = OpLoad %9 
					                                       f32_2 %412 = OpFMul %409 %411 
					                                       f32_4 %413 = OpLoad %86 
					                                       f32_2 %414 = OpVectorShuffle %413 %413 0 1 
					                                       f32_2 %415 = OpFNegate %414 
					                                       f32_2 %416 = OpFAdd %412 %415 
					                                                      OpStore %9 %416 
					                                       f32_4 %417 = OpLoad %86 
					                                       f32_2 %418 = OpVectorShuffle %417 %417 2 3 
					                                       f32_2 %419 = OpFNegate %418 
					                                       f32_2 %420 = OpLoad %9 
					                                       f32_2 %421 = OpFAdd %419 %420 
					                                       f32_4 %422 = OpLoad %36 
					                                       f32_4 %423 = OpVectorShuffle %422 %421 4 5 2 3 
					                                                      OpStore %36 %423 
					                                       f32_4 %424 = OpLoad %86 
					                                       f32_2 %425 = OpVectorShuffle %424 %424 0 1 
					                                       f32_2 %426 = OpFNegate %425 
					                                       f32_4 %427 = OpLoad %86 
					                                       f32_2 %428 = OpVectorShuffle %427 %427 2 3 
					                                       f32_2 %429 = OpFAdd %426 %428 
					                                                      OpStore %9 %429 
					                                       f32_4 %431 = OpLoad %354 
					                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
					                                       f32_2 %433 = OpLoad %9 
					                                       f32_2 %434 = OpFDiv %432 %433 
					                                       f32_4 %435 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %436 = OpVectorShuffle %435 %434 0 1 4 5 
					                                                      OpStore vs_TEXCOORD0 %436 
					                                       f32_4 %438 = OpLoad %36 
					                                                      OpStore vs_TEXCOORD2 %438 
					                                       f32_2 %440 = OpLoad %439 
					                                       f32_4 %441 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %442 = OpVectorShuffle %441 %440 4 5 2 3 
					                                                      OpStore vs_TEXCOORD0 %442 
					                                  Input f32* %444 = OpAccessChain %266 %114 
					                                         f32 %445 = OpLoad %444 
					                                        bool %446 = OpFOrdGreaterThanEqual %313 %445 
					                                                      OpStore %443 %446 
					                                        bool %447 = OpLoad %443 
					                                         f32 %448 = OpSelect %447 %289 %313 
					                                Private f32* %449 = OpAccessChain %9 %161 
					                                                      OpStore %449 %448 
					                                Uniform f32* %452 = OpAccessChain %24 %451 
					                                         f32 %453 = OpLoad %452 
					                                         f32 %454 = OpFNegate %453 
					                                Uniform f32* %456 = OpAccessChain %24 %455 
					                                         f32 %457 = OpLoad %456 
					                                         f32 %458 = OpFAdd %454 %457 
					                                                      OpStore %450 %458 
					                                Private f32* %459 = OpAccessChain %9 %161 
					                                         f32 %460 = OpLoad %459 
					                                         f32 %461 = OpLoad %450 
					                                         f32 %462 = OpFMul %460 %461 
					                                Uniform f32* %463 = OpAccessChain %24 %451 
					                                         f32 %464 = OpLoad %463 
					                                         f32 %465 = OpFAdd %462 %464 
					                                Private f32* %466 = OpAccessChain %9 %161 
					                                                      OpStore %466 %465 
					                                Private f32* %467 = OpAccessChain %9 %161 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %469 = OpFMul %468 %250 
					                                Uniform f32* %471 = OpAccessChain %24 %470 
					                                         f32 %472 = OpLoad %471 
					                                         f32 %473 = OpFAdd %469 %472 
					                                Private f32* %474 = OpAccessChain %9 %161 
					                                                      OpStore %474 %473 
					                                Private f32* %475 = OpAccessChain %9 %161 
					                                         f32 %476 = OpLoad %475 
					                                Uniform f32* %477 = OpAccessChain %24 %328 
					                                         f32 %478 = OpLoad %477 
					                                         f32 %479 = OpFMul %476 %478 
					                                Private f32* %480 = OpAccessChain %9 %161 
					                                                      OpStore %480 %479 
					                                Private f32* %481 = OpAccessChain %9 %161 
					                                         f32 %482 = OpLoad %481 
					                                         f32 %483 = OpFNegate %482 
					                                         f32 %485 = OpFMul %483 %484 
					                                         f32 %486 = OpFAdd %485 %484 
					                                Private f32* %487 = OpAccessChain %9 %161 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %9 %161 
					                                         f32 %489 = OpLoad %488 
					                                Private f32* %490 = OpAccessChain %60 %161 
					                                         f32 %491 = OpLoad %490 
					                                         f32 %492 = OpFMul %489 %491 
					                                         f32 %494 = OpFAdd %492 %493 
					                                Private f32* %495 = OpAccessChain %60 %310 
					                                                      OpStore %495 %494 
					                                         f32 %496 = OpLoad %139 
					                                         f32 %497 = OpFNegate %496 
					                                         f32 %498 = OpFMul %497 %484 
					                                Private f32* %499 = OpAccessChain %60 %310 
					                                         f32 %500 = OpLoad %499 
					                                         f32 %501 = OpFAdd %498 %500 
					                                Private f32* %502 = OpAccessChain %60 %114 
					                                                      OpStore %502 %501 
					                                         f32 %503 = OpLoad %139 
					                                         f32 %504 = OpFMul %503 %484 
					                                Private f32* %505 = OpAccessChain %60 %310 
					                                         f32 %506 = OpLoad %505 
					                                         f32 %507 = OpFAdd %504 %506 
					                                Private f32* %508 = OpAccessChain %60 %174 
					                                                      OpStore %508 %507 
					                                       f32_4 %510 = OpLoad %60 
					                                                      OpStore vs_TEXCOORD1 %510 
					                                 Output f32* %512 = OpAccessChain %118 %45 %114 
					                                         f32 %513 = OpLoad %512 
					                                         f32 %514 = OpFNegate %513 
					                                 Output f32* %515 = OpAccessChain %118 %45 %114 
					                                                      OpStore %515 %514 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 210
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %36 %92 %132 %147 %207 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 RelaxedPrecision 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate %24 RelaxedPrecision 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %27 DescriptorSet 27 
					                                                      OpDecorate %27 Binding 27 
					                                                      OpDecorate %28 RelaxedPrecision 
					                                                      OpDecorate %31 RelaxedPrecision 
					                                                      OpDecorate %31 DescriptorSet 31 
					                                                      OpDecorate %31 Binding 31 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 36 
					                                                      OpDecorate %43 RelaxedPrecision 
					                                                      OpDecorate %44 RelaxedPrecision 
					                                                      OpDecorate %45 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 92 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %121 DescriptorSet 121 
					                                                      OpDecorate %121 Binding 121 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %123 DescriptorSet 123 
					                                                      OpDecorate %123 Binding 123 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 132 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %147 Location 147 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
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
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %207 Location 207 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypePointer Private %6 
					                                  Private f32* %8 = OpVariable Private 
					                                               %9 = OpTypeVector %6 4 
					                                              %10 = OpTypeInt 32 1 
					                                              %11 = OpTypeStruct %9 %6 %6 %9 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32; f32; f32_4; i32;}* %13 = OpVariable Uniform 
					                                          i32 %14 = OpConstant 4 
					                                              %15 = OpTypePointer Uniform %10 
					                                          i32 %18 = OpConstant 0 
					                                              %19 = OpTypeBool 
					                                          f32 %21 = OpConstant 3,674022E-40 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                 Private f32* %24 = OpVariable Private 
					                                              %25 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %26 = OpTypePointer UniformConstant %25 
					         UniformConstant read_only Texture2D* %27 = OpVariable UniformConstant 
					                                              %29 = OpTypeSampler 
					                                              %30 = OpTypePointer UniformConstant %29 
					                     UniformConstant sampler* %31 = OpVariable UniformConstant 
					                                              %33 = OpTypeSampledImage %25 
					                                              %35 = OpTypePointer Input %9 
					                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                              %37 = OpTypeVector %6 2 
					                                              %41 = OpTypeInt 32 0 
					                                          u32 %42 = OpConstant 3 
					                                              %48 = OpTypeVector %6 3 
					                                              %49 = OpTypePointer Private %48 
					                               Private f32_3* %50 = OpVariable Private 
					                                          i32 %51 = OpConstant 1 
					                                              %52 = OpTypePointer Uniform %6 
					                                          u32 %57 = OpConstant 0 
					                                          i32 %61 = OpConstant 2 
					                                              %79 = OpTypePointer Uniform %9 
					                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
					                                Private f32* %114 = OpVariable Private 
					                                         u32 %115 = OpConstant 1 
					        UniformConstant read_only Texture2D* %121 = OpVariable UniformConstant 
					                    UniformConstant sampler* %123 = OpVariable UniformConstant 
					                                Private f32* %130 = OpVariable Private 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                             %133 = OpTypePointer Input %6 
					                                             %143 = OpTypePointer Private %9 
					                              Private f32_4* %144 = OpVariable Private 
					                                Input f32_4* %147 = OpVariable Input 
					                                Private f32* %154 = OpVariable Private 
					                                         f32 %158 = OpConstant 3,674022E-40 
					                                             %160 = OpTypePointer Private %19 
					                               Private bool* %161 = OpVariable Private 
					                                         i32 %166 = OpConstant -1 
					                              Private f32_3* %172 = OpVariable Private 
					                                         i32 %175 = OpConstant 3 
					                              Private f32_4* %180 = OpVariable Private 
					                              Private f32_3* %185 = OpVariable Private 
					                                             %206 = OpTypePointer Output %9 
					                               Output f32_4* %207 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform i32* %16 = OpAccessChain %13 %14 
					                                          i32 %17 = OpLoad %16 
					                                         bool %20 = OpINotEqual %17 %18 
					                                          f32 %23 = OpSelect %20 %21 %22 
					                                                      OpStore %8 %23 
					                          read_only Texture2D %28 = OpLoad %27 
					                                      sampler %32 = OpLoad %31 
					                   read_only Texture2DSampled %34 = OpSampledImage %28 %32 
					                                        f32_4 %38 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %39 = OpVectorShuffle %38 %38 2 3 
					                                        f32_4 %40 = OpImageSampleImplicitLod %34 %39 
					                                          f32 %43 = OpCompositeExtract %40 3 
					                                                      OpStore %24 %43 
					                                          f32 %44 = OpLoad %24 
					                                          f32 %45 = OpFNegate %44 
					                                          f32 %46 = OpLoad %8 
					                                          f32 %47 = OpFAdd %45 %46 
					                                                      OpStore %8 %47 
					                                 Uniform f32* %53 = OpAccessChain %13 %51 
					                                          f32 %54 = OpLoad %53 
					                                          f32 %55 = OpFNegate %54 
					                                          f32 %56 = OpFAdd %55 %21 
					                                 Private f32* %58 = OpAccessChain %50 %57 
					                                                      OpStore %58 %56 
					                                 Private f32* %59 = OpAccessChain %50 %57 
					                                          f32 %60 = OpLoad %59 
					                                 Uniform f32* %62 = OpAccessChain %13 %61 
					                                          f32 %63 = OpLoad %62 
					                                          f32 %64 = OpFMul %60 %63 
					                                          f32 %65 = OpLoad %8 
					                                          f32 %66 = OpExtInst %1 4 %65 
					                                          f32 %67 = OpFAdd %64 %66 
					                                                      OpStore %8 %67 
					                                          f32 %68 = OpLoad %8 
					                                 Uniform f32* %69 = OpAccessChain %13 %51 
					                                          f32 %70 = OpLoad %69 
					                                          f32 %71 = OpFNegate %70 
					                                          f32 %72 = OpFAdd %68 %71 
					                                                      OpStore %8 %72 
					                                          f32 %73 = OpLoad %8 
					                                 Uniform f32* %74 = OpAccessChain %13 %61 
					                                          f32 %75 = OpLoad %74 
					                                          f32 %76 = OpFDiv %73 %75 
					                                                      OpStore %8 %76 
					                                          f32 %77 = OpLoad %8 
					                                          f32 %78 = OpExtInst %1 43 %77 %22 %21 
					                                                      OpStore %8 %78 
					                               Uniform f32_4* %80 = OpAccessChain %13 %18 
					                                        f32_4 %81 = OpLoad %80 
					                                        f32_2 %82 = OpVectorShuffle %81 %81 0 1 
					                                        f32_2 %83 = OpFNegate %82 
					                               Uniform f32_4* %84 = OpAccessChain %13 %18 
					                                        f32_4 %85 = OpLoad %84 
					                                        f32_2 %86 = OpVectorShuffle %85 %85 2 3 
					                                        f32_2 %87 = OpFAdd %83 %86 
					                                        f32_3 %88 = OpLoad %50 
					                                        f32_3 %89 = OpVectorShuffle %88 %87 3 4 2 
					                                                      OpStore %50 %89 
					                                        f32_3 %90 = OpLoad %50 
					                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
					                                        f32_4 %93 = OpLoad vs_TEXCOORD2 
					                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
					                                        f32_2 %95 = OpExtInst %1 4 %94 
					                                        f32_2 %96 = OpFNegate %95 
					                                        f32_2 %97 = OpFAdd %91 %96 
					                                        f32_3 %98 = OpLoad %50 
					                                        f32_3 %99 = OpVectorShuffle %98 %97 3 4 2 
					                                                      OpStore %50 %99 
					                                       f32_3 %100 = OpLoad %50 
					                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
					                                       f32_4 %102 = OpLoad vs_TEXCOORD2 
					                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
					                                       f32_2 %104 = OpFMul %101 %103 
					                                       f32_3 %105 = OpLoad %50 
					                                       f32_3 %106 = OpVectorShuffle %105 %104 3 4 2 
					                                                      OpStore %50 %106 
					                                       f32_3 %107 = OpLoad %50 
					                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
					                                       f32_2 %109 = OpCompositeConstruct %22 %22 
					                                       f32_2 %110 = OpCompositeConstruct %21 %21 
					                                       f32_2 %111 = OpExtInst %1 43 %108 %109 %110 
					                                       f32_3 %112 = OpLoad %50 
					                                       f32_3 %113 = OpVectorShuffle %112 %111 3 4 2 
					                                                      OpStore %50 %113 
					                                Private f32* %116 = OpAccessChain %50 %115 
					                                         f32 %117 = OpLoad %116 
					                                Private f32* %118 = OpAccessChain %50 %57 
					                                         f32 %119 = OpLoad %118 
					                                         f32 %120 = OpFMul %117 %119 
					                                                      OpStore %114 %120 
					                         read_only Texture2D %122 = OpLoad %121 
					                                     sampler %124 = OpLoad %123 
					                  read_only Texture2DSampled %125 = OpSampledImage %122 %124 
					                                       f32_4 %126 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
					                                       f32_4 %128 = OpImageSampleImplicitLod %125 %127 
					                                         f32 %129 = OpCompositeExtract %128 3 
					                                                      OpStore %24 %129 
					                                         f32 %131 = OpLoad %24 
					                                  Input f32* %134 = OpAccessChain vs_TEXCOORD1 %57 
					                                         f32 %135 = OpLoad %134 
					                                         f32 %136 = OpFMul %131 %135 
					                                  Input f32* %137 = OpAccessChain vs_TEXCOORD1 %42 
					                                         f32 %138 = OpLoad %137 
					                                         f32 %139 = OpFNegate %138 
					                                         f32 %140 = OpFAdd %136 %139 
					                                                      OpStore %130 %140 
					                                         f32 %141 = OpLoad %130 
					                                         f32 %142 = OpExtInst %1 43 %141 %22 %21 
					                                                      OpStore %130 %142 
					                                         f32 %145 = OpLoad %130 
					                                       f32_4 %146 = OpCompositeConstruct %145 %145 %145 %145 
					                                       f32_4 %148 = OpLoad %147 
					                                       f32_4 %149 = OpFMul %146 %148 
					                                                      OpStore %144 %149 
					                                         f32 %150 = OpLoad %114 
					                                Private f32* %151 = OpAccessChain %144 %42 
					                                         f32 %152 = OpLoad %151 
					                                         f32 %153 = OpFMul %150 %152 
					                                                      OpStore %130 %153 
					                                         f32 %155 = OpLoad %130 
					                                         f32 %156 = OpLoad %8 
					                                         f32 %157 = OpFMul %155 %156 
					                                         f32 %159 = OpFAdd %157 %158 
					                                                      OpStore %154 %159 
					                                         f32 %162 = OpLoad %154 
					                                        bool %163 = OpFOrdLessThan %162 %22 
					                                                      OpStore %161 %163 
					                                        bool %164 = OpLoad %161 
					                                         i32 %165 = OpSelect %164 %51 %18 
					                                         i32 %167 = OpIMul %165 %166 
					                                        bool %168 = OpINotEqual %167 %18 
					                                                      OpSelectionMerge %170 None 
					                                                      OpBranchConditional %168 %169 %170 
					                                             %169 = OpLabel 
					                                                      OpKill
					                                             %170 = OpLabel 
					                                         f32 %173 = OpLoad %130 
					                                       f32_3 %174 = OpCompositeConstruct %173 %173 %173 
					                              Uniform f32_4* %176 = OpAccessChain %13 %175 
					                                       f32_4 %177 = OpLoad %176 
					                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
					                                       f32_3 %179 = OpFMul %174 %178 
					                                                      OpStore %172 %179 
					                                         f32 %181 = OpLoad %8 
					                                         f32 %182 = OpLoad %130 
					                                         f32 %183 = OpFMul %181 %182 
					                                Private f32* %184 = OpAccessChain %180 %42 
					                                                      OpStore %184 %183 
					                                       f32_4 %186 = OpLoad %144 
					                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
					                                         f32 %188 = OpLoad %114 
					                                       f32_3 %189 = OpCompositeConstruct %188 %188 %188 
					                                       f32_3 %190 = OpFMul %187 %189 
					                                       f32_3 %191 = OpLoad %172 
					                                       f32_3 %192 = OpFNegate %191 
					                                       f32_3 %193 = OpFAdd %190 %192 
					                                                      OpStore %185 %193 
					                                         f32 %194 = OpLoad %8 
					                                       f32_3 %195 = OpCompositeConstruct %194 %194 %194 
					                                       f32_3 %196 = OpLoad %185 
					                                       f32_3 %197 = OpFMul %195 %196 
					                                       f32_3 %198 = OpLoad %172 
					                                       f32_3 %199 = OpFAdd %197 %198 
					                                                      OpStore %50 %199 
					                                         f32 %200 = OpLoad %8 
					                                       f32_3 %201 = OpCompositeConstruct %200 %200 %200 
					                                       f32_3 %202 = OpLoad %50 
					                                       f32_3 %203 = OpFMul %201 %202 
					                                       f32_4 %204 = OpLoad %180 
					                                       f32_4 %205 = OpVectorShuffle %204 %203 4 5 6 3 
					                                                      OpStore %180 %205 
					                                       f32_4 %208 = OpLoad %180 
					                                                      OpStore %207 %208 
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
						vec4 unused_0_0[29];
						float _MaskWipeControl;
						float _MaskEdgeSoftness;
						vec4 _MaskEdgeColor;
						int _MaskInverse;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MaskTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
					    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.zw);
					    u_xlat0 = u_xlat0 + (-u_xlat10_1.w);
					    u_xlat3.x = (-_MaskWipeControl) + 1.0;
					    u_xlat0 = u_xlat3.x * _MaskEdgeSoftness + abs(u_xlat0);
					    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
					    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat1.w = u_xlat3.x * vs_COLOR0.w;
					    u_xlat2.xyz = u_xlat1.www * _MaskEdgeColor.xyz;
					    u_xlat3.xyz = vs_COLOR0.xyz * u_xlat3.xxx + (-u_xlat2.xyz);
					    u_xlat1.xyz = vec3(u_xlat0) * u_xlat3.xyz + u_xlat2.xyz;
					    SV_Target0 = vec4(u_xlat0) * u_xlat1;
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
						vec4 unused_0_0[29];
						float _MaskWipeControl;
						float _MaskEdgeSoftness;
						vec4 _MaskEdgeColor;
						int _MaskInverse;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MaskTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = (_MaskInverse != 0) ? 1.0 : 0.0;
					    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.x + (-u_xlat10_1.w);
					    u_xlat3.x = (-_MaskWipeControl) + 1.0;
					    u_xlat0.x = u_xlat3.x * _MaskEdgeSoftness + abs(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_MaskWipeControl);
					    u_xlat0.x = u_xlat0.x / _MaskEdgeSoftness;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.x = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat1.w = u_xlat3.x * vs_COLOR0.w;
					    u_xlat2.xyz = u_xlat1.www * _MaskEdgeColor.xyz;
					    u_xlat6 = u_xlat1.w * u_xlat0.x + -0.00100000005;
					    u_xlatb6 = u_xlat6<0.0;
					    if(((int(u_xlatb6) * int(0xffffffffu)))!=0){discard;}
					    u_xlat3.xyz = vs_COLOR0.xyz * u_xlat3.xxx + (-u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat0;
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
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[2];
						float _MaskWipeControl;
						float _MaskEdgeSoftness;
						vec4 _MaskEdgeColor;
						int _MaskInverse;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MaskTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat8;
					void main()
					{
					    u_xlat0 = (_MaskInverse != 0) ? 1.0 : 0.0;
					    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.zw);
					    u_xlat0 = u_xlat0 + (-u_xlat10_1.w);
					    u_xlat4.x = (-_MaskWipeControl) + 1.0;
					    u_xlat0 = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0);
					    u_xlat0 = u_xlat0 + (-_MaskWipeControl);
					    u_xlat0 = u_xlat0 / _MaskEdgeSoftness;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
					    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
					    u_xlat4.x = u_xlat4.y * u_xlat4.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat8 = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat8) * vs_COLOR0;
					    u_xlat2.w = u_xlat4.x * u_xlat1.w;
					    u_xlat3.xyz = u_xlat2.www * _MaskEdgeColor.xyz;
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xxx + (-u_xlat3.xyz);
					    u_xlat2.xyz = vec3(u_xlat0) * u_xlat4.xyz + u_xlat3.xyz;
					    SV_Target0 = vec4(u_xlat0) * u_xlat2;
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
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[2];
						float _MaskWipeControl;
						float _MaskEdgeSoftness;
						vec4 _MaskEdgeColor;
						int _MaskInverse;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MaskTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat8;
					bool u_xlatb8;
					void main()
					{
					    u_xlat0.x = (_MaskInverse != 0) ? 1.0 : 0.0;
					    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.zw);
					    u_xlat0.x = u_xlat0.x + (-u_xlat10_1.w);
					    u_xlat4.x = (-_MaskWipeControl) + 1.0;
					    u_xlat0.x = u_xlat4.x * _MaskEdgeSoftness + abs(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_MaskWipeControl);
					    u_xlat0.x = u_xlat0.x / _MaskEdgeSoftness;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat4.xy = u_xlat4.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat4.xy = u_xlat4.xy * vs_TEXCOORD2.zw;
					    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
					    u_xlat4.x = u_xlat4.y * u_xlat4.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat8 = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat8) * vs_COLOR0;
					    u_xlat2.w = u_xlat4.x * u_xlat1.w;
					    u_xlat3.xyz = u_xlat2.www * _MaskEdgeColor.xyz;
					    u_xlat8 = u_xlat2.w * u_xlat0.x + -0.00100000005;
					    u_xlatb8 = u_xlat8<0.0;
					    if(((int(u_xlatb8) * int(0xffffffffu)))!=0){discard;}
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xxx + (-u_xlat3.xyz);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat3.xyz;
					    u_xlat0 = u_xlat0.xxxx * u_xlat2;
					    SV_Target0 = u_xlat0;
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
	CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}