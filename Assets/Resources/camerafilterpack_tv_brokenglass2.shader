Shader "CameraFilterPack/TV_BrokenGlass2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 6397
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
					uniform 	float _Bullet_1;
					uniform 	float _Bullet_2;
					uniform 	float _Bullet_3;
					uniform 	float _Bullet_4;
					uniform 	float _Bullet_5;
					uniform 	float _Bullet_6;
					uniform 	float _Bullet_7;
					uniform 	float _Bullet_8;
					uniform 	float _Bullet_9;
					uniform 	float _Bullet_10;
					uniform 	float _Bullet_11;
					uniform 	float _Bullet_12;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					float u_xlat8;
					vec2 u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.0, 0.5, 0.5);
					    u_xlat10_2 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.zw);
					    u_xlat8 = u_xlat10_2.x * _Bullet_2;
					    u_xlat9.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat10_2 = texture(_MainTex2, u_xlat9.xy);
					    u_xlat8 = u_xlat10_2.x * _Bullet_1 + u_xlat8;
					    u_xlat8 = u_xlat10_1.x * _Bullet_3 + u_xlat8;
					    u_xlat2 = u_xlat0.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.0, 0.5, 0.5, 1.0);
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.zw);
					    u_xlat8 = u_xlat10_3.x * _Bullet_4 + u_xlat8;
					    u_xlat8 = u_xlat10_3.y * _Bullet_5 + u_xlat8;
					    u_xlat8 = u_xlat10_1.y * _Bullet_6 + u_xlat8;
					    u_xlat8 = u_xlat10_2.y * _Bullet_7 + u_xlat8;
					    u_xlat1 = u_xlat0.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.0, 1.0, 0.5, 1.5);
					    u_xlat10_3 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.zw);
					    u_xlat8 = u_xlat10_3.y * _Bullet_8 + u_xlat8;
					    u_xlat8 = u_xlat10_3.z * _Bullet_9 + u_xlat8;
					    u_xlat8 = u_xlat10_2.z * _Bullet_10 + u_xlat8;
					    u_xlat8 = u_xlat10_1.z * _Bullet_11 + u_xlat8;
					    u_xlat1.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.0, 1.5);
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat8 = u_xlat10_1.z * _Bullet_12 + u_xlat8;
					    u_xlat0.xy = vec2(u_xlat8) * vec2(0.25, 0.25) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = vec3(u_xlat8) + u_xlat10_1.xyz;
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
					; Bound: 313
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %28 %302 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpMemberDecorate %12 4 Offset 12 
					                                                      OpMemberDecorate %12 5 Offset 12 
					                                                      OpMemberDecorate %12 6 Offset 12 
					                                                      OpMemberDecorate %12 7 Offset 12 
					                                                      OpMemberDecorate %12 8 Offset 12 
					                                                      OpMemberDecorate %12 9 Offset 12 
					                                                      OpMemberDecorate %12 10 Offset 12 
					                                                      OpMemberDecorate %12 11 Offset 12 
					                                                      OpMemberDecorate %12 12 Offset 12 
					                                                      OpMemberDecorate %12 13 RelaxedPrecision 
					                                                      OpMemberDecorate %12 13 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 28 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %74 RelaxedPrecision 
					                                                      OpDecorate %77 RelaxedPrecision 
					                                                      OpDecorate %77 DescriptorSet 77 
					                                                      OpDecorate %77 Binding 77 
					                                                      OpDecorate %78 RelaxedPrecision 
					                                                      OpDecorate %81 RelaxedPrecision 
					                                                      OpDecorate %81 DescriptorSet 81 
					                                                      OpDecorate %81 Binding 81 
					                                                      OpDecorate %82 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %89 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %247 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %293 DescriptorSet 293 
					                                                      OpDecorate %293 Binding 293 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %295 DescriptorSet 295 
					                                                      OpDecorate %295 Binding 295 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %302 Location 302 
					                                                      OpDecorate %305 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 2 
					                                              %11 = OpTypeVector %9 4 
					                                              %12 = OpTypeStruct %9 %9 %9 %9 %9 %9 %9 %9 %9 %9 %9 %9 %10 %11 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 12 
					                                              %17 = OpTypeInt 32 0 
					                                          u32 %18 = OpConstant 1 
					                                              %19 = OpTypePointer Uniform %9 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                              %24 = OpTypeVector %9 3 
					                                              %25 = OpTypePointer Private %24 
					                               Private f32_3* %26 = OpVariable Private 
					                                              %27 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %30 = OpConstant 13 
					                                              %31 = OpTypePointer Uniform %11 
					                                              %42 = OpTypePointer Private %10 
					                               Private f32_2* %43 = OpVariable Private 
					                                              %44 = OpTypePointer Private %9 
					                                          f32 %48 = OpConstant 3,674022E-40 
					                                          u32 %50 = OpConstant 0 
					                                              %53 = OpTypePointer Function %9 
					                                          u32 %63 = OpConstant 2 
					                                              %65 = OpTypePointer Private %11 
					                               Private f32_4* %66 = OpVariable Private 
					                                          f32 %69 = OpConstant 3,674022E-40 
					                                        f32_4 %70 = OpConstantComposite %69 %69 %69 %69 
					                                        f32_4 %72 = OpConstantComposite %69 %22 %69 %69 
					                                 Private f32* %74 = OpVariable Private 
					                                              %75 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                              %76 = OpTypePointer UniformConstant %75 
					         UniformConstant read_only Texture2D* %77 = OpVariable UniformConstant 
					                                              %79 = OpTypeSampler 
					                                              %80 = OpTypePointer UniformConstant %79 
					                     UniformConstant sampler* %81 = OpVariable UniformConstant 
					                                              %83 = OpTypeSampledImage %75 
					                               Private f32_3* %89 = OpVariable Private 
					                                         i32 %100 = OpConstant 1 
					                              Private f32_4* %105 = OpVariable Private 
					                                       f32_2 %108 = OpConstantComposite %69 %69 
					                                Private f32* %112 = OpVariable Private 
					                                         i32 %121 = OpConstant 0 
					                                         i32 %131 = OpConstant 2 
					                                       f32_4 %142 = OpConstantComposite %22 %69 %69 %48 
					                              Private f32_2* %153 = OpVariable Private 
					                                         i32 %163 = OpConstant 3 
					                                         i32 %173 = OpConstant 4 
					                                         i32 %183 = OpConstant 5 
					                                         i32 %193 = OpConstant 6 
					                              Private f32_4* %201 = OpVariable Private 
					                                         f32 %205 = OpConstant 3,674022E-40 
					                                       f32_4 %206 = OpConstantComposite %22 %48 %69 %205 
					                                       f32_2 %211 = OpConstantComposite %22 %205 
					                              Private f32_2* %220 = OpVariable Private 
					                                Private f32* %228 = OpVariable Private 
					                                         i32 %238 = OpConstant 7 
					                                         i32 %248 = OpConstant 8 
					                                         i32 %258 = OpConstant 9 
					                                         i32 %267 = OpConstant 10 
					                                         i32 %277 = OpConstant 11 
					                                         f32 %287 = OpConstant 3,674022E-40 
					                                       f32_2 %288 = OpConstantComposite %287 %287 
					        UniformConstant read_only Texture2D* %293 = OpVariable UniformConstant 
					                    UniformConstant sampler* %295 = OpVariable UniformConstant 
					                                             %301 = OpTypePointer Output %11 
					                               Output f32_4* %302 = OpVariable Output 
					                                         u32 %309 = OpConstant 3 
					                                             %310 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %54 = OpVariable Function 
					                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
					                                          f32 %21 = OpLoad %20 
					                                         bool %23 = OpFOrdLessThan %21 %22 
					                                                      OpStore %8 %23 
					                                        f32_2 %29 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %32 = OpAccessChain %14 %30 
					                                        f32_4 %33 = OpLoad %32 
					                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                        f32_2 %35 = OpFMul %29 %34 
					                               Uniform f32_4* %36 = OpAccessChain %14 %30 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
					                                        f32_2 %39 = OpFAdd %35 %38 
					                                        f32_3 %40 = OpLoad %26 
					                                        f32_3 %41 = OpVectorShuffle %40 %39 3 4 2 
					                                                      OpStore %26 %41 
					                                 Private f32* %45 = OpAccessChain %26 %18 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %47 = OpFNegate %46 
					                                          f32 %49 = OpFAdd %47 %48 
					                                 Private f32* %51 = OpAccessChain %43 %50 
					                                                      OpStore %51 %49 
					                                         bool %52 = OpLoad %8 
					                                                      OpSelectionMerge %56 None 
					                                                      OpBranchConditional %52 %55 %59 
					                                              %55 = OpLabel 
					                                 Private f32* %57 = OpAccessChain %43 %50 
					                                          f32 %58 = OpLoad %57 
					                                                      OpStore %54 %58 
					                                                      OpBranch %56 
					                                              %59 = OpLabel 
					                                 Private f32* %60 = OpAccessChain %26 %18 
					                                          f32 %61 = OpLoad %60 
					                                                      OpStore %54 %61 
					                                                      OpBranch %56 
					                                              %56 = OpLabel 
					                                          f32 %62 = OpLoad %54 
					                                 Private f32* %64 = OpAccessChain %26 %63 
					                                                      OpStore %64 %62 
					                                        f32_3 %67 = OpLoad %26 
					                                        f32_4 %68 = OpVectorShuffle %67 %67 0 2 0 2 
					                                        f32_4 %71 = OpFMul %68 %70 
					                                        f32_4 %73 = OpFAdd %71 %72 
					                                                      OpStore %66 %73 
					                          read_only Texture2D %78 = OpLoad %77 
					                                      sampler %82 = OpLoad %81 
					                   read_only Texture2DSampled %84 = OpSampledImage %78 %82 
					                                        f32_4 %85 = OpLoad %66 
					                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
					                                        f32_4 %87 = OpImageSampleImplicitLod %84 %86 
					                                          f32 %88 = OpCompositeExtract %87 0 
					                                                      OpStore %74 %88 
					                          read_only Texture2D %90 = OpLoad %77 
					                                      sampler %91 = OpLoad %81 
					                   read_only Texture2DSampled %92 = OpSampledImage %90 %91 
					                                        f32_4 %93 = OpLoad %66 
					                                        f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                        f32_4 %95 = OpImageSampleImplicitLod %92 %94 
					                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                        f32_3 %97 = OpLoad %89 
					                                        f32_3 %98 = OpVectorShuffle %97 %96 3 4 2 
					                                                      OpStore %89 %98 
					                                          f32 %99 = OpLoad %74 
					                                Uniform f32* %101 = OpAccessChain %14 %100 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpFMul %99 %102 
					                                Private f32* %104 = OpAccessChain %66 %50 
					                                                      OpStore %104 %103 
					                                       f32_3 %106 = OpLoad %26 
					                                       f32_2 %107 = OpVectorShuffle %106 %106 0 2 
					                                       f32_2 %109 = OpFMul %107 %108 
					                                       f32_4 %110 = OpLoad %105 
					                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
					                                                      OpStore %105 %111 
					                         read_only Texture2D %113 = OpLoad %77 
					                                     sampler %114 = OpLoad %81 
					                  read_only Texture2DSampled %115 = OpSampledImage %113 %114 
					                                       f32_4 %116 = OpLoad %105 
					                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
					                                       f32_4 %118 = OpImageSampleImplicitLod %115 %117 
					                                         f32 %119 = OpCompositeExtract %118 0 
					                                                      OpStore %112 %119 
					                                         f32 %120 = OpLoad %112 
					                                Uniform f32* %122 = OpAccessChain %14 %121 
					                                         f32 %123 = OpLoad %122 
					                                         f32 %124 = OpFMul %120 %123 
					                                Private f32* %125 = OpAccessChain %66 %50 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpFAdd %124 %126 
					                                Private f32* %128 = OpAccessChain %66 %50 
					                                                      OpStore %128 %127 
					                                Private f32* %129 = OpAccessChain %89 %50 
					                                         f32 %130 = OpLoad %129 
					                                Uniform f32* %132 = OpAccessChain %14 %131 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFMul %130 %133 
					                                Private f32* %135 = OpAccessChain %66 %50 
					                                         f32 %136 = OpLoad %135 
					                                         f32 %137 = OpFAdd %134 %136 
					                                Private f32* %138 = OpAccessChain %66 %50 
					                                                      OpStore %138 %137 
					                                       f32_3 %139 = OpLoad %26 
					                                       f32_4 %140 = OpVectorShuffle %139 %139 0 2 0 2 
					                                       f32_4 %141 = OpFMul %140 %70 
					                                       f32_4 %143 = OpFAdd %141 %142 
					                                                      OpStore %105 %143 
					                         read_only Texture2D %144 = OpLoad %77 
					                                     sampler %145 = OpLoad %81 
					                  read_only Texture2DSampled %146 = OpSampledImage %144 %145 
					                                       f32_4 %147 = OpLoad %105 
					                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
					                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
					                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
					                                       f32_3 %151 = OpLoad %89 
					                                       f32_3 %152 = OpVectorShuffle %151 %150 3 1 4 
					                                                      OpStore %89 %152 
					                         read_only Texture2D %154 = OpLoad %77 
					                                     sampler %155 = OpLoad %81 
					                  read_only Texture2DSampled %156 = OpSampledImage %154 %155 
					                                       f32_4 %157 = OpLoad %105 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 2 3 
					                                       f32_4 %159 = OpImageSampleImplicitLod %156 %158 
					                                       f32_2 %160 = OpVectorShuffle %159 %159 1 2 
					                                                      OpStore %153 %160 
					                                Private f32* %161 = OpAccessChain %89 %50 
					                                         f32 %162 = OpLoad %161 
					                                Uniform f32* %164 = OpAccessChain %14 %163 
					                                         f32 %165 = OpLoad %164 
					                                         f32 %166 = OpFMul %162 %165 
					                                Private f32* %167 = OpAccessChain %66 %50 
					                                         f32 %168 = OpLoad %167 
					                                         f32 %169 = OpFAdd %166 %168 
					                                Private f32* %170 = OpAccessChain %66 %50 
					                                                      OpStore %170 %169 
					                                Private f32* %171 = OpAccessChain %89 %63 
					                                         f32 %172 = OpLoad %171 
					                                Uniform f32* %174 = OpAccessChain %14 %173 
					                                         f32 %175 = OpLoad %174 
					                                         f32 %176 = OpFMul %172 %175 
					                                Private f32* %177 = OpAccessChain %66 %50 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpFAdd %176 %178 
					                                Private f32* %180 = OpAccessChain %66 %50 
					                                                      OpStore %180 %179 
					                                Private f32* %181 = OpAccessChain %89 %18 
					                                         f32 %182 = OpLoad %181 
					                                Uniform f32* %184 = OpAccessChain %14 %183 
					                                         f32 %185 = OpLoad %184 
					                                         f32 %186 = OpFMul %182 %185 
					                                Private f32* %187 = OpAccessChain %66 %50 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpFAdd %186 %188 
					                                Private f32* %190 = OpAccessChain %66 %50 
					                                                      OpStore %190 %189 
					                                Private f32* %191 = OpAccessChain %153 %50 
					                                         f32 %192 = OpLoad %191 
					                                Uniform f32* %194 = OpAccessChain %14 %193 
					                                         f32 %195 = OpLoad %194 
					                                         f32 %196 = OpFMul %192 %195 
					                                Private f32* %197 = OpAccessChain %66 %50 
					                                         f32 %198 = OpLoad %197 
					                                         f32 %199 = OpFAdd %196 %198 
					                                Private f32* %200 = OpAccessChain %66 %50 
					                                                      OpStore %200 %199 
					                                       f32_3 %202 = OpLoad %26 
					                                       f32_4 %203 = OpVectorShuffle %202 %202 0 2 0 2 
					                                       f32_4 %204 = OpFMul %203 %70 
					                                       f32_4 %207 = OpFAdd %204 %206 
					                                                      OpStore %201 %207 
					                                       f32_3 %208 = OpLoad %26 
					                                       f32_2 %209 = OpVectorShuffle %208 %208 0 2 
					                                       f32_2 %210 = OpFMul %209 %108 
					                                       f32_2 %212 = OpFAdd %210 %211 
					                                                      OpStore %43 %212 
					                         read_only Texture2D %213 = OpLoad %77 
					                                     sampler %214 = OpLoad %81 
					                  read_only Texture2DSampled %215 = OpSampledImage %213 %214 
					                                       f32_2 %216 = OpLoad %43 
					                                       f32_4 %217 = OpImageSampleImplicitLod %215 %216 
					                                         f32 %218 = OpCompositeExtract %217 2 
					                                Private f32* %219 = OpAccessChain %89 %50 
					                                                      OpStore %219 %218 
					                         read_only Texture2D %221 = OpLoad %77 
					                                     sampler %222 = OpLoad %81 
					                  read_only Texture2DSampled %223 = OpSampledImage %221 %222 
					                                       f32_4 %224 = OpLoad %201 
					                                       f32_2 %225 = OpVectorShuffle %224 %224 0 1 
					                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
					                                       f32_2 %227 = OpVectorShuffle %226 %226 1 2 
					                                                      OpStore %220 %227 
					                         read_only Texture2D %229 = OpLoad %77 
					                                     sampler %230 = OpLoad %81 
					                  read_only Texture2DSampled %231 = OpSampledImage %229 %230 
					                                       f32_4 %232 = OpLoad %201 
					                                       f32_2 %233 = OpVectorShuffle %232 %232 2 3 
					                                       f32_4 %234 = OpImageSampleImplicitLod %231 %233 
					                                         f32 %235 = OpCompositeExtract %234 2 
					                                                      OpStore %228 %235 
					                                Private f32* %236 = OpAccessChain %220 %50 
					                                         f32 %237 = OpLoad %236 
					                                Uniform f32* %239 = OpAccessChain %14 %238 
					                                         f32 %240 = OpLoad %239 
					                                         f32 %241 = OpFMul %237 %240 
					                                Private f32* %242 = OpAccessChain %66 %50 
					                                         f32 %243 = OpLoad %242 
					                                         f32 %244 = OpFAdd %241 %243 
					                                Private f32* %245 = OpAccessChain %66 %50 
					                                                      OpStore %245 %244 
					                                Private f32* %246 = OpAccessChain %220 %18 
					                                         f32 %247 = OpLoad %246 
					                                Uniform f32* %249 = OpAccessChain %14 %248 
					                                         f32 %250 = OpLoad %249 
					                                         f32 %251 = OpFMul %247 %250 
					                                Private f32* %252 = OpAccessChain %66 %50 
					                                         f32 %253 = OpLoad %252 
					                                         f32 %254 = OpFAdd %251 %253 
					                                Private f32* %255 = OpAccessChain %66 %50 
					                                                      OpStore %255 %254 
					                                Private f32* %256 = OpAccessChain %153 %18 
					                                         f32 %257 = OpLoad %256 
					                                Uniform f32* %259 = OpAccessChain %14 %258 
					                                         f32 %260 = OpLoad %259 
					                                         f32 %261 = OpFMul %257 %260 
					                                Private f32* %262 = OpAccessChain %66 %50 
					                                         f32 %263 = OpLoad %262 
					                                         f32 %264 = OpFAdd %261 %263 
					                                Private f32* %265 = OpAccessChain %66 %50 
					                                                      OpStore %265 %264 
					                                         f32 %266 = OpLoad %228 
					                                Uniform f32* %268 = OpAccessChain %14 %267 
					                                         f32 %269 = OpLoad %268 
					                                         f32 %270 = OpFMul %266 %269 
					                                Private f32* %271 = OpAccessChain %66 %50 
					                                         f32 %272 = OpLoad %271 
					                                         f32 %273 = OpFAdd %270 %272 
					                                Private f32* %274 = OpAccessChain %66 %50 
					                                                      OpStore %274 %273 
					                                Private f32* %275 = OpAccessChain %89 %50 
					                                         f32 %276 = OpLoad %275 
					                                Uniform f32* %278 = OpAccessChain %14 %277 
					                                         f32 %279 = OpLoad %278 
					                                         f32 %280 = OpFMul %276 %279 
					                                Private f32* %281 = OpAccessChain %66 %50 
					                                         f32 %282 = OpLoad %281 
					                                         f32 %283 = OpFAdd %280 %282 
					                                Private f32* %284 = OpAccessChain %66 %50 
					                                                      OpStore %284 %283 
					                                       f32_4 %285 = OpLoad %66 
					                                       f32_2 %286 = OpVectorShuffle %285 %285 0 0 
					                                       f32_2 %289 = OpFMul %286 %288 
					                                       f32_3 %290 = OpLoad %26 
					                                       f32_2 %291 = OpVectorShuffle %290 %290 0 1 
					                                       f32_2 %292 = OpFAdd %289 %291 
					                                                      OpStore %43 %292 
					                         read_only Texture2D %294 = OpLoad %293 
					                                     sampler %296 = OpLoad %295 
					                  read_only Texture2DSampled %297 = OpSampledImage %294 %296 
					                                       f32_2 %298 = OpLoad %43 
					                                       f32_4 %299 = OpImageSampleImplicitLod %297 %298 
					                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
					                                                      OpStore %89 %300 
					                                       f32_4 %303 = OpLoad %66 
					                                       f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
					                                       f32_3 %305 = OpLoad %89 
					                                       f32_3 %306 = OpFAdd %304 %305 
					                                       f32_4 %307 = OpLoad %302 
					                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 6 3 
					                                                      OpStore %302 %308 
					                                 Output f32* %311 = OpAccessChain %302 %309 
					                                                      OpStore %311 %48 
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
						float _Bullet_1;
						float _Bullet_2;
						float _Bullet_3;
						float _Bullet_4;
						float _Bullet_5;
						float _Bullet_6;
						float _Bullet_7;
						float _Bullet_8;
						float _Bullet_9;
						float _Bullet_10;
						float _Bullet_11;
						float _Bullet_12;
						vec4 unused_0_13;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					vec2 u_xlat6;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.x = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb0) ? u_xlat6.x : u_xlat1.y;
					    u_xlat0 = u_xlat1.xzxz * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.0, 0.5, 0.5);
					    u_xlat10_2 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex2, u_xlat0.zw);
					    u_xlat12 = u_xlat10_2.x * _Bullet_2;
					    u_xlat2.xy = u_xlat1.xz * vec2(0.5, 0.5);
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat12 = u_xlat10_2.x * _Bullet_1 + u_xlat12;
					    u_xlat0.x = u_xlat10_0.x * _Bullet_3 + u_xlat12;
					    u_xlat2 = u_xlat1.xzxz * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.0, 0.5, 0.5, 1.0);
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.zw);
					    u_xlat0.x = u_xlat10_3.x * _Bullet_4 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.y * _Bullet_5 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_0.y * _Bullet_6 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.y * _Bullet_7 + u_xlat0.x;
					    u_xlat3 = u_xlat1.xzxz * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.0, 1.0, 0.5, 1.5);
					    u_xlat6.xy = u_xlat1.xz * vec2(0.5, 0.5) + vec2(0.0, 1.5);
					    u_xlat10_4 = texture(_MainTex2, u_xlat6.xy);
					    u_xlat10_5 = texture(_MainTex2, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex2, u_xlat3.zw);
					    u_xlat0.x = u_xlat10_5.y * _Bullet_8 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_5.z * _Bullet_9 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.z * _Bullet_10 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.z * _Bullet_11 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_4.z * _Bullet_12 + u_xlat0.x;
					    u_xlat6.xy = u_xlat0.xx * vec2(0.25, 0.25) + u_xlat1.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat10_1.xyz;
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