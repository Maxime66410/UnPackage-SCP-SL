Shader "CameraFilterPack/Glow_Glow_Color" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Blurred (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Amount ("_Amount", Range(0, 20)) = 5
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 4269
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
					uniform 	vec4 _ScreenParams;
					uniform 	float _Amount;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec2 u_xlat7;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.y = _Amount / _ScreenParams.x;
					    u_xlat1.x = 0.0;
					    u_xlat7.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat7.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_0.xyz = u_xlat10_2.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
					; Bound: 90
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %78 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate %9 RelaxedPrecision 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate %13 RelaxedPrecision 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %17 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 22 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpMemberDecorate %29 0 Offset 29 
					                                             OpMemberDecorate %29 1 Offset 29 
					                                             OpDecorate %29 Block 
					                                             OpDecorate %31 DescriptorSet 31 
					                                             OpDecorate %31 Binding 31 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %78 Location 78 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                     %14 = OpTypeSampler 
					                                     %15 = OpTypePointer UniformConstant %14 
					            UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                     %18 = OpTypeSampledImage %10 
					                                     %20 = OpTypeVector %6 2 
					                                     %21 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %24 = OpTypeVector %6 4 
					                                     %27 = OpTypePointer Private %20 
					                      Private f32_2* %28 = OpVariable Private 
					                                     %29 = OpTypeStruct %24 %6 
					                                     %30 = OpTypePointer Uniform %29 
					       Uniform struct {f32_4; f32;}* %31 = OpVariable Uniform 
					                                     %32 = OpTypeInt 32 1 
					                                 i32 %33 = OpConstant 1 
					                                     %34 = OpTypePointer Uniform %6 
					                                 i32 %37 = OpConstant 0 
					                                     %38 = OpTypeInt 32 0 
					                                 u32 %39 = OpConstant 0 
					                                 u32 %43 = OpConstant 1 
					                                     %44 = OpTypePointer Private %6 
					                                 f32 %46 = OpConstant 3,674022E-40 
					                      Private f32_2* %48 = OpVariable Private 
					                      Private f32_3* %56 = OpVariable Private 
					                      Private f32_3* %63 = OpVariable Private 
					                      Private f32_3* %70 = OpVariable Private 
					                                     %77 = OpTypePointer Output %24 
					                       Output f32_4* %78 = OpVariable Output 
					                                 f32 %80 = OpConstant 3,674022E-40 
					                               f32_3 %81 = OpConstantComposite %80 %80 %80 
					                                 f32 %85 = OpConstant 3,674022E-40 
					                                 u32 %86 = OpConstant 3 
					                                     %87 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD0 
					                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                             OpStore %9 %26 
					                        Uniform f32* %35 = OpAccessChain %31 %33 
					                                 f32 %36 = OpLoad %35 
					                        Uniform f32* %40 = OpAccessChain %31 %37 %39 
					                                 f32 %41 = OpLoad %40 
					                                 f32 %42 = OpFDiv %36 %41 
					                        Private f32* %45 = OpAccessChain %28 %43 
					                                             OpStore %45 %42 
					                        Private f32* %47 = OpAccessChain %28 %39 
					                                             OpStore %47 %46 
					                               f32_2 %49 = OpLoad %28 
					                               f32_2 %50 = OpFNegate %49 
					                               f32_2 %51 = OpLoad vs_TEXCOORD0 
					                               f32_2 %52 = OpFAdd %50 %51 
					                                             OpStore %48 %52 
					                               f32_2 %53 = OpLoad %28 
					                               f32_2 %54 = OpLoad vs_TEXCOORD0 
					                               f32_2 %55 = OpFAdd %53 %54 
					                                             OpStore %28 %55 
					                 read_only Texture2D %57 = OpLoad %12 
					                             sampler %58 = OpLoad %16 
					          read_only Texture2DSampled %59 = OpSampledImage %57 %58 
					                               f32_2 %60 = OpLoad %28 
					                               f32_4 %61 = OpImageSampleImplicitLod %59 %60 
					                               f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
					                                             OpStore %56 %62 
					                 read_only Texture2D %64 = OpLoad %12 
					                             sampler %65 = OpLoad %16 
					          read_only Texture2DSampled %66 = OpSampledImage %64 %65 
					                               f32_2 %67 = OpLoad %48 
					                               f32_4 %68 = OpImageSampleImplicitLod %66 %67 
					                               f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
					                                             OpStore %63 %69 
					                               f32_3 %71 = OpLoad %9 
					                               f32_3 %72 = OpLoad %63 
					                               f32_3 %73 = OpFAdd %71 %72 
					                                             OpStore %70 %73 
					                               f32_3 %74 = OpLoad %56 
					                               f32_3 %75 = OpLoad %70 
					                               f32_3 %76 = OpFAdd %74 %75 
					                                             OpStore %70 %76 
					                               f32_3 %79 = OpLoad %70 
					                               f32_3 %82 = OpFMul %79 %81 
					                               f32_4 %83 = OpLoad %78 
					                               f32_4 %84 = OpVectorShuffle %83 %82 4 5 6 3 
					                                             OpStore %78 %84 
					                         Output f32* %88 = OpAccessChain %78 %86 
					                                             OpStore %88 %85 
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
						float _Amount;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec2 u_xlat7;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.y = _Amount / _ScreenParams.x;
					    u_xlat1.x = 0.0;
					    u_xlat7.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat7.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_0.xyz = u_xlat10_2.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 70102
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
					uniform 	float _Value2;
					uniform 	vec4 _GlowColor;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex2, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0.x * _Value2;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = vec3(u_xlat0) * _GlowColor.xyz + u_xlat10_1.xyz;
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
					; Bound: 69
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %21 %51 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate %8 RelaxedPrecision 
					                                             OpDecorate %11 RelaxedPrecision 
					                                             OpDecorate %11 DescriptorSet 11 
					                                             OpDecorate %11 Binding 11 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %15 RelaxedPrecision 
					                                             OpDecorate %15 DescriptorSet 15 
					                                             OpDecorate %15 Binding 15 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 21 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpMemberDecorate %30 0 Offset 30 
					                                             OpMemberDecorate %30 1 Offset 30 
					                                             OpDecorate %30 Block 
					                                             OpDecorate %32 DescriptorSet 32 
					                                             OpDecorate %32 Binding 32 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %42 DescriptorSet 42 
					                                             OpDecorate %42 Binding 42 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %44 DescriptorSet 44 
					                                             OpDecorate %44 Binding 44 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %51 Location 51 
					                                             OpDecorate %60 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypePointer Private %6 
					                         Private f32* %8 = OpVariable Private 
					                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %10 = OpTypePointer UniformConstant %9 
					UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
					                                     %13 = OpTypeSampler 
					                                     %14 = OpTypePointer UniformConstant %13 
					            UniformConstant sampler* %15 = OpVariable UniformConstant 
					                                     %17 = OpTypeSampledImage %9 
					                                     %19 = OpTypeVector %6 2 
					                                     %20 = OpTypePointer Input %19 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %23 = OpTypeVector %6 4 
					                                     %25 = OpTypeInt 32 0 
					                                 u32 %26 = OpConstant 0 
					                        Private f32* %28 = OpVariable Private 
					                                     %30 = OpTypeStruct %6 %23 
					                                     %31 = OpTypePointer Uniform %30 
					       Uniform struct {f32; f32_4;}* %32 = OpVariable Uniform 
					                                     %33 = OpTypeInt 32 1 
					                                 i32 %34 = OpConstant 0 
					                                     %35 = OpTypePointer Uniform %6 
					                                     %39 = OpTypeVector %6 3 
					                                     %40 = OpTypePointer Private %39 
					                      Private f32_3* %41 = OpVariable Private 
					UniformConstant read_only Texture2D* %42 = OpVariable UniformConstant 
					            UniformConstant sampler* %44 = OpVariable UniformConstant 
					                                     %50 = OpTypePointer Output %23 
					                       Output f32_4* %51 = OpVariable Output 
					                                 i32 %54 = OpConstant 1 
					                                     %55 = OpTypePointer Uniform %23 
					                                 f32 %64 = OpConstant 3,674022E-40 
					                                 u32 %65 = OpConstant 3 
					                                     %66 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %12 = OpLoad %11 
					                             sampler %16 = OpLoad %15 
					          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                               f32_2 %22 = OpLoad vs_TEXCOORD0 
					                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
					                                 f32 %27 = OpCompositeExtract %24 0 
					                                             OpStore %8 %27 
					                                 f32 %29 = OpLoad %8 
					                        Uniform f32* %36 = OpAccessChain %32 %34 
					                                 f32 %37 = OpLoad %36 
					                                 f32 %38 = OpFMul %29 %37 
					                                             OpStore %28 %38 
					                 read_only Texture2D %43 = OpLoad %42 
					                             sampler %45 = OpLoad %44 
					          read_only Texture2DSampled %46 = OpSampledImage %43 %45 
					                               f32_2 %47 = OpLoad vs_TEXCOORD0 
					                               f32_4 %48 = OpImageSampleImplicitLod %46 %47 
					                               f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
					                                             OpStore %41 %49 
					                                 f32 %52 = OpLoad %28 
					                               f32_3 %53 = OpCompositeConstruct %52 %52 %52 
					                      Uniform f32_4* %56 = OpAccessChain %32 %54 
					                               f32_4 %57 = OpLoad %56 
					                               f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
					                               f32_3 %59 = OpFMul %53 %58 
					                               f32_3 %60 = OpLoad %41 
					                               f32_3 %61 = OpFAdd %59 %60 
					                               f32_4 %62 = OpLoad %51 
					                               f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
					                                             OpStore %51 %63 
					                         Output f32* %67 = OpAccessChain %51 %65 
					                                             OpStore %67 %64 
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
						float _Value2;
						vec4 unused_0_2;
						vec4 _GlowColor;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex2, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0.x * _Value2;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = vec3(u_xlat0) * _GlowColor.xyz + u_xlat10_1.xyz;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 159858
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
					uniform 	vec4 _ScreenParams;
					uniform 	float _Amount;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec2 u_xlat7;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.x = _Amount / _ScreenParams.x;
					    u_xlat1.y = 0.0;
					    u_xlat7.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat7.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_0.xyz = u_xlat10_2.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
					; Bound: 90
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %78 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate %9 RelaxedPrecision 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate %13 RelaxedPrecision 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %17 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 22 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpMemberDecorate %29 0 Offset 29 
					                                             OpMemberDecorate %29 1 Offset 29 
					                                             OpDecorate %29 Block 
					                                             OpDecorate %31 DescriptorSet 31 
					                                             OpDecorate %31 Binding 31 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %78 Location 78 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                     %14 = OpTypeSampler 
					                                     %15 = OpTypePointer UniformConstant %14 
					            UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                     %18 = OpTypeSampledImage %10 
					                                     %20 = OpTypeVector %6 2 
					                                     %21 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %24 = OpTypeVector %6 4 
					                                     %27 = OpTypePointer Private %20 
					                      Private f32_2* %28 = OpVariable Private 
					                                     %29 = OpTypeStruct %24 %6 
					                                     %30 = OpTypePointer Uniform %29 
					       Uniform struct {f32_4; f32;}* %31 = OpVariable Uniform 
					                                     %32 = OpTypeInt 32 1 
					                                 i32 %33 = OpConstant 1 
					                                     %34 = OpTypePointer Uniform %6 
					                                 i32 %37 = OpConstant 0 
					                                     %38 = OpTypeInt 32 0 
					                                 u32 %39 = OpConstant 0 
					                                     %43 = OpTypePointer Private %6 
					                                 f32 %45 = OpConstant 3,674022E-40 
					                                 u32 %46 = OpConstant 1 
					                      Private f32_2* %48 = OpVariable Private 
					                      Private f32_3* %56 = OpVariable Private 
					                      Private f32_3* %63 = OpVariable Private 
					                      Private f32_3* %70 = OpVariable Private 
					                                     %77 = OpTypePointer Output %24 
					                       Output f32_4* %78 = OpVariable Output 
					                                 f32 %80 = OpConstant 3,674022E-40 
					                               f32_3 %81 = OpConstantComposite %80 %80 %80 
					                                 f32 %85 = OpConstant 3,674022E-40 
					                                 u32 %86 = OpConstant 3 
					                                     %87 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD0 
					                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                             OpStore %9 %26 
					                        Uniform f32* %35 = OpAccessChain %31 %33 
					                                 f32 %36 = OpLoad %35 
					                        Uniform f32* %40 = OpAccessChain %31 %37 %39 
					                                 f32 %41 = OpLoad %40 
					                                 f32 %42 = OpFDiv %36 %41 
					                        Private f32* %44 = OpAccessChain %28 %39 
					                                             OpStore %44 %42 
					                        Private f32* %47 = OpAccessChain %28 %46 
					                                             OpStore %47 %45 
					                               f32_2 %49 = OpLoad %28 
					                               f32_2 %50 = OpFNegate %49 
					                               f32_2 %51 = OpLoad vs_TEXCOORD0 
					                               f32_2 %52 = OpFAdd %50 %51 
					                                             OpStore %48 %52 
					                               f32_2 %53 = OpLoad %28 
					                               f32_2 %54 = OpLoad vs_TEXCOORD0 
					                               f32_2 %55 = OpFAdd %53 %54 
					                                             OpStore %28 %55 
					                 read_only Texture2D %57 = OpLoad %12 
					                             sampler %58 = OpLoad %16 
					          read_only Texture2DSampled %59 = OpSampledImage %57 %58 
					                               f32_2 %60 = OpLoad %28 
					                               f32_4 %61 = OpImageSampleImplicitLod %59 %60 
					                               f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
					                                             OpStore %56 %62 
					                 read_only Texture2D %64 = OpLoad %12 
					                             sampler %65 = OpLoad %16 
					          read_only Texture2DSampled %66 = OpSampledImage %64 %65 
					                               f32_2 %67 = OpLoad %48 
					                               f32_4 %68 = OpImageSampleImplicitLod %66 %67 
					                               f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
					                                             OpStore %63 %69 
					                               f32_3 %71 = OpLoad %9 
					                               f32_3 %72 = OpLoad %63 
					                               f32_3 %73 = OpFAdd %71 %72 
					                                             OpStore %70 %73 
					                               f32_3 %74 = OpLoad %56 
					                               f32_3 %75 = OpLoad %70 
					                               f32_3 %76 = OpFAdd %74 %75 
					                                             OpStore %70 %76 
					                               f32_3 %79 = OpLoad %70 
					                               f32_3 %82 = OpFMul %79 %81 
					                               f32_4 %83 = OpLoad %78 
					                               f32_4 %84 = OpVectorShuffle %83 %82 4 5 6 3 
					                                             OpStore %78 %84 
					                         Output f32* %88 = OpAccessChain %78 %86 
					                                             OpStore %88 %85 
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
						float _Amount;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec2 u_xlat7;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.x = _Amount / _ScreenParams.x;
					    u_xlat1.y = 0.0;
					    u_xlat7.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat7.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_0.xyz = u_xlat10_2.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 229104
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
					uniform 	vec4 _ScreenParams;
					uniform 	float _Amount;
					uniform 	float _Value1;
					uniform 	float _Value3;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					void main()
					{
					    u_xlat0.x = _Amount / _ScreenParams.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat0.x = u_xlat16_0 + (-_Value1);
					    u_xlat1 = float(1.0) / _Value3;
					    u_xlat0.x = u_xlat1 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(u_xlat1);
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
					; Bound: 104
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %33 %92 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpMemberDecorate %11 0 Offset 11 
					                                                OpMemberDecorate %11 1 Offset 11 
					                                                OpMemberDecorate %11 2 Offset 11 
					                                                OpMemberDecorate %11 3 Offset 11 
					                                                OpDecorate %11 Block 
					                                                OpDecorate %13 DescriptorSet 13 
					                                                OpDecorate %13 Binding 13 
					                                                OpDecorate vs_TEXCOORD0 Location 33 
					                                                OpDecorate %38 RelaxedPrecision 
					                                                OpDecorate %41 RelaxedPrecision 
					                                                OpDecorate %41 DescriptorSet 41 
					                                                OpDecorate %41 Binding 41 
					                                                OpDecorate %42 RelaxedPrecision 
					                                                OpDecorate %45 RelaxedPrecision 
					                                                OpDecorate %45 DescriptorSet 45 
					                                                OpDecorate %45 Binding 45 
					                                                OpDecorate %46 RelaxedPrecision 
					                                                OpDecorate %51 RelaxedPrecision 
					                                                OpDecorate %52 RelaxedPrecision 
					                                                OpDecorate %53 RelaxedPrecision 
					                                                OpDecorate %56 RelaxedPrecision 
					                                                OpDecorate %57 RelaxedPrecision 
					                                                OpDecorate %92 Location 92 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 2 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_2* %9 = OpVariable Private 
					                                        %10 = OpTypeVector %6 4 
					                                        %11 = OpTypeStruct %10 %6 %6 %6 
					                                        %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32; f32; f32;}* %13 = OpVariable Uniform 
					                                        %14 = OpTypeInt 32 1 
					                                    i32 %15 = OpConstant 1 
					                                        %16 = OpTypePointer Uniform %6 
					                                    i32 %19 = OpConstant 0 
					                                        %20 = OpTypeInt 32 0 
					                                    u32 %21 = OpConstant 0 
					                                        %25 = OpTypePointer Private %6 
					                                    f32 %27 = OpConstant 3,674022E-40 
					                                    u32 %28 = OpConstant 1 
					                                        %32 = OpTypePointer Input %7 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                        %36 = OpTypeVector %6 3 
					                                        %37 = OpTypePointer Private %36 
					                         Private f32_3* %38 = OpVariable Private 
					                                        %39 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %40 = OpTypePointer UniformConstant %39 
					   UniformConstant read_only Texture2D* %41 = OpVariable UniformConstant 
					                                        %43 = OpTypeSampler 
					                                        %44 = OpTypePointer UniformConstant %43 
					               UniformConstant sampler* %45 = OpVariable UniformConstant 
					                                        %47 = OpTypeSampledImage %39 
					                           Private f32* %52 = OpVariable Private 
					                                    f32 %54 = OpConstant 3,674022E-40 
					                                  f32_3 %55 = OpConstantComposite %54 %54 %54 
					                                    i32 %58 = OpConstant 2 
					                           Private f32* %64 = OpVariable Private 
					                                    f32 %65 = OpConstant 3,674022E-40 
					                                    i32 %66 = OpConstant 3 
					                                    f32 %81 = OpConstant 3,674022E-40 
					                                    f32 %83 = OpConstant 3,674022E-40 
					                                        %91 = OpTypePointer Output %10 
					                          Output f32_4* %92 = OpVariable Output 
					                                   u32 %100 = OpConstant 3 
					                                       %101 = OpTypePointer Output %6 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                           Uniform f32* %17 = OpAccessChain %13 %15 
					                                    f32 %18 = OpLoad %17 
					                           Uniform f32* %22 = OpAccessChain %13 %19 %21 
					                                    f32 %23 = OpLoad %22 
					                                    f32 %24 = OpFDiv %18 %23 
					                           Private f32* %26 = OpAccessChain %9 %21 
					                                                OpStore %26 %24 
					                           Private f32* %29 = OpAccessChain %9 %28 
					                                                OpStore %29 %27 
					                                  f32_2 %30 = OpLoad %9 
					                                  f32_2 %31 = OpFNegate %30 
					                                  f32_2 %34 = OpLoad vs_TEXCOORD0 
					                                  f32_2 %35 = OpFAdd %31 %34 
					                                                OpStore %9 %35 
					                    read_only Texture2D %42 = OpLoad %41 
					                                sampler %46 = OpLoad %45 
					             read_only Texture2DSampled %48 = OpSampledImage %42 %46 
					                                  f32_2 %49 = OpLoad %9 
					                                  f32_4 %50 = OpImageSampleImplicitLod %48 %49 
					                                  f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
					                                                OpStore %38 %51 
					                                  f32_3 %53 = OpLoad %38 
					                                    f32 %56 = OpDot %53 %55 
					                                                OpStore %52 %56 
					                                    f32 %57 = OpLoad %52 
					                           Uniform f32* %59 = OpAccessChain %13 %58 
					                                    f32 %60 = OpLoad %59 
					                                    f32 %61 = OpFNegate %60 
					                                    f32 %62 = OpFAdd %57 %61 
					                           Private f32* %63 = OpAccessChain %9 %21 
					                                                OpStore %63 %62 
					                           Uniform f32* %67 = OpAccessChain %13 %66 
					                                    f32 %68 = OpLoad %67 
					                                    f32 %69 = OpFDiv %65 %68 
					                                                OpStore %64 %69 
					                                    f32 %70 = OpLoad %64 
					                           Private f32* %71 = OpAccessChain %9 %21 
					                                    f32 %72 = OpLoad %71 
					                                    f32 %73 = OpFMul %70 %72 
					                           Private f32* %74 = OpAccessChain %9 %21 
					                                                OpStore %74 %73 
					                           Private f32* %75 = OpAccessChain %9 %21 
					                                    f32 %76 = OpLoad %75 
					                                    f32 %77 = OpExtInst %1 43 %76 %27 %65 
					                           Private f32* %78 = OpAccessChain %9 %21 
					                                                OpStore %78 %77 
					                           Private f32* %79 = OpAccessChain %9 %21 
					                                    f32 %80 = OpLoad %79 
					                                    f32 %82 = OpFMul %80 %81 
					                                    f32 %84 = OpFAdd %82 %83 
					                                                OpStore %64 %84 
					                           Private f32* %85 = OpAccessChain %9 %21 
					                                    f32 %86 = OpLoad %85 
					                           Private f32* %87 = OpAccessChain %9 %21 
					                                    f32 %88 = OpLoad %87 
					                                    f32 %89 = OpFMul %86 %88 
					                           Private f32* %90 = OpAccessChain %9 %21 
					                                                OpStore %90 %89 
					                                  f32_2 %93 = OpLoad %9 
					                                  f32_3 %94 = OpVectorShuffle %93 %93 0 0 0 
					                                    f32 %95 = OpLoad %64 
					                                  f32_3 %96 = OpCompositeConstruct %95 %95 %95 
					                                  f32_3 %97 = OpFMul %94 %96 
					                                  f32_4 %98 = OpLoad %92 
					                                  f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
					                                                OpStore %92 %99 
					                           Output f32* %102 = OpAccessChain %92 %100 
					                                                OpStore %102 %65 
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
						float _Amount;
						float _Value1;
						float _Value3;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					void main()
					{
					    u_xlat0.x = _Amount / _ScreenParams.x;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat0.x = u_xlat16_0 + (-_Value1);
					    u_xlat1 = float(1.0) / _Value3;
					    u_xlat0.x = u_xlat1 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(u_xlat1);
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