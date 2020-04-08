Shader "CameraFilterPack/TV_ARCADE_2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 10067
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float Fade;
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat6.xy = u_xlat6.xy * vec2(2.20000005, 2.20000005);
					    u_xlat1.x = abs(u_xlat6.y) * 0.200000003;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = abs(u_xlat1.x) * 0.25;
					    u_xlat6.x = u_xlat6.x * u_xlat6.x + 1.0;
					    u_xlat1.y = u_xlat6.x * u_xlat6.y;
					    u_xlat6.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat6.xy = u_xlat6.xy * vec2(0.920000017, 0.920000017) + vec2(0.0399999991, 0.0399999991);
					    u_xlat6.xy = (-u_xlat0.xy) + u_xlat6.xy;
					    u_xlat0.xy = vec2(Fade) * u_xlat6.xy + u_xlat0.xy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat6.xy = u_xlat0.yy * vec2(21.0, 29.0);
					    u_xlat6.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat6.xy;
					    u_xlat6.xy = sin(u_xlat6.xy);
					    u_xlat6.x = u_xlat6.y * u_xlat6.x;
					    u_xlat9 = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat9 = u_xlat0.y * 31.0 + u_xlat9;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat6.x = u_xlat9 * u_xlat6.x;
					    u_xlat9 = u_xlat6.x * 0.00170000002 + u_xlat0.x;
					    u_xlat6.x = u_xlat6.x * 0.00170000002 + 0.0250000004;
					    u_xlat1.x = u_xlat9 + 0.00100000005;
					    u_xlat1.yw = u_xlat0.yy + vec2(0.00100000005, -0.0149999997);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_2.xyz = u_xlat10_2.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat9 = _Value2 * (-_TimeX);
					    u_xlat9 = fract(u_xlat9);
					    u_xlat9 = u_xlat0.y * _Value + (-u_xlat9);
					    u_xlat9 = u_xlat9 + -0.0500000007;
					    u_xlat9 = max(u_xlat9, 0.0);
					    u_xlat9 = min(u_xlat9, 0.100000001);
					    u_xlat1.x = u_xlat9 * 10.0 + -0.5;
					    u_xlat9 = u_xlat9 * 100.0;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -4.0 + 1.0;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = u_xlat9 * 0.0199999996;
					    u_xlat1.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
					    u_xlat1.z = u_xlat6.x * 0.75 + u_xlat0.x;
					    u_xlat6.xy = u_xlat1.zw + vec2(0.00100000005, 0.00100000005);
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_2.xyz;
					    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
					    u_xlat6.x = u_xlat0.x * u_xlat0.y;
					    u_xlat6.x = u_xlat6.x * 16.0;
					    u_xlat2.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat6.x = u_xlat6.x * u_xlat2.x;
					    u_xlat6.x = u_xlat2.y * u_xlat6.x;
					    u_xlat6.x = log2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 0.300000012;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat1.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.66000009, 2.94000006, 2.66000009);
					    u_xlat6.x = u_xlat0.y * _ScreenResolution.y;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xw = vec2(_TimeX) * vec2(3.5, 110.0);
					    u_xlat0.x = u_xlat6.x * 1.5 + u_xlat0.x;
					    u_xlat0.xw = sin(u_xlat0.xw);
					    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 1.70000005;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat9 = u_xlat0.w * 0.00999999978 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = vec3(Fade) * u_xlat0.xyz + u_xlat10_2.xyz;
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
					; Bound: 474
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %458 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %14 0 Offset 14 
					                                                      OpMemberDecorate %14 1 Offset 14 
					                                                      OpMemberDecorate %14 2 Offset 14 
					                                                      OpMemberDecorate %14 3 Offset 14 
					                                                      OpMemberDecorate %14 4 Offset 14 
					                                                      OpMemberDecorate %14 5 Offset 14 
					                                                      OpMemberDecorate %14 6 RelaxedPrecision 
					                                                      OpMemberDecorate %14 6 Offset 14 
					                                                      OpDecorate %14 Block 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %185 DescriptorSet 185 
					                                                      OpDecorate %185 Binding 185 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %189 DescriptorSet 189 
					                                                      OpDecorate %189 Binding 189 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %304 RelaxedPrecision 
					                                                      OpDecorate %305 RelaxedPrecision 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %349 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %369 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %374 RelaxedPrecision 
					                                                      OpDecorate %451 RelaxedPrecision 
					                                                      OpDecorate %452 RelaxedPrecision 
					                                                      OpDecorate %453 RelaxedPrecision 
					                                                      OpDecorate %458 Location 458 
					                                                      OpDecorate %465 RelaxedPrecision 
					                                                      OpDecorate %466 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeVector %6 4 
					                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %13 %13 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 6 
					                                              %19 = OpTypePointer Uniform %13 
					                               Private f32_2* %28 = OpVariable Private 
					                                          f32 %30 = OpConstant 3,674022E-40 
					                                        f32_2 %31 = OpConstantComposite %30 %30 
					                                          f32 %34 = OpConstant 3,674022E-40 
					                                        f32_2 %35 = OpConstantComposite %34 %34 
					                                              %37 = OpTypePointer Private %13 
					                               Private f32_4* %38 = OpVariable Private 
					                                              %39 = OpTypeInt 32 0 
					                                          u32 %40 = OpConstant 1 
					                                              %41 = OpTypePointer Private %6 
					                                          f32 %45 = OpConstant 3,674022E-40 
					                                          u32 %47 = OpConstant 0 
					                                          f32 %54 = OpConstant 3,674022E-40 
					                                          f32 %66 = OpConstant 3,674022E-40 
					                                          f32 %84 = OpConstant 3,674022E-40 
					                                        f32_2 %85 = OpConstantComposite %84 %84 
					                                          f32 %89 = OpConstant 3,674022E-40 
					                                        f32_2 %90 = OpConstantComposite %89 %89 
					                                          f32 %92 = OpConstant 3,674022E-40 
					                                        f32_2 %93 = OpConstantComposite %92 %92 
					                                          i32 %99 = OpConstant 4 
					                                             %100 = OpTypePointer Uniform %6 
					                                         f32 %109 = OpConstant 3,674022E-40 
					                                         f32 %115 = OpConstant 3,674022E-40 
					                                         f32 %116 = OpConstant 3,674022E-40 
					                                       f32_2 %117 = OpConstantComposite %115 %116 
					                                         i32 %119 = OpConstant 0 
					                                         f32 %123 = OpConstant 3,674022E-40 
					                                         f32 %124 = OpConstant 3,674022E-40 
					                                       f32_2 %125 = OpConstantComposite %123 %124 
					                                Private f32* %137 = OpVariable Private 
					                                         f32 %140 = OpConstant 3,674022E-40 
					                                         f32 %145 = OpConstant 3,674022E-40 
					                                         f32 %158 = OpConstant 3,674022E-40 
					                                         f32 %166 = OpConstant 3,674022E-40 
					                                         f32 %170 = OpConstant 3,674022E-40 
					                                         f32 %175 = OpConstant 3,674022E-40 
					                                       f32_2 %176 = OpConstantComposite %170 %175 
					                                             %180 = OpTypeVector %6 3 
					                                             %181 = OpTypePointer Private %180 
					                              Private f32_3* %182 = OpVariable Private 
					                                             %183 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %184 = OpTypePointer UniformConstant %183 
					        UniformConstant read_only Texture2D* %185 = OpVariable UniformConstant 
					                                             %187 = OpTypeSampler 
					                                             %188 = OpTypePointer UniformConstant %187 
					                    UniformConstant sampler* %189 = OpVariable UniformConstant 
					                                             %191 = OpTypeSampledImage %183 
					                              Private f32_3* %197 = OpVariable Private 
					                                         f32 %199 = OpConstant 3,674022E-40 
					                                       f32_3 %200 = OpConstantComposite %199 %199 %199 
					                                         i32 %202 = OpConstant 2 
					                                         i32 %213 = OpConstant 1 
					                                         f32 %221 = OpConstant 3,674022E-40 
					                                         f32 %226 = OpConstant 3,674022E-40 
					                                         f32 %229 = OpConstant 3,674022E-40 
					                                         f32 %234 = OpConstant 3,674022E-40 
					                                         f32 %246 = OpConstant 3,674022E-40 
					                                         f32 %255 = OpConstant 3,674022E-40 
					                                         f32 %265 = OpConstant 3,674022E-40 
					                                         u32 %270 = OpConstant 2 
					                                       f32_2 %274 = OpConstantComposite %170 %170 
					                              Private f32_3* %276 = OpVariable Private 
					                              Private f32_3* %283 = OpVariable Private 
					                                         f32 %285 = OpConstant 3,674022E-40 
					                                       f32_3 %286 = OpConstantComposite %285 %199 %285 
					                                         f32 %294 = OpConstant 3,674022E-40 
					                                       f32_3 %295 = OpConstantComposite %294 %294 %294 
					                                         f32 %298 = OpConstant 3,674022E-40 
					                                       f32_3 %299 = OpConstantComposite %298 %298 %298 
					                                         f32 %315 = OpConstant 3,674022E-40 
					                              Private f32_2* %318 = OpVariable Private 
					                                       f32_2 %321 = OpConstantComposite %54 %54 
					                                         f32 %355 = OpConstant 3,674022E-40 
					                                         f32 %356 = OpConstant 3,674022E-40 
					                                       f32_3 %357 = OpConstantComposite %355 %356 %355 
					                                         i32 %363 = OpConstant 5 
					                              Private f32_4* %368 = OpVariable Private 
					                                Private f32* %377 = OpVariable Private 
					                                         f32 %380 = OpConstant 3,674022E-40 
					                                         f32 %384 = OpConstant 3,674022E-40 
					                                         f32 %395 = OpConstant 3,674022E-40 
					                                         f32 %405 = OpConstant 3,674022E-40 
					                                         i32 %414 = OpConstant 3 
					                                         f32 %433 = OpConstant 3,674022E-40 
					                                         f32 %442 = OpConstant 3,674022E-40 
					                                             %457 = OpTypePointer Output %13 
					                               Output f32_4* %458 = OpVariable Output 
					                                         u32 %470 = OpConstant 3 
					                                             %471 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_2 %12 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %20 = OpAccessChain %16 %18 
					                                        f32_4 %21 = OpLoad %20 
					                                        f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                                        f32_2 %23 = OpFMul %12 %22 
					                               Uniform f32_4* %24 = OpAccessChain %16 %18 
					                                        f32_4 %25 = OpLoad %24 
					                                        f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                                        f32_2 %27 = OpFAdd %23 %26 
					                                                      OpStore %9 %27 
					                                        f32_2 %29 = OpLoad %9 
					                                        f32_2 %32 = OpFAdd %29 %31 
					                                                      OpStore %28 %32 
					                                        f32_2 %33 = OpLoad %28 
					                                        f32_2 %36 = OpFMul %33 %35 
					                                                      OpStore %28 %36 
					                                 Private f32* %42 = OpAccessChain %28 %40 
					                                          f32 %43 = OpLoad %42 
					                                          f32 %44 = OpExtInst %1 4 %43 
					                                          f32 %46 = OpFMul %44 %45 
					                                 Private f32* %48 = OpAccessChain %38 %47 
					                                                      OpStore %48 %46 
					                                 Private f32* %49 = OpAccessChain %38 %47 
					                                          f32 %50 = OpLoad %49 
					                                 Private f32* %51 = OpAccessChain %38 %47 
					                                          f32 %52 = OpLoad %51 
					                                          f32 %53 = OpFMul %50 %52 
					                                          f32 %55 = OpFAdd %53 %54 
					                                 Private f32* %56 = OpAccessChain %38 %47 
					                                                      OpStore %56 %55 
					                                 Private f32* %57 = OpAccessChain %28 %47 
					                                          f32 %58 = OpLoad %57 
					                                 Private f32* %59 = OpAccessChain %38 %47 
					                                          f32 %60 = OpLoad %59 
					                                          f32 %61 = OpFMul %58 %60 
					                                 Private f32* %62 = OpAccessChain %38 %47 
					                                                      OpStore %62 %61 
					                                 Private f32* %63 = OpAccessChain %38 %47 
					                                          f32 %64 = OpLoad %63 
					                                          f32 %65 = OpExtInst %1 4 %64 
					                                          f32 %67 = OpFMul %65 %66 
					                                 Private f32* %68 = OpAccessChain %28 %47 
					                                                      OpStore %68 %67 
					                                 Private f32* %69 = OpAccessChain %28 %47 
					                                          f32 %70 = OpLoad %69 
					                                 Private f32* %71 = OpAccessChain %28 %47 
					                                          f32 %72 = OpLoad %71 
					                                          f32 %73 = OpFMul %70 %72 
					                                          f32 %74 = OpFAdd %73 %54 
					                                 Private f32* %75 = OpAccessChain %28 %47 
					                                                      OpStore %75 %74 
					                                 Private f32* %76 = OpAccessChain %28 %47 
					                                          f32 %77 = OpLoad %76 
					                                 Private f32* %78 = OpAccessChain %28 %40 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFMul %77 %79 
					                                 Private f32* %81 = OpAccessChain %38 %40 
					                                                      OpStore %81 %80 
					                                        f32_4 %82 = OpLoad %38 
					                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
					                                        f32_2 %86 = OpFMul %83 %85 
					                                        f32_2 %87 = OpFAdd %86 %85 
					                                                      OpStore %28 %87 
					                                        f32_2 %88 = OpLoad %28 
					                                        f32_2 %91 = OpFMul %88 %90 
					                                        f32_2 %94 = OpFAdd %91 %93 
					                                                      OpStore %28 %94 
					                                        f32_2 %95 = OpLoad %9 
					                                        f32_2 %96 = OpFNegate %95 
					                                        f32_2 %97 = OpLoad %28 
					                                        f32_2 %98 = OpFAdd %96 %97 
					                                                      OpStore %28 %98 
					                                Uniform f32* %101 = OpAccessChain %16 %99 
					                                         f32 %102 = OpLoad %101 
					                                       f32_2 %103 = OpCompositeConstruct %102 %102 
					                                       f32_2 %104 = OpLoad %28 
					                                       f32_2 %105 = OpFMul %103 %104 
					                                       f32_2 %106 = OpLoad %9 
					                                       f32_2 %107 = OpFAdd %105 %106 
					                                                      OpStore %9 %107 
					                                       f32_2 %108 = OpLoad %9 
					                                       f32_2 %110 = OpCompositeConstruct %109 %109 
					                                       f32_2 %111 = OpCompositeConstruct %54 %54 
					                                       f32_2 %112 = OpExtInst %1 43 %108 %110 %111 
					                                                      OpStore %9 %112 
					                                       f32_2 %113 = OpLoad %9 
					                                       f32_2 %114 = OpVectorShuffle %113 %113 1 1 
					                                       f32_2 %118 = OpFMul %114 %117 
					                                                      OpStore %28 %118 
					                                Uniform f32* %120 = OpAccessChain %16 %119 
					                                         f32 %121 = OpLoad %120 
					                                       f32_2 %122 = OpCompositeConstruct %121 %121 
					                                       f32_2 %126 = OpFMul %122 %125 
					                                       f32_2 %127 = OpLoad %28 
					                                       f32_2 %128 = OpFAdd %126 %127 
					                                                      OpStore %28 %128 
					                                       f32_2 %129 = OpLoad %28 
					                                       f32_2 %130 = OpExtInst %1 13 %129 
					                                                      OpStore %28 %130 
					                                Private f32* %131 = OpAccessChain %28 %40 
					                                         f32 %132 = OpLoad %131 
					                                Private f32* %133 = OpAccessChain %28 %47 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpFMul %132 %134 
					                                Private f32* %136 = OpAccessChain %28 %47 
					                                                      OpStore %136 %135 
					                                Uniform f32* %138 = OpAccessChain %16 %119 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %141 = OpFMul %139 %140 
					                                         f32 %142 = OpFAdd %141 %123 
					                                                      OpStore %137 %142 
					                                Private f32* %143 = OpAccessChain %9 %40 
					                                         f32 %144 = OpLoad %143 
					                                         f32 %146 = OpFMul %144 %145 
					                                         f32 %147 = OpLoad %137 
					                                         f32 %148 = OpFAdd %146 %147 
					                                                      OpStore %137 %148 
					                                         f32 %149 = OpLoad %137 
					                                         f32 %150 = OpExtInst %1 13 %149 
					                                                      OpStore %137 %150 
					                                         f32 %151 = OpLoad %137 
					                                Private f32* %152 = OpAccessChain %28 %47 
					                                         f32 %153 = OpLoad %152 
					                                         f32 %154 = OpFMul %151 %153 
					                                Private f32* %155 = OpAccessChain %28 %47 
					                                                      OpStore %155 %154 
					                                Private f32* %156 = OpAccessChain %28 %47 
					                                         f32 %157 = OpLoad %156 
					                                         f32 %159 = OpFMul %157 %158 
					                                Private f32* %160 = OpAccessChain %9 %47 
					                                         f32 %161 = OpLoad %160 
					                                         f32 %162 = OpFAdd %159 %161 
					                                                      OpStore %137 %162 
					                                Private f32* %163 = OpAccessChain %28 %47 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpFMul %164 %158 
					                                         f32 %167 = OpFAdd %165 %166 
					                                Private f32* %168 = OpAccessChain %28 %47 
					                                                      OpStore %168 %167 
					                                         f32 %169 = OpLoad %137 
					                                         f32 %171 = OpFAdd %169 %170 
					                                Private f32* %172 = OpAccessChain %38 %47 
					                                                      OpStore %172 %171 
					                                       f32_2 %173 = OpLoad %9 
					                                       f32_2 %174 = OpVectorShuffle %173 %173 1 1 
					                                       f32_2 %177 = OpFAdd %174 %176 
					                                       f32_4 %178 = OpLoad %38 
					                                       f32_4 %179 = OpVectorShuffle %178 %177 0 4 2 5 
					                                                      OpStore %38 %179 
					                         read_only Texture2D %186 = OpLoad %185 
					                                     sampler %190 = OpLoad %189 
					                  read_only Texture2DSampled %192 = OpSampledImage %186 %190 
					                                       f32_4 %193 = OpLoad %38 
					                                       f32_2 %194 = OpVectorShuffle %193 %193 0 1 
					                                       f32_4 %195 = OpImageSampleImplicitLod %192 %194 
					                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
					                                                      OpStore %182 %196 
					                                       f32_3 %198 = OpLoad %182 
					                                       f32_3 %201 = OpFAdd %198 %200 
					                                                      OpStore %197 %201 
					                                Uniform f32* %203 = OpAccessChain %16 %202 
					                                         f32 %204 = OpLoad %203 
					                                Uniform f32* %205 = OpAccessChain %16 %119 
					                                         f32 %206 = OpLoad %205 
					                                         f32 %207 = OpFNegate %206 
					                                         f32 %208 = OpFMul %204 %207 
					                                                      OpStore %137 %208 
					                                         f32 %209 = OpLoad %137 
					                                         f32 %210 = OpExtInst %1 10 %209 
					                                                      OpStore %137 %210 
					                                Private f32* %211 = OpAccessChain %9 %40 
					                                         f32 %212 = OpLoad %211 
					                                Uniform f32* %214 = OpAccessChain %16 %213 
					                                         f32 %215 = OpLoad %214 
					                                         f32 %216 = OpFMul %212 %215 
					                                         f32 %217 = OpLoad %137 
					                                         f32 %218 = OpFNegate %217 
					                                         f32 %219 = OpFAdd %216 %218 
					                                                      OpStore %137 %219 
					                                         f32 %220 = OpLoad %137 
					                                         f32 %222 = OpFAdd %220 %221 
					                                                      OpStore %137 %222 
					                                         f32 %223 = OpLoad %137 
					                                         f32 %224 = OpExtInst %1 40 %223 %109 
					                                                      OpStore %137 %224 
					                                         f32 %225 = OpLoad %137 
					                                         f32 %227 = OpExtInst %1 37 %225 %226 
					                                                      OpStore %137 %227 
					                                         f32 %228 = OpLoad %137 
					                                         f32 %230 = OpFMul %228 %229 
					                                         f32 %231 = OpFAdd %230 %30 
					                                Private f32* %232 = OpAccessChain %38 %47 
					                                                      OpStore %232 %231 
					                                         f32 %233 = OpLoad %137 
					                                         f32 %235 = OpFMul %233 %234 
					                                                      OpStore %137 %235 
					                                         f32 %236 = OpLoad %137 
					                                         f32 %237 = OpExtInst %1 13 %236 
					                                                      OpStore %137 %237 
					                                Private f32* %238 = OpAccessChain %38 %47 
					                                         f32 %239 = OpLoad %238 
					                                Private f32* %240 = OpAccessChain %38 %47 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpFMul %239 %241 
					                                Private f32* %243 = OpAccessChain %38 %47 
					                                                      OpStore %243 %242 
					                                Private f32* %244 = OpAccessChain %38 %47 
					                                         f32 %245 = OpLoad %244 
					                                         f32 %247 = OpFMul %245 %246 
					                                         f32 %248 = OpFAdd %247 %54 
					                                Private f32* %249 = OpAccessChain %38 %47 
					                                                      OpStore %249 %248 
					                                         f32 %250 = OpLoad %137 
					                                Private f32* %251 = OpAccessChain %38 %47 
					                                         f32 %252 = OpLoad %251 
					                                         f32 %253 = OpFMul %250 %252 
					                                                      OpStore %137 %253 
					                                         f32 %254 = OpLoad %137 
					                                         f32 %256 = OpFMul %254 %255 
					                                Private f32* %257 = OpAccessChain %38 %47 
					                                                      OpStore %257 %256 
					                                Private f32* %258 = OpAccessChain %38 %40 
					                                                      OpStore %258 %109 
					                                       f32_2 %259 = OpLoad %9 
					                                       f32_4 %260 = OpLoad %38 
					                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
					                                       f32_2 %262 = OpFAdd %259 %261 
					                                                      OpStore %9 %262 
					                                Private f32* %263 = OpAccessChain %28 %47 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %266 = OpFMul %264 %265 
					                                Private f32* %267 = OpAccessChain %9 %47 
					                                         f32 %268 = OpLoad %267 
					                                         f32 %269 = OpFAdd %266 %268 
					                                Private f32* %271 = OpAccessChain %38 %270 
					                                                      OpStore %271 %269 
					                                       f32_4 %272 = OpLoad %38 
					                                       f32_2 %273 = OpVectorShuffle %272 %272 2 3 
					                                       f32_2 %275 = OpFAdd %273 %274 
					                                                      OpStore %28 %275 
					                         read_only Texture2D %277 = OpLoad %185 
					                                     sampler %278 = OpLoad %189 
					                  read_only Texture2DSampled %279 = OpSampledImage %277 %278 
					                                       f32_2 %280 = OpLoad %28 
					                                       f32_4 %281 = OpImageSampleImplicitLod %279 %280 
					                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
					                                                      OpStore %276 %282 
					                                       f32_3 %284 = OpLoad %276 
					                                       f32_3 %287 = OpFMul %284 %286 
					                                       f32_3 %288 = OpLoad %197 
					                                       f32_3 %289 = OpFAdd %287 %288 
					                                                      OpStore %283 %289 
					                                       f32_3 %290 = OpLoad %283 
					                                       f32_3 %291 = OpLoad %283 
					                                       f32_3 %292 = OpFMul %290 %291 
					                                                      OpStore %197 %292 
					                                       f32_3 %293 = OpLoad %197 
					                                       f32_3 %296 = OpFMul %293 %295 
					                                                      OpStore %197 %296 
					                                       f32_3 %297 = OpLoad %283 
					                                       f32_3 %300 = OpFMul %297 %299 
					                                       f32_3 %301 = OpLoad %197 
					                                       f32_3 %302 = OpFAdd %300 %301 
					                                                      OpStore %283 %302 
					                                       f32_3 %303 = OpLoad %283 
					                                       f32_3 %304 = OpCompositeConstruct %109 %109 %109 
					                                       f32_3 %305 = OpCompositeConstruct %54 %54 %54 
					                                       f32_3 %306 = OpExtInst %1 43 %303 %304 %305 
					                                                      OpStore %283 %306 
					                                Private f32* %307 = OpAccessChain %9 %47 
					                                         f32 %308 = OpLoad %307 
					                                Private f32* %309 = OpAccessChain %9 %40 
					                                         f32 %310 = OpLoad %309 
					                                         f32 %311 = OpFMul %308 %310 
					                                Private f32* %312 = OpAccessChain %28 %47 
					                                                      OpStore %312 %311 
					                                Private f32* %313 = OpAccessChain %28 %47 
					                                         f32 %314 = OpLoad %313 
					                                         f32 %316 = OpFMul %314 %315 
					                                Private f32* %317 = OpAccessChain %28 %47 
					                                                      OpStore %317 %316 
					                                       f32_2 %319 = OpLoad %9 
					                                       f32_2 %320 = OpFNegate %319 
					                                       f32_2 %322 = OpFAdd %320 %321 
					                                                      OpStore %318 %322 
					                                Private f32* %323 = OpAccessChain %28 %47 
					                                         f32 %324 = OpLoad %323 
					                                Private f32* %325 = OpAccessChain %318 %47 
					                                         f32 %326 = OpLoad %325 
					                                         f32 %327 = OpFMul %324 %326 
					                                Private f32* %328 = OpAccessChain %28 %47 
					                                                      OpStore %328 %327 
					                                Private f32* %329 = OpAccessChain %318 %40 
					                                         f32 %330 = OpLoad %329 
					                                Private f32* %331 = OpAccessChain %28 %47 
					                                         f32 %332 = OpLoad %331 
					                                         f32 %333 = OpFMul %330 %332 
					                                Private f32* %334 = OpAccessChain %28 %47 
					                                                      OpStore %334 %333 
					                                Private f32* %335 = OpAccessChain %28 %47 
					                                         f32 %336 = OpLoad %335 
					                                         f32 %337 = OpExtInst %1 30 %336 
					                                Private f32* %338 = OpAccessChain %28 %47 
					                                                      OpStore %338 %337 
					                                Private f32* %339 = OpAccessChain %28 %47 
					                                         f32 %340 = OpLoad %339 
					                                         f32 %341 = OpFMul %340 %123 
					                                Private f32* %342 = OpAccessChain %28 %47 
					                                                      OpStore %342 %341 
					                                Private f32* %343 = OpAccessChain %28 %47 
					                                         f32 %344 = OpLoad %343 
					                                         f32 %345 = OpExtInst %1 29 %344 
					                                Private f32* %346 = OpAccessChain %28 %47 
					                                                      OpStore %346 %345 
					                                       f32_2 %347 = OpLoad %28 
					                                       f32_3 %348 = OpVectorShuffle %347 %347 0 0 0 
					                                       f32_3 %349 = OpLoad %283 
					                                       f32_3 %350 = OpFMul %348 %349 
					                                       f32_4 %351 = OpLoad %38 
					                                       f32_4 %352 = OpVectorShuffle %351 %350 4 5 6 3 
					                                                      OpStore %38 %352 
					                                       f32_4 %353 = OpLoad %38 
					                                       f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
					                                       f32_3 %358 = OpFMul %354 %357 
					                                       f32_4 %359 = OpLoad %38 
					                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
					                                                      OpStore %38 %360 
					                                Private f32* %361 = OpAccessChain %9 %40 
					                                         f32 %362 = OpLoad %361 
					                                Uniform f32* %364 = OpAccessChain %16 %363 %40 
					                                         f32 %365 = OpLoad %364 
					                                         f32 %366 = OpFMul %362 %365 
					                                Private f32* %367 = OpAccessChain %28 %47 
					                                                      OpStore %367 %366 
					                         read_only Texture2D %369 = OpLoad %185 
					                                     sampler %370 = OpLoad %189 
					                  read_only Texture2DSampled %371 = OpSampledImage %369 %370 
					                                       f32_2 %372 = OpLoad %9 
					                                       f32_4 %373 = OpImageSampleImplicitLod %371 %372 
					                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
					                                       f32_4 %375 = OpLoad %368 
					                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 2 6 
					                                                      OpStore %368 %376 
					                                Uniform f32* %378 = OpAccessChain %16 %119 
					                                         f32 %379 = OpLoad %378 
					                                         f32 %381 = OpFMul %379 %380 
					                                                      OpStore %377 %381 
					                                Private f32* %382 = OpAccessChain %28 %47 
					                                         f32 %383 = OpLoad %382 
					                                         f32 %385 = OpFMul %383 %384 
					                                         f32 %386 = OpLoad %377 
					                                         f32 %387 = OpFAdd %385 %386 
					                                Private f32* %388 = OpAccessChain %28 %47 
					                                                      OpStore %388 %387 
					                                Private f32* %389 = OpAccessChain %28 %47 
					                                         f32 %390 = OpLoad %389 
					                                         f32 %391 = OpExtInst %1 13 %390 
					                                Private f32* %392 = OpAccessChain %28 %47 
					                                                      OpStore %392 %391 
					                                Private f32* %393 = OpAccessChain %28 %47 
					                                         f32 %394 = OpLoad %393 
					                                         f32 %396 = OpFMul %394 %395 
					                                         f32 %397 = OpFAdd %396 %395 
					                                Private f32* %398 = OpAccessChain %28 %47 
					                                                      OpStore %398 %397 
					                                Private f32* %399 = OpAccessChain %28 %47 
					                                         f32 %400 = OpLoad %399 
					                                         f32 %401 = OpExtInst %1 30 %400 
					                                Private f32* %402 = OpAccessChain %28 %47 
					                                                      OpStore %402 %401 
					                                Private f32* %403 = OpAccessChain %28 %47 
					                                         f32 %404 = OpLoad %403 
					                                         f32 %406 = OpFMul %404 %405 
					                                Private f32* %407 = OpAccessChain %28 %47 
					                                                      OpStore %407 %406 
					                                Private f32* %408 = OpAccessChain %28 %47 
					                                         f32 %409 = OpLoad %408 
					                                         f32 %410 = OpExtInst %1 29 %409 
					                                Private f32* %411 = OpAccessChain %28 %47 
					                                                      OpStore %411 %410 
					                                Private f32* %412 = OpAccessChain %28 %47 
					                                         f32 %413 = OpLoad %412 
					                                Uniform f32* %415 = OpAccessChain %16 %414 
					                                         f32 %416 = OpLoad %415 
					                                         f32 %417 = OpFMul %413 %416 
					                                Private f32* %418 = OpAccessChain %28 %47 
					                                                      OpStore %418 %417 
					                                Private f32* %419 = OpAccessChain %28 %47 
					                                         f32 %420 = OpLoad %419 
					                                         f32 %421 = OpFMul %420 %124 
					                                         f32 %422 = OpFAdd %421 %294 
					                                Private f32* %423 = OpAccessChain %28 %47 
					                                                      OpStore %423 %422 
					                                       f32_2 %424 = OpLoad %28 
					                                       f32_3 %425 = OpVectorShuffle %424 %424 0 0 0 
					                                       f32_4 %426 = OpLoad %38 
					                                       f32_3 %427 = OpVectorShuffle %426 %426 0 1 2 
					                                       f32_3 %428 = OpFMul %425 %427 
					                                       f32_4 %429 = OpLoad %38 
					                                       f32_4 %430 = OpVectorShuffle %429 %428 4 5 6 3 
					                                                      OpStore %38 %430 
					                                Uniform f32* %431 = OpAccessChain %16 %119 
					                                         f32 %432 = OpLoad %431 
					                                         f32 %434 = OpFMul %432 %433 
					                                Private f32* %435 = OpAccessChain %28 %47 
					                                                      OpStore %435 %434 
					                                Private f32* %436 = OpAccessChain %28 %47 
					                                         f32 %437 = OpLoad %436 
					                                         f32 %438 = OpExtInst %1 13 %437 
					                                Private f32* %439 = OpAccessChain %28 %47 
					                                                      OpStore %439 %438 
					                                Private f32* %440 = OpAccessChain %28 %47 
					                                         f32 %441 = OpLoad %440 
					                                         f32 %443 = OpFMul %441 %442 
					                                         f32 %444 = OpFAdd %443 %54 
					                                Private f32* %445 = OpAccessChain %28 %47 
					                                                      OpStore %445 %444 
					                                       f32_4 %446 = OpLoad %38 
					                                       f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
					                                       f32_2 %448 = OpLoad %28 
					                                       f32_3 %449 = OpVectorShuffle %448 %448 0 0 0 
					                                       f32_3 %450 = OpFMul %447 %449 
					                                       f32_4 %451 = OpLoad %368 
					                                       f32_3 %452 = OpVectorShuffle %451 %451 0 1 3 
					                                       f32_3 %453 = OpFNegate %452 
					                                       f32_3 %454 = OpFAdd %450 %453 
					                                       f32_4 %455 = OpLoad %38 
					                                       f32_4 %456 = OpVectorShuffle %455 %454 4 5 6 3 
					                                                      OpStore %38 %456 
					                                Uniform f32* %459 = OpAccessChain %16 %99 
					                                         f32 %460 = OpLoad %459 
					                                       f32_3 %461 = OpCompositeConstruct %460 %460 %460 
					                                       f32_4 %462 = OpLoad %38 
					                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
					                                       f32_3 %464 = OpFMul %461 %463 
					                                       f32_4 %465 = OpLoad %368 
					                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 3 
					                                       f32_3 %467 = OpFAdd %464 %466 
					                                       f32_4 %468 = OpLoad %458 
					                                       f32_4 %469 = OpVectorShuffle %468 %467 4 5 6 3 
					                                                      OpStore %458 %469 
					                                 Output f32* %472 = OpAccessChain %458 %470 
					                                                      OpStore %472 %54 
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
						float _TimeX;
						float _Value;
						float _Value2;
						float _Value3;
						float Fade;
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat6.xy = u_xlat6.xy * vec2(2.20000005, 2.20000005);
					    u_xlat1.x = abs(u_xlat6.y) * 0.200000003;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = abs(u_xlat1.x) * 0.25;
					    u_xlat6.x = u_xlat6.x * u_xlat6.x + 1.0;
					    u_xlat1.y = u_xlat6.x * u_xlat6.y;
					    u_xlat6.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat6.xy = u_xlat6.xy * vec2(0.920000017, 0.920000017) + vec2(0.0399999991, 0.0399999991);
					    u_xlat6.xy = (-u_xlat0.xy) + u_xlat6.xy;
					    u_xlat0.xy = vec2(Fade) * u_xlat6.xy + u_xlat0.xy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat6.xy = u_xlat0.yy * vec2(21.0, 29.0);
					    u_xlat6.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat6.xy;
					    u_xlat6.xy = sin(u_xlat6.xy);
					    u_xlat6.x = u_xlat6.y * u_xlat6.x;
					    u_xlat9 = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat9 = u_xlat0.y * 31.0 + u_xlat9;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat6.x = u_xlat9 * u_xlat6.x;
					    u_xlat9 = u_xlat6.x * 0.00170000002 + u_xlat0.x;
					    u_xlat6.x = u_xlat6.x * 0.00170000002 + 0.0250000004;
					    u_xlat1.x = u_xlat9 + 0.00100000005;
					    u_xlat1.yw = u_xlat0.yy + vec2(0.00100000005, -0.0149999997);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_2.xyz = u_xlat10_2.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat9 = _Value2 * (-_TimeX);
					    u_xlat9 = fract(u_xlat9);
					    u_xlat9 = u_xlat0.y * _Value + (-u_xlat9);
					    u_xlat9 = u_xlat9 + -0.0500000007;
					    u_xlat9 = max(u_xlat9, 0.0);
					    u_xlat9 = min(u_xlat9, 0.100000001);
					    u_xlat1.x = u_xlat9 * 10.0 + -0.5;
					    u_xlat9 = u_xlat9 * 100.0;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -4.0 + 1.0;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = u_xlat9 * 0.0199999996;
					    u_xlat1.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
					    u_xlat1.z = u_xlat6.x * 0.75 + u_xlat0.x;
					    u_xlat6.xy = u_xlat1.zw + vec2(0.00100000005, 0.00100000005);
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_2.xyz;
					    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
					    u_xlat6.x = u_xlat0.x * u_xlat0.y;
					    u_xlat6.x = u_xlat6.x * 16.0;
					    u_xlat2.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat6.x = u_xlat6.x * u_xlat2.x;
					    u_xlat6.x = u_xlat2.y * u_xlat6.x;
					    u_xlat6.x = log2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 0.300000012;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat1.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.66000009, 2.94000006, 2.66000009);
					    u_xlat6.x = u_xlat0.y * _ScreenResolution.y;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xw = vec2(_TimeX) * vec2(3.5, 110.0);
					    u_xlat0.x = u_xlat6.x * 1.5 + u_xlat0.x;
					    u_xlat0.xw = sin(u_xlat0.xw);
					    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 1.70000005;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat9 = u_xlat0.w * 0.00999999978 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = vec3(Fade) * u_xlat0.xyz + u_xlat10_2.xyz;
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