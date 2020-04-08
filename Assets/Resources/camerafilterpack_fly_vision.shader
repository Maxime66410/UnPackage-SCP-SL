Shader "CameraFilterPack/Fly_Vision" {
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
			GpuProgramID 40789
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D Texture2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat4;
					vec2 u_xlat16_4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat4.xy = u_xlat4.xy / vec2(vec2(_Value, _Value));
					    u_xlat10_1 = texture(Texture2, u_xlat4.xy);
					    u_xlat16_4.xy = u_xlat10_1.yx * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
					    u_xlat10_1 = texture(Texture2, u_xlat0.xy);
					    u_xlat16_1 = (-u_xlat10_1.z) + 1.0;
					    u_xlat1 = _Value3 * u_xlat16_1 + u_xlat10_1.z;
					    u_xlat4.xy = u_xlat16_4.xy * vec2(u_xlat1) + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_Value2, _Value2)) * u_xlat4.xy + u_xlat0.xy;
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
					; Bound: 121
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %11 %112 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpDecorate vs_TEXCOORD0 Location 11 
					                                                OpMemberDecorate %14 0 Offset 14 
					                                                OpMemberDecorate %14 1 Offset 14 
					                                                OpMemberDecorate %14 2 Offset 14 
					                                                OpMemberDecorate %14 3 RelaxedPrecision 
					                                                OpMemberDecorate %14 3 Offset 14 
					                                                OpDecorate %14 Block 
					                                                OpDecorate %16 DescriptorSet 16 
					                                                OpDecorate %16 Binding 16 
					                                                OpDecorate %21 RelaxedPrecision 
					                                                OpDecorate %22 RelaxedPrecision 
					                                                OpDecorate %25 RelaxedPrecision 
					                                                OpDecorate %26 RelaxedPrecision 
					                                                OpDecorate %45 RelaxedPrecision 
					                                                OpDecorate %48 RelaxedPrecision 
					                                                OpDecorate %48 DescriptorSet 48 
					                                                OpDecorate %48 Binding 48 
					                                                OpDecorate %49 RelaxedPrecision 
					                                                OpDecorate %52 RelaxedPrecision 
					                                                OpDecorate %52 DescriptorSet 52 
					                                                OpDecorate %52 Binding 52 
					                                                OpDecorate %53 RelaxedPrecision 
					                                                OpDecorate %58 RelaxedPrecision 
					                                                OpDecorate %59 RelaxedPrecision 
					                                                OpDecorate %60 RelaxedPrecision 
					                                                OpDecorate %61 RelaxedPrecision 
					                                                OpDecorate %65 RelaxedPrecision 
					                                                OpDecorate %68 RelaxedPrecision 
					                                                OpDecorate %70 RelaxedPrecision 
					                                                OpDecorate %71 RelaxedPrecision 
					                                                OpDecorate %72 RelaxedPrecision 
					                                                OpDecorate %78 RelaxedPrecision 
					                                                OpDecorate %79 RelaxedPrecision 
					                                                OpDecorate %80 RelaxedPrecision 
					                                                OpDecorate %81 RelaxedPrecision 
					                                                OpDecorate %82 RelaxedPrecision 
					                                                OpDecorate %87 RelaxedPrecision 
					                                                OpDecorate %89 RelaxedPrecision 
					                                                OpDecorate %91 RelaxedPrecision 
					                                                OpDecorate %93 RelaxedPrecision 
					                                                OpDecorate %94 RelaxedPrecision 
					                                                OpDecorate %112 Location 112 
					                                                OpDecorate %113 RelaxedPrecision 
					                                                OpDecorate %113 DescriptorSet 113 
					                                                OpDecorate %113 Binding 113 
					                                                OpDecorate %114 RelaxedPrecision 
					                                                OpDecorate %115 RelaxedPrecision 
					                                                OpDecorate %115 DescriptorSet 115 
					                                                OpDecorate %115 Binding 115 
					                                                OpDecorate %116 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 2 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_2* %9 = OpVariable Private 
					                                        %10 = OpTypePointer Input %7 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                        %13 = OpTypeVector %6 4 
					                                        %14 = OpTypeStruct %6 %6 %6 %13 
					                                        %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                        %17 = OpTypeInt 32 1 
					                                    i32 %18 = OpConstant 3 
					                                        %19 = OpTypePointer Uniform %13 
					                         Private f32_2* %28 = OpVariable Private 
					                                    f32 %30 = OpConstant 3,674022E-40 
					                                  f32_2 %31 = OpConstantComposite %30 %30 
					                                    i32 %34 = OpConstant 0 
					                                        %35 = OpTypePointer Uniform %6 
					                         Private f32_2* %45 = OpVariable Private 
					                                        %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %47 = OpTypePointer UniformConstant %46 
					   UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
					                                        %50 = OpTypeSampler 
					                                        %51 = OpTypePointer UniformConstant %50 
					               UniformConstant sampler* %52 = OpVariable UniformConstant 
					                                        %54 = OpTypeSampledImage %46 
					                         Private f32_2* %59 = OpVariable Private 
					                                    f32 %62 = OpConstant 3,674022E-40 
					                                    f32 %63 = OpConstant 3,674022E-40 
					                                  f32_2 %64 = OpConstantComposite %62 %63 
					                                    f32 %66 = OpConstant 3,674022E-40 
					                                  f32_2 %67 = OpConstantComposite %63 %66 
					                                        %69 = OpTypePointer Private %6 
					                           Private f32* %70 = OpVariable Private 
					                                        %76 = OpTypeInt 32 0 
					                                    u32 %77 = OpConstant 2 
					                           Private f32* %79 = OpVariable Private 
					                           Private f32* %83 = OpVariable Private 
					                                    i32 %84 = OpConstant 2 
					                                    i32 %98 = OpConstant 1 
					                                       %111 = OpTypePointer Output %13 
					                         Output f32_4* %112 = OpVariable Output 
					  UniformConstant read_only Texture2D* %113 = OpVariable UniformConstant 
					              UniformConstant sampler* %115 = OpVariable UniformConstant 
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
					                                  f32_2 %32 = OpFAdd %29 %31 
					                                                OpStore %28 %32 
					                                  f32_2 %33 = OpLoad %28 
					                           Uniform f32* %36 = OpAccessChain %16 %34 
					                                    f32 %37 = OpLoad %36 
					                           Uniform f32* %38 = OpAccessChain %16 %34 
					                                    f32 %39 = OpLoad %38 
					                                  f32_2 %40 = OpCompositeConstruct %37 %39 
					                                    f32 %41 = OpCompositeExtract %40 0 
					                                    f32 %42 = OpCompositeExtract %40 1 
					                                  f32_2 %43 = OpCompositeConstruct %41 %42 
					                                  f32_2 %44 = OpFDiv %33 %43 
					                                                OpStore %28 %44 
					                    read_only Texture2D %49 = OpLoad %48 
					                                sampler %53 = OpLoad %52 
					             read_only Texture2DSampled %55 = OpSampledImage %49 %53 
					                                  f32_2 %56 = OpLoad %28 
					                                  f32_4 %57 = OpImageSampleImplicitLod %55 %56 
					                                  f32_2 %58 = OpVectorShuffle %57 %57 0 1 
					                                                OpStore %45 %58 
					                                  f32_2 %60 = OpLoad %45 
					                                  f32_2 %61 = OpVectorShuffle %60 %60 1 0 
					                                  f32_2 %65 = OpFMul %61 %64 
					                                  f32_2 %68 = OpFAdd %65 %67 
					                                                OpStore %59 %68 
					                    read_only Texture2D %71 = OpLoad %48 
					                                sampler %72 = OpLoad %52 
					             read_only Texture2DSampled %73 = OpSampledImage %71 %72 
					                                  f32_2 %74 = OpLoad %9 
					                                  f32_4 %75 = OpImageSampleImplicitLod %73 %74 
					                                    f32 %78 = OpCompositeExtract %75 2 
					                                                OpStore %70 %78 
					                                    f32 %80 = OpLoad %70 
					                                    f32 %81 = OpFNegate %80 
					                                    f32 %82 = OpFAdd %81 %63 
					                                                OpStore %79 %82 
					                           Uniform f32* %85 = OpAccessChain %16 %84 
					                                    f32 %86 = OpLoad %85 
					                                    f32 %87 = OpLoad %79 
					                                    f32 %88 = OpFMul %86 %87 
					                                    f32 %89 = OpLoad %70 
					                                    f32 %90 = OpFAdd %88 %89 
					                                                OpStore %83 %90 
					                                  f32_2 %91 = OpLoad %59 
					                                    f32 %92 = OpLoad %83 
					                                  f32_2 %93 = OpCompositeConstruct %92 %92 
					                                  f32_2 %94 = OpFMul %91 %93 
					                                  f32_2 %95 = OpLoad %9 
					                                  f32_2 %96 = OpFNegate %95 
					                                  f32_2 %97 = OpFAdd %94 %96 
					                                                OpStore %28 %97 
					                           Uniform f32* %99 = OpAccessChain %16 %98 
					                                   f32 %100 = OpLoad %99 
					                          Uniform f32* %101 = OpAccessChain %16 %98 
					                                   f32 %102 = OpLoad %101 
					                                 f32_2 %103 = OpCompositeConstruct %100 %102 
					                                   f32 %104 = OpCompositeExtract %103 0 
					                                   f32 %105 = OpCompositeExtract %103 1 
					                                 f32_2 %106 = OpCompositeConstruct %104 %105 
					                                 f32_2 %107 = OpLoad %28 
					                                 f32_2 %108 = OpFMul %106 %107 
					                                 f32_2 %109 = OpLoad %9 
					                                 f32_2 %110 = OpFAdd %108 %109 
					                                                OpStore %9 %110 
					                   read_only Texture2D %114 = OpLoad %113 
					                               sampler %116 = OpLoad %115 
					            read_only Texture2DSampled %117 = OpSampledImage %114 %116 
					                                 f32_2 %118 = OpLoad %9 
					                                 f32_4 %119 = OpImageSampleImplicitLod %117 %118 
					                                                OpStore %112 %119 
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
						float _Value;
						float _Value2;
						float _Value3;
						vec4 unused_0_4;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D Texture2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat4;
					vec2 u_xlat16_4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat4.xy = u_xlat4.xy / vec2(vec2(_Value, _Value));
					    u_xlat10_1 = texture(Texture2, u_xlat4.xy);
					    u_xlat16_4.xy = u_xlat10_1.yx * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
					    u_xlat10_1 = texture(Texture2, u_xlat0.xy);
					    u_xlat16_1 = (-u_xlat10_1.z) + 1.0;
					    u_xlat1 = _Value3 * u_xlat16_1 + u_xlat10_1.z;
					    u_xlat4.xy = u_xlat16_4.xy * vec2(u_xlat1) + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_Value2, _Value2)) * u_xlat4.xy + u_xlat0.xy;
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