Shader "CameraFilterPack/CameraFilterPack_Broken_Simple" {
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
			GpuProgramID 57046
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
					uniform 	float Broke1;
					uniform 	float Broke2;
					uniform 	float PosX;
					uniform 	float PosY;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb1;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(PosX, PosY));
					    u_xlat4 = u_xlat0.y + u_xlat0.x;
					    u_xlat6 = u_xlat0.x * 0.5;
					    u_xlat4 = u_xlat4 / u_xlat6;
					    u_xlatb1 = u_xlat4>=(-u_xlat4);
					    u_xlat4 = fract(abs(u_xlat4));
					    u_xlat4 = (u_xlatb1) ? u_xlat4 : (-u_xlat4);
					    u_xlat4 = u_xlat6 * u_xlat4;
					    u_xlat4 = (-u_xlat4) * Broke2 + Broke1;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + vec2(PosX, PosY);
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
					; Bound: 104
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %90 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 11 
					                                              OpMemberDecorate %13 0 Offset 13 
					                                              OpMemberDecorate %13 1 Offset 13 
					                                              OpMemberDecorate %13 2 Offset 13 
					                                              OpMemberDecorate %13 3 Offset 13 
					                                              OpDecorate %13 Block 
					                                              OpDecorate %15 DescriptorSet 15 
					                                              OpDecorate %15 Binding 15 
					                                              OpDecorate %90 Location 90 
					                                              OpDecorate %93 RelaxedPrecision 
					                                              OpDecorate %93 DescriptorSet 93 
					                                              OpDecorate %93 Binding 93 
					                                              OpDecorate %94 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %97 DescriptorSet 97 
					                                              OpDecorate %97 Binding 97 
					                                              OpDecorate %98 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeStruct %6 %6 %6 %6 
					                                      %14 = OpTypePointer Uniform %13 
					Uniform struct {f32; f32; f32; f32;}* %15 = OpVariable Uniform 
					                                      %16 = OpTypeInt 32 1 
					                                  i32 %17 = OpConstant 2 
					                                      %18 = OpTypePointer Uniform %6 
					                                  i32 %21 = OpConstant 3 
					                                      %27 = OpTypePointer Private %6 
					                         Private f32* %28 = OpVariable Private 
					                                      %29 = OpTypeInt 32 0 
					                                  u32 %30 = OpConstant 1 
					                                  u32 %33 = OpConstant 0 
					                         Private f32* %37 = OpVariable Private 
					                                  f32 %40 = OpConstant 3,674022E-40 
					                                      %45 = OpTypeBool 
					                                      %46 = OpTypePointer Private %45 
					                        Private bool* %47 = OpVariable Private 
					                                      %56 = OpTypePointer Function %6 
					                                  i32 %70 = OpConstant 1 
					                                  i32 %74 = OpConstant 0 
					                                      %88 = OpTypeVector %6 4 
					                                      %89 = OpTypePointer Output %88 
					                        Output f32_4* %90 = OpVariable Output 
					                                      %91 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %92 = OpTypePointer UniformConstant %91 
					 UniformConstant read_only Texture2D* %93 = OpVariable UniformConstant 
					                                      %95 = OpTypeSampler 
					                                      %96 = OpTypePointer UniformConstant %95 
					             UniformConstant sampler* %97 = OpVariable UniformConstant 
					                                      %99 = OpTypeSampledImage %91 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function f32* %57 = OpVariable Function 
					                                f32_2 %12 = OpLoad vs_TEXCOORD0 
					                         Uniform f32* %19 = OpAccessChain %15 %17 
					                                  f32 %20 = OpLoad %19 
					                         Uniform f32* %22 = OpAccessChain %15 %21 
					                                  f32 %23 = OpLoad %22 
					                                f32_2 %24 = OpCompositeConstruct %20 %23 
					                                f32_2 %25 = OpFNegate %24 
					                                f32_2 %26 = OpFAdd %12 %25 
					                                              OpStore %9 %26 
					                         Private f32* %31 = OpAccessChain %9 %30 
					                                  f32 %32 = OpLoad %31 
					                         Private f32* %34 = OpAccessChain %9 %33 
					                                  f32 %35 = OpLoad %34 
					                                  f32 %36 = OpFAdd %32 %35 
					                                              OpStore %28 %36 
					                         Private f32* %38 = OpAccessChain %9 %33 
					                                  f32 %39 = OpLoad %38 
					                                  f32 %41 = OpFMul %39 %40 
					                                              OpStore %37 %41 
					                                  f32 %42 = OpLoad %28 
					                                  f32 %43 = OpLoad %37 
					                                  f32 %44 = OpFDiv %42 %43 
					                                              OpStore %28 %44 
					                                  f32 %48 = OpLoad %28 
					                                  f32 %49 = OpLoad %28 
					                                  f32 %50 = OpFNegate %49 
					                                 bool %51 = OpFOrdGreaterThanEqual %48 %50 
					                                              OpStore %47 %51 
					                                  f32 %52 = OpLoad %28 
					                                  f32 %53 = OpExtInst %1 4 %52 
					                                  f32 %54 = OpExtInst %1 10 %53 
					                                              OpStore %28 %54 
					                                 bool %55 = OpLoad %47 
					                                              OpSelectionMerge %59 None 
					                                              OpBranchConditional %55 %58 %61 
					                                      %58 = OpLabel 
					                                  f32 %60 = OpLoad %28 
					                                              OpStore %57 %60 
					                                              OpBranch %59 
					                                      %61 = OpLabel 
					                                  f32 %62 = OpLoad %28 
					                                  f32 %63 = OpFNegate %62 
					                                              OpStore %57 %63 
					                                              OpBranch %59 
					                                      %59 = OpLabel 
					                                  f32 %64 = OpLoad %57 
					                                              OpStore %28 %64 
					                                  f32 %65 = OpLoad %37 
					                                  f32 %66 = OpLoad %28 
					                                  f32 %67 = OpFMul %65 %66 
					                                              OpStore %28 %67 
					                                  f32 %68 = OpLoad %28 
					                                  f32 %69 = OpFNegate %68 
					                         Uniform f32* %71 = OpAccessChain %15 %70 
					                                  f32 %72 = OpLoad %71 
					                                  f32 %73 = OpFMul %69 %72 
					                         Uniform f32* %75 = OpAccessChain %15 %74 
					                                  f32 %76 = OpLoad %75 
					                                  f32 %77 = OpFAdd %73 %76 
					                                              OpStore %28 %77 
					                                f32_2 %78 = OpLoad %9 
					                                  f32 %79 = OpLoad %28 
					                                f32_2 %80 = OpCompositeConstruct %79 %79 
					                                f32_2 %81 = OpFMul %78 %80 
					                         Uniform f32* %82 = OpAccessChain %15 %17 
					                                  f32 %83 = OpLoad %82 
					                         Uniform f32* %84 = OpAccessChain %15 %21 
					                                  f32 %85 = OpLoad %84 
					                                f32_2 %86 = OpCompositeConstruct %83 %85 
					                                f32_2 %87 = OpFAdd %81 %86 
					                                              OpStore %9 %87 
					                  read_only Texture2D %94 = OpLoad %93 
					                              sampler %98 = OpLoad %97 
					          read_only Texture2DSampled %100 = OpSampledImage %94 %98 
					                               f32_2 %101 = OpLoad %9 
					                               f32_4 %102 = OpImageSampleImplicitLod %100 %101 
					                                              OpStore %90 %102 
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
						float Broke1;
						float Broke2;
						float PosX;
						float PosY;
						vec4 unused_0_5[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb1;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(PosX, PosY));
					    u_xlat4 = u_xlat0.y + u_xlat0.x;
					    u_xlat6 = u_xlat0.x * 0.5;
					    u_xlat4 = u_xlat4 / u_xlat6;
					    u_xlatb1 = u_xlat4>=(-u_xlat4);
					    u_xlat4 = fract(abs(u_xlat4));
					    u_xlat4 = (u_xlatb1) ? u_xlat4 : (-u_xlat4);
					    u_xlat4 = u_xlat6 * u_xlat4;
					    u_xlat4 = (-u_xlat4) * Broke2 + Broke1;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + vec2(PosX, PosY);
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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