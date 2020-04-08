Shader "CameraFilterPack/FX_Psycho" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 7385
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
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = vec3(_TimeX) * vec3(0.5, 0.5, 0.5) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
					    u_xlat1.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(8.0, 8.0, 8.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    SV_Target0.xyz = (-u_xlat1.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat0.xyz;
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
					; Bound: 107
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %58 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
					                                             OpMemberDecorate %15 0 Offset 15 
					                                             OpMemberDecorate %15 1 Offset 15 
					                                             OpMemberDecorate %15 2 RelaxedPrecision 
					                                             OpMemberDecorate %15 2 Offset 15 
					                                             OpDecorate %15 Block 
					                                             OpDecorate %17 DescriptorSet 17 
					                                             OpDecorate %17 Binding 17 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %23 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %32 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %35 DescriptorSet 35 
					                                             OpDecorate %35 Binding 35 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %39 DescriptorSet 39 
					                                             OpDecorate %39 Binding 39 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %58 Location 58 
					                                             OpDecorate %63 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %14 = OpTypeVector %6 4 
					                                     %15 = OpTypeStruct %6 %6 %14 
					                                     %16 = OpTypePointer Uniform %15 
					  Uniform struct {f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                     %18 = OpTypeInt 32 1 
					                                 i32 %19 = OpConstant 2 
					                                     %20 = OpTypePointer Uniform %14 
					                                     %31 = OpTypePointer Private %14 
					                      Private f32_4* %32 = OpVariable Private 
					                                     %33 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %34 = OpTypePointer UniformConstant %33 
					UniformConstant read_only Texture2D* %35 = OpVariable UniformConstant 
					                                     %37 = OpTypeSampler 
					                                     %38 = OpTypePointer UniformConstant %37 
					            UniformConstant sampler* %39 = OpVariable UniformConstant 
					                                     %41 = OpTypeSampledImage %33 
					                                 i32 %46 = OpConstant 0 
					                                     %47 = OpTypePointer Uniform %6 
					                                 f32 %51 = OpConstant 3,674022E-40 
					                               f32_3 %52 = OpConstantComposite %51 %51 %51 
					                                     %57 = OpTypePointer Output %14 
					                       Output f32_4* %58 = OpVariable Output 
					                                     %59 = OpTypeInt 32 0 
					                                 u32 %60 = OpConstant 3 
					                                     %61 = OpTypePointer Private %6 
					                                     %64 = OpTypePointer Output %6 
					                      Private f32_3* %66 = OpVariable Private 
					                                 f32 %74 = OpConstant 3,674022E-40 
					                               f32_3 %75 = OpConstantComposite %74 %74 %74 
					                                 i32 %80 = OpConstant 1 
					                                 f32 %99 = OpConstant 3,674022E-40 
					                              f32_3 %100 = OpConstantComposite %99 %99 %99 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_2 %13 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %21 = OpAccessChain %17 %19 
					                               f32_4 %22 = OpLoad %21 
					                               f32_2 %23 = OpVectorShuffle %22 %22 0 1 
					                               f32_2 %24 = OpFMul %13 %23 
					                      Uniform f32_4* %25 = OpAccessChain %17 %19 
					                               f32_4 %26 = OpLoad %25 
					                               f32_2 %27 = OpVectorShuffle %26 %26 2 3 
					                               f32_2 %28 = OpFAdd %24 %27 
					                               f32_3 %29 = OpLoad %9 
					                               f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
					                                             OpStore %9 %30 
					                 read_only Texture2D %36 = OpLoad %35 
					                             sampler %40 = OpLoad %39 
					          read_only Texture2DSampled %42 = OpSampledImage %36 %40 
					                               f32_3 %43 = OpLoad %9 
					                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
					                               f32_4 %45 = OpImageSampleImplicitLod %42 %44 
					                                             OpStore %32 %45 
					                        Uniform f32* %48 = OpAccessChain %17 %46 
					                                 f32 %49 = OpLoad %48 
					                               f32_3 %50 = OpCompositeConstruct %49 %49 %49 
					                               f32_3 %53 = OpFMul %50 %52 
					                               f32_4 %54 = OpLoad %32 
					                               f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
					                               f32_3 %56 = OpFAdd %53 %55 
					                                             OpStore %9 %56 
					                        Private f32* %62 = OpAccessChain %32 %60 
					                                 f32 %63 = OpLoad %62 
					                         Output f32* %65 = OpAccessChain %58 %60 
					                                             OpStore %65 %63 
					                               f32_3 %67 = OpLoad %9 
					                               f32_3 %68 = OpExtInst %1 8 %67 
					                                             OpStore %66 %68 
					                               f32_3 %69 = OpLoad %9 
					                               f32_3 %70 = OpLoad %66 
					                               f32_3 %71 = OpFNegate %70 
					                               f32_3 %72 = OpFAdd %69 %71 
					                                             OpStore %9 %72 
					                               f32_3 %73 = OpLoad %9 
					                               f32_3 %76 = OpFMul %73 %75 
					                                             OpStore %9 %76 
					                               f32_3 %77 = OpLoad %9 
					                               f32_3 %78 = OpExtInst %1 8 %77 
					                                             OpStore %9 %78 
					                               f32_3 %79 = OpLoad %9 
					                        Uniform f32* %81 = OpAccessChain %17 %80 
					                                 f32 %82 = OpLoad %81 
					                        Uniform f32* %83 = OpAccessChain %17 %80 
					                                 f32 %84 = OpLoad %83 
					                        Uniform f32* %85 = OpAccessChain %17 %80 
					                                 f32 %86 = OpLoad %85 
					                               f32_3 %87 = OpCompositeConstruct %82 %84 %86 
					                                 f32 %88 = OpCompositeExtract %87 0 
					                                 f32 %89 = OpCompositeExtract %87 1 
					                                 f32 %90 = OpCompositeExtract %87 2 
					                               f32_3 %91 = OpCompositeConstruct %88 %89 %90 
					                               f32_3 %92 = OpFMul %79 %91 
					                                             OpStore %9 %92 
					                               f32_3 %93 = OpLoad %9 
					                               f32_3 %94 = OpFMul %93 %52 
					                                             OpStore %66 %94 
					                               f32_3 %95 = OpLoad %66 
					                               f32_3 %96 = OpExtInst %1 8 %95 
					                                             OpStore %66 %96 
					                               f32_3 %97 = OpLoad %66 
					                               f32_3 %98 = OpFNegate %97 
					                              f32_3 %101 = OpFMul %98 %100 
					                              f32_3 %102 = OpLoad %9 
					                              f32_3 %103 = OpFAdd %101 %102 
					                              f32_4 %104 = OpLoad %58 
					                              f32_4 %105 = OpVectorShuffle %104 %103 4 5 6 3 
					                                             OpStore %58 %105 
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
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = vec3(_TimeX) * vec3(0.5, 0.5, 0.5) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
					    u_xlat1.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(8.0, 8.0, 8.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    SV_Target0.xyz = (-u_xlat1.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat0.xyz;
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