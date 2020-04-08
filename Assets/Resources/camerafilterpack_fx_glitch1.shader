Shader "CameraFilterPack/FX_Glitch1" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 62573
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
					uniform 	float _Glitch;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					int u_xlati1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					float u_xlat16_4;
					bool u_xlatb4;
					float u_xlat5;
					int u_xlati5;
					vec2 u_xlat8;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vec2(_TimeX) * vec2(4.0, 8.0);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(37.5, 0.125);
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat8.y * 16.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0.x = u_xlat1.x * 0.0625 + u_xlat0.x;
					    u_xlat4 = dot(u_xlat0.yy, vec2(12.9898005, 78.2330017));
					    u_xlat4 = sin(u_xlat4);
					    u_xlat4 = u_xlat4 * 43758.5469;
					    u_xlat4 = fract(u_xlat4);
					    u_xlatb4 = 0.99000001<u_xlat4;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat1.x = u_xlat0.x * _TimeX;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0.x = u_xlat1.x / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 5.0 + u_xlat8.y;
					    u_xlat1.xy = u_xlat0.xx * vec2(11.0, 7.0);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.0909090936, 0.142857149);
					    u_xlat0.x = dot(u_xlat1.yy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = dot(u_xlat1.xx, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat1.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlati1 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati5 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlat0.x = abs(u_xlat0.x) + -0.600000024;
					    u_xlat0.x = u_xlat0.x * 2.5;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlati1 = (-u_xlati1) + u_xlati5;
					    u_xlat1.x = float(u_xlati1);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat1.x = (-_Glitch) * u_xlat0.x + 0.5;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * _Glitch;
					    u_xlat0.x = _Glitch * u_xlat0.x + -0.5;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat9 = abs(u_xlat5) * 3.0;
					    u_xlat2.xy = vec2(u_xlat5) * vec2(0.100000001, 0.125);
					    u_xlat1.x = (-u_xlat9) * u_xlat1.x + 1.0;
					    u_xlat2.z = 0.0;
					    u_xlat3.xy = u_xlat8.xy + u_xlat2.xz;
					    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
					    u_xlat8.x = (-u_xlat3.y) + 1.0;
					    u_xlat3.z = (u_xlatb4) ? u_xlat8.x : u_xlat3.y;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xz);
					    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(-0.147129998, -0.288859993, 0.43599999));
					    u_xlat1.x = u_xlat16_4 / u_xlat1.x;
					    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.61500001, -0.514989972, -0.10001));
					    u_xlat1.y = u_xlat2.y * u_xlat0.x + u_xlat16_4;
					    u_xlat0.x = dot(vec2(-0.394650012, -0.580600023), u_xlat1.xy);
					    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    SV_Target0.w = u_xlat10_3.w;
					    SV_Target0.y = u_xlat0.x + u_xlat16_4;
					    SV_Target0.xz = u_xlat1.yx * vec2(1.13982999, 2.03210998) + vec2(u_xlat16_4);
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
					; Bound: 405
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %33 %382 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %11 0 Offset 11 
					                                              OpMemberDecorate %11 1 Offset 11 
					                                              OpMemberDecorate %11 2 RelaxedPrecision 
					                                              OpMemberDecorate %11 2 Offset 11 
					                                              OpDecorate %11 Block 
					                                              OpDecorate %13 DescriptorSet 13 
					                                              OpDecorate %13 Binding 13 
					                                              OpDecorate vs_TEXCOORD0 Location 33 
					                                              OpDecorate %38 RelaxedPrecision 
					                                              OpDecorate %39 RelaxedPrecision 
					                                              OpDecorate %42 RelaxedPrecision 
					                                              OpDecorate %43 RelaxedPrecision 
					                                              OpDecorate %326 RelaxedPrecision 
					                                              OpDecorate %329 RelaxedPrecision 
					                                              OpDecorate %329 DescriptorSet 329 
					                                              OpDecorate %329 Binding 329 
					                                              OpDecorate %330 RelaxedPrecision 
					                                              OpDecorate %333 RelaxedPrecision 
					                                              OpDecorate %333 DescriptorSet 333 
					                                              OpDecorate %333 Binding 333 
					                                              OpDecorate %334 RelaxedPrecision 
					                                              OpDecorate %340 RelaxedPrecision 
					                                              OpDecorate %341 RelaxedPrecision 
					                                              OpDecorate %342 RelaxedPrecision 
					                                              OpDecorate %347 RelaxedPrecision 
					                                              OpDecorate %348 RelaxedPrecision 
					                                              OpDecorate %353 RelaxedPrecision 
					                                              OpDecorate %354 RelaxedPrecision 
					                                              OpDecorate %359 RelaxedPrecision 
					                                              OpDecorate %365 RelaxedPrecision 
					                                              OpDecorate %374 RelaxedPrecision 
					                                              OpDecorate %375 RelaxedPrecision 
					                                              OpDecorate %380 RelaxedPrecision 
					                                              OpDecorate %382 Location 382 
					                                              OpDecorate %385 RelaxedPrecision 
					                                              OpDecorate %390 RelaxedPrecision 
					                                              OpDecorate %399 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 4 
					                                      %11 = OpTypeStruct %6 %6 %10 
					                                      %12 = OpTypePointer Uniform %11 
					   Uniform struct {f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                      %14 = OpTypeInt 32 1 
					                                  i32 %15 = OpConstant 0 
					                                      %16 = OpTypePointer Uniform %6 
					                                  f32 %20 = OpConstant 3,674022E-40 
					                                  f32 %21 = OpConstant 3,674022E-40 
					                                f32_2 %22 = OpConstantComposite %20 %21 
					                                  f32 %27 = OpConstant 3,674022E-40 
					                                  f32 %28 = OpConstant 3,674022E-40 
					                                f32_2 %29 = OpConstantComposite %27 %28 
					                       Private f32_2* %31 = OpVariable Private 
					                                      %32 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                  i32 %35 = OpConstant 2 
					                                      %36 = OpTypePointer Uniform %10 
					                       Private f32_2* %45 = OpVariable Private 
					                                      %46 = OpTypeInt 32 0 
					                                  u32 %47 = OpConstant 1 
					                                      %48 = OpTypePointer Private %6 
					                                  f32 %51 = OpConstant 3,674022E-40 
					                                  u32 %53 = OpConstant 0 
					                                  f32 %61 = OpConstant 3,674022E-40 
					                         Private f32* %67 = OpVariable Private 
					                                  f32 %70 = OpConstant 3,674022E-40 
					                                  f32 %71 = OpConstant 3,674022E-40 
					                                f32_2 %72 = OpConstantComposite %70 %71 
					                                  f32 %77 = OpConstant 3,674022E-40 
					                                      %81 = OpTypeBool 
					                                      %82 = OpTypePointer Private %81 
					                        Private bool* %83 = OpVariable Private 
					                                  f32 %84 = OpConstant 3,674022E-40 
					                                 f32 %125 = OpConstant 3,674022E-40 
					                                 f32 %133 = OpConstant 3,674022E-40 
					                                 f32 %134 = OpConstant 3,674022E-40 
					                               f32_2 %135 = OpConstantComposite %133 %134 
					                                 f32 %140 = OpConstant 3,674022E-40 
					                                 f32 %141 = OpConstant 3,674022E-40 
					                               f32_2 %142 = OpConstantComposite %140 %141 
					                                 f32 %178 = OpConstant 3,674022E-40 
					                                 f32 %190 = OpConstant 3,674022E-40 
					                                 f32 %192 = OpConstant 3,674022E-40 
					                                     %195 = OpTypePointer Private %14 
					                        Private i32* %196 = OpVariable Private 
					                                 f32 %197 = OpConstant 3,674022E-40 
					                                 u32 %201 = OpConstant 4294967295 
					                        Private i32* %204 = OpVariable Private 
					                                 f32 %213 = OpConstant 3,674022E-40 
					                                 f32 %218 = OpConstant 3,674022E-40 
					                                 i32 %238 = OpConstant 1 
					                                 f32 %249 = OpConstant 3,674022E-40 
					                        Private f32* %252 = OpVariable Private 
					                                 f32 %263 = OpConstant 3,674022E-40 
					                        Private f32* %270 = OpVariable Private 
					                                 f32 %273 = OpConstant 3,674022E-40 
					                                     %275 = OpTypeVector %6 3 
					                                     %276 = OpTypePointer Private %275 
					                      Private f32_3* %277 = OpVariable Private 
					                                 f32 %280 = OpConstant 3,674022E-40 
					                               f32_2 %281 = OpConstantComposite %280 %28 
					                                 u32 %292 = OpConstant 2 
					                      Private f32_3* %294 = OpVariable Private 
					                                     %314 = OpTypePointer Function %6 
					                                     %325 = OpTypePointer Private %10 
					                      Private f32_4* %326 = OpVariable Private 
					                                     %327 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %328 = OpTypePointer UniformConstant %327 
					UniformConstant read_only Texture2D* %329 = OpVariable UniformConstant 
					                                     %331 = OpTypeSampler 
					                                     %332 = OpTypePointer UniformConstant %331 
					            UniformConstant sampler* %333 = OpVariable UniformConstant 
					                                     %335 = OpTypeSampledImage %327 
					                        Private f32* %340 = OpVariable Private 
					                                 f32 %343 = OpConstant 3,674022E-40 
					                                 f32 %344 = OpConstant 3,674022E-40 
					                                 f32 %345 = OpConstant 3,674022E-40 
					                               f32_3 %346 = OpConstantComposite %343 %344 %345 
					                                 f32 %355 = OpConstant 3,674022E-40 
					                                 f32 %356 = OpConstant 3,674022E-40 
					                                 f32 %357 = OpConstant 3,674022E-40 
					                               f32_3 %358 = OpConstantComposite %355 %356 %357 
					                                 f32 %368 = OpConstant 3,674022E-40 
					                                 f32 %369 = OpConstant 3,674022E-40 
					                               f32_2 %370 = OpConstantComposite %368 %369 
					                                 f32 %376 = OpConstant 3,674022E-40 
					                                 f32 %377 = OpConstant 3,674022E-40 
					                                 f32 %378 = OpConstant 3,674022E-40 
					                               f32_3 %379 = OpConstantComposite %376 %377 %378 
					                                     %381 = OpTypePointer Output %10 
					                       Output f32_4* %382 = OpVariable Output 
					                                 u32 %383 = OpConstant 3 
					                                     %386 = OpTypePointer Output %6 
					                                 f32 %395 = OpConstant 3,674022E-40 
					                                 f32 %396 = OpConstant 3,674022E-40 
					                               f32_2 %397 = OpConstantComposite %395 %396 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Function f32* %315 = OpVariable Function 
					                         Uniform f32* %17 = OpAccessChain %13 %15 
					                                  f32 %18 = OpLoad %17 
					                                f32_2 %19 = OpCompositeConstruct %18 %18 
					                                f32_2 %23 = OpFMul %19 %22 
					                                              OpStore %9 %23 
					                                f32_2 %24 = OpLoad %9 
					                                f32_2 %25 = OpExtInst %1 8 %24 
					                                              OpStore %9 %25 
					                                f32_2 %26 = OpLoad %9 
					                                f32_2 %30 = OpFMul %26 %29 
					                                              OpStore %9 %30 
					                                f32_2 %34 = OpLoad vs_TEXCOORD0 
					                       Uniform f32_4* %37 = OpAccessChain %13 %35 
					                                f32_4 %38 = OpLoad %37 
					                                f32_2 %39 = OpVectorShuffle %38 %38 0 1 
					                                f32_2 %40 = OpFMul %34 %39 
					                       Uniform f32_4* %41 = OpAccessChain %13 %35 
					                                f32_4 %42 = OpLoad %41 
					                                f32_2 %43 = OpVectorShuffle %42 %42 2 3 
					                                f32_2 %44 = OpFAdd %40 %43 
					                                              OpStore %31 %44 
					                         Private f32* %49 = OpAccessChain %31 %47 
					                                  f32 %50 = OpLoad %49 
					                                  f32 %52 = OpFMul %50 %51 
					                         Private f32* %54 = OpAccessChain %45 %53 
					                                              OpStore %54 %52 
					                         Private f32* %55 = OpAccessChain %45 %53 
					                                  f32 %56 = OpLoad %55 
					                                  f32 %57 = OpExtInst %1 8 %56 
					                         Private f32* %58 = OpAccessChain %45 %53 
					                                              OpStore %58 %57 
					                         Private f32* %59 = OpAccessChain %45 %53 
					                                  f32 %60 = OpLoad %59 
					                                  f32 %62 = OpFMul %60 %61 
					                         Private f32* %63 = OpAccessChain %9 %53 
					                                  f32 %64 = OpLoad %63 
					                                  f32 %65 = OpFAdd %62 %64 
					                         Private f32* %66 = OpAccessChain %9 %53 
					                                              OpStore %66 %65 
					                                f32_2 %68 = OpLoad %9 
					                                f32_2 %69 = OpVectorShuffle %68 %68 1 1 
					                                  f32 %73 = OpDot %69 %72 
					                                              OpStore %67 %73 
					                                  f32 %74 = OpLoad %67 
					                                  f32 %75 = OpExtInst %1 13 %74 
					                                              OpStore %67 %75 
					                                  f32 %76 = OpLoad %67 
					                                  f32 %78 = OpFMul %76 %77 
					                                              OpStore %67 %78 
					                                  f32 %79 = OpLoad %67 
					                                  f32 %80 = OpExtInst %1 10 %79 
					                                              OpStore %67 %80 
					                                  f32 %85 = OpLoad %67 
					                                 bool %86 = OpFOrdLessThan %84 %85 
					                                              OpStore %83 %86 
					                                f32_2 %87 = OpLoad %9 
					                                f32_2 %88 = OpVectorShuffle %87 %87 0 0 
					                                  f32 %89 = OpDot %88 %72 
					                         Private f32* %90 = OpAccessChain %9 %53 
					                                              OpStore %90 %89 
					                         Private f32* %91 = OpAccessChain %9 %53 
					                                  f32 %92 = OpLoad %91 
					                                  f32 %93 = OpExtInst %1 13 %92 
					                         Private f32* %94 = OpAccessChain %9 %53 
					                                              OpStore %94 %93 
					                         Private f32* %95 = OpAccessChain %9 %53 
					                                  f32 %96 = OpLoad %95 
					                                  f32 %97 = OpFMul %96 %77 
					                         Private f32* %98 = OpAccessChain %9 %53 
					                                              OpStore %98 %97 
					                         Private f32* %99 = OpAccessChain %9 %53 
					                                 f32 %100 = OpLoad %99 
					                                 f32 %101 = OpExtInst %1 10 %100 
					                        Private f32* %102 = OpAccessChain %9 %53 
					                                              OpStore %102 %101 
					                        Private f32* %103 = OpAccessChain %9 %53 
					                                 f32 %104 = OpLoad %103 
					                                 f32 %105 = OpFMul %104 %51 
					                        Private f32* %106 = OpAccessChain %9 %53 
					                                              OpStore %106 %105 
					                        Private f32* %107 = OpAccessChain %9 %53 
					                                 f32 %108 = OpLoad %107 
					                        Uniform f32* %109 = OpAccessChain %13 %15 
					                                 f32 %110 = OpLoad %109 
					                                 f32 %111 = OpFMul %108 %110 
					                        Private f32* %112 = OpAccessChain %45 %53 
					                                              OpStore %112 %111 
					                        Private f32* %113 = OpAccessChain %45 %53 
					                                 f32 %114 = OpLoad %113 
					                                 f32 %115 = OpExtInst %1 8 %114 
					                        Private f32* %116 = OpAccessChain %45 %53 
					                                              OpStore %116 %115 
					                        Private f32* %117 = OpAccessChain %45 %53 
					                                 f32 %118 = OpLoad %117 
					                        Private f32* %119 = OpAccessChain %9 %53 
					                                 f32 %120 = OpLoad %119 
					                                 f32 %121 = OpFDiv %118 %120 
					                        Private f32* %122 = OpAccessChain %9 %53 
					                                              OpStore %122 %121 
					                        Private f32* %123 = OpAccessChain %9 %53 
					                                 f32 %124 = OpLoad %123 
					                                 f32 %126 = OpFMul %124 %125 
					                        Private f32* %127 = OpAccessChain %31 %47 
					                                 f32 %128 = OpLoad %127 
					                                 f32 %129 = OpFAdd %126 %128 
					                        Private f32* %130 = OpAccessChain %9 %53 
					                                              OpStore %130 %129 
					                               f32_2 %131 = OpLoad %9 
					                               f32_2 %132 = OpVectorShuffle %131 %131 0 0 
					                               f32_2 %136 = OpFMul %132 %135 
					                                              OpStore %45 %136 
					                               f32_2 %137 = OpLoad %45 
					                               f32_2 %138 = OpExtInst %1 8 %137 
					                                              OpStore %45 %138 
					                               f32_2 %139 = OpLoad %45 
					                               f32_2 %143 = OpFMul %139 %142 
					                                              OpStore %45 %143 
					                               f32_2 %144 = OpLoad %45 
					                               f32_2 %145 = OpVectorShuffle %144 %144 1 1 
					                                 f32 %146 = OpDot %145 %72 
					                        Private f32* %147 = OpAccessChain %9 %53 
					                                              OpStore %147 %146 
					                               f32_2 %148 = OpLoad %45 
					                               f32_2 %149 = OpVectorShuffle %148 %148 0 0 
					                                 f32 %150 = OpDot %149 %72 
					                        Private f32* %151 = OpAccessChain %45 %53 
					                                              OpStore %151 %150 
					                        Private f32* %152 = OpAccessChain %45 %53 
					                                 f32 %153 = OpLoad %152 
					                                 f32 %154 = OpExtInst %1 13 %153 
					                        Private f32* %155 = OpAccessChain %45 %53 
					                                              OpStore %155 %154 
					                        Private f32* %156 = OpAccessChain %45 %53 
					                                 f32 %157 = OpLoad %156 
					                                 f32 %158 = OpFMul %157 %77 
					                        Private f32* %159 = OpAccessChain %45 %53 
					                                              OpStore %159 %158 
					                        Private f32* %160 = OpAccessChain %45 %53 
					                                 f32 %161 = OpLoad %160 
					                                 f32 %162 = OpExtInst %1 10 %161 
					                        Private f32* %163 = OpAccessChain %45 %53 
					                                              OpStore %163 %162 
					                        Private f32* %164 = OpAccessChain %9 %53 
					                                 f32 %165 = OpLoad %164 
					                                 f32 %166 = OpExtInst %1 13 %165 
					                        Private f32* %167 = OpAccessChain %9 %53 
					                                              OpStore %167 %166 
					                        Private f32* %168 = OpAccessChain %9 %53 
					                                 f32 %169 = OpLoad %168 
					                                 f32 %170 = OpFMul %169 %77 
					                        Private f32* %171 = OpAccessChain %9 %53 
					                                              OpStore %171 %170 
					                        Private f32* %172 = OpAccessChain %9 %53 
					                                 f32 %173 = OpLoad %172 
					                                 f32 %174 = OpExtInst %1 10 %173 
					                        Private f32* %175 = OpAccessChain %9 %53 
					                                              OpStore %175 %174 
					                        Private f32* %176 = OpAccessChain %9 %53 
					                                 f32 %177 = OpLoad %176 
					                                 f32 %179 = OpFMul %177 %178 
					                        Private f32* %180 = OpAccessChain %9 %53 
					                                              OpStore %180 %179 
					                        Private f32* %181 = OpAccessChain %45 %53 
					                                 f32 %182 = OpLoad %181 
					                                 f32 %183 = OpFMul %182 %178 
					                        Private f32* %184 = OpAccessChain %9 %53 
					                                 f32 %185 = OpLoad %184 
					                                 f32 %186 = OpFAdd %183 %185 
					                        Private f32* %187 = OpAccessChain %9 %53 
					                                              OpStore %187 %186 
					                        Private f32* %188 = OpAccessChain %9 %53 
					                                 f32 %189 = OpLoad %188 
					                                 f32 %191 = OpFMul %189 %190 
					                                 f32 %193 = OpFAdd %191 %192 
					                        Private f32* %194 = OpAccessChain %9 %53 
					                                              OpStore %194 %193 
					                        Private f32* %198 = OpAccessChain %9 %53 
					                                 f32 %199 = OpLoad %198 
					                                bool %200 = OpFOrdLessThan %197 %199 
					                                 u32 %202 = OpSelect %200 %201 %53 
					                                 i32 %203 = OpBitcast %202 
					                                              OpStore %196 %203 
					                        Private f32* %205 = OpAccessChain %9 %53 
					                                 f32 %206 = OpLoad %205 
					                                bool %207 = OpFOrdLessThan %206 %197 
					                                 u32 %208 = OpSelect %207 %201 %53 
					                                 i32 %209 = OpBitcast %208 
					                                              OpStore %204 %209 
					                        Private f32* %210 = OpAccessChain %9 %53 
					                                 f32 %211 = OpLoad %210 
					                                 f32 %212 = OpExtInst %1 4 %211 
					                                 f32 %214 = OpFAdd %212 %213 
					                        Private f32* %215 = OpAccessChain %9 %53 
					                                              OpStore %215 %214 
					                        Private f32* %216 = OpAccessChain %9 %53 
					                                 f32 %217 = OpLoad %216 
					                                 f32 %219 = OpFMul %217 %218 
					                        Private f32* %220 = OpAccessChain %9 %53 
					                                              OpStore %220 %219 
					                        Private f32* %221 = OpAccessChain %9 %53 
					                                 f32 %222 = OpLoad %221 
					                                 f32 %223 = OpExtInst %1 40 %222 %197 
					                        Private f32* %224 = OpAccessChain %9 %53 
					                                              OpStore %224 %223 
					                                 i32 %225 = OpLoad %196 
					                                 i32 %226 = OpSNegate %225 
					                                 i32 %227 = OpLoad %204 
					                                 i32 %228 = OpIAdd %226 %227 
					                                              OpStore %196 %228 
					                                 i32 %229 = OpLoad %196 
					                                 f32 %230 = OpConvertSToF %229 
					                        Private f32* %231 = OpAccessChain %45 %53 
					                                              OpStore %231 %230 
					                        Private f32* %232 = OpAccessChain %9 %53 
					                                 f32 %233 = OpLoad %232 
					                        Private f32* %234 = OpAccessChain %45 %53 
					                                 f32 %235 = OpLoad %234 
					                                 f32 %236 = OpFMul %233 %235 
					                        Private f32* %237 = OpAccessChain %9 %53 
					                                              OpStore %237 %236 
					                        Uniform f32* %239 = OpAccessChain %13 %238 
					                                 f32 %240 = OpLoad %239 
					                                 f32 %241 = OpFNegate %240 
					                        Private f32* %242 = OpAccessChain %9 %53 
					                                 f32 %243 = OpLoad %242 
					                                 f32 %244 = OpFMul %241 %243 
					                                 f32 %245 = OpFAdd %244 %178 
					                        Private f32* %246 = OpAccessChain %45 %53 
					                                              OpStore %246 %245 
					                        Private f32* %247 = OpAccessChain %45 %53 
					                                 f32 %248 = OpLoad %247 
					                                 f32 %250 = OpExtInst %1 43 %248 %197 %249 
					                        Private f32* %251 = OpAccessChain %45 %53 
					                                              OpStore %251 %250 
					                        Private f32* %253 = OpAccessChain %9 %53 
					                                 f32 %254 = OpLoad %253 
					                        Uniform f32* %255 = OpAccessChain %13 %238 
					                                 f32 %256 = OpLoad %255 
					                                 f32 %257 = OpFMul %254 %256 
					                                              OpStore %252 %257 
					                        Uniform f32* %258 = OpAccessChain %13 %238 
					                                 f32 %259 = OpLoad %258 
					                        Private f32* %260 = OpAccessChain %9 %53 
					                                 f32 %261 = OpLoad %260 
					                                 f32 %262 = OpFMul %259 %261 
					                                 f32 %264 = OpFAdd %262 %263 
					                        Private f32* %265 = OpAccessChain %9 %53 
					                                              OpStore %265 %264 
					                        Private f32* %266 = OpAccessChain %9 %53 
					                                 f32 %267 = OpLoad %266 
					                                 f32 %268 = OpExtInst %1 43 %267 %197 %249 
					                        Private f32* %269 = OpAccessChain %9 %53 
					                                              OpStore %269 %268 
					                                 f32 %271 = OpLoad %252 
					                                 f32 %272 = OpExtInst %1 4 %271 
					                                 f32 %274 = OpFMul %272 %273 
					                                              OpStore %270 %274 
					                                 f32 %278 = OpLoad %252 
					                               f32_2 %279 = OpCompositeConstruct %278 %278 
					                               f32_2 %282 = OpFMul %279 %281 
					                               f32_3 %283 = OpLoad %277 
					                               f32_3 %284 = OpVectorShuffle %283 %282 3 4 2 
					                                              OpStore %277 %284 
					                                 f32 %285 = OpLoad %270 
					                                 f32 %286 = OpFNegate %285 
					                        Private f32* %287 = OpAccessChain %45 %53 
					                                 f32 %288 = OpLoad %287 
					                                 f32 %289 = OpFMul %286 %288 
					                                 f32 %290 = OpFAdd %289 %249 
					                        Private f32* %291 = OpAccessChain %45 %53 
					                                              OpStore %291 %290 
					                        Private f32* %293 = OpAccessChain %277 %292 
					                                              OpStore %293 %197 
					                               f32_2 %295 = OpLoad %31 
					                               f32_3 %296 = OpLoad %277 
					                               f32_2 %297 = OpVectorShuffle %296 %296 0 2 
					                               f32_2 %298 = OpFAdd %295 %297 
					                               f32_3 %299 = OpLoad %294 
					                               f32_3 %300 = OpVectorShuffle %299 %298 3 4 2 
					                                              OpStore %294 %300 
					                               f32_3 %301 = OpLoad %294 
					                               f32_2 %302 = OpVectorShuffle %301 %301 0 1 
					                               f32_2 %303 = OpCompositeConstruct %197 %197 
					                               f32_2 %304 = OpCompositeConstruct %249 %249 
					                               f32_2 %305 = OpExtInst %1 43 %302 %303 %304 
					                               f32_3 %306 = OpLoad %294 
					                               f32_3 %307 = OpVectorShuffle %306 %305 3 4 2 
					                                              OpStore %294 %307 
					                        Private f32* %308 = OpAccessChain %294 %47 
					                                 f32 %309 = OpLoad %308 
					                                 f32 %310 = OpFNegate %309 
					                                 f32 %311 = OpFAdd %310 %249 
					                        Private f32* %312 = OpAccessChain %31 %53 
					                                              OpStore %312 %311 
					                                bool %313 = OpLoad %83 
					                                              OpSelectionMerge %317 None 
					                                              OpBranchConditional %313 %316 %320 
					                                     %316 = OpLabel 
					                        Private f32* %318 = OpAccessChain %31 %53 
					                                 f32 %319 = OpLoad %318 
					                                              OpStore %315 %319 
					                                              OpBranch %317 
					                                     %320 = OpLabel 
					                        Private f32* %321 = OpAccessChain %294 %47 
					                                 f32 %322 = OpLoad %321 
					                                              OpStore %315 %322 
					                                              OpBranch %317 
					                                     %317 = OpLabel 
					                                 f32 %323 = OpLoad %315 
					                        Private f32* %324 = OpAccessChain %294 %292 
					                                              OpStore %324 %323 
					                 read_only Texture2D %330 = OpLoad %329 
					                             sampler %334 = OpLoad %333 
					          read_only Texture2DSampled %336 = OpSampledImage %330 %334 
					                               f32_3 %337 = OpLoad %294 
					                               f32_2 %338 = OpVectorShuffle %337 %337 0 2 
					                               f32_4 %339 = OpImageSampleImplicitLod %336 %338 
					                                              OpStore %326 %339 
					                               f32_4 %341 = OpLoad %326 
					                               f32_3 %342 = OpVectorShuffle %341 %341 0 1 2 
					                                 f32 %347 = OpDot %342 %346 
					                                              OpStore %340 %347 
					                                 f32 %348 = OpLoad %340 
					                        Private f32* %349 = OpAccessChain %45 %53 
					                                 f32 %350 = OpLoad %349 
					                                 f32 %351 = OpFDiv %348 %350 
					                        Private f32* %352 = OpAccessChain %45 %53 
					                                              OpStore %352 %351 
					                               f32_4 %353 = OpLoad %326 
					                               f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
					                                 f32 %359 = OpDot %354 %358 
					                                              OpStore %340 %359 
					                        Private f32* %360 = OpAccessChain %277 %47 
					                                 f32 %361 = OpLoad %360 
					                        Private f32* %362 = OpAccessChain %9 %53 
					                                 f32 %363 = OpLoad %362 
					                                 f32 %364 = OpFMul %361 %363 
					                                 f32 %365 = OpLoad %340 
					                                 f32 %366 = OpFAdd %364 %365 
					                        Private f32* %367 = OpAccessChain %45 %47 
					                                              OpStore %367 %366 
					                               f32_2 %371 = OpLoad %45 
					                                 f32 %372 = OpDot %370 %371 
					                        Private f32* %373 = OpAccessChain %9 %53 
					                                              OpStore %373 %372 
					                               f32_4 %374 = OpLoad %326 
					                               f32_3 %375 = OpVectorShuffle %374 %374 0 1 2 
					                                 f32 %380 = OpDot %375 %379 
					                                              OpStore %340 %380 
					                        Private f32* %384 = OpAccessChain %326 %383 
					                                 f32 %385 = OpLoad %384 
					                         Output f32* %387 = OpAccessChain %382 %383 
					                                              OpStore %387 %385 
					                        Private f32* %388 = OpAccessChain %9 %53 
					                                 f32 %389 = OpLoad %388 
					                                 f32 %390 = OpLoad %340 
					                                 f32 %391 = OpFAdd %389 %390 
					                         Output f32* %392 = OpAccessChain %382 %47 
					                                              OpStore %392 %391 
					                               f32_2 %393 = OpLoad %45 
					                               f32_2 %394 = OpVectorShuffle %393 %393 1 0 
					                               f32_2 %398 = OpFMul %394 %397 
					                                 f32 %399 = OpLoad %340 
					                               f32_2 %400 = OpCompositeConstruct %399 %399 
					                               f32_2 %401 = OpFAdd %398 %400 
					                               f32_4 %402 = OpLoad %382 
					                               f32_4 %403 = OpVectorShuffle %402 %401 4 1 5 3 
					                                              OpStore %382 %403 
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
						float _Glitch;
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					int u_xlati1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					float u_xlat16_4;
					bool u_xlatb4;
					float u_xlat5;
					int u_xlati5;
					vec2 u_xlat8;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vec2(_TimeX) * vec2(4.0, 8.0);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(37.5, 0.125);
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat8.y * 16.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0.x = u_xlat1.x * 0.0625 + u_xlat0.x;
					    u_xlat4 = dot(u_xlat0.yy, vec2(12.9898005, 78.2330017));
					    u_xlat4 = sin(u_xlat4);
					    u_xlat4 = u_xlat4 * 43758.5469;
					    u_xlat4 = fract(u_xlat4);
					    u_xlatb4 = 0.99000001<u_xlat4;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat1.x = u_xlat0.x * _TimeX;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0.x = u_xlat1.x / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 5.0 + u_xlat8.y;
					    u_xlat1.xy = u_xlat0.xx * vec2(11.0, 7.0);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.0909090936, 0.142857149);
					    u_xlat0.x = dot(u_xlat1.yy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = dot(u_xlat1.xx, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat1.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlati1 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati5 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlat0.x = abs(u_xlat0.x) + -0.600000024;
					    u_xlat0.x = u_xlat0.x * 2.5;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlati1 = (-u_xlati1) + u_xlati5;
					    u_xlat1.x = float(u_xlati1);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat1.x = (-_Glitch) * u_xlat0.x + 0.5;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * _Glitch;
					    u_xlat0.x = _Glitch * u_xlat0.x + -0.5;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat9 = abs(u_xlat5) * 3.0;
					    u_xlat2.xy = vec2(u_xlat5) * vec2(0.100000001, 0.125);
					    u_xlat1.x = (-u_xlat9) * u_xlat1.x + 1.0;
					    u_xlat2.z = 0.0;
					    u_xlat3.xy = u_xlat8.xy + u_xlat2.xz;
					    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
					    u_xlat8.x = (-u_xlat3.y) + 1.0;
					    u_xlat3.z = (u_xlatb4) ? u_xlat8.x : u_xlat3.y;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xz);
					    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(-0.147129998, -0.288859993, 0.43599999));
					    u_xlat1.x = u_xlat16_4 / u_xlat1.x;
					    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.61500001, -0.514989972, -0.10001));
					    u_xlat1.y = u_xlat2.y * u_xlat0.x + u_xlat16_4;
					    u_xlat0.x = dot(vec2(-0.394650012, -0.580600023), u_xlat1.xy);
					    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    SV_Target0.w = u_xlat10_3.w;
					    SV_Target0.y = u_xlat0.x + u_xlat16_4;
					    SV_Target0.xz = u_xlat1.yx * vec2(1.13982999, 2.03210998) + vec2(u_xlat16_4);
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