Shader "CameraFilterPack/Drawing_Paper" {
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
			GpuProgramID 9789
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
					vec3 u_xlat0;
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
					vec3 u_xlat7;
					float u_xlat16_7;
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
					    u_xlat7.x = _Value2 * 25.0;
					    u_xlat0.x = u_xlat16_0 * u_xlat7.x;
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
					    u_xlat14.x = u_xlat16_14 * u_xlat7.x;
					    u_xlat14.x = exp2(u_xlat14.x);
					    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat16_3.xyw = (-u_xlat10_4.xyz) + u_xlat10_6.xyz;
					    u_xlat16_3.xyw = -abs(u_xlat16_3.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_3.xyw = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_14 = u_xlat16_3.y * u_xlat16_3.x;
					    u_xlat16_14 = u_xlat16_3.w * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat14.x = u_xlat16_14 * u_xlat7.x;
					    u_xlat14.x = exp2(u_xlat14.x);
					    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat16_14 = u_xlat16_2.y * u_xlat16_2.x;
					    u_xlat16_14 = u_xlat16_2.z * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat7.x = u_xlat16_14 * u_xlat7.x;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.x = dot(u_xlat7.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat7.x * u_xlat0.x;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat10_3.z * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 1.5;
					    u_xlat16_7 = (-u_xlat10_1.y) + 1.0;
					    u_xlat14.x = (-_Value5) + 1.0;
					    u_xlat7.x = u_xlat14.x * (-u_xlat16_7) + u_xlat16_7;
					    u_xlat0.x = u_xlat7.x * (-u_xlat0.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat7.xyz = (-u_xlat10_1.xxx) + _PColor2.xyz;
					    u_xlat7.xyz = vec3(vec3(_Value6, _Value6, _Value6)) * u_xlat7.xyz + u_xlat10_1.xxx;
					    u_xlat1.xyz = (-u_xlat7.xyz) + _PColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat7.xyz;
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
					; Bound: 482
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %60 %459 
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
					                                                      OpMemberDecorate %11 10 RelaxedPrecision 
					                                                      OpMemberDecorate %11 10 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 60 
					                                                      OpDecorate %65 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %69 RelaxedPrecision 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %75 DescriptorSet 75 
					                                                      OpDecorate %75 Binding 75 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %79 DescriptorSet 79 
					                                                      OpDecorate %79 Binding 79 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %89 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %129 DescriptorSet 129 
					                                                      OpDecorate %129 Binding 129 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 DescriptorSet 131 
					                                                      OpDecorate %131 Binding 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %166 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %219 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %224 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %232 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %241 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
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
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
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
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %304 RelaxedPrecision 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %307 RelaxedPrecision 
					                                                      OpDecorate %308 RelaxedPrecision 
					                                                      OpDecorate %309 RelaxedPrecision 
					                                                      OpDecorate %310 RelaxedPrecision 
					                                                      OpDecorate %311 RelaxedPrecision 
					                                                      OpDecorate %326 RelaxedPrecision 
					                                                      OpDecorate %328 RelaxedPrecision 
					                                                      OpDecorate %329 RelaxedPrecision 
					                                                      OpDecorate %331 RelaxedPrecision 
					                                                      OpDecorate %332 RelaxedPrecision 
					                                                      OpDecorate %333 RelaxedPrecision 
					                                                      OpDecorate %334 RelaxedPrecision 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                                      OpDecorate %336 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %381 RelaxedPrecision 
					                                                      OpDecorate %383 RelaxedPrecision 
					                                                      OpDecorate %384 RelaxedPrecision 
					                                                      OpDecorate %385 RelaxedPrecision 
					                                                      OpDecorate %394 RelaxedPrecision 
					                                                      OpDecorate %395 RelaxedPrecision 
					                                                      OpDecorate %397 RelaxedPrecision 
					                                                      OpDecorate %416 RelaxedPrecision 
					                                                      OpDecorate %417 RelaxedPrecision 
					                                                      OpDecorate %418 RelaxedPrecision 
					                                                      OpDecorate %438 RelaxedPrecision 
					                                                      OpDecorate %439 RelaxedPrecision 
					                                                      OpDecorate %454 RelaxedPrecision 
					                                                      OpDecorate %455 RelaxedPrecision 
					                                                      OpDecorate %459 Location 459 
					                                                      OpDecorate %474 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %10 %10 %6 %6 %6 %6 %6 %6 %6 %6 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 2 
					                                              %16 = OpTypePointer Uniform %6 
					                                          i32 %19 = OpConstant 6 
					                                              %23 = OpTypeInt 32 0 
					                                          u32 %24 = OpConstant 0 
					                                              %25 = OpTypePointer Private %6 
					                                          f32 %29 = OpConstant 3,674022E-40 
					                               Private f32_3* %32 = OpVariable Private 
					                                          f32 %43 = OpConstant 3,674022E-40 
					                                          u32 %45 = OpConstant 1 
					                                              %51 = OpTypeVector %6 2 
					                                              %57 = OpTypePointer Private %51 
					                               Private f32_2* %58 = OpVariable Private 
					                                              %59 = OpTypePointer Input %51 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %62 = OpConstant 10 
					                                              %63 = OpTypePointer Uniform %10 
					                               Private f32_3* %72 = OpVariable Private 
					                                              %73 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %74 = OpTypePointer UniformConstant %73 
					         UniformConstant read_only Texture2D* %75 = OpVariable UniformConstant 
					                                              %77 = OpTypeSampler 
					                                              %78 = OpTypePointer UniformConstant %77 
					                     UniformConstant sampler* %79 = OpVariable UniformConstant 
					                                              %81 = OpTypeSampledImage %73 
					                                 Private f32* %86 = OpVariable Private 
					                                          u32 %87 = OpConstant 2 
					                                              %91 = OpTypePointer Private %10 
					                               Private f32_4* %92 = OpVariable Private 
					                                          f32 %95 = OpConstant 3,674022E-40 
					                              Private f32_4* %106 = OpVariable Private 
					                                         i32 %107 = OpConstant 3 
					                                         f32 %111 = OpConstant 3,674022E-40 
					                              Private f32_2* %113 = OpVariable Private 
					                              Private f32_4* %115 = OpVariable Private 
					                                         f32 %123 = OpConstant 3,674022E-40 
					                                       f32_4 %124 = OpConstantComposite %123 %123 %123 %123 
					                              Private f32_3* %128 = OpVariable Private 
					        UniformConstant read_only Texture2D* %129 = OpVariable UniformConstant 
					                    UniformConstant sampler* %131 = OpVariable UniformConstant 
					                              Private f32_3* %138 = OpVariable Private 
					                              Private f32_3* %146 = OpVariable Private 
					                              Private f32_3* %153 = OpVariable Private 
					                                         f32 %161 = OpConstant 3,674022E-40 
					                                       f32_3 %162 = OpConstantComposite %161 %161 %161 
					                                       f32_3 %165 = OpConstantComposite %111 %111 %111 
					                                Private f32* %167 = OpVariable Private 
					                              Private f32_3* %179 = OpVariable Private 
					                                         i32 %180 = OpConstant 4 
					                                         f32 %183 = OpConstant 3,674022E-40 
					                                       f32_4 %197 = OpConstantComposite %161 %161 %161 %161 
					                                Private f32* %218 = OpVariable Private 
					                              Private f32_3* %225 = OpVariable Private 
					                              Private f32_3* %233 = OpVariable Private 
					                              Private f32_3* %241 = OpVariable Private 
					                              Private f32_3* %252 = OpVariable Private 
					                                Private f32* %263 = OpVariable Private 
					                                Private f32* %275 = OpVariable Private 
					                                         i32 %371 = OpConstant 5 
					                                         f32 %378 = OpConstant 3,674022E-40 
					                                Private f32* %381 = OpVariable Private 
					                                         i32 %386 = OpConstant 7 
					                                         i32 %419 = OpConstant 1 
					                                         i32 %424 = OpConstant 8 
					                                         i32 %443 = OpConstant 0 
					                                             %458 = OpTypePointer Output %10 
					                               Output f32_4* %459 = OpVariable Output 
					                                         i32 %460 = OpConstant 9 
					                                         u32 %478 = OpConstant 3 
					                                             %479 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
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
					                                        f32_3 %52 = OpLoad %9 
					                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
					                                        f32_2 %54 = OpExtInst %1 8 %53 
					                                        f32_3 %55 = OpLoad %9 
					                                        f32_3 %56 = OpVectorShuffle %55 %54 3 4 2 
					                                                      OpStore %9 %56 
					                                        f32_2 %61 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %64 = OpAccessChain %13 %62 
					                                        f32_4 %65 = OpLoad %64 
					                                        f32_2 %66 = OpVectorShuffle %65 %65 0 1 
					                                        f32_2 %67 = OpFMul %61 %66 
					                               Uniform f32_4* %68 = OpAccessChain %13 %62 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_2 %70 = OpVectorShuffle %69 %69 2 3 
					                                        f32_2 %71 = OpFAdd %67 %70 
					                                                      OpStore %58 %71 
					                          read_only Texture2D %76 = OpLoad %75 
					                                      sampler %80 = OpLoad %79 
					                   read_only Texture2DSampled %82 = OpSampledImage %76 %80 
					                                        f32_2 %83 = OpLoad %58 
					                                        f32_4 %84 = OpImageSampleImplicitLod %82 %83 
					                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                                      OpStore %72 %85 
					                                 Private f32* %88 = OpAccessChain %72 %87 
					                                          f32 %89 = OpLoad %88 
					                                          f32 %90 = OpFMul %89 %43 
					                                                      OpStore %86 %90 
					                                 Private f32* %93 = OpAccessChain %9 %45 
					                                          f32 %94 = OpLoad %93 
					                                          f32 %96 = OpFMul %94 %95 
					                                          f32 %97 = OpLoad %86 
					                                          f32 %98 = OpFAdd %96 %97 
					                                 Private f32* %99 = OpAccessChain %92 %24 
					                                                      OpStore %99 %98 
					                                Private f32* %100 = OpAccessChain %9 %24 
					                                         f32 %101 = OpLoad %100 
					                                         f32 %102 = OpFMul %101 %95 
					                                         f32 %103 = OpLoad %86 
					                                         f32 %104 = OpFAdd %102 %103 
					                                Private f32* %105 = OpAccessChain %92 %45 
					                                                      OpStore %105 %104 
					                                Uniform f32* %108 = OpAccessChain %13 %107 
					                                         f32 %109 = OpLoad %108 
					                                Private f32* %110 = OpAccessChain %106 %45 
					                                                      OpStore %110 %109 
					                                Private f32* %112 = OpAccessChain %106 %24 
					                                                      OpStore %112 %111 
					                                Private f32* %114 = OpAccessChain %113 %24 
					                                                      OpStore %114 %111 
					                                       f32_2 %116 = OpLoad %58 
					                                       f32_4 %117 = OpVectorShuffle %116 %116 0 1 0 1 
					                                       f32_4 %118 = OpLoad %106 
					                                       f32_4 %119 = OpVectorShuffle %118 %118 1 0 0 1 
					                                       f32_4 %120 = OpFAdd %117 %119 
					                                                      OpStore %115 %120 
					                                       f32_4 %121 = OpLoad %92 
					                                       f32_4 %122 = OpVectorShuffle %121 %121 0 1 0 1 
					                                       f32_4 %125 = OpFMul %122 %124 
					                                       f32_4 %126 = OpLoad %115 
					                                       f32_4 %127 = OpFAdd %125 %126 
					                                                      OpStore %115 %127 
					                         read_only Texture2D %130 = OpLoad %129 
					                                     sampler %132 = OpLoad %131 
					                  read_only Texture2DSampled %133 = OpSampledImage %130 %132 
					                                       f32_4 %134 = OpLoad %115 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_4 %136 = OpImageSampleImplicitLod %133 %135 
					                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
					                                                      OpStore %128 %137 
					                         read_only Texture2D %139 = OpLoad %129 
					                                     sampler %140 = OpLoad %131 
					                  read_only Texture2DSampled %141 = OpSampledImage %139 %140 
					                                       f32_4 %142 = OpLoad %115 
					                                       f32_2 %143 = OpVectorShuffle %142 %142 2 3 
					                                       f32_4 %144 = OpImageSampleImplicitLod %141 %143 
					                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
					                                                      OpStore %138 %145 
					                         read_only Texture2D %147 = OpLoad %129 
					                                     sampler %148 = OpLoad %131 
					                  read_only Texture2DSampled %149 = OpSampledImage %147 %148 
					                                       f32_2 %150 = OpLoad %58 
					                                       f32_4 %151 = OpImageSampleImplicitLod %149 %150 
					                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
					                                                      OpStore %146 %152 
					                                       f32_3 %154 = OpLoad %128 
					                                       f32_3 %155 = OpFNegate %154 
					                                       f32_3 %156 = OpLoad %146 
					                                       f32_3 %157 = OpFAdd %155 %156 
					                                                      OpStore %153 %157 
					                                       f32_3 %158 = OpLoad %153 
					                                       f32_3 %159 = OpExtInst %1 4 %158 
					                                       f32_3 %160 = OpFNegate %159 
					                                       f32_3 %163 = OpFAdd %160 %162 
					                                                      OpStore %153 %163 
					                                       f32_3 %164 = OpLoad %153 
					                                       f32_3 %166 = OpExtInst %1 40 %164 %165 
					                                                      OpStore %153 %166 
					                                Private f32* %168 = OpAccessChain %153 %45 
					                                         f32 %169 = OpLoad %168 
					                                Private f32* %170 = OpAccessChain %153 %24 
					                                         f32 %171 = OpLoad %170 
					                                         f32 %172 = OpFMul %169 %171 
					                                                      OpStore %167 %172 
					                                Private f32* %173 = OpAccessChain %153 %87 
					                                         f32 %174 = OpLoad %173 
					                                         f32 %175 = OpLoad %167 
					                                         f32 %176 = OpFMul %174 %175 
					                                                      OpStore %167 %176 
					                                         f32 %177 = OpLoad %167 
					                                         f32 %178 = OpExtInst %1 30 %177 
					                                                      OpStore %167 %178 
					                                Uniform f32* %181 = OpAccessChain %13 %180 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %184 = OpFMul %182 %183 
					                                Private f32* %185 = OpAccessChain %179 %24 
					                                                      OpStore %185 %184 
					                                         f32 %186 = OpLoad %167 
					                                Private f32* %187 = OpAccessChain %179 %24 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpFMul %186 %188 
					                                Private f32* %190 = OpAccessChain %9 %24 
					                                                      OpStore %190 %189 
					                                Private f32* %191 = OpAccessChain %9 %24 
					                                         f32 %192 = OpLoad %191 
					                                         f32 %193 = OpExtInst %1 29 %192 
					                                Private f32* %194 = OpAccessChain %9 %24 
					                                                      OpStore %194 %193 
					                                       f32_3 %195 = OpLoad %9 
					                                       f32_4 %196 = OpVectorShuffle %195 %195 0 0 0 0 
					                                         f32 %198 = OpDot %196 %197 
					                                Private f32* %199 = OpAccessChain %9 %24 
					                                                      OpStore %199 %198 
					                                Uniform f32* %200 = OpAccessChain %13 %107 
					                                         f32 %201 = OpLoad %200 
					                                         f32 %202 = OpFNegate %201 
					                                Private f32* %203 = OpAccessChain %113 %45 
					                                                      OpStore %203 %202 
					                                       f32_2 %204 = OpLoad %58 
					                                       f32_4 %205 = OpVectorShuffle %204 %204 0 1 0 1 
					                                       f32_2 %206 = OpLoad %113 
					                                       f32_4 %207 = OpVectorShuffle %206 %206 1 0 0 1 
					                                       f32_4 %208 = OpFAdd %205 %207 
					                                                      OpStore %106 %208 
					                                       f32_2 %209 = OpLoad %58 
					                                       f32_4 %210 = OpLoad %92 
					                                       f32_2 %211 = OpVectorShuffle %210 %210 0 1 
					                                       f32_2 %212 = OpFAdd %209 %211 
					                                                      OpStore %58 %212 
					                                       f32_4 %213 = OpLoad %92 
					                                       f32_4 %214 = OpVectorShuffle %213 %213 0 1 0 1 
					                                       f32_4 %215 = OpFMul %214 %124 
					                                       f32_4 %216 = OpLoad %106 
					                                       f32_4 %217 = OpFAdd %215 %216 
					                                                      OpStore %92 %217 
					                         read_only Texture2D %219 = OpLoad %75 
					                                     sampler %220 = OpLoad %79 
					                  read_only Texture2DSampled %221 = OpSampledImage %219 %220 
					                                       f32_2 %222 = OpLoad %58 
					                                       f32_4 %223 = OpImageSampleImplicitLod %221 %222 
					                                         f32 %224 = OpCompositeExtract %223 2 
					                                                      OpStore %218 %224 
					                         read_only Texture2D %226 = OpLoad %129 
					                                     sampler %227 = OpLoad %131 
					                  read_only Texture2DSampled %228 = OpSampledImage %226 %227 
					                                       f32_4 %229 = OpLoad %92 
					                                       f32_2 %230 = OpVectorShuffle %229 %229 0 1 
					                                       f32_4 %231 = OpImageSampleImplicitLod %228 %230 
					                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
					                                                      OpStore %225 %232 
					                         read_only Texture2D %234 = OpLoad %129 
					                                     sampler %235 = OpLoad %131 
					                  read_only Texture2DSampled %236 = OpSampledImage %234 %235 
					                                       f32_4 %237 = OpLoad %92 
					                                       f32_2 %238 = OpVectorShuffle %237 %237 2 3 
					                                       f32_4 %239 = OpImageSampleImplicitLod %236 %238 
					                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
					                                                      OpStore %233 %240 
					                                       f32_3 %242 = OpLoad %146 
					                                       f32_3 %243 = OpLoad %233 
					                                       f32_3 %244 = OpFNegate %243 
					                                       f32_3 %245 = OpFAdd %242 %244 
					                                                      OpStore %241 %245 
					                                       f32_3 %246 = OpLoad %241 
					                                       f32_3 %247 = OpExtInst %1 4 %246 
					                                       f32_3 %248 = OpFNegate %247 
					                                       f32_3 %249 = OpFAdd %248 %162 
					                                                      OpStore %241 %249 
					                                       f32_3 %250 = OpLoad %241 
					                                       f32_3 %251 = OpExtInst %1 40 %250 %165 
					                                                      OpStore %241 %251 
					                                       f32_3 %253 = OpLoad %146 
					                                       f32_3 %254 = OpLoad %225 
					                                       f32_3 %255 = OpFNegate %254 
					                                       f32_3 %256 = OpFAdd %253 %255 
					                                                      OpStore %252 %256 
					                                       f32_3 %257 = OpLoad %252 
					                                       f32_3 %258 = OpExtInst %1 4 %257 
					                                       f32_3 %259 = OpFNegate %258 
					                                       f32_3 %260 = OpFAdd %259 %162 
					                                                      OpStore %252 %260 
					                                       f32_3 %261 = OpLoad %252 
					                                       f32_3 %262 = OpExtInst %1 40 %261 %165 
					                                                      OpStore %252 %262 
					                                Private f32* %264 = OpAccessChain %252 %45 
					                                         f32 %265 = OpLoad %264 
					                                Private f32* %266 = OpAccessChain %252 %24 
					                                         f32 %267 = OpLoad %266 
					                                         f32 %268 = OpFMul %265 %267 
					                                                      OpStore %263 %268 
					                                Private f32* %269 = OpAccessChain %252 %87 
					                                         f32 %270 = OpLoad %269 
					                                         f32 %271 = OpLoad %263 
					                                         f32 %272 = OpFMul %270 %271 
					                                                      OpStore %263 %272 
					                                         f32 %273 = OpLoad %263 
					                                         f32 %274 = OpExtInst %1 30 %273 
					                                                      OpStore %263 %274 
					                                         f32 %276 = OpLoad %263 
					                                Private f32* %277 = OpAccessChain %179 %24 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFMul %276 %278 
					                                                      OpStore %275 %279 
					                                         f32 %280 = OpLoad %275 
					                                         f32 %281 = OpExtInst %1 29 %280 
					                                                      OpStore %275 %281 
					                                         f32 %282 = OpLoad %275 
					                                       f32_4 %283 = OpCompositeConstruct %282 %282 %282 %282 
					                                         f32 %284 = OpDot %283 %197 
					                                                      OpStore %275 %284 
					                                         f32 %285 = OpLoad %275 
					                                Private f32* %286 = OpAccessChain %9 %24 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFMul %285 %287 
					                                Private f32* %289 = OpAccessChain %9 %24 
					                                                      OpStore %289 %288 
					                                       f32_3 %290 = OpLoad %138 
					                                       f32_3 %291 = OpFNegate %290 
					                                       f32_3 %292 = OpLoad %146 
					                                       f32_3 %293 = OpFAdd %291 %292 
					                                                      OpStore %252 %293 
					                                       f32_3 %294 = OpLoad %252 
					                                       f32_3 %295 = OpExtInst %1 4 %294 
					                                       f32_3 %296 = OpFNegate %295 
					                                       f32_3 %297 = OpFAdd %296 %162 
					                                                      OpStore %252 %297 
					                                       f32_3 %298 = OpLoad %252 
					                                       f32_3 %299 = OpExtInst %1 40 %298 %165 
					                                                      OpStore %252 %299 
					                                Private f32* %300 = OpAccessChain %252 %45 
					                                         f32 %301 = OpLoad %300 
					                                Private f32* %302 = OpAccessChain %252 %24 
					                                         f32 %303 = OpLoad %302 
					                                         f32 %304 = OpFMul %301 %303 
					                                                      OpStore %263 %304 
					                                Private f32* %305 = OpAccessChain %252 %87 
					                                         f32 %306 = OpLoad %305 
					                                         f32 %307 = OpLoad %263 
					                                         f32 %308 = OpFMul %306 %307 
					                                                      OpStore %263 %308 
					                                         f32 %309 = OpLoad %263 
					                                         f32 %310 = OpExtInst %1 30 %309 
					                                                      OpStore %263 %310 
					                                         f32 %311 = OpLoad %263 
					                                Private f32* %312 = OpAccessChain %179 %24 
					                                         f32 %313 = OpLoad %312 
					                                         f32 %314 = OpFMul %311 %313 
					                                                      OpStore %275 %314 
					                                         f32 %315 = OpLoad %275 
					                                         f32 %316 = OpExtInst %1 29 %315 
					                                                      OpStore %275 %316 
					                                         f32 %317 = OpLoad %275 
					                                       f32_4 %318 = OpCompositeConstruct %317 %317 %317 %317 
					                                         f32 %319 = OpDot %318 %197 
					                                                      OpStore %275 %319 
					                                         f32 %320 = OpLoad %275 
					                                Private f32* %321 = OpAccessChain %9 %24 
					                                         f32 %322 = OpLoad %321 
					                                         f32 %323 = OpFMul %320 %322 
					                                Private f32* %324 = OpAccessChain %9 %24 
					                                                      OpStore %324 %323 
					                                Private f32* %325 = OpAccessChain %241 %45 
					                                         f32 %326 = OpLoad %325 
					                                Private f32* %327 = OpAccessChain %241 %24 
					                                         f32 %328 = OpLoad %327 
					                                         f32 %329 = OpFMul %326 %328 
					                                                      OpStore %263 %329 
					                                Private f32* %330 = OpAccessChain %241 %87 
					                                         f32 %331 = OpLoad %330 
					                                         f32 %332 = OpLoad %263 
					                                         f32 %333 = OpFMul %331 %332 
					                                                      OpStore %263 %333 
					                                         f32 %334 = OpLoad %263 
					                                         f32 %335 = OpExtInst %1 30 %334 
					                                                      OpStore %263 %335 
					                                         f32 %336 = OpLoad %263 
					                                Private f32* %337 = OpAccessChain %179 %24 
					                                         f32 %338 = OpLoad %337 
					                                         f32 %339 = OpFMul %336 %338 
					                                Private f32* %340 = OpAccessChain %179 %24 
					                                                      OpStore %340 %339 
					                                Private f32* %341 = OpAccessChain %179 %24 
					                                         f32 %342 = OpLoad %341 
					                                         f32 %343 = OpExtInst %1 29 %342 
					                                Private f32* %344 = OpAccessChain %179 %24 
					                                                      OpStore %344 %343 
					                                       f32_3 %345 = OpLoad %179 
					                                       f32_4 %346 = OpVectorShuffle %345 %345 0 0 0 0 
					                                         f32 %347 = OpDot %346 %197 
					                                Private f32* %348 = OpAccessChain %179 %24 
					                                                      OpStore %348 %347 
					                                Private f32* %349 = OpAccessChain %179 %24 
					                                         f32 %350 = OpLoad %349 
					                                Private f32* %351 = OpAccessChain %9 %24 
					                                         f32 %352 = OpLoad %351 
					                                         f32 %353 = OpFMul %350 %352 
					                                Private f32* %354 = OpAccessChain %9 %24 
					                                                      OpStore %354 %353 
					                                Private f32* %355 = OpAccessChain %9 %24 
					                                         f32 %356 = OpLoad %355 
					                                         f32 %357 = OpExtInst %1 37 %356 %161 
					                                Private f32* %358 = OpAccessChain %9 %24 
					                                                      OpStore %358 %357 
					                                Private f32* %359 = OpAccessChain %9 %24 
					                                         f32 %360 = OpLoad %359 
					                                         f32 %361 = OpFNegate %360 
					                                         f32 %362 = OpFAdd %361 %161 
					                                Private f32* %363 = OpAccessChain %9 %24 
					                                                      OpStore %363 %362 
					                                         f32 %364 = OpLoad %218 
					                                Private f32* %365 = OpAccessChain %9 %24 
					                                         f32 %366 = OpLoad %365 
					                                         f32 %367 = OpFMul %364 %366 
					                                Private f32* %368 = OpAccessChain %9 %24 
					                                                      OpStore %368 %367 
					                                Private f32* %369 = OpAccessChain %9 %24 
					                                         f32 %370 = OpLoad %369 
					                                Uniform f32* %372 = OpAccessChain %13 %371 
					                                         f32 %373 = OpLoad %372 
					                                         f32 %374 = OpFMul %370 %373 
					                                Private f32* %375 = OpAccessChain %9 %24 
					                                                      OpStore %375 %374 
					                                Private f32* %376 = OpAccessChain %9 %24 
					                                         f32 %377 = OpLoad %376 
					                                         f32 %379 = OpFMul %377 %378 
					                                Private f32* %380 = OpAccessChain %9 %24 
					                                                      OpStore %380 %379 
					                                Private f32* %382 = OpAccessChain %72 %45 
					                                         f32 %383 = OpLoad %382 
					                                         f32 %384 = OpFNegate %383 
					                                         f32 %385 = OpFAdd %384 %161 
					                                                      OpStore %381 %385 
					                                Uniform f32* %387 = OpAccessChain %13 %386 
					                                         f32 %388 = OpLoad %387 
					                                         f32 %389 = OpFNegate %388 
					                                         f32 %390 = OpFAdd %389 %161 
					                                Private f32* %391 = OpAccessChain %58 %24 
					                                                      OpStore %391 %390 
					                                Private f32* %392 = OpAccessChain %58 %24 
					                                         f32 %393 = OpLoad %392 
					                                         f32 %394 = OpLoad %381 
					                                         f32 %395 = OpFNegate %394 
					                                         f32 %396 = OpFMul %393 %395 
					                                         f32 %397 = OpLoad %381 
					                                         f32 %398 = OpFAdd %396 %397 
					                                Private f32* %399 = OpAccessChain %179 %24 
					                                                      OpStore %399 %398 
					                                Private f32* %400 = OpAccessChain %179 %24 
					                                         f32 %401 = OpLoad %400 
					                                Private f32* %402 = OpAccessChain %9 %24 
					                                         f32 %403 = OpLoad %402 
					                                         f32 %404 = OpFNegate %403 
					                                         f32 %405 = OpFMul %401 %404 
					                                Private f32* %406 = OpAccessChain %9 %24 
					                                         f32 %407 = OpLoad %406 
					                                         f32 %408 = OpFAdd %405 %407 
					                                Private f32* %409 = OpAccessChain %9 %24 
					                                                      OpStore %409 %408 
					                                Private f32* %410 = OpAccessChain %9 %24 
					                                         f32 %411 = OpLoad %410 
					                                Uniform f32* %412 = OpAccessChain %13 %371 
					                                         f32 %413 = OpLoad %412 
					                                         f32 %414 = OpFMul %411 %413 
					                                Private f32* %415 = OpAccessChain %9 %24 
					                                                      OpStore %415 %414 
					                                       f32_3 %416 = OpLoad %72 
					                                       f32_3 %417 = OpVectorShuffle %416 %416 0 0 0 
					                                       f32_3 %418 = OpFNegate %417 
					                              Uniform f32_4* %420 = OpAccessChain %13 %419 
					                                       f32_4 %421 = OpLoad %420 
					                                       f32_3 %422 = OpVectorShuffle %421 %421 0 1 2 
					                                       f32_3 %423 = OpFAdd %418 %422 
					                                                      OpStore %179 %423 
					                                Uniform f32* %425 = OpAccessChain %13 %424 
					                                         f32 %426 = OpLoad %425 
					                                Uniform f32* %427 = OpAccessChain %13 %424 
					                                         f32 %428 = OpLoad %427 
					                                Uniform f32* %429 = OpAccessChain %13 %424 
					                                         f32 %430 = OpLoad %429 
					                                       f32_3 %431 = OpCompositeConstruct %426 %428 %430 
					                                         f32 %432 = OpCompositeExtract %431 0 
					                                         f32 %433 = OpCompositeExtract %431 1 
					                                         f32 %434 = OpCompositeExtract %431 2 
					                                       f32_3 %435 = OpCompositeConstruct %432 %433 %434 
					                                       f32_3 %436 = OpLoad %179 
					                                       f32_3 %437 = OpFMul %435 %436 
					                                       f32_3 %438 = OpLoad %72 
					                                       f32_3 %439 = OpVectorShuffle %438 %438 0 0 0 
					                                       f32_3 %440 = OpFAdd %437 %439 
					                                                      OpStore %179 %440 
					                                       f32_3 %441 = OpLoad %179 
					                                       f32_3 %442 = OpFNegate %441 
					                              Uniform f32_4* %444 = OpAccessChain %13 %443 
					                                       f32_4 %445 = OpLoad %444 
					                                       f32_3 %446 = OpVectorShuffle %445 %445 0 1 2 
					                                       f32_3 %447 = OpFAdd %442 %446 
					                                                      OpStore %32 %447 
					                                       f32_3 %448 = OpLoad %9 
					                                       f32_3 %449 = OpVectorShuffle %448 %448 0 0 0 
					                                       f32_3 %450 = OpLoad %32 
					                                       f32_3 %451 = OpFMul %449 %450 
					                                       f32_3 %452 = OpLoad %179 
					                                       f32_3 %453 = OpFAdd %451 %452 
					                                                      OpStore %9 %453 
					                                       f32_3 %454 = OpLoad %146 
					                                       f32_3 %455 = OpFNegate %454 
					                                       f32_3 %456 = OpLoad %9 
					                                       f32_3 %457 = OpFAdd %455 %456 
					                                                      OpStore %9 %457 
					                                Uniform f32* %461 = OpAccessChain %13 %460 
					                                         f32 %462 = OpLoad %461 
					                                Uniform f32* %463 = OpAccessChain %13 %460 
					                                         f32 %464 = OpLoad %463 
					                                Uniform f32* %465 = OpAccessChain %13 %460 
					                                         f32 %466 = OpLoad %465 
					                                       f32_3 %467 = OpCompositeConstruct %462 %464 %466 
					                                         f32 %468 = OpCompositeExtract %467 0 
					                                         f32 %469 = OpCompositeExtract %467 1 
					                                         f32 %470 = OpCompositeExtract %467 2 
					                                       f32_3 %471 = OpCompositeConstruct %468 %469 %470 
					                                       f32_3 %472 = OpLoad %9 
					                                       f32_3 %473 = OpFMul %471 %472 
					                                       f32_3 %474 = OpLoad %146 
					                                       f32_3 %475 = OpFAdd %473 %474 
					                                       f32_4 %476 = OpLoad %459 
					                                       f32_4 %477 = OpVectorShuffle %476 %475 4 5 6 3 
					                                                      OpStore %459 %477 
					                                 Output f32* %480 = OpAccessChain %459 %478 
					                                                      OpStore %480 %161 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
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
					vec3 u_xlat7;
					float u_xlat16_7;
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
					    u_xlat7.x = _Value2 * 25.0;
					    u_xlat0.x = u_xlat16_0 * u_xlat7.x;
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
					    u_xlat14.x = u_xlat16_14 * u_xlat7.x;
					    u_xlat14.x = exp2(u_xlat14.x);
					    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat16_3.xyw = (-u_xlat10_4.xyz) + u_xlat10_6.xyz;
					    u_xlat16_3.xyw = -abs(u_xlat16_3.xyw) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_3.xyw = max(u_xlat16_3.xyw, vec3(0.0, 0.0, 0.0));
					    u_xlat16_14 = u_xlat16_3.y * u_xlat16_3.x;
					    u_xlat16_14 = u_xlat16_3.w * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat14.x = u_xlat16_14 * u_xlat7.x;
					    u_xlat14.x = exp2(u_xlat14.x);
					    u_xlat14.x = dot(u_xlat14.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat16_14 = u_xlat16_2.y * u_xlat16_2.x;
					    u_xlat16_14 = u_xlat16_2.z * u_xlat16_14;
					    u_xlat16_14 = log2(u_xlat16_14);
					    u_xlat7.x = u_xlat16_14 * u_xlat7.x;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.x = dot(u_xlat7.xxxx, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat7.x * u_xlat0.x;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat10_3.z * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 1.5;
					    u_xlat16_7 = (-u_xlat10_1.y) + 1.0;
					    u_xlat14.x = (-_Value5) + 1.0;
					    u_xlat7.x = u_xlat14.x * (-u_xlat16_7) + u_xlat16_7;
					    u_xlat0.x = u_xlat7.x * (-u_xlat0.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat7.xyz = (-u_xlat10_1.xxx) + _PColor2.xyz;
					    u_xlat7.xyz = vec3(vec3(_Value6, _Value6, _Value6)) * u_xlat7.xyz + u_xlat10_1.xxx;
					    u_xlat1.xyz = (-u_xlat7.xyz) + _PColor.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat7.xyz;
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