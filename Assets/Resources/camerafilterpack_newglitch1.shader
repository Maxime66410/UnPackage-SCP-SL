Shader "CameraFilterPack/CameraFilterPack_NewGlitch1" {
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
			GpuProgramID 62776
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
					uniform 	float Seed;
					uniform 	float Size;
					uniform 	vec4 _ScreenResolution;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = Seed + 55.5499992;
					    u_xlat0.x = u_xlat0.x / _ScreenResolution.y;
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat2.x = Size * u_xlat0.x + 0.00999999978;
					    u_xlat4.x = float(1.0) / u_xlat2.x;
					    u_xlat4.xy = vs_TEXCOORD0.xy * u_xlat4.xx + vec2(0.5, 0.5);
					    u_xlat4.xy = floor(u_xlat4.xy);
					    u_xlat4.xy = u_xlat2.xx * u_xlat4.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat4.xy);
					    u_xlat16_1 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_1 = u_xlat10_1.z + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat16_1) * 0.333333343 + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat0.x = u_xlat0.x * u_xlat16_1;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat2.x = u_xlat0.x * u_xlat2.x;
					    u_xlat1.x = float(1.0) / u_xlat2.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * u_xlat1.xx + vec2(0.5, 0.5);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat2.xy = (-u_xlat1.xy) * u_xlat2.xx + u_xlat4.xy;
					    u_xlat0.xy = u_xlat2.xy * u_xlat0.xx + vs_TEXCOORD0.xy;
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
					; Bound: 151
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %55 %144 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpMemberDecorate %11 1 Offset 11 
					                                             OpMemberDecorate %11 2 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD0 Location 55 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %74 DescriptorSet 74 
					                                             OpDecorate %74 Binding 74 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %78 DescriptorSet 78 
					                                             OpDecorate %78 Binding 78 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %144 Location 144 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
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
					                                 i32 %27 = OpConstant 2 
					                                 u32 %28 = OpConstant 1 
					                                 f32 %35 = OpConstant 3,674022E-40 
					                      Private f32_2* %38 = OpVariable Private 
					                                 i32 %39 = OpConstant 1 
					                                 f32 %45 = OpConstant 3,674022E-40 
					                      Private f32_2* %48 = OpVariable Private 
					                                 f32 %49 = OpConstant 3,674022E-40 
					                                     %54 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 f32 %60 = OpConstant 3,674022E-40 
					                               f32_2 %61 = OpConstantComposite %60 %60 
					                                     %69 = OpTypeVector %6 3 
					                                     %70 = OpTypePointer Private %69 
					                      Private f32_3* %71 = OpVariable Private 
					                                     %72 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %73 = OpTypePointer UniformConstant %72 
					UniformConstant read_only Texture2D* %74 = OpVariable UniformConstant 
					                                     %76 = OpTypeSampler 
					                                     %77 = OpTypePointer UniformConstant %76 
					            UniformConstant sampler* %78 = OpVariable UniformConstant 
					                                     %80 = OpTypeSampledImage %72 
					                        Private f32* %85 = OpVariable Private 
					                                 u32 %91 = OpConstant 2 
					                                 f32 %98 = OpConstant 3,674022E-40 
					                     Private f32_2* %118 = OpVariable Private 
					                                    %143 = OpTypePointer Output %10 
					                      Output f32_4* %144 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                        Uniform f32* %17 = OpAccessChain %13 %15 
					                                 f32 %18 = OpLoad %17 
					                                 f32 %20 = OpFAdd %18 %19 
					                        Private f32* %24 = OpAccessChain %9 %22 
					                                             OpStore %24 %20 
					                        Private f32* %25 = OpAccessChain %9 %22 
					                                 f32 %26 = OpLoad %25 
					                        Uniform f32* %29 = OpAccessChain %13 %27 %28 
					                                 f32 %30 = OpLoad %29 
					                                 f32 %31 = OpFDiv %26 %30 
					                        Private f32* %32 = OpAccessChain %9 %22 
					                                             OpStore %32 %31 
					                        Private f32* %33 = OpAccessChain %9 %22 
					                                 f32 %34 = OpLoad %33 
					                                 f32 %36 = OpFMul %34 %35 
					                        Private f32* %37 = OpAccessChain %9 %22 
					                                             OpStore %37 %36 
					                        Uniform f32* %40 = OpAccessChain %13 %39 
					                                 f32 %41 = OpLoad %40 
					                        Private f32* %42 = OpAccessChain %9 %22 
					                                 f32 %43 = OpLoad %42 
					                                 f32 %44 = OpFMul %41 %43 
					                                 f32 %46 = OpFAdd %44 %45 
					                        Private f32* %47 = OpAccessChain %38 %22 
					                                             OpStore %47 %46 
					                        Private f32* %50 = OpAccessChain %38 %22 
					                                 f32 %51 = OpLoad %50 
					                                 f32 %52 = OpFDiv %49 %51 
					                        Private f32* %53 = OpAccessChain %48 %22 
					                                             OpStore %53 %52 
					                               f32_2 %56 = OpLoad vs_TEXCOORD0 
					                               f32_2 %57 = OpLoad %48 
					                               f32_2 %58 = OpVectorShuffle %57 %57 0 0 
					                               f32_2 %59 = OpFMul %56 %58 
					                               f32_2 %62 = OpFAdd %59 %61 
					                                             OpStore %48 %62 
					                               f32_2 %63 = OpLoad %48 
					                               f32_2 %64 = OpExtInst %1 8 %63 
					                                             OpStore %48 %64 
					                               f32_2 %65 = OpLoad %38 
					                               f32_2 %66 = OpVectorShuffle %65 %65 0 0 
					                               f32_2 %67 = OpLoad %48 
					                               f32_2 %68 = OpFMul %66 %67 
					                                             OpStore %48 %68 
					                 read_only Texture2D %75 = OpLoad %74 
					                             sampler %79 = OpLoad %78 
					          read_only Texture2DSampled %81 = OpSampledImage %75 %79 
					                               f32_2 %82 = OpLoad %48 
					                               f32_4 %83 = OpImageSampleImplicitLod %81 %82 
					                               f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
					                                             OpStore %71 %84 
					                        Private f32* %86 = OpAccessChain %71 %28 
					                                 f32 %87 = OpLoad %86 
					                        Private f32* %88 = OpAccessChain %71 %22 
					                                 f32 %89 = OpLoad %88 
					                                 f32 %90 = OpFAdd %87 %89 
					                                             OpStore %85 %90 
					                        Private f32* %92 = OpAccessChain %71 %91 
					                                 f32 %93 = OpLoad %92 
					                                 f32 %94 = OpLoad %85 
					                                 f32 %95 = OpFAdd %93 %94 
					                                             OpStore %85 %95 
					                                 f32 %96 = OpLoad %85 
					                                 f32 %97 = OpFNegate %96 
					                                 f32 %99 = OpFMul %97 %98 
					                                f32 %100 = OpFAdd %99 %49 
					                                             OpStore %85 %100 
					                                f32 %101 = OpLoad %85 
					                                f32 %102 = OpExtInst %1 30 %101 
					                                             OpStore %85 %102 
					                       Private f32* %103 = OpAccessChain %9 %22 
					                                f32 %104 = OpLoad %103 
					                                f32 %105 = OpLoad %85 
					                                f32 %106 = OpFMul %104 %105 
					                       Private f32* %107 = OpAccessChain %9 %22 
					                                             OpStore %107 %106 
					                       Private f32* %108 = OpAccessChain %9 %22 
					                                f32 %109 = OpLoad %108 
					                                f32 %110 = OpExtInst %1 29 %109 
					                       Private f32* %111 = OpAccessChain %9 %22 
					                                             OpStore %111 %110 
					                       Private f32* %112 = OpAccessChain %9 %22 
					                                f32 %113 = OpLoad %112 
					                       Private f32* %114 = OpAccessChain %38 %22 
					                                f32 %115 = OpLoad %114 
					                                f32 %116 = OpFMul %113 %115 
					                       Private f32* %117 = OpAccessChain %38 %22 
					                                             OpStore %117 %116 
					                       Private f32* %119 = OpAccessChain %38 %22 
					                                f32 %120 = OpLoad %119 
					                                f32 %121 = OpFDiv %49 %120 
					                       Private f32* %122 = OpAccessChain %118 %22 
					                                             OpStore %122 %121 
					                              f32_2 %123 = OpLoad vs_TEXCOORD0 
					                              f32_2 %124 = OpLoad %118 
					                              f32_2 %125 = OpVectorShuffle %124 %124 0 0 
					                              f32_2 %126 = OpFMul %123 %125 
					                              f32_2 %127 = OpFAdd %126 %61 
					                                             OpStore %118 %127 
					                              f32_2 %128 = OpLoad %118 
					                              f32_2 %129 = OpExtInst %1 8 %128 
					                                             OpStore %118 %129 
					                              f32_2 %130 = OpLoad %118 
					                              f32_2 %131 = OpFNegate %130 
					                              f32_2 %132 = OpLoad %38 
					                              f32_2 %133 = OpVectorShuffle %132 %132 0 0 
					                              f32_2 %134 = OpFMul %131 %133 
					                              f32_2 %135 = OpLoad %48 
					                              f32_2 %136 = OpFAdd %134 %135 
					                                             OpStore %38 %136 
					                              f32_2 %137 = OpLoad %38 
					                              f32_2 %138 = OpLoad %9 
					                              f32_2 %139 = OpVectorShuffle %138 %138 0 0 
					                              f32_2 %140 = OpFMul %137 %139 
					                              f32_2 %141 = OpLoad vs_TEXCOORD0 
					                              f32_2 %142 = OpFAdd %140 %141 
					                                             OpStore %9 %142 
					                read_only Texture2D %145 = OpLoad %74 
					                            sampler %146 = OpLoad %78 
					         read_only Texture2DSampled %147 = OpSampledImage %145 %146 
					                              f32_2 %148 = OpLoad %9 
					                              f32_4 %149 = OpImageSampleImplicitLod %147 %148 
					                                             OpStore %144 %149 
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
						float Seed;
						float Size;
						vec4 _ScreenResolution;
						vec4 unused_0_4;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = Seed + 55.5499992;
					    u_xlat0.x = u_xlat0.x / _ScreenResolution.y;
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat2.x = Size * u_xlat0.x + 0.00999999978;
					    u_xlat4.x = float(1.0) / u_xlat2.x;
					    u_xlat4.xy = vs_TEXCOORD0.xy * u_xlat4.xx + vec2(0.5, 0.5);
					    u_xlat4.xy = floor(u_xlat4.xy);
					    u_xlat4.xy = u_xlat2.xx * u_xlat4.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat4.xy);
					    u_xlat16_1 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_1 = u_xlat10_1.z + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat16_1) * 0.333333343 + 1.0;
					    u_xlat16_1 = log2(u_xlat16_1);
					    u_xlat0.x = u_xlat0.x * u_xlat16_1;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat2.x = u_xlat0.x * u_xlat2.x;
					    u_xlat1.x = float(1.0) / u_xlat2.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * u_xlat1.xx + vec2(0.5, 0.5);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat2.xy = (-u_xlat1.xy) * u_xlat2.xx + u_xlat4.xy;
					    u_xlat0.xy = u_xlat2.xy * u_xlat0.xx + vs_TEXCOORD0.xy;
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