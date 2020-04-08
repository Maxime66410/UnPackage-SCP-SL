Shader "CameraFilterPack/FX_superDot" {
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
			GpuProgramID 27744
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
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat6;
					vec2 u_xlat8;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat6.xy = u_xlat6.xy * vec2(0.125, 0.125);
					    u_xlat6.xy = floor(u_xlat6.xy);
					    u_xlat6.xy = u_xlat6.xy * vec2(8.0, 8.0);
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy + (-u_xlat6.xy);
					    u_xlat6.xy = u_xlat6.xy / _ScreenResolution.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat6.xy = u_xlat0.xy * vec2(0.125, 0.125);
					    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
					    u_xlat2.xy = u_xlat6.xy * u_xlat0.xy;
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat2.xy = u_xlat2.xy * vec2(0.0625, 0.0625);
					    u_xlat8.xy = u_xlat0.xy * vec2(0.03125, 0.03125);
					    u_xlat6.xy = u_xlat6.xy * u_xlat8.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.03125, 0.03125) + u_xlat6.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(32.0, 32.0) + vec2(0.5, 0.5);
					    u_xlat1 = u_xlat0.xxxx * u_xlat10_1;
					    SV_Target0 = u_xlat0.yyyy * u_xlat1;
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
					; Bound: 122
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %116 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 RelaxedPrecision 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %62 DescriptorSet 62 
					                                             OpDecorate %62 Binding 62 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %66 DescriptorSet 66 
					                                             OpDecorate %66 Binding 66 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %116 Location 116 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %13 %13 
					                                     %15 = OpTypePointer Uniform %14 
					     Uniform struct {f32_4; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 1 
					                                     %19 = OpTypePointer Uniform %13 
					                      Private f32_2* %28 = OpVariable Private 
					                                 i32 %30 = OpConstant 0 
					                                 f32 %36 = OpConstant 3,674022E-40 
					                               f32_2 %37 = OpConstantComposite %36 %36 
					                                 f32 %42 = OpConstant 3,674022E-40 
					                               f32_2 %43 = OpConstantComposite %42 %42 
					                                     %58 = OpTypePointer Private %13 
					                      Private f32_4* %59 = OpVariable Private 
					                                     %60 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %61 = OpTypePointer UniformConstant %60 
					UniformConstant read_only Texture2D* %62 = OpVariable UniformConstant 
					                                     %64 = OpTypeSampler 
					                                     %65 = OpTypePointer UniformConstant %64 
					            UniformConstant sampler* %66 = OpVariable UniformConstant 
					                                     %68 = OpTypeSampledImage %60 
					                      Private f32_2* %77 = OpVariable Private 
					                                 f32 %85 = OpConstant 3,674022E-40 
					                               f32_2 %86 = OpConstantComposite %85 %85 
					                      Private f32_2* %88 = OpVariable Private 
					                                 f32 %90 = OpConstant 3,674022E-40 
					                               f32_2 %91 = OpConstantComposite %90 %90 
					                                f32 %104 = OpConstant 3,674022E-40 
					                              f32_2 %105 = OpConstantComposite %104 %104 
					                                f32 %107 = OpConstant 3,674022E-40 
					                              f32_2 %108 = OpConstantComposite %107 %107 
					                     Private f32_4* %110 = OpVariable Private 
					                                    %115 = OpTypePointer Output %13 
					                      Output f32_4* %116 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_2 %12 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %20 = OpAccessChain %16 %18 
					                               f32_4 %21 = OpLoad %20 
					                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                               f32_2 %23 = OpFMul %12 %22 
					                      Uniform f32_4* %24 = OpAccessChain %16 %18 
					                               f32_4 %25 = OpLoad %24 
					                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                               f32_2 %27 = OpFAdd %23 %26 
					                                             OpStore %9 %27 
					                               f32_2 %29 = OpLoad %9 
					                      Uniform f32_4* %31 = OpAccessChain %16 %30 
					                               f32_4 %32 = OpLoad %31 
					                               f32_2 %33 = OpVectorShuffle %32 %32 0 1 
					                               f32_2 %34 = OpFMul %29 %33 
					                                             OpStore %28 %34 
					                               f32_2 %35 = OpLoad %28 
					                               f32_2 %38 = OpFMul %35 %37 
					                                             OpStore %28 %38 
					                               f32_2 %39 = OpLoad %28 
					                               f32_2 %40 = OpExtInst %1 8 %39 
					                                             OpStore %28 %40 
					                               f32_2 %41 = OpLoad %28 
					                               f32_2 %44 = OpFMul %41 %43 
					                                             OpStore %28 %44 
					                               f32_2 %45 = OpLoad %9 
					                      Uniform f32_4* %46 = OpAccessChain %16 %30 
					                               f32_4 %47 = OpLoad %46 
					                               f32_2 %48 = OpVectorShuffle %47 %47 0 1 
					                               f32_2 %49 = OpFMul %45 %48 
					                               f32_2 %50 = OpLoad %28 
					                               f32_2 %51 = OpFNegate %50 
					                               f32_2 %52 = OpFAdd %49 %51 
					                                             OpStore %9 %52 
					                               f32_2 %53 = OpLoad %28 
					                      Uniform f32_4* %54 = OpAccessChain %16 %30 
					                               f32_4 %55 = OpLoad %54 
					                               f32_2 %56 = OpVectorShuffle %55 %55 0 1 
					                               f32_2 %57 = OpFDiv %53 %56 
					                                             OpStore %28 %57 
					                 read_only Texture2D %63 = OpLoad %62 
					                             sampler %67 = OpLoad %66 
					          read_only Texture2DSampled %69 = OpSampledImage %63 %67 
					                               f32_2 %70 = OpLoad %28 
					                               f32_4 %71 = OpImageSampleImplicitLod %69 %70 
					                                             OpStore %59 %71 
					                               f32_2 %72 = OpLoad %9 
					                               f32_2 %73 = OpFMul %72 %37 
					                                             OpStore %28 %73 
					                               f32_2 %74 = OpLoad %9 
					                               f32_2 %75 = OpLoad %28 
					                               f32_2 %76 = OpFMul %74 %75 
					                                             OpStore %9 %76 
					                               f32_2 %78 = OpLoad %28 
					                               f32_2 %79 = OpLoad %9 
					                               f32_2 %80 = OpFMul %78 %79 
					                                             OpStore %77 %80 
					                               f32_2 %81 = OpLoad %28 
					                               f32_2 %82 = OpLoad %28 
					                               f32_2 %83 = OpFMul %81 %82 
					                                             OpStore %28 %83 
					                               f32_2 %84 = OpLoad %77 
					                               f32_2 %87 = OpFMul %84 %86 
					                                             OpStore %77 %87 
					                               f32_2 %89 = OpLoad %9 
					                               f32_2 %92 = OpFMul %89 %91 
					                                             OpStore %88 %92 
					                               f32_2 %93 = OpLoad %28 
					                               f32_2 %94 = OpLoad %88 
					                               f32_2 %95 = OpFMul %93 %94 
					                               f32_2 %96 = OpLoad %77 
					                               f32_2 %97 = OpFNegate %96 
					                               f32_2 %98 = OpFAdd %95 %97 
					                                             OpStore %28 %98 
					                               f32_2 %99 = OpLoad %9 
					                              f32_2 %100 = OpFMul %99 %91 
					                              f32_2 %101 = OpLoad %28 
					                              f32_2 %102 = OpFAdd %100 %101 
					                                             OpStore %9 %102 
					                              f32_2 %103 = OpLoad %9 
					                              f32_2 %106 = OpFMul %103 %105 
					                              f32_2 %109 = OpFAdd %106 %108 
					                                             OpStore %9 %109 
					                              f32_2 %111 = OpLoad %9 
					                              f32_4 %112 = OpVectorShuffle %111 %111 0 0 0 0 
					                              f32_4 %113 = OpLoad %59 
					                              f32_4 %114 = OpFMul %112 %113 
					                                             OpStore %110 %114 
					                              f32_2 %117 = OpLoad %9 
					                              f32_4 %118 = OpVectorShuffle %117 %117 1 1 1 1 
					                              f32_4 %119 = OpLoad %110 
					                              f32_4 %120 = OpFMul %118 %119 
					                                             OpStore %116 %120 
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
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat6;
					vec2 u_xlat8;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat6.xy = u_xlat6.xy * vec2(0.125, 0.125);
					    u_xlat6.xy = floor(u_xlat6.xy);
					    u_xlat6.xy = u_xlat6.xy * vec2(8.0, 8.0);
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy + (-u_xlat6.xy);
					    u_xlat6.xy = u_xlat6.xy / _ScreenResolution.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat6.xy = u_xlat0.xy * vec2(0.125, 0.125);
					    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
					    u_xlat2.xy = u_xlat6.xy * u_xlat0.xy;
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat2.xy = u_xlat2.xy * vec2(0.0625, 0.0625);
					    u_xlat8.xy = u_xlat0.xy * vec2(0.03125, 0.03125);
					    u_xlat6.xy = u_xlat6.xy * u_xlat8.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.03125, 0.03125) + u_xlat6.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(32.0, 32.0) + vec2(0.5, 0.5);
					    u_xlat1 = u_xlat0.xxxx * u_xlat10_1;
					    SV_Target0 = u_xlat0.yyyy * u_xlat1;
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