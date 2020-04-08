Shader "CameraFilterPack/TV_WideScreenVertical" {
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
			GpuProgramID 17840
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4 = (-u_xlat0.x) + 0.5;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = dot(vec2(u_xlat4), vec2(u_xlat4));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value);
					    u_xlat2 = float(1.0) / (-_Value2);
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat2) * u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * (-u_xlat10_1.xyz) + u_xlat10_1.xyz;
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
					; Bound: 112
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %96 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpMemberDecorate %14 2 RelaxedPrecision 
					                                             OpMemberDecorate %14 2 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %41 DescriptorSet 41 
					                                             OpDecorate %41 Binding 41 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %45 DescriptorSet 45 
					                                             OpDecorate %45 Binding 45 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %96 Location 96 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %6 %6 %13 
					                                     %15 = OpTypePointer Uniform %14 
					  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 2 
					                                     %19 = OpTypePointer Uniform %13 
					                                     %28 = OpTypePointer Private %6 
					                        Private f32* %29 = OpVariable Private 
					                                     %30 = OpTypeInt 32 0 
					                                 u32 %31 = OpConstant 0 
					                                 f32 %35 = OpConstant 3,674022E-40 
					                                     %37 = OpTypePointer Private %13 
					                      Private f32_4* %38 = OpVariable Private 
					                                     %39 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %40 = OpTypePointer UniformConstant %39 
					UniformConstant read_only Texture2D* %41 = OpVariable UniformConstant 
					                                     %43 = OpTypeSampler 
					                                     %44 = OpTypePointer UniformConstant %43 
					            UniformConstant sampler* %45 = OpVariable UniformConstant 
					                                     %47 = OpTypeSampledImage %39 
					                                     %51 = OpTypeVector %6 3 
					                                 i32 %63 = OpConstant 0 
					                                     %64 = OpTypePointer Uniform %6 
					                        Private f32* %69 = OpVariable Private 
					                                 f32 %70 = OpConstant 3,674022E-40 
					                                 i32 %71 = OpConstant 1 
					                                 f32 %80 = OpConstant 3,674022E-40 
					                                 f32 %83 = OpConstant 3,674022E-40 
					                                 f32 %85 = OpConstant 3,674022E-40 
					                                     %95 = OpTypePointer Output %13 
					                       Output f32_4* %96 = OpVariable Output 
					                                u32 %108 = OpConstant 3 
					                                    %109 = OpTypePointer Output %6 
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
					                        Private f32* %32 = OpAccessChain %9 %31 
					                                 f32 %33 = OpLoad %32 
					                                 f32 %34 = OpFNegate %33 
					                                 f32 %36 = OpFAdd %34 %35 
					                                             OpStore %29 %36 
					                 read_only Texture2D %42 = OpLoad %41 
					                             sampler %46 = OpLoad %45 
					          read_only Texture2DSampled %48 = OpSampledImage %42 %46 
					                               f32_2 %49 = OpLoad %9 
					                               f32_4 %50 = OpImageSampleImplicitLod %48 %49 
					                               f32_3 %52 = OpVectorShuffle %50 %50 0 1 2 
					                               f32_4 %53 = OpLoad %38 
					                               f32_4 %54 = OpVectorShuffle %53 %52 4 5 2 6 
					                                             OpStore %38 %54 
					                                 f32 %55 = OpLoad %29 
					                               f32_2 %56 = OpCompositeConstruct %55 %55 
					                                 f32 %57 = OpLoad %29 
					                               f32_2 %58 = OpCompositeConstruct %57 %57 
					                                 f32 %59 = OpDot %56 %58 
					                                             OpStore %29 %59 
					                                 f32 %60 = OpLoad %29 
					                                 f32 %61 = OpExtInst %1 31 %60 
					                                             OpStore %29 %61 
					                                 f32 %62 = OpLoad %29 
					                        Uniform f32* %65 = OpAccessChain %16 %63 
					                                 f32 %66 = OpLoad %65 
					                                 f32 %67 = OpFNegate %66 
					                                 f32 %68 = OpFAdd %62 %67 
					                                             OpStore %29 %68 
					                        Uniform f32* %72 = OpAccessChain %16 %71 
					                                 f32 %73 = OpLoad %72 
					                                 f32 %74 = OpFNegate %73 
					                                 f32 %75 = OpFDiv %70 %74 
					                                             OpStore %69 %75 
					                                 f32 %76 = OpLoad %29 
					                                 f32 %77 = OpLoad %69 
					                                 f32 %78 = OpFMul %76 %77 
					                                             OpStore %29 %78 
					                                 f32 %79 = OpLoad %29 
					                                 f32 %81 = OpExtInst %1 43 %79 %80 %70 
					                                             OpStore %29 %81 
					                                 f32 %82 = OpLoad %29 
					                                 f32 %84 = OpFMul %82 %83 
					                                 f32 %86 = OpFAdd %84 %85 
					                                             OpStore %69 %86 
					                                 f32 %87 = OpLoad %29 
					                                 f32 %88 = OpLoad %29 
					                                 f32 %89 = OpFMul %87 %88 
					                                             OpStore %29 %89 
					                                 f32 %90 = OpLoad %69 
					                                 f32 %91 = OpFNegate %90 
					                                 f32 %92 = OpLoad %29 
					                                 f32 %93 = OpFMul %91 %92 
					                                 f32 %94 = OpFAdd %93 %70 
					                                             OpStore %29 %94 
					                                 f32 %97 = OpLoad %29 
					                               f32_3 %98 = OpCompositeConstruct %97 %97 %97 
					                               f32_4 %99 = OpLoad %38 
					                              f32_3 %100 = OpVectorShuffle %99 %99 0 1 3 
					                              f32_3 %101 = OpFNegate %100 
					                              f32_3 %102 = OpFMul %98 %101 
					                              f32_4 %103 = OpLoad %38 
					                              f32_3 %104 = OpVectorShuffle %103 %103 0 1 3 
					                              f32_3 %105 = OpFAdd %102 %104 
					                              f32_4 %106 = OpLoad %96 
					                              f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
					                                             OpStore %96 %107 
					                        Output f32* %110 = OpAccessChain %96 %108 
					                                             OpStore %110 %70 
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
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4 = (-u_xlat0.x) + 0.5;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = dot(vec2(u_xlat4), vec2(u_xlat4));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value);
					    u_xlat2 = float(1.0) / (-_Value2);
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat2) * u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * (-u_xlat10_1.xyz) + u_xlat10_1.xyz;
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