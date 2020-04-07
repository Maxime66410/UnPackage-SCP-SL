Shader "Hidden/Post FX/Fog" {
	Properties {
		_MainTex ("Main Texture", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 47925
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 _FogColor;
					uniform 	float _Density;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0 = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat0 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
					    u_xlat0 = u_xlat0 * _Density;
					    u_xlat0 = u_xlat0 * (-u_xlat0);
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = (-u_xlat10_1) + _FogColor;
					    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 102
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %12 %35 %86 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate vs_TEXCOORD0 Location 9 
					                                                     OpDecorate %12 Location 12 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpDecorate %18 ArrayStride 18 
					                                                     OpMemberDecorate %19 0 Offset 19 
					                                                     OpMemberDecorate %19 1 Offset 19 
					                                                     OpMemberDecorate %19 2 Offset 19 
					                                                     OpDecorate %19 Block 
					                                                     OpDecorate %21 DescriptorSet 21 
					                                                     OpDecorate %21 Binding 21 
					                                                     OpDecorate %35 Location 35 
					                                                     OpMemberDecorate %84 0 BuiltIn 84 
					                                                     OpMemberDecorate %84 1 BuiltIn 84 
					                                                     OpMemberDecorate %84 2 BuiltIn 84 
					                                                     OpDecorate %84 Block 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 2 
					                                              %8 = OpTypePointer Output %7 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %10 = OpTypeVector %6 4 
					                                             %11 = OpTypePointer Input %10 
					                                Input f32_4* %12 = OpVariable Input 
					                                             %15 = OpTypeInt 32 0 
					                                         u32 %16 = OpConstant 4 
					                                             %17 = OpTypeArray %10 %16 
					                                             %18 = OpTypeArray %10 %16 
					                                             %19 = OpTypeStruct %17 %18 %10 
					                                             %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
					                                             %22 = OpTypeInt 32 1 
					                                         i32 %23 = OpConstant 2 
					                                             %24 = OpTypePointer Uniform %10 
					                                             %33 = OpTypePointer Private %10 
					                              Private f32_4* %34 = OpVariable Private 
					                                Input f32_4* %35 = OpVariable Input 
					                                         i32 %38 = OpConstant 0 
					                                         i32 %39 = OpConstant 1 
					                                         i32 %58 = OpConstant 3 
					                              Private f32_4* %62 = OpVariable Private 
					                                         u32 %82 = OpConstant 1 
					                                             %83 = OpTypeArray %6 %82 
					                                             %84 = OpTypeStruct %10 %6 %83 
					                                             %85 = OpTypePointer Output %84 
					        Output struct {f32_4; f32; f32[1];}* %86 = OpVariable Output 
					                                             %94 = OpTypePointer Output %10 
					                                             %96 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %13 = OpLoad %12 
					                                       f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                              Uniform f32_4* %25 = OpAccessChain %21 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_2 %27 = OpVectorShuffle %26 %26 0 1 
					                                       f32_2 %28 = OpFMul %14 %27 
					                              Uniform f32_4* %29 = OpAccessChain %21 %23 
					                                       f32_4 %30 = OpLoad %29 
					                                       f32_2 %31 = OpVectorShuffle %30 %30 2 3 
					                                       f32_2 %32 = OpFAdd %28 %31 
					                                                     OpStore vs_TEXCOORD0 %32 
					                                       f32_4 %36 = OpLoad %35 
					                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
					                              Uniform f32_4* %40 = OpAccessChain %21 %38 %39 
					                                       f32_4 %41 = OpLoad %40 
					                                       f32_4 %42 = OpFMul %37 %41 
					                                                     OpStore %34 %42 
					                              Uniform f32_4* %43 = OpAccessChain %21 %38 %38 
					                                       f32_4 %44 = OpLoad %43 
					                                       f32_4 %45 = OpLoad %35 
					                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
					                                       f32_4 %47 = OpFMul %44 %46 
					                                       f32_4 %48 = OpLoad %34 
					                                       f32_4 %49 = OpFAdd %47 %48 
					                                                     OpStore %34 %49 
					                              Uniform f32_4* %50 = OpAccessChain %21 %38 %23 
					                                       f32_4 %51 = OpLoad %50 
					                                       f32_4 %52 = OpLoad %35 
					                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
					                                       f32_4 %54 = OpFMul %51 %53 
					                                       f32_4 %55 = OpLoad %34 
					                                       f32_4 %56 = OpFAdd %54 %55 
					                                                     OpStore %34 %56 
					                                       f32_4 %57 = OpLoad %34 
					                              Uniform f32_4* %59 = OpAccessChain %21 %38 %58 
					                                       f32_4 %60 = OpLoad %59 
					                                       f32_4 %61 = OpFAdd %57 %60 
					                                                     OpStore %34 %61 
					                                       f32_4 %63 = OpLoad %34 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
					                              Uniform f32_4* %65 = OpAccessChain %21 %39 %39 
					                                       f32_4 %66 = OpLoad %65 
					                                       f32_4 %67 = OpFMul %64 %66 
					                                                     OpStore %62 %67 
					                              Uniform f32_4* %68 = OpAccessChain %21 %39 %38 
					                                       f32_4 %69 = OpLoad %68 
					                                       f32_4 %70 = OpLoad %34 
					                                       f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
					                                       f32_4 %72 = OpFMul %69 %71 
					                                       f32_4 %73 = OpLoad %62 
					                                       f32_4 %74 = OpFAdd %72 %73 
					                                                     OpStore %62 %74 
					                              Uniform f32_4* %75 = OpAccessChain %21 %39 %23 
					                                       f32_4 %76 = OpLoad %75 
					                                       f32_4 %77 = OpLoad %34 
					                                       f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
					                                       f32_4 %79 = OpFMul %76 %78 
					                                       f32_4 %80 = OpLoad %62 
					                                       f32_4 %81 = OpFAdd %79 %80 
					                                                     OpStore %62 %81 
					                              Uniform f32_4* %87 = OpAccessChain %21 %39 %58 
					                                       f32_4 %88 = OpLoad %87 
					                                       f32_4 %89 = OpLoad %34 
					                                       f32_4 %90 = OpVectorShuffle %89 %89 3 3 3 3 
					                                       f32_4 %91 = OpFMul %88 %90 
					                                       f32_4 %92 = OpLoad %62 
					                                       f32_4 %93 = OpFAdd %91 %92 
					                               Output f32_4* %95 = OpAccessChain %86 %38 
					                                                     OpStore %95 %93 
					                                 Output f32* %97 = OpAccessChain %86 %38 %82 
					                                         f32 %98 = OpLoad %97 
					                                         f32 %99 = OpFNegate %98 
					                                Output f32* %100 = OpAccessChain %86 %38 %82 
					                                                     OpStore %100 %99 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 96
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %21 %88 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                    OpDecorate %11 DescriptorSet 11 
					                                                    OpDecorate %11 Binding 11 
					                                                    OpDecorate %15 DescriptorSet 15 
					                                                    OpDecorate %15 Binding 15 
					                                                    OpDecorate vs_TEXCOORD0 Location 21 
					                                                    OpMemberDecorate %28 0 Offset 28 
					                                                    OpMemberDecorate %28 1 Offset 28 
					                                                    OpMemberDecorate %28 2 RelaxedPrecision 
					                                                    OpMemberDecorate %28 2 Offset 28 
					                                                    OpMemberDecorate %28 3 Offset 28 
					                                                    OpDecorate %28 Block 
					                                                    OpDecorate %30 DescriptorSet 30 
					                                                    OpDecorate %30 Binding 30 
					                                                    OpDecorate %60 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %71 RelaxedPrecision 
					                                                    OpDecorate %72 RelaxedPrecision 
					                                                    OpDecorate %72 DescriptorSet 72 
					                                                    OpDecorate %72 Binding 72 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %74 DescriptorSet 74 
					                                                    OpDecorate %74 Binding 74 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %88 RelaxedPrecision 
					                                                    OpDecorate %88 Location 88 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %90 RelaxedPrecision 
					                                                    OpDecorate %91 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %93 RelaxedPrecision 
					                                                    OpDecorate %94 RelaxedPrecision 
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
					                                            %28 = OpTypeStruct %23 %23 %23 %6 
					                                            %29 = OpTypePointer Uniform %28 
					Uniform struct {f32_4; f32_4; f32_4; f32;}* %30 = OpVariable Uniform 
					                                            %31 = OpTypeInt 32 1 
					                                        i32 %32 = OpConstant 1 
					                                            %33 = OpTypePointer Uniform %6 
					                                        u32 %38 = OpConstant 1 
					                                        f32 %42 = OpConstant 3,674022E-40 
					                                        i32 %46 = OpConstant 0 
					                                        u32 %47 = OpConstant 2 
					                                        i32 %56 = OpConstant 3 
					                               Private f32* %60 = OpVariable Private 
					                                            %70 = OpTypePointer Private %23 
					                             Private f32_4* %71 = OpVariable Private 
					       UniformConstant read_only Texture2D* %72 = OpVariable UniformConstant 
					                   UniformConstant sampler* %74 = OpVariable UniformConstant 
					                             Private f32_4* %79 = OpVariable Private 
					                                        i32 %82 = OpConstant 2 
					                                            %83 = OpTypePointer Uniform %23 
					                                            %87 = OpTypePointer Output %23 
					                              Output f32_4* %88 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                        read_only Texture2D %12 = OpLoad %11 
					                                    sampler %16 = OpLoad %15 
					                 read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                                      f32_2 %22 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %24 = OpImageSampleImplicitLod %18 %22 
					                                        f32 %27 = OpCompositeExtract %24 0 
					                                                    OpStore %8 %27 
					                               Uniform f32* %34 = OpAccessChain %30 %32 %26 
					                                        f32 %35 = OpLoad %34 
					                                        f32 %36 = OpLoad %8 
					                                        f32 %37 = OpFMul %35 %36 
					                               Uniform f32* %39 = OpAccessChain %30 %32 %38 
					                                        f32 %40 = OpLoad %39 
					                                        f32 %41 = OpFAdd %37 %40 
					                                                    OpStore %8 %41 
					                                        f32 %43 = OpLoad %8 
					                                        f32 %44 = OpFDiv %42 %43 
					                                                    OpStore %8 %44 
					                                        f32 %45 = OpLoad %8 
					                               Uniform f32* %48 = OpAccessChain %30 %46 %47 
					                                        f32 %49 = OpLoad %48 
					                                        f32 %50 = OpFMul %45 %49 
					                               Uniform f32* %51 = OpAccessChain %30 %46 %38 
					                                        f32 %52 = OpLoad %51 
					                                        f32 %53 = OpFNegate %52 
					                                        f32 %54 = OpFAdd %50 %53 
					                                                    OpStore %8 %54 
					                                        f32 %55 = OpLoad %8 
					                               Uniform f32* %57 = OpAccessChain %30 %56 
					                                        f32 %58 = OpLoad %57 
					                                        f32 %59 = OpFMul %55 %58 
					                                                    OpStore %8 %59 
					                                        f32 %61 = OpLoad %8 
					                                        f32 %62 = OpLoad %8 
					                                        f32 %63 = OpFNegate %62 
					                                        f32 %64 = OpFMul %61 %63 
					                                                    OpStore %60 %64 
					                                        f32 %65 = OpLoad %60 
					                                        f32 %66 = OpExtInst %1 29 %65 
					                                                    OpStore %60 %66 
					                                        f32 %67 = OpLoad %60 
					                                        f32 %68 = OpFNegate %67 
					                                        f32 %69 = OpFAdd %68 %42 
					                                                    OpStore %60 %69 
					                        read_only Texture2D %73 = OpLoad %72 
					                                    sampler %75 = OpLoad %74 
					                 read_only Texture2DSampled %76 = OpSampledImage %73 %75 
					                                      f32_2 %77 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %78 = OpImageSampleImplicitLod %76 %77 
					                                                    OpStore %71 %78 
					                                      f32_4 %80 = OpLoad %71 
					                                      f32_4 %81 = OpFNegate %80 
					                             Uniform f32_4* %84 = OpAccessChain %30 %82 
					                                      f32_4 %85 = OpLoad %84 
					                                      f32_4 %86 = OpFAdd %81 %85 
					                                                    OpStore %79 %86 
					                                        f32 %89 = OpLoad %60 
					                                      f32_4 %90 = OpCompositeConstruct %89 %89 %89 %89 
					                                      f32_4 %91 = OpLoad %79 
					                                      f32_4 %92 = OpFMul %90 %91 
					                                      f32_4 %93 = OpLoad %71 
					                                      f32_4 %94 = OpFAdd %92 %93 
					                                                    OpStore %88 %94 
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
						vec4 unused_0_0[4];
						vec4 _FogColor;
						float _Density;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2;
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0 = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat0 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
					    u_xlat0 = u_xlat0 * _Density;
					    u_xlat0 = u_xlat0 * (-u_xlat0);
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = (-u_xlat10_1) + _FogColor;
					    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat10_1;
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
			GpuProgramID 111573
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 _FogColor;
					uniform 	float _Density;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0 = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat3 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
					    u_xlatb0 = u_xlat0<0.999899983;
					    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat3 = u_xlat3 * _Density;
					    u_xlat3 = u_xlat3 * (-u_xlat3);
					    u_xlat3 = exp2(u_xlat3);
					    u_xlat3 = (-u_xlat3) + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat3;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = (-u_xlat10_1) + _FogColor;
					    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 102
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %12 %35 %86 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate vs_TEXCOORD0 Location 9 
					                                                     OpDecorate %12 Location 12 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpDecorate %18 ArrayStride 18 
					                                                     OpMemberDecorate %19 0 Offset 19 
					                                                     OpMemberDecorate %19 1 Offset 19 
					                                                     OpMemberDecorate %19 2 Offset 19 
					                                                     OpDecorate %19 Block 
					                                                     OpDecorate %21 DescriptorSet 21 
					                                                     OpDecorate %21 Binding 21 
					                                                     OpDecorate %35 Location 35 
					                                                     OpMemberDecorate %84 0 BuiltIn 84 
					                                                     OpMemberDecorate %84 1 BuiltIn 84 
					                                                     OpMemberDecorate %84 2 BuiltIn 84 
					                                                     OpDecorate %84 Block 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 2 
					                                              %8 = OpTypePointer Output %7 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %10 = OpTypeVector %6 4 
					                                             %11 = OpTypePointer Input %10 
					                                Input f32_4* %12 = OpVariable Input 
					                                             %15 = OpTypeInt 32 0 
					                                         u32 %16 = OpConstant 4 
					                                             %17 = OpTypeArray %10 %16 
					                                             %18 = OpTypeArray %10 %16 
					                                             %19 = OpTypeStruct %17 %18 %10 
					                                             %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
					                                             %22 = OpTypeInt 32 1 
					                                         i32 %23 = OpConstant 2 
					                                             %24 = OpTypePointer Uniform %10 
					                                             %33 = OpTypePointer Private %10 
					                              Private f32_4* %34 = OpVariable Private 
					                                Input f32_4* %35 = OpVariable Input 
					                                         i32 %38 = OpConstant 0 
					                                         i32 %39 = OpConstant 1 
					                                         i32 %58 = OpConstant 3 
					                              Private f32_4* %62 = OpVariable Private 
					                                         u32 %82 = OpConstant 1 
					                                             %83 = OpTypeArray %6 %82 
					                                             %84 = OpTypeStruct %10 %6 %83 
					                                             %85 = OpTypePointer Output %84 
					        Output struct {f32_4; f32; f32[1];}* %86 = OpVariable Output 
					                                             %94 = OpTypePointer Output %10 
					                                             %96 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %13 = OpLoad %12 
					                                       f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                              Uniform f32_4* %25 = OpAccessChain %21 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_2 %27 = OpVectorShuffle %26 %26 0 1 
					                                       f32_2 %28 = OpFMul %14 %27 
					                              Uniform f32_4* %29 = OpAccessChain %21 %23 
					                                       f32_4 %30 = OpLoad %29 
					                                       f32_2 %31 = OpVectorShuffle %30 %30 2 3 
					                                       f32_2 %32 = OpFAdd %28 %31 
					                                                     OpStore vs_TEXCOORD0 %32 
					                                       f32_4 %36 = OpLoad %35 
					                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
					                              Uniform f32_4* %40 = OpAccessChain %21 %38 %39 
					                                       f32_4 %41 = OpLoad %40 
					                                       f32_4 %42 = OpFMul %37 %41 
					                                                     OpStore %34 %42 
					                              Uniform f32_4* %43 = OpAccessChain %21 %38 %38 
					                                       f32_4 %44 = OpLoad %43 
					                                       f32_4 %45 = OpLoad %35 
					                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
					                                       f32_4 %47 = OpFMul %44 %46 
					                                       f32_4 %48 = OpLoad %34 
					                                       f32_4 %49 = OpFAdd %47 %48 
					                                                     OpStore %34 %49 
					                              Uniform f32_4* %50 = OpAccessChain %21 %38 %23 
					                                       f32_4 %51 = OpLoad %50 
					                                       f32_4 %52 = OpLoad %35 
					                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
					                                       f32_4 %54 = OpFMul %51 %53 
					                                       f32_4 %55 = OpLoad %34 
					                                       f32_4 %56 = OpFAdd %54 %55 
					                                                     OpStore %34 %56 
					                                       f32_4 %57 = OpLoad %34 
					                              Uniform f32_4* %59 = OpAccessChain %21 %38 %58 
					                                       f32_4 %60 = OpLoad %59 
					                                       f32_4 %61 = OpFAdd %57 %60 
					                                                     OpStore %34 %61 
					                                       f32_4 %63 = OpLoad %34 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
					                              Uniform f32_4* %65 = OpAccessChain %21 %39 %39 
					                                       f32_4 %66 = OpLoad %65 
					                                       f32_4 %67 = OpFMul %64 %66 
					                                                     OpStore %62 %67 
					                              Uniform f32_4* %68 = OpAccessChain %21 %39 %38 
					                                       f32_4 %69 = OpLoad %68 
					                                       f32_4 %70 = OpLoad %34 
					                                       f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
					                                       f32_4 %72 = OpFMul %69 %71 
					                                       f32_4 %73 = OpLoad %62 
					                                       f32_4 %74 = OpFAdd %72 %73 
					                                                     OpStore %62 %74 
					                              Uniform f32_4* %75 = OpAccessChain %21 %39 %23 
					                                       f32_4 %76 = OpLoad %75 
					                                       f32_4 %77 = OpLoad %34 
					                                       f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
					                                       f32_4 %79 = OpFMul %76 %78 
					                                       f32_4 %80 = OpLoad %62 
					                                       f32_4 %81 = OpFAdd %79 %80 
					                                                     OpStore %62 %81 
					                              Uniform f32_4* %87 = OpAccessChain %21 %39 %58 
					                                       f32_4 %88 = OpLoad %87 
					                                       f32_4 %89 = OpLoad %34 
					                                       f32_4 %90 = OpVectorShuffle %89 %89 3 3 3 3 
					                                       f32_4 %91 = OpFMul %88 %90 
					                                       f32_4 %92 = OpLoad %62 
					                                       f32_4 %93 = OpFAdd %91 %92 
					                               Output f32_4* %95 = OpAccessChain %86 %38 
					                                                     OpStore %95 %93 
					                                 Output f32* %97 = OpAccessChain %86 %38 %82 
					                                         f32 %98 = OpLoad %97 
					                                         f32 %99 = OpFNegate %98 
					                                Output f32* %100 = OpAccessChain %86 %38 %82 
					                                                     OpStore %100 %99 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 120
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %22 %117 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %16 DescriptorSet 16 
					                                                    OpDecorate %16 Binding 16 
					                                                    OpDecorate vs_TEXCOORD0 Location 22 
					                                                    OpMemberDecorate %30 0 Offset 30 
					                                                    OpMemberDecorate %30 1 Offset 30 
					                                                    OpMemberDecorate %30 2 RelaxedPrecision 
					                                                    OpMemberDecorate %30 2 Offset 30 
					                                                    OpMemberDecorate %30 3 Offset 30 
					                                                    OpDecorate %30 Block 
					                                                    OpDecorate %32 DescriptorSet 32 
					                                                    OpDecorate %32 Binding 32 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %84 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %88 RelaxedPrecision 
					                                                    OpDecorate %91 RelaxedPrecision 
					                                                    OpDecorate %94 RelaxedPrecision 
					                                                    OpDecorate %95 RelaxedPrecision 
					                                                    OpDecorate %95 DescriptorSet 95 
					                                                    OpDecorate %95 Binding 95 
					                                                    OpDecorate %96 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %97 DescriptorSet 97 
					                                                    OpDecorate %97 Binding 97 
					                                                    OpDecorate %98 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %103 RelaxedPrecision 
					                                                    OpDecorate %104 RelaxedPrecision 
					                                                    OpDecorate %108 RelaxedPrecision 
					                                                    OpDecorate %109 RelaxedPrecision 
					                                                    OpDecorate %112 RelaxedPrecision 
					                                                    OpDecorate %114 RelaxedPrecision 
					                                                    OpDecorate %117 RelaxedPrecision 
					                                                    OpDecorate %117 Location 117 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
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
					                                            %25 = OpTypeInt 32 0 
					                                        u32 %26 = OpConstant 0 
					                                            %28 = OpTypePointer Private %6 
					                                            %30 = OpTypeStruct %7 %7 %7 %6 
					                                            %31 = OpTypePointer Uniform %30 
					Uniform struct {f32_4; f32_4; f32_4; f32;}* %32 = OpVariable Uniform 
					                                            %33 = OpTypeInt 32 1 
					                                        i32 %34 = OpConstant 1 
					                                            %35 = OpTypePointer Uniform %6 
					                                        u32 %41 = OpConstant 1 
					                                        f32 %46 = OpConstant 3,674022E-40 
					                               Private f32* %51 = OpVariable Private 
					                                        i32 %54 = OpConstant 0 
					                                        u32 %55 = OpConstant 2 
					                                            %63 = OpTypeBool 
					                                            %64 = OpTypePointer Private %63 
					                              Private bool* %65 = OpVariable Private 
					                                        f32 %68 = OpConstant 3,674022E-40 
					                                        f32 %71 = OpConstant 3,674022E-40 
					                                        i32 %75 = OpConstant 3 
					                               Private f32* %79 = OpVariable Private 
					                             Private f32_4* %94 = OpVariable Private 
					       UniformConstant read_only Texture2D* %95 = OpVariable UniformConstant 
					                   UniformConstant sampler* %97 = OpVariable UniformConstant 
					                            Private f32_4* %102 = OpVariable Private 
					                                       i32 %105 = OpConstant 2 
					                                           %106 = OpTypePointer Uniform %7 
					                                           %116 = OpTypePointer Output %7 
					                             Output f32_4* %117 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                        read_only Texture2D %13 = OpLoad %12 
					                                    sampler %17 = OpLoad %16 
					                 read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                      f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                        f32 %27 = OpCompositeExtract %24 0 
					                               Private f32* %29 = OpAccessChain %9 %26 
					                                                    OpStore %29 %27 
					                               Uniform f32* %36 = OpAccessChain %32 %34 %26 
					                                        f32 %37 = OpLoad %36 
					                               Private f32* %38 = OpAccessChain %9 %26 
					                                        f32 %39 = OpLoad %38 
					                                        f32 %40 = OpFMul %37 %39 
					                               Uniform f32* %42 = OpAccessChain %32 %34 %41 
					                                        f32 %43 = OpLoad %42 
					                                        f32 %44 = OpFAdd %40 %43 
					                               Private f32* %45 = OpAccessChain %9 %26 
					                                                    OpStore %45 %44 
					                               Private f32* %47 = OpAccessChain %9 %26 
					                                        f32 %48 = OpLoad %47 
					                                        f32 %49 = OpFDiv %46 %48 
					                               Private f32* %50 = OpAccessChain %9 %26 
					                                                    OpStore %50 %49 
					                               Private f32* %52 = OpAccessChain %9 %26 
					                                        f32 %53 = OpLoad %52 
					                               Uniform f32* %56 = OpAccessChain %32 %54 %55 
					                                        f32 %57 = OpLoad %56 
					                                        f32 %58 = OpFMul %53 %57 
					                               Uniform f32* %59 = OpAccessChain %32 %54 %41 
					                                        f32 %60 = OpLoad %59 
					                                        f32 %61 = OpFNegate %60 
					                                        f32 %62 = OpFAdd %58 %61 
					                                                    OpStore %51 %62 
					                               Private f32* %66 = OpAccessChain %9 %26 
					                                        f32 %67 = OpLoad %66 
					                                       bool %69 = OpFOrdLessThan %67 %68 
					                                                    OpStore %65 %69 
					                                       bool %70 = OpLoad %65 
					                                        f32 %72 = OpSelect %70 %46 %71 
					                               Private f32* %73 = OpAccessChain %9 %26 
					                                                    OpStore %73 %72 
					                                        f32 %74 = OpLoad %51 
					                               Uniform f32* %76 = OpAccessChain %32 %75 
					                                        f32 %77 = OpLoad %76 
					                                        f32 %78 = OpFMul %74 %77 
					                                                    OpStore %51 %78 
					                                        f32 %80 = OpLoad %51 
					                                        f32 %81 = OpLoad %51 
					                                        f32 %82 = OpFNegate %81 
					                                        f32 %83 = OpFMul %80 %82 
					                                                    OpStore %79 %83 
					                                        f32 %84 = OpLoad %79 
					                                        f32 %85 = OpExtInst %1 29 %84 
					                                                    OpStore %79 %85 
					                                        f32 %86 = OpLoad %79 
					                                        f32 %87 = OpFNegate %86 
					                                        f32 %88 = OpFAdd %87 %46 
					                                                    OpStore %79 %88 
					                               Private f32* %89 = OpAccessChain %9 %26 
					                                        f32 %90 = OpLoad %89 
					                                        f32 %91 = OpLoad %79 
					                                        f32 %92 = OpFMul %90 %91 
					                               Private f32* %93 = OpAccessChain %9 %26 
					                                                    OpStore %93 %92 
					                        read_only Texture2D %96 = OpLoad %95 
					                                    sampler %98 = OpLoad %97 
					                 read_only Texture2DSampled %99 = OpSampledImage %96 %98 
					                                     f32_2 %100 = OpLoad vs_TEXCOORD0 
					                                     f32_4 %101 = OpImageSampleImplicitLod %99 %100 
					                                                    OpStore %94 %101 
					                                     f32_4 %103 = OpLoad %94 
					                                     f32_4 %104 = OpFNegate %103 
					                            Uniform f32_4* %107 = OpAccessChain %32 %105 
					                                     f32_4 %108 = OpLoad %107 
					                                     f32_4 %109 = OpFAdd %104 %108 
					                                                    OpStore %102 %109 
					                                     f32_4 %110 = OpLoad %9 
					                                     f32_4 %111 = OpVectorShuffle %110 %110 0 0 0 0 
					                                     f32_4 %112 = OpLoad %102 
					                                     f32_4 %113 = OpFMul %111 %112 
					                                     f32_4 %114 = OpLoad %94 
					                                     f32_4 %115 = OpFAdd %113 %114 
					                                                    OpStore %9 %115 
					                                     f32_4 %118 = OpLoad %9 
					                                                    OpStore %117 %118 
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
						vec4 unused_0_0[4];
						vec4 _FogColor;
						float _Density;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2;
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0 = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlat3 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
					    u_xlatb0 = u_xlat0<0.999899983;
					    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat3 = u_xlat3 * _Density;
					    u_xlat3 = u_xlat3 * (-u_xlat3);
					    u_xlat3 = exp2(u_xlat3);
					    u_xlat3 = (-u_xlat3) + 1.0;
					    u_xlat0 = u_xlat0 * u_xlat3;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = (-u_xlat10_1) + _FogColor;
					    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat10_1;
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