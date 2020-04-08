Shader "CameraFilterPack/TV_Artefact" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Colorisation ("_Colorisation", Range(1, 10)) = 1
		_Parasite ("_Parasite", Range(1, 10)) = 1
		_Noise ("_Noise", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 28377
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
					uniform 	float _Colorisation;
					uniform 	float _Parasite;
					uniform 	float _Noise;
					uniform 	float Fade;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat8;
					vec2 u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = _TimeX * 12.0;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat1 = u_xlat0.xxxx * vec4(7.23409986, 1.0, 5.0, 1.0);
					    u_xlat4.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat4.y = dot(u_xlat1.zw, vec2(127.099998, 311.700012));
					    u_xlat4.xy = sin(u_xlat4.xy);
					    u_xlat4.xy = u_xlat4.xy * vec2(43758.5469, 43758.5469);
					    u_xlat0.yz = fract(u_xlat4.xy);
					    u_xlat4.x = log2(u_xlat0.y);
					    u_xlat4.x = u_xlat4.x * 17.0;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + u_xlat4.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = u_xlat1.xyxy * vec4(24.0, 9.0, 8.0, 4.0);
					    u_xlat2 = floor(u_xlat2);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2;
					    u_xlat12 = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
					    u_xlat9.x = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat9.x = u_xlat9.x * 43758.5469;
					    u_xlat9.x = fract(u_xlat9.x);
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * _Parasite;
					    u_xlat13 = u_xlat9.x * u_xlat9.x;
					    u_xlat9.x = u_xlat13 * u_xlat9.x;
					    u_xlat0.y = u_xlat12 * u_xlat9.x + (-u_xlat4.x);
					    u_xlat9.xy = u_xlat0.xx * vec2(31.0, 1.0);
					    u_xlat0.xw = u_xlat0.xx * u_xlat1.xy;
					    u_xlat0.x = dot(u_xlat0.xw, vec2(127.099998, 311.700012));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 0.0500000007);
					    u_xlat2.x = fract(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat9.xy, vec2(127.099998, 311.700012));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat3.xz = u_xlat0.zx * u_xlat0.yy;
					    u_xlat3.y = float(0.0);
					    u_xlat3.w = float(0.0);
					    u_xlat0.xy = u_xlat1.xy + (-u_xlat3.zw);
					    u_xlat8.xy = u_xlat1.xy + u_xlat3.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat3 = texture(_MainTex, u_xlat8.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat3.z = u_xlat10_0.z;
					    u_xlat2.y = (-u_xlat2.x) * _Colorisation + 1.0;
					    u_xlat2.z = u_xlat2.x * 0.5 + 0.5;
					    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Noise, _Noise, _Noise)) + vec3(-2.0, -2.0, -2.0);
					    u_xlat3.x = u_xlat10_1.x;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0799999982, 0.0799999982, 0.0799999982) + u_xlat3.xyz;
					    u_xlat0.w = 0.200000003;
					    u_xlat0 = (-u_xlat10_1) + u_xlat0;
					    SV_Target0 = vec4(Fade) * u_xlat0 + u_xlat10_1;
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
					; Bound: 339
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %81 %329 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %10 0 Offset 10 
					                                                      OpMemberDecorate %10 1 Offset 10 
					                                                      OpMemberDecorate %10 2 Offset 10 
					                                                      OpMemberDecorate %10 3 Offset 10 
					                                                      OpMemberDecorate %10 4 Offset 10 
					                                                      OpMemberDecorate %10 5 RelaxedPrecision 
					                                                      OpMemberDecorate %10 5 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 81 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %246 RelaxedPrecision 
					                                                      OpDecorate %246 DescriptorSet 246 
					                                                      OpDecorate %246 Binding 246 
					                                                      OpDecorate %247 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %250 DescriptorSet 250 
					                                                      OpDecorate %250 Binding 250 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %310 RelaxedPrecision 
					                                                      OpDecorate %324 RelaxedPrecision 
					                                                      OpDecorate %325 RelaxedPrecision 
					                                                      OpDecorate %329 Location 329 
					                                                      OpDecorate %336 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 0 
					                                              %15 = OpTypePointer Uniform %6 
					                                          f32 %18 = OpConstant 3,674022E-40 
					                                              %20 = OpTypeInt 32 0 
					                                          u32 %21 = OpConstant 0 
					                                              %22 = OpTypePointer Private %6 
					                               Private f32_4* %28 = OpVariable Private 
					                                          f32 %31 = OpConstant 3,674022E-40 
					                                          f32 %32 = OpConstant 3,674022E-40 
					                                          f32 %33 = OpConstant 3,674022E-40 
					                                        f32_4 %34 = OpConstantComposite %31 %32 %33 %32 
					                                              %36 = OpTypeVector %6 2 
					                                              %37 = OpTypePointer Private %36 
					                               Private f32_2* %38 = OpVariable Private 
					                                          f32 %41 = OpConstant 3,674022E-40 
					                                          f32 %42 = OpConstant 3,674022E-40 
					                                        f32_2 %43 = OpConstantComposite %41 %42 
					                                          u32 %49 = OpConstant 1 
					                                          f32 %54 = OpConstant 3,674022E-40 
					                                        f32_2 %55 = OpConstantComposite %54 %54 
					                                          f32 %67 = OpConstant 3,674022E-40 
					                                              %80 = OpTypePointer Input %36 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %83 = OpConstant 5 
					                                              %84 = OpTypePointer Uniform %7 
					                               Private f32_4* %95 = OpVariable Private 
					                                          f32 %98 = OpConstant 3,674022E-40 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                         f32 %100 = OpConstant 3,674022E-40 
					                                         f32 %101 = OpConstant 3,674022E-40 
					                                       f32_4 %102 = OpConstantComposite %98 %99 %100 %101 
					                                Private f32* %110 = OpVariable Private 
					                              Private f32_2* %114 = OpVariable Private 
					                                         i32 %147 = OpConstant 2 
					                                Private f32* %151 = OpVariable Private 
					                                         f32 %173 = OpConstant 3,674022E-40 
					                                       f32_2 %174 = OpConstantComposite %173 %32 
					                                         f32 %193 = OpConstant 3,674022E-40 
					                                       f32_2 %194 = OpConstantComposite %54 %193 
					                              Private f32_4* %217 = OpVariable Private 
					                                         f32 %225 = OpConstant 3,674022E-40 
					                                         u32 %227 = OpConstant 3 
					                              Private f32_2* %237 = OpVariable Private 
					                              Private f32_4* %243 = OpVariable Private 
					                                             %244 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %245 = OpTypePointer UniformConstant %244 
					        UniformConstant read_only Texture2D* %246 = OpVariable UniformConstant 
					                                             %248 = OpTypeSampler 
					                                             %249 = OpTypePointer UniformConstant %248 
					                    UniformConstant sampler* %250 = OpVariable UniformConstant 
					                                             %252 = OpTypeSampledImage %244 
					                                         u32 %270 = OpConstant 2 
					                                         i32 %276 = OpConstant 1 
					                                         f32 %284 = OpConstant 3,674022E-40 
					                                             %288 = OpTypeVector %6 3 
					                                         i32 %291 = OpConstant 3 
					                                         f32 %304 = OpConstant 3,674022E-40 
					                                       f32_3 %305 = OpConstantComposite %304 %304 %304 
					                                         f32 %314 = OpConstant 3,674022E-40 
					                                       f32_3 %315 = OpConstantComposite %314 %314 %314 
					                                         f32 %322 = OpConstant 3,674022E-40 
					                                             %328 = OpTypePointer Output %7 
					                               Output f32_4* %329 = OpVariable Output 
					                                         i32 %330 = OpConstant 4 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                          f32 %19 = OpFMul %17 %18 
					                                 Private f32* %23 = OpAccessChain %9 %21 
					                                                      OpStore %23 %19 
					                                 Private f32* %24 = OpAccessChain %9 %21 
					                                          f32 %25 = OpLoad %24 
					                                          f32 %26 = OpExtInst %1 8 %25 
					                                 Private f32* %27 = OpAccessChain %9 %21 
					                                                      OpStore %27 %26 
					                                        f32_4 %29 = OpLoad %9 
					                                        f32_4 %30 = OpVectorShuffle %29 %29 0 0 0 0 
					                                        f32_4 %35 = OpFMul %30 %34 
					                                                      OpStore %28 %35 
					                                        f32_4 %39 = OpLoad %28 
					                                        f32_2 %40 = OpVectorShuffle %39 %39 0 1 
					                                          f32 %44 = OpDot %40 %43 
					                                 Private f32* %45 = OpAccessChain %38 %21 
					                                                      OpStore %45 %44 
					                                        f32_4 %46 = OpLoad %28 
					                                        f32_2 %47 = OpVectorShuffle %46 %46 2 3 
					                                          f32 %48 = OpDot %47 %43 
					                                 Private f32* %50 = OpAccessChain %38 %49 
					                                                      OpStore %50 %48 
					                                        f32_2 %51 = OpLoad %38 
					                                        f32_2 %52 = OpExtInst %1 13 %51 
					                                                      OpStore %38 %52 
					                                        f32_2 %53 = OpLoad %38 
					                                        f32_2 %56 = OpFMul %53 %55 
					                                                      OpStore %38 %56 
					                                        f32_2 %57 = OpLoad %38 
					                                        f32_2 %58 = OpExtInst %1 10 %57 
					                                        f32_4 %59 = OpLoad %9 
					                                        f32_4 %60 = OpVectorShuffle %59 %58 0 4 5 3 
					                                                      OpStore %9 %60 
					                                 Private f32* %61 = OpAccessChain %9 %49 
					                                          f32 %62 = OpLoad %61 
					                                          f32 %63 = OpExtInst %1 30 %62 
					                                 Private f32* %64 = OpAccessChain %38 %21 
					                                                      OpStore %64 %63 
					                                 Private f32* %65 = OpAccessChain %38 %21 
					                                          f32 %66 = OpLoad %65 
					                                          f32 %68 = OpFMul %66 %67 
					                                 Private f32* %69 = OpAccessChain %38 %21 
					                                                      OpStore %69 %68 
					                                 Private f32* %70 = OpAccessChain %38 %21 
					                                          f32 %71 = OpLoad %70 
					                                          f32 %72 = OpExtInst %1 29 %71 
					                                 Private f32* %73 = OpAccessChain %38 %21 
					                                                      OpStore %73 %72 
					                                 Private f32* %74 = OpAccessChain %38 %21 
					                                          f32 %75 = OpLoad %74 
					                                 Private f32* %76 = OpAccessChain %38 %21 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpFAdd %75 %77 
					                                 Private f32* %79 = OpAccessChain %38 %21 
					                                                      OpStore %79 %78 
					                                        f32_2 %82 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %85 = OpAccessChain %12 %83 
					                                        f32_4 %86 = OpLoad %85 
					                                        f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                                        f32_2 %88 = OpFMul %82 %87 
					                               Uniform f32_4* %89 = OpAccessChain %12 %83 
					                                        f32_4 %90 = OpLoad %89 
					                                        f32_2 %91 = OpVectorShuffle %90 %90 2 3 
					                                        f32_2 %92 = OpFAdd %88 %91 
					                                        f32_4 %93 = OpLoad %28 
					                                        f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
					                                                      OpStore %28 %94 
					                                        f32_4 %96 = OpLoad %28 
					                                        f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
					                                       f32_4 %103 = OpFMul %97 %102 
					                                                      OpStore %95 %103 
					                                       f32_4 %104 = OpLoad %95 
					                                       f32_4 %105 = OpExtInst %1 8 %104 
					                                                      OpStore %95 %105 
					                                       f32_4 %106 = OpLoad %9 
					                                       f32_4 %107 = OpVectorShuffle %106 %106 0 0 0 0 
					                                       f32_4 %108 = OpLoad %95 
					                                       f32_4 %109 = OpFMul %107 %108 
					                                                      OpStore %95 %109 
					                                       f32_4 %111 = OpLoad %95 
					                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
					                                         f32 %113 = OpDot %112 %43 
					                                                      OpStore %110 %113 
					                                       f32_4 %115 = OpLoad %95 
					                                       f32_2 %116 = OpVectorShuffle %115 %115 2 3 
					                                         f32 %117 = OpDot %116 %43 
					                                Private f32* %118 = OpAccessChain %114 %21 
					                                                      OpStore %118 %117 
					                                Private f32* %119 = OpAccessChain %114 %21 
					                                         f32 %120 = OpLoad %119 
					                                         f32 %121 = OpExtInst %1 13 %120 
					                                Private f32* %122 = OpAccessChain %114 %21 
					                                                      OpStore %122 %121 
					                                Private f32* %123 = OpAccessChain %114 %21 
					                                         f32 %124 = OpLoad %123 
					                                         f32 %125 = OpFMul %124 %54 
					                                Private f32* %126 = OpAccessChain %114 %21 
					                                                      OpStore %126 %125 
					                                Private f32* %127 = OpAccessChain %114 %21 
					                                         f32 %128 = OpLoad %127 
					                                         f32 %129 = OpExtInst %1 10 %128 
					                                Private f32* %130 = OpAccessChain %114 %21 
					                                                      OpStore %130 %129 
					                                         f32 %131 = OpLoad %110 
					                                         f32 %132 = OpExtInst %1 13 %131 
					                                                      OpStore %110 %132 
					                                         f32 %133 = OpLoad %110 
					                                         f32 %134 = OpFMul %133 %54 
					                                                      OpStore %110 %134 
					                                         f32 %135 = OpLoad %110 
					                                         f32 %136 = OpExtInst %1 10 %135 
					                                                      OpStore %110 %136 
					                                         f32 %137 = OpLoad %110 
					                                         f32 %138 = OpLoad %110 
					                                         f32 %139 = OpFMul %137 %138 
					                                                      OpStore %110 %139 
					                                         f32 %140 = OpLoad %110 
					                                         f32 %141 = OpLoad %110 
					                                         f32 %142 = OpFMul %140 %141 
					                                                      OpStore %110 %142 
					                                         f32 %143 = OpLoad %110 
					                                         f32 %144 = OpLoad %110 
					                                         f32 %145 = OpFMul %143 %144 
					                                                      OpStore %110 %145 
					                                         f32 %146 = OpLoad %110 
					                                Uniform f32* %148 = OpAccessChain %12 %147 
					                                         f32 %149 = OpLoad %148 
					                                         f32 %150 = OpFMul %146 %149 
					                                                      OpStore %110 %150 
					                                Private f32* %152 = OpAccessChain %114 %21 
					                                         f32 %153 = OpLoad %152 
					                                Private f32* %154 = OpAccessChain %114 %21 
					                                         f32 %155 = OpLoad %154 
					                                         f32 %156 = OpFMul %153 %155 
					                                                      OpStore %151 %156 
					                                         f32 %157 = OpLoad %151 
					                                Private f32* %158 = OpAccessChain %114 %21 
					                                         f32 %159 = OpLoad %158 
					                                         f32 %160 = OpFMul %157 %159 
					                                Private f32* %161 = OpAccessChain %114 %21 
					                                                      OpStore %161 %160 
					                                         f32 %162 = OpLoad %110 
					                                Private f32* %163 = OpAccessChain %114 %21 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpFMul %162 %164 
					                                Private f32* %166 = OpAccessChain %38 %21 
					                                         f32 %167 = OpLoad %166 
					                                         f32 %168 = OpFNegate %167 
					                                         f32 %169 = OpFAdd %165 %168 
					                                Private f32* %170 = OpAccessChain %9 %49 
					                                                      OpStore %170 %169 
					                                       f32_4 %171 = OpLoad %9 
					                                       f32_2 %172 = OpVectorShuffle %171 %171 0 0 
					                                       f32_2 %175 = OpFMul %172 %174 
					                                                      OpStore %114 %175 
					                                       f32_4 %176 = OpLoad %9 
					                                       f32_2 %177 = OpVectorShuffle %176 %176 0 0 
					                                       f32_4 %178 = OpLoad %28 
					                                       f32_2 %179 = OpVectorShuffle %178 %178 0 1 
					                                       f32_2 %180 = OpFMul %177 %179 
					                                       f32_4 %181 = OpLoad %9 
					                                       f32_4 %182 = OpVectorShuffle %181 %180 4 1 2 5 
					                                                      OpStore %9 %182 
					                                       f32_4 %183 = OpLoad %9 
					                                       f32_2 %184 = OpVectorShuffle %183 %183 0 3 
					                                         f32 %185 = OpDot %184 %43 
					                                Private f32* %186 = OpAccessChain %9 %21 
					                                                      OpStore %186 %185 
					                                Private f32* %187 = OpAccessChain %9 %21 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpExtInst %1 13 %188 
					                                Private f32* %190 = OpAccessChain %9 %21 
					                                                      OpStore %190 %189 
					                                       f32_4 %191 = OpLoad %9 
					                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
					                                       f32_2 %195 = OpFMul %192 %194 
					                                       f32_4 %196 = OpLoad %9 
					                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 2 3 
					                                                      OpStore %9 %197 
					                                Private f32* %198 = OpAccessChain %9 %21 
					                                         f32 %199 = OpLoad %198 
					                                         f32 %200 = OpExtInst %1 10 %199 
					                                Private f32* %201 = OpAccessChain %95 %21 
					                                                      OpStore %201 %200 
					                                       f32_2 %202 = OpLoad %114 
					                                         f32 %203 = OpDot %202 %43 
					                                Private f32* %204 = OpAccessChain %9 %21 
					                                                      OpStore %204 %203 
					                                Private f32* %205 = OpAccessChain %9 %21 
					                                         f32 %206 = OpLoad %205 
					                                         f32 %207 = OpExtInst %1 13 %206 
					                                Private f32* %208 = OpAccessChain %9 %21 
					                                                      OpStore %208 %207 
					                                Private f32* %209 = OpAccessChain %9 %21 
					                                         f32 %210 = OpLoad %209 
					                                         f32 %211 = OpFMul %210 %54 
					                                Private f32* %212 = OpAccessChain %9 %21 
					                                                      OpStore %212 %211 
					                                Private f32* %213 = OpAccessChain %9 %21 
					                                         f32 %214 = OpLoad %213 
					                                         f32 %215 = OpExtInst %1 10 %214 
					                                Private f32* %216 = OpAccessChain %9 %21 
					                                                      OpStore %216 %215 
					                                       f32_4 %218 = OpLoad %9 
					                                       f32_2 %219 = OpVectorShuffle %218 %218 2 0 
					                                       f32_4 %220 = OpLoad %9 
					                                       f32_2 %221 = OpVectorShuffle %220 %220 1 1 
					                                       f32_2 %222 = OpFMul %219 %221 
					                                       f32_4 %223 = OpLoad %217 
					                                       f32_4 %224 = OpVectorShuffle %223 %222 4 1 5 3 
					                                                      OpStore %217 %224 
					                                Private f32* %226 = OpAccessChain %217 %49 
					                                                      OpStore %226 %225 
					                                Private f32* %228 = OpAccessChain %217 %227 
					                                                      OpStore %228 %225 
					                                       f32_4 %229 = OpLoad %28 
					                                       f32_2 %230 = OpVectorShuffle %229 %229 0 1 
					                                       f32_4 %231 = OpLoad %217 
					                                       f32_2 %232 = OpVectorShuffle %231 %231 2 3 
					                                       f32_2 %233 = OpFNegate %232 
					                                       f32_2 %234 = OpFAdd %230 %233 
					                                       f32_4 %235 = OpLoad %9 
					                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
					                                                      OpStore %9 %236 
					                                       f32_4 %238 = OpLoad %28 
					                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
					                                       f32_4 %240 = OpLoad %217 
					                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
					                                       f32_2 %242 = OpFAdd %239 %241 
					                                                      OpStore %237 %242 
					                         read_only Texture2D %247 = OpLoad %246 
					                                     sampler %251 = OpLoad %250 
					                  read_only Texture2DSampled %253 = OpSampledImage %247 %251 
					                                       f32_4 %254 = OpLoad %28 
					                                       f32_2 %255 = OpVectorShuffle %254 %254 0 1 
					                                       f32_4 %256 = OpImageSampleImplicitLod %253 %255 
					                                                      OpStore %243 %256 
					                         read_only Texture2D %257 = OpLoad %246 
					                                     sampler %258 = OpLoad %250 
					                  read_only Texture2DSampled %259 = OpSampledImage %257 %258 
					                                       f32_2 %260 = OpLoad %237 
					                                       f32_4 %261 = OpImageSampleImplicitLod %259 %260 
					                                         f32 %262 = OpCompositeExtract %261 1 
					                                Private f32* %263 = OpAccessChain %217 %49 
					                                                      OpStore %263 %262 
					                         read_only Texture2D %264 = OpLoad %246 
					                                     sampler %265 = OpLoad %250 
					                  read_only Texture2DSampled %266 = OpSampledImage %264 %265 
					                                       f32_4 %267 = OpLoad %9 
					                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
					                                       f32_4 %269 = OpImageSampleImplicitLod %266 %268 
					                                         f32 %271 = OpCompositeExtract %269 2 
					                                Private f32* %272 = OpAccessChain %217 %270 
					                                                      OpStore %272 %271 
					                                Private f32* %273 = OpAccessChain %95 %21 
					                                         f32 %274 = OpLoad %273 
					                                         f32 %275 = OpFNegate %274 
					                                Uniform f32* %277 = OpAccessChain %12 %276 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFMul %275 %278 
					                                         f32 %280 = OpFAdd %279 %32 
					                                Private f32* %281 = OpAccessChain %95 %49 
					                                                      OpStore %281 %280 
					                                Private f32* %282 = OpAccessChain %95 %21 
					                                         f32 %283 = OpLoad %282 
					                                         f32 %285 = OpFMul %283 %284 
					                                         f32 %286 = OpFAdd %285 %284 
					                                Private f32* %287 = OpAccessChain %95 %270 
					                                                      OpStore %287 %286 
					                                       f32_4 %289 = OpLoad %95 
					                                       f32_3 %290 = OpVectorShuffle %289 %289 0 1 2 
					                                Uniform f32* %292 = OpAccessChain %12 %291 
					                                         f32 %293 = OpLoad %292 
					                                Uniform f32* %294 = OpAccessChain %12 %291 
					                                         f32 %295 = OpLoad %294 
					                                Uniform f32* %296 = OpAccessChain %12 %291 
					                                         f32 %297 = OpLoad %296 
					                                       f32_3 %298 = OpCompositeConstruct %293 %295 %297 
					                                         f32 %299 = OpCompositeExtract %298 0 
					                                         f32 %300 = OpCompositeExtract %298 1 
					                                         f32 %301 = OpCompositeExtract %298 2 
					                                       f32_3 %302 = OpCompositeConstruct %299 %300 %301 
					                                       f32_3 %303 = OpFMul %290 %302 
					                                       f32_3 %306 = OpFAdd %303 %305 
					                                       f32_4 %307 = OpLoad %9 
					                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 6 3 
					                                                      OpStore %9 %308 
					                                Private f32* %309 = OpAccessChain %243 %21 
					                                         f32 %310 = OpLoad %309 
					                                Private f32* %311 = OpAccessChain %217 %21 
					                                                      OpStore %311 %310 
					                                       f32_4 %312 = OpLoad %9 
					                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
					                                       f32_3 %316 = OpFMul %313 %315 
					                                       f32_4 %317 = OpLoad %217 
					                                       f32_3 %318 = OpVectorShuffle %317 %317 0 1 2 
					                                       f32_3 %319 = OpFAdd %316 %318 
					                                       f32_4 %320 = OpLoad %9 
					                                       f32_4 %321 = OpVectorShuffle %320 %319 4 5 6 3 
					                                                      OpStore %9 %321 
					                                Private f32* %323 = OpAccessChain %9 %227 
					                                                      OpStore %323 %322 
					                                       f32_4 %324 = OpLoad %243 
					                                       f32_4 %325 = OpFNegate %324 
					                                       f32_4 %326 = OpLoad %9 
					                                       f32_4 %327 = OpFAdd %325 %326 
					                                                      OpStore %9 %327 
					                                Uniform f32* %331 = OpAccessChain %12 %330 
					                                         f32 %332 = OpLoad %331 
					                                       f32_4 %333 = OpCompositeConstruct %332 %332 %332 %332 
					                                       f32_4 %334 = OpLoad %9 
					                                       f32_4 %335 = OpFMul %333 %334 
					                                       f32_4 %336 = OpLoad %243 
					                                       f32_4 %337 = OpFAdd %335 %336 
					                                                      OpStore %329 %337 
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
						float _Colorisation;
						float _Parasite;
						float _Noise;
						float Fade;
						vec4 unused_0_6;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat8;
					vec2 u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = _TimeX * 12.0;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat1 = u_xlat0.xxxx * vec4(7.23409986, 1.0, 5.0, 1.0);
					    u_xlat4.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat4.y = dot(u_xlat1.zw, vec2(127.099998, 311.700012));
					    u_xlat4.xy = sin(u_xlat4.xy);
					    u_xlat4.xy = u_xlat4.xy * vec2(43758.5469, 43758.5469);
					    u_xlat0.yz = fract(u_xlat4.xy);
					    u_xlat4.x = log2(u_xlat0.y);
					    u_xlat4.x = u_xlat4.x * 17.0;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + u_xlat4.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = u_xlat1.xyxy * vec4(24.0, 9.0, 8.0, 4.0);
					    u_xlat2 = floor(u_xlat2);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2;
					    u_xlat12 = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
					    u_xlat9.x = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat9.x = u_xlat9.x * 43758.5469;
					    u_xlat9.x = fract(u_xlat9.x);
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 43758.5469;
					    u_xlat12 = fract(u_xlat12);
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * _Parasite;
					    u_xlat13 = u_xlat9.x * u_xlat9.x;
					    u_xlat9.x = u_xlat13 * u_xlat9.x;
					    u_xlat0.y = u_xlat12 * u_xlat9.x + (-u_xlat4.x);
					    u_xlat9.xy = u_xlat0.xx * vec2(31.0, 1.0);
					    u_xlat0.xw = u_xlat0.xx * u_xlat1.xy;
					    u_xlat0.x = dot(u_xlat0.xw, vec2(127.099998, 311.700012));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 0.0500000007);
					    u_xlat2.x = fract(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat9.xy, vec2(127.099998, 311.700012));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat3.xz = u_xlat0.zx * u_xlat0.yy;
					    u_xlat3.y = float(0.0);
					    u_xlat3.w = float(0.0);
					    u_xlat0.xy = u_xlat1.xy + (-u_xlat3.zw);
					    u_xlat8.xy = u_xlat1.xy + u_xlat3.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat3 = texture(_MainTex, u_xlat8.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat3.z = u_xlat10_0.z;
					    u_xlat2.y = (-u_xlat2.x) * _Colorisation + 1.0;
					    u_xlat2.z = u_xlat2.x * 0.5 + 0.5;
					    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Noise, _Noise, _Noise)) + vec3(-2.0, -2.0, -2.0);
					    u_xlat3.x = u_xlat10_1.x;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0799999982, 0.0799999982, 0.0799999982) + u_xlat3.xyz;
					    u_xlat0.w = 0.200000003;
					    u_xlat0 = (-u_xlat10_1) + u_xlat0;
					    SV_Target0 = vec4(Fade) * u_xlat0 + u_xlat10_1;
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