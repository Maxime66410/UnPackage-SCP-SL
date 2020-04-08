Shader "CameraFilterPack/Drawing_Paper2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 21293
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
					uniform 	vec4 _PColor;
					uniform 	vec4 _PColor2;
					uniform 	float _TimeX;
					uniform 	float _Value1;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform 	float _Value7;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					float u_xlat7;
					vec3 u_xlat8;
					vec2 u_xlat14;
					float u_xlat16_14;
					float u_xlat16_15;
					vec2 u_xlat17;
					void main()
					{
					    u_xlat0.x = _TimeX * _Value4;
					    u_xlat0.x = u_xlat0.x * 10.0;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat1.x * 0.0199999996;
					    u_xlat0.x = u_xlat0.x * 0.0199999996;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat14.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex2, u_xlat14.xy);
					    u_xlat16_15 = u_xlat10_1.z * 0.0199999996;
					    u_xlat2.x = u_xlat0.y * 0.0833333358 + u_xlat16_15;
					    u_xlat2.y = u_xlat0.x * 0.0833333358 + u_xlat16_15;
					    u_xlat3.y = _Value1;
					    u_xlat3.x = float(0.0);
					    u_xlat17.x = float(0.0);
					    u_xlat4 = u_xlat14.xyxy + u_xlat3.yxxy;
					    u_xlat4 = u_xlat2.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat4;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat10_6 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_5.xyz = (-u_xlat10_5.xyz) + u_xlat10_6.xyz;
					    u_xlat16_5.xyz = -abs(u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_0 = u_xlat16_5.y * u_xlat16_5.x;
					    u_xlat16_0 = u_xlat16_5.z * u_xlat16_0;
					    u_xlat16_0 = log2(u_xlat16_0);
					    u_xlat7 = _Value2 * 25.0;
					    u_xlat0.x = u_xlat16_0 * u_xlat7;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat0.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat17.y = (-_Value1);
					    u_xlat3 = u_xlat14.xyxy + u_xlat17.yxxy;
					    u_xlat14.xy = u_xlat14.xy + u_xlat2.xy;
					    u_xlat2 = u_xlat2.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat3;
					    u_xlat10_3 = texture(_MainTex2, u_xlat14.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2.xyz = u_xlat10_6.xyz + (-u_xlat10_2.xyz);
					    u_xlat16_2.xyz = -abs(u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyw = u_xlat10_6.xyz + (-u_xlat10_5.xyz);
					    u_xlat16_3.xyw = -abs(u_xlat16_3.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_3.xyw = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_14 = u_xlat16_3.y * u_xlat16_3.x;
					    u_xlat16_14 = u_xlat16_3.w * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat14.x = u_xlat16_14 * u_xlat7;
					    u_xlat14.x = exp2(u_xlat14.x);
					    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat16_3.xyw = (-u_xlat10_4.xyz) + u_xlat10_6.xyz;
					    u_xlat16_3.xyw = -abs(u_xlat16_3.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_3.xyw = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_14 = u_xlat16_3.y * u_xlat16_3.x;
					    u_xlat16_14 = u_xlat16_3.w * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat14.x = u_xlat16_14 * u_xlat7;
					    u_xlat14.x = exp2(u_xlat14.x);
					    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat16_14 = u_xlat16_2.y * u_xlat16_2.x;
					    u_xlat16_14 = u_xlat16_2.z * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat7 = u_xlat16_14 * u_xlat7;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = dot(vec4(u_xlat7), vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat7 * u_xlat0.x;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat10_3.z * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 1.5;
					    u_xlat7 = (-_Value5) + 1.0;
					    u_xlat16_14 = (-u_xlat10_1.y) + 1.0;
					    u_xlat7 = u_xlat7 * (-u_xlat16_14) + u_xlat16_14;
					    u_xlat0.x = u_xlat7 * (-u_xlat0.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat8.xyz = (-u_xlat10_1.xxx) + _PColor2.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value6, _Value6, _Value6)) * u_xlat8.xyz + u_xlat10_1.xxx;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _PColor.xyz;
					    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = (-vec3(u_xlat16_14)) * vec3(0.5, 0.5, 0.5) + u_xlat0.xyw;
					    u_xlat0.xyz = (-u_xlat10_6.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value7, _Value7, _Value7)) * u_xlat0.xyz + u_xlat10_6.xyz;
					    SV_Target0.w = 1.0;
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
					; Bound: 522
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %65 %498 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpMemberDecorate %11 5 Offset 11 
					                                                      OpMemberDecorate %11 6 Offset 11 
					                                                      OpMemberDecorate %11 7 Offset 11 
					                                                      OpMemberDecorate %11 8 Offset 11 
					                                                      OpMemberDecorate %11 9 Offset 11 
					                                                      OpMemberDecorate %11 10 Offset 11 
					                                                      OpMemberDecorate %11 11 RelaxedPrecision 
					                                                      OpMemberDecorate %11 11 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 65 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %71 RelaxedPrecision 
					                                                      OpDecorate %74 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %102 DescriptorSet 102 
					                                                      OpDecorate %102 Binding 102 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %106 DescriptorSet 106 
					                                                      OpDecorate %106 Binding 106 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %154 DescriptorSet 154 
					                                                      OpDecorate %154 Binding 154 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %156 DescriptorSet 156 
					                                                      OpDecorate %156 Binding 156 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %165 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %244 RelaxedPrecision 
					                                                      OpDecorate %248 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
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
					                                                      OpDecorate %323 RelaxedPrecision 
					                                                      OpDecorate %325 RelaxedPrecision 
					                                                      OpDecorate %326 RelaxedPrecision 
					                                                      OpDecorate %328 RelaxedPrecision 
					                                                      OpDecorate %329 RelaxedPrecision 
					                                                      OpDecorate %330 RelaxedPrecision 
					                                                      OpDecorate %331 RelaxedPrecision 
					                                                      OpDecorate %332 RelaxedPrecision 
					                                                      OpDecorate %333 RelaxedPrecision 
					                                                      OpDecorate %347 RelaxedPrecision 
					                                                      OpDecorate %349 RelaxedPrecision 
					                                                      OpDecorate %350 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %353 RelaxedPrecision 
					                                                      OpDecorate %354 RelaxedPrecision 
					                                                      OpDecorate %355 RelaxedPrecision 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %357 RelaxedPrecision 
					                                                      OpDecorate %379 RelaxedPrecision 
					                                                      OpDecorate %396 RelaxedPrecision 
					                                                      OpDecorate %398 RelaxedPrecision 
					                                                      OpDecorate %399 RelaxedPrecision 
					                                                      OpDecorate %400 RelaxedPrecision 
					                                                      OpDecorate %409 RelaxedPrecision 
					                                                      OpDecorate %410 RelaxedPrecision 
					                                                      OpDecorate %412 RelaxedPrecision 
					                                                      OpDecorate %431 RelaxedPrecision 
					                                                      OpDecorate %432 RelaxedPrecision 
					                                                      OpDecorate %433 RelaxedPrecision 
					                                                      OpDecorate %456 RelaxedPrecision 
					                                                      OpDecorate %457 RelaxedPrecision 
					                                                      OpDecorate %479 RelaxedPrecision 
					                                                      OpDecorate %490 RelaxedPrecision 
					                                                      OpDecorate %491 RelaxedPrecision 
					                                                      OpDecorate %498 Location 498 
					                                                      OpDecorate %514 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypeStruct %7 %7 %6 %6 %6 %6 %6 %6 %6 %6 %10 %7 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32_2; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 2 
					                                              %16 = OpTypePointer Uniform %6 
					                                          i32 %19 = OpConstant 6 
					                                              %23 = OpTypeInt 32 0 
					                                          u32 %24 = OpConstant 0 
					                                              %25 = OpTypePointer Private %6 
					                                          f32 %29 = OpConstant 3,674022E-40 
					                               Private f32_4* %32 = OpVariable Private 
					                                          f32 %43 = OpConstant 3,674022E-40 
					                                          u32 %45 = OpConstant 1 
					                                              %56 = OpTypeBool 
					                                              %57 = OpTypePointer Private %56 
					                                Private bool* %58 = OpVariable Private 
					                                          i32 %59 = OpConstant 10 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                              %64 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %67 = OpConstant 11 
					                                              %68 = OpTypePointer Uniform %7 
					                                 Private f32* %79 = OpVariable Private 
					                                          f32 %83 = OpConstant 3,674022E-40 
					                                              %86 = OpTypePointer Function %6 
					                                          u32 %95 = OpConstant 2 
					                                              %97 = OpTypeVector %6 3 
					                                              %98 = OpTypePointer Private %97 
					                               Private f32_3* %99 = OpVariable Private 
					                                             %100 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %101 = OpTypePointer UniformConstant %100 
					        UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
					                                             %104 = OpTypeSampler 
					                                             %105 = OpTypePointer UniformConstant %104 
					                    UniformConstant sampler* %106 = OpVariable UniformConstant 
					                                             %108 = OpTypeSampledImage %100 
					                                Private f32* %114 = OpVariable Private 
					                                             %118 = OpTypePointer Private %10 
					                              Private f32_2* %119 = OpVariable Private 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                         i32 %133 = OpConstant 3 
					                              Private f32_2* %138 = OpVariable Private 
					                              Private f32_4* %140 = OpVariable Private 
					                                         f32 %148 = OpConstant 3,674022E-40 
					                                       f32_4 %149 = OpConstantComposite %148 %148 %148 %148 
					                              Private f32_3* %153 = OpVariable Private 
					        UniformConstant read_only Texture2D* %154 = OpVariable UniformConstant 
					                    UniformConstant sampler* %156 = OpVariable UniformConstant 
					                              Private f32_3* %163 = OpVariable Private 
					                              Private f32_3* %171 = OpVariable Private 
					                              Private f32_3* %179 = OpVariable Private 
					                                       f32_3 %187 = OpConstantComposite %83 %83 %83 
					                                       f32_3 %190 = OpConstantComposite %62 %62 %62 
					                                Private f32* %192 = OpVariable Private 
					                                Private f32* %204 = OpVariable Private 
					                                         i32 %205 = OpConstant 4 
					                                         f32 %208 = OpConstant 3,674022E-40 
					                                       f32_4 %220 = OpConstantComposite %83 %83 %83 %83 
					                              Private f32_4* %227 = OpVariable Private 
					                                Private f32* %242 = OpVariable Private 
					                              Private f32_3* %249 = OpVariable Private 
					                              Private f32_3* %257 = OpVariable Private 
					                              Private f32_3* %265 = OpVariable Private 
					                              Private f32_3* %276 = OpVariable Private 
					                                Private f32* %287 = OpVariable Private 
					                                         i32 %386 = OpConstant 5 
					                                         f32 %393 = OpConstant 3,674022E-40 
					                                Private f32* %396 = OpVariable Private 
					                                         i32 %401 = OpConstant 7 
					                                         i32 %434 = OpConstant 1 
					                                         i32 %441 = OpConstant 8 
					                              Private f32_3* %461 = OpVariable Private 
					                                         i32 %465 = OpConstant 0 
					                                         f32 %482 = OpConstant 3,674022E-40 
					                                       f32_3 %483 = OpConstantComposite %482 %482 %482 
					                                             %497 = OpTypePointer Output %7 
					                               Output f32_4* %498 = OpVariable Output 
					                                         i32 %499 = OpConstant 9 
					                                         u32 %518 = OpConstant 3 
					                                             %519 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %87 = OpVariable Function 
					                                 Uniform f32* %17 = OpAccessChain %13 %15 
					                                          f32 %18 = OpLoad %17 
					                                 Uniform f32* %20 = OpAccessChain %13 %19 
					                                          f32 %21 = OpLoad %20 
					                                          f32 %22 = OpFMul %18 %21 
					                                 Private f32* %26 = OpAccessChain %9 %24 
					                                                      OpStore %26 %22 
					                                 Private f32* %27 = OpAccessChain %9 %24 
					                                          f32 %28 = OpLoad %27 
					                                          f32 %30 = OpFMul %28 %29 
					                                 Private f32* %31 = OpAccessChain %9 %24 
					                                                      OpStore %31 %30 
					                                 Private f32* %33 = OpAccessChain %9 %24 
					                                          f32 %34 = OpLoad %33 
					                                          f32 %35 = OpExtInst %1 14 %34 
					                                 Private f32* %36 = OpAccessChain %32 %24 
					                                                      OpStore %36 %35 
					                                 Private f32* %37 = OpAccessChain %9 %24 
					                                          f32 %38 = OpLoad %37 
					                                          f32 %39 = OpExtInst %1 13 %38 
					                                 Private f32* %40 = OpAccessChain %9 %24 
					                                                      OpStore %40 %39 
					                                 Private f32* %41 = OpAccessChain %32 %24 
					                                          f32 %42 = OpLoad %41 
					                                          f32 %44 = OpFMul %42 %43 
					                                 Private f32* %46 = OpAccessChain %9 %45 
					                                                      OpStore %46 %44 
					                                 Private f32* %47 = OpAccessChain %9 %24 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpFMul %48 %43 
					                                 Private f32* %50 = OpAccessChain %9 %24 
					                                                      OpStore %50 %49 
					                                        f32_4 %51 = OpLoad %9 
					                                        f32_2 %52 = OpVectorShuffle %51 %51 0 1 
					                                        f32_2 %53 = OpExtInst %1 8 %52 
					                                        f32_4 %54 = OpLoad %9 
					                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
					                                                      OpStore %9 %55 
					                                 Uniform f32* %60 = OpAccessChain %13 %59 %45 
					                                          f32 %61 = OpLoad %60 
					                                         bool %63 = OpFOrdLessThan %61 %62 
					                                                      OpStore %58 %63 
					                                        f32_2 %66 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %69 = OpAccessChain %13 %67 
					                                        f32_4 %70 = OpLoad %69 
					                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
					                                        f32_2 %72 = OpFMul %66 %71 
					                               Uniform f32_4* %73 = OpAccessChain %13 %67 
					                                        f32_4 %74 = OpLoad %73 
					                                        f32_2 %75 = OpVectorShuffle %74 %74 2 3 
					                                        f32_2 %76 = OpFAdd %72 %75 
					                                        f32_4 %77 = OpLoad %32 
					                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 2 3 
					                                                      OpStore %32 %78 
					                                 Private f32* %80 = OpAccessChain %32 %45 
					                                          f32 %81 = OpLoad %80 
					                                          f32 %82 = OpFNegate %81 
					                                          f32 %84 = OpFAdd %82 %83 
					                                                      OpStore %79 %84 
					                                         bool %85 = OpLoad %58 
					                                                      OpSelectionMerge %89 None 
					                                                      OpBranchConditional %85 %88 %91 
					                                              %88 = OpLabel 
					                                          f32 %90 = OpLoad %79 
					                                                      OpStore %87 %90 
					                                                      OpBranch %89 
					                                              %91 = OpLabel 
					                                 Private f32* %92 = OpAccessChain %32 %45 
					                                          f32 %93 = OpLoad %92 
					                                                      OpStore %87 %93 
					                                                      OpBranch %89 
					                                              %89 = OpLabel 
					                                          f32 %94 = OpLoad %87 
					                                 Private f32* %96 = OpAccessChain %32 %95 
					                                                      OpStore %96 %94 
					                         read_only Texture2D %103 = OpLoad %102 
					                                     sampler %107 = OpLoad %106 
					                  read_only Texture2DSampled %109 = OpSampledImage %103 %107 
					                                       f32_4 %110 = OpLoad %32 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 0 2 
					                                       f32_4 %112 = OpImageSampleImplicitLod %109 %111 
					                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
					                                                      OpStore %99 %113 
					                                Private f32* %115 = OpAccessChain %99 %95 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFMul %116 %43 
					                                                      OpStore %114 %117 
					                                Private f32* %120 = OpAccessChain %9 %45 
					                                         f32 %121 = OpLoad %120 
					                                         f32 %123 = OpFMul %121 %122 
					                                         f32 %124 = OpLoad %114 
					                                         f32 %125 = OpFAdd %123 %124 
					                                Private f32* %126 = OpAccessChain %119 %24 
					                                                      OpStore %126 %125 
					                                Private f32* %127 = OpAccessChain %9 %24 
					                                         f32 %128 = OpLoad %127 
					                                         f32 %129 = OpFMul %128 %122 
					                                         f32 %130 = OpLoad %114 
					                                         f32 %131 = OpFAdd %129 %130 
					                                Private f32* %132 = OpAccessChain %119 %45 
					                                                      OpStore %132 %131 
					                                Uniform f32* %134 = OpAccessChain %13 %133 
					                                         f32 %135 = OpLoad %134 
					                                Private f32* %136 = OpAccessChain %9 %45 
					                                                      OpStore %136 %135 
					                                Private f32* %137 = OpAccessChain %9 %24 
					                                                      OpStore %137 %62 
					                                Private f32* %139 = OpAccessChain %138 %24 
					                                                      OpStore %139 %62 
					                                       f32_4 %141 = OpLoad %9 
					                                       f32_4 %142 = OpVectorShuffle %141 %141 1 0 0 1 
					                                       f32_4 %143 = OpLoad %32 
					                                       f32_4 %144 = OpVectorShuffle %143 %143 0 1 0 1 
					                                       f32_4 %145 = OpFAdd %142 %144 
					                                                      OpStore %140 %145 
					                                       f32_2 %146 = OpLoad %119 
					                                       f32_4 %147 = OpVectorShuffle %146 %146 0 1 0 1 
					                                       f32_4 %150 = OpFMul %147 %149 
					                                       f32_4 %151 = OpLoad %140 
					                                       f32_4 %152 = OpFAdd %150 %151 
					                                                      OpStore %140 %152 
					                         read_only Texture2D %155 = OpLoad %154 
					                                     sampler %157 = OpLoad %156 
					                  read_only Texture2DSampled %158 = OpSampledImage %155 %157 
					                                       f32_4 %159 = OpLoad %140 
					                                       f32_2 %160 = OpVectorShuffle %159 %159 0 1 
					                                       f32_4 %161 = OpImageSampleImplicitLod %158 %160 
					                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
					                                                      OpStore %153 %162 
					                         read_only Texture2D %164 = OpLoad %154 
					                                     sampler %165 = OpLoad %156 
					                  read_only Texture2DSampled %166 = OpSampledImage %164 %165 
					                                       f32_4 %167 = OpLoad %140 
					                                       f32_2 %168 = OpVectorShuffle %167 %167 2 3 
					                                       f32_4 %169 = OpImageSampleImplicitLod %166 %168 
					                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
					                                                      OpStore %163 %170 
					                         read_only Texture2D %172 = OpLoad %154 
					                                     sampler %173 = OpLoad %156 
					                  read_only Texture2DSampled %174 = OpSampledImage %172 %173 
					                                       f32_4 %175 = OpLoad %32 
					                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
					                                       f32_4 %177 = OpImageSampleImplicitLod %174 %176 
					                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
					                                                      OpStore %171 %178 
					                                       f32_3 %180 = OpLoad %153 
					                                       f32_3 %181 = OpFNegate %180 
					                                       f32_3 %182 = OpLoad %171 
					                                       f32_3 %183 = OpFAdd %181 %182 
					                                                      OpStore %179 %183 
					                                       f32_3 %184 = OpLoad %179 
					                                       f32_3 %185 = OpExtInst %1 4 %184 
					                                       f32_3 %186 = OpFNegate %185 
					                                       f32_3 %188 = OpFAdd %186 %187 
					                                                      OpStore %179 %188 
					                                       f32_3 %189 = OpLoad %179 
					                                       f32_3 %191 = OpExtInst %1 40 %189 %190 
					                                                      OpStore %179 %191 
					                                Private f32* %193 = OpAccessChain %179 %45 
					                                         f32 %194 = OpLoad %193 
					                                Private f32* %195 = OpAccessChain %179 %24 
					                                         f32 %196 = OpLoad %195 
					                                         f32 %197 = OpFMul %194 %196 
					                                                      OpStore %192 %197 
					                                Private f32* %198 = OpAccessChain %179 %95 
					                                         f32 %199 = OpLoad %198 
					                                         f32 %200 = OpLoad %192 
					                                         f32 %201 = OpFMul %199 %200 
					                                                      OpStore %192 %201 
					                                         f32 %202 = OpLoad %192 
					                                         f32 %203 = OpExtInst %1 30 %202 
					                                                      OpStore %192 %203 
					                                Uniform f32* %206 = OpAccessChain %13 %205 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %209 = OpFMul %207 %208 
					                                                      OpStore %204 %209 
					                                         f32 %210 = OpLoad %192 
					                                         f32 %211 = OpLoad %204 
					                                         f32 %212 = OpFMul %210 %211 
					                                Private f32* %213 = OpAccessChain %9 %24 
					                                                      OpStore %213 %212 
					                                Private f32* %214 = OpAccessChain %9 %24 
					                                         f32 %215 = OpLoad %214 
					                                         f32 %216 = OpExtInst %1 29 %215 
					                                Private f32* %217 = OpAccessChain %9 %24 
					                                                      OpStore %217 %216 
					                                       f32_4 %218 = OpLoad %9 
					                                       f32_4 %219 = OpVectorShuffle %218 %218 0 0 0 0 
					                                         f32 %221 = OpDot %219 %220 
					                                Private f32* %222 = OpAccessChain %9 %24 
					                                                      OpStore %222 %221 
					                                Uniform f32* %223 = OpAccessChain %13 %133 
					                                         f32 %224 = OpLoad %223 
					                                         f32 %225 = OpFNegate %224 
					                                Private f32* %226 = OpAccessChain %138 %45 
					                                                      OpStore %226 %225 
					                                       f32_2 %228 = OpLoad %138 
					                                       f32_4 %229 = OpVectorShuffle %228 %228 1 0 0 1 
					                                       f32_4 %230 = OpLoad %32 
					                                       f32_4 %231 = OpVectorShuffle %230 %230 0 1 0 1 
					                                       f32_4 %232 = OpFAdd %229 %231 
					                                                      OpStore %227 %232 
					                                       f32_4 %233 = OpLoad %32 
					                                       f32_2 %234 = OpVectorShuffle %233 %233 0 1 
					                                       f32_2 %235 = OpLoad %119 
					                                       f32_2 %236 = OpFAdd %234 %235 
					                                                      OpStore %138 %236 
					                                       f32_2 %237 = OpLoad %119 
					                                       f32_4 %238 = OpVectorShuffle %237 %237 0 1 0 1 
					                                       f32_4 %239 = OpFMul %238 %149 
					                                       f32_4 %240 = OpLoad %227 
					                                       f32_4 %241 = OpFAdd %239 %240 
					                                                      OpStore %32 %241 
					                         read_only Texture2D %243 = OpLoad %102 
					                                     sampler %244 = OpLoad %106 
					                  read_only Texture2DSampled %245 = OpSampledImage %243 %244 
					                                       f32_2 %246 = OpLoad %138 
					                                       f32_4 %247 = OpImageSampleImplicitLod %245 %246 
					                                         f32 %248 = OpCompositeExtract %247 2 
					                                                      OpStore %242 %248 
					                         read_only Texture2D %250 = OpLoad %154 
					                                     sampler %251 = OpLoad %156 
					                  read_only Texture2DSampled %252 = OpSampledImage %250 %251 
					                                       f32_4 %253 = OpLoad %32 
					                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
					                                       f32_4 %255 = OpImageSampleImplicitLod %252 %254 
					                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
					                                                      OpStore %249 %256 
					                         read_only Texture2D %258 = OpLoad %154 
					                                     sampler %259 = OpLoad %156 
					                  read_only Texture2DSampled %260 = OpSampledImage %258 %259 
					                                       f32_4 %261 = OpLoad %32 
					                                       f32_2 %262 = OpVectorShuffle %261 %261 2 3 
					                                       f32_4 %263 = OpImageSampleImplicitLod %260 %262 
					                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
					                                                      OpStore %257 %264 
					                                       f32_3 %266 = OpLoad %171 
					                                       f32_3 %267 = OpLoad %257 
					                                       f32_3 %268 = OpFNegate %267 
					                                       f32_3 %269 = OpFAdd %266 %268 
					                                                      OpStore %265 %269 
					                                       f32_3 %270 = OpLoad %265 
					                                       f32_3 %271 = OpExtInst %1 4 %270 
					                                       f32_3 %272 = OpFNegate %271 
					                                       f32_3 %273 = OpFAdd %272 %187 
					                                                      OpStore %265 %273 
					                                       f32_3 %274 = OpLoad %265 
					                                       f32_3 %275 = OpExtInst %1 40 %274 %190 
					                                                      OpStore %265 %275 
					                                       f32_3 %277 = OpLoad %171 
					                                       f32_3 %278 = OpLoad %249 
					                                       f32_3 %279 = OpFNegate %278 
					                                       f32_3 %280 = OpFAdd %277 %279 
					                                                      OpStore %276 %280 
					                                       f32_3 %281 = OpLoad %276 
					                                       f32_3 %282 = OpExtInst %1 4 %281 
					                                       f32_3 %283 = OpFNegate %282 
					                                       f32_3 %284 = OpFAdd %283 %187 
					                                                      OpStore %276 %284 
					                                       f32_3 %285 = OpLoad %276 
					                                       f32_3 %286 = OpExtInst %1 40 %285 %190 
					                                                      OpStore %276 %286 
					                                Private f32* %288 = OpAccessChain %276 %45 
					                                         f32 %289 = OpLoad %288 
					                                Private f32* %290 = OpAccessChain %276 %24 
					                                         f32 %291 = OpLoad %290 
					                                         f32 %292 = OpFMul %289 %291 
					                                                      OpStore %287 %292 
					                                Private f32* %293 = OpAccessChain %276 %95 
					                                         f32 %294 = OpLoad %293 
					                                         f32 %295 = OpLoad %287 
					                                         f32 %296 = OpFMul %294 %295 
					                                                      OpStore %287 %296 
					                                         f32 %297 = OpLoad %287 
					                                         f32 %298 = OpExtInst %1 30 %297 
					                                                      OpStore %287 %298 
					                                         f32 %299 = OpLoad %287 
					                                         f32 %300 = OpLoad %204 
					                                         f32 %301 = OpFMul %299 %300 
					                                                      OpStore %79 %301 
					                                         f32 %302 = OpLoad %79 
					                                         f32 %303 = OpExtInst %1 29 %302 
					                                                      OpStore %79 %303 
					                                         f32 %304 = OpLoad %79 
					                                       f32_4 %305 = OpCompositeConstruct %304 %304 %304 %304 
					                                         f32 %306 = OpDot %305 %220 
					                                                      OpStore %79 %306 
					                                         f32 %307 = OpLoad %79 
					                                Private f32* %308 = OpAccessChain %9 %24 
					                                         f32 %309 = OpLoad %308 
					                                         f32 %310 = OpFMul %307 %309 
					                                Private f32* %311 = OpAccessChain %9 %24 
					                                                      OpStore %311 %310 
					                                       f32_3 %312 = OpLoad %163 
					                                       f32_3 %313 = OpFNegate %312 
					                                       f32_3 %314 = OpLoad %171 
					                                       f32_3 %315 = OpFAdd %313 %314 
					                                                      OpStore %276 %315 
					                                       f32_3 %316 = OpLoad %276 
					                                       f32_3 %317 = OpExtInst %1 4 %316 
					                                       f32_3 %318 = OpFNegate %317 
					                                       f32_3 %319 = OpFAdd %318 %187 
					                                                      OpStore %276 %319 
					                                       f32_3 %320 = OpLoad %276 
					                                       f32_3 %321 = OpExtInst %1 40 %320 %190 
					                                                      OpStore %276 %321 
					                                Private f32* %322 = OpAccessChain %276 %45 
					                                         f32 %323 = OpLoad %322 
					                                Private f32* %324 = OpAccessChain %276 %24 
					                                         f32 %325 = OpLoad %324 
					                                         f32 %326 = OpFMul %323 %325 
					                                                      OpStore %287 %326 
					                                Private f32* %327 = OpAccessChain %276 %95 
					                                         f32 %328 = OpLoad %327 
					                                         f32 %329 = OpLoad %287 
					                                         f32 %330 = OpFMul %328 %329 
					                                                      OpStore %287 %330 
					                                         f32 %331 = OpLoad %287 
					                                         f32 %332 = OpExtInst %1 30 %331 
					                                                      OpStore %287 %332 
					                                         f32 %333 = OpLoad %287 
					                                         f32 %334 = OpLoad %204 
					                                         f32 %335 = OpFMul %333 %334 
					                                                      OpStore %79 %335 
					                                         f32 %336 = OpLoad %79 
					                                         f32 %337 = OpExtInst %1 29 %336 
					                                                      OpStore %79 %337 
					                                         f32 %338 = OpLoad %79 
					                                       f32_4 %339 = OpCompositeConstruct %338 %338 %338 %338 
					                                         f32 %340 = OpDot %339 %220 
					                                                      OpStore %79 %340 
					                                         f32 %341 = OpLoad %79 
					                                Private f32* %342 = OpAccessChain %9 %24 
					                                         f32 %343 = OpLoad %342 
					                                         f32 %344 = OpFMul %341 %343 
					                                Private f32* %345 = OpAccessChain %9 %24 
					                                                      OpStore %345 %344 
					                                Private f32* %346 = OpAccessChain %265 %45 
					                                         f32 %347 = OpLoad %346 
					                                Private f32* %348 = OpAccessChain %265 %24 
					                                         f32 %349 = OpLoad %348 
					                                         f32 %350 = OpFMul %347 %349 
					                                                      OpStore %287 %350 
					                                Private f32* %351 = OpAccessChain %265 %95 
					                                         f32 %352 = OpLoad %351 
					                                         f32 %353 = OpLoad %287 
					                                         f32 %354 = OpFMul %352 %353 
					                                                      OpStore %287 %354 
					                                         f32 %355 = OpLoad %287 
					                                         f32 %356 = OpExtInst %1 30 %355 
					                                                      OpStore %287 %356 
					                                         f32 %357 = OpLoad %287 
					                                         f32 %358 = OpLoad %204 
					                                         f32 %359 = OpFMul %357 %358 
					                                                      OpStore %204 %359 
					                                         f32 %360 = OpLoad %204 
					                                         f32 %361 = OpExtInst %1 29 %360 
					                                                      OpStore %204 %361 
					                                         f32 %362 = OpLoad %204 
					                                       f32_4 %363 = OpCompositeConstruct %362 %362 %362 %362 
					                                         f32 %364 = OpDot %363 %220 
					                                                      OpStore %204 %364 
					                                         f32 %365 = OpLoad %204 
					                                Private f32* %366 = OpAccessChain %9 %24 
					                                         f32 %367 = OpLoad %366 
					                                         f32 %368 = OpFMul %365 %367 
					                                Private f32* %369 = OpAccessChain %9 %24 
					                                                      OpStore %369 %368 
					                                Private f32* %370 = OpAccessChain %9 %24 
					                                         f32 %371 = OpLoad %370 
					                                         f32 %372 = OpExtInst %1 37 %371 %83 
					                                Private f32* %373 = OpAccessChain %9 %24 
					                                                      OpStore %373 %372 
					                                Private f32* %374 = OpAccessChain %9 %24 
					                                         f32 %375 = OpLoad %374 
					                                         f32 %376 = OpFNegate %375 
					                                         f32 %377 = OpFAdd %376 %83 
					                                Private f32* %378 = OpAccessChain %9 %24 
					                                                      OpStore %378 %377 
					                                         f32 %379 = OpLoad %242 
					                                Private f32* %380 = OpAccessChain %9 %24 
					                                         f32 %381 = OpLoad %380 
					                                         f32 %382 = OpFMul %379 %381 
					                                Private f32* %383 = OpAccessChain %9 %24 
					                                                      OpStore %383 %382 
					                                Private f32* %384 = OpAccessChain %9 %24 
					                                         f32 %385 = OpLoad %384 
					                                Uniform f32* %387 = OpAccessChain %13 %386 
					                                         f32 %388 = OpLoad %387 
					                                         f32 %389 = OpFMul %385 %388 
					                                Private f32* %390 = OpAccessChain %9 %24 
					                                                      OpStore %390 %389 
					                                Private f32* %391 = OpAccessChain %9 %24 
					                                         f32 %392 = OpLoad %391 
					                                         f32 %394 = OpFMul %392 %393 
					                                Private f32* %395 = OpAccessChain %9 %24 
					                                                      OpStore %395 %394 
					                                Private f32* %397 = OpAccessChain %99 %45 
					                                         f32 %398 = OpLoad %397 
					                                         f32 %399 = OpFNegate %398 
					                                         f32 %400 = OpFAdd %399 %83 
					                                                      OpStore %396 %400 
					                                Uniform f32* %402 = OpAccessChain %13 %401 
					                                         f32 %403 = OpLoad %402 
					                                         f32 %404 = OpFNegate %403 
					                                         f32 %405 = OpFAdd %404 %83 
					                                Private f32* %406 = OpAccessChain %138 %24 
					                                                      OpStore %406 %405 
					                                Private f32* %407 = OpAccessChain %138 %24 
					                                         f32 %408 = OpLoad %407 
					                                         f32 %409 = OpLoad %396 
					                                         f32 %410 = OpFNegate %409 
					                                         f32 %411 = OpFMul %408 %410 
					                                         f32 %412 = OpLoad %396 
					                                         f32 %413 = OpFAdd %411 %412 
					                                Private f32* %414 = OpAccessChain %138 %24 
					                                                      OpStore %414 %413 
					                                Private f32* %415 = OpAccessChain %138 %24 
					                                         f32 %416 = OpLoad %415 
					                                Private f32* %417 = OpAccessChain %9 %24 
					                                         f32 %418 = OpLoad %417 
					                                         f32 %419 = OpFNegate %418 
					                                         f32 %420 = OpFMul %416 %419 
					                                Private f32* %421 = OpAccessChain %9 %24 
					                                         f32 %422 = OpLoad %421 
					                                         f32 %423 = OpFAdd %420 %422 
					                                Private f32* %424 = OpAccessChain %9 %24 
					                                                      OpStore %424 %423 
					                                Private f32* %425 = OpAccessChain %9 %24 
					                                         f32 %426 = OpLoad %425 
					                                Uniform f32* %427 = OpAccessChain %13 %386 
					                                         f32 %428 = OpLoad %427 
					                                         f32 %429 = OpFMul %426 %428 
					                                Private f32* %430 = OpAccessChain %9 %24 
					                                                      OpStore %430 %429 
					                                       f32_3 %431 = OpLoad %99 
					                                       f32_3 %432 = OpVectorShuffle %431 %431 0 0 0 
					                                       f32_3 %433 = OpFNegate %432 
					                              Uniform f32_4* %435 = OpAccessChain %13 %434 
					                                       f32_4 %436 = OpLoad %435 
					                                       f32_3 %437 = OpVectorShuffle %436 %436 0 1 2 
					                                       f32_3 %438 = OpFAdd %433 %437 
					                                       f32_4 %439 = OpLoad %32 
					                                       f32_4 %440 = OpVectorShuffle %439 %438 4 5 6 3 
					                                                      OpStore %32 %440 
					                                Uniform f32* %442 = OpAccessChain %13 %441 
					                                         f32 %443 = OpLoad %442 
					                                Uniform f32* %444 = OpAccessChain %13 %441 
					                                         f32 %445 = OpLoad %444 
					                                Uniform f32* %446 = OpAccessChain %13 %441 
					                                         f32 %447 = OpLoad %446 
					                                       f32_3 %448 = OpCompositeConstruct %443 %445 %447 
					                                         f32 %449 = OpCompositeExtract %448 0 
					                                         f32 %450 = OpCompositeExtract %448 1 
					                                         f32 %451 = OpCompositeExtract %448 2 
					                                       f32_3 %452 = OpCompositeConstruct %449 %450 %451 
					                                       f32_4 %453 = OpLoad %32 
					                                       f32_3 %454 = OpVectorShuffle %453 %453 0 1 2 
					                                       f32_3 %455 = OpFMul %452 %454 
					                                       f32_3 %456 = OpLoad %99 
					                                       f32_3 %457 = OpVectorShuffle %456 %456 0 0 0 
					                                       f32_3 %458 = OpFAdd %455 %457 
					                                       f32_4 %459 = OpLoad %32 
					                                       f32_4 %460 = OpVectorShuffle %459 %458 4 5 6 3 
					                                                      OpStore %32 %460 
					                                       f32_4 %462 = OpLoad %32 
					                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
					                                       f32_3 %464 = OpFNegate %463 
					                              Uniform f32_4* %466 = OpAccessChain %13 %465 
					                                       f32_4 %467 = OpLoad %466 
					                                       f32_3 %468 = OpVectorShuffle %467 %467 0 1 2 
					                                       f32_3 %469 = OpFAdd %464 %468 
					                                                      OpStore %461 %469 
					                                       f32_4 %470 = OpLoad %9 
					                                       f32_3 %471 = OpVectorShuffle %470 %470 0 0 0 
					                                       f32_3 %472 = OpLoad %461 
					                                       f32_3 %473 = OpFMul %471 %472 
					                                       f32_4 %474 = OpLoad %32 
					                                       f32_3 %475 = OpVectorShuffle %474 %474 0 1 2 
					                                       f32_3 %476 = OpFAdd %473 %475 
					                                       f32_4 %477 = OpLoad %9 
					                                       f32_4 %478 = OpVectorShuffle %477 %476 4 1 5 6 
					                                                      OpStore %9 %478 
					                                         f32 %479 = OpLoad %396 
					                                       f32_3 %480 = OpCompositeConstruct %479 %479 %479 
					                                       f32_3 %481 = OpFNegate %480 
					                                       f32_3 %484 = OpFMul %481 %483 
					                                       f32_4 %485 = OpLoad %9 
					                                       f32_3 %486 = OpVectorShuffle %485 %485 0 2 3 
					                                       f32_3 %487 = OpFAdd %484 %486 
					                                       f32_4 %488 = OpLoad %9 
					                                       f32_4 %489 = OpVectorShuffle %488 %487 4 5 6 3 
					                                                      OpStore %9 %489 
					                                       f32_3 %490 = OpLoad %171 
					                                       f32_3 %491 = OpFNegate %490 
					                                       f32_4 %492 = OpLoad %9 
					                                       f32_3 %493 = OpVectorShuffle %492 %492 0 1 2 
					                                       f32_3 %494 = OpFAdd %491 %493 
					                                       f32_4 %495 = OpLoad %9 
					                                       f32_4 %496 = OpVectorShuffle %495 %494 4 5 6 3 
					                                                      OpStore %9 %496 
					                                Uniform f32* %500 = OpAccessChain %13 %499 
					                                         f32 %501 = OpLoad %500 
					                                Uniform f32* %502 = OpAccessChain %13 %499 
					                                         f32 %503 = OpLoad %502 
					                                Uniform f32* %504 = OpAccessChain %13 %499 
					                                         f32 %505 = OpLoad %504 
					                                       f32_3 %506 = OpCompositeConstruct %501 %503 %505 
					                                         f32 %507 = OpCompositeExtract %506 0 
					                                         f32 %508 = OpCompositeExtract %506 1 
					                                         f32 %509 = OpCompositeExtract %506 2 
					                                       f32_3 %510 = OpCompositeConstruct %507 %508 %509 
					                                       f32_4 %511 = OpLoad %9 
					                                       f32_3 %512 = OpVectorShuffle %511 %511 0 1 2 
					                                       f32_3 %513 = OpFMul %510 %512 
					                                       f32_3 %514 = OpLoad %171 
					                                       f32_3 %515 = OpFAdd %513 %514 
					                                       f32_4 %516 = OpLoad %498 
					                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
					                                                      OpStore %498 %517 
					                                 Output f32* %520 = OpAccessChain %498 %518 
					                                                      OpStore %520 %83 
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
						vec4 _PColor;
						vec4 _PColor2;
						float _TimeX;
						float _Value1;
						float _Value2;
						float _Value3;
						float _Value4;
						float _Value5;
						float _Value6;
						float _Value7;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					float u_xlat7;
					float u_xlat16_7;
					vec2 u_xlat14;
					float u_xlat16_14;
					bool u_xlatb14;
					float u_xlat21;
					void main()
					{
					    u_xlat0.x = _TimeX * _Value4;
					    u_xlat0.x = u_xlat0.x * 10.0;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat1.x * 0.0199999996;
					    u_xlat0.x = u_xlat0.x * 0.0199999996;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlatb14 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat21 = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb14) ? u_xlat21 : u_xlat1.y;
					    u_xlat10_2 = texture(_MainTex2, u_xlat1.xz);
					    u_xlat16_14 = u_xlat10_2.z * 0.0199999996;
					    u_xlat3.x = u_xlat0.y * 0.0833333358 + u_xlat16_14;
					    u_xlat3.y = u_xlat0.x * 0.0833333358 + u_xlat16_14;
					    u_xlat0.y = _Value1;
					    u_xlat0.x = float(0.0);
					    u_xlat14.x = float(0.0);
					    u_xlat4 = u_xlat0.yxxy + u_xlat1.xyxy;
					    u_xlat4 = u_xlat3.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat4;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat10_6 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_5.xyz = (-u_xlat10_5.xyz) + u_xlat10_6.xyz;
					    u_xlat16_5.xyz = -abs(u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_0 = u_xlat16_5.y * u_xlat16_5.x;
					    u_xlat16_0 = u_xlat16_5.z * u_xlat16_0;
					    u_xlat16_0 = log2(u_xlat16_0);
					    u_xlat7 = _Value2 * 25.0;
					    u_xlat0.x = u_xlat16_0 * u_xlat7;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat0.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat14.y = (-_Value1);
					    u_xlat5 = u_xlat14.yxxy + u_xlat1.xyxy;
					    u_xlat14.xy = u_xlat1.xy + u_xlat3.xy;
					    u_xlat1 = u_xlat3.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat5;
					    u_xlat10_3 = texture(_MainTex2, u_xlat14.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1.xyz = u_xlat10_6.xyz + (-u_xlat10_1.xyz);
					    u_xlat16_1.xyz = -abs(u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyw = u_xlat10_6.xyz + (-u_xlat10_5.xyz);
					    u_xlat16_3.xyw = -abs(u_xlat16_3.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_3.xyw = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_14 = u_xlat16_3.y * u_xlat16_3.x;
					    u_xlat16_14 = u_xlat16_3.w * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat14.x = u_xlat16_14 * u_xlat7;
					    u_xlat14.x = exp2(u_xlat14.x);
					    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat16_3.xyw = (-u_xlat10_4.xyz) + u_xlat10_6.xyz;
					    u_xlat16_3.xyw = -abs(u_xlat16_3.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_3.xyw = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_14 = u_xlat16_3.y * u_xlat16_3.x;
					    u_xlat16_14 = u_xlat16_3.w * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat14.x = u_xlat16_14 * u_xlat7;
					    u_xlat14.x = exp2(u_xlat14.x);
					    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat16_14 = u_xlat16_1.y * u_xlat16_1.x;
					    u_xlat16_14 = u_xlat16_1.z * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat7 = u_xlat16_14 * u_xlat7;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = dot(vec4(u_xlat7), vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat7 * u_xlat0.x;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat10_3.z * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 1.5;
					    u_xlat16_7 = (-u_xlat10_2.y) + 1.0;
					    u_xlat14.x = (-_Value5) + 1.0;
					    u_xlat14.x = u_xlat14.x * (-u_xlat16_7) + u_xlat16_7;
					    u_xlat0.x = u_xlat14.x * (-u_xlat0.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat1.xyz = (-u_xlat10_2.xxx) + _PColor2.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value6, _Value6, _Value6)) * u_xlat1.xyz + u_xlat10_2.xxx;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _PColor.xyz;
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = (-vec3(u_xlat16_7)) * vec3(0.5, 0.5, 0.5) + u_xlat0.xzw;
					    u_xlat0.xyz = (-u_xlat10_6.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value7, _Value7, _Value7)) * u_xlat0.xyz + u_xlat10_6.xyz;
					    SV_Target0.w = 1.0;
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