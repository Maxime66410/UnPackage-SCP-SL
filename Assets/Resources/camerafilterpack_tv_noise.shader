Shader "CameraFilterPack/TV_Noise" {
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
			GpuProgramID 19479
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
					uniform 	float _Fade;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					void main()
					{
					    u_xlat0.x = _TimeX * 20.0;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat3.xy * vec2(1280.0, 720.0);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3.xy = floor(u_xlat1.xy);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.000781250012, 0.00138888892);
					    u_xlat0.xy = u_xlat0.xx * u_xlat3.xy;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Fade;
					    u_xlat16_1 = (-u_xlat10_2) + vec4(0.0, 0.0, 0.0, 1.0);
					    SV_Target0 = u_xlat0.xxxx * u_xlat16_1 + u_xlat10_2;
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
					; Bound: 116
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %31 %108 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpMemberDecorate %11 1 Offset 11 
					                                             OpMemberDecorate %11 2 RelaxedPrecision 
					                                             OpMemberDecorate %11 2 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD0 Location 31 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %37 RelaxedPrecision 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %53 DescriptorSet 53 
					                                             OpDecorate %53 Binding 53 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %57 DescriptorSet 57 
					                                             OpDecorate %57 Binding 57 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %108 Location 108 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
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
					                      Private f32_2* %29 = OpVariable Private 
					                                     %30 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %33 = OpConstant 2 
					                                     %34 = OpTypePointer Uniform %10 
					                      Private f32_2* %43 = OpVariable Private 
					                                 f32 %45 = OpConstant 3,674022E-40 
					                                 f32 %46 = OpConstant 3,674022E-40 
					                               f32_2 %47 = OpConstantComposite %45 %46 
					                                     %49 = OpTypePointer Private %10 
					                      Private f32_4* %50 = OpVariable Private 
					                                     %51 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %52 = OpTypePointer UniformConstant %51 
					UniformConstant read_only Texture2D* %53 = OpVariable UniformConstant 
					                                     %55 = OpTypeSampler 
					                                     %56 = OpTypePointer UniformConstant %55 
					            UniformConstant sampler* %57 = OpVariable UniformConstant 
					                                     %59 = OpTypeSampledImage %51 
					                                 f32 %66 = OpConstant 3,674022E-40 
					                                 f32 %67 = OpConstant 3,674022E-40 
					                               f32_2 %68 = OpConstantComposite %66 %67 
					                                 f32 %75 = OpConstant 3,674022E-40 
					                                 f32 %76 = OpConstant 3,674022E-40 
					                               f32_2 %77 = OpConstantComposite %75 %76 
					                                 f32 %86 = OpConstant 3,674022E-40 
					                                 i32 %95 = OpConstant 1 
					                     Private f32_4* %100 = OpVariable Private 
					                                f32 %103 = OpConstant 3,674022E-40 
					                                f32 %104 = OpConstant 3,674022E-40 
					                              f32_4 %105 = OpConstantComposite %103 %103 %103 %104 
					                                    %107 = OpTypePointer Output %10 
					                      Output f32_4* %108 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                        Uniform f32* %17 = OpAccessChain %13 %15 
					                                 f32 %18 = OpLoad %17 
					                                 f32 %20 = OpFMul %18 %19 
					                        Private f32* %24 = OpAccessChain %9 %22 
					                                             OpStore %24 %20 
					                        Private f32* %25 = OpAccessChain %9 %22 
					                                 f32 %26 = OpLoad %25 
					                                 f32 %27 = OpExtInst %1 8 %26 
					                        Private f32* %28 = OpAccessChain %9 %22 
					                                             OpStore %28 %27 
					                               f32_2 %32 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %35 = OpAccessChain %13 %33 
					                               f32_4 %36 = OpLoad %35 
					                               f32_2 %37 = OpVectorShuffle %36 %36 0 1 
					                               f32_2 %38 = OpFMul %32 %37 
					                      Uniform f32_4* %39 = OpAccessChain %13 %33 
					                               f32_4 %40 = OpLoad %39 
					                               f32_2 %41 = OpVectorShuffle %40 %40 2 3 
					                               f32_2 %42 = OpFAdd %38 %41 
					                                             OpStore %29 %42 
					                               f32_2 %44 = OpLoad %29 
					                               f32_2 %48 = OpFMul %44 %47 
					                                             OpStore %43 %48 
					                 read_only Texture2D %54 = OpLoad %53 
					                             sampler %58 = OpLoad %57 
					          read_only Texture2DSampled %60 = OpSampledImage %54 %58 
					                               f32_2 %61 = OpLoad %29 
					                               f32_4 %62 = OpImageSampleImplicitLod %60 %61 
					                                             OpStore %50 %62 
					                               f32_2 %63 = OpLoad %43 
					                               f32_2 %64 = OpExtInst %1 8 %63 
					                                             OpStore %29 %64 
					                               f32_2 %65 = OpLoad %29 
					                               f32_2 %69 = OpFMul %65 %68 
					                                             OpStore %29 %69 
					                               f32_2 %70 = OpLoad %9 
					                               f32_2 %71 = OpVectorShuffle %70 %70 0 0 
					                               f32_2 %72 = OpLoad %29 
					                               f32_2 %73 = OpFMul %71 %72 
					                                             OpStore %9 %73 
					                               f32_2 %74 = OpLoad %9 
					                                 f32 %78 = OpDot %74 %77 
					                        Private f32* %79 = OpAccessChain %9 %22 
					                                             OpStore %79 %78 
					                        Private f32* %80 = OpAccessChain %9 %22 
					                                 f32 %81 = OpLoad %80 
					                                 f32 %82 = OpExtInst %1 13 %81 
					                        Private f32* %83 = OpAccessChain %9 %22 
					                                             OpStore %83 %82 
					                        Private f32* %84 = OpAccessChain %9 %22 
					                                 f32 %85 = OpLoad %84 
					                                 f32 %87 = OpFMul %85 %86 
					                        Private f32* %88 = OpAccessChain %9 %22 
					                                             OpStore %88 %87 
					                        Private f32* %89 = OpAccessChain %9 %22 
					                                 f32 %90 = OpLoad %89 
					                                 f32 %91 = OpExtInst %1 10 %90 
					                        Private f32* %92 = OpAccessChain %9 %22 
					                                             OpStore %92 %91 
					                        Private f32* %93 = OpAccessChain %9 %22 
					                                 f32 %94 = OpLoad %93 
					                        Uniform f32* %96 = OpAccessChain %13 %95 
					                                 f32 %97 = OpLoad %96 
					                                 f32 %98 = OpFMul %94 %97 
					                        Private f32* %99 = OpAccessChain %9 %22 
					                                             OpStore %99 %98 
					                              f32_4 %101 = OpLoad %50 
					                              f32_4 %102 = OpFNegate %101 
					                              f32_4 %106 = OpFAdd %102 %105 
					                                             OpStore %100 %106 
					                              f32_2 %109 = OpLoad %9 
					                              f32_4 %110 = OpVectorShuffle %109 %109 0 0 0 0 
					                              f32_4 %111 = OpLoad %100 
					                              f32_4 %112 = OpFMul %110 %111 
					                              f32_4 %113 = OpLoad %50 
					                              f32_4 %114 = OpFAdd %112 %113 
					                                             OpStore %108 %114 
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
						float _Fade;
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					void main()
					{
					    u_xlat0.x = _TimeX * 20.0;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat3.xy * vec2(1280.0, 720.0);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3.xy = floor(u_xlat1.xy);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.000781250012, 0.00138888892);
					    u_xlat0.xy = u_xlat0.xx * u_xlat3.xy;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Fade;
					    u_xlat16_1 = (-u_xlat10_2) + vec4(0.0, 0.0, 0.0, 1.0);
					    SV_Target0 = u_xlat0.xxxx * u_xlat16_1 + u_xlat10_2;
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