Shader "CameraFilterPack/Noise_TV_2" {
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
			GpuProgramID 40856
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D Texture2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat16_2;
					float u_xlat9;
					void main()
					{
					    u_xlat0.yz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = vec2(_TimeX) * vec2(10.0, 0.5) + u_xlat0.yz;
					    u_xlat10_1 = texture(Texture2, u_xlat1.xy);
					    u_xlat9 = u_xlat10_1.x * _Value3;
					    u_xlat0.x = u_xlat9 * 0.03125 + u_xlat0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xz);
					    u_xlat16_2 = (-u_xlat10_0) + u_xlat10_1;
					    u_xlat0 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat16_2 + u_xlat10_0;
					    SV_Target0 = vec4(vec4(_Value2, _Value2, _Value2, _Value2)) * u_xlat10_1 + u_xlat0;
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
					; Bound: 130
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %12 %109 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate vs_TEXCOORD0 Location 12 
					                                                     OpMemberDecorate %14 0 Offset 14 
					                                                     OpMemberDecorate %14 1 Offset 14 
					                                                     OpMemberDecorate %14 2 Offset 14 
					                                                     OpMemberDecorate %14 3 Offset 14 
					                                                     OpMemberDecorate %14 4 RelaxedPrecision 
					                                                     OpMemberDecorate %14 4 Offset 14 
					                                                     OpDecorate %14 Block 
					                                                     OpDecorate %16 DescriptorSet 16 
					                                                     OpDecorate %16 Binding 16 
					                                                     OpDecorate %21 RelaxedPrecision 
					                                                     OpDecorate %22 RelaxedPrecision 
					                                                     OpDecorate %25 RelaxedPrecision 
					                                                     OpDecorate %26 RelaxedPrecision 
					                                                     OpDecorate %44 RelaxedPrecision 
					                                                     OpDecorate %47 RelaxedPrecision 
					                                                     OpDecorate %47 DescriptorSet 47 
					                                                     OpDecorate %47 Binding 47 
					                                                     OpDecorate %48 RelaxedPrecision 
					                                                     OpDecorate %51 RelaxedPrecision 
					                                                     OpDecorate %51 DescriptorSet 51 
					                                                     OpDecorate %51 Binding 51 
					                                                     OpDecorate %52 RelaxedPrecision 
					                                                     OpDecorate %62 RelaxedPrecision 
					                                                     OpDecorate %75 RelaxedPrecision 
					                                                     OpDecorate %76 RelaxedPrecision 
					                                                     OpDecorate %76 DescriptorSet 76 
					                                                     OpDecorate %76 Binding 76 
					                                                     OpDecorate %77 RelaxedPrecision 
					                                                     OpDecorate %78 RelaxedPrecision 
					                                                     OpDecorate %78 DescriptorSet 78 
					                                                     OpDecorate %78 Binding 78 
					                                                     OpDecorate %79 RelaxedPrecision 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %109 Location 109 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                                     OpDecorate %120 RelaxedPrecision 
					                                                     OpDecorate %121 RelaxedPrecision 
					                                                     OpDecorate %122 RelaxedPrecision 
					                                                     OpDecorate %123 RelaxedPrecision 
					                                                     OpDecorate %124 RelaxedPrecision 
					                                                     OpDecorate %125 RelaxedPrecision 
					                                                     OpDecorate %126 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypeVector %6 2 
					                                             %11 = OpTypePointer Input %10 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                             %14 = OpTypeStruct %6 %6 %6 %6 %7 
					                                             %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                             %17 = OpTypeInt 32 1 
					                                         i32 %18 = OpConstant 4 
					                                             %19 = OpTypePointer Uniform %7 
					                                             %30 = OpTypePointer Private %10 
					                              Private f32_2* %31 = OpVariable Private 
					                                         i32 %32 = OpConstant 0 
					                                             %33 = OpTypePointer Uniform %6 
					                                         f32 %37 = OpConstant 3,674022E-40 
					                                         f32 %38 = OpConstant 3,674022E-40 
					                                       f32_2 %39 = OpConstantComposite %37 %38 
					                              Private f32_4* %44 = OpVariable Private 
					                                             %45 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %46 = OpTypePointer UniformConstant %45 
					        UniformConstant read_only Texture2D* %47 = OpVariable UniformConstant 
					                                             %49 = OpTypeSampler 
					                                             %50 = OpTypePointer UniformConstant %49 
					                    UniformConstant sampler* %51 = OpVariable UniformConstant 
					                                             %53 = OpTypeSampledImage %45 
					                                             %57 = OpTypePointer Private %6 
					                                Private f32* %58 = OpVariable Private 
					                                             %59 = OpTypeInt 32 0 
					                                         u32 %60 = OpConstant 0 
					                                         i32 %63 = OpConstant 3 
					                                         f32 %68 = OpConstant 3,674022E-40 
					                                         u32 %70 = OpConstant 1 
					                              Private f32_4* %75 = OpVariable Private 
					        UniformConstant read_only Texture2D* %76 = OpVariable UniformConstant 
					                    UniformConstant sampler* %78 = OpVariable UniformConstant 
					                              Private f32_4* %84 = OpVariable Private 
					                                         i32 %89 = OpConstant 1 
					                                            %108 = OpTypePointer Output %7 
					                              Output f32_4* %109 = OpVariable Output 
					                                        i32 %110 = OpConstant 2 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_2 %13 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %20 = OpAccessChain %16 %18 
					                                       f32_4 %21 = OpLoad %20 
					                                       f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                                       f32_2 %23 = OpFMul %13 %22 
					                              Uniform f32_4* %24 = OpAccessChain %16 %18 
					                                       f32_4 %25 = OpLoad %24 
					                                       f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                                       f32_2 %27 = OpFAdd %23 %26 
					                                       f32_4 %28 = OpLoad %9 
					                                       f32_4 %29 = OpVectorShuffle %28 %27 0 4 5 3 
					                                                     OpStore %9 %29 
					                                Uniform f32* %34 = OpAccessChain %16 %32 
					                                         f32 %35 = OpLoad %34 
					                                       f32_2 %36 = OpCompositeConstruct %35 %35 
					                                       f32_2 %40 = OpFMul %36 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_2 %42 = OpVectorShuffle %41 %41 1 2 
					                                       f32_2 %43 = OpFAdd %40 %42 
					                                                     OpStore %31 %43 
					                         read_only Texture2D %48 = OpLoad %47 
					                                     sampler %52 = OpLoad %51 
					                  read_only Texture2DSampled %54 = OpSampledImage %48 %52 
					                                       f32_2 %55 = OpLoad %31 
					                                       f32_4 %56 = OpImageSampleImplicitLod %54 %55 
					                                                     OpStore %44 %56 
					                                Private f32* %61 = OpAccessChain %44 %60 
					                                         f32 %62 = OpLoad %61 
					                                Uniform f32* %64 = OpAccessChain %16 %63 
					                                         f32 %65 = OpLoad %64 
					                                         f32 %66 = OpFMul %62 %65 
					                                                     OpStore %58 %66 
					                                         f32 %67 = OpLoad %58 
					                                         f32 %69 = OpFMul %67 %68 
					                                Private f32* %71 = OpAccessChain %9 %70 
					                                         f32 %72 = OpLoad %71 
					                                         f32 %73 = OpFAdd %69 %72 
					                                Private f32* %74 = OpAccessChain %9 %60 
					                                                     OpStore %74 %73 
					                         read_only Texture2D %77 = OpLoad %76 
					                                     sampler %79 = OpLoad %78 
					                  read_only Texture2DSampled %80 = OpSampledImage %77 %79 
					                                       f32_4 %81 = OpLoad %9 
					                                       f32_2 %82 = OpVectorShuffle %81 %81 0 2 
					                                       f32_4 %83 = OpImageSampleImplicitLod %80 %82 
					                                                     OpStore %75 %83 
					                                       f32_4 %85 = OpLoad %75 
					                                       f32_4 %86 = OpFNegate %85 
					                                       f32_4 %87 = OpLoad %44 
					                                       f32_4 %88 = OpFAdd %86 %87 
					                                                     OpStore %84 %88 
					                                Uniform f32* %90 = OpAccessChain %16 %89 
					                                         f32 %91 = OpLoad %90 
					                                Uniform f32* %92 = OpAccessChain %16 %89 
					                                         f32 %93 = OpLoad %92 
					                                Uniform f32* %94 = OpAccessChain %16 %89 
					                                         f32 %95 = OpLoad %94 
					                                Uniform f32* %96 = OpAccessChain %16 %89 
					                                         f32 %97 = OpLoad %96 
					                                       f32_4 %98 = OpCompositeConstruct %91 %93 %95 %97 
					                                         f32 %99 = OpCompositeExtract %98 0 
					                                        f32 %100 = OpCompositeExtract %98 1 
					                                        f32 %101 = OpCompositeExtract %98 2 
					                                        f32 %102 = OpCompositeExtract %98 3 
					                                      f32_4 %103 = OpCompositeConstruct %99 %100 %101 %102 
					                                      f32_4 %104 = OpLoad %84 
					                                      f32_4 %105 = OpFMul %103 %104 
					                                      f32_4 %106 = OpLoad %75 
					                                      f32_4 %107 = OpFAdd %105 %106 
					                                                     OpStore %9 %107 
					                               Uniform f32* %111 = OpAccessChain %16 %110 
					                                        f32 %112 = OpLoad %111 
					                               Uniform f32* %113 = OpAccessChain %16 %110 
					                                        f32 %114 = OpLoad %113 
					                               Uniform f32* %115 = OpAccessChain %16 %110 
					                                        f32 %116 = OpLoad %115 
					                               Uniform f32* %117 = OpAccessChain %16 %110 
					                                        f32 %118 = OpLoad %117 
					                                      f32_4 %119 = OpCompositeConstruct %112 %114 %116 %118 
					                                        f32 %120 = OpCompositeExtract %119 0 
					                                        f32 %121 = OpCompositeExtract %119 1 
					                                        f32 %122 = OpCompositeExtract %119 2 
					                                        f32 %123 = OpCompositeExtract %119 3 
					                                      f32_4 %124 = OpCompositeConstruct %120 %121 %122 %123 
					                                      f32_4 %125 = OpLoad %44 
					                                      f32_4 %126 = OpFMul %124 %125 
					                                      f32_4 %127 = OpLoad %9 
					                                      f32_4 %128 = OpFAdd %126 %127 
					                                                     OpStore %109 %128 
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
						float _Value;
						float _Value2;
						float _Value3;
						vec4 unused_0_5;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D Texture2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat16_2;
					float u_xlat9;
					void main()
					{
					    u_xlat0.yz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = vec2(_TimeX) * vec2(10.0, 0.5) + u_xlat0.yz;
					    u_xlat10_1 = texture(Texture2, u_xlat1.xy);
					    u_xlat9 = u_xlat10_1.x * _Value3;
					    u_xlat0.x = u_xlat9 * 0.03125 + u_xlat0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xz);
					    u_xlat16_2 = (-u_xlat10_0) + u_xlat10_1;
					    u_xlat0 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat16_2 + u_xlat10_0;
					    SV_Target0 = vec4(vec4(_Value2, _Value2, _Value2, _Value2)) * u_xlat10_1 + u_xlat0;
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