Shader "TextMeshPro/Mobile/Distance Field Overlay" {
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
			GpuProgramID 53104
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
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    SV_Target0 = vec4(u_xlat0) * vs_COLOR0;
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
					; Bound: 53
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %21 %31 %46 %49 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpDecorate %8 RelaxedPrecision 
					                                             OpDecorate %11 RelaxedPrecision 
					                                             OpDecorate %11 DescriptorSet 11 
					                                             OpDecorate %11 Binding 11 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %15 RelaxedPrecision 
					                                             OpDecorate %15 DescriptorSet 15 
					                                             OpDecorate %15 Binding 15 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 21 
					                                             OpDecorate %28 RelaxedPrecision 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 Location 31 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %46 Location 46 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %49 Location 49 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
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
					                                     %19 = OpTypeVector %6 4 
					                                     %20 = OpTypePointer Input %19 
					               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                     %22 = OpTypeVector %6 2 
					                                     %26 = OpTypeInt 32 0 
					                                 u32 %27 = OpConstant 3 
					                        Private f32* %29 = OpVariable Private 
					               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                 u32 %32 = OpConstant 0 
					                                     %33 = OpTypePointer Input %6 
					                                 f32 %42 = OpConstant 3,674022E-40 
					                                 f32 %43 = OpConstant 3,674022E-40 
					                                     %45 = OpTypePointer Output %19 
					                       Output f32_4* %46 = OpVariable Output 
					                        Input f32_4* %49 = OpVariable Input 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %12 = OpLoad %11 
					                             sampler %16 = OpLoad %15 
					          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                               f32_4 %23 = OpLoad vs_TEXCOORD0 
					                               f32_2 %24 = OpVectorShuffle %23 %23 0 1 
					                               f32_4 %25 = OpImageSampleImplicitLod %18 %24 
					                                 f32 %28 = OpCompositeExtract %25 3 
					                                             OpStore %8 %28 
					                                 f32 %30 = OpLoad %8 
					                          Input f32* %34 = OpAccessChain vs_TEXCOORD1 %32 
					                                 f32 %35 = OpLoad %34 
					                                 f32 %36 = OpFMul %30 %35 
					                          Input f32* %37 = OpAccessChain vs_TEXCOORD1 %27 
					                                 f32 %38 = OpLoad %37 
					                                 f32 %39 = OpFNegate %38 
					                                 f32 %40 = OpFAdd %36 %39 
					                                             OpStore %29 %40 
					                                 f32 %41 = OpLoad %29 
					                                 f32 %44 = OpExtInst %1 43 %41 %42 %43 
					                                             OpStore %29 %44 
					                                 f32 %47 = OpLoad %29 
					                               f32_4 %48 = OpCompositeConstruct %47 %47 %47 %47 
					                               f32_4 %50 = OpLoad %49 
					                               f32_4 %51 = OpFMul %48 %50 
					                                             OpStore %46 %51 
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
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat2 = vs_COLOR0.w * u_xlat0 + -0.00100000005;
					    u_xlat1 = vec4(u_xlat0) * vs_COLOR0;
					    SV_Target0 = u_xlat1;
					    u_xlatb0 = u_xlat2<0.0;
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
					; Bound: 79
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %21 %31 %46 %60 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpDecorate %8 RelaxedPrecision 
					                                             OpDecorate %11 RelaxedPrecision 
					                                             OpDecorate %11 DescriptorSet 11 
					                                             OpDecorate %11 Binding 11 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %15 RelaxedPrecision 
					                                             OpDecorate %15 DescriptorSet 15 
					                                             OpDecorate %15 Binding 15 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 21 
					                                             OpDecorate %28 RelaxedPrecision 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 Location 31 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %46 Location 46 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %60 Location 60 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
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
					                                     %19 = OpTypeVector %6 4 
					                                     %20 = OpTypePointer Input %19 
					               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                     %22 = OpTypeVector %6 2 
					                                     %26 = OpTypeInt 32 0 
					                                 u32 %27 = OpConstant 3 
					                        Private f32* %29 = OpVariable Private 
					               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                 u32 %32 = OpConstant 0 
					                                     %33 = OpTypePointer Input %6 
					                                 f32 %42 = OpConstant 3,674022E-40 
					                                 f32 %43 = OpConstant 3,674022E-40 
					                        Private f32* %45 = OpVariable Private 
					                        Input f32_4* %46 = OpVariable Input 
					                                 f32 %51 = OpConstant 3,674022E-40 
					                                     %53 = OpTypePointer Private %19 
					                      Private f32_4* %54 = OpVariable Private 
					                                     %59 = OpTypePointer Output %19 
					                       Output f32_4* %60 = OpVariable Output 
					                                     %62 = OpTypeBool 
					                                     %63 = OpTypePointer Private %62 
					                       Private bool* %64 = OpVariable Private 
					                                     %68 = OpTypeInt 32 1 
					                                 i32 %69 = OpConstant 0 
					                                 i32 %70 = OpConstant 1 
					                                 i32 %72 = OpConstant -1 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %12 = OpLoad %11 
					                             sampler %16 = OpLoad %15 
					          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                               f32_4 %23 = OpLoad vs_TEXCOORD0 
					                               f32_2 %24 = OpVectorShuffle %23 %23 0 1 
					                               f32_4 %25 = OpImageSampleImplicitLod %18 %24 
					                                 f32 %28 = OpCompositeExtract %25 3 
					                                             OpStore %8 %28 
					                                 f32 %30 = OpLoad %8 
					                          Input f32* %34 = OpAccessChain vs_TEXCOORD1 %32 
					                                 f32 %35 = OpLoad %34 
					                                 f32 %36 = OpFMul %30 %35 
					                          Input f32* %37 = OpAccessChain vs_TEXCOORD1 %27 
					                                 f32 %38 = OpLoad %37 
					                                 f32 %39 = OpFNegate %38 
					                                 f32 %40 = OpFAdd %36 %39 
					                                             OpStore %29 %40 
					                                 f32 %41 = OpLoad %29 
					                                 f32 %44 = OpExtInst %1 43 %41 %42 %43 
					                                             OpStore %29 %44 
					                          Input f32* %47 = OpAccessChain %46 %27 
					                                 f32 %48 = OpLoad %47 
					                                 f32 %49 = OpLoad %29 
					                                 f32 %50 = OpFMul %48 %49 
					                                 f32 %52 = OpFAdd %50 %51 
					                                             OpStore %45 %52 
					                                 f32 %55 = OpLoad %29 
					                               f32_4 %56 = OpCompositeConstruct %55 %55 %55 %55 
					                               f32_4 %57 = OpLoad %46 
					                               f32_4 %58 = OpFMul %56 %57 
					                                             OpStore %54 %58 
					                               f32_4 %61 = OpLoad %54 
					                                             OpStore %60 %61 
					                                 f32 %65 = OpLoad %45 
					                                bool %66 = OpFOrdLessThan %65 %42 
					                                             OpStore %64 %66 
					                                bool %67 = OpLoad %64 
					                                 i32 %71 = OpSelect %67 %70 %69 
					                                 i32 %73 = OpIMul %71 %72 
					                                bool %74 = OpINotEqual %73 %69 
					                                             OpSelectionMerge %76 None 
					                                             OpBranchConditional %74 %75 %76 
					                                     %75 = OpLabel 
					                                             OpKill
					                                     %76 = OpLabel 
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
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
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
					; Bound: 97
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %27 %64 %72 %87 %91 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD2 Location 27 
					                                             OpDecorate %28 RelaxedPrecision 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %56 DescriptorSet 56 
					                                             OpDecorate %56 Binding 56 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %60 DescriptorSet 60 
					                                             OpDecorate %60 Binding 60 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 64 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 Location 72 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %87 Location 87 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %91 Location 91 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 4 
					                                     %11 = OpTypeStruct %10 
					                                     %12 = OpTypePointer Uniform %11 
					            Uniform struct {f32_4;}* %13 = OpVariable Uniform 
					                                     %14 = OpTypeInt 32 1 
					                                 i32 %15 = OpConstant 0 
					                                     %16 = OpTypePointer Uniform %10 
					                                     %26 = OpTypePointer Input %10 
					               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
					                                 f32 %38 = OpConstant 3,674022E-40 
					                                 f32 %39 = OpConstant 3,674022E-40 
					                                     %43 = OpTypePointer Private %6 
					                        Private f32* %44 = OpVariable Private 
					                                     %45 = OpTypeInt 32 0 
					                                 u32 %46 = OpConstant 1 
					                                 u32 %49 = OpConstant 0 
					                        Private f32* %53 = OpVariable Private 
					                                     %54 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %55 = OpTypePointer UniformConstant %54 
					UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
					                                     %58 = OpTypeSampler 
					                                     %59 = OpTypePointer UniformConstant %58 
					            UniformConstant sampler* %60 = OpVariable UniformConstant 
					                                     %62 = OpTypeSampledImage %54 
					               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                 u32 %68 = OpConstant 3 
					                        Private f32* %70 = OpVariable Private 
					               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                     %73 = OpTypePointer Input %6 
					                                     %83 = OpTypePointer Private %10 
					                      Private f32_4* %84 = OpVariable Private 
					                        Input f32_4* %87 = OpVariable Input 
					                                     %90 = OpTypePointer Output %10 
					                       Output f32_4* %91 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Uniform f32_4* %17 = OpAccessChain %13 %15 
					                               f32_4 %18 = OpLoad %17 
					                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                               f32_2 %20 = OpFNegate %19 
					                      Uniform f32_4* %21 = OpAccessChain %13 %15 
					                               f32_4 %22 = OpLoad %21 
					                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
					                               f32_2 %24 = OpFAdd %20 %23 
					                                             OpStore %9 %24 
					                               f32_2 %25 = OpLoad %9 
					                               f32_4 %28 = OpLoad vs_TEXCOORD2 
					                               f32_2 %29 = OpVectorShuffle %28 %28 0 1 
					                               f32_2 %30 = OpExtInst %1 4 %29 
					                               f32_2 %31 = OpFNegate %30 
					                               f32_2 %32 = OpFAdd %25 %31 
					                                             OpStore %9 %32 
					                               f32_2 %33 = OpLoad %9 
					                               f32_4 %34 = OpLoad vs_TEXCOORD2 
					                               f32_2 %35 = OpVectorShuffle %34 %34 2 3 
					                               f32_2 %36 = OpFMul %33 %35 
					                                             OpStore %9 %36 
					                               f32_2 %37 = OpLoad %9 
					                               f32_2 %40 = OpCompositeConstruct %38 %38 
					                               f32_2 %41 = OpCompositeConstruct %39 %39 
					                               f32_2 %42 = OpExtInst %1 43 %37 %40 %41 
					                                             OpStore %9 %42 
					                        Private f32* %47 = OpAccessChain %9 %46 
					                                 f32 %48 = OpLoad %47 
					                        Private f32* %50 = OpAccessChain %9 %49 
					                                 f32 %51 = OpLoad %50 
					                                 f32 %52 = OpFMul %48 %51 
					                                             OpStore %44 %52 
					                 read_only Texture2D %57 = OpLoad %56 
					                             sampler %61 = OpLoad %60 
					          read_only Texture2DSampled %63 = OpSampledImage %57 %61 
					                               f32_4 %65 = OpLoad vs_TEXCOORD0 
					                               f32_2 %66 = OpVectorShuffle %65 %65 0 1 
					                               f32_4 %67 = OpImageSampleImplicitLod %63 %66 
					                                 f32 %69 = OpCompositeExtract %67 3 
					                                             OpStore %53 %69 
					                                 f32 %71 = OpLoad %53 
					                          Input f32* %74 = OpAccessChain vs_TEXCOORD1 %49 
					                                 f32 %75 = OpLoad %74 
					                                 f32 %76 = OpFMul %71 %75 
					                          Input f32* %77 = OpAccessChain vs_TEXCOORD1 %68 
					                                 f32 %78 = OpLoad %77 
					                                 f32 %79 = OpFNegate %78 
					                                 f32 %80 = OpFAdd %76 %79 
					                                             OpStore %70 %80 
					                                 f32 %81 = OpLoad %70 
					                                 f32 %82 = OpExtInst %1 43 %81 %38 %39 
					                                             OpStore %70 %82 
					                                 f32 %85 = OpLoad %70 
					                               f32_4 %86 = OpCompositeConstruct %85 %85 %85 %85 
					                               f32_4 %88 = OpLoad %87 
					                               f32_4 %89 = OpFMul %86 %88 
					                                             OpStore %84 %89 
					                                 f32 %92 = OpLoad %44 
					                               f32_4 %93 = OpCompositeConstruct %92 %92 %92 %92 
					                               f32_4 %94 = OpLoad %84 
					                               f32_4 %95 = OpFMul %93 %94 
					                                             OpStore %91 %95 
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
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    u_xlat2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
					    u_xlat1 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat1;
					    u_xlatb0 = u_xlat2<0.0;
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
					; Bound: 118
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %27 %64 %72 %87 %101 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD2 Location 27 
					                                             OpDecorate %28 RelaxedPrecision 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %56 DescriptorSet 56 
					                                             OpDecorate %56 Binding 56 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %60 DescriptorSet 60 
					                                             OpDecorate %60 Binding 60 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 64 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 Location 72 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %87 Location 87 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %101 Location 101 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 4 
					                                     %11 = OpTypeStruct %10 
					                                     %12 = OpTypePointer Uniform %11 
					            Uniform struct {f32_4;}* %13 = OpVariable Uniform 
					                                     %14 = OpTypeInt 32 1 
					                                 i32 %15 = OpConstant 0 
					                                     %16 = OpTypePointer Uniform %10 
					                                     %26 = OpTypePointer Input %10 
					               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
					                                 f32 %38 = OpConstant 3,674022E-40 
					                                 f32 %39 = OpConstant 3,674022E-40 
					                                     %43 = OpTypePointer Private %6 
					                        Private f32* %44 = OpVariable Private 
					                                     %45 = OpTypeInt 32 0 
					                                 u32 %46 = OpConstant 1 
					                                 u32 %49 = OpConstant 0 
					                        Private f32* %53 = OpVariable Private 
					                                     %54 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %55 = OpTypePointer UniformConstant %54 
					UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
					                                     %58 = OpTypeSampler 
					                                     %59 = OpTypePointer UniformConstant %58 
					            UniformConstant sampler* %60 = OpVariable UniformConstant 
					                                     %62 = OpTypeSampledImage %54 
					               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                                 u32 %68 = OpConstant 3 
					                        Private f32* %70 = OpVariable Private 
					               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                     %73 = OpTypePointer Input %6 
					                                     %83 = OpTypePointer Private %10 
					                      Private f32_4* %84 = OpVariable Private 
					                        Input f32_4* %87 = OpVariable Input 
					                                 f32 %94 = OpConstant 3,674022E-40 
					                                    %100 = OpTypePointer Output %10 
					                      Output f32_4* %101 = OpVariable Output 
					                                    %103 = OpTypeBool 
					                                    %104 = OpTypePointer Private %103 
					                      Private bool* %105 = OpVariable Private 
					                                i32 %109 = OpConstant 1 
					                                i32 %111 = OpConstant -1 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Uniform f32_4* %17 = OpAccessChain %13 %15 
					                               f32_4 %18 = OpLoad %17 
					                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                               f32_2 %20 = OpFNegate %19 
					                      Uniform f32_4* %21 = OpAccessChain %13 %15 
					                               f32_4 %22 = OpLoad %21 
					                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
					                               f32_2 %24 = OpFAdd %20 %23 
					                                             OpStore %9 %24 
					                               f32_2 %25 = OpLoad %9 
					                               f32_4 %28 = OpLoad vs_TEXCOORD2 
					                               f32_2 %29 = OpVectorShuffle %28 %28 0 1 
					                               f32_2 %30 = OpExtInst %1 4 %29 
					                               f32_2 %31 = OpFNegate %30 
					                               f32_2 %32 = OpFAdd %25 %31 
					                                             OpStore %9 %32 
					                               f32_2 %33 = OpLoad %9 
					                               f32_4 %34 = OpLoad vs_TEXCOORD2 
					                               f32_2 %35 = OpVectorShuffle %34 %34 2 3 
					                               f32_2 %36 = OpFMul %33 %35 
					                                             OpStore %9 %36 
					                               f32_2 %37 = OpLoad %9 
					                               f32_2 %40 = OpCompositeConstruct %38 %38 
					                               f32_2 %41 = OpCompositeConstruct %39 %39 
					                               f32_2 %42 = OpExtInst %1 43 %37 %40 %41 
					                                             OpStore %9 %42 
					                        Private f32* %47 = OpAccessChain %9 %46 
					                                 f32 %48 = OpLoad %47 
					                        Private f32* %50 = OpAccessChain %9 %49 
					                                 f32 %51 = OpLoad %50 
					                                 f32 %52 = OpFMul %48 %51 
					                                             OpStore %44 %52 
					                 read_only Texture2D %57 = OpLoad %56 
					                             sampler %61 = OpLoad %60 
					          read_only Texture2DSampled %63 = OpSampledImage %57 %61 
					                               f32_4 %65 = OpLoad vs_TEXCOORD0 
					                               f32_2 %66 = OpVectorShuffle %65 %65 0 1 
					                               f32_4 %67 = OpImageSampleImplicitLod %63 %66 
					                                 f32 %69 = OpCompositeExtract %67 3 
					                                             OpStore %53 %69 
					                                 f32 %71 = OpLoad %53 
					                          Input f32* %74 = OpAccessChain vs_TEXCOORD1 %49 
					                                 f32 %75 = OpLoad %74 
					                                 f32 %76 = OpFMul %71 %75 
					                          Input f32* %77 = OpAccessChain vs_TEXCOORD1 %68 
					                                 f32 %78 = OpLoad %77 
					                                 f32 %79 = OpFNegate %78 
					                                 f32 %80 = OpFAdd %76 %79 
					                                             OpStore %70 %80 
					                                 f32 %81 = OpLoad %70 
					                                 f32 %82 = OpExtInst %1 43 %81 %38 %39 
					                                             OpStore %70 %82 
					                                 f32 %85 = OpLoad %70 
					                               f32_4 %86 = OpCompositeConstruct %85 %85 %85 %85 
					                               f32_4 %88 = OpLoad %87 
					                               f32_4 %89 = OpFMul %86 %88 
					                                             OpStore %84 %89 
					                        Private f32* %90 = OpAccessChain %84 %68 
					                                 f32 %91 = OpLoad %90 
					                                 f32 %92 = OpLoad %44 
					                                 f32 %93 = OpFMul %91 %92 
					                                 f32 %95 = OpFAdd %93 %94 
					                                             OpStore %70 %95 
					                                 f32 %96 = OpLoad %44 
					                               f32_4 %97 = OpCompositeConstruct %96 %96 %96 %96 
					                               f32_4 %98 = OpLoad %84 
					                               f32_4 %99 = OpFMul %97 %98 
					                                             OpStore %84 %99 
					                              f32_4 %102 = OpLoad %84 
					                                             OpStore %101 %102 
					                                f32 %106 = OpLoad %70 
					                               bool %107 = OpFOrdLessThan %106 %38 
					                                             OpStore %105 %107 
					                               bool %108 = OpLoad %105 
					                                i32 %110 = OpSelect %108 %109 %15 
					                                i32 %112 = OpIMul %110 %111 
					                               bool %113 = OpINotEqual %112 %15 
					                                             OpSelectionMerge %115 None 
					                                             OpBranchConditional %113 %114 %115 
					                                    %114 = OpLabel 
					                                             OpKill
					                                    %115 = OpLabel 
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
					
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    SV_Target0 = vec4(u_xlat0) * vs_COLOR0;
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
					
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat2 = vs_COLOR0.w * u_xlat0 + -0.00100000005;
					    u_xlat1 = vec4(u_xlat0) * vs_COLOR0;
					    SV_Target0 = u_xlat1;
					    u_xlatb0 = u_xlat2<0.0;
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
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
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
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat10_1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    u_xlat2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
					    u_xlat1 = u_xlat0.xxxx * u_xlat1;
					    SV_Target0 = u_xlat1;
					    u_xlatb0 = u_xlat2<0.0;
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
	CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}