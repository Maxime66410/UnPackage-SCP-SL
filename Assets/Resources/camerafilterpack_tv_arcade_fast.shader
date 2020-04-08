Shader "CameraFilterPack/TV_ARCADE_Fast" {
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
			GpuProgramID 59279
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
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					bool u_xlatb4;
					float u_xlat5;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _Value2 * _TimeX;
					    u_xlat0.x = u_xlat0.x * 0.666666687;
					    u_xlatb4 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex2, u_xlat4.xy);
					    u_xlat12 = u_xlat0.x * 1.5 + (-u_xlat10_1.y);
					    u_xlat1.xw = vec2(u_xlat12) * vec2(50.0, -50.0);
					    u_xlat1.xw = clamp(u_xlat1.xw, 0.0, 1.0);
					    u_xlat2.xy = u_xlat1.xw * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat1.xw = u_xlat1.xw * u_xlat1.xw;
					    u_xlat1.xw = u_xlat1.xw * u_xlat2.xy;
					    u_xlat12 = u_xlat1.w + u_xlat1.x;
					    u_xlat16_1 = u_xlat10_1.y + 0.0399999991;
					    u_xlat5 = u_xlat10_1.z * _Value3;
					    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat16_1);
					    u_xlat1.xz = u_xlat0.xx * vec2(50.0, -50.0);
					    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
					    u_xlat2.xy = u_xlat1.xz * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat1.xz = u_xlat1.xz * u_xlat1.xz;
					    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat12;
					    u_xlat0.x = u_xlat2.y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat2.x = u_xlat0.x * Fade + u_xlat4.x;
					    u_xlat0.x = abs(u_xlat4.x) * 0.25;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * Fade + 1.0;
					    u_xlat2.y = u_xlat0.x * u_xlat4.y;
					    u_xlat0.xy = u_xlat2.xy + vec2(0.0187500007, -0.0149999997);
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat8 = u_xlat2.y * _ScreenResolution.y;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyw = u_xlat10_3.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat16_0.xyw = u_xlat10_2.xyz * vec3(0.180000007, 0.150000006, 0.180000007) + u_xlat16_0.xyw;
					    u_xlat0.xyw = vec3(u_xlat5) * u_xlat16_0.xyw;
					    u_xlat0.xyw = u_xlat0.xyw * vec3(3.46000004, 3.94000006, 3.46000004);
					    u_xlat1.x = _TimeX + _TimeX;
					    u_xlat8 = u_xlat8 * 1.79999995 + u_xlat1.x;
					    u_xlat8 = sin(u_xlat8);
					    u_xlat8 = u_xlat8 * 0.174999997 + 0.400000006;
					    u_xlat0.xyz = u_xlat0.xyw * vec3(u_xlat8) + (-u_xlat10_3.xyz);
					    SV_Target0.xyz = vec3(Fade) * u_xlat0.xyz + u_xlat10_3.xyz;
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
					; Bound: 355
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %62 %339 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %10 0 Offset 10 
					                                                      OpMemberDecorate %10 1 Offset 10 
					                                                      OpMemberDecorate %10 2 Offset 10 
					                                                      OpMemberDecorate %10 3 Offset 10 
					                                                      OpMemberDecorate %10 4 Offset 10 
					                                                      OpMemberDecorate %10 5 Offset 10 
					                                                      OpMemberDecorate %10 6 RelaxedPrecision 
					                                                      OpMemberDecorate %10 6 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 62 
					                                                      OpDecorate %67 RelaxedPrecision 
					                                                      OpDecorate %68 RelaxedPrecision 
					                                                      OpDecorate %71 RelaxedPrecision 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %74 RelaxedPrecision 
					                                                      OpDecorate %77 RelaxedPrecision 
					                                                      OpDecorate %77 DescriptorSet 77 
					                                                      OpDecorate %77 Binding 77 
					                                                      OpDecorate %78 RelaxedPrecision 
					                                                      OpDecorate %81 RelaxedPrecision 
					                                                      OpDecorate %81 DescriptorSet 81 
					                                                      OpDecorate %81 Binding 81 
					                                                      OpDecorate %82 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %251 DescriptorSet 251 
					                                                      OpDecorate %251 Binding 251 
					                                                      OpDecorate %252 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %253 DescriptorSet 253 
					                                                      OpDecorate %253 Binding 253 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %332 RelaxedPrecision 
					                                                      OpDecorate %333 RelaxedPrecision 
					                                                      OpDecorate %334 RelaxedPrecision 
					                                                      OpDecorate %339 Location 339 
					                                                      OpDecorate %346 RelaxedPrecision 
					                                                      OpDecorate %347 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %7 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32; f32; f32_4; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 2 
					                                              %15 = OpTypePointer Uniform %6 
					                                          i32 %18 = OpConstant 0 
					                                              %22 = OpTypeInt 32 0 
					                                          u32 %23 = OpConstant 0 
					                                              %24 = OpTypePointer Private %6 
					                                          f32 %28 = OpConstant 3,674022E-40 
					                                              %31 = OpTypeBool 
					                                              %32 = OpTypePointer Private %31 
					                                Private bool* %33 = OpVariable Private 
					                                              %46 = OpTypePointer Function %6 
					                                              %58 = OpTypeVector %6 2 
					                                              %59 = OpTypePointer Private %58 
					                               Private f32_2* %60 = OpVariable Private 
					                                              %61 = OpTypePointer Input %58 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %64 = OpConstant 6 
					                                              %65 = OpTypePointer Uniform %7 
					                               Private f32_4* %74 = OpVariable Private 
					                                              %75 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %76 = OpTypePointer UniformConstant %75 
					         UniformConstant read_only Texture2D* %77 = OpVariable UniformConstant 
					                                              %79 = OpTypeSampler 
					                                              %80 = OpTypePointer UniformConstant %79 
					                     UniformConstant sampler* %81 = OpVariable UniformConstant 
					                                              %83 = OpTypeSampledImage %75 
					                                 Private f32* %90 = OpVariable Private 
					                                          f32 %93 = OpConstant 3,674022E-40 
					                               Private f32_2* %99 = OpVariable Private 
					                                         f32 %102 = OpConstant 3,674022E-40 
					                                         f32 %103 = OpConstant 3,674022E-40 
					                                       f32_2 %104 = OpConstantComposite %102 %103 
					                                         f32 %107 = OpConstant 3,674022E-40 
					                                         f32 %108 = OpConstant 3,674022E-40 
					                              Private f32_2* %112 = OpVariable Private 
					                                         f32 %114 = OpConstant 3,674022E-40 
					                                       f32_2 %115 = OpConstantComposite %114 %114 
					                                         f32 %117 = OpConstant 3,674022E-40 
					                                       f32_2 %118 = OpConstantComposite %117 %117 
					                                         u32 %126 = OpConstant 1 
					                                Private f32* %132 = OpVariable Private 
					                                         f32 %135 = OpConstant 3,674022E-40 
					                                Private f32* %137 = OpVariable Private 
					                                         i32 %140 = OpConstant 3 
					                                             %151 = OpTypeVector %6 3 
					                                             %152 = OpTypePointer Private %151 
					                              Private f32_3* %153 = OpVariable Private 
					                                         u32 %187 = OpConstant 2 
					                                         f32 %198 = OpConstant 3,674022E-40 
					                                         i32 %204 = OpConstant 1 
					                                         i32 %211 = OpConstant 4 
					                                         f32 %222 = OpConstant 3,674022E-40 
					                                         f32 %245 = OpConstant 3,674022E-40 
					                                         f32 %246 = OpConstant 3,674022E-40 
					                                       f32_2 %247 = OpConstantComposite %245 %246 
					        UniformConstant read_only Texture2D* %251 = OpVariable UniformConstant 
					                    UniformConstant sampler* %253 = OpVariable UniformConstant 
					                                Private f32* %261 = OpVariable Private 
					                                         i32 %264 = OpConstant 5 
					                              Private f32_4* %268 = OpVariable Private 
					                              Private f32_3* %278 = OpVariable Private 
					                                         f32 %281 = OpConstant 3,674022E-40 
					                                       f32_3 %282 = OpConstantComposite %281 %281 %281 
					                              Private f32_4* %284 = OpVariable Private 
					                                         f32 %287 = OpConstant 3,674022E-40 
					                                         f32 %288 = OpConstant 3,674022E-40 
					                                       f32_3 %289 = OpConstantComposite %287 %288 %287 
					                                         f32 %304 = OpConstant 3,674022E-40 
					                                         f32 %305 = OpConstant 3,674022E-40 
					                                       f32_3 %306 = OpConstantComposite %304 %305 %304 
					                                         f32 %316 = OpConstant 3,674022E-40 
					                                         f32 %323 = OpConstant 3,674022E-40 
					                                         f32 %325 = OpConstant 3,674022E-40 
					                                             %338 = OpTypePointer Output %7 
					                               Output f32_4* %339 = OpVariable Output 
					                                         u32 %351 = OpConstant 3 
					                                             %352 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %47 = OpVariable Function 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                 Uniform f32* %19 = OpAccessChain %12 %18 
					                                          f32 %20 = OpLoad %19 
					                                          f32 %21 = OpFMul %17 %20 
					                                 Private f32* %25 = OpAccessChain %9 %23 
					                                                      OpStore %25 %21 
					                                 Private f32* %26 = OpAccessChain %9 %23 
					                                          f32 %27 = OpLoad %26 
					                                          f32 %29 = OpFMul %27 %28 
					                                 Private f32* %30 = OpAccessChain %9 %23 
					                                                      OpStore %30 %29 
					                                 Private f32* %34 = OpAccessChain %9 %23 
					                                          f32 %35 = OpLoad %34 
					                                 Private f32* %36 = OpAccessChain %9 %23 
					                                          f32 %37 = OpLoad %36 
					                                          f32 %38 = OpFNegate %37 
					                                         bool %39 = OpFOrdGreaterThanEqual %35 %38 
					                                                      OpStore %33 %39 
					                                 Private f32* %40 = OpAccessChain %9 %23 
					                                          f32 %41 = OpLoad %40 
					                                          f32 %42 = OpExtInst %1 4 %41 
					                                          f32 %43 = OpExtInst %1 10 %42 
					                                 Private f32* %44 = OpAccessChain %9 %23 
					                                                      OpStore %44 %43 
					                                         bool %45 = OpLoad %33 
					                                                      OpSelectionMerge %49 None 
					                                                      OpBranchConditional %45 %48 %52 
					                                              %48 = OpLabel 
					                                 Private f32* %50 = OpAccessChain %9 %23 
					                                          f32 %51 = OpLoad %50 
					                                                      OpStore %47 %51 
					                                                      OpBranch %49 
					                                              %52 = OpLabel 
					                                 Private f32* %53 = OpAccessChain %9 %23 
					                                          f32 %54 = OpLoad %53 
					                                          f32 %55 = OpFNegate %54 
					                                                      OpStore %47 %55 
					                                                      OpBranch %49 
					                                              %49 = OpLabel 
					                                          f32 %56 = OpLoad %47 
					                                 Private f32* %57 = OpAccessChain %9 %23 
					                                                      OpStore %57 %56 
					                                        f32_2 %63 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %66 = OpAccessChain %12 %64 
					                                        f32_4 %67 = OpLoad %66 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                        f32_2 %69 = OpFMul %63 %68 
					                               Uniform f32_4* %70 = OpAccessChain %12 %64 
					                                        f32_4 %71 = OpLoad %70 
					                                        f32_2 %72 = OpVectorShuffle %71 %71 2 3 
					                                        f32_2 %73 = OpFAdd %69 %72 
					                                                      OpStore %60 %73 
					                          read_only Texture2D %78 = OpLoad %77 
					                                      sampler %82 = OpLoad %81 
					                   read_only Texture2DSampled %84 = OpSampledImage %78 %82 
					                                        f32_2 %85 = OpLoad %60 
					                                        f32_4 %86 = OpImageSampleImplicitLod %84 %85 
					                                        f32_2 %87 = OpVectorShuffle %86 %86 1 2 
					                                        f32_4 %88 = OpLoad %74 
					                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 2 3 
					                                                      OpStore %74 %89 
					                                 Private f32* %91 = OpAccessChain %9 %23 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %94 = OpFMul %92 %93 
					                                 Private f32* %95 = OpAccessChain %74 %23 
					                                          f32 %96 = OpLoad %95 
					                                          f32 %97 = OpFNegate %96 
					                                          f32 %98 = OpFAdd %94 %97 
					                                                      OpStore %90 %98 
					                                         f32 %100 = OpLoad %90 
					                                       f32_2 %101 = OpCompositeConstruct %100 %100 
					                                       f32_2 %105 = OpFMul %101 %104 
					                                                      OpStore %99 %105 
					                                       f32_2 %106 = OpLoad %99 
					                                       f32_2 %109 = OpCompositeConstruct %107 %107 
					                                       f32_2 %110 = OpCompositeConstruct %108 %108 
					                                       f32_2 %111 = OpExtInst %1 43 %106 %109 %110 
					                                                      OpStore %99 %111 
					                                       f32_2 %113 = OpLoad %99 
					                                       f32_2 %116 = OpFMul %113 %115 
					                                       f32_2 %119 = OpFAdd %116 %118 
					                                                      OpStore %112 %119 
					                                       f32_2 %120 = OpLoad %99 
					                                       f32_2 %121 = OpLoad %99 
					                                       f32_2 %122 = OpFMul %120 %121 
					                                                      OpStore %99 %122 
					                                       f32_2 %123 = OpLoad %99 
					                                       f32_2 %124 = OpLoad %112 
					                                       f32_2 %125 = OpFMul %123 %124 
					                                                      OpStore %99 %125 
					                                Private f32* %127 = OpAccessChain %99 %126 
					                                         f32 %128 = OpLoad %127 
					                                Private f32* %129 = OpAccessChain %99 %23 
					                                         f32 %130 = OpLoad %129 
					                                         f32 %131 = OpFAdd %128 %130 
					                                                      OpStore %90 %131 
					                                Private f32* %133 = OpAccessChain %74 %23 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %136 = OpFAdd %134 %135 
					                                                      OpStore %132 %136 
					                                Private f32* %138 = OpAccessChain %74 %126 
					                                         f32 %139 = OpLoad %138 
					                                Uniform f32* %141 = OpAccessChain %12 %140 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFMul %139 %142 
					                                                      OpStore %137 %143 
					                                Private f32* %144 = OpAccessChain %9 %23 
					                                         f32 %145 = OpLoad %144 
					                                         f32 %146 = OpFMul %145 %93 
					                                         f32 %147 = OpLoad %132 
					                                         f32 %148 = OpFNegate %147 
					                                         f32 %149 = OpFAdd %146 %148 
					                                Private f32* %150 = OpAccessChain %9 %23 
					                                                      OpStore %150 %149 
					                                       f32_4 %154 = OpLoad %9 
					                                       f32_2 %155 = OpVectorShuffle %154 %154 0 0 
					                                       f32_2 %156 = OpFMul %155 %104 
					                                       f32_3 %157 = OpLoad %153 
					                                       f32_3 %158 = OpVectorShuffle %157 %156 3 1 4 
					                                                      OpStore %153 %158 
					                                       f32_3 %159 = OpLoad %153 
					                                       f32_2 %160 = OpVectorShuffle %159 %159 0 2 
					                                       f32_2 %161 = OpCompositeConstruct %107 %107 
					                                       f32_2 %162 = OpCompositeConstruct %108 %108 
					                                       f32_2 %163 = OpExtInst %1 43 %160 %161 %162 
					                                       f32_3 %164 = OpLoad %153 
					                                       f32_3 %165 = OpVectorShuffle %164 %163 3 1 4 
					                                                      OpStore %153 %165 
					                                       f32_3 %166 = OpLoad %153 
					                                       f32_2 %167 = OpVectorShuffle %166 %166 0 2 
					                                       f32_2 %168 = OpFMul %167 %115 
					                                       f32_2 %169 = OpFAdd %168 %118 
					                                                      OpStore %112 %169 
					                                       f32_3 %170 = OpLoad %153 
					                                       f32_2 %171 = OpVectorShuffle %170 %170 0 2 
					                                       f32_3 %172 = OpLoad %153 
					                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
					                                       f32_2 %174 = OpFMul %171 %173 
					                                       f32_3 %175 = OpLoad %153 
					                                       f32_3 %176 = OpVectorShuffle %175 %174 3 1 4 
					                                                      OpStore %153 %176 
					                                Private f32* %177 = OpAccessChain %112 %23 
					                                         f32 %178 = OpLoad %177 
					                                Private f32* %179 = OpAccessChain %153 %23 
					                                         f32 %180 = OpLoad %179 
					                                         f32 %181 = OpFMul %178 %180 
					                                         f32 %182 = OpLoad %90 
					                                         f32 %183 = OpFAdd %181 %182 
					                                Private f32* %184 = OpAccessChain %9 %23 
					                                                      OpStore %184 %183 
					                                Private f32* %185 = OpAccessChain %112 %126 
					                                         f32 %186 = OpLoad %185 
					                                Private f32* %188 = OpAccessChain %153 %187 
					                                         f32 %189 = OpLoad %188 
					                                         f32 %190 = OpFMul %186 %189 
					                                Private f32* %191 = OpAccessChain %9 %23 
					                                         f32 %192 = OpLoad %191 
					                                         f32 %193 = OpFAdd %190 %192 
					                                Private f32* %194 = OpAccessChain %9 %23 
					                                                      OpStore %194 %193 
					                                Private f32* %195 = OpAccessChain %9 %23 
					                                         f32 %196 = OpLoad %195 
					                                         f32 %197 = OpFNegate %196 
					                                         f32 %199 = OpFMul %197 %198 
					                                         f32 %200 = OpFAdd %199 %108 
					                                Private f32* %201 = OpAccessChain %9 %23 
					                                                      OpStore %201 %200 
					                                Private f32* %202 = OpAccessChain %9 %23 
					                                         f32 %203 = OpLoad %202 
					                                Uniform f32* %205 = OpAccessChain %12 %204 
					                                         f32 %206 = OpLoad %205 
					                                         f32 %207 = OpFMul %203 %206 
					                                Private f32* %208 = OpAccessChain %9 %23 
					                                                      OpStore %208 %207 
					                                Private f32* %209 = OpAccessChain %9 %23 
					                                         f32 %210 = OpLoad %209 
					                                Uniform f32* %212 = OpAccessChain %12 %211 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpFMul %210 %213 
					                                Private f32* %215 = OpAccessChain %60 %23 
					                                         f32 %216 = OpLoad %215 
					                                         f32 %217 = OpFAdd %214 %216 
					                                Private f32* %218 = OpAccessChain %112 %23 
					                                                      OpStore %218 %217 
					                                Private f32* %219 = OpAccessChain %60 %23 
					                                         f32 %220 = OpLoad %219 
					                                         f32 %221 = OpExtInst %1 4 %220 
					                                         f32 %223 = OpFMul %221 %222 
					                                Private f32* %224 = OpAccessChain %9 %23 
					                                                      OpStore %224 %223 
					                                Private f32* %225 = OpAccessChain %9 %23 
					                                         f32 %226 = OpLoad %225 
					                                Private f32* %227 = OpAccessChain %9 %23 
					                                         f32 %228 = OpLoad %227 
					                                         f32 %229 = OpFMul %226 %228 
					                                Private f32* %230 = OpAccessChain %9 %23 
					                                                      OpStore %230 %229 
					                                Private f32* %231 = OpAccessChain %9 %23 
					                                         f32 %232 = OpLoad %231 
					                                Uniform f32* %233 = OpAccessChain %12 %211 
					                                         f32 %234 = OpLoad %233 
					                                         f32 %235 = OpFMul %232 %234 
					                                         f32 %236 = OpFAdd %235 %108 
					                                Private f32* %237 = OpAccessChain %9 %23 
					                                                      OpStore %237 %236 
					                                Private f32* %238 = OpAccessChain %9 %23 
					                                         f32 %239 = OpLoad %238 
					                                Private f32* %240 = OpAccessChain %60 %126 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpFMul %239 %241 
					                                Private f32* %243 = OpAccessChain %112 %126 
					                                                      OpStore %243 %242 
					                                       f32_2 %244 = OpLoad %112 
					                                       f32_2 %248 = OpFAdd %244 %247 
					                                       f32_4 %249 = OpLoad %9 
					                                       f32_4 %250 = OpVectorShuffle %249 %248 4 5 2 3 
					                                                      OpStore %9 %250 
					                         read_only Texture2D %252 = OpLoad %251 
					                                     sampler %254 = OpLoad %253 
					                  read_only Texture2DSampled %255 = OpSampledImage %252 %254 
					                                       f32_2 %256 = OpLoad %112 
					                                       f32_4 %257 = OpImageSampleImplicitLod %255 %256 
					                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
					                                       f32_4 %259 = OpLoad %74 
					                                       f32_4 %260 = OpVectorShuffle %259 %258 4 1 5 6 
					                                                      OpStore %74 %260 
					                                Private f32* %262 = OpAccessChain %112 %126 
					                                         f32 %263 = OpLoad %262 
					                                Uniform f32* %265 = OpAccessChain %12 %264 %126 
					                                         f32 %266 = OpLoad %265 
					                                         f32 %267 = OpFMul %263 %266 
					                                                      OpStore %261 %267 
					                         read_only Texture2D %269 = OpLoad %251 
					                                     sampler %270 = OpLoad %253 
					                  read_only Texture2DSampled %271 = OpSampledImage %269 %270 
					                                       f32_4 %272 = OpLoad %9 
					                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
					                                       f32_4 %274 = OpImageSampleImplicitLod %271 %273 
					                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
					                                       f32_4 %276 = OpLoad %268 
					                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 2 6 
					                                                      OpStore %268 %277 
					                                       f32_4 %279 = OpLoad %74 
					                                       f32_3 %280 = OpVectorShuffle %279 %279 0 2 3 
					                                       f32_3 %283 = OpFAdd %280 %282 
					                                                      OpStore %278 %283 
					                                       f32_4 %285 = OpLoad %268 
					                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 3 
					                                       f32_3 %290 = OpFMul %286 %289 
					                                       f32_3 %291 = OpLoad %278 
					                                       f32_3 %292 = OpFAdd %290 %291 
					                                       f32_4 %293 = OpLoad %284 
					                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 2 6 
					                                                      OpStore %284 %294 
					                                         f32 %295 = OpLoad %137 
					                                       f32_3 %296 = OpCompositeConstruct %295 %295 %295 
					                                       f32_4 %297 = OpLoad %284 
					                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 3 
					                                       f32_3 %299 = OpFMul %296 %298 
					                                       f32_4 %300 = OpLoad %9 
					                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 2 6 
					                                                      OpStore %9 %301 
					                                       f32_4 %302 = OpLoad %9 
					                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 3 
					                                       f32_3 %307 = OpFMul %303 %306 
					                                       f32_4 %308 = OpLoad %9 
					                                       f32_4 %309 = OpVectorShuffle %308 %307 4 5 2 6 
					                                                      OpStore %9 %309 
					                                Uniform f32* %310 = OpAccessChain %12 %18 
					                                         f32 %311 = OpLoad %310 
					                                Uniform f32* %312 = OpAccessChain %12 %18 
					                                         f32 %313 = OpLoad %312 
					                                         f32 %314 = OpFAdd %311 %313 
					                                                      OpStore %137 %314 
					                                         f32 %315 = OpLoad %261 
					                                         f32 %317 = OpFMul %315 %316 
					                                         f32 %318 = OpLoad %137 
					                                         f32 %319 = OpFAdd %317 %318 
					                                                      OpStore %261 %319 
					                                         f32 %320 = OpLoad %261 
					                                         f32 %321 = OpExtInst %1 13 %320 
					                                                      OpStore %261 %321 
					                                         f32 %322 = OpLoad %261 
					                                         f32 %324 = OpFMul %322 %323 
					                                         f32 %326 = OpFAdd %324 %325 
					                                                      OpStore %261 %326 
					                                       f32_4 %327 = OpLoad %9 
					                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 3 
					                                         f32 %329 = OpLoad %261 
					                                       f32_3 %330 = OpCompositeConstruct %329 %329 %329 
					                                       f32_3 %331 = OpFMul %328 %330 
					                                       f32_4 %332 = OpLoad %74 
					                                       f32_3 %333 = OpVectorShuffle %332 %332 0 2 3 
					                                       f32_3 %334 = OpFNegate %333 
					                                       f32_3 %335 = OpFAdd %331 %334 
					                                       f32_4 %336 = OpLoad %9 
					                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
					                                                      OpStore %9 %337 
					                                Uniform f32* %340 = OpAccessChain %12 %211 
					                                         f32 %341 = OpLoad %340 
					                                       f32_3 %342 = OpCompositeConstruct %341 %341 %341 
					                                       f32_4 %343 = OpLoad %9 
					                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
					                                       f32_3 %345 = OpFMul %342 %344 
					                                       f32_4 %346 = OpLoad %74 
					                                       f32_3 %347 = OpVectorShuffle %346 %346 0 2 3 
					                                       f32_3 %348 = OpFAdd %345 %347 
					                                       f32_4 %349 = OpLoad %339 
					                                       f32_4 %350 = OpVectorShuffle %349 %348 4 5 6 3 
					                                                      OpStore %339 %350 
					                                 Output f32* %353 = OpAccessChain %339 %351 
					                                                      OpStore %353 %108 
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
						vec4 unused_0_7;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					bool u_xlatb4;
					float u_xlat5;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _Value2 * _TimeX;
					    u_xlat0.x = u_xlat0.x * 0.666666687;
					    u_xlatb4 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex2, u_xlat4.xy);
					    u_xlat12 = u_xlat0.x * 1.5 + (-u_xlat10_1.y);
					    u_xlat1.xw = vec2(u_xlat12) * vec2(50.0, -50.0);
					    u_xlat1.xw = clamp(u_xlat1.xw, 0.0, 1.0);
					    u_xlat2.xy = u_xlat1.xw * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat1.xw = u_xlat1.xw * u_xlat1.xw;
					    u_xlat1.xw = u_xlat1.xw * u_xlat2.xy;
					    u_xlat12 = u_xlat1.w + u_xlat1.x;
					    u_xlat16_1 = u_xlat10_1.y + 0.0399999991;
					    u_xlat5 = u_xlat10_1.z * _Value3;
					    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat16_1);
					    u_xlat1.xz = u_xlat0.xx * vec2(50.0, -50.0);
					    u_xlat1.xz = clamp(u_xlat1.xz, 0.0, 1.0);
					    u_xlat2.xy = u_xlat1.xz * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat1.xz = u_xlat1.xz * u_xlat1.xz;
					    u_xlat0.x = u_xlat2.x * u_xlat1.x + u_xlat12;
					    u_xlat0.x = u_xlat2.y * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat2.x = u_xlat0.x * Fade + u_xlat4.x;
					    u_xlat0.x = abs(u_xlat4.x) * 0.25;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * Fade + 1.0;
					    u_xlat2.y = u_xlat0.x * u_xlat4.y;
					    u_xlat0.xy = u_xlat2.xy + vec2(0.0187500007, -0.0149999997);
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat8 = u_xlat2.y * _ScreenResolution.y;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyw = u_xlat10_3.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat16_0.xyw = u_xlat10_2.xyz * vec3(0.180000007, 0.150000006, 0.180000007) + u_xlat16_0.xyw;
					    u_xlat0.xyw = vec3(u_xlat5) * u_xlat16_0.xyw;
					    u_xlat0.xyw = u_xlat0.xyw * vec3(3.46000004, 3.94000006, 3.46000004);
					    u_xlat1.x = _TimeX + _TimeX;
					    u_xlat8 = u_xlat8 * 1.79999995 + u_xlat1.x;
					    u_xlat8 = sin(u_xlat8);
					    u_xlat8 = u_xlat8 * 0.174999997 + 0.400000006;
					    u_xlat0.xyz = u_xlat0.xyw * vec3(u_xlat8) + (-u_xlat10_3.xyz);
					    SV_Target0.xyz = vec3(Fade) * u_xlat0.xyz + u_xlat10_3.xyz;
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