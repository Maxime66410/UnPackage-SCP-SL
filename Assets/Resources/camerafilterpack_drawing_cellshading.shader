Shader "CameraFilterPack/Drawing_CellShading" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_EdgeSize ("_EdgeSize", Range(0, 1)) = 0
		_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 29511
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
					uniform 	float _EdgeSize;
					uniform 	float _ColorLevel;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec4 u_xlat16_5;
					vec4 u_xlat6;
					vec4 u_xlat16_6;
					vec4 u_xlat10_6;
					vec2 u_xlat7;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat10_9;
					vec4 u_xlat10;
					vec4 u_xlat16_10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec4 u_xlat10_11;
					vec4 u_xlat10_12;
					vec4 u_xlat13;
					vec4 u_xlat16_13;
					vec4 u_xlat10_13;
					vec4 u_xlat10_14;
					vec3 u_xlat15;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat1 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, -1.0, 0.0, 1.0);
					    u_xlat1 = u_xlat1 / _ScreenResolution.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat3 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 1.0, 1.0, 0.0);
					    u_xlat3 = u_xlat3 / _ScreenResolution.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.zw);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_5 = u_xlat10_2 + u_xlat10_4;
					    u_xlat6 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 2.0, 1.0, -2.0);
					    u_xlat6 = u_xlat6 / _ScreenResolution.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.zw);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_7;
					    u_xlat7.xy = u_xlat0.zw * _ScreenResolution.xy;
					    u_xlat7.xy = u_xlat7.xy / _ScreenResolution.xy;
					    u_xlat10_7 = texture(_MainTex, u_xlat7.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_7;
					    u_xlat8 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -1.0, -1.0, 1.0);
					    u_xlat8 = u_xlat8 / _ScreenResolution.xyxy;
					    u_xlat10_9 = texture(_MainTex, u_xlat8.xy);
					    u_xlat10_8 = texture(_MainTex, u_xlat8.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_9;
					    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -2.0, -1.0, -2.0);
					    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
					    u_xlat10_11 = texture(_MainTex, u_xlat10.xy);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_11;
					    u_xlat11 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 0.0, -1.0, -1.0);
					    u_xlat11 = u_xlat11 / _ScreenResolution.xyxy;
					    u_xlat10_12 = texture(_MainTex, u_xlat11.xy);
					    u_xlat10_11 = texture(_MainTex, u_xlat11.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_12;
					    u_xlat16_5 = u_xlat10_11 + u_xlat16_5;
					    u_xlat16_5 = u_xlat10_10 + u_xlat16_5;
					    u_xlat16_5 = u_xlat16_5 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 2.0, 0.0, 2.0);
					    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
					    u_xlat10_13 = texture(_MainTex, u_xlat10.xy);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.zw);
					    u_xlat16_13 = u_xlat10_3 + u_xlat10_13;
					    u_xlat16_13 = u_xlat10_4 + u_xlat16_13;
					    u_xlat16_10 = u_xlat10_10 + u_xlat16_13;
					    u_xlat16_10 = u_xlat10_1 + u_xlat16_10;
					    u_xlat16_10 = u_xlat10_7 + u_xlat16_10;
					    u_xlat16_6 = u_xlat10_6 + u_xlat16_10;
					    u_xlat16_6 = u_xlat10_8 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_12 + u_xlat16_6;
					    u_xlat16_5 = u_xlat16_6 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat16_5);
					    u_xlat16_6 = u_xlat10_1 + u_xlat10_7;
					    u_xlat16_6 = u_xlat10_9 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_8 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_12 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_11 + u_xlat16_6;
					    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, -1.0, -2.0, 1.0);
					    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
					    u_xlat10_13 = texture(_MainTex, u_xlat10.zw);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.xy);
					    u_xlat16_6 = u_xlat16_6 + u_xlat10_13;
					    u_xlat13 = u_xlat0 * _ScreenResolution.xyxy + vec4(-2.0, 0.0, -2.0, -1.0);
					    u_xlat0 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, 1.0, 2.0, 0.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
					    u_xlat13 = u_xlat13 / _ScreenResolution.xyxy;
					    u_xlat10_14 = texture(_MainTex, u_xlat13.xy);
					    u_xlat10_13 = texture(_MainTex, u_xlat13.zw);
					    u_xlat16_6 = u_xlat16_6 + u_xlat10_14;
					    u_xlat16_6 = u_xlat10_13 + u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat10_13 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_13;
					    u_xlat16_0 = u_xlat10_10 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat16_3 = u_xlat10_4 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_4 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    u_xlat16_2 = u_xlat10_2 + u_xlat16_3;
					    u_xlat16_2 = u_xlat10_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_7 + u_xlat16_0;
					    u_xlat16_1 = u_xlat10_7 + u_xlat16_2;
					    u_xlat16_1 = u_xlat10_9 + u_xlat16_1;
					    u_xlat16_0 = u_xlat10_9 + u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat16_6);
					    u_xlat16_0 = abs(u_xlat16_0) + abs(u_xlat16_5);
					    u_xlat16_0 = u_xlat16_0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_0.x = dot(u_xlat16_0, u_xlat16_0);
					    u_xlat0.x = sqrt(u_xlat16_0.x);
					    u_xlat16_1 = u_xlat10_8 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_12 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_11 + u_xlat16_1;
					    u_xlat15.x = _EdgeSize + 0.0500000007;
					    u_xlatb0 = u_xlat15.x<u_xlat0.x;
					    u_xlat15.xyz = u_xlat16_1.xyz * vec3(0.777777791, 0.777777791, 0.777777791);
					    SV_Target0.w = u_xlat16_1.w * 0.111111112;
					    u_xlat15.xyz = floor(u_xlat15.xyz);
					    u_xlat15.xyz = u_xlat15.xyz / vec3(vec3(_ColorLevel, _ColorLevel, _ColorLevel));
					    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat15.xyz;
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
					; Bound: 553
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %12 %518 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpDecorate vs_TEXCOORD0 Location 12 
					                                                  OpMemberDecorate %15 0 Offset 15 
					                                                  OpMemberDecorate %15 1 Offset 15 
					                                                  OpMemberDecorate %15 2 Offset 15 
					                                                  OpMemberDecorate %15 3 RelaxedPrecision 
					                                                  OpMemberDecorate %15 3 Offset 15 
					                                                  OpDecorate %15 Block 
					                                                  OpDecorate %17 DescriptorSet 17 
					                                                  OpDecorate %17 Binding 17 
					                                                  OpDecorate %22 RelaxedPrecision 
					                                                  OpDecorate %23 RelaxedPrecision 
					                                                  OpDecorate %26 RelaxedPrecision 
					                                                  OpDecorate %27 RelaxedPrecision 
					                                                  OpDecorate %47 RelaxedPrecision 
					                                                  OpDecorate %50 RelaxedPrecision 
					                                                  OpDecorate %50 DescriptorSet 50 
					                                                  OpDecorate %50 Binding 50 
					                                                  OpDecorate %51 RelaxedPrecision 
					                                                  OpDecorate %54 RelaxedPrecision 
					                                                  OpDecorate %54 DescriptorSet 54 
					                                                  OpDecorate %54 Binding 54 
					                                                  OpDecorate %55 RelaxedPrecision 
					                                                  OpDecorate %61 RelaxedPrecision 
					                                                  OpDecorate %62 RelaxedPrecision 
					                                                  OpDecorate %63 RelaxedPrecision 
					                                                  OpDecorate %82 RelaxedPrecision 
					                                                  OpDecorate %83 RelaxedPrecision 
					                                                  OpDecorate %84 RelaxedPrecision 
					                                                  OpDecorate %89 RelaxedPrecision 
					                                                  OpDecorate %90 RelaxedPrecision 
					                                                  OpDecorate %91 RelaxedPrecision 
					                                                  OpDecorate %96 RelaxedPrecision 
					                                                  OpDecorate %97 RelaxedPrecision 
					                                                  OpDecorate %98 RelaxedPrecision 
					                                                  OpDecorate %99 RelaxedPrecision 
					                                                  OpDecorate %116 RelaxedPrecision 
					                                                  OpDecorate %117 RelaxedPrecision 
					                                                  OpDecorate %118 RelaxedPrecision 
					                                                  OpDecorate %123 RelaxedPrecision 
					                                                  OpDecorate %124 RelaxedPrecision 
					                                                  OpDecorate %125 RelaxedPrecision 
					                                                  OpDecorate %130 RelaxedPrecision 
					                                                  OpDecorate %131 RelaxedPrecision 
					                                                  OpDecorate %132 RelaxedPrecision 
					                                                  OpDecorate %146 RelaxedPrecision 
					                                                  OpDecorate %147 RelaxedPrecision 
					                                                  OpDecorate %151 RelaxedPrecision 
					                                                  OpDecorate %152 RelaxedPrecision 
					                                                  OpDecorate %153 RelaxedPrecision 
					                                                  OpDecorate %168 RelaxedPrecision 
					                                                  OpDecorate %169 RelaxedPrecision 
					                                                  OpDecorate %170 RelaxedPrecision 
					                                                  OpDecorate %175 RelaxedPrecision 
					                                                  OpDecorate %176 RelaxedPrecision 
					                                                  OpDecorate %177 RelaxedPrecision 
					                                                  OpDecorate %182 RelaxedPrecision 
					                                                  OpDecorate %183 RelaxedPrecision 
					                                                  OpDecorate %184 RelaxedPrecision 
					                                                  OpDecorate %199 RelaxedPrecision 
					                                                  OpDecorate %200 RelaxedPrecision 
					                                                  OpDecorate %201 RelaxedPrecision 
					                                                  OpDecorate %206 RelaxedPrecision 
					                                                  OpDecorate %207 RelaxedPrecision 
					                                                  OpDecorate %208 RelaxedPrecision 
					                                                  OpDecorate %213 RelaxedPrecision 
					                                                  OpDecorate %214 RelaxedPrecision 
					                                                  OpDecorate %215 RelaxedPrecision 
					                                                  OpDecorate %230 RelaxedPrecision 
					                                                  OpDecorate %231 RelaxedPrecision 
					                                                  OpDecorate %232 RelaxedPrecision 
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
					                                                  OpDecorate %252 RelaxedPrecision 
					                                                  OpDecorate %255 RelaxedPrecision 
					                                                  OpDecorate %269 RelaxedPrecision 
					                                                  OpDecorate %270 RelaxedPrecision 
					                                                  OpDecorate %271 RelaxedPrecision 
					                                                  OpDecorate %276 RelaxedPrecision 
					                                                  OpDecorate %277 RelaxedPrecision 
					                                                  OpDecorate %282 RelaxedPrecision 
					                                                  OpDecorate %283 RelaxedPrecision 
					                                                  OpDecorate %284 RelaxedPrecision 
					                                                  OpDecorate %285 RelaxedPrecision 
					                                                  OpDecorate %286 RelaxedPrecision 
					                                                  OpDecorate %287 RelaxedPrecision 
					                                                  OpDecorate %288 RelaxedPrecision 
					                                                  OpDecorate %289 RelaxedPrecision 
					                                                  OpDecorate %290 RelaxedPrecision 
					                                                  OpDecorate %291 RelaxedPrecision 
					                                                  OpDecorate %292 RelaxedPrecision 
					                                                  OpDecorate %293 RelaxedPrecision 
					                                                  OpDecorate %294 RelaxedPrecision 
					                                                  OpDecorate %295 RelaxedPrecision 
					                                                  OpDecorate %296 RelaxedPrecision 
					                                                  OpDecorate %297 RelaxedPrecision 
					                                                  OpDecorate %298 RelaxedPrecision 
					                                                  OpDecorate %299 RelaxedPrecision 
					                                                  OpDecorate %300 RelaxedPrecision 
					                                                  OpDecorate %301 RelaxedPrecision 
					                                                  OpDecorate %302 RelaxedPrecision 
					                                                  OpDecorate %303 RelaxedPrecision 
					                                                  OpDecorate %304 RelaxedPrecision 
					                                                  OpDecorate %305 RelaxedPrecision 
					                                                  OpDecorate %306 RelaxedPrecision 
					                                                  OpDecorate %307 RelaxedPrecision 
					                                                  OpDecorate %308 RelaxedPrecision 
					                                                  OpDecorate %309 RelaxedPrecision 
					                                                  OpDecorate %310 RelaxedPrecision 
					                                                  OpDecorate %311 RelaxedPrecision 
					                                                  OpDecorate %312 RelaxedPrecision 
					                                                  OpDecorate %313 RelaxedPrecision 
					                                                  OpDecorate %314 RelaxedPrecision 
					                                                  OpDecorate %315 RelaxedPrecision 
					                                                  OpDecorate %316 RelaxedPrecision 
					                                                  OpDecorate %317 RelaxedPrecision 
					                                                  OpDecorate %318 RelaxedPrecision 
					                                                  OpDecorate %319 RelaxedPrecision 
					                                                  OpDecorate %320 RelaxedPrecision 
					                                                  OpDecorate %321 RelaxedPrecision 
					                                                  OpDecorate %322 RelaxedPrecision 
					                                                  OpDecorate %323 RelaxedPrecision 
					                                                  OpDecorate %324 RelaxedPrecision 
					                                                  OpDecorate %325 RelaxedPrecision 
					                                                  OpDecorate %326 RelaxedPrecision 
					                                                  OpDecorate %327 RelaxedPrecision 
					                                                  OpDecorate %328 RelaxedPrecision 
					                                                  OpDecorate %342 RelaxedPrecision 
					                                                  OpDecorate %343 RelaxedPrecision 
					                                                  OpDecorate %348 RelaxedPrecision 
					                                                  OpDecorate %349 RelaxedPrecision 
					                                                  OpDecorate %354 RelaxedPrecision 
					                                                  OpDecorate %355 RelaxedPrecision 
					                                                  OpDecorate %356 RelaxedPrecision 
					                                                  OpDecorate %383 RelaxedPrecision 
					                                                  OpDecorate %384 RelaxedPrecision 
					                                                  OpDecorate %385 RelaxedPrecision 
					                                                  OpDecorate %390 RelaxedPrecision 
					                                                  OpDecorate %391 RelaxedPrecision 
					                                                  OpDecorate %396 RelaxedPrecision 
					                                                  OpDecorate %397 RelaxedPrecision 
					                                                  OpDecorate %398 RelaxedPrecision 
					                                                  OpDecorate %399 RelaxedPrecision 
					                                                  OpDecorate %400 RelaxedPrecision 
					                                                  OpDecorate %401 RelaxedPrecision 
					                                                  OpDecorate %402 RelaxedPrecision 
					                                                  OpDecorate %403 RelaxedPrecision 
					                                                  OpDecorate %404 RelaxedPrecision 
					                                                  OpDecorate %405 RelaxedPrecision 
					                                                  OpDecorate %410 RelaxedPrecision 
					                                                  OpDecorate %411 RelaxedPrecision 
					                                                  OpDecorate %412 RelaxedPrecision 
					                                                  OpDecorate %417 RelaxedPrecision 
					                                                  OpDecorate %418 RelaxedPrecision 
					                                                  OpDecorate %419 RelaxedPrecision 
					                                                  OpDecorate %420 RelaxedPrecision 
					                                                  OpDecorate %421 RelaxedPrecision 
					                                                  OpDecorate %422 RelaxedPrecision 
					                                                  OpDecorate %423 RelaxedPrecision 
					                                                  OpDecorate %424 RelaxedPrecision 
					                                                  OpDecorate %425 RelaxedPrecision 
					                                                  OpDecorate %426 RelaxedPrecision 
					                                                  OpDecorate %427 RelaxedPrecision 
					                                                  OpDecorate %428 RelaxedPrecision 
					                                                  OpDecorate %429 RelaxedPrecision 
					                                                  OpDecorate %430 RelaxedPrecision 
					                                                  OpDecorate %431 RelaxedPrecision 
					                                                  OpDecorate %432 RelaxedPrecision 
					                                                  OpDecorate %433 RelaxedPrecision 
					                                                  OpDecorate %434 RelaxedPrecision 
					                                                  OpDecorate %435 RelaxedPrecision 
					                                                  OpDecorate %436 RelaxedPrecision 
					                                                  OpDecorate %437 RelaxedPrecision 
					                                                  OpDecorate %438 RelaxedPrecision 
					                                                  OpDecorate %439 RelaxedPrecision 
					                                                  OpDecorate %440 RelaxedPrecision 
					                                                  OpDecorate %441 RelaxedPrecision 
					                                                  OpDecorate %442 RelaxedPrecision 
					                                                  OpDecorate %443 RelaxedPrecision 
					                                                  OpDecorate %444 RelaxedPrecision 
					                                                  OpDecorate %445 RelaxedPrecision 
					                                                  OpDecorate %446 RelaxedPrecision 
					                                                  OpDecorate %447 RelaxedPrecision 
					                                                  OpDecorate %448 RelaxedPrecision 
					                                                  OpDecorate %449 RelaxedPrecision 
					                                                  OpDecorate %450 RelaxedPrecision 
					                                                  OpDecorate %451 RelaxedPrecision 
					                                                  OpDecorate %452 RelaxedPrecision 
					                                                  OpDecorate %453 RelaxedPrecision 
					                                                  OpDecorate %454 RelaxedPrecision 
					                                                  OpDecorate %455 RelaxedPrecision 
					                                                  OpDecorate %456 RelaxedPrecision 
					                                                  OpDecorate %457 RelaxedPrecision 
					                                                  OpDecorate %458 RelaxedPrecision 
					                                                  OpDecorate %459 RelaxedPrecision 
					                                                  OpDecorate %460 RelaxedPrecision 
					                                                  OpDecorate %461 RelaxedPrecision 
					                                                  OpDecorate %462 RelaxedPrecision 
					                                                  OpDecorate %463 RelaxedPrecision 
					                                                  OpDecorate %464 RelaxedPrecision 
					                                                  OpDecorate %465 RelaxedPrecision 
					                                                  OpDecorate %466 RelaxedPrecision 
					                                                  OpDecorate %467 RelaxedPrecision 
					                                                  OpDecorate %468 RelaxedPrecision 
					                                                  OpDecorate %469 RelaxedPrecision 
					                                                  OpDecorate %470 RelaxedPrecision 
					                                                  OpDecorate %473 RelaxedPrecision 
					                                                  OpDecorate %474 RelaxedPrecision 
					                                                  OpDecorate %475 RelaxedPrecision 
					                                                  OpDecorate %476 RelaxedPrecision 
					                                                  OpDecorate %482 RelaxedPrecision 
					                                                  OpDecorate %483 RelaxedPrecision 
					                                                  OpDecorate %485 RelaxedPrecision 
					                                                  OpDecorate %486 RelaxedPrecision 
					                                                  OpDecorate %487 RelaxedPrecision 
					                                                  OpDecorate %488 RelaxedPrecision 
					                                                  OpDecorate %489 RelaxedPrecision 
					                                                  OpDecorate %490 RelaxedPrecision 
					                                                  OpDecorate %491 RelaxedPrecision 
					                                                  OpDecorate %492 RelaxedPrecision 
					                                                  OpDecorate %493 RelaxedPrecision 
					                                                  OpDecorate %512 RelaxedPrecision 
					                                                  OpDecorate %513 RelaxedPrecision 
					                                                  OpDecorate %516 RelaxedPrecision 
					                                                  OpDecorate %518 Location 518 
					                                                  OpDecorate %521 RelaxedPrecision 
					                                                  OpDecorate %522 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 4 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_4* %9 = OpVariable Private 
					                                          %10 = OpTypeVector %6 2 
					                                          %11 = OpTypePointer Input %10 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          %15 = OpTypeStruct %7 %6 %6 %7 
					                                          %16 = OpTypePointer Uniform %15 
					Uniform struct {f32_4; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                          %18 = OpTypeInt 32 1 
					                                      i32 %19 = OpConstant 3 
					                                          %20 = OpTypePointer Uniform %7 
					                           Private f32_4* %29 = OpVariable Private 
					                                      i32 %32 = OpConstant 0 
					                                      f32 %37 = OpConstant 3,674022E-40 
					                                      f32 %38 = OpConstant 3,674022E-40 
					                                      f32 %39 = OpConstant 3,674022E-40 
					                                    f32_4 %40 = OpConstantComposite %37 %38 %39 %37 
					                           Private f32_4* %47 = OpVariable Private 
					                                          %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %49 = OpTypePointer UniformConstant %48 
					     UniformConstant read_only Texture2D* %50 = OpVariable UniformConstant 
					                                          %52 = OpTypeSampler 
					                                          %53 = OpTypePointer UniformConstant %52 
					                 UniformConstant sampler* %54 = OpVariable UniformConstant 
					                                          %56 = OpTypeSampledImage %48 
					                           Private f32_4* %61 = OpVariable Private 
					                           Private f32_4* %68 = OpVariable Private 
					                                    f32_4 %75 = OpConstantComposite %37 %37 %37 %39 
					                           Private f32_4* %82 = OpVariable Private 
					                           Private f32_4* %89 = OpVariable Private 
					                           Private f32_4* %96 = OpVariable Private 
					                          Private f32_4* %100 = OpVariable Private 
					                                     f32 %107 = OpConstant 3,674022E-40 
					                                     f32 %108 = OpConstant 3,674022E-40 
					                                   f32_4 %109 = OpConstantComposite %38 %107 %37 %108 
					                          Private f32_4* %116 = OpVariable Private 
					                          Private f32_4* %123 = OpVariable Private 
					                                         %133 = OpTypePointer Private %10 
					                          Private f32_2* %134 = OpVariable Private 
					                          Private f32_4* %154 = OpVariable Private 
					                                   f32_4 %161 = OpConstantComposite %39 %38 %38 %37 
					                          Private f32_4* %168 = OpVariable Private 
					                          Private f32_4* %175 = OpVariable Private 
					                          Private f32_4* %185 = OpVariable Private 
					                                   f32_4 %192 = OpConstantComposite %39 %108 %38 %108 
					                          Private f32_4* %199 = OpVariable Private 
					                          Private f32_4* %206 = OpVariable Private 
					                          Private f32_4* %216 = OpVariable Private 
					                                   f32_4 %223 = OpConstantComposite %38 %39 %38 %38 
					                          Private f32_4* %230 = OpVariable Private 
					                                     f32 %253 = OpConstant 3,674022E-40 
					                                   f32_4 %254 = OpConstantComposite %253 %253 %253 %253 
					                                   f32_4 %262 = OpConstantComposite %37 %107 %39 %107 
					                          Private f32_4* %269 = OpVariable Private 
					                          Private f32_4* %282 = OpVariable Private 
					                          Private f32_4* %289 = OpVariable Private 
					                          Private f32_4* %299 = OpVariable Private 
					                                   f32_4 %335 = OpConstantComposite %107 %38 %108 %37 
					                          Private f32_4* %357 = OpVariable Private 
					                                   f32_4 %363 = OpConstantComposite %108 %39 %108 %38 
					                                   f32_4 %371 = OpConstantComposite %107 %37 %107 %39 
					                          Private f32_4* %383 = OpVariable Private 
					                          Private f32_4* %410 = OpVariable Private 
					                          Private f32_4* %417 = OpVariable Private 
					                          Private f32_4* %427 = OpVariable Private 
					                          Private f32_4* %437 = OpVariable Private 
					                          Private f32_4* %450 = OpVariable Private 
					                                     f32 %471 = OpConstant 3,674022E-40 
					                                   f32_4 %472 = OpConstantComposite %471 %471 %471 %471 
					                                         %477 = OpTypeInt 32 0 
					                                     u32 %478 = OpConstant 0 
					                                         %479 = OpTypePointer Private %6 
					                                         %494 = OpTypeVector %6 3 
					                                         %495 = OpTypePointer Private %494 
					                          Private f32_3* %496 = OpVariable Private 
					                                     i32 %497 = OpConstant 1 
					                                         %498 = OpTypePointer Uniform %6 
					                                     f32 %501 = OpConstant 3,674022E-40 
					                                         %504 = OpTypeBool 
					                                         %505 = OpTypePointer Private %504 
					                           Private bool* %506 = OpVariable Private 
					                                     f32 %514 = OpConstant 3,674022E-40 
					                                   f32_3 %515 = OpConstantComposite %514 %514 %514 
					                                         %517 = OpTypePointer Output %7 
					                           Output f32_4* %518 = OpVariable Output 
					                                     u32 %519 = OpConstant 3 
					                                         %523 = OpTypePointer Output %6 
					                                     i32 %528 = OpConstant 2 
					                                         %542 = OpTypePointer Function %494 
					                                   f32_3 %546 = OpConstantComposite %39 %39 %39 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                         Function f32_3* %543 = OpVariable Function 
					                                    f32_2 %13 = OpLoad vs_TEXCOORD0 
					                                    f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
					                           Uniform f32_4* %21 = OpAccessChain %17 %19 
					                                    f32_4 %22 = OpLoad %21 
					                                    f32_4 %23 = OpVectorShuffle %22 %22 0 1 0 1 
					                                    f32_4 %24 = OpFMul %14 %23 
					                           Uniform f32_4* %25 = OpAccessChain %17 %19 
					                                    f32_4 %26 = OpLoad %25 
					                                    f32_4 %27 = OpVectorShuffle %26 %26 2 3 2 3 
					                                    f32_4 %28 = OpFAdd %24 %27 
					                                                  OpStore %9 %28 
					                                    f32_4 %30 = OpLoad %9 
					                                    f32_4 %31 = OpVectorShuffle %30 %30 2 3 2 3 
					                           Uniform f32_4* %33 = OpAccessChain %17 %32 
					                                    f32_4 %34 = OpLoad %33 
					                                    f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 1 
					                                    f32_4 %36 = OpFMul %31 %35 
					                                    f32_4 %41 = OpFAdd %36 %40 
					                                                  OpStore %29 %41 
					                                    f32_4 %42 = OpLoad %29 
					                           Uniform f32_4* %43 = OpAccessChain %17 %32 
					                                    f32_4 %44 = OpLoad %43 
					                                    f32_4 %45 = OpVectorShuffle %44 %44 0 1 0 1 
					                                    f32_4 %46 = OpFDiv %42 %45 
					                                                  OpStore %29 %46 
					                      read_only Texture2D %51 = OpLoad %50 
					                                  sampler %55 = OpLoad %54 
					               read_only Texture2DSampled %57 = OpSampledImage %51 %55 
					                                    f32_4 %58 = OpLoad %29 
					                                    f32_2 %59 = OpVectorShuffle %58 %58 0 1 
					                                    f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                  OpStore %47 %60 
					                      read_only Texture2D %62 = OpLoad %50 
					                                  sampler %63 = OpLoad %54 
					               read_only Texture2DSampled %64 = OpSampledImage %62 %63 
					                                    f32_4 %65 = OpLoad %29 
					                                    f32_2 %66 = OpVectorShuffle %65 %65 2 3 
					                                    f32_4 %67 = OpImageSampleImplicitLod %64 %66 
					                                                  OpStore %61 %67 
					                                    f32_4 %69 = OpLoad %9 
					                                    f32_4 %70 = OpVectorShuffle %69 %69 2 3 2 3 
					                           Uniform f32_4* %71 = OpAccessChain %17 %32 
					                                    f32_4 %72 = OpLoad %71 
					                                    f32_4 %73 = OpVectorShuffle %72 %72 0 1 0 1 
					                                    f32_4 %74 = OpFMul %70 %73 
					                                    f32_4 %76 = OpFAdd %74 %75 
					                                                  OpStore %68 %76 
					                                    f32_4 %77 = OpLoad %68 
					                           Uniform f32_4* %78 = OpAccessChain %17 %32 
					                                    f32_4 %79 = OpLoad %78 
					                                    f32_4 %80 = OpVectorShuffle %79 %79 0 1 0 1 
					                                    f32_4 %81 = OpFDiv %77 %80 
					                                                  OpStore %68 %81 
					                      read_only Texture2D %83 = OpLoad %50 
					                                  sampler %84 = OpLoad %54 
					               read_only Texture2DSampled %85 = OpSampledImage %83 %84 
					                                    f32_4 %86 = OpLoad %68 
					                                    f32_2 %87 = OpVectorShuffle %86 %86 2 3 
					                                    f32_4 %88 = OpImageSampleImplicitLod %85 %87 
					                                                  OpStore %82 %88 
					                      read_only Texture2D %90 = OpLoad %50 
					                                  sampler %91 = OpLoad %54 
					               read_only Texture2DSampled %92 = OpSampledImage %90 %91 
					                                    f32_4 %93 = OpLoad %68 
					                                    f32_2 %94 = OpVectorShuffle %93 %93 0 1 
					                                    f32_4 %95 = OpImageSampleImplicitLod %92 %94 
					                                                  OpStore %89 %95 
					                                    f32_4 %97 = OpLoad %47 
					                                    f32_4 %98 = OpLoad %82 
					                                    f32_4 %99 = OpFAdd %97 %98 
					                                                  OpStore %96 %99 
					                                   f32_4 %101 = OpLoad %9 
					                                   f32_4 %102 = OpVectorShuffle %101 %101 2 3 2 3 
					                          Uniform f32_4* %103 = OpAccessChain %17 %32 
					                                   f32_4 %104 = OpLoad %103 
					                                   f32_4 %105 = OpVectorShuffle %104 %104 0 1 0 1 
					                                   f32_4 %106 = OpFMul %102 %105 
					                                   f32_4 %110 = OpFAdd %106 %109 
					                                                  OpStore %100 %110 
					                                   f32_4 %111 = OpLoad %100 
					                          Uniform f32_4* %112 = OpAccessChain %17 %32 
					                                   f32_4 %113 = OpLoad %112 
					                                   f32_4 %114 = OpVectorShuffle %113 %113 0 1 0 1 
					                                   f32_4 %115 = OpFDiv %111 %114 
					                                                  OpStore %100 %115 
					                     read_only Texture2D %117 = OpLoad %50 
					                                 sampler %118 = OpLoad %54 
					              read_only Texture2DSampled %119 = OpSampledImage %117 %118 
					                                   f32_4 %120 = OpLoad %100 
					                                   f32_2 %121 = OpVectorShuffle %120 %120 2 3 
					                                   f32_4 %122 = OpImageSampleImplicitLod %119 %121 
					                                                  OpStore %116 %122 
					                     read_only Texture2D %124 = OpLoad %50 
					                                 sampler %125 = OpLoad %54 
					              read_only Texture2DSampled %126 = OpSampledImage %124 %125 
					                                   f32_4 %127 = OpLoad %100 
					                                   f32_2 %128 = OpVectorShuffle %127 %127 0 1 
					                                   f32_4 %129 = OpImageSampleImplicitLod %126 %128 
					                                                  OpStore %123 %129 
					                                   f32_4 %130 = OpLoad %96 
					                                   f32_4 %131 = OpLoad %116 
					                                   f32_4 %132 = OpFAdd %130 %131 
					                                                  OpStore %96 %132 
					                                   f32_4 %135 = OpLoad %9 
					                                   f32_2 %136 = OpVectorShuffle %135 %135 2 3 
					                          Uniform f32_4* %137 = OpAccessChain %17 %32 
					                                   f32_4 %138 = OpLoad %137 
					                                   f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                                   f32_2 %140 = OpFMul %136 %139 
					                                                  OpStore %134 %140 
					                                   f32_2 %141 = OpLoad %134 
					                          Uniform f32_4* %142 = OpAccessChain %17 %32 
					                                   f32_4 %143 = OpLoad %142 
					                                   f32_2 %144 = OpVectorShuffle %143 %143 0 1 
					                                   f32_2 %145 = OpFDiv %141 %144 
					                                                  OpStore %134 %145 
					                     read_only Texture2D %146 = OpLoad %50 
					                                 sampler %147 = OpLoad %54 
					              read_only Texture2DSampled %148 = OpSampledImage %146 %147 
					                                   f32_2 %149 = OpLoad %134 
					                                   f32_4 %150 = OpImageSampleImplicitLod %148 %149 
					                                                  OpStore %116 %150 
					                                   f32_4 %151 = OpLoad %96 
					                                   f32_4 %152 = OpLoad %116 
					                                   f32_4 %153 = OpFAdd %151 %152 
					                                                  OpStore %96 %153 
					                                   f32_4 %155 = OpLoad %9 
					                                   f32_4 %156 = OpVectorShuffle %155 %155 2 3 2 3 
					                          Uniform f32_4* %157 = OpAccessChain %17 %32 
					                                   f32_4 %158 = OpLoad %157 
					                                   f32_4 %159 = OpVectorShuffle %158 %158 0 1 0 1 
					                                   f32_4 %160 = OpFMul %156 %159 
					                                   f32_4 %162 = OpFAdd %160 %161 
					                                                  OpStore %154 %162 
					                                   f32_4 %163 = OpLoad %154 
					                          Uniform f32_4* %164 = OpAccessChain %17 %32 
					                                   f32_4 %165 = OpLoad %164 
					                                   f32_4 %166 = OpVectorShuffle %165 %165 0 1 0 1 
					                                   f32_4 %167 = OpFDiv %163 %166 
					                                                  OpStore %154 %167 
					                     read_only Texture2D %169 = OpLoad %50 
					                                 sampler %170 = OpLoad %54 
					              read_only Texture2DSampled %171 = OpSampledImage %169 %170 
					                                   f32_4 %172 = OpLoad %154 
					                                   f32_2 %173 = OpVectorShuffle %172 %172 0 1 
					                                   f32_4 %174 = OpImageSampleImplicitLod %171 %173 
					                                                  OpStore %168 %174 
					                     read_only Texture2D %176 = OpLoad %50 
					                                 sampler %177 = OpLoad %54 
					              read_only Texture2DSampled %178 = OpSampledImage %176 %177 
					                                   f32_4 %179 = OpLoad %154 
					                                   f32_2 %180 = OpVectorShuffle %179 %179 2 3 
					                                   f32_4 %181 = OpImageSampleImplicitLod %178 %180 
					                                                  OpStore %175 %181 
					                                   f32_4 %182 = OpLoad %96 
					                                   f32_4 %183 = OpLoad %168 
					                                   f32_4 %184 = OpFAdd %182 %183 
					                                                  OpStore %96 %184 
					                                   f32_4 %186 = OpLoad %9 
					                                   f32_4 %187 = OpVectorShuffle %186 %186 2 3 2 3 
					                          Uniform f32_4* %188 = OpAccessChain %17 %32 
					                                   f32_4 %189 = OpLoad %188 
					                                   f32_4 %190 = OpVectorShuffle %189 %189 0 1 0 1 
					                                   f32_4 %191 = OpFMul %187 %190 
					                                   f32_4 %193 = OpFAdd %191 %192 
					                                                  OpStore %185 %193 
					                                   f32_4 %194 = OpLoad %185 
					                          Uniform f32_4* %195 = OpAccessChain %17 %32 
					                                   f32_4 %196 = OpLoad %195 
					                                   f32_4 %197 = OpVectorShuffle %196 %196 0 1 0 1 
					                                   f32_4 %198 = OpFDiv %194 %197 
					                                                  OpStore %185 %198 
					                     read_only Texture2D %200 = OpLoad %50 
					                                 sampler %201 = OpLoad %54 
					              read_only Texture2DSampled %202 = OpSampledImage %200 %201 
					                                   f32_4 %203 = OpLoad %185 
					                                   f32_2 %204 = OpVectorShuffle %203 %203 0 1 
					                                   f32_4 %205 = OpImageSampleImplicitLod %202 %204 
					                                                  OpStore %199 %205 
					                     read_only Texture2D %207 = OpLoad %50 
					                                 sampler %208 = OpLoad %54 
					              read_only Texture2DSampled %209 = OpSampledImage %207 %208 
					                                   f32_4 %210 = OpLoad %185 
					                                   f32_2 %211 = OpVectorShuffle %210 %210 2 3 
					                                   f32_4 %212 = OpImageSampleImplicitLod %209 %211 
					                                                  OpStore %206 %212 
					                                   f32_4 %213 = OpLoad %96 
					                                   f32_4 %214 = OpLoad %199 
					                                   f32_4 %215 = OpFAdd %213 %214 
					                                                  OpStore %96 %215 
					                                   f32_4 %217 = OpLoad %9 
					                                   f32_4 %218 = OpVectorShuffle %217 %217 2 3 2 3 
					                          Uniform f32_4* %219 = OpAccessChain %17 %32 
					                                   f32_4 %220 = OpLoad %219 
					                                   f32_4 %221 = OpVectorShuffle %220 %220 0 1 0 1 
					                                   f32_4 %222 = OpFMul %218 %221 
					                                   f32_4 %224 = OpFAdd %222 %223 
					                                                  OpStore %216 %224 
					                                   f32_4 %225 = OpLoad %216 
					                          Uniform f32_4* %226 = OpAccessChain %17 %32 
					                                   f32_4 %227 = OpLoad %226 
					                                   f32_4 %228 = OpVectorShuffle %227 %227 0 1 0 1 
					                                   f32_4 %229 = OpFDiv %225 %228 
					                                                  OpStore %216 %229 
					                     read_only Texture2D %231 = OpLoad %50 
					                                 sampler %232 = OpLoad %54 
					              read_only Texture2DSampled %233 = OpSampledImage %231 %232 
					                                   f32_4 %234 = OpLoad %216 
					                                   f32_2 %235 = OpVectorShuffle %234 %234 0 1 
					                                   f32_4 %236 = OpImageSampleImplicitLod %233 %235 
					                                                  OpStore %230 %236 
					                     read_only Texture2D %237 = OpLoad %50 
					                                 sampler %238 = OpLoad %54 
					              read_only Texture2DSampled %239 = OpSampledImage %237 %238 
					                                   f32_4 %240 = OpLoad %216 
					                                   f32_2 %241 = OpVectorShuffle %240 %240 2 3 
					                                   f32_4 %242 = OpImageSampleImplicitLod %239 %241 
					                                                  OpStore %199 %242 
					                                   f32_4 %243 = OpLoad %96 
					                                   f32_4 %244 = OpLoad %230 
					                                   f32_4 %245 = OpFAdd %243 %244 
					                                                  OpStore %96 %245 
					                                   f32_4 %246 = OpLoad %199 
					                                   f32_4 %247 = OpLoad %96 
					                                   f32_4 %248 = OpFAdd %246 %247 
					                                                  OpStore %96 %248 
					                                   f32_4 %249 = OpLoad %206 
					                                   f32_4 %250 = OpLoad %96 
					                                   f32_4 %251 = OpFAdd %249 %250 
					                                                  OpStore %96 %251 
					                                   f32_4 %252 = OpLoad %96 
					                                   f32_4 %255 = OpFMul %252 %254 
					                                                  OpStore %96 %255 
					                                   f32_4 %256 = OpLoad %9 
					                                   f32_4 %257 = OpVectorShuffle %256 %256 2 3 2 3 
					                          Uniform f32_4* %258 = OpAccessChain %17 %32 
					                                   f32_4 %259 = OpLoad %258 
					                                   f32_4 %260 = OpVectorShuffle %259 %259 0 1 0 1 
					                                   f32_4 %261 = OpFMul %257 %260 
					                                   f32_4 %263 = OpFAdd %261 %262 
					                                                  OpStore %185 %263 
					                                   f32_4 %264 = OpLoad %185 
					                          Uniform f32_4* %265 = OpAccessChain %17 %32 
					                                   f32_4 %266 = OpLoad %265 
					                                   f32_4 %267 = OpVectorShuffle %266 %266 0 1 0 1 
					                                   f32_4 %268 = OpFDiv %264 %267 
					                                                  OpStore %185 %268 
					                     read_only Texture2D %270 = OpLoad %50 
					                                 sampler %271 = OpLoad %54 
					              read_only Texture2DSampled %272 = OpSampledImage %270 %271 
					                                   f32_4 %273 = OpLoad %185 
					                                   f32_2 %274 = OpVectorShuffle %273 %273 0 1 
					                                   f32_4 %275 = OpImageSampleImplicitLod %272 %274 
					                                                  OpStore %269 %275 
					                     read_only Texture2D %276 = OpLoad %50 
					                                 sampler %277 = OpLoad %54 
					              read_only Texture2DSampled %278 = OpSampledImage %276 %277 
					                                   f32_4 %279 = OpLoad %185 
					                                   f32_2 %280 = OpVectorShuffle %279 %279 2 3 
					                                   f32_4 %281 = OpImageSampleImplicitLod %278 %280 
					                                                  OpStore %206 %281 
					                                   f32_4 %283 = OpLoad %89 
					                                   f32_4 %284 = OpLoad %269 
					                                   f32_4 %285 = OpFAdd %283 %284 
					                                                  OpStore %282 %285 
					                                   f32_4 %286 = OpLoad %82 
					                                   f32_4 %287 = OpLoad %282 
					                                   f32_4 %288 = OpFAdd %286 %287 
					                                                  OpStore %282 %288 
					                                   f32_4 %290 = OpLoad %206 
					                                   f32_4 %291 = OpLoad %282 
					                                   f32_4 %292 = OpFAdd %290 %291 
					                                                  OpStore %289 %292 
					                                   f32_4 %293 = OpLoad %61 
					                                   f32_4 %294 = OpLoad %289 
					                                   f32_4 %295 = OpFAdd %293 %294 
					                                                  OpStore %289 %295 
					                                   f32_4 %296 = OpLoad %116 
					                                   f32_4 %297 = OpLoad %289 
					                                   f32_4 %298 = OpFAdd %296 %297 
					                                                  OpStore %289 %298 
					                                   f32_4 %300 = OpLoad %123 
					                                   f32_4 %301 = OpLoad %289 
					                                   f32_4 %302 = OpFAdd %300 %301 
					                                                  OpStore %299 %302 
					                                   f32_4 %303 = OpLoad %175 
					                                   f32_4 %304 = OpLoad %299 
					                                   f32_4 %305 = OpFAdd %303 %304 
					                                                  OpStore %299 %305 
					                                   f32_4 %306 = OpLoad %230 
					                                   f32_4 %307 = OpLoad %299 
					                                   f32_4 %308 = OpFAdd %306 %307 
					                                                  OpStore %299 %308 
					                                   f32_4 %309 = OpLoad %299 
					                                   f32_4 %310 = OpFMul %309 %254 
					                                   f32_4 %311 = OpLoad %96 
					                                   f32_4 %312 = OpFNegate %311 
					                                   f32_4 %313 = OpFAdd %310 %312 
					                                                  OpStore %96 %313 
					                                   f32_4 %314 = OpLoad %61 
					                                   f32_4 %315 = OpLoad %116 
					                                   f32_4 %316 = OpFAdd %314 %315 
					                                                  OpStore %299 %316 
					                                   f32_4 %317 = OpLoad %168 
					                                   f32_4 %318 = OpLoad %299 
					                                   f32_4 %319 = OpFAdd %317 %318 
					                                                  OpStore %299 %319 
					                                   f32_4 %320 = OpLoad %175 
					                                   f32_4 %321 = OpLoad %299 
					                                   f32_4 %322 = OpFAdd %320 %321 
					                                                  OpStore %299 %322 
					                                   f32_4 %323 = OpLoad %230 
					                                   f32_4 %324 = OpLoad %299 
					                                   f32_4 %325 = OpFAdd %323 %324 
					                                                  OpStore %299 %325 
					                                   f32_4 %326 = OpLoad %199 
					                                   f32_4 %327 = OpLoad %299 
					                                   f32_4 %328 = OpFAdd %326 %327 
					                                                  OpStore %299 %328 
					                                   f32_4 %329 = OpLoad %9 
					                                   f32_4 %330 = OpVectorShuffle %329 %329 2 3 2 3 
					                          Uniform f32_4* %331 = OpAccessChain %17 %32 
					                                   f32_4 %332 = OpLoad %331 
					                                   f32_4 %333 = OpVectorShuffle %332 %332 0 1 0 1 
					                                   f32_4 %334 = OpFMul %330 %333 
					                                   f32_4 %336 = OpFAdd %334 %335 
					                                                  OpStore %185 %336 
					                                   f32_4 %337 = OpLoad %185 
					                          Uniform f32_4* %338 = OpAccessChain %17 %32 
					                                   f32_4 %339 = OpLoad %338 
					                                   f32_4 %340 = OpVectorShuffle %339 %339 0 1 0 1 
					                                   f32_4 %341 = OpFDiv %337 %340 
					                                                  OpStore %185 %341 
					                     read_only Texture2D %342 = OpLoad %50 
					                                 sampler %343 = OpLoad %54 
					              read_only Texture2DSampled %344 = OpSampledImage %342 %343 
					                                   f32_4 %345 = OpLoad %185 
					                                   f32_2 %346 = OpVectorShuffle %345 %345 2 3 
					                                   f32_4 %347 = OpImageSampleImplicitLod %344 %346 
					                                                  OpStore %269 %347 
					                     read_only Texture2D %348 = OpLoad %50 
					                                 sampler %349 = OpLoad %54 
					              read_only Texture2DSampled %350 = OpSampledImage %348 %349 
					                                   f32_4 %351 = OpLoad %185 
					                                   f32_2 %352 = OpVectorShuffle %351 %351 0 1 
					                                   f32_4 %353 = OpImageSampleImplicitLod %350 %352 
					                                                  OpStore %206 %353 
					                                   f32_4 %354 = OpLoad %299 
					                                   f32_4 %355 = OpLoad %269 
					                                   f32_4 %356 = OpFAdd %354 %355 
					                                                  OpStore %299 %356 
					                                   f32_4 %358 = OpLoad %9 
					                          Uniform f32_4* %359 = OpAccessChain %17 %32 
					                                   f32_4 %360 = OpLoad %359 
					                                   f32_4 %361 = OpVectorShuffle %360 %360 0 1 0 1 
					                                   f32_4 %362 = OpFMul %358 %361 
					                                   f32_4 %364 = OpFAdd %362 %363 
					                                                  OpStore %357 %364 
					                                   f32_4 %365 = OpLoad %9 
					                                   f32_4 %366 = OpVectorShuffle %365 %365 2 3 2 3 
					                          Uniform f32_4* %367 = OpAccessChain %17 %32 
					                                   f32_4 %368 = OpLoad %367 
					                                   f32_4 %369 = OpVectorShuffle %368 %368 0 1 0 1 
					                                   f32_4 %370 = OpFMul %366 %369 
					                                   f32_4 %372 = OpFAdd %370 %371 
					                                                  OpStore %9 %372 
					                                   f32_4 %373 = OpLoad %9 
					                          Uniform f32_4* %374 = OpAccessChain %17 %32 
					                                   f32_4 %375 = OpLoad %374 
					                                   f32_4 %376 = OpVectorShuffle %375 %375 0 1 0 1 
					                                   f32_4 %377 = OpFDiv %373 %376 
					                                                  OpStore %9 %377 
					                                   f32_4 %378 = OpLoad %357 
					                          Uniform f32_4* %379 = OpAccessChain %17 %32 
					                                   f32_4 %380 = OpLoad %379 
					                                   f32_4 %381 = OpVectorShuffle %380 %380 0 1 0 1 
					                                   f32_4 %382 = OpFDiv %378 %381 
					                                                  OpStore %357 %382 
					                     read_only Texture2D %384 = OpLoad %50 
					                                 sampler %385 = OpLoad %54 
					              read_only Texture2DSampled %386 = OpSampledImage %384 %385 
					                                   f32_4 %387 = OpLoad %357 
					                                   f32_2 %388 = OpVectorShuffle %387 %387 0 1 
					                                   f32_4 %389 = OpImageSampleImplicitLod %386 %388 
					                                                  OpStore %383 %389 
					                     read_only Texture2D %390 = OpLoad %50 
					                                 sampler %391 = OpLoad %54 
					              read_only Texture2DSampled %392 = OpSampledImage %390 %391 
					                                   f32_4 %393 = OpLoad %357 
					                                   f32_2 %394 = OpVectorShuffle %393 %393 2 3 
					                                   f32_4 %395 = OpImageSampleImplicitLod %392 %394 
					                                                  OpStore %269 %395 
					                                   f32_4 %396 = OpLoad %299 
					                                   f32_4 %397 = OpLoad %383 
					                                   f32_4 %398 = OpFAdd %396 %397 
					                                                  OpStore %299 %398 
					                                   f32_4 %399 = OpLoad %269 
					                                   f32_4 %400 = OpLoad %299 
					                                   f32_4 %401 = OpFAdd %399 %400 
					                                                  OpStore %299 %401 
					                                   f32_4 %402 = OpLoad %299 
					                                   f32_4 %403 = OpFMul %402 %254 
					                                                  OpStore %299 %403 
					                     read_only Texture2D %404 = OpLoad %50 
					                                 sampler %405 = OpLoad %54 
					              read_only Texture2DSampled %406 = OpSampledImage %404 %405 
					                                   f32_4 %407 = OpLoad %9 
					                                   f32_2 %408 = OpVectorShuffle %407 %407 0 1 
					                                   f32_4 %409 = OpImageSampleImplicitLod %406 %408 
					                                                  OpStore %269 %409 
					                     read_only Texture2D %411 = OpLoad %50 
					                                 sampler %412 = OpLoad %54 
					              read_only Texture2DSampled %413 = OpSampledImage %411 %412 
					                                   f32_4 %414 = OpLoad %9 
					                                   f32_2 %415 = OpVectorShuffle %414 %414 2 3 
					                                   f32_4 %416 = OpImageSampleImplicitLod %413 %415 
					                                                  OpStore %410 %416 
					                                   f32_4 %418 = OpLoad %410 
					                                   f32_4 %419 = OpLoad %269 
					                                   f32_4 %420 = OpFAdd %418 %419 
					                                                  OpStore %417 %420 
					                                   f32_4 %421 = OpLoad %206 
					                                   f32_4 %422 = OpLoad %417 
					                                   f32_4 %423 = OpFAdd %421 %422 
					                                                  OpStore %417 %423 
					                                   f32_4 %424 = OpLoad %89 
					                                   f32_4 %425 = OpLoad %417 
					                                   f32_4 %426 = OpFAdd %424 %425 
					                                                  OpStore %417 %426 
					                                   f32_4 %428 = OpLoad %82 
					                                   f32_4 %429 = OpLoad %89 
					                                   f32_4 %430 = OpFAdd %428 %429 
					                                                  OpStore %427 %430 
					                                   f32_4 %431 = OpLoad %82 
					                                   f32_4 %432 = OpLoad %417 
					                                   f32_4 %433 = OpFAdd %431 %432 
					                                                  OpStore %417 %433 
					                                   f32_4 %434 = OpLoad %47 
					                                   f32_4 %435 = OpLoad %417 
					                                   f32_4 %436 = OpFAdd %434 %435 
					                                                  OpStore %417 %436 
					                                   f32_4 %438 = OpLoad %47 
					                                   f32_4 %439 = OpLoad %427 
					                                   f32_4 %440 = OpFAdd %438 %439 
					                                                  OpStore %437 %440 
					                                   f32_4 %441 = OpLoad %61 
					                                   f32_4 %442 = OpLoad %437 
					                                   f32_4 %443 = OpFAdd %441 %442 
					                                                  OpStore %437 %443 
					                                   f32_4 %444 = OpLoad %61 
					                                   f32_4 %445 = OpLoad %417 
					                                   f32_4 %446 = OpFAdd %444 %445 
					                                                  OpStore %417 %446 
					                                   f32_4 %447 = OpLoad %116 
					                                   f32_4 %448 = OpLoad %417 
					                                   f32_4 %449 = OpFAdd %447 %448 
					                                                  OpStore %417 %449 
					                                   f32_4 %451 = OpLoad %116 
					                                   f32_4 %452 = OpLoad %437 
					                                   f32_4 %453 = OpFAdd %451 %452 
					                                                  OpStore %450 %453 
					                                   f32_4 %454 = OpLoad %168 
					                                   f32_4 %455 = OpLoad %450 
					                                   f32_4 %456 = OpFAdd %454 %455 
					                                                  OpStore %450 %456 
					                                   f32_4 %457 = OpLoad %168 
					                                   f32_4 %458 = OpLoad %417 
					                                   f32_4 %459 = OpFAdd %457 %458 
					                                                  OpStore %417 %459 
					                                   f32_4 %460 = OpLoad %417 
					                                   f32_4 %461 = OpFMul %460 %254 
					                                   f32_4 %462 = OpLoad %299 
					                                   f32_4 %463 = OpFNegate %462 
					                                   f32_4 %464 = OpFAdd %461 %463 
					                                                  OpStore %417 %464 
					                                   f32_4 %465 = OpLoad %417 
					                                   f32_4 %466 = OpExtInst %1 4 %465 
					                                   f32_4 %467 = OpLoad %96 
					                                   f32_4 %468 = OpExtInst %1 4 %467 
					                                   f32_4 %469 = OpFAdd %466 %468 
					                                                  OpStore %417 %469 
					                                   f32_4 %470 = OpLoad %417 
					                                   f32_4 %473 = OpFMul %470 %472 
					                                                  OpStore %417 %473 
					                                   f32_4 %474 = OpLoad %417 
					                                   f32_4 %475 = OpLoad %417 
					                                     f32 %476 = OpDot %474 %475 
					                            Private f32* %480 = OpAccessChain %417 %478 
					                                                  OpStore %480 %476 
					                            Private f32* %481 = OpAccessChain %417 %478 
					                                     f32 %482 = OpLoad %481 
					                                     f32 %483 = OpExtInst %1 31 %482 
					                            Private f32* %484 = OpAccessChain %9 %478 
					                                                  OpStore %484 %483 
					                                   f32_4 %485 = OpLoad %175 
					                                   f32_4 %486 = OpLoad %450 
					                                   f32_4 %487 = OpFAdd %485 %486 
					                                                  OpStore %450 %487 
					                                   f32_4 %488 = OpLoad %230 
					                                   f32_4 %489 = OpLoad %450 
					                                   f32_4 %490 = OpFAdd %488 %489 
					                                                  OpStore %450 %490 
					                                   f32_4 %491 = OpLoad %199 
					                                   f32_4 %492 = OpLoad %450 
					                                   f32_4 %493 = OpFAdd %491 %492 
					                                                  OpStore %450 %493 
					                            Uniform f32* %499 = OpAccessChain %17 %497 
					                                     f32 %500 = OpLoad %499 
					                                     f32 %502 = OpFAdd %500 %501 
					                            Private f32* %503 = OpAccessChain %496 %478 
					                                                  OpStore %503 %502 
					                            Private f32* %507 = OpAccessChain %496 %478 
					                                     f32 %508 = OpLoad %507 
					                            Private f32* %509 = OpAccessChain %9 %478 
					                                     f32 %510 = OpLoad %509 
					                                    bool %511 = OpFOrdLessThan %508 %510 
					                                                  OpStore %506 %511 
					                                   f32_4 %512 = OpLoad %450 
					                                   f32_3 %513 = OpVectorShuffle %512 %512 0 1 2 
					                                   f32_3 %516 = OpFMul %513 %515 
					                                                  OpStore %496 %516 
					                            Private f32* %520 = OpAccessChain %450 %519 
					                                     f32 %521 = OpLoad %520 
					                                     f32 %522 = OpFMul %521 %253 
					                             Output f32* %524 = OpAccessChain %518 %519 
					                                                  OpStore %524 %522 
					                                   f32_3 %525 = OpLoad %496 
					                                   f32_3 %526 = OpExtInst %1 8 %525 
					                                                  OpStore %496 %526 
					                                   f32_3 %527 = OpLoad %496 
					                            Uniform f32* %529 = OpAccessChain %17 %528 
					                                     f32 %530 = OpLoad %529 
					                            Uniform f32* %531 = OpAccessChain %17 %528 
					                                     f32 %532 = OpLoad %531 
					                            Uniform f32* %533 = OpAccessChain %17 %528 
					                                     f32 %534 = OpLoad %533 
					                                   f32_3 %535 = OpCompositeConstruct %530 %532 %534 
					                                     f32 %536 = OpCompositeExtract %535 0 
					                                     f32 %537 = OpCompositeExtract %535 1 
					                                     f32 %538 = OpCompositeExtract %535 2 
					                                   f32_3 %539 = OpCompositeConstruct %536 %537 %538 
					                                   f32_3 %540 = OpFDiv %527 %539 
					                                                  OpStore %496 %540 
					                                    bool %541 = OpLoad %506 
					                                                  OpSelectionMerge %545 None 
					                                                  OpBranchConditional %541 %544 %547 
					                                         %544 = OpLabel 
					                                                  OpStore %543 %546 
					                                                  OpBranch %545 
					                                         %547 = OpLabel 
					                                   f32_3 %548 = OpLoad %496 
					                                                  OpStore %543 %548 
					                                                  OpBranch %545 
					                                         %545 = OpLabel 
					                                   f32_3 %549 = OpLoad %543 
					                                   f32_4 %550 = OpLoad %518 
					                                   f32_4 %551 = OpVectorShuffle %550 %549 4 5 6 3 
					                                                  OpStore %518 %551 
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
						float _EdgeSize;
						float _ColorLevel;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec4 u_xlat16_5;
					vec4 u_xlat6;
					vec4 u_xlat16_6;
					vec4 u_xlat10_6;
					vec2 u_xlat7;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat10_9;
					vec4 u_xlat10;
					vec4 u_xlat16_10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec4 u_xlat10_11;
					vec4 u_xlat10_12;
					vec4 u_xlat13;
					vec4 u_xlat16_13;
					vec4 u_xlat10_13;
					vec4 u_xlat10_14;
					vec3 u_xlat15;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat1 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, -1.0, 0.0, 1.0);
					    u_xlat1 = u_xlat1 / _ScreenResolution.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat3 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 1.0, 1.0, 0.0);
					    u_xlat3 = u_xlat3 / _ScreenResolution.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.zw);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_5 = u_xlat10_2 + u_xlat10_4;
					    u_xlat6 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 2.0, 1.0, -2.0);
					    u_xlat6 = u_xlat6 / _ScreenResolution.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.zw);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_7;
					    u_xlat7.xy = u_xlat0.zw * _ScreenResolution.xy;
					    u_xlat7.xy = u_xlat7.xy / _ScreenResolution.xy;
					    u_xlat10_7 = texture(_MainTex, u_xlat7.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_7;
					    u_xlat8 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -1.0, -1.0, 1.0);
					    u_xlat8 = u_xlat8 / _ScreenResolution.xyxy;
					    u_xlat10_9 = texture(_MainTex, u_xlat8.xy);
					    u_xlat10_8 = texture(_MainTex, u_xlat8.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_9;
					    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -2.0, -1.0, -2.0);
					    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
					    u_xlat10_11 = texture(_MainTex, u_xlat10.xy);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_11;
					    u_xlat11 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 0.0, -1.0, -1.0);
					    u_xlat11 = u_xlat11 / _ScreenResolution.xyxy;
					    u_xlat10_12 = texture(_MainTex, u_xlat11.xy);
					    u_xlat10_11 = texture(_MainTex, u_xlat11.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_12;
					    u_xlat16_5 = u_xlat10_11 + u_xlat16_5;
					    u_xlat16_5 = u_xlat10_10 + u_xlat16_5;
					    u_xlat16_5 = u_xlat16_5 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 2.0, 0.0, 2.0);
					    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
					    u_xlat10_13 = texture(_MainTex, u_xlat10.xy);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.zw);
					    u_xlat16_13 = u_xlat10_3 + u_xlat10_13;
					    u_xlat16_13 = u_xlat10_4 + u_xlat16_13;
					    u_xlat16_10 = u_xlat10_10 + u_xlat16_13;
					    u_xlat16_10 = u_xlat10_1 + u_xlat16_10;
					    u_xlat16_10 = u_xlat10_7 + u_xlat16_10;
					    u_xlat16_6 = u_xlat10_6 + u_xlat16_10;
					    u_xlat16_6 = u_xlat10_8 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_12 + u_xlat16_6;
					    u_xlat16_5 = u_xlat16_6 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat16_5);
					    u_xlat16_6 = u_xlat10_1 + u_xlat10_7;
					    u_xlat16_6 = u_xlat10_9 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_8 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_12 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_11 + u_xlat16_6;
					    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, -1.0, -2.0, 1.0);
					    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
					    u_xlat10_13 = texture(_MainTex, u_xlat10.zw);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.xy);
					    u_xlat16_6 = u_xlat16_6 + u_xlat10_13;
					    u_xlat13 = u_xlat0 * _ScreenResolution.xyxy + vec4(-2.0, 0.0, -2.0, -1.0);
					    u_xlat0 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, 1.0, 2.0, 0.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
					    u_xlat13 = u_xlat13 / _ScreenResolution.xyxy;
					    u_xlat10_14 = texture(_MainTex, u_xlat13.xy);
					    u_xlat10_13 = texture(_MainTex, u_xlat13.zw);
					    u_xlat16_6 = u_xlat16_6 + u_xlat10_14;
					    u_xlat16_6 = u_xlat10_13 + u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat10_13 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_13;
					    u_xlat16_0 = u_xlat10_10 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat16_3 = u_xlat10_4 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_4 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    u_xlat16_2 = u_xlat10_2 + u_xlat16_3;
					    u_xlat16_2 = u_xlat10_1 + u_xlat16_2;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_7 + u_xlat16_0;
					    u_xlat16_1 = u_xlat10_7 + u_xlat16_2;
					    u_xlat16_1 = u_xlat10_9 + u_xlat16_1;
					    u_xlat16_0 = u_xlat10_9 + u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat16_6);
					    u_xlat16_0 = abs(u_xlat16_0) + abs(u_xlat16_5);
					    u_xlat16_0 = u_xlat16_0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_0.x = dot(u_xlat16_0, u_xlat16_0);
					    u_xlat0.x = sqrt(u_xlat16_0.x);
					    u_xlat16_1 = u_xlat10_8 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_12 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_11 + u_xlat16_1;
					    u_xlat15.x = _EdgeSize + 0.0500000007;
					    u_xlatb0 = u_xlat15.x<u_xlat0.x;
					    u_xlat15.xyz = u_xlat16_1.xyz * vec3(0.777777791, 0.777777791, 0.777777791);
					    SV_Target0.w = u_xlat16_1.w * 0.111111112;
					    u_xlat15.xyz = floor(u_xlat15.xyz);
					    u_xlat15.xyz = u_xlat15.xyz / vec3(vec3(_ColorLevel, _ColorLevel, _ColorLevel));
					    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat15.xyz;
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