Shader "CameraFilterPack/Blizzard" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 17747
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec2 u_xlat6;
					float u_xlat8;
					vec2 u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat4.x = sin(u_xlat0.x);
					    u_xlat4.x = u_xlat4.x * u_xlat0.x;
					    u_xlat4.xy = u_xlat4.xx * vec2(0.0625, 0.5) + vec2(1.0, 1.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12 = u_xlat4.x + u_xlat1.x;
					    u_xlat9.x = u_xlat0.x * 0.0625 + u_xlat12;
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat9.x = u_xlat9.x * 0.0625 + u_xlat0.x;
					    u_xlat2.x = u_xlat12 + (-u_xlat9.x);
					    u_xlat4.x = u_xlat4.x * u_xlat2.x;
					    u_xlat12 = _TimeX * _Value + u_xlat1.y;
					    u_xlat2.y = u_xlat4.x * 0.03125 + u_xlat12;
					    u_xlat4.xz = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat10_2 = texture(_MainTex2, u_xlat4.xz);
					    u_xlat4.xz = u_xlat0.xx * vec2(0.5, 0.333333343);
					    u_xlat9.xy = sin(u_xlat4.xz);
					    u_xlat9.xy = u_xlat4.xz * u_xlat9.xy;
					    u_xlat13 = u_xlat9.y * 0.333333343 + 1.0;
					    u_xlat9.x = u_xlat9.x * 0.25 + u_xlat1.x;
					    u_xlat9.x = u_xlat9.x + 1.0;
					    u_xlat6.x = u_xlat13 * 0.100000001;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat2.x = u_xlat6.x * u_xlat10_2.x;
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat6.x = u_xlat0.x * 0.0625 + u_xlat9.x;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat4.x = u_xlat6.x * 0.125 + u_xlat4.x;
					    u_xlat3.x = (-u_xlat4.x) + u_xlat9.x;
					    u_xlat3.y = u_xlat0.x * 0.5 + u_xlat1.y;
					    u_xlat6.xy = u_xlat3.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat10_3 = texture(_MainTex2, u_xlat6.xy);
					    u_xlat4.x = u_xlat2.x + u_xlat10_3.y;
					    u_xlat9.x = u_xlat1.x * 2.0 + u_xlat4.y;
					    u_xlat2.x = u_xlat0.x * 0.0833333358 + u_xlat9.x;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * 0.125 + u_xlat0.x;
					    u_xlat2.x = u_xlat9.x + (-u_xlat2.x);
					    u_xlat8 = u_xlat4.y * u_xlat2.x;
					    u_xlat9.x = u_xlat1.y + u_xlat1.y;
					    u_xlat9.x = _TimeX * _Value + u_xlat9.x;
					    u_xlat2.y = u_xlat8 * 0.015625 + u_xlat9.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat8 = u_xlat13 * 0.015625 + 2.0;
					    u_xlat9.x = u_xlat1.x * 0.5 + u_xlat13;
					    u_xlat8 = sin(u_xlat8);
					    u_xlat8 = u_xlat8 * u_xlat10_2.z;
					    u_xlat8 = max(u_xlat8, 0.0);
					    u_xlat4.x = u_xlat8 + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * 0.0555555597 + u_xlat9.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.0833333358 + u_xlat4.z;
					    u_xlat2.y = u_xlat1.y * 0.5 + u_xlat4.z;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat2.x = (-u_xlat0.x) + u_xlat9.x;
					    u_xlat0.xz = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat10_1 = texture(_MainTex2, u_xlat0.xz);
					    u_xlat0.x = u_xlat10_1.y * 2.0 + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(0.25, 0.25, 0.25) + u_xlat10_3.xyz;
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
					; Bound: 446
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %53 %433 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpMemberDecorate %12 4 Offset 12 
					                                                      OpMemberDecorate %12 5 RelaxedPrecision 
					                                                      OpMemberDecorate %12 5 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 53 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %59 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %134 DescriptorSet 134 
					                                                      OpDecorate %134 Binding 134 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %138 DescriptorSet 138 
					                                                      OpDecorate %138 Binding 138 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                                      OpDecorate %336 RelaxedPrecision 
					                                                      OpDecorate %337 RelaxedPrecision 
					                                                      OpDecorate %342 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %352 DescriptorSet 352 
					                                                      OpDecorate %352 Binding 352 
					                                                      OpDecorate %353 RelaxedPrecision 
					                                                      OpDecorate %354 RelaxedPrecision 
					                                                      OpDecorate %354 DescriptorSet 354 
					                                                      OpDecorate %354 Binding 354 
					                                                      OpDecorate %355 RelaxedPrecision 
					                                                      OpDecorate %359 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %411 RelaxedPrecision 
					                                                      OpDecorate %412 RelaxedPrecision 
					                                                      OpDecorate %413 RelaxedPrecision 
					                                                      OpDecorate %418 RelaxedPrecision 
					                                                      OpDecorate %419 RelaxedPrecision 
					                                                      OpDecorate %420 RelaxedPrecision 
					                                                      OpDecorate %433 Location 433 
					                                                      OpDecorate %438 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypeVector %6 4 
					                                              %12 = OpTypeStruct %6 %6 %6 %6 %10 %11 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 1 
					                                              %17 = OpTypePointer Uniform %6 
					                                          i32 %20 = OpConstant 0 
					                                              %24 = OpTypeInt 32 0 
					                                          u32 %25 = OpConstant 0 
					                                              %26 = OpTypePointer Private %6 
					                               Private f32_3* %28 = OpVariable Private 
					                                          f32 %41 = OpConstant 3,674022E-40 
					                                          f32 %42 = OpConstant 3,674022E-40 
					                                        f32_2 %43 = OpConstantComposite %41 %42 
					                                          f32 %45 = OpConstant 3,674022E-40 
					                                        f32_2 %46 = OpConstantComposite %45 %45 
					                                              %50 = OpTypePointer Private %10 
					                               Private f32_2* %51 = OpVariable Private 
					                                              %52 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %55 = OpConstant 5 
					                                              %56 = OpTypePointer Uniform %11 
					                                 Private f32* %65 = OpVariable Private 
					                               Private f32_2* %71 = OpVariable Private 
					                               Private f32_2* %89 = OpVariable Private 
					                                         u32 %107 = OpConstant 1 
					                                         f32 %113 = OpConstant 3,674022E-40 
					                                         i32 %119 = OpConstant 2 
					                                Private f32* %131 = OpVariable Private 
					                                             %132 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %133 = OpTypePointer UniformConstant %132 
					        UniformConstant read_only Texture2D* %134 = OpVariable UniformConstant 
					                                             %136 = OpTypeSampler 
					                                             %137 = OpTypePointer UniformConstant %136 
					                    UniformConstant sampler* %138 = OpVariable UniformConstant 
					                                             %140 = OpTypeSampledImage %132 
					                                         f32 %148 = OpConstant 3,674022E-40 
					                                       f32_2 %149 = OpConstantComposite %42 %148 
					                                         f32 %162 = OpConstant 3,674022E-40 
					                                Private f32* %172 = OpVariable Private 
					                                         f32 %174 = OpConstant 3,674022E-40 
					                                         f32 %184 = OpConstant 3,674022E-40 
					                                         f32 %196 = OpConstant 3,674022E-40 
					                                             %209 = OpTypeBool 
					                                             %210 = OpTypePointer Private %209 
					                               Private bool* %211 = OpVariable Private 
					                                         i32 %212 = OpConstant 4 
					                                Private f32* %216 = OpVariable Private 
					                                             %222 = OpTypePointer Function %6 
					                              Private f32_3* %249 = OpVariable Private 
					                                         f32 %265 = OpConstant 3,674022E-40 
					                                         f32 %273 = OpConstant 3,674022E-40 
					                                Private f32* %291 = OpVariable Private 
					                              Private f32_2* %302 = OpVariable Private 
					                                         f32 %319 = OpConstant 3,674022E-40 
					                                Private f32* %335 = OpVariable Private 
					                                         u32 %341 = OpConstant 2 
					        UniformConstant read_only Texture2D* %352 = OpVariable UniformConstant 
					                    UniformConstant sampler* %354 = OpVariable UniformConstant 
					                                         f32 %377 = OpConstant 3,674022E-40 
					                                Private f32* %411 = OpVariable Private 
					                                         i32 %427 = OpConstant 3 
					                                             %432 = OpTypePointer Output %11 
					                               Output f32_4* %433 = OpVariable Output 
					                                       f32_3 %436 = OpConstantComposite %162 %162 %162 
					                                         u32 %442 = OpConstant 3 
					                                             %443 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %223 = OpVariable Function 
					                                 Uniform f32* %18 = OpAccessChain %14 %16 
					                                          f32 %19 = OpLoad %18 
					                                 Uniform f32* %21 = OpAccessChain %14 %20 
					                                          f32 %22 = OpLoad %21 
					                                          f32 %23 = OpFMul %19 %22 
					                                 Private f32* %27 = OpAccessChain %9 %25 
					                                                      OpStore %27 %23 
					                                 Private f32* %29 = OpAccessChain %9 %25 
					                                          f32 %30 = OpLoad %29 
					                                          f32 %31 = OpExtInst %1 13 %30 
					                                 Private f32* %32 = OpAccessChain %28 %25 
					                                                      OpStore %32 %31 
					                                 Private f32* %33 = OpAccessChain %28 %25 
					                                          f32 %34 = OpLoad %33 
					                                 Private f32* %35 = OpAccessChain %9 %25 
					                                          f32 %36 = OpLoad %35 
					                                          f32 %37 = OpFMul %34 %36 
					                                 Private f32* %38 = OpAccessChain %28 %25 
					                                                      OpStore %38 %37 
					                                        f32_3 %39 = OpLoad %28 
					                                        f32_2 %40 = OpVectorShuffle %39 %39 0 0 
					                                        f32_2 %44 = OpFMul %40 %43 
					                                        f32_2 %47 = OpFAdd %44 %46 
					                                        f32_3 %48 = OpLoad %28 
					                                        f32_3 %49 = OpVectorShuffle %48 %47 3 4 2 
					                                                      OpStore %28 %49 
					                                        f32_2 %54 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %57 = OpAccessChain %14 %55 
					                                        f32_4 %58 = OpLoad %57 
					                                        f32_2 %59 = OpVectorShuffle %58 %58 0 1 
					                                        f32_2 %60 = OpFMul %54 %59 
					                               Uniform f32_4* %61 = OpAccessChain %14 %55 
					                                        f32_4 %62 = OpLoad %61 
					                                        f32_2 %63 = OpVectorShuffle %62 %62 2 3 
					                                        f32_2 %64 = OpFAdd %60 %63 
					                                                      OpStore %51 %64 
					                                 Private f32* %66 = OpAccessChain %28 %25 
					                                          f32 %67 = OpLoad %66 
					                                 Private f32* %68 = OpAccessChain %51 %25 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpFAdd %67 %69 
					                                                      OpStore %65 %70 
					                                 Private f32* %72 = OpAccessChain %9 %25 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpFMul %73 %41 
					                                          f32 %75 = OpLoad %65 
					                                          f32 %76 = OpFAdd %74 %75 
					                                 Private f32* %77 = OpAccessChain %71 %25 
					                                                      OpStore %77 %76 
					                                 Private f32* %78 = OpAccessChain %71 %25 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpExtInst %1 13 %79 
					                                 Private f32* %81 = OpAccessChain %71 %25 
					                                                      OpStore %81 %80 
					                                 Private f32* %82 = OpAccessChain %71 %25 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %84 = OpFMul %83 %41 
					                                 Private f32* %85 = OpAccessChain %9 %25 
					                                          f32 %86 = OpLoad %85 
					                                          f32 %87 = OpFAdd %84 %86 
					                                 Private f32* %88 = OpAccessChain %71 %25 
					                                                      OpStore %88 %87 
					                                          f32 %90 = OpLoad %65 
					                                 Private f32* %91 = OpAccessChain %71 %25 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpFNegate %92 
					                                          f32 %94 = OpFAdd %90 %93 
					                                 Private f32* %95 = OpAccessChain %89 %25 
					                                                      OpStore %95 %94 
					                                 Private f32* %96 = OpAccessChain %28 %25 
					                                          f32 %97 = OpLoad %96 
					                                 Private f32* %98 = OpAccessChain %89 %25 
					                                          f32 %99 = OpLoad %98 
					                                         f32 %100 = OpFMul %97 %99 
					                                Private f32* %101 = OpAccessChain %28 %25 
					                                                      OpStore %101 %100 
					                                Uniform f32* %102 = OpAccessChain %14 %20 
					                                         f32 %103 = OpLoad %102 
					                                Uniform f32* %104 = OpAccessChain %14 %16 
					                                         f32 %105 = OpLoad %104 
					                                         f32 %106 = OpFMul %103 %105 
					                                Private f32* %108 = OpAccessChain %51 %107 
					                                         f32 %109 = OpLoad %108 
					                                         f32 %110 = OpFAdd %106 %109 
					                                                      OpStore %65 %110 
					                                Private f32* %111 = OpAccessChain %28 %25 
					                                         f32 %112 = OpLoad %111 
					                                         f32 %114 = OpFMul %112 %113 
					                                         f32 %115 = OpLoad %65 
					                                         f32 %116 = OpFAdd %114 %115 
					                                Private f32* %117 = OpAccessChain %89 %107 
					                                                      OpStore %117 %116 
					                                       f32_2 %118 = OpLoad %89 
					                                Uniform f32* %120 = OpAccessChain %14 %119 
					                                         f32 %121 = OpLoad %120 
					                                Uniform f32* %122 = OpAccessChain %14 %119 
					                                         f32 %123 = OpLoad %122 
					                                       f32_2 %124 = OpCompositeConstruct %121 %123 
					                                         f32 %125 = OpCompositeExtract %124 0 
					                                         f32 %126 = OpCompositeExtract %124 1 
					                                       f32_2 %127 = OpCompositeConstruct %125 %126 
					                                       f32_2 %128 = OpFMul %118 %127 
					                                       f32_3 %129 = OpLoad %28 
					                                       f32_3 %130 = OpVectorShuffle %129 %128 3 1 4 
					                                                      OpStore %28 %130 
					                         read_only Texture2D %135 = OpLoad %134 
					                                     sampler %139 = OpLoad %138 
					                  read_only Texture2DSampled %141 = OpSampledImage %135 %139 
					                                       f32_3 %142 = OpLoad %28 
					                                       f32_2 %143 = OpVectorShuffle %142 %142 0 2 
					                                       f32_4 %144 = OpImageSampleImplicitLod %141 %143 
					                                         f32 %145 = OpCompositeExtract %144 0 
					                                                      OpStore %131 %145 
					                                       f32_3 %146 = OpLoad %9 
					                                       f32_2 %147 = OpVectorShuffle %146 %146 0 0 
					                                       f32_2 %150 = OpFMul %147 %149 
					                                                      OpStore %71 %150 
					                                       f32_2 %151 = OpLoad %71 
					                                       f32_2 %152 = OpExtInst %1 13 %151 
					                                                      OpStore %89 %152 
					                                       f32_2 %153 = OpLoad %71 
					                                       f32_2 %154 = OpLoad %89 
					                                       f32_2 %155 = OpFMul %153 %154 
					                                                      OpStore %89 %155 
					                                Private f32* %156 = OpAccessChain %89 %107 
					                                         f32 %157 = OpLoad %156 
					                                         f32 %158 = OpFMul %157 %148 
					                                         f32 %159 = OpFAdd %158 %45 
					                                                      OpStore %65 %159 
					                                Private f32* %160 = OpAccessChain %89 %25 
					                                         f32 %161 = OpLoad %160 
					                                         f32 %163 = OpFMul %161 %162 
					                                Private f32* %164 = OpAccessChain %51 %25 
					                                         f32 %165 = OpLoad %164 
					                                         f32 %166 = OpFAdd %163 %165 
					                                Private f32* %167 = OpAccessChain %89 %25 
					                                                      OpStore %167 %166 
					                                Private f32* %168 = OpAccessChain %89 %25 
					                                         f32 %169 = OpLoad %168 
					                                         f32 %170 = OpFAdd %169 %45 
					                                Private f32* %171 = OpAccessChain %89 %25 
					                                                      OpStore %171 %170 
					                                         f32 %173 = OpLoad %65 
					                                         f32 %175 = OpFMul %173 %174 
					                                                      OpStore %172 %175 
					                                         f32 %176 = OpLoad %172 
					                                         f32 %177 = OpExtInst %1 13 %176 
					                                                      OpStore %172 %177 
					                                         f32 %178 = OpLoad %131 
					                                         f32 %179 = OpLoad %172 
					                                         f32 %180 = OpFMul %178 %179 
					                                Private f32* %181 = OpAccessChain %28 %25 
					                                                      OpStore %181 %180 
					                                Private f32* %182 = OpAccessChain %28 %25 
					                                         f32 %183 = OpLoad %182 
					                                         f32 %185 = OpExtInst %1 40 %183 %184 
					                                Private f32* %186 = OpAccessChain %28 %25 
					                                                      OpStore %186 %185 
					                                Private f32* %187 = OpAccessChain %9 %25 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpFMul %188 %41 
					                                Private f32* %190 = OpAccessChain %89 %25 
					                                         f32 %191 = OpLoad %190 
					                                         f32 %192 = OpFAdd %189 %191 
					                                                      OpStore %172 %192 
					                                         f32 %193 = OpLoad %172 
					                                         f32 %194 = OpExtInst %1 13 %193 
					                                                      OpStore %172 %194 
					                                         f32 %195 = OpLoad %172 
					                                         f32 %197 = OpFMul %195 %196 
					                                Private f32* %198 = OpAccessChain %71 %25 
					                                         f32 %199 = OpLoad %198 
					                                         f32 %200 = OpFAdd %197 %199 
					                                Private f32* %201 = OpAccessChain %71 %25 
					                                                      OpStore %201 %200 
					                                Private f32* %202 = OpAccessChain %71 %25 
					                                         f32 %203 = OpLoad %202 
					                                         f32 %204 = OpFNegate %203 
					                                Private f32* %205 = OpAccessChain %89 %25 
					                                         f32 %206 = OpLoad %205 
					                                         f32 %207 = OpFAdd %204 %206 
					                                Private f32* %208 = OpAccessChain %89 %25 
					                                                      OpStore %208 %207 
					                                Uniform f32* %213 = OpAccessChain %14 %212 %107 
					                                         f32 %214 = OpLoad %213 
					                                        bool %215 = OpFOrdLessThan %214 %184 
					                                                      OpStore %211 %215 
					                                Private f32* %217 = OpAccessChain %51 %107 
					                                         f32 %218 = OpLoad %217 
					                                         f32 %219 = OpFNegate %218 
					                                         f32 %220 = OpFAdd %219 %45 
					                                                      OpStore %216 %220 
					                                        bool %221 = OpLoad %211 
					                                                      OpSelectionMerge %225 None 
					                                                      OpBranchConditional %221 %224 %227 
					                                             %224 = OpLabel 
					                                         f32 %226 = OpLoad %216 
					                                                      OpStore %223 %226 
					                                                      OpBranch %225 
					                                             %227 = OpLabel 
					                                Private f32* %228 = OpAccessChain %51 %107 
					                                         f32 %229 = OpLoad %228 
					                                                      OpStore %223 %229 
					                                                      OpBranch %225 
					                                             %225 = OpLabel 
					                                         f32 %230 = OpLoad %223 
					                                Private f32* %231 = OpAccessChain %71 %25 
					                                                      OpStore %231 %230 
					                                Private f32* %232 = OpAccessChain %9 %25 
					                                         f32 %233 = OpLoad %232 
					                                         f32 %234 = OpFMul %233 %42 
					                                Private f32* %235 = OpAccessChain %71 %25 
					                                         f32 %236 = OpLoad %235 
					                                         f32 %237 = OpFAdd %234 %236 
					                                Private f32* %238 = OpAccessChain %89 %107 
					                                                      OpStore %238 %237 
					                                       f32_2 %239 = OpLoad %89 
					                                Uniform f32* %240 = OpAccessChain %14 %119 
					                                         f32 %241 = OpLoad %240 
					                                Uniform f32* %242 = OpAccessChain %14 %119 
					                                         f32 %243 = OpLoad %242 
					                                       f32_2 %244 = OpCompositeConstruct %241 %243 
					                                         f32 %245 = OpCompositeExtract %244 0 
					                                         f32 %246 = OpCompositeExtract %244 1 
					                                       f32_2 %247 = OpCompositeConstruct %245 %246 
					                                       f32_2 %248 = OpFMul %239 %247 
					                                                      OpStore %89 %248 
					                         read_only Texture2D %250 = OpLoad %134 
					                                     sampler %251 = OpLoad %138 
					                  read_only Texture2DSampled %252 = OpSampledImage %250 %251 
					                                       f32_2 %253 = OpLoad %89 
					                                       f32_4 %254 = OpImageSampleImplicitLod %252 %253 
					                                         f32 %255 = OpCompositeExtract %254 1 
					                                Private f32* %256 = OpAccessChain %249 %25 
					                                                      OpStore %256 %255 
					                                Private f32* %257 = OpAccessChain %28 %25 
					                                         f32 %258 = OpLoad %257 
					                                Private f32* %259 = OpAccessChain %249 %25 
					                                         f32 %260 = OpLoad %259 
					                                         f32 %261 = OpFAdd %258 %260 
					                                Private f32* %262 = OpAccessChain %28 %25 
					                                                      OpStore %262 %261 
					                                Private f32* %263 = OpAccessChain %51 %25 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %266 = OpFMul %264 %265 
					                                Private f32* %267 = OpAccessChain %28 %107 
					                                         f32 %268 = OpLoad %267 
					                                         f32 %269 = OpFAdd %266 %268 
					                                Private f32* %270 = OpAccessChain %89 %25 
					                                                      OpStore %270 %269 
					                                Private f32* %271 = OpAccessChain %9 %25 
					                                         f32 %272 = OpLoad %271 
					                                         f32 %274 = OpFMul %272 %273 
					                                Private f32* %275 = OpAccessChain %89 %25 
					                                         f32 %276 = OpLoad %275 
					                                         f32 %277 = OpFAdd %274 %276 
					                                                      OpStore %172 %277 
					                                         f32 %278 = OpLoad %172 
					                                         f32 %279 = OpExtInst %1 13 %278 
					                                                      OpStore %172 %279 
					                                         f32 %280 = OpLoad %172 
					                                         f32 %281 = OpFMul %280 %196 
					                                Private f32* %282 = OpAccessChain %9 %25 
					                                         f32 %283 = OpLoad %282 
					                                         f32 %284 = OpFAdd %281 %283 
					                                                      OpStore %172 %284 
					                                         f32 %285 = OpLoad %172 
					                                         f32 %286 = OpFNegate %285 
					                                Private f32* %287 = OpAccessChain %89 %25 
					                                         f32 %288 = OpLoad %287 
					                                         f32 %289 = OpFAdd %286 %288 
					                                Private f32* %290 = OpAccessChain %89 %25 
					                                                      OpStore %290 %289 
					                                Private f32* %292 = OpAccessChain %28 %107 
					                                         f32 %293 = OpLoad %292 
					                                Private f32* %294 = OpAccessChain %89 %25 
					                                         f32 %295 = OpLoad %294 
					                                         f32 %296 = OpFMul %293 %295 
					                                                      OpStore %291 %296 
					                                Private f32* %297 = OpAccessChain %71 %25 
					                                         f32 %298 = OpLoad %297 
					                                Private f32* %299 = OpAccessChain %71 %25 
					                                         f32 %300 = OpLoad %299 
					                                         f32 %301 = OpFAdd %298 %300 
					                                                      OpStore %216 %301 
					                                Private f32* %303 = OpAccessChain %71 %25 
					                                         f32 %304 = OpLoad %303 
					                                         f32 %305 = OpFMul %304 %42 
					                                Private f32* %306 = OpAccessChain %71 %107 
					                                         f32 %307 = OpLoad %306 
					                                         f32 %308 = OpFAdd %305 %307 
					                                Private f32* %309 = OpAccessChain %302 %107 
					                                                      OpStore %309 %308 
					                                Uniform f32* %310 = OpAccessChain %14 %20 
					                                         f32 %311 = OpLoad %310 
					                                Uniform f32* %312 = OpAccessChain %14 %16 
					                                         f32 %313 = OpLoad %312 
					                                         f32 %314 = OpFMul %311 %313 
					                                         f32 %315 = OpLoad %216 
					                                         f32 %316 = OpFAdd %314 %315 
					                                Private f32* %317 = OpAccessChain %71 %25 
					                                                      OpStore %317 %316 
					                                         f32 %318 = OpLoad %291 
					                                         f32 %320 = OpFMul %318 %319 
					                                Private f32* %321 = OpAccessChain %71 %25 
					                                         f32 %322 = OpLoad %321 
					                                         f32 %323 = OpFAdd %320 %322 
					                                Private f32* %324 = OpAccessChain %89 %107 
					                                                      OpStore %324 %323 
					                                       f32_2 %325 = OpLoad %89 
					                                Uniform f32* %326 = OpAccessChain %14 %119 
					                                         f32 %327 = OpLoad %326 
					                                Uniform f32* %328 = OpAccessChain %14 %119 
					                                         f32 %329 = OpLoad %328 
					                                       f32_2 %330 = OpCompositeConstruct %327 %329 
					                                         f32 %331 = OpCompositeExtract %330 0 
					                                         f32 %332 = OpCompositeExtract %330 1 
					                                       f32_2 %333 = OpCompositeConstruct %331 %332 
					                                       f32_2 %334 = OpFMul %325 %333 
					                                                      OpStore %89 %334 
					                         read_only Texture2D %336 = OpLoad %134 
					                                     sampler %337 = OpLoad %138 
					                  read_only Texture2DSampled %338 = OpSampledImage %336 %337 
					                                       f32_2 %339 = OpLoad %89 
					                                       f32_4 %340 = OpImageSampleImplicitLod %338 %339 
					                                         f32 %342 = OpCompositeExtract %340 2 
					                                                      OpStore %335 %342 
					                                         f32 %343 = OpLoad %65 
					                                         f32 %344 = OpFMul %343 %319 
					                                         f32 %345 = OpFAdd %344 %265 
					                                Private f32* %346 = OpAccessChain %71 %25 
					                                                      OpStore %346 %345 
					                                Private f32* %347 = OpAccessChain %51 %25 
					                                         f32 %348 = OpLoad %347 
					                                         f32 %349 = OpFMul %348 %42 
					                                         f32 %350 = OpLoad %65 
					                                         f32 %351 = OpFAdd %349 %350 
					                                                      OpStore %65 %351 
					                         read_only Texture2D %353 = OpLoad %352 
					                                     sampler %355 = OpLoad %354 
					                  read_only Texture2DSampled %356 = OpSampledImage %353 %355 
					                                       f32_2 %357 = OpLoad %51 
					                                       f32_4 %358 = OpImageSampleImplicitLod %356 %357 
					                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
					                                                      OpStore %249 %359 
					                                Private f32* %360 = OpAccessChain %71 %25 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpExtInst %1 13 %361 
					                                Private f32* %363 = OpAccessChain %51 %25 
					                                                      OpStore %363 %362 
					                                         f32 %364 = OpLoad %335 
					                                Private f32* %365 = OpAccessChain %51 %25 
					                                         f32 %366 = OpLoad %365 
					                                         f32 %367 = OpFMul %364 %366 
					                                                      OpStore %291 %367 
					                                         f32 %368 = OpLoad %291 
					                                         f32 %369 = OpExtInst %1 40 %368 %184 
					                                                      OpStore %291 %369 
					                                         f32 %370 = OpLoad %291 
					                                Private f32* %371 = OpAccessChain %28 %25 
					                                         f32 %372 = OpLoad %371 
					                                         f32 %373 = OpFAdd %370 %372 
					                                Private f32* %374 = OpAccessChain %28 %25 
					                                                      OpStore %374 %373 
					                                Private f32* %375 = OpAccessChain %9 %25 
					                                         f32 %376 = OpLoad %375 
					                                         f32 %378 = OpFMul %376 %377 
					                                         f32 %379 = OpLoad %65 
					                                         f32 %380 = OpFAdd %378 %379 
					                                Private f32* %381 = OpAccessChain %9 %25 
					                                                      OpStore %381 %380 
					                                Private f32* %382 = OpAccessChain %9 %25 
					                                         f32 %383 = OpLoad %382 
					                                         f32 %384 = OpExtInst %1 13 %383 
					                                Private f32* %385 = OpAccessChain %9 %25 
					                                                      OpStore %385 %384 
					                                Private f32* %386 = OpAccessChain %9 %25 
					                                         f32 %387 = OpLoad %386 
					                                         f32 %388 = OpFMul %387 %273 
					                                Private f32* %389 = OpAccessChain %71 %107 
					                                         f32 %390 = OpLoad %389 
					                                         f32 %391 = OpFAdd %388 %390 
					                                Private f32* %392 = OpAccessChain %9 %25 
					                                                      OpStore %392 %391 
					                                Private f32* %393 = OpAccessChain %9 %25 
					                                         f32 %394 = OpLoad %393 
					                                         f32 %395 = OpFNegate %394 
					                                         f32 %396 = OpLoad %65 
					                                         f32 %397 = OpFAdd %395 %396 
					                                Private f32* %398 = OpAccessChain %302 %25 
					                                                      OpStore %398 %397 
					                                       f32_2 %399 = OpLoad %302 
					                                Uniform f32* %400 = OpAccessChain %14 %119 
					                                         f32 %401 = OpLoad %400 
					                                Uniform f32* %402 = OpAccessChain %14 %119 
					                                         f32 %403 = OpLoad %402 
					                                       f32_2 %404 = OpCompositeConstruct %401 %403 
					                                         f32 %405 = OpCompositeExtract %404 0 
					                                         f32 %406 = OpCompositeExtract %404 1 
					                                       f32_2 %407 = OpCompositeConstruct %405 %406 
					                                       f32_2 %408 = OpFMul %399 %407 
					                                       f32_3 %409 = OpLoad %9 
					                                       f32_3 %410 = OpVectorShuffle %409 %408 3 1 4 
					                                                      OpStore %9 %410 
					                         read_only Texture2D %412 = OpLoad %134 
					                                     sampler %413 = OpLoad %138 
					                  read_only Texture2DSampled %414 = OpSampledImage %412 %413 
					                                       f32_3 %415 = OpLoad %9 
					                                       f32_2 %416 = OpVectorShuffle %415 %415 0 2 
					                                       f32_4 %417 = OpImageSampleImplicitLod %414 %416 
					                                         f32 %418 = OpCompositeExtract %417 1 
					                                                      OpStore %411 %418 
					                                         f32 %419 = OpLoad %411 
					                                         f32 %420 = OpFMul %419 %265 
					                                Private f32* %421 = OpAccessChain %28 %25 
					                                         f32 %422 = OpLoad %421 
					                                         f32 %423 = OpFAdd %420 %422 
					                                Private f32* %424 = OpAccessChain %9 %25 
					                                                      OpStore %424 %423 
					                                Private f32* %425 = OpAccessChain %9 %25 
					                                         f32 %426 = OpLoad %425 
					                                Uniform f32* %428 = OpAccessChain %14 %427 
					                                         f32 %429 = OpLoad %428 
					                                         f32 %430 = OpFMul %426 %429 
					                                Private f32* %431 = OpAccessChain %9 %25 
					                                                      OpStore %431 %430 
					                                       f32_3 %434 = OpLoad %9 
					                                       f32_3 %435 = OpVectorShuffle %434 %434 0 0 0 
					                                       f32_3 %437 = OpFMul %435 %436 
					                                       f32_3 %438 = OpLoad %249 
					                                       f32_3 %439 = OpFAdd %437 %438 
					                                       f32_4 %440 = OpLoad %433 
					                                       f32_4 %441 = OpVectorShuffle %440 %439 4 5 6 3 
					                                                      OpStore %433 %441 
					                                 Output f32* %444 = OpAccessChain %433 %442 
					                                                      OpStore %444 %45 
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
						vec4 unused_0_5;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat7;
					float u_xlat10;
					vec2 u_xlat11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat5.x = sin(u_xlat0.x);
					    u_xlat5.x = u_xlat5.x * u_xlat0.x;
					    u_xlat5.xy = u_xlat5.xx * vec2(0.0625, 0.5) + vec2(1.0, 1.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat15 = u_xlat5.x + u_xlat1.x;
					    u_xlat11.x = u_xlat0.x * 0.0625 + u_xlat15;
					    u_xlat11.x = sin(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 0.0625 + u_xlat0.x;
					    u_xlat2.x = u_xlat15 + (-u_xlat11.x);
					    u_xlat5.x = u_xlat5.x * u_xlat2.x;
					    u_xlat15 = _TimeX * _Value + u_xlat1.y;
					    u_xlat2.y = u_xlat5.x * 0.03125 + u_xlat15;
					    u_xlat5.xz = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat10_2 = texture(_MainTex2, u_xlat5.xz);
					    u_xlat5.xz = u_xlat0.xx * vec2(0.5, 0.333333343);
					    u_xlat11.xy = sin(u_xlat5.xz);
					    u_xlat11.xy = u_xlat5.xz * u_xlat11.xy;
					    u_xlat16 = u_xlat11.y * 0.333333343 + 1.0;
					    u_xlat11.x = u_xlat11.x * 0.25 + u_xlat1.x;
					    u_xlat11.x = u_xlat11.x + 1.0;
					    u_xlat7.x = u_xlat16 * 0.100000001;
					    u_xlat7.x = sin(u_xlat7.x);
					    u_xlat2.x = u_xlat7.x * u_xlat10_2.x;
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat7.x = u_xlat0.x * 0.0625 + u_xlat11.x;
					    u_xlat7.x = sin(u_xlat7.x);
					    u_xlat5.x = u_xlat7.x * 0.125 + u_xlat5.x;
					    u_xlat3.x = (-u_xlat5.x) + u_xlat11.x;
					    u_xlatb5 = _MainTex_TexelSize.y<0.0;
					    u_xlat11.x = (-u_xlat1.y) + 1.0;
					    u_xlat5.x = (u_xlatb5) ? u_xlat11.x : u_xlat1.y;
					    u_xlat3.y = u_xlat0.x * 0.5 + u_xlat5.x;
					    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat10_3 = texture(_MainTex2, u_xlat7.xy);
					    u_xlat11.x = u_xlat2.x + u_xlat10_3.y;
					    u_xlat2.x = u_xlat1.x * 2.0 + u_xlat5.y;
					    u_xlat7.x = u_xlat0.x * 0.0833333358 + u_xlat2.x;
					    u_xlat7.x = sin(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 0.125 + u_xlat0.x;
					    u_xlat2.x = (-u_xlat7.x) + u_xlat2.x;
					    u_xlat10 = u_xlat5.y * u_xlat2.x;
					    u_xlat12 = u_xlat5.x + u_xlat5.x;
					    u_xlat3.y = u_xlat5.x * 0.5 + u_xlat5.z;
					    u_xlat5.x = _TimeX * _Value + u_xlat12;
					    u_xlat2.y = u_xlat10 * 0.015625 + u_xlat5.x;
					    u_xlat5.xy = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat10_2 = texture(_MainTex2, u_xlat5.xy);
					    u_xlat5.x = u_xlat16 * 0.015625 + 2.0;
					    u_xlat10 = u_xlat1.x * 0.5 + u_xlat16;
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xy);
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * u_xlat10_2.z;
					    u_xlat5.x = max(u_xlat5.x, 0.0);
					    u_xlat5.x = u_xlat5.x + u_xlat11.x;
					    u_xlat0.x = u_xlat0.x * 0.0555555597 + u_xlat10;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.0833333358 + u_xlat5.z;
					    u_xlat3.x = (-u_xlat0.x) + u_xlat10;
					    u_xlat0.xz = u_xlat3.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat10_1 = texture(_MainTex2, u_xlat0.xz);
					    u_xlat0.x = u_xlat10_1.y * 2.0 + u_xlat5.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(0.25, 0.25, 0.25) + u_xlat10_4.xyz;
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