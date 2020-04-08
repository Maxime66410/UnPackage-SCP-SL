Shader "CameraFilterPack/Drawing_Paper3" {
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
			GpuProgramID 59063
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
					vec3 u_xlat2;
					vec4 u_xlat16_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat16_6;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					float u_xlat8;
					float u_xlat16_8;
					vec2 u_xlat16;
					float u_xlat16_16;
					vec2 u_xlat20;
					void main()
					{
					    u_xlat0.x = _TimeX * _Value4;
					    u_xlat0.x = u_xlat0.x * 10.0;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat1.x * 0.0199999996;
					    u_xlat0.x = u_xlat0.x * 0.0199999996;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat16.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex2, u_xlat16.xy);
					    u_xlat16_2 = u_xlat10_1.zxxx * vec4(0.0199999996, 0.833999991, 0.595200002, 0.375);
					    u_xlat3.x = u_xlat0.y * 0.0833333358 + u_xlat16_2.x;
					    u_xlat3.y = u_xlat0.x * 0.0833333358 + u_xlat16_2.x;
					    u_xlat4.y = _Value1;
					    u_xlat4.x = float(0.0);
					    u_xlat20.x = float(0.0);
					    u_xlat5 = u_xlat16.xyxy + u_xlat4.yxxy;
					    u_xlat5 = u_xlat3.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat5;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat10_7 = texture(_MainTex, u_xlat16.xy);
					    u_xlat16_6.xyz = (-u_xlat10_6.xyz) + u_xlat10_7.xyz;
					    u_xlat16_6.xyz = -abs(u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_0 = u_xlat16_6.y * u_xlat16_6.x;
					    u_xlat16_0 = u_xlat16_6.z * u_xlat16_0;
					    u_xlat16_0 = log2(u_xlat16_0);
					    u_xlat8 = _Value2 * 25.0;
					    u_xlat0.x = u_xlat16_0 * u_xlat8;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat0.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat20.y = (-_Value1);
					    u_xlat4 = u_xlat16.xyxy + u_xlat20.yxxy;
					    u_xlat16.xy = u_xlat16.xy + u_xlat3.xy;
					    u_xlat3 = u_xlat3.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat4;
					    u_xlat10_4 = texture(_MainTex2, u_xlat16.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_3.xyz = u_xlat10_7.xyz + (-u_xlat10_3.xyz);
					    u_xlat16_3.xyz = -abs(u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_4.xyw = u_xlat10_7.xyz + (-u_xlat10_6.xyz);
					    u_xlat16_4.xyw = -abs(u_xlat16_4.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_4.xyw = max(u_xlat16_4.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_16 = u_xlat16_4.y * u_xlat16_4.x;
					    u_xlat16_16 = u_xlat16_4.w * u_xlat16_16;
					    u_xlat16_16 = log2(u_xlat16_16);
					    u_xlat16.x = u_xlat16_16 * u_xlat8;
					    u_xlat16.x = exp2(u_xlat16.x);
					    u_xlat16.x = dot(u_xlat16.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat16.x * u_xlat0.x;
					    u_xlat16_4.xyw = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
					    u_xlat16_4.xyw = -abs(u_xlat16_4.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_4.xyw = max(u_xlat16_4.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_16 = u_xlat16_4.y * u_xlat16_4.x;
					    u_xlat16_16 = u_xlat16_4.w * u_xlat16_16;
					    u_xlat16_16 = log2(u_xlat16_16);
					    u_xlat16.x = u_xlat16_16 * u_xlat8;
					    u_xlat16.x = exp2(u_xlat16.x);
					    u_xlat16.x = dot(u_xlat16.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat16.x * u_xlat0.x;
					    u_xlat16_16 = u_xlat16_3.y * u_xlat16_3.x;
					    u_xlat16_16 = u_xlat16_3.z * u_xlat16_16;
					    u_xlat16_16 = log2(u_xlat16_16);
					    u_xlat8 = u_xlat16_16 * u_xlat8;
					    u_xlat8 = exp2(u_xlat8);
					    u_xlat8 = dot(vec4(u_xlat8), vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat8 * u_xlat0.x;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat10_4.z * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 1.5;
					    u_xlat16_8 = (-u_xlat10_1.y) + 1.0;
					    u_xlat1.xyz = (-u_xlat10_1.xxx) * vec3(0.833999991, 0.595200002, 0.375) + _PColor2.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value6, _Value6, _Value6)) * u_xlat1.xyz + u_xlat16_2.yzw;
					    u_xlat16.x = (-_Value5) + 1.0;
					    u_xlat8 = u_xlat16.x * (-u_xlat16_8) + u_xlat16_8;
					    u_xlat0.x = u_xlat8 * (-u_xlat0.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _PColor.xyz;
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = (-vec3(u_xlat8)) * vec3(0.100000001, 0.100000001, 0.100000001) + u_xlat0.xzw;
					    u_xlat0.xyz = (-u_xlat10_7.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value7, _Value7, _Value7)) * u_xlat0.xyz + u_xlat10_7.xyz;
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
					; Bound: 528
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %65 %504 
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
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %160 DescriptorSet 160 
					                                                      OpDecorate %160 Binding 160 
					                                                      OpDecorate %161 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %162 DescriptorSet 162 
					                                                      OpDecorate %162 Binding 162 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %248 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
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
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %304 RelaxedPrecision 
					                                                      OpDecorate %305 RelaxedPrecision 
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
					                                                      OpDecorate %329 RelaxedPrecision 
					                                                      OpDecorate %331 RelaxedPrecision 
					                                                      OpDecorate %332 RelaxedPrecision 
					                                                      OpDecorate %334 RelaxedPrecision 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                                      OpDecorate %336 RelaxedPrecision 
					                                                      OpDecorate %337 RelaxedPrecision 
					                                                      OpDecorate %338 RelaxedPrecision 
					                                                      OpDecorate %339 RelaxedPrecision 
					                                                      OpDecorate %353 RelaxedPrecision 
					                                                      OpDecorate %355 RelaxedPrecision 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %358 RelaxedPrecision 
					                                                      OpDecorate %359 RelaxedPrecision 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %361 RelaxedPrecision 
					                                                      OpDecorate %362 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %385 RelaxedPrecision 
					                                                      OpDecorate %402 RelaxedPrecision 
					                                                      OpDecorate %404 RelaxedPrecision 
					                                                      OpDecorate %405 RelaxedPrecision 
					                                                      OpDecorate %406 RelaxedPrecision 
					                                                      OpDecorate %407 RelaxedPrecision 
					                                                      OpDecorate %408 RelaxedPrecision 
					                                                      OpDecorate %409 RelaxedPrecision 
					                                                      OpDecorate %411 RelaxedPrecision 
					                                                      OpDecorate %434 RelaxedPrecision 
					                                                      OpDecorate %435 RelaxedPrecision 
					                                                      OpDecorate %447 RelaxedPrecision 
					                                                      OpDecorate %448 RelaxedPrecision 
					                                                      OpDecorate %450 RelaxedPrecision 
					                                                      OpDecorate %496 RelaxedPrecision 
					                                                      OpDecorate %497 RelaxedPrecision 
					                                                      OpDecorate %504 Location 504 
					                                                      OpDecorate %520 RelaxedPrecision 
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
					                              Private f32_4* %114 = OpVariable Private 
					                                         f32 %117 = OpConstant 3,674022E-40 
					                                         f32 %118 = OpConstant 3,674022E-40 
					                                         f32 %119 = OpConstant 3,674022E-40 
					                                       f32_4 %120 = OpConstantComposite %43 %117 %118 %119 
					                                             %122 = OpTypePointer Private %10 
					                              Private f32_2* %123 = OpVariable Private 
					                                         f32 %126 = OpConstant 3,674022E-40 
					                                         i32 %139 = OpConstant 3 
					                              Private f32_2* %144 = OpVariable Private 
					                              Private f32_4* %146 = OpVariable Private 
					                                         f32 %154 = OpConstant 3,674022E-40 
					                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
					                              Private f32_3* %159 = OpVariable Private 
					        UniformConstant read_only Texture2D* %160 = OpVariable UniformConstant 
					                    UniformConstant sampler* %162 = OpVariable UniformConstant 
					                              Private f32_3* %169 = OpVariable Private 
					                              Private f32_3* %177 = OpVariable Private 
					                              Private f32_3* %185 = OpVariable Private 
					                                       f32_3 %193 = OpConstantComposite %83 %83 %83 
					                                       f32_3 %196 = OpConstantComposite %62 %62 %62 
					                                Private f32* %198 = OpVariable Private 
					                                Private f32* %210 = OpVariable Private 
					                                         i32 %211 = OpConstant 4 
					                                         f32 %214 = OpConstant 3,674022E-40 
					                                       f32_4 %226 = OpConstantComposite %83 %83 %83 %83 
					                              Private f32_4* %233 = OpVariable Private 
					                                Private f32* %248 = OpVariable Private 
					                              Private f32_3* %255 = OpVariable Private 
					                              Private f32_3* %263 = OpVariable Private 
					                              Private f32_3* %271 = OpVariable Private 
					                              Private f32_3* %282 = OpVariable Private 
					                                Private f32* %293 = OpVariable Private 
					                                         i32 %392 = OpConstant 5 
					                                         f32 %399 = OpConstant 3,674022E-40 
					                                Private f32* %402 = OpVariable Private 
					                                       f32_3 %410 = OpConstantComposite %117 %118 %119 
					                                         i32 %412 = OpConstant 1 
					                                         i32 %419 = OpConstant 8 
					                                         i32 %439 = OpConstant 7 
					                              Private f32_3* %467 = OpVariable Private 
					                                         i32 %471 = OpConstant 0 
					                                         f32 %488 = OpConstant 3,674022E-40 
					                                       f32_3 %489 = OpConstantComposite %488 %488 %488 
					                                             %503 = OpTypePointer Output %7 
					                               Output f32_4* %504 = OpVariable Output 
					                                         i32 %505 = OpConstant 9 
					                                         u32 %524 = OpConstant 3 
					                                             %525 = OpTypePointer Output %6 
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
					                                       f32_3 %115 = OpLoad %99 
					                                       f32_4 %116 = OpVectorShuffle %115 %115 2 0 0 0 
					                                       f32_4 %121 = OpFMul %116 %120 
					                                                      OpStore %114 %121 
					                                Private f32* %124 = OpAccessChain %9 %45 
					                                         f32 %125 = OpLoad %124 
					                                         f32 %127 = OpFMul %125 %126 
					                                Private f32* %128 = OpAccessChain %114 %24 
					                                         f32 %129 = OpLoad %128 
					                                         f32 %130 = OpFAdd %127 %129 
					                                Private f32* %131 = OpAccessChain %123 %24 
					                                                      OpStore %131 %130 
					                                Private f32* %132 = OpAccessChain %9 %24 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFMul %133 %126 
					                                Private f32* %135 = OpAccessChain %114 %24 
					                                         f32 %136 = OpLoad %135 
					                                         f32 %137 = OpFAdd %134 %136 
					                                Private f32* %138 = OpAccessChain %123 %45 
					                                                      OpStore %138 %137 
					                                Uniform f32* %140 = OpAccessChain %13 %139 
					                                         f32 %141 = OpLoad %140 
					                                Private f32* %142 = OpAccessChain %9 %45 
					                                                      OpStore %142 %141 
					                                Private f32* %143 = OpAccessChain %9 %24 
					                                                      OpStore %143 %62 
					                                Private f32* %145 = OpAccessChain %144 %24 
					                                                      OpStore %145 %62 
					                                       f32_4 %147 = OpLoad %9 
					                                       f32_4 %148 = OpVectorShuffle %147 %147 1 0 0 1 
					                                       f32_4 %149 = OpLoad %32 
					                                       f32_4 %150 = OpVectorShuffle %149 %149 0 1 0 1 
					                                       f32_4 %151 = OpFAdd %148 %150 
					                                                      OpStore %146 %151 
					                                       f32_2 %152 = OpLoad %123 
					                                       f32_4 %153 = OpVectorShuffle %152 %152 0 1 0 1 
					                                       f32_4 %156 = OpFMul %153 %155 
					                                       f32_4 %157 = OpLoad %146 
					                                       f32_4 %158 = OpFAdd %156 %157 
					                                                      OpStore %146 %158 
					                         read_only Texture2D %161 = OpLoad %160 
					                                     sampler %163 = OpLoad %162 
					                  read_only Texture2DSampled %164 = OpSampledImage %161 %163 
					                                       f32_4 %165 = OpLoad %146 
					                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
					                                       f32_4 %167 = OpImageSampleImplicitLod %164 %166 
					                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
					                                                      OpStore %159 %168 
					                         read_only Texture2D %170 = OpLoad %160 
					                                     sampler %171 = OpLoad %162 
					                  read_only Texture2DSampled %172 = OpSampledImage %170 %171 
					                                       f32_4 %173 = OpLoad %146 
					                                       f32_2 %174 = OpVectorShuffle %173 %173 2 3 
					                                       f32_4 %175 = OpImageSampleImplicitLod %172 %174 
					                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
					                                                      OpStore %169 %176 
					                         read_only Texture2D %178 = OpLoad %160 
					                                     sampler %179 = OpLoad %162 
					                  read_only Texture2DSampled %180 = OpSampledImage %178 %179 
					                                       f32_4 %181 = OpLoad %32 
					                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
					                                       f32_4 %183 = OpImageSampleImplicitLod %180 %182 
					                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
					                                                      OpStore %177 %184 
					                                       f32_3 %186 = OpLoad %159 
					                                       f32_3 %187 = OpFNegate %186 
					                                       f32_3 %188 = OpLoad %177 
					                                       f32_3 %189 = OpFAdd %187 %188 
					                                                      OpStore %185 %189 
					                                       f32_3 %190 = OpLoad %185 
					                                       f32_3 %191 = OpExtInst %1 4 %190 
					                                       f32_3 %192 = OpFNegate %191 
					                                       f32_3 %194 = OpFAdd %192 %193 
					                                                      OpStore %185 %194 
					                                       f32_3 %195 = OpLoad %185 
					                                       f32_3 %197 = OpExtInst %1 40 %195 %196 
					                                                      OpStore %185 %197 
					                                Private f32* %199 = OpAccessChain %185 %45 
					                                         f32 %200 = OpLoad %199 
					                                Private f32* %201 = OpAccessChain %185 %24 
					                                         f32 %202 = OpLoad %201 
					                                         f32 %203 = OpFMul %200 %202 
					                                                      OpStore %198 %203 
					                                Private f32* %204 = OpAccessChain %185 %95 
					                                         f32 %205 = OpLoad %204 
					                                         f32 %206 = OpLoad %198 
					                                         f32 %207 = OpFMul %205 %206 
					                                                      OpStore %198 %207 
					                                         f32 %208 = OpLoad %198 
					                                         f32 %209 = OpExtInst %1 30 %208 
					                                                      OpStore %198 %209 
					                                Uniform f32* %212 = OpAccessChain %13 %211 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %215 = OpFMul %213 %214 
					                                                      OpStore %210 %215 
					                                         f32 %216 = OpLoad %198 
					                                         f32 %217 = OpLoad %210 
					                                         f32 %218 = OpFMul %216 %217 
					                                Private f32* %219 = OpAccessChain %9 %24 
					                                                      OpStore %219 %218 
					                                Private f32* %220 = OpAccessChain %9 %24 
					                                         f32 %221 = OpLoad %220 
					                                         f32 %222 = OpExtInst %1 29 %221 
					                                Private f32* %223 = OpAccessChain %9 %24 
					                                                      OpStore %223 %222 
					                                       f32_4 %224 = OpLoad %9 
					                                       f32_4 %225 = OpVectorShuffle %224 %224 0 0 0 0 
					                                         f32 %227 = OpDot %225 %226 
					                                Private f32* %228 = OpAccessChain %9 %24 
					                                                      OpStore %228 %227 
					                                Uniform f32* %229 = OpAccessChain %13 %139 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFNegate %230 
					                                Private f32* %232 = OpAccessChain %144 %45 
					                                                      OpStore %232 %231 
					                                       f32_2 %234 = OpLoad %144 
					                                       f32_4 %235 = OpVectorShuffle %234 %234 1 0 0 1 
					                                       f32_4 %236 = OpLoad %32 
					                                       f32_4 %237 = OpVectorShuffle %236 %236 0 1 0 1 
					                                       f32_4 %238 = OpFAdd %235 %237 
					                                                      OpStore %233 %238 
					                                       f32_4 %239 = OpLoad %32 
					                                       f32_2 %240 = OpVectorShuffle %239 %239 0 1 
					                                       f32_2 %241 = OpLoad %123 
					                                       f32_2 %242 = OpFAdd %240 %241 
					                                                      OpStore %144 %242 
					                                       f32_2 %243 = OpLoad %123 
					                                       f32_4 %244 = OpVectorShuffle %243 %243 0 1 0 1 
					                                       f32_4 %245 = OpFMul %244 %155 
					                                       f32_4 %246 = OpLoad %233 
					                                       f32_4 %247 = OpFAdd %245 %246 
					                                                      OpStore %32 %247 
					                         read_only Texture2D %249 = OpLoad %102 
					                                     sampler %250 = OpLoad %106 
					                  read_only Texture2DSampled %251 = OpSampledImage %249 %250 
					                                       f32_2 %252 = OpLoad %144 
					                                       f32_4 %253 = OpImageSampleImplicitLod %251 %252 
					                                         f32 %254 = OpCompositeExtract %253 2 
					                                                      OpStore %248 %254 
					                         read_only Texture2D %256 = OpLoad %160 
					                                     sampler %257 = OpLoad %162 
					                  read_only Texture2DSampled %258 = OpSampledImage %256 %257 
					                                       f32_4 %259 = OpLoad %32 
					                                       f32_2 %260 = OpVectorShuffle %259 %259 0 1 
					                                       f32_4 %261 = OpImageSampleImplicitLod %258 %260 
					                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
					                                                      OpStore %255 %262 
					                         read_only Texture2D %264 = OpLoad %160 
					                                     sampler %265 = OpLoad %162 
					                  read_only Texture2DSampled %266 = OpSampledImage %264 %265 
					                                       f32_4 %267 = OpLoad %32 
					                                       f32_2 %268 = OpVectorShuffle %267 %267 2 3 
					                                       f32_4 %269 = OpImageSampleImplicitLod %266 %268 
					                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
					                                                      OpStore %263 %270 
					                                       f32_3 %272 = OpLoad %177 
					                                       f32_3 %273 = OpLoad %263 
					                                       f32_3 %274 = OpFNegate %273 
					                                       f32_3 %275 = OpFAdd %272 %274 
					                                                      OpStore %271 %275 
					                                       f32_3 %276 = OpLoad %271 
					                                       f32_3 %277 = OpExtInst %1 4 %276 
					                                       f32_3 %278 = OpFNegate %277 
					                                       f32_3 %279 = OpFAdd %278 %193 
					                                                      OpStore %271 %279 
					                                       f32_3 %280 = OpLoad %271 
					                                       f32_3 %281 = OpExtInst %1 40 %280 %196 
					                                                      OpStore %271 %281 
					                                       f32_3 %283 = OpLoad %177 
					                                       f32_3 %284 = OpLoad %255 
					                                       f32_3 %285 = OpFNegate %284 
					                                       f32_3 %286 = OpFAdd %283 %285 
					                                                      OpStore %282 %286 
					                                       f32_3 %287 = OpLoad %282 
					                                       f32_3 %288 = OpExtInst %1 4 %287 
					                                       f32_3 %289 = OpFNegate %288 
					                                       f32_3 %290 = OpFAdd %289 %193 
					                                                      OpStore %282 %290 
					                                       f32_3 %291 = OpLoad %282 
					                                       f32_3 %292 = OpExtInst %1 40 %291 %196 
					                                                      OpStore %282 %292 
					                                Private f32* %294 = OpAccessChain %282 %45 
					                                         f32 %295 = OpLoad %294 
					                                Private f32* %296 = OpAccessChain %282 %24 
					                                         f32 %297 = OpLoad %296 
					                                         f32 %298 = OpFMul %295 %297 
					                                                      OpStore %293 %298 
					                                Private f32* %299 = OpAccessChain %282 %95 
					                                         f32 %300 = OpLoad %299 
					                                         f32 %301 = OpLoad %293 
					                                         f32 %302 = OpFMul %300 %301 
					                                                      OpStore %293 %302 
					                                         f32 %303 = OpLoad %293 
					                                         f32 %304 = OpExtInst %1 30 %303 
					                                                      OpStore %293 %304 
					                                         f32 %305 = OpLoad %293 
					                                         f32 %306 = OpLoad %210 
					                                         f32 %307 = OpFMul %305 %306 
					                                                      OpStore %79 %307 
					                                         f32 %308 = OpLoad %79 
					                                         f32 %309 = OpExtInst %1 29 %308 
					                                                      OpStore %79 %309 
					                                         f32 %310 = OpLoad %79 
					                                       f32_4 %311 = OpCompositeConstruct %310 %310 %310 %310 
					                                         f32 %312 = OpDot %311 %226 
					                                                      OpStore %79 %312 
					                                         f32 %313 = OpLoad %79 
					                                Private f32* %314 = OpAccessChain %9 %24 
					                                         f32 %315 = OpLoad %314 
					                                         f32 %316 = OpFMul %313 %315 
					                                Private f32* %317 = OpAccessChain %9 %24 
					                                                      OpStore %317 %316 
					                                       f32_3 %318 = OpLoad %169 
					                                       f32_3 %319 = OpFNegate %318 
					                                       f32_3 %320 = OpLoad %177 
					                                       f32_3 %321 = OpFAdd %319 %320 
					                                                      OpStore %282 %321 
					                                       f32_3 %322 = OpLoad %282 
					                                       f32_3 %323 = OpExtInst %1 4 %322 
					                                       f32_3 %324 = OpFNegate %323 
					                                       f32_3 %325 = OpFAdd %324 %193 
					                                                      OpStore %282 %325 
					                                       f32_3 %326 = OpLoad %282 
					                                       f32_3 %327 = OpExtInst %1 40 %326 %196 
					                                                      OpStore %282 %327 
					                                Private f32* %328 = OpAccessChain %282 %45 
					                                         f32 %329 = OpLoad %328 
					                                Private f32* %330 = OpAccessChain %282 %24 
					                                         f32 %331 = OpLoad %330 
					                                         f32 %332 = OpFMul %329 %331 
					                                                      OpStore %293 %332 
					                                Private f32* %333 = OpAccessChain %282 %95 
					                                         f32 %334 = OpLoad %333 
					                                         f32 %335 = OpLoad %293 
					                                         f32 %336 = OpFMul %334 %335 
					                                                      OpStore %293 %336 
					                                         f32 %337 = OpLoad %293 
					                                         f32 %338 = OpExtInst %1 30 %337 
					                                                      OpStore %293 %338 
					                                         f32 %339 = OpLoad %293 
					                                         f32 %340 = OpLoad %210 
					                                         f32 %341 = OpFMul %339 %340 
					                                                      OpStore %79 %341 
					                                         f32 %342 = OpLoad %79 
					                                         f32 %343 = OpExtInst %1 29 %342 
					                                                      OpStore %79 %343 
					                                         f32 %344 = OpLoad %79 
					                                       f32_4 %345 = OpCompositeConstruct %344 %344 %344 %344 
					                                         f32 %346 = OpDot %345 %226 
					                                                      OpStore %79 %346 
					                                         f32 %347 = OpLoad %79 
					                                Private f32* %348 = OpAccessChain %9 %24 
					                                         f32 %349 = OpLoad %348 
					                                         f32 %350 = OpFMul %347 %349 
					                                Private f32* %351 = OpAccessChain %9 %24 
					                                                      OpStore %351 %350 
					                                Private f32* %352 = OpAccessChain %271 %45 
					                                         f32 %353 = OpLoad %352 
					                                Private f32* %354 = OpAccessChain %271 %24 
					                                         f32 %355 = OpLoad %354 
					                                         f32 %356 = OpFMul %353 %355 
					                                                      OpStore %293 %356 
					                                Private f32* %357 = OpAccessChain %271 %95 
					                                         f32 %358 = OpLoad %357 
					                                         f32 %359 = OpLoad %293 
					                                         f32 %360 = OpFMul %358 %359 
					                                                      OpStore %293 %360 
					                                         f32 %361 = OpLoad %293 
					                                         f32 %362 = OpExtInst %1 30 %361 
					                                                      OpStore %293 %362 
					                                         f32 %363 = OpLoad %293 
					                                         f32 %364 = OpLoad %210 
					                                         f32 %365 = OpFMul %363 %364 
					                                                      OpStore %210 %365 
					                                         f32 %366 = OpLoad %210 
					                                         f32 %367 = OpExtInst %1 29 %366 
					                                                      OpStore %210 %367 
					                                         f32 %368 = OpLoad %210 
					                                       f32_4 %369 = OpCompositeConstruct %368 %368 %368 %368 
					                                         f32 %370 = OpDot %369 %226 
					                                                      OpStore %210 %370 
					                                         f32 %371 = OpLoad %210 
					                                Private f32* %372 = OpAccessChain %9 %24 
					                                         f32 %373 = OpLoad %372 
					                                         f32 %374 = OpFMul %371 %373 
					                                Private f32* %375 = OpAccessChain %9 %24 
					                                                      OpStore %375 %374 
					                                Private f32* %376 = OpAccessChain %9 %24 
					                                         f32 %377 = OpLoad %376 
					                                         f32 %378 = OpExtInst %1 37 %377 %83 
					                                Private f32* %379 = OpAccessChain %9 %24 
					                                                      OpStore %379 %378 
					                                Private f32* %380 = OpAccessChain %9 %24 
					                                         f32 %381 = OpLoad %380 
					                                         f32 %382 = OpFNegate %381 
					                                         f32 %383 = OpFAdd %382 %83 
					                                Private f32* %384 = OpAccessChain %9 %24 
					                                                      OpStore %384 %383 
					                                         f32 %385 = OpLoad %248 
					                                Private f32* %386 = OpAccessChain %9 %24 
					                                         f32 %387 = OpLoad %386 
					                                         f32 %388 = OpFMul %385 %387 
					                                Private f32* %389 = OpAccessChain %9 %24 
					                                                      OpStore %389 %388 
					                                Private f32* %390 = OpAccessChain %9 %24 
					                                         f32 %391 = OpLoad %390 
					                                Uniform f32* %393 = OpAccessChain %13 %392 
					                                         f32 %394 = OpLoad %393 
					                                         f32 %395 = OpFMul %391 %394 
					                                Private f32* %396 = OpAccessChain %9 %24 
					                                                      OpStore %396 %395 
					                                Private f32* %397 = OpAccessChain %9 %24 
					                                         f32 %398 = OpLoad %397 
					                                         f32 %400 = OpFMul %398 %399 
					                                Private f32* %401 = OpAccessChain %9 %24 
					                                                      OpStore %401 %400 
					                                Private f32* %403 = OpAccessChain %99 %45 
					                                         f32 %404 = OpLoad %403 
					                                         f32 %405 = OpFNegate %404 
					                                         f32 %406 = OpFAdd %405 %83 
					                                                      OpStore %402 %406 
					                                       f32_3 %407 = OpLoad %99 
					                                       f32_3 %408 = OpVectorShuffle %407 %407 0 0 0 
					                                       f32_3 %409 = OpFNegate %408 
					                                       f32_3 %411 = OpFMul %409 %410 
					                              Uniform f32_4* %413 = OpAccessChain %13 %412 
					                                       f32_4 %414 = OpLoad %413 
					                                       f32_3 %415 = OpVectorShuffle %414 %414 0 1 2 
					                                       f32_3 %416 = OpFAdd %411 %415 
					                                       f32_4 %417 = OpLoad %32 
					                                       f32_4 %418 = OpVectorShuffle %417 %416 4 5 6 3 
					                                                      OpStore %32 %418 
					                                Uniform f32* %420 = OpAccessChain %13 %419 
					                                         f32 %421 = OpLoad %420 
					                                Uniform f32* %422 = OpAccessChain %13 %419 
					                                         f32 %423 = OpLoad %422 
					                                Uniform f32* %424 = OpAccessChain %13 %419 
					                                         f32 %425 = OpLoad %424 
					                                       f32_3 %426 = OpCompositeConstruct %421 %423 %425 
					                                         f32 %427 = OpCompositeExtract %426 0 
					                                         f32 %428 = OpCompositeExtract %426 1 
					                                         f32 %429 = OpCompositeExtract %426 2 
					                                       f32_3 %430 = OpCompositeConstruct %427 %428 %429 
					                                       f32_4 %431 = OpLoad %32 
					                                       f32_3 %432 = OpVectorShuffle %431 %431 0 1 2 
					                                       f32_3 %433 = OpFMul %430 %432 
					                                       f32_4 %434 = OpLoad %114 
					                                       f32_3 %435 = OpVectorShuffle %434 %434 1 2 3 
					                                       f32_3 %436 = OpFAdd %433 %435 
					                                       f32_4 %437 = OpLoad %32 
					                                       f32_4 %438 = OpVectorShuffle %437 %436 4 5 6 3 
					                                                      OpStore %32 %438 
					                                Uniform f32* %440 = OpAccessChain %13 %439 
					                                         f32 %441 = OpLoad %440 
					                                         f32 %442 = OpFNegate %441 
					                                         f32 %443 = OpFAdd %442 %83 
					                                Private f32* %444 = OpAccessChain %144 %24 
					                                                      OpStore %444 %443 
					                                Private f32* %445 = OpAccessChain %144 %24 
					                                         f32 %446 = OpLoad %445 
					                                         f32 %447 = OpLoad %402 
					                                         f32 %448 = OpFNegate %447 
					                                         f32 %449 = OpFMul %446 %448 
					                                         f32 %450 = OpLoad %402 
					                                         f32 %451 = OpFAdd %449 %450 
					                                                      OpStore %210 %451 
					                                         f32 %452 = OpLoad %210 
					                                Private f32* %453 = OpAccessChain %9 %24 
					                                         f32 %454 = OpLoad %453 
					                                         f32 %455 = OpFNegate %454 
					                                         f32 %456 = OpFMul %452 %455 
					                                Private f32* %457 = OpAccessChain %9 %24 
					                                         f32 %458 = OpLoad %457 
					                                         f32 %459 = OpFAdd %456 %458 
					                                Private f32* %460 = OpAccessChain %9 %24 
					                                                      OpStore %460 %459 
					                                Private f32* %461 = OpAccessChain %9 %24 
					                                         f32 %462 = OpLoad %461 
					                                Uniform f32* %463 = OpAccessChain %13 %392 
					                                         f32 %464 = OpLoad %463 
					                                         f32 %465 = OpFMul %462 %464 
					                                Private f32* %466 = OpAccessChain %9 %24 
					                                                      OpStore %466 %465 
					                                       f32_4 %468 = OpLoad %32 
					                                       f32_3 %469 = OpVectorShuffle %468 %468 0 1 2 
					                                       f32_3 %470 = OpFNegate %469 
					                              Uniform f32_4* %472 = OpAccessChain %13 %471 
					                                       f32_4 %473 = OpLoad %472 
					                                       f32_3 %474 = OpVectorShuffle %473 %473 0 1 2 
					                                       f32_3 %475 = OpFAdd %470 %474 
					                                                      OpStore %467 %475 
					                                       f32_4 %476 = OpLoad %9 
					                                       f32_3 %477 = OpVectorShuffle %476 %476 0 0 0 
					                                       f32_3 %478 = OpLoad %467 
					                                       f32_3 %479 = OpFMul %477 %478 
					                                       f32_4 %480 = OpLoad %32 
					                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 2 
					                                       f32_3 %482 = OpFAdd %479 %481 
					                                       f32_4 %483 = OpLoad %9 
					                                       f32_4 %484 = OpVectorShuffle %483 %482 4 1 5 6 
					                                                      OpStore %9 %484 
					                                         f32 %485 = OpLoad %210 
					                                       f32_3 %486 = OpCompositeConstruct %485 %485 %485 
					                                       f32_3 %487 = OpFNegate %486 
					                                       f32_3 %490 = OpFMul %487 %489 
					                                       f32_4 %491 = OpLoad %9 
					                                       f32_3 %492 = OpVectorShuffle %491 %491 0 2 3 
					                                       f32_3 %493 = OpFAdd %490 %492 
					                                       f32_4 %494 = OpLoad %9 
					                                       f32_4 %495 = OpVectorShuffle %494 %493 4 5 6 3 
					                                                      OpStore %9 %495 
					                                       f32_3 %496 = OpLoad %177 
					                                       f32_3 %497 = OpFNegate %496 
					                                       f32_4 %498 = OpLoad %9 
					                                       f32_3 %499 = OpVectorShuffle %498 %498 0 1 2 
					                                       f32_3 %500 = OpFAdd %497 %499 
					                                       f32_4 %501 = OpLoad %9 
					                                       f32_4 %502 = OpVectorShuffle %501 %500 4 5 6 3 
					                                                      OpStore %9 %502 
					                                Uniform f32* %506 = OpAccessChain %13 %505 
					                                         f32 %507 = OpLoad %506 
					                                Uniform f32* %508 = OpAccessChain %13 %505 
					                                         f32 %509 = OpLoad %508 
					                                Uniform f32* %510 = OpAccessChain %13 %505 
					                                         f32 %511 = OpLoad %510 
					                                       f32_3 %512 = OpCompositeConstruct %507 %509 %511 
					                                         f32 %513 = OpCompositeExtract %512 0 
					                                         f32 %514 = OpCompositeExtract %512 1 
					                                         f32 %515 = OpCompositeExtract %512 2 
					                                       f32_3 %516 = OpCompositeConstruct %513 %514 %515 
					                                       f32_4 %517 = OpLoad %9 
					                                       f32_3 %518 = OpVectorShuffle %517 %517 0 1 2 
					                                       f32_3 %519 = OpFMul %516 %518 
					                                       f32_3 %520 = OpLoad %177 
					                                       f32_3 %521 = OpFAdd %519 %520 
					                                       f32_4 %522 = OpLoad %504 
					                                       f32_4 %523 = OpVectorShuffle %522 %521 4 5 6 3 
					                                                      OpStore %504 %523 
					                                 Output f32* %526 = OpAccessChain %504 %524 
					                                                      OpStore %526 %83 
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
					vec4 u_xlat16_3;
					vec2 u_xlat4;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec3 u_xlat16_6;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					float u_xlat8;
					float u_xlat16_8;
					vec2 u_xlat16;
					float u_xlat16_16;
					bool u_xlatb16;
					float u_xlat24;
					void main()
					{
					    u_xlat0.x = _TimeX * _Value4;
					    u_xlat0.x = u_xlat0.x * 10.0;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat1.x * 0.0199999996;
					    u_xlat0.x = u_xlat0.x * 0.0199999996;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlatb16 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat24 = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb16) ? u_xlat24 : u_xlat1.y;
					    u_xlat10_2 = texture(_MainTex2, u_xlat1.xz);
					    u_xlat16_3 = u_xlat10_2.zxxx * vec4(0.0199999996, 0.833999991, 0.595200002, 0.375);
					    u_xlat4.x = u_xlat0.y * 0.0833333358 + u_xlat16_3.x;
					    u_xlat4.y = u_xlat0.x * 0.0833333358 + u_xlat16_3.x;
					    u_xlat0.y = _Value1;
					    u_xlat0.x = float(0.0);
					    u_xlat16.x = float(0.0);
					    u_xlat5 = u_xlat0.yxxy + u_xlat1.xyxy;
					    u_xlat5 = u_xlat4.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat5;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat10_7 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_6.xyz = (-u_xlat10_6.xyz) + u_xlat10_7.xyz;
					    u_xlat16_6.xyz = -abs(u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_0 = u_xlat16_6.y * u_xlat16_6.x;
					    u_xlat16_0 = u_xlat16_6.z * u_xlat16_0;
					    u_xlat16_0 = log2(u_xlat16_0);
					    u_xlat8 = _Value2 * 25.0;
					    u_xlat0.x = u_xlat16_0 * u_xlat8;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat0.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat16.y = (-_Value1);
					    u_xlat6 = u_xlat16.yxxy + u_xlat1.xyxy;
					    u_xlat16.xy = u_xlat1.xy + u_xlat4.xy;
					    u_xlat1 = u_xlat4.xyxy * vec4(0.0078125, 0.0078125, 0.0078125, 0.0078125) + u_xlat6;
					    u_xlat10_4 = texture(_MainTex2, u_xlat16.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1.xyz = u_xlat10_7.xyz + (-u_xlat10_1.xyz);
					    u_xlat16_1.xyz = -abs(u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_4.xyw = u_xlat10_7.xyz + (-u_xlat10_6.xyz);
					    u_xlat16_4.xyw = -abs(u_xlat16_4.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_4.xyw = max(u_xlat16_4.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_16 = u_xlat16_4.y * u_xlat16_4.x;
					    u_xlat16_16 = u_xlat16_4.w * u_xlat16_16;
					    u_xlat16_16 = log2(u_xlat16_16);
					    u_xlat16.x = u_xlat16_16 * u_xlat8;
					    u_xlat16.x = exp2(u_xlat16.x);
					    u_xlat16.x = dot(u_xlat16.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat16.x * u_xlat0.x;
					    u_xlat16_4.xyw = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
					    u_xlat16_4.xyw = -abs(u_xlat16_4.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_4.xyw = max(u_xlat16_4.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_16 = u_xlat16_4.y * u_xlat16_4.x;
					    u_xlat16_16 = u_xlat16_4.w * u_xlat16_16;
					    u_xlat16_16 = log2(u_xlat16_16);
					    u_xlat16.x = u_xlat16_16 * u_xlat8;
					    u_xlat16.x = exp2(u_xlat16.x);
					    u_xlat16.x = dot(u_xlat16.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat16.x * u_xlat0.x;
					    u_xlat16_16 = u_xlat16_1.y * u_xlat16_1.x;
					    u_xlat16_16 = u_xlat16_1.z * u_xlat16_16;
					    u_xlat16_16 = log2(u_xlat16_16);
					    u_xlat8 = u_xlat16_16 * u_xlat8;
					    u_xlat8 = exp2(u_xlat8);
					    u_xlat8 = dot(vec4(u_xlat8), vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat8 * u_xlat0.x;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat10_4.z * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 1.5;
					    u_xlat16_8 = (-u_xlat10_2.y) + 1.0;
					    u_xlat1.xyz = (-u_xlat10_2.xxx) * vec3(0.833999991, 0.595200002, 0.375) + _PColor2.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value6, _Value6, _Value6)) * u_xlat1.xyz + u_xlat16_3.yzw;
					    u_xlat16.x = (-_Value5) + 1.0;
					    u_xlat8 = u_xlat16.x * (-u_xlat16_8) + u_xlat16_8;
					    u_xlat0.x = u_xlat8 * (-u_xlat0.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _PColor.xyz;
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = (-vec3(u_xlat8)) * vec3(0.100000001, 0.100000001, 0.100000001) + u_xlat0.xzw;
					    u_xlat0.xyz = (-u_xlat10_7.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value7, _Value7, _Value7)) * u_xlat0.xyz + u_xlat10_7.xyz;
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