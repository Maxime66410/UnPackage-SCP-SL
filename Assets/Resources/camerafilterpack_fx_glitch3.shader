Shader "CameraFilterPack/FX_Glitch3" {
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
			GpuProgramID 54590
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
					uniform 	float _Noise;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					int u_xlati5;
					vec2 u_xlat8;
					float u_xlat16_8;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vec2(_TimeX) * vec2(4.0, 100.0);
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 37.5;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat8.y * 16.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0.x = u_xlat1.x * 0.0625 + u_xlat0.x;
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
					    u_xlat0.x = u_xlat0.x * 1.5;
					    u_xlat0.x = u_xlat1.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlati1 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati5 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlat0.x = abs(u_xlat0.x) + -0.600000024;
					    u_xlat0.x = u_xlat0.x * 2.5;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlati1 = (-u_xlati1) + u_xlati5;
					    u_xlat1.x = float(u_xlati1);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat1.x = (-_Glitch) * u_xlat0.x + 10.5;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = u_xlat0.x * _Glitch;
					    u_xlat0.x = _Glitch * u_xlat0.x + -0.5;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat9 = abs(u_xlat5.x) * 3.0;
					    u_xlat2.xy = u_xlat5.xx * vec2(0.100000001, 1.125);
					    u_xlat1.x = (-u_xlat9) * u_xlat1.x + 1.0;
					    u_xlat2.z = 0.0;
					    u_xlat5.xy = u_xlat8.xy + u_xlat2.xz;
					    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
					    u_xlat4.xy = u_xlat0.yy * u_xlat8.xy;
					    u_xlat4.x = dot(u_xlat4.xy, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat4.x = fract(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 0.5;
					    u_xlat10_3 = texture(_MainTex, u_xlat5.xy);
					    u_xlat16_8 = dot(u_xlat10_3.xyz, vec3(-0.147129998, -0.288859993, 0.43599999));
					    u_xlat1.x = u_xlat16_8 / u_xlat1.x;
					    u_xlat16_8 = dot(u_xlat10_3.xyz, vec3(0.61500001, -0.514989972, -0.10001));
					    u_xlat1.y = u_xlat2.y * u_xlat0.x + u_xlat16_8;
					    u_xlat0.x = dot(vec2(-0.394650012, -0.580600023), u_xlat1.xy);
					    u_xlat16_8 = dot(u_xlat10_3.xyz, vec3(-0.298999995, 0.587000012, 0.114));
					    u_xlat2.y = u_xlat0.x + u_xlat16_8;
					    u_xlat2.xz = u_xlat1.yx * vec2(1.13982999, 2.03210998) + vec2(u_xlat16_8);
					    u_xlat2.w = u_xlat10_3.w;
					    u_xlat1 = (-u_xlat2) + vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0 = u_xlat4.xxxx * u_xlat1 + u_xlat2;
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + (-u_xlat10_3);
					    SV_Target0 = vec4(vec4(_Noise, _Noise, _Noise, _Noise)) * u_xlat0 + u_xlat10_3;
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
					; Bound: 441
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %41 %420 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpMemberDecorate %10 0 Offset 10 
					                                                OpMemberDecorate %10 1 Offset 10 
					                                                OpMemberDecorate %10 2 Offset 10 
					                                                OpMemberDecorate %10 3 RelaxedPrecision 
					                                                OpMemberDecorate %10 3 Offset 10 
					                                                OpDecorate %10 Block 
					                                                OpDecorate %12 DescriptorSet 12 
					                                                OpDecorate %12 Binding 12 
					                                                OpDecorate vs_TEXCOORD0 Location 41 
					                                                OpDecorate %46 RelaxedPrecision 
					                                                OpDecorate %47 RelaxedPrecision 
					                                                OpDecorate %50 RelaxedPrecision 
					                                                OpDecorate %51 RelaxedPrecision 
					                                                OpDecorate %327 RelaxedPrecision 
					                                                OpDecorate %330 RelaxedPrecision 
					                                                OpDecorate %330 DescriptorSet 330 
					                                                OpDecorate %330 Binding 330 
					                                                OpDecorate %331 RelaxedPrecision 
					                                                OpDecorate %334 RelaxedPrecision 
					                                                OpDecorate %334 DescriptorSet 334 
					                                                OpDecorate %334 Binding 334 
					                                                OpDecorate %335 RelaxedPrecision 
					                                                OpDecorate %340 RelaxedPrecision 
					                                                OpDecorate %342 RelaxedPrecision 
					                                                OpDecorate %343 RelaxedPrecision 
					                                                OpDecorate %348 RelaxedPrecision 
					                                                OpDecorate %349 RelaxedPrecision 
					                                                OpDecorate %354 RelaxedPrecision 
					                                                OpDecorate %355 RelaxedPrecision 
					                                                OpDecorate %360 RelaxedPrecision 
					                                                OpDecorate %366 RelaxedPrecision 
					                                                OpDecorate %376 RelaxedPrecision 
					                                                OpDecorate %377 RelaxedPrecision 
					                                                OpDecorate %382 RelaxedPrecision 
					                                                OpDecorate %385 RelaxedPrecision 
					                                                OpDecorate %394 RelaxedPrecision 
					                                                OpDecorate %401 RelaxedPrecision 
					                                                OpDecorate %416 RelaxedPrecision 
					                                                OpDecorate %417 RelaxedPrecision 
					                                                OpDecorate %420 Location 420 
					                                                OpDecorate %438 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 4 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_4* %9 = OpVariable Private 
					                                        %10 = OpTypeStruct %6 %6 %6 %7 
					                                        %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                        %13 = OpTypeInt 32 1 
					                                    i32 %14 = OpConstant 0 
					                                        %15 = OpTypePointer Uniform %6 
					                                        %18 = OpTypeVector %6 2 
					                                    f32 %20 = OpConstant 3,674022E-40 
					                                    f32 %21 = OpConstant 3,674022E-40 
					                                  f32_2 %22 = OpConstantComposite %20 %21 
					                                        %26 = OpTypeInt 32 0 
					                                    u32 %27 = OpConstant 0 
					                                        %28 = OpTypePointer Private %6 
					                                    f32 %35 = OpConstant 3,674022E-40 
					                                        %38 = OpTypePointer Private %18 
					                         Private f32_2* %39 = OpVariable Private 
					                                        %40 = OpTypePointer Input %18 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                    i32 %43 = OpConstant 3 
					                                        %44 = OpTypePointer Uniform %7 
					                         Private f32_4* %53 = OpVariable Private 
					                                    u32 %54 = OpConstant 1 
					                                    f32 %57 = OpConstant 3,674022E-40 
					                                    f32 %66 = OpConstant 3,674022E-40 
					                                    f32 %74 = OpConstant 3,674022E-40 
					                                    f32 %75 = OpConstant 3,674022E-40 
					                                  f32_2 %76 = OpConstantComposite %74 %75 
					                                    f32 %85 = OpConstant 3,674022E-40 
					                                   f32 %114 = OpConstant 3,674022E-40 
					                                   f32 %122 = OpConstant 3,674022E-40 
					                                   f32 %123 = OpConstant 3,674022E-40 
					                                 f32_2 %124 = OpConstantComposite %122 %123 
					                                   f32 %135 = OpConstant 3,674022E-40 
					                                   f32 %136 = OpConstant 3,674022E-40 
					                                 f32_2 %137 = OpConstantComposite %135 %136 
					                                   f32 %175 = OpConstant 3,674022E-40 
					                                   f32 %180 = OpConstant 3,674022E-40 
					                                   f32 %188 = OpConstant 3,674022E-40 
					                                   f32 %190 = OpConstant 3,674022E-40 
					                                       %193 = OpTypePointer Private %13 
					                          Private i32* %194 = OpVariable Private 
					                                   f32 %195 = OpConstant 3,674022E-40 
					                                       %198 = OpTypeBool 
					                                   u32 %200 = OpConstant 4294967295 
					                          Private i32* %203 = OpVariable Private 
					                                   f32 %212 = OpConstant 3,674022E-40 
					                                   f32 %217 = OpConstant 3,674022E-40 
					                                   f32 %222 = OpConstant 3,674022E-40 
					                                   i32 %238 = OpConstant 1 
					                                   f32 %245 = OpConstant 3,674022E-40 
					                        Private f32_2* %252 = OpVariable Private 
					                                   f32 %264 = OpConstant 3,674022E-40 
					                          Private f32* %271 = OpVariable Private 
					                                   f32 %275 = OpConstant 3,674022E-40 
					                        Private f32_4* %277 = OpVariable Private 
					                                   f32 %280 = OpConstant 3,674022E-40 
					                                   f32 %281 = OpConstant 3,674022E-40 
					                                 f32_2 %282 = OpConstantComposite %280 %281 
					                                   u32 %293 = OpConstant 2 
					                        Private f32_2* %303 = OpVariable Private 
					                        Private f32_4* %327 = OpVariable Private 
					                                       %328 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                       %329 = OpTypePointer UniformConstant %328 
					  UniformConstant read_only Texture2D* %330 = OpVariable UniformConstant 
					                                       %332 = OpTypeSampler 
					                                       %333 = OpTypePointer UniformConstant %332 
					              UniformConstant sampler* %334 = OpVariable UniformConstant 
					                                       %336 = OpTypeSampledImage %328 
					                          Private f32* %340 = OpVariable Private 
					                                       %341 = OpTypeVector %6 3 
					                                   f32 %344 = OpConstant 3,674022E-40 
					                                   f32 %345 = OpConstant 3,674022E-40 
					                                   f32 %346 = OpConstant 3,674022E-40 
					                                 f32_3 %347 = OpConstantComposite %344 %345 %346 
					                                   f32 %356 = OpConstant 3,674022E-40 
					                                   f32 %357 = OpConstant 3,674022E-40 
					                                   f32 %358 = OpConstant 3,674022E-40 
					                                 f32_3 %359 = OpConstantComposite %356 %357 %358 
					                                   f32 %369 = OpConstant 3,674022E-40 
					                                   f32 %370 = OpConstant 3,674022E-40 
					                                 f32_2 %371 = OpConstantComposite %369 %370 
					                                   f32 %378 = OpConstant 3,674022E-40 
					                                   f32 %379 = OpConstant 3,674022E-40 
					                                   f32 %380 = OpConstant 3,674022E-40 
					                                 f32_3 %381 = OpConstantComposite %378 %379 %380 
					                                   f32 %390 = OpConstant 3,674022E-40 
					                                   f32 %391 = OpConstant 3,674022E-40 
					                                 f32_2 %392 = OpConstantComposite %390 %391 
					                                   u32 %399 = OpConstant 3 
					                                 f32_4 %405 = OpConstantComposite %195 %195 %195 %222 
					                                 f32_4 %414 = OpConstantComposite %188 %188 %188 %188 
					                                       %419 = OpTypePointer Output %7 
					                         Output f32_4* %420 = OpVariable Output 
					                                   i32 %421 = OpConstant 2 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                           Uniform f32* %16 = OpAccessChain %12 %14 
					                                    f32 %17 = OpLoad %16 
					                                  f32_2 %19 = OpCompositeConstruct %17 %17 
					                                  f32_2 %23 = OpFMul %19 %22 
					                                  f32_4 %24 = OpLoad %9 
					                                  f32_4 %25 = OpVectorShuffle %24 %23 4 5 2 3 
					                                                OpStore %9 %25 
					                           Private f32* %29 = OpAccessChain %9 %27 
					                                    f32 %30 = OpLoad %29 
					                                    f32 %31 = OpExtInst %1 8 %30 
					                           Private f32* %32 = OpAccessChain %9 %27 
					                                                OpStore %32 %31 
					                           Private f32* %33 = OpAccessChain %9 %27 
					                                    f32 %34 = OpLoad %33 
					                                    f32 %36 = OpFMul %34 %35 
					                           Private f32* %37 = OpAccessChain %9 %27 
					                                                OpStore %37 %36 
					                                  f32_2 %42 = OpLoad vs_TEXCOORD0 
					                         Uniform f32_4* %45 = OpAccessChain %12 %43 
					                                  f32_4 %46 = OpLoad %45 
					                                  f32_2 %47 = OpVectorShuffle %46 %46 0 1 
					                                  f32_2 %48 = OpFMul %42 %47 
					                         Uniform f32_4* %49 = OpAccessChain %12 %43 
					                                  f32_4 %50 = OpLoad %49 
					                                  f32_2 %51 = OpVectorShuffle %50 %50 2 3 
					                                  f32_2 %52 = OpFAdd %48 %51 
					                                                OpStore %39 %52 
					                           Private f32* %55 = OpAccessChain %39 %54 
					                                    f32 %56 = OpLoad %55 
					                                    f32 %58 = OpFMul %56 %57 
					                           Private f32* %59 = OpAccessChain %53 %27 
					                                                OpStore %59 %58 
					                           Private f32* %60 = OpAccessChain %53 %27 
					                                    f32 %61 = OpLoad %60 
					                                    f32 %62 = OpExtInst %1 8 %61 
					                           Private f32* %63 = OpAccessChain %53 %27 
					                                                OpStore %63 %62 
					                           Private f32* %64 = OpAccessChain %53 %27 
					                                    f32 %65 = OpLoad %64 
					                                    f32 %67 = OpFMul %65 %66 
					                           Private f32* %68 = OpAccessChain %9 %27 
					                                    f32 %69 = OpLoad %68 
					                                    f32 %70 = OpFAdd %67 %69 
					                           Private f32* %71 = OpAccessChain %9 %27 
					                                                OpStore %71 %70 
					                                  f32_4 %72 = OpLoad %9 
					                                  f32_2 %73 = OpVectorShuffle %72 %72 0 0 
					                                    f32 %77 = OpDot %73 %76 
					                           Private f32* %78 = OpAccessChain %9 %27 
					                                                OpStore %78 %77 
					                           Private f32* %79 = OpAccessChain %9 %27 
					                                    f32 %80 = OpLoad %79 
					                                    f32 %81 = OpExtInst %1 13 %80 
					                           Private f32* %82 = OpAccessChain %9 %27 
					                                                OpStore %82 %81 
					                           Private f32* %83 = OpAccessChain %9 %27 
					                                    f32 %84 = OpLoad %83 
					                                    f32 %86 = OpFMul %84 %85 
					                           Private f32* %87 = OpAccessChain %9 %27 
					                                                OpStore %87 %86 
					                           Private f32* %88 = OpAccessChain %9 %27 
					                                    f32 %89 = OpLoad %88 
					                                    f32 %90 = OpExtInst %1 10 %89 
					                           Private f32* %91 = OpAccessChain %9 %27 
					                                                OpStore %91 %90 
					                           Private f32* %92 = OpAccessChain %9 %27 
					                                    f32 %93 = OpLoad %92 
					                                    f32 %94 = OpFMul %93 %57 
					                           Private f32* %95 = OpAccessChain %9 %27 
					                                                OpStore %95 %94 
					                           Private f32* %96 = OpAccessChain %9 %27 
					                                    f32 %97 = OpLoad %96 
					                           Uniform f32* %98 = OpAccessChain %12 %14 
					                                    f32 %99 = OpLoad %98 
					                                   f32 %100 = OpFMul %97 %99 
					                          Private f32* %101 = OpAccessChain %53 %27 
					                                                OpStore %101 %100 
					                          Private f32* %102 = OpAccessChain %53 %27 
					                                   f32 %103 = OpLoad %102 
					                                   f32 %104 = OpExtInst %1 8 %103 
					                          Private f32* %105 = OpAccessChain %53 %27 
					                                                OpStore %105 %104 
					                          Private f32* %106 = OpAccessChain %53 %27 
					                                   f32 %107 = OpLoad %106 
					                          Private f32* %108 = OpAccessChain %9 %27 
					                                   f32 %109 = OpLoad %108 
					                                   f32 %110 = OpFDiv %107 %109 
					                          Private f32* %111 = OpAccessChain %9 %27 
					                                                OpStore %111 %110 
					                          Private f32* %112 = OpAccessChain %9 %27 
					                                   f32 %113 = OpLoad %112 
					                                   f32 %115 = OpFMul %113 %114 
					                          Private f32* %116 = OpAccessChain %39 %54 
					                                   f32 %117 = OpLoad %116 
					                                   f32 %118 = OpFAdd %115 %117 
					                          Private f32* %119 = OpAccessChain %9 %27 
					                                                OpStore %119 %118 
					                                 f32_4 %120 = OpLoad %9 
					                                 f32_2 %121 = OpVectorShuffle %120 %120 0 0 
					                                 f32_2 %125 = OpFMul %121 %124 
					                                 f32_4 %126 = OpLoad %53 
					                                 f32_4 %127 = OpVectorShuffle %126 %125 4 5 2 3 
					                                                OpStore %53 %127 
					                                 f32_4 %128 = OpLoad %53 
					                                 f32_2 %129 = OpVectorShuffle %128 %128 0 1 
					                                 f32_2 %130 = OpExtInst %1 8 %129 
					                                 f32_4 %131 = OpLoad %53 
					                                 f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
					                                                OpStore %53 %132 
					                                 f32_4 %133 = OpLoad %53 
					                                 f32_2 %134 = OpVectorShuffle %133 %133 0 1 
					                                 f32_2 %138 = OpFMul %134 %137 
					                                 f32_4 %139 = OpLoad %53 
					                                 f32_4 %140 = OpVectorShuffle %139 %138 4 5 2 3 
					                                                OpStore %53 %140 
					                                 f32_4 %141 = OpLoad %53 
					                                 f32_2 %142 = OpVectorShuffle %141 %141 1 1 
					                                   f32 %143 = OpDot %142 %76 
					                          Private f32* %144 = OpAccessChain %9 %27 
					                                                OpStore %144 %143 
					                                 f32_4 %145 = OpLoad %53 
					                                 f32_2 %146 = OpVectorShuffle %145 %145 0 0 
					                                   f32 %147 = OpDot %146 %76 
					                          Private f32* %148 = OpAccessChain %53 %27 
					                                                OpStore %148 %147 
					                          Private f32* %149 = OpAccessChain %53 %27 
					                                   f32 %150 = OpLoad %149 
					                                   f32 %151 = OpExtInst %1 13 %150 
					                          Private f32* %152 = OpAccessChain %53 %27 
					                                                OpStore %152 %151 
					                          Private f32* %153 = OpAccessChain %53 %27 
					                                   f32 %154 = OpLoad %153 
					                                   f32 %155 = OpFMul %154 %85 
					                          Private f32* %156 = OpAccessChain %53 %27 
					                                                OpStore %156 %155 
					                          Private f32* %157 = OpAccessChain %53 %27 
					                                   f32 %158 = OpLoad %157 
					                                   f32 %159 = OpExtInst %1 10 %158 
					                          Private f32* %160 = OpAccessChain %53 %27 
					                                                OpStore %160 %159 
					                          Private f32* %161 = OpAccessChain %9 %27 
					                                   f32 %162 = OpLoad %161 
					                                   f32 %163 = OpExtInst %1 13 %162 
					                          Private f32* %164 = OpAccessChain %9 %27 
					                                                OpStore %164 %163 
					                          Private f32* %165 = OpAccessChain %9 %27 
					                                   f32 %166 = OpLoad %165 
					                                   f32 %167 = OpFMul %166 %85 
					                          Private f32* %168 = OpAccessChain %9 %27 
					                                                OpStore %168 %167 
					                          Private f32* %169 = OpAccessChain %9 %27 
					                                   f32 %170 = OpLoad %169 
					                                   f32 %171 = OpExtInst %1 10 %170 
					                          Private f32* %172 = OpAccessChain %9 %27 
					                                                OpStore %172 %171 
					                          Private f32* %173 = OpAccessChain %9 %27 
					                                   f32 %174 = OpLoad %173 
					                                   f32 %176 = OpFMul %174 %175 
					                          Private f32* %177 = OpAccessChain %9 %27 
					                                                OpStore %177 %176 
					                          Private f32* %178 = OpAccessChain %53 %27 
					                                   f32 %179 = OpLoad %178 
					                                   f32 %181 = OpFMul %179 %180 
					                          Private f32* %182 = OpAccessChain %9 %27 
					                                   f32 %183 = OpLoad %182 
					                                   f32 %184 = OpFAdd %181 %183 
					                          Private f32* %185 = OpAccessChain %9 %27 
					                                                OpStore %185 %184 
					                          Private f32* %186 = OpAccessChain %9 %27 
					                                   f32 %187 = OpLoad %186 
					                                   f32 %189 = OpFMul %187 %188 
					                                   f32 %191 = OpFAdd %189 %190 
					                          Private f32* %192 = OpAccessChain %9 %27 
					                                                OpStore %192 %191 
					                          Private f32* %196 = OpAccessChain %9 %27 
					                                   f32 %197 = OpLoad %196 
					                                  bool %199 = OpFOrdLessThan %195 %197 
					                                   u32 %201 = OpSelect %199 %200 %27 
					                                   i32 %202 = OpBitcast %201 
					                                                OpStore %194 %202 
					                          Private f32* %204 = OpAccessChain %9 %27 
					                                   f32 %205 = OpLoad %204 
					                                  bool %206 = OpFOrdLessThan %205 %195 
					                                   u32 %207 = OpSelect %206 %200 %27 
					                                   i32 %208 = OpBitcast %207 
					                                                OpStore %203 %208 
					                          Private f32* %209 = OpAccessChain %9 %27 
					                                   f32 %210 = OpLoad %209 
					                                   f32 %211 = OpExtInst %1 4 %210 
					                                   f32 %213 = OpFAdd %211 %212 
					                          Private f32* %214 = OpAccessChain %9 %27 
					                                                OpStore %214 %213 
					                          Private f32* %215 = OpAccessChain %9 %27 
					                                   f32 %216 = OpLoad %215 
					                                   f32 %218 = OpFMul %216 %217 
					                          Private f32* %219 = OpAccessChain %9 %27 
					                                                OpStore %219 %218 
					                          Private f32* %220 = OpAccessChain %9 %27 
					                                   f32 %221 = OpLoad %220 
					                                   f32 %223 = OpExtInst %1 43 %221 %195 %222 
					                          Private f32* %224 = OpAccessChain %9 %27 
					                                                OpStore %224 %223 
					                                   i32 %225 = OpLoad %194 
					                                   i32 %226 = OpSNegate %225 
					                                   i32 %227 = OpLoad %203 
					                                   i32 %228 = OpIAdd %226 %227 
					                                                OpStore %194 %228 
					                                   i32 %229 = OpLoad %194 
					                                   f32 %230 = OpConvertSToF %229 
					                          Private f32* %231 = OpAccessChain %53 %27 
					                                                OpStore %231 %230 
					                          Private f32* %232 = OpAccessChain %9 %27 
					                                   f32 %233 = OpLoad %232 
					                          Private f32* %234 = OpAccessChain %53 %27 
					                                   f32 %235 = OpLoad %234 
					                                   f32 %236 = OpFMul %233 %235 
					                          Private f32* %237 = OpAccessChain %9 %27 
					                                                OpStore %237 %236 
					                          Uniform f32* %239 = OpAccessChain %12 %238 
					                                   f32 %240 = OpLoad %239 
					                                   f32 %241 = OpFNegate %240 
					                          Private f32* %242 = OpAccessChain %9 %27 
					                                   f32 %243 = OpLoad %242 
					                                   f32 %244 = OpFMul %241 %243 
					                                   f32 %246 = OpFAdd %244 %245 
					                          Private f32* %247 = OpAccessChain %53 %27 
					                                                OpStore %247 %246 
					                          Private f32* %248 = OpAccessChain %53 %27 
					                                   f32 %249 = OpLoad %248 
					                                   f32 %250 = OpExtInst %1 43 %249 %195 %222 
					                          Private f32* %251 = OpAccessChain %53 %27 
					                                                OpStore %251 %250 
					                          Private f32* %253 = OpAccessChain %9 %27 
					                                   f32 %254 = OpLoad %253 
					                          Uniform f32* %255 = OpAccessChain %12 %238 
					                                   f32 %256 = OpLoad %255 
					                                   f32 %257 = OpFMul %254 %256 
					                          Private f32* %258 = OpAccessChain %252 %27 
					                                                OpStore %258 %257 
					                          Uniform f32* %259 = OpAccessChain %12 %238 
					                                   f32 %260 = OpLoad %259 
					                          Private f32* %261 = OpAccessChain %9 %27 
					                                   f32 %262 = OpLoad %261 
					                                   f32 %263 = OpFMul %260 %262 
					                                   f32 %265 = OpFAdd %263 %264 
					                          Private f32* %266 = OpAccessChain %9 %27 
					                                                OpStore %266 %265 
					                          Private f32* %267 = OpAccessChain %9 %27 
					                                   f32 %268 = OpLoad %267 
					                                   f32 %269 = OpExtInst %1 43 %268 %195 %222 
					                          Private f32* %270 = OpAccessChain %9 %27 
					                                                OpStore %270 %269 
					                          Private f32* %272 = OpAccessChain %252 %27 
					                                   f32 %273 = OpLoad %272 
					                                   f32 %274 = OpExtInst %1 4 %273 
					                                   f32 %276 = OpFMul %274 %275 
					                                                OpStore %271 %276 
					                                 f32_2 %278 = OpLoad %252 
					                                 f32_2 %279 = OpVectorShuffle %278 %278 0 0 
					                                 f32_2 %283 = OpFMul %279 %282 
					                                 f32_4 %284 = OpLoad %277 
					                                 f32_4 %285 = OpVectorShuffle %284 %283 4 5 2 3 
					                                                OpStore %277 %285 
					                                   f32 %286 = OpLoad %271 
					                                   f32 %287 = OpFNegate %286 
					                          Private f32* %288 = OpAccessChain %53 %27 
					                                   f32 %289 = OpLoad %288 
					                                   f32 %290 = OpFMul %287 %289 
					                                   f32 %291 = OpFAdd %290 %222 
					                          Private f32* %292 = OpAccessChain %53 %27 
					                                                OpStore %292 %291 
					                          Private f32* %294 = OpAccessChain %277 %293 
					                                                OpStore %294 %195 
					                                 f32_2 %295 = OpLoad %39 
					                                 f32_4 %296 = OpLoad %277 
					                                 f32_2 %297 = OpVectorShuffle %296 %296 0 2 
					                                 f32_2 %298 = OpFAdd %295 %297 
					                                                OpStore %252 %298 
					                                 f32_2 %299 = OpLoad %252 
					                                 f32_2 %300 = OpCompositeConstruct %195 %195 
					                                 f32_2 %301 = OpCompositeConstruct %222 %222 
					                                 f32_2 %302 = OpExtInst %1 43 %299 %300 %301 
					                                                OpStore %252 %302 
					                                 f32_4 %304 = OpLoad %9 
					                                 f32_2 %305 = OpVectorShuffle %304 %304 1 1 
					                                 f32_2 %306 = OpLoad %39 
					                                 f32_2 %307 = OpFMul %305 %306 
					                                                OpStore %303 %307 
					                                 f32_2 %308 = OpLoad %303 
					                                   f32 %309 = OpDot %308 %76 
					                          Private f32* %310 = OpAccessChain %303 %27 
					                                                OpStore %310 %309 
					                          Private f32* %311 = OpAccessChain %303 %27 
					                                   f32 %312 = OpLoad %311 
					                                   f32 %313 = OpExtInst %1 13 %312 
					                          Private f32* %314 = OpAccessChain %303 %27 
					                                                OpStore %314 %313 
					                          Private f32* %315 = OpAccessChain %303 %27 
					                                   f32 %316 = OpLoad %315 
					                                   f32 %317 = OpFMul %316 %85 
					                          Private f32* %318 = OpAccessChain %303 %27 
					                                                OpStore %318 %317 
					                          Private f32* %319 = OpAccessChain %303 %27 
					                                   f32 %320 = OpLoad %319 
					                                   f32 %321 = OpExtInst %1 10 %320 
					                          Private f32* %322 = OpAccessChain %303 %27 
					                                                OpStore %322 %321 
					                          Private f32* %323 = OpAccessChain %303 %27 
					                                   f32 %324 = OpLoad %323 
					                                   f32 %325 = OpFMul %324 %180 
					                          Private f32* %326 = OpAccessChain %303 %27 
					                                                OpStore %326 %325 
					                   read_only Texture2D %331 = OpLoad %330 
					                               sampler %335 = OpLoad %334 
					            read_only Texture2DSampled %337 = OpSampledImage %331 %335 
					                                 f32_2 %338 = OpLoad %252 
					                                 f32_4 %339 = OpImageSampleImplicitLod %337 %338 
					                                                OpStore %327 %339 
					                                 f32_4 %342 = OpLoad %327 
					                                 f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
					                                   f32 %348 = OpDot %343 %347 
					                                                OpStore %340 %348 
					                                   f32 %349 = OpLoad %340 
					                          Private f32* %350 = OpAccessChain %53 %27 
					                                   f32 %351 = OpLoad %350 
					                                   f32 %352 = OpFDiv %349 %351 
					                          Private f32* %353 = OpAccessChain %53 %27 
					                                                OpStore %353 %352 
					                                 f32_4 %354 = OpLoad %327 
					                                 f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
					                                   f32 %360 = OpDot %355 %359 
					                                                OpStore %340 %360 
					                          Private f32* %361 = OpAccessChain %277 %54 
					                                   f32 %362 = OpLoad %361 
					                          Private f32* %363 = OpAccessChain %9 %27 
					                                   f32 %364 = OpLoad %363 
					                                   f32 %365 = OpFMul %362 %364 
					                                   f32 %366 = OpLoad %340 
					                                   f32 %367 = OpFAdd %365 %366 
					                          Private f32* %368 = OpAccessChain %53 %54 
					                                                OpStore %368 %367 
					                                 f32_4 %372 = OpLoad %53 
					                                 f32_2 %373 = OpVectorShuffle %372 %372 0 1 
					                                   f32 %374 = OpDot %371 %373 
					                          Private f32* %375 = OpAccessChain %9 %27 
					                                                OpStore %375 %374 
					                                 f32_4 %376 = OpLoad %327 
					                                 f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
					                                   f32 %382 = OpDot %377 %381 
					                                                OpStore %340 %382 
					                          Private f32* %383 = OpAccessChain %9 %27 
					                                   f32 %384 = OpLoad %383 
					                                   f32 %385 = OpLoad %340 
					                                   f32 %386 = OpFAdd %384 %385 
					                          Private f32* %387 = OpAccessChain %277 %54 
					                                                OpStore %387 %386 
					                                 f32_4 %388 = OpLoad %53 
					                                 f32_2 %389 = OpVectorShuffle %388 %388 1 0 
					                                 f32_2 %393 = OpFMul %389 %392 
					                                   f32 %394 = OpLoad %340 
					                                 f32_2 %395 = OpCompositeConstruct %394 %394 
					                                 f32_2 %396 = OpFAdd %393 %395 
					                                 f32_4 %397 = OpLoad %277 
					                                 f32_4 %398 = OpVectorShuffle %397 %396 4 1 5 3 
					                                                OpStore %277 %398 
					                          Private f32* %400 = OpAccessChain %327 %399 
					                                   f32 %401 = OpLoad %400 
					                          Private f32* %402 = OpAccessChain %277 %399 
					                                                OpStore %402 %401 
					                                 f32_4 %403 = OpLoad %277 
					                                 f32_4 %404 = OpFNegate %403 
					                                 f32_4 %406 = OpFAdd %404 %405 
					                                                OpStore %53 %406 
					                                 f32_2 %407 = OpLoad %303 
					                                 f32_4 %408 = OpVectorShuffle %407 %407 0 0 0 0 
					                                 f32_4 %409 = OpLoad %53 
					                                 f32_4 %410 = OpFMul %408 %409 
					                                 f32_4 %411 = OpLoad %277 
					                                 f32_4 %412 = OpFAdd %410 %411 
					                                                OpStore %9 %412 
					                                 f32_4 %413 = OpLoad %9 
					                                 f32_4 %415 = OpFMul %413 %414 
					                                 f32_4 %416 = OpLoad %327 
					                                 f32_4 %417 = OpFNegate %416 
					                                 f32_4 %418 = OpFAdd %415 %417 
					                                                OpStore %9 %418 
					                          Uniform f32* %422 = OpAccessChain %12 %421 
					                                   f32 %423 = OpLoad %422 
					                          Uniform f32* %424 = OpAccessChain %12 %421 
					                                   f32 %425 = OpLoad %424 
					                          Uniform f32* %426 = OpAccessChain %12 %421 
					                                   f32 %427 = OpLoad %426 
					                          Uniform f32* %428 = OpAccessChain %12 %421 
					                                   f32 %429 = OpLoad %428 
					                                 f32_4 %430 = OpCompositeConstruct %423 %425 %427 %429 
					                                   f32 %431 = OpCompositeExtract %430 0 
					                                   f32 %432 = OpCompositeExtract %430 1 
					                                   f32 %433 = OpCompositeExtract %430 2 
					                                   f32 %434 = OpCompositeExtract %430 3 
					                                 f32_4 %435 = OpCompositeConstruct %431 %432 %433 %434 
					                                 f32_4 %436 = OpLoad %9 
					                                 f32_4 %437 = OpFMul %435 %436 
					                                 f32_4 %438 = OpLoad %327 
					                                 f32_4 %439 = OpFAdd %437 %438 
					                                                OpStore %420 %439 
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
						float _Noise;
						vec4 unused_0_4;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					int u_xlati5;
					vec2 u_xlat8;
					float u_xlat16_8;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vec2(_TimeX) * vec2(4.0, 100.0);
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 37.5;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat8.y * 16.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0.x = u_xlat1.x * 0.0625 + u_xlat0.x;
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
					    u_xlat0.x = u_xlat0.x * 1.5;
					    u_xlat0.x = u_xlat1.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlati1 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati5 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlat0.x = abs(u_xlat0.x) + -0.600000024;
					    u_xlat0.x = u_xlat0.x * 2.5;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlati1 = (-u_xlati1) + u_xlati5;
					    u_xlat1.x = float(u_xlati1);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat1.x = (-_Glitch) * u_xlat0.x + 10.5;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = u_xlat0.x * _Glitch;
					    u_xlat0.x = _Glitch * u_xlat0.x + -0.5;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat9 = abs(u_xlat5.x) * 3.0;
					    u_xlat2.xy = u_xlat5.xx * vec2(0.100000001, 1.125);
					    u_xlat1.x = (-u_xlat9) * u_xlat1.x + 1.0;
					    u_xlat2.z = 0.0;
					    u_xlat5.xy = u_xlat8.xy + u_xlat2.xz;
					    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
					    u_xlat4.xy = u_xlat0.yy * u_xlat8.xy;
					    u_xlat4.x = dot(u_xlat4.xy, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat4.x = fract(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 0.5;
					    u_xlat10_3 = texture(_MainTex, u_xlat5.xy);
					    u_xlat16_8 = dot(u_xlat10_3.xyz, vec3(-0.147129998, -0.288859993, 0.43599999));
					    u_xlat1.x = u_xlat16_8 / u_xlat1.x;
					    u_xlat16_8 = dot(u_xlat10_3.xyz, vec3(0.61500001, -0.514989972, -0.10001));
					    u_xlat1.y = u_xlat2.y * u_xlat0.x + u_xlat16_8;
					    u_xlat0.x = dot(vec2(-0.394650012, -0.580600023), u_xlat1.xy);
					    u_xlat16_8 = dot(u_xlat10_3.xyz, vec3(-0.298999995, 0.587000012, 0.114));
					    u_xlat2.y = u_xlat0.x + u_xlat16_8;
					    u_xlat2.xz = u_xlat1.yx * vec2(1.13982999, 2.03210998) + vec2(u_xlat16_8);
					    u_xlat2.w = u_xlat10_3.w;
					    u_xlat1 = (-u_xlat2) + vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0 = u_xlat4.xxxx * u_xlat1 + u_xlat2;
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + (-u_xlat10_3);
					    SV_Target0 = vec4(vec4(_Noise, _Noise, _Noise, _Noise)) * u_xlat0 + u_xlat10_3;
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