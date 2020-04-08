Shader "CameraFilterPack/Lut_PlayWith" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 53989
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
					uniform 	float _Intensity;
					uniform 	float _Extra;
					uniform 	float _Extra2;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat10_0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity)) + vec3(vec3(_Extra, _Extra, _Extra));
					    u_xlat10_1 = texture(_LutTex, u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
					    u_xlat1.xyz = (-u_xlat10_0.xyz) * vec3(vec3(_Intensity, _Intensity, _Intensity)) + u_xlat1.xyz;
					    u_xlat0 = u_xlat10_0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
					    SV_Target0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
					    SV_Target0.w = u_xlat0.w;
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
					; Bound: 142
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %22 %122 
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
					                                              OpDecorate %28 RelaxedPrecision 
					                                              OpDecorate %29 RelaxedPrecision 
					                                              OpMemberDecorate %30 0 Offset 30 
					                                              OpMemberDecorate %30 1 Offset 30 
					                                              OpMemberDecorate %30 2 Offset 30 
					                                              OpMemberDecorate %30 3 Offset 30 
					                                              OpDecorate %30 Block 
					                                              OpDecorate %32 DescriptorSet 32 
					                                              OpDecorate %32 Binding 32 
					                                              OpDecorate %42 RelaxedPrecision 
					                                              OpDecorate %43 RelaxedPrecision 
					                                              OpDecorate %44 RelaxedPrecision 
					                                              OpDecorate %45 RelaxedPrecision 
					                                              OpDecorate %46 RelaxedPrecision 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %55 RelaxedPrecision 
					                                              OpDecorate %56 RelaxedPrecision 
					                                              OpDecorate %57 RelaxedPrecision 
					                                              OpDecorate %58 RelaxedPrecision 
					                                              OpDecorate %59 RelaxedPrecision 
					                                              OpDecorate %60 RelaxedPrecision 
					                                              OpDecorate %61 RelaxedPrecision 
					                                              OpDecorate %64 RelaxedPrecision 
					                                              OpDecorate %64 DescriptorSet 64 
					                                              OpDecorate %64 Binding 64 
					                                              OpDecorate %65 RelaxedPrecision 
					                                              OpDecorate %66 RelaxedPrecision 
					                                              OpDecorate %66 DescriptorSet 66 
					                                              OpDecorate %66 Binding 66 
					                                              OpDecorate %67 RelaxedPrecision 
					                                              OpDecorate %72 RelaxedPrecision 
					                                              OpDecorate %73 RelaxedPrecision 
					                                              OpDecorate %81 RelaxedPrecision 
					                                              OpDecorate %82 RelaxedPrecision 
					                                              OpDecorate %83 RelaxedPrecision 
					                                              OpDecorate %84 RelaxedPrecision 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %88 RelaxedPrecision 
					                                              OpDecorate %89 RelaxedPrecision 
					                                              OpDecorate %96 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %99 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %114 RelaxedPrecision 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %117 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %120 RelaxedPrecision 
					                                              OpDecorate %122 Location 122 
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
					                                      %25 = OpTypeVector %6 3 
					                                      %26 = OpTypePointer Private %25 
					                       Private f32_3* %27 = OpVariable Private 
					                                      %30 = OpTypeStruct %6 %6 %6 %6 
					                                      %31 = OpTypePointer Uniform %30 
					Uniform struct {f32; f32; f32; f32;}* %32 = OpVariable Uniform 
					                                      %33 = OpTypeInt 32 1 
					                                  i32 %34 = OpConstant 1 
					                                      %35 = OpTypePointer Uniform %6 
					                                  i32 %48 = OpConstant 2 
					                       Private f32_3* %61 = OpVariable Private 
					                                      %62 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
					                                      %63 = OpTypePointer UniformConstant %62 
					 UniformConstant read_only Texture3D* %64 = OpVariable UniformConstant 
					             UniformConstant sampler* %66 = OpVariable UniformConstant 
					                                      %68 = OpTypeSampledImage %62 
					                                  i32 %74 = OpConstant 3 
					                      Private f32_4* %104 = OpVariable Private 
					                                     %121 = OpTypePointer Output %7 
					                       Output f32_4* %122 = OpVariable Output 
					                                 i32 %123 = OpConstant 0 
					                                     %134 = OpTypeInt 32 0 
					                                 u32 %135 = OpConstant 3 
					                                     %136 = OpTypePointer Private %6 
					                                     %139 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                  read_only Texture2D %13 = OpLoad %12 
					                              sampler %17 = OpLoad %16 
					           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                              OpStore %9 %24 
					                                f32_4 %28 = OpLoad %9 
					                                f32_3 %29 = OpVectorShuffle %28 %28 0 1 2 
					                         Uniform f32* %36 = OpAccessChain %32 %34 
					                                  f32 %37 = OpLoad %36 
					                         Uniform f32* %38 = OpAccessChain %32 %34 
					                                  f32 %39 = OpLoad %38 
					                         Uniform f32* %40 = OpAccessChain %32 %34 
					                                  f32 %41 = OpLoad %40 
					                                f32_3 %42 = OpCompositeConstruct %37 %39 %41 
					                                  f32 %43 = OpCompositeExtract %42 0 
					                                  f32 %44 = OpCompositeExtract %42 1 
					                                  f32 %45 = OpCompositeExtract %42 2 
					                                f32_3 %46 = OpCompositeConstruct %43 %44 %45 
					                                f32_3 %47 = OpFMul %29 %46 
					                         Uniform f32* %49 = OpAccessChain %32 %48 
					                                  f32 %50 = OpLoad %49 
					                         Uniform f32* %51 = OpAccessChain %32 %48 
					                                  f32 %52 = OpLoad %51 
					                         Uniform f32* %53 = OpAccessChain %32 %48 
					                                  f32 %54 = OpLoad %53 
					                                f32_3 %55 = OpCompositeConstruct %50 %52 %54 
					                                  f32 %56 = OpCompositeExtract %55 0 
					                                  f32 %57 = OpCompositeExtract %55 1 
					                                  f32 %58 = OpCompositeExtract %55 2 
					                                f32_3 %59 = OpCompositeConstruct %56 %57 %58 
					                                f32_3 %60 = OpFAdd %47 %59 
					                                              OpStore %27 %60 
					                  read_only Texture3D %65 = OpLoad %64 
					                              sampler %67 = OpLoad %66 
					           read_only Texture3DSampled %69 = OpSampledImage %65 %67 
					                                f32_3 %70 = OpLoad %27 
					                                f32_4 %71 = OpImageSampleImplicitLod %69 %70 
					                                f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
					                                              OpStore %61 %72 
					                                f32_3 %73 = OpLoad %61 
					                         Uniform f32* %75 = OpAccessChain %32 %74 
					                                  f32 %76 = OpLoad %75 
					                         Uniform f32* %77 = OpAccessChain %32 %74 
					                                  f32 %78 = OpLoad %77 
					                         Uniform f32* %79 = OpAccessChain %32 %74 
					                                  f32 %80 = OpLoad %79 
					                                f32_3 %81 = OpCompositeConstruct %76 %78 %80 
					                                  f32 %82 = OpCompositeExtract %81 0 
					                                  f32 %83 = OpCompositeExtract %81 1 
					                                  f32 %84 = OpCompositeExtract %81 2 
					                                f32_3 %85 = OpCompositeConstruct %82 %83 %84 
					                                f32_3 %86 = OpFAdd %73 %85 
					                                              OpStore %27 %86 
					                                f32_4 %87 = OpLoad %9 
					                                f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
					                                f32_3 %89 = OpFNegate %88 
					                         Uniform f32* %90 = OpAccessChain %32 %34 
					                                  f32 %91 = OpLoad %90 
					                         Uniform f32* %92 = OpAccessChain %32 %34 
					                                  f32 %93 = OpLoad %92 
					                         Uniform f32* %94 = OpAccessChain %32 %34 
					                                  f32 %95 = OpLoad %94 
					                                f32_3 %96 = OpCompositeConstruct %91 %93 %95 
					                                  f32 %97 = OpCompositeExtract %96 0 
					                                  f32 %98 = OpCompositeExtract %96 1 
					                                  f32 %99 = OpCompositeExtract %96 2 
					                               f32_3 %100 = OpCompositeConstruct %97 %98 %99 
					                               f32_3 %101 = OpFMul %89 %100 
					                               f32_3 %102 = OpLoad %27 
					                               f32_3 %103 = OpFAdd %101 %102 
					                                              OpStore %27 %103 
					                               f32_4 %105 = OpLoad %9 
					                        Uniform f32* %106 = OpAccessChain %32 %34 
					                                 f32 %107 = OpLoad %106 
					                        Uniform f32* %108 = OpAccessChain %32 %34 
					                                 f32 %109 = OpLoad %108 
					                        Uniform f32* %110 = OpAccessChain %32 %34 
					                                 f32 %111 = OpLoad %110 
					                        Uniform f32* %112 = OpAccessChain %32 %34 
					                                 f32 %113 = OpLoad %112 
					                               f32_4 %114 = OpCompositeConstruct %107 %109 %111 %113 
					                                 f32 %115 = OpCompositeExtract %114 0 
					                                 f32 %116 = OpCompositeExtract %114 1 
					                                 f32 %117 = OpCompositeExtract %114 2 
					                                 f32 %118 = OpCompositeExtract %114 3 
					                               f32_4 %119 = OpCompositeConstruct %115 %116 %117 %118 
					                               f32_4 %120 = OpFMul %105 %119 
					                                              OpStore %104 %120 
					                        Uniform f32* %124 = OpAccessChain %32 %123 
					                                 f32 %125 = OpLoad %124 
					                               f32_3 %126 = OpCompositeConstruct %125 %125 %125 
					                               f32_3 %127 = OpLoad %27 
					                               f32_3 %128 = OpFMul %126 %127 
					                               f32_4 %129 = OpLoad %104 
					                               f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
					                               f32_3 %131 = OpFAdd %128 %130 
					                               f32_4 %132 = OpLoad %122 
					                               f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
					                                              OpStore %122 %133 
					                        Private f32* %137 = OpAccessChain %104 %135 
					                                 f32 %138 = OpLoad %137 
					                         Output f32* %140 = OpAccessChain %122 %135 
					                                              OpStore %140 %138 
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
						float _Intensity;
						float _Extra;
						float _Extra2;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat10_0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity)) + vec3(vec3(_Extra, _Extra, _Extra));
					    u_xlat10_1 = texture(_LutTex, u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
					    u_xlat1.xyz = (-u_xlat10_0.xyz) * vec3(vec3(_Intensity, _Intensity, _Intensity)) + u_xlat1.xyz;
					    u_xlat0 = u_xlat10_0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
					    SV_Target0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
					    SV_Target0.w = u_xlat0.w;
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
			GpuProgramID 111919
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
					uniform 	float _Intensity;
					uniform 	float _Extra;
					uniform 	float _Extra2;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(vec3(_Extra, _Extra, _Extra));
					    u_xlat10_1 = texture(_LutTex, u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					    u_xlat0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
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
					; Bound: 130
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %22 %55 
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
					                                              OpMemberDecorate %27 0 Offset 27 
					                                              OpMemberDecorate %27 1 Offset 27 
					                                              OpMemberDecorate %27 2 Offset 27 
					                                              OpMemberDecorate %27 3 Offset 27 
					                                              OpDecorate %27 Block 
					                                              OpDecorate %29 DescriptorSet 29 
					                                              OpDecorate %29 Binding 29 
					                                              OpDecorate %41 RelaxedPrecision 
					                                              OpDecorate %42 RelaxedPrecision 
					                                              OpDecorate %43 RelaxedPrecision 
					                                              OpDecorate %44 RelaxedPrecision 
					                                              OpDecorate %45 RelaxedPrecision 
					                                              OpDecorate %46 RelaxedPrecision 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %55 Location 55 
					                                              OpDecorate %80 RelaxedPrecision 
					                                              OpDecorate %83 RelaxedPrecision 
					                                              OpDecorate %83 DescriptorSet 83 
					                                              OpDecorate %83 Binding 83 
					                                              OpDecorate %84 RelaxedPrecision 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %85 DescriptorSet 85 
					                                              OpDecorate %85 Binding 85 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %91 RelaxedPrecision 
					                                              OpDecorate %92 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %102 RelaxedPrecision 
					                                              OpDecorate %103 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
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
					                       Private f32_4* %25 = OpVariable Private 
					                                      %27 = OpTypeStruct %6 %6 %6 %6 
					                                      %28 = OpTypePointer Uniform %27 
					Uniform struct {f32; f32; f32; f32;}* %29 = OpVariable Uniform 
					                                      %30 = OpTypeInt 32 1 
					                                  i32 %31 = OpConstant 1 
					                                      %32 = OpTypePointer Uniform %6 
					                                      %48 = OpTypeVector %6 3 
					                                      %54 = OpTypePointer Output %7 
					                        Output f32_4* %55 = OpVariable Output 
					                                      %56 = OpTypeInt 32 0 
					                                  u32 %57 = OpConstant 3 
					                                      %58 = OpTypePointer Private %6 
					                                      %61 = OpTypePointer Output %6 
					                                      %63 = OpTypePointer Private %48 
					                       Private f32_3* %64 = OpVariable Private 
					                                  i32 %67 = OpConstant 2 
					                       Private f32_3* %80 = OpVariable Private 
					                                      %81 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
					                                      %82 = OpTypePointer UniformConstant %81 
					 UniformConstant read_only Texture3D* %83 = OpVariable UniformConstant 
					             UniformConstant sampler* %85 = OpVariable UniformConstant 
					                                      %87 = OpTypeSampledImage %81 
					                                  i32 %93 = OpConstant 3 
					                                 i32 %111 = OpConstant 0 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                  read_only Texture2D %13 = OpLoad %12 
					                              sampler %17 = OpLoad %16 
					           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                              OpStore %9 %24 
					                                f32_4 %26 = OpLoad %9 
					                         Uniform f32* %33 = OpAccessChain %29 %31 
					                                  f32 %34 = OpLoad %33 
					                         Uniform f32* %35 = OpAccessChain %29 %31 
					                                  f32 %36 = OpLoad %35 
					                         Uniform f32* %37 = OpAccessChain %29 %31 
					                                  f32 %38 = OpLoad %37 
					                         Uniform f32* %39 = OpAccessChain %29 %31 
					                                  f32 %40 = OpLoad %39 
					                                f32_4 %41 = OpCompositeConstruct %34 %36 %38 %40 
					                                  f32 %42 = OpCompositeExtract %41 0 
					                                  f32 %43 = OpCompositeExtract %41 1 
					                                  f32 %44 = OpCompositeExtract %41 2 
					                                  f32 %45 = OpCompositeExtract %41 3 
					                                f32_4 %46 = OpCompositeConstruct %42 %43 %44 %45 
					                                f32_4 %47 = OpFMul %26 %46 
					                                              OpStore %25 %47 
					                                f32_4 %49 = OpLoad %25 
					                                f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
					                                f32_3 %51 = OpExtInst %1 31 %50 
					                                f32_4 %52 = OpLoad %25 
					                                f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
					                                              OpStore %25 %53 
					                         Private f32* %59 = OpAccessChain %25 %57 
					                                  f32 %60 = OpLoad %59 
					                          Output f32* %62 = OpAccessChain %55 %57 
					                                              OpStore %62 %60 
					                                f32_4 %65 = OpLoad %25 
					                                f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
					                         Uniform f32* %68 = OpAccessChain %29 %67 
					                                  f32 %69 = OpLoad %68 
					                         Uniform f32* %70 = OpAccessChain %29 %67 
					                                  f32 %71 = OpLoad %70 
					                         Uniform f32* %72 = OpAccessChain %29 %67 
					                                  f32 %73 = OpLoad %72 
					                                f32_3 %74 = OpCompositeConstruct %69 %71 %73 
					                                  f32 %75 = OpCompositeExtract %74 0 
					                                  f32 %76 = OpCompositeExtract %74 1 
					                                  f32 %77 = OpCompositeExtract %74 2 
					                                f32_3 %78 = OpCompositeConstruct %75 %76 %77 
					                                f32_3 %79 = OpFAdd %66 %78 
					                                              OpStore %64 %79 
					                  read_only Texture3D %84 = OpLoad %83 
					                              sampler %86 = OpLoad %85 
					           read_only Texture3DSampled %88 = OpSampledImage %84 %86 
					                                f32_3 %89 = OpLoad %64 
					                                f32_4 %90 = OpImageSampleImplicitLod %88 %89 
					                                f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
					                                              OpStore %80 %91 
					                                f32_3 %92 = OpLoad %80 
					                         Uniform f32* %94 = OpAccessChain %29 %93 
					                                  f32 %95 = OpLoad %94 
					                         Uniform f32* %96 = OpAccessChain %29 %93 
					                                  f32 %97 = OpLoad %96 
					                         Uniform f32* %98 = OpAccessChain %29 %93 
					                                  f32 %99 = OpLoad %98 
					                               f32_3 %100 = OpCompositeConstruct %95 %97 %99 
					                                 f32 %101 = OpCompositeExtract %100 0 
					                                 f32 %102 = OpCompositeExtract %100 1 
					                                 f32 %103 = OpCompositeExtract %100 2 
					                               f32_3 %104 = OpCompositeConstruct %101 %102 %103 
					                               f32_3 %105 = OpFAdd %92 %104 
					                                              OpStore %64 %105 
					                               f32_4 %106 = OpLoad %25 
					                               f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
					                               f32_3 %108 = OpFNegate %107 
					                               f32_3 %109 = OpLoad %64 
					                               f32_3 %110 = OpFAdd %108 %109 
					                                              OpStore %64 %110 
					                        Uniform f32* %112 = OpAccessChain %29 %111 
					                                 f32 %113 = OpLoad %112 
					                               f32_3 %114 = OpCompositeConstruct %113 %113 %113 
					                               f32_3 %115 = OpLoad %64 
					                               f32_3 %116 = OpFMul %114 %115 
					                               f32_4 %117 = OpLoad %25 
					                               f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
					                               f32_3 %119 = OpFAdd %116 %118 
					                               f32_4 %120 = OpLoad %25 
					                               f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
					                                              OpStore %25 %121 
					                               f32_4 %122 = OpLoad %25 
					                               f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
					                               f32_4 %124 = OpLoad %25 
					                               f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
					                               f32_3 %126 = OpFMul %123 %125 
					                               f32_4 %127 = OpLoad %55 
					                               f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
					                                              OpStore %55 %128 
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
						float _Intensity;
						float _Extra;
						float _Extra2;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(vec3(_Extra, _Extra, _Extra));
					    u_xlat10_1 = texture(_LutTex, u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					    u_xlat0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
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