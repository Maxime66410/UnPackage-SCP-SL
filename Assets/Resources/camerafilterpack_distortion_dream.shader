Shader "CameraFilterPack/Distortion_Dream" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 57826
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
					uniform 	float _Distortion;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.75;
					    u_xlat1 = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat1;
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat0.xy * vec2(0.150000006, 0.150000006);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat10_1.x * _Distortion;
					    u_xlat0.x = u_xlat0.x * 0.0500000007;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + u_xlat4.xy;
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
					; Bound: 105
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %38 %98 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpMemberDecorate %11 1 Offset 11 
					                                             OpMemberDecorate %11 2 RelaxedPrecision 
					                                             OpMemberDecorate %11 2 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD0 Location 38 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %71 DescriptorSet 71 
					                                             OpDecorate %71 Binding 71 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %75 DescriptorSet 75 
					                                             OpDecorate %75 Binding 75 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %98 Location 98 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
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
					                                 f32 %19 = OpConstant 3,674022E-40 
					                                     %21 = OpTypeInt 32 0 
					                                 u32 %22 = OpConstant 0 
					                                     %23 = OpTypePointer Private %6 
					                        Private f32* %25 = OpVariable Private 
					                                 u32 %34 = OpConstant 1 
					                      Private f32_2* %36 = OpVariable Private 
					                                     %37 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %40 = OpConstant 2 
					                                     %41 = OpTypePointer Uniform %10 
					                                 i32 %54 = OpConstant 1 
					                                 f32 %65 = OpConstant 3,674022E-40 
					                               f32_2 %66 = OpConstantComposite %65 %65 
					                        Private f32* %68 = OpVariable Private 
					                                     %69 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %70 = OpTypePointer UniformConstant %69 
					UniformConstant read_only Texture2D* %71 = OpVariable UniformConstant 
					                                     %73 = OpTypeSampler 
					                                     %74 = OpTypePointer UniformConstant %73 
					            UniformConstant sampler* %75 = OpVariable UniformConstant 
					                                     %77 = OpTypeSampledImage %69 
					                                 f32 %89 = OpConstant 3,674022E-40 
					                                 f32 %92 = OpConstant 3,674022E-40 
					                                     %97 = OpTypePointer Output %10 
					                       Output f32_4* %98 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                        Uniform f32* %17 = OpAccessChain %13 %15 
					                                 f32 %18 = OpLoad %17 
					                                 f32 %20 = OpFMul %18 %19 
					                        Private f32* %24 = OpAccessChain %9 %22 
					                                             OpStore %24 %20 
					                        Private f32* %26 = OpAccessChain %9 %22 
					                                 f32 %27 = OpLoad %26 
					                                 f32 %28 = OpExtInst %1 14 %27 
					                                             OpStore %25 %28 
					                        Private f32* %29 = OpAccessChain %9 %22 
					                                 f32 %30 = OpLoad %29 
					                                 f32 %31 = OpExtInst %1 13 %30 
					                        Private f32* %32 = OpAccessChain %9 %22 
					                                             OpStore %32 %31 
					                                 f32 %33 = OpLoad %25 
					                        Private f32* %35 = OpAccessChain %9 %34 
					                                             OpStore %35 %33 
					                               f32_2 %39 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %42 = OpAccessChain %13 %40 
					                               f32_4 %43 = OpLoad %42 
					                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
					                               f32_2 %45 = OpFMul %39 %44 
					                      Uniform f32_4* %46 = OpAccessChain %13 %40 
					                               f32_4 %47 = OpLoad %46 
					                               f32_2 %48 = OpVectorShuffle %47 %47 2 3 
					                               f32_2 %49 = OpFAdd %45 %48 
					                                             OpStore %36 %49 
					                               f32_2 %50 = OpLoad %9 
					                               f32_2 %51 = OpLoad %36 
					                               f32_2 %52 = OpFAdd %50 %51 
					                                             OpStore %9 %52 
					                               f32_2 %53 = OpLoad %9 
					                        Uniform f32* %55 = OpAccessChain %13 %54 
					                                 f32 %56 = OpLoad %55 
					                        Uniform f32* %57 = OpAccessChain %13 %54 
					                                 f32 %58 = OpLoad %57 
					                               f32_2 %59 = OpCompositeConstruct %56 %58 
					                                 f32 %60 = OpCompositeExtract %59 0 
					                                 f32 %61 = OpCompositeExtract %59 1 
					                               f32_2 %62 = OpCompositeConstruct %60 %61 
					                               f32_2 %63 = OpFMul %53 %62 
					                                             OpStore %9 %63 
					                               f32_2 %64 = OpLoad %9 
					                               f32_2 %67 = OpFMul %64 %66 
					                                             OpStore %9 %67 
					                 read_only Texture2D %72 = OpLoad %71 
					                             sampler %76 = OpLoad %75 
					          read_only Texture2DSampled %78 = OpSampledImage %72 %76 
					                               f32_2 %79 = OpLoad %9 
					                               f32_4 %80 = OpImageSampleImplicitLod %78 %79 
					                                 f32 %81 = OpCompositeExtract %80 0 
					                                             OpStore %68 %81 
					                                 f32 %82 = OpLoad %68 
					                        Uniform f32* %83 = OpAccessChain %13 %54 
					                                 f32 %84 = OpLoad %83 
					                                 f32 %85 = OpFMul %82 %84 
					                        Private f32* %86 = OpAccessChain %9 %22 
					                                             OpStore %86 %85 
					                        Private f32* %87 = OpAccessChain %9 %22 
					                                 f32 %88 = OpLoad %87 
					                                 f32 %90 = OpFMul %88 %89 
					                        Private f32* %91 = OpAccessChain %9 %22 
					                                             OpStore %91 %90 
					                        Private f32* %93 = OpAccessChain %9 %34 
					                                             OpStore %93 %92 
					                               f32_2 %94 = OpLoad %9 
					                               f32_2 %95 = OpLoad %36 
					                               f32_2 %96 = OpFAdd %94 %95 
					                                             OpStore %9 %96 
					                 read_only Texture2D %99 = OpLoad %71 
					                            sampler %100 = OpLoad %75 
					         read_only Texture2DSampled %101 = OpSampledImage %99 %100 
					                              f32_2 %102 = OpLoad %9 
					                              f32_4 %103 = OpImageSampleImplicitLod %101 %102 
					                                             OpStore %98 %103 
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
						float _Distortion;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.75;
					    u_xlat1 = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat1;
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat0.xy * vec2(0.150000006, 0.150000006);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat10_1.x * _Distortion;
					    u_xlat0.x = u_xlat0.x * 0.0500000007;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + u_xlat4.xy;
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