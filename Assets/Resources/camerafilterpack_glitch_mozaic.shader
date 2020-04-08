Shader "CameraFilterPack/Glitch_Mozaic" {
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
			GpuProgramID 14697
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_2;
					float u_xlat3;
					float u_xlat16_3;
					vec2 u_xlat6;
					vec2 u_xlat7;
					void main()
					{
					    u_xlat0.x = _Value * 0.0399999991;
					    u_xlat3 = float(1.0) / u_xlat0.x;
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat6.xy * vec2(u_xlat3) + vec2(0.5, 0.5);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_3 = u_xlat10_2.y + u_xlat10_2.x;
					    u_xlat16_3 = u_xlat10_2.z + u_xlat16_3;
					    u_xlat16_3 = (-u_xlat16_3) * 0.333333343 + 1.0;
					    u_xlat16_3 = log2(u_xlat16_3);
					    u_xlat3 = u_xlat16_3 * _Value;
					    u_xlat3 = exp2(u_xlat3);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat7.x = float(1.0) / u_xlat0.x;
					    u_xlat7.xy = u_xlat6.xy * u_xlat7.xx + vec2(0.5, 0.5);
					    u_xlat7.xy = floor(u_xlat7.xy);
					    u_xlat1.xy = (-u_xlat7.xy) * u_xlat0.xx + u_xlat1.xy;
					    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat3) + u_xlat6.xy;
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
					; Bound: 137
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %32 %130 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpMemberDecorate %11 1 RelaxedPrecision 
					                                             OpMemberDecorate %11 1 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD0 Location 32 
					                                             OpDecorate %37 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %63 DescriptorSet 63 
					                                             OpDecorate %63 Binding 63 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %67 DescriptorSet 67 
					                                             OpDecorate %67 Binding 67 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %130 Location 130 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 4 
					                                     %11 = OpTypeStruct %6 %10 
					                                     %12 = OpTypePointer Uniform %11 
					       Uniform struct {f32; f32_4;}* %13 = OpVariable Uniform 
					                                     %14 = OpTypeInt 32 1 
					                                 i32 %15 = OpConstant 0 
					                                     %16 = OpTypePointer Uniform %6 
					                                 f32 %19 = OpConstant 3,674022E-40 
					                                     %21 = OpTypeInt 32 0 
					                                 u32 %22 = OpConstant 0 
					                                     %23 = OpTypePointer Private %6 
					                        Private f32* %25 = OpVariable Private 
					                                 f32 %26 = OpConstant 3,674022E-40 
					                      Private f32_2* %30 = OpVariable Private 
					                                     %31 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %34 = OpConstant 1 
					                                     %35 = OpTypePointer Uniform %10 
					                      Private f32_2* %44 = OpVariable Private 
					                                 f32 %49 = OpConstant 3,674022E-40 
					                               f32_2 %50 = OpConstantComposite %49 %49 
					                                     %58 = OpTypeVector %6 3 
					                                     %59 = OpTypePointer Private %58 
					                      Private f32_3* %60 = OpVariable Private 
					                                     %61 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %62 = OpTypePointer UniformConstant %61 
					UniformConstant read_only Texture2D* %63 = OpVariable UniformConstant 
					                                     %65 = OpTypeSampler 
					                                     %66 = OpTypePointer UniformConstant %65 
					            UniformConstant sampler* %67 = OpVariable UniformConstant 
					                                     %69 = OpTypeSampledImage %61 
					                        Private f32* %74 = OpVariable Private 
					                                 u32 %75 = OpConstant 1 
					                                 u32 %81 = OpConstant 2 
					                                 f32 %88 = OpConstant 3,674022E-40 
					                     Private f32_2* %104 = OpVariable Private 
					                                    %129 = OpTypePointer Output %10 
					                      Output f32_4* %130 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                        Uniform f32* %17 = OpAccessChain %13 %15 
					                                 f32 %18 = OpLoad %17 
					                                 f32 %20 = OpFMul %18 %19 
					                        Private f32* %24 = OpAccessChain %9 %22 
					                                             OpStore %24 %20 
					                        Private f32* %27 = OpAccessChain %9 %22 
					                                 f32 %28 = OpLoad %27 
					                                 f32 %29 = OpFDiv %26 %28 
					                                             OpStore %25 %29 
					                               f32_2 %33 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %36 = OpAccessChain %13 %34 
					                               f32_4 %37 = OpLoad %36 
					                               f32_2 %38 = OpVectorShuffle %37 %37 0 1 
					                               f32_2 %39 = OpFMul %33 %38 
					                      Uniform f32_4* %40 = OpAccessChain %13 %34 
					                               f32_4 %41 = OpLoad %40 
					                               f32_2 %42 = OpVectorShuffle %41 %41 2 3 
					                               f32_2 %43 = OpFAdd %39 %42 
					                                             OpStore %30 %43 
					                               f32_2 %45 = OpLoad %30 
					                                 f32 %46 = OpLoad %25 
					                               f32_2 %47 = OpCompositeConstruct %46 %46 
					                               f32_2 %48 = OpFMul %45 %47 
					                               f32_2 %51 = OpFAdd %48 %50 
					                                             OpStore %44 %51 
					                               f32_2 %52 = OpLoad %44 
					                               f32_2 %53 = OpExtInst %1 8 %52 
					                                             OpStore %44 %53 
					                               f32_2 %54 = OpLoad %9 
					                               f32_2 %55 = OpVectorShuffle %54 %54 0 0 
					                               f32_2 %56 = OpLoad %44 
					                               f32_2 %57 = OpFMul %55 %56 
					                                             OpStore %44 %57 
					                 read_only Texture2D %64 = OpLoad %63 
					                             sampler %68 = OpLoad %67 
					          read_only Texture2DSampled %70 = OpSampledImage %64 %68 
					                               f32_2 %71 = OpLoad %44 
					                               f32_4 %72 = OpImageSampleImplicitLod %70 %71 
					                               f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                                             OpStore %60 %73 
					                        Private f32* %76 = OpAccessChain %60 %75 
					                                 f32 %77 = OpLoad %76 
					                        Private f32* %78 = OpAccessChain %60 %22 
					                                 f32 %79 = OpLoad %78 
					                                 f32 %80 = OpFAdd %77 %79 
					                                             OpStore %74 %80 
					                        Private f32* %82 = OpAccessChain %60 %81 
					                                 f32 %83 = OpLoad %82 
					                                 f32 %84 = OpLoad %74 
					                                 f32 %85 = OpFAdd %83 %84 
					                                             OpStore %74 %85 
					                                 f32 %86 = OpLoad %74 
					                                 f32 %87 = OpFNegate %86 
					                                 f32 %89 = OpFMul %87 %88 
					                                 f32 %90 = OpFAdd %89 %26 
					                                             OpStore %74 %90 
					                                 f32 %91 = OpLoad %74 
					                                 f32 %92 = OpExtInst %1 30 %91 
					                                             OpStore %74 %92 
					                                 f32 %93 = OpLoad %74 
					                        Uniform f32* %94 = OpAccessChain %13 %15 
					                                 f32 %95 = OpLoad %94 
					                                 f32 %96 = OpFMul %93 %95 
					                                             OpStore %25 %96 
					                                 f32 %97 = OpLoad %25 
					                                 f32 %98 = OpExtInst %1 29 %97 
					                                             OpStore %25 %98 
					                                 f32 %99 = OpLoad %25 
					                       Private f32* %100 = OpAccessChain %9 %22 
					                                f32 %101 = OpLoad %100 
					                                f32 %102 = OpFMul %99 %101 
					                       Private f32* %103 = OpAccessChain %9 %22 
					                                             OpStore %103 %102 
					                       Private f32* %105 = OpAccessChain %9 %22 
					                                f32 %106 = OpLoad %105 
					                                f32 %107 = OpFDiv %26 %106 
					                       Private f32* %108 = OpAccessChain %104 %22 
					                                             OpStore %108 %107 
					                              f32_2 %109 = OpLoad %30 
					                              f32_2 %110 = OpLoad %104 
					                              f32_2 %111 = OpVectorShuffle %110 %110 0 0 
					                              f32_2 %112 = OpFMul %109 %111 
					                              f32_2 %113 = OpFAdd %112 %50 
					                                             OpStore %104 %113 
					                              f32_2 %114 = OpLoad %104 
					                              f32_2 %115 = OpExtInst %1 8 %114 
					                                             OpStore %104 %115 
					                              f32_2 %116 = OpLoad %104 
					                              f32_2 %117 = OpFNegate %116 
					                              f32_2 %118 = OpLoad %9 
					                              f32_2 %119 = OpVectorShuffle %118 %118 0 0 
					                              f32_2 %120 = OpFMul %117 %119 
					                              f32_2 %121 = OpLoad %44 
					                              f32_2 %122 = OpFAdd %120 %121 
					                                             OpStore %44 %122 
					                              f32_2 %123 = OpLoad %44 
					                                f32 %124 = OpLoad %25 
					                              f32_2 %125 = OpCompositeConstruct %124 %124 
					                              f32_2 %126 = OpFMul %123 %125 
					                              f32_2 %127 = OpLoad %30 
					                              f32_2 %128 = OpFAdd %126 %127 
					                                             OpStore %9 %128 
					                read_only Texture2D %131 = OpLoad %63 
					                            sampler %132 = OpLoad %67 
					         read_only Texture2DSampled %133 = OpSampledImage %131 %132 
					                              f32_2 %134 = OpLoad %9 
					                              f32_4 %135 = OpImageSampleImplicitLod %133 %134 
					                                             OpStore %130 %135 
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
						vec4 unused_0_2;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_2;
					float u_xlat3;
					float u_xlat16_3;
					vec2 u_xlat6;
					vec2 u_xlat7;
					void main()
					{
					    u_xlat0.x = _Value * 0.0399999991;
					    u_xlat3 = float(1.0) / u_xlat0.x;
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat6.xy * vec2(u_xlat3) + vec2(0.5, 0.5);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_3 = u_xlat10_2.y + u_xlat10_2.x;
					    u_xlat16_3 = u_xlat10_2.z + u_xlat16_3;
					    u_xlat16_3 = (-u_xlat16_3) * 0.333333343 + 1.0;
					    u_xlat16_3 = log2(u_xlat16_3);
					    u_xlat3 = u_xlat16_3 * _Value;
					    u_xlat3 = exp2(u_xlat3);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat7.x = float(1.0) / u_xlat0.x;
					    u_xlat7.xy = u_xlat6.xy * u_xlat7.xx + vec2(0.5, 0.5);
					    u_xlat7.xy = floor(u_xlat7.xy);
					    u_xlat1.xy = (-u_xlat7.xy) * u_xlat0.xx + u_xlat1.xy;
					    u_xlat0.xy = u_xlat1.xy * vec2(u_xlat3) + u_xlat6.xy;
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