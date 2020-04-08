Shader "CameraFilterPack/Lut_Mask" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1817
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	float _Blend;
					uniform 	float _Inverse;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MaskTex;
					UNITY_LOCATION(2) uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					void main()
					{
					    u_xlat10_0 = texture(_MaskTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat10_0.x * -2.0 + 1.0;
					    u_xlat0 = _Inverse * u_xlat16_3.x + u_xlat10_0.x;
					    u_xlat0 = u_xlat0 * _Blend;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_2 = texture(_LutTex, u_xlat10_1.xyz);
					    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
					    SV_Target0.xyz = vec3(u_xlat0) * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 94
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %70 0 BuiltIn 70 
					                                              OpMemberDecorate %70 1 BuiltIn 70 
					                                              OpMemberDecorate %70 2 BuiltIn 70 
					                                              OpDecorate %70 Block 
					                                              OpDecorate vs_TEXCOORD0 Location 84 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %86 Location 86 
					                                              OpDecorate %87 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                         Input f32_4* %11 = OpVariable Input 
					                                      %14 = OpTypeInt 32 0 
					                                  u32 %15 = OpConstant 4 
					                                      %16 = OpTypeArray %7 %15 
					                                      %17 = OpTypeArray %7 %15 
					                                      %18 = OpTypeStruct %16 %17 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
					                                      %21 = OpTypeInt 32 1 
					                                  i32 %22 = OpConstant 0 
					                                  i32 %23 = OpConstant 1 
					                                      %24 = OpTypePointer Uniform %7 
					                                  i32 %35 = OpConstant 2 
					                                  i32 %44 = OpConstant 3 
					                       Private f32_4* %48 = OpVariable Private 
					                                  u32 %68 = OpConstant 1 
					                                      %69 = OpTypeArray %6 %68 
					                                      %70 = OpTypeStruct %7 %6 %69 
					                                      %71 = OpTypePointer Output %70 
					 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                      %80 = OpTypePointer Output %7 
					                                      %82 = OpTypeVector %6 2 
					                                      %83 = OpTypePointer Output %82 
					               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                      %85 = OpTypePointer Input %82 
					                         Input f32_2* %86 = OpVariable Input 
					                                      %88 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                                f32_4 %12 = OpLoad %11 
					                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                f32_4 %26 = OpLoad %25 
					                                f32_4 %27 = OpFMul %13 %26 
					                                              OpStore %9 %27 
					                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                f32_4 %29 = OpLoad %28 
					                                f32_4 %30 = OpLoad %11 
					                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                f32_4 %32 = OpFMul %29 %31 
					                                f32_4 %33 = OpLoad %9 
					                                f32_4 %34 = OpFAdd %32 %33 
					                                              OpStore %9 %34 
					                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                f32_4 %37 = OpLoad %36 
					                                f32_4 %38 = OpLoad %11 
					                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                f32_4 %40 = OpFMul %37 %39 
					                                f32_4 %41 = OpLoad %9 
					                                f32_4 %42 = OpFAdd %40 %41 
					                                              OpStore %9 %42 
					                                f32_4 %43 = OpLoad %9 
					                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                f32_4 %46 = OpLoad %45 
					                                f32_4 %47 = OpFAdd %43 %46 
					                                              OpStore %9 %47 
					                                f32_4 %49 = OpLoad %9 
					                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                f32_4 %52 = OpLoad %51 
					                                f32_4 %53 = OpFMul %50 %52 
					                                              OpStore %48 %53 
					                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                f32_4 %55 = OpLoad %54 
					                                f32_4 %56 = OpLoad %9 
					                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                f32_4 %58 = OpFMul %55 %57 
					                                f32_4 %59 = OpLoad %48 
					                                f32_4 %60 = OpFAdd %58 %59 
					                                              OpStore %48 %60 
					                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                f32_4 %62 = OpLoad %61 
					                                f32_4 %63 = OpLoad %9 
					                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                f32_4 %65 = OpFMul %62 %64 
					                                f32_4 %66 = OpLoad %48 
					                                f32_4 %67 = OpFAdd %65 %66 
					                                              OpStore %48 %67 
					                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                f32_4 %74 = OpLoad %73 
					                                f32_4 %75 = OpLoad %9 
					                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                f32_4 %77 = OpFMul %74 %76 
					                                f32_4 %78 = OpLoad %48 
					                                f32_4 %79 = OpFAdd %77 %78 
					                        Output f32_4* %81 = OpAccessChain %72 %22 
					                                              OpStore %81 %79 
					                                f32_2 %87 = OpLoad %86 
					                                              OpStore vs_TEXCOORD0 %87 
					                          Output f32* %89 = OpAccessChain %72 %22 %68 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                          Output f32* %92 = OpAccessChain %72 %22 %68 
					                                              OpStore %92 %91 
					                                              OpReturn
					                                              OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 100
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %21 %84 
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
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpMemberDecorate %38 0 Offset 38 
					                                             OpMemberDecorate %38 1 Offset 38 
					                                             OpDecorate %38 Block 
					                                             OpDecorate %40 DescriptorSet 40 
					                                             OpDecorate %40 Binding 40 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %58 DescriptorSet 58 
					                                             OpDecorate %58 Binding 58 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %60 DescriptorSet 60 
					                                             OpDecorate %60 Binding 60 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %68 DescriptorSet 68 
					                                             OpDecorate %68 Binding 68 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %70 DescriptorSet 70 
					                                             OpDecorate %70 Binding 70 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %84 Location 84 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
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
					                                     %28 = OpTypeVector %6 3 
					                                     %29 = OpTypePointer Private %28 
					                      Private f32_3* %30 = OpVariable Private 
					                                 f32 %32 = OpConstant 3,674022E-40 
					                                 f32 %34 = OpConstant 3,674022E-40 
					                        Private f32* %37 = OpVariable Private 
					                                     %38 = OpTypeStruct %6 %6 
					                                     %39 = OpTypePointer Uniform %38 
					         Uniform struct {f32; f32;}* %40 = OpVariable Uniform 
					                                     %41 = OpTypeInt 32 1 
					                                 i32 %42 = OpConstant 1 
					                                     %43 = OpTypePointer Uniform %6 
					                                 i32 %52 = OpConstant 0 
					                                     %56 = OpTypePointer Private %23 
					                      Private f32_4* %57 = OpVariable Private 
					UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
					            UniformConstant sampler* %60 = OpVariable UniformConstant 
					                      Private f32_3* %65 = OpVariable Private 
					                                     %66 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
					                                     %67 = OpTypePointer UniformConstant %66 
					UniformConstant read_only Texture3D* %68 = OpVariable UniformConstant 
					            UniformConstant sampler* %70 = OpVariable UniformConstant 
					                                     %72 = OpTypeSampledImage %66 
					                                     %83 = OpTypePointer Output %23 
					                       Output f32_4* %84 = OpVariable Output 
					                                 u32 %94 = OpConstant 3 
					                                     %97 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %12 = OpLoad %11 
					                             sampler %16 = OpLoad %15 
					          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                               f32_2 %22 = OpLoad vs_TEXCOORD0 
					                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
					                                 f32 %27 = OpCompositeExtract %24 0 
					                                             OpStore %8 %27 
					                                 f32 %31 = OpLoad %8 
					                                 f32 %33 = OpFMul %31 %32 
					                                 f32 %35 = OpFAdd %33 %34 
					                        Private f32* %36 = OpAccessChain %30 %26 
					                                             OpStore %36 %35 
					                        Uniform f32* %44 = OpAccessChain %40 %42 
					                                 f32 %45 = OpLoad %44 
					                        Private f32* %46 = OpAccessChain %30 %26 
					                                 f32 %47 = OpLoad %46 
					                                 f32 %48 = OpFMul %45 %47 
					                                 f32 %49 = OpLoad %8 
					                                 f32 %50 = OpFAdd %48 %49 
					                                             OpStore %37 %50 
					                                 f32 %51 = OpLoad %37 
					                        Uniform f32* %53 = OpAccessChain %40 %52 
					                                 f32 %54 = OpLoad %53 
					                                 f32 %55 = OpFMul %51 %54 
					                                             OpStore %37 %55 
					                 read_only Texture2D %59 = OpLoad %58 
					                             sampler %61 = OpLoad %60 
					          read_only Texture2DSampled %62 = OpSampledImage %59 %61 
					                               f32_2 %63 = OpLoad vs_TEXCOORD0 
					                               f32_4 %64 = OpImageSampleImplicitLod %62 %63 
					                                             OpStore %57 %64 
					                 read_only Texture3D %69 = OpLoad %68 
					                             sampler %71 = OpLoad %70 
					          read_only Texture3DSampled %73 = OpSampledImage %69 %71 
					                               f32_4 %74 = OpLoad %57 
					                               f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
					                               f32_4 %76 = OpImageSampleImplicitLod %73 %75 
					                               f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
					                                             OpStore %65 %77 
					                               f32_4 %78 = OpLoad %57 
					                               f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
					                               f32_3 %80 = OpFNegate %79 
					                               f32_3 %81 = OpLoad %65 
					                               f32_3 %82 = OpFAdd %80 %81 
					                                             OpStore %30 %82 
					                                 f32 %85 = OpLoad %37 
					                               f32_3 %86 = OpCompositeConstruct %85 %85 %85 
					                               f32_3 %87 = OpLoad %30 
					                               f32_3 %88 = OpFMul %86 %87 
					                               f32_4 %89 = OpLoad %57 
					                               f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
					                               f32_3 %91 = OpFAdd %88 %90 
					                               f32_4 %92 = OpLoad %84 
					                               f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
					                                             OpStore %84 %93 
					                        Private f32* %95 = OpAccessChain %57 %94 
					                                 f32 %96 = OpLoad %95 
					                         Output f32* %98 = OpAccessChain %84 %94 
					                                             OpStore %98 %96 
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
						float _Blend;
						float _Inverse;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MaskTex;
					uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					void main()
					{
					    u_xlat10_0 = texture(_MaskTex, vs_TEXCOORD0.xy);
					    u_xlat16_3.x = u_xlat10_0.x * -2.0 + 1.0;
					    u_xlat0 = _Inverse * u_xlat16_3.x + u_xlat10_0.x;
					    u_xlat0 = u_xlat0 * _Blend;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_2 = texture(_LutTex, u_xlat10_1.xyz);
					    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
					    SV_Target0.xyz = vec3(u_xlat0) * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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
			GpuProgramID 129977
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	float _Blend;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MaskTex;
					UNITY_LOCATION(2) uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_MaskTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat10_0.x * _Blend;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = sqrt(u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat10_1 = texture(_LutTex, u_xlat2.xyz);
					    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 94
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %70 0 BuiltIn 70 
					                                              OpMemberDecorate %70 1 BuiltIn 70 
					                                              OpMemberDecorate %70 2 BuiltIn 70 
					                                              OpDecorate %70 Block 
					                                              OpDecorate vs_TEXCOORD0 Location 84 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %86 Location 86 
					                                              OpDecorate %87 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                         Input f32_4* %11 = OpVariable Input 
					                                      %14 = OpTypeInt 32 0 
					                                  u32 %15 = OpConstant 4 
					                                      %16 = OpTypeArray %7 %15 
					                                      %17 = OpTypeArray %7 %15 
					                                      %18 = OpTypeStruct %16 %17 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
					                                      %21 = OpTypeInt 32 1 
					                                  i32 %22 = OpConstant 0 
					                                  i32 %23 = OpConstant 1 
					                                      %24 = OpTypePointer Uniform %7 
					                                  i32 %35 = OpConstant 2 
					                                  i32 %44 = OpConstant 3 
					                       Private f32_4* %48 = OpVariable Private 
					                                  u32 %68 = OpConstant 1 
					                                      %69 = OpTypeArray %6 %68 
					                                      %70 = OpTypeStruct %7 %6 %69 
					                                      %71 = OpTypePointer Output %70 
					 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                      %80 = OpTypePointer Output %7 
					                                      %82 = OpTypeVector %6 2 
					                                      %83 = OpTypePointer Output %82 
					               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                      %85 = OpTypePointer Input %82 
					                         Input f32_2* %86 = OpVariable Input 
					                                      %88 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                                f32_4 %12 = OpLoad %11 
					                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                f32_4 %26 = OpLoad %25 
					                                f32_4 %27 = OpFMul %13 %26 
					                                              OpStore %9 %27 
					                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                f32_4 %29 = OpLoad %28 
					                                f32_4 %30 = OpLoad %11 
					                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                f32_4 %32 = OpFMul %29 %31 
					                                f32_4 %33 = OpLoad %9 
					                                f32_4 %34 = OpFAdd %32 %33 
					                                              OpStore %9 %34 
					                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                f32_4 %37 = OpLoad %36 
					                                f32_4 %38 = OpLoad %11 
					                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                f32_4 %40 = OpFMul %37 %39 
					                                f32_4 %41 = OpLoad %9 
					                                f32_4 %42 = OpFAdd %40 %41 
					                                              OpStore %9 %42 
					                                f32_4 %43 = OpLoad %9 
					                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                f32_4 %46 = OpLoad %45 
					                                f32_4 %47 = OpFAdd %43 %46 
					                                              OpStore %9 %47 
					                                f32_4 %49 = OpLoad %9 
					                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                f32_4 %52 = OpLoad %51 
					                                f32_4 %53 = OpFMul %50 %52 
					                                              OpStore %48 %53 
					                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                f32_4 %55 = OpLoad %54 
					                                f32_4 %56 = OpLoad %9 
					                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                f32_4 %58 = OpFMul %55 %57 
					                                f32_4 %59 = OpLoad %48 
					                                f32_4 %60 = OpFAdd %58 %59 
					                                              OpStore %48 %60 
					                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                f32_4 %62 = OpLoad %61 
					                                f32_4 %63 = OpLoad %9 
					                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                f32_4 %65 = OpFMul %62 %64 
					                                f32_4 %66 = OpLoad %48 
					                                f32_4 %67 = OpFAdd %65 %66 
					                                              OpStore %48 %67 
					                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                f32_4 %74 = OpLoad %73 
					                                f32_4 %75 = OpLoad %9 
					                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                f32_4 %77 = OpFMul %74 %76 
					                                f32_4 %78 = OpLoad %48 
					                                f32_4 %79 = OpFAdd %77 %78 
					                        Output f32_4* %81 = OpAccessChain %72 %22 
					                                              OpStore %81 %79 
					                                f32_2 %87 = OpLoad %86 
					                                              OpStore vs_TEXCOORD0 %87 
					                          Output f32* %89 = OpAccessChain %72 %22 %68 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                          Output f32* %92 = OpAccessChain %72 %22 %68 
					                                              OpStore %92 %91 
					                                              OpReturn
					                                              OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 93
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %21 %56 
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
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpMemberDecorate %32 0 Offset 32 
					                                             OpDecorate %32 Block 
					                                             OpDecorate %34 DescriptorSet 34 
					                                             OpDecorate %34 Binding 34 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %44 DescriptorSet 44 
					                                             OpDecorate %44 Binding 44 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %46 DescriptorSet 46 
					                                             OpDecorate %46 Binding 46 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %56 Location 56 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %64 DescriptorSet 64 
					                                             OpDecorate %64 Binding 64 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %66 DescriptorSet 66 
					                                             OpDecorate %66 Binding 66 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
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
					                                     %28 = OpTypeVector %6 3 
					                                     %29 = OpTypePointer Private %28 
					                      Private f32_3* %30 = OpVariable Private 
					                                     %32 = OpTypeStruct %6 
					                                     %33 = OpTypePointer Uniform %32 
					              Uniform struct {f32;}* %34 = OpVariable Uniform 
					                                     %35 = OpTypeInt 32 1 
					                                 i32 %36 = OpConstant 0 
					                                     %37 = OpTypePointer Uniform %6 
					                                     %42 = OpTypePointer Private %23 
					                      Private f32_4* %43 = OpVariable Private 
					UniformConstant read_only Texture2D* %44 = OpVariable UniformConstant 
					            UniformConstant sampler* %46 = OpVariable UniformConstant 
					                      Private f32_3* %51 = OpVariable Private 
					                                     %55 = OpTypePointer Output %23 
					                       Output f32_4* %56 = OpVariable Output 
					                                 u32 %57 = OpConstant 3 
					                                     %60 = OpTypePointer Output %6 
					                                     %62 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
					                                     %63 = OpTypePointer UniformConstant %62 
					UniformConstant read_only Texture3D* %64 = OpVariable UniformConstant 
					            UniformConstant sampler* %66 = OpVariable UniformConstant 
					                                     %68 = OpTypeSampledImage %62 
					                      Private f32_3* %75 = OpVariable Private 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %12 = OpLoad %11 
					                             sampler %16 = OpLoad %15 
					          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                               f32_2 %22 = OpLoad vs_TEXCOORD0 
					                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
					                                 f32 %27 = OpCompositeExtract %24 0 
					                                             OpStore %8 %27 
					                                 f32 %31 = OpLoad %8 
					                        Uniform f32* %38 = OpAccessChain %34 %36 
					                                 f32 %39 = OpLoad %38 
					                                 f32 %40 = OpFMul %31 %39 
					                        Private f32* %41 = OpAccessChain %30 %26 
					                                             OpStore %41 %40 
					                 read_only Texture2D %45 = OpLoad %44 
					                             sampler %47 = OpLoad %46 
					          read_only Texture2DSampled %48 = OpSampledImage %45 %47 
					                               f32_2 %49 = OpLoad vs_TEXCOORD0 
					                               f32_4 %50 = OpImageSampleImplicitLod %48 %49 
					                                             OpStore %43 %50 
					                               f32_4 %52 = OpLoad %43 
					                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
					                               f32_3 %54 = OpExtInst %1 31 %53 
					                                             OpStore %51 %54 
					                        Private f32* %58 = OpAccessChain %43 %57 
					                                 f32 %59 = OpLoad %58 
					                         Output f32* %61 = OpAccessChain %56 %57 
					                                             OpStore %61 %59 
					                 read_only Texture3D %65 = OpLoad %64 
					                             sampler %67 = OpLoad %66 
					          read_only Texture3DSampled %69 = OpSampledImage %65 %67 
					                               f32_3 %70 = OpLoad %51 
					                               f32_4 %71 = OpImageSampleImplicitLod %69 %70 
					                               f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
					                               f32_4 %73 = OpLoad %43 
					                               f32_4 %74 = OpVectorShuffle %73 %72 4 5 6 3 
					                                             OpStore %43 %74 
					                               f32_3 %76 = OpLoad %51 
					                               f32_3 %77 = OpFNegate %76 
					                               f32_4 %78 = OpLoad %43 
					                               f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
					                               f32_3 %80 = OpFAdd %77 %79 
					                                             OpStore %75 %80 
					                               f32_3 %81 = OpLoad %30 
					                               f32_3 %82 = OpVectorShuffle %81 %81 0 0 0 
					                               f32_3 %83 = OpLoad %75 
					                               f32_3 %84 = OpFMul %82 %83 
					                               f32_3 %85 = OpLoad %51 
					                               f32_3 %86 = OpFAdd %84 %85 
					                                             OpStore %30 %86 
					                               f32_3 %87 = OpLoad %30 
					                               f32_3 %88 = OpLoad %30 
					                               f32_3 %89 = OpFMul %87 %88 
					                               f32_4 %90 = OpLoad %56 
					                               f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
					                                             OpStore %56 %91 
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
						float _Blend;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MaskTex;
					uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_MaskTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat10_0.x * _Blend;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = sqrt(u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat10_1 = texture(_LutTex, u_xlat2.xyz);
					    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat0.xyz;
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