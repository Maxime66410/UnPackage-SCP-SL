Shader "CameraFilterPack/Colors_NewPosterize" {
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
			GpuProgramID 64293
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
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat3;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = log2(u_xlat10_0.xyz);
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(vec3(_Value, _Value, _Value));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz / vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat3 = float(1.0) / _Value;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.y = u_xlat0.y * _Value3;
					    SV_Target0.xz = u_xlat0.xz * vec2(0.398999989, 0.31400001);
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
					; Bound: 132
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %12 %110 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpDecorate vs_TEXCOORD0 Location 12 
					                                                OpMemberDecorate %15 0 Offset 15 
					                                                OpMemberDecorate %15 1 Offset 15 
					                                                OpMemberDecorate %15 2 Offset 15 
					                                                OpMemberDecorate %15 3 RelaxedPrecision 
					                                                OpMemberDecorate %15 3 Offset 15 
					                                                OpDecorate %15 Block 
					                                                OpDecorate %17 DescriptorSet 17 
					                                                OpDecorate %17 Binding 17 
					                                                OpDecorate %22 RelaxedPrecision 
					                                                OpDecorate %23 RelaxedPrecision 
					                                                OpDecorate %26 RelaxedPrecision 
					                                                OpDecorate %27 RelaxedPrecision 
					                                                OpDecorate %31 RelaxedPrecision 
					                                                OpDecorate %34 RelaxedPrecision 
					                                                OpDecorate %34 DescriptorSet 34 
					                                                OpDecorate %34 Binding 34 
					                                                OpDecorate %35 RelaxedPrecision 
					                                                OpDecorate %38 RelaxedPrecision 
					                                                OpDecorate %38 DescriptorSet 38 
					                                                OpDecorate %38 Binding 38 
					                                                OpDecorate %39 RelaxedPrecision 
					                                                OpDecorate %45 RelaxedPrecision 
					                                                OpDecorate %46 RelaxedPrecision 
					                                                OpDecorate %47 RelaxedPrecision 
					                                                OpDecorate %48 RelaxedPrecision 
					                                                OpDecorate %49 RelaxedPrecision 
					                                                OpDecorate %58 RelaxedPrecision 
					                                                OpDecorate %59 RelaxedPrecision 
					                                                OpDecorate %60 RelaxedPrecision 
					                                                OpDecorate %61 RelaxedPrecision 
					                                                OpDecorate %62 RelaxedPrecision 
					                                                OpDecorate %63 RelaxedPrecision 
					                                                OpDecorate %110 Location 110 
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
					                                        %15 = OpTypeStruct %6 %6 %6 %14 
					                                        %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                        %18 = OpTypeInt 32 1 
					                                    i32 %19 = OpConstant 3 
					                                        %20 = OpTypePointer Uniform %14 
					                         Private f32_3* %31 = OpVariable Private 
					                                        %32 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %33 = OpTypePointer UniformConstant %32 
					   UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
					                                        %36 = OpTypeSampler 
					                                        %37 = OpTypePointer UniformConstant %36 
					               UniformConstant sampler* %38 = OpVariable UniformConstant 
					                                        %40 = OpTypeSampledImage %32 
					                         Private f32_3* %46 = OpVariable Private 
					                                    i32 %50 = OpConstant 0 
					                                        %51 = OpTypePointer Uniform %6 
					                                    i32 %67 = OpConstant 1 
					                                        %97 = OpTypePointer Private %6 
					                           Private f32* %98 = OpVariable Private 
					                                    f32 %99 = OpConstant 3,674022E-40 
					                                       %109 = OpTypePointer Output %14 
					                         Output f32_4* %110 = OpVariable Output 
					                                       %111 = OpTypeInt 32 0 
					                                   u32 %112 = OpConstant 1 
					                                   i32 %115 = OpConstant 2 
					                                       %119 = OpTypePointer Output %6 
					                                   f32 %123 = OpConstant 3,674022E-40 
					                                   f32 %124 = OpConstant 3,674022E-40 
					                                 f32_2 %125 = OpConstantComposite %123 %124 
					                                   u32 %129 = OpConstant 3 
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
					                    read_only Texture2D %35 = OpLoad %34 
					                                sampler %39 = OpLoad %38 
					             read_only Texture2DSampled %41 = OpSampledImage %35 %39 
					                                  f32_3 %42 = OpLoad %9 
					                                  f32_2 %43 = OpVectorShuffle %42 %42 0 1 
					                                  f32_4 %44 = OpImageSampleImplicitLod %41 %43 
					                                  f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
					                                                OpStore %31 %45 
					                                  f32_3 %47 = OpLoad %31 
					                                  f32_3 %48 = OpExtInst %1 30 %47 
					                                                OpStore %46 %48 
					                                  f32_3 %49 = OpLoad %46 
					                           Uniform f32* %52 = OpAccessChain %17 %50 
					                                    f32 %53 = OpLoad %52 
					                           Uniform f32* %54 = OpAccessChain %17 %50 
					                                    f32 %55 = OpLoad %54 
					                           Uniform f32* %56 = OpAccessChain %17 %50 
					                                    f32 %57 = OpLoad %56 
					                                  f32_3 %58 = OpCompositeConstruct %53 %55 %57 
					                                    f32 %59 = OpCompositeExtract %58 0 
					                                    f32 %60 = OpCompositeExtract %58 1 
					                                    f32 %61 = OpCompositeExtract %58 2 
					                                  f32_3 %62 = OpCompositeConstruct %59 %60 %61 
					                                  f32_3 %63 = OpFMul %49 %62 
					                                                OpStore %9 %63 
					                                  f32_3 %64 = OpLoad %9 
					                                  f32_3 %65 = OpExtInst %1 29 %64 
					                                                OpStore %9 %65 
					                                  f32_3 %66 = OpLoad %9 
					                           Uniform f32* %68 = OpAccessChain %17 %67 
					                                    f32 %69 = OpLoad %68 
					                           Uniform f32* %70 = OpAccessChain %17 %67 
					                                    f32 %71 = OpLoad %70 
					                           Uniform f32* %72 = OpAccessChain %17 %67 
					                                    f32 %73 = OpLoad %72 
					                                  f32_3 %74 = OpCompositeConstruct %69 %71 %73 
					                                    f32 %75 = OpCompositeExtract %74 0 
					                                    f32 %76 = OpCompositeExtract %74 1 
					                                    f32 %77 = OpCompositeExtract %74 2 
					                                  f32_3 %78 = OpCompositeConstruct %75 %76 %77 
					                                  f32_3 %79 = OpFMul %66 %78 
					                                                OpStore %9 %79 
					                                  f32_3 %80 = OpLoad %9 
					                                  f32_3 %81 = OpExtInst %1 8 %80 
					                                                OpStore %9 %81 
					                                  f32_3 %82 = OpLoad %9 
					                           Uniform f32* %83 = OpAccessChain %17 %67 
					                                    f32 %84 = OpLoad %83 
					                           Uniform f32* %85 = OpAccessChain %17 %67 
					                                    f32 %86 = OpLoad %85 
					                           Uniform f32* %87 = OpAccessChain %17 %67 
					                                    f32 %88 = OpLoad %87 
					                                  f32_3 %89 = OpCompositeConstruct %84 %86 %88 
					                                    f32 %90 = OpCompositeExtract %89 0 
					                                    f32 %91 = OpCompositeExtract %89 1 
					                                    f32 %92 = OpCompositeExtract %89 2 
					                                  f32_3 %93 = OpCompositeConstruct %90 %91 %92 
					                                  f32_3 %94 = OpFDiv %82 %93 
					                                                OpStore %9 %94 
					                                  f32_3 %95 = OpLoad %9 
					                                  f32_3 %96 = OpExtInst %1 30 %95 
					                                                OpStore %9 %96 
					                          Uniform f32* %100 = OpAccessChain %17 %50 
					                                   f32 %101 = OpLoad %100 
					                                   f32 %102 = OpFDiv %99 %101 
					                                                OpStore %98 %102 
					                                 f32_3 %103 = OpLoad %9 
					                                   f32 %104 = OpLoad %98 
					                                 f32_3 %105 = OpCompositeConstruct %104 %104 %104 
					                                 f32_3 %106 = OpFMul %103 %105 
					                                                OpStore %9 %106 
					                                 f32_3 %107 = OpLoad %9 
					                                 f32_3 %108 = OpExtInst %1 29 %107 
					                                                OpStore %9 %108 
					                          Private f32* %113 = OpAccessChain %9 %112 
					                                   f32 %114 = OpLoad %113 
					                          Uniform f32* %116 = OpAccessChain %17 %115 
					                                   f32 %117 = OpLoad %116 
					                                   f32 %118 = OpFMul %114 %117 
					                           Output f32* %120 = OpAccessChain %110 %112 
					                                                OpStore %120 %118 
					                                 f32_3 %121 = OpLoad %9 
					                                 f32_2 %122 = OpVectorShuffle %121 %121 0 2 
					                                 f32_2 %126 = OpFMul %122 %125 
					                                 f32_4 %127 = OpLoad %110 
					                                 f32_4 %128 = OpVectorShuffle %127 %126 4 1 5 3 
					                                                OpStore %110 %128 
					                           Output f32* %130 = OpAccessChain %110 %129 
					                                                OpStore %130 %99 
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
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat3;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = log2(u_xlat10_0.xyz);
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(vec3(_Value, _Value, _Value));
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz / vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat3 = float(1.0) / _Value;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    SV_Target0.y = u_xlat0.y * _Value3;
					    SV_Target0.xz = u_xlat0.xz * vec2(0.398999989, 0.31400001);
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