Shader "CameraFilterPack/Distortion_Water_Drop" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_CenterX ("_CenterX", Range(-1, 1)) = 0
		_CenterY ("_CenterY", Range(-1, 1)) = 0
		_WaveIntensity ("_WaveIntensity", Range(0, 10)) = 0
		_NumberOfWaves ("_NumberOfWaves", Range(0, 10)) = 0
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 59505
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
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _WaveIntensity;
					uniform 	int _NumberOfWaves;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					float u_xlat5;
					float u_xlat6;
					void main()
					{
					    u_xlati0 = _NumberOfWaves + 3;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat2.x = _CenterX * 0.5 + 0.5;
					    u_xlat1.x = (-u_xlat2.x);
					    u_xlat2.x = (-_CenterY) * 0.5 + 0.5;
					    u_xlat1.y = (-u_xlat2.x);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat1.xy + u_xlat2.xy;
					    u_xlat6 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat5 = sqrt(u_xlat6);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xy = vec2(u_xlat6) * u_xlat1.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat6 = u_xlat5 * 5.0 + 1.0;
					    u_xlat5 = _TimeX * -5.0;
					    u_xlat0.x = u_xlat0.x * 8.0 + u_xlat5;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5 + -0.300000012;
					    u_xlat5 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat0.x = u_xlat0.x * _WaveIntensity;
					    u_xlat0.x = u_xlat0.x * 0.333333343;
					    u_xlat1.xy = u_xlat0.xx * (-u_xlat1.xy);
					    u_xlat0.xw = u_xlat1.xy / vec2(u_xlat6);
					    u_xlat0.xy = u_xlat0.xw + u_xlat2.xy;
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
					; Bound: 175
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %57 %160 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpMemberDecorate %11 5 RelaxedPrecision 
					                                                      OpMemberDecorate %11 5 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 57 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %67 RelaxedPrecision 
					                                                      OpDecorate %160 Location 160 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %163 DescriptorSet 163 
					                                                      OpDecorate %163 Binding 163 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %167 DescriptorSet 167 
					                                                      OpDecorate %167 Binding 167 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeInt 32 1 
					                                               %7 = OpTypePointer Private %6 
					                                  Private i32* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 4 
					                                              %11 = OpTypeStruct %9 %9 %9 %9 %6 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32; i32; f32_4;}* %13 = OpVariable Uniform 
					                                          i32 %14 = OpConstant 4 
					                                              %15 = OpTypePointer Uniform %6 
					                                          i32 %18 = OpConstant 3 
					                                              %20 = OpTypePointer Private %10 
					                               Private f32_4* %21 = OpVariable Private 
					                                              %24 = OpTypeInt 32 0 
					                                          u32 %25 = OpConstant 0 
					                                              %26 = OpTypePointer Private %9 
					                                              %28 = OpTypeVector %9 2 
					                                              %29 = OpTypePointer Private %28 
					                               Private f32_2* %30 = OpVariable Private 
					                                          i32 %31 = OpConstant 1 
					                                              %32 = OpTypePointer Uniform %9 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                               Private f32_2* %39 = OpVariable Private 
					                                          i32 %44 = OpConstant 2 
					                                          u32 %54 = OpConstant 1 
					                                              %56 = OpTypePointer Input %28 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %59 = OpConstant 5 
					                                              %60 = OpTypePointer Uniform %10 
					                                 Private f32* %72 = OpVariable Private 
					                                 Private f32* %76 = OpVariable Private 
					                                          f32 %91 = OpConstant 3,674022E-40 
					                                          f32 %93 = OpConstant 3,674022E-40 
					                                          i32 %95 = OpConstant 0 
					                                          f32 %98 = OpConstant 3,674022E-40 
					                                         f32 %102 = OpConstant 3,674022E-40 
					                                         f32 %118 = OpConstant 3,674022E-40 
					                                         f32 %139 = OpConstant 3,674022E-40 
					                                             %159 = OpTypePointer Output %10 
					                               Output f32_4* %160 = OpVariable Output 
					                                             %161 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                             %162 = OpTypePointer UniformConstant %161 
					        UniformConstant read_only Texture2D* %163 = OpVariable UniformConstant 
					                                             %165 = OpTypeSampler 
					                                             %166 = OpTypePointer UniformConstant %165 
					                    UniformConstant sampler* %167 = OpVariable UniformConstant 
					                                             %169 = OpTypeSampledImage %161 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform i32* %16 = OpAccessChain %13 %14 
					                                          i32 %17 = OpLoad %16 
					                                          i32 %19 = OpIAdd %17 %18 
					                                                      OpStore %8 %19 
					                                          i32 %22 = OpLoad %8 
					                                          f32 %23 = OpConvertSToF %22 
					                                 Private f32* %27 = OpAccessChain %21 %25 
					                                                      OpStore %27 %23 
					                                 Uniform f32* %33 = OpAccessChain %13 %31 
					                                          f32 %34 = OpLoad %33 
					                                          f32 %36 = OpFMul %34 %35 
					                                          f32 %37 = OpFAdd %36 %35 
					                                 Private f32* %38 = OpAccessChain %30 %25 
					                                                      OpStore %38 %37 
					                                 Private f32* %40 = OpAccessChain %30 %25 
					                                          f32 %41 = OpLoad %40 
					                                          f32 %42 = OpFNegate %41 
					                                 Private f32* %43 = OpAccessChain %39 %25 
					                                                      OpStore %43 %42 
					                                 Uniform f32* %45 = OpAccessChain %13 %44 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %47 = OpFNegate %46 
					                                          f32 %48 = OpFMul %47 %35 
					                                          f32 %49 = OpFAdd %48 %35 
					                                 Private f32* %50 = OpAccessChain %30 %25 
					                                                      OpStore %50 %49 
					                                 Private f32* %51 = OpAccessChain %30 %25 
					                                          f32 %52 = OpLoad %51 
					                                          f32 %53 = OpFNegate %52 
					                                 Private f32* %55 = OpAccessChain %39 %54 
					                                                      OpStore %55 %53 
					                                        f32_2 %58 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %61 = OpAccessChain %13 %59 
					                                        f32_4 %62 = OpLoad %61 
					                                        f32_2 %63 = OpVectorShuffle %62 %62 0 1 
					                                        f32_2 %64 = OpFMul %58 %63 
					                               Uniform f32_4* %65 = OpAccessChain %13 %59 
					                                        f32_4 %66 = OpLoad %65 
					                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
					                                        f32_2 %68 = OpFAdd %64 %67 
					                                                      OpStore %30 %68 
					                                        f32_2 %69 = OpLoad %39 
					                                        f32_2 %70 = OpLoad %30 
					                                        f32_2 %71 = OpFAdd %69 %70 
					                                                      OpStore %39 %71 
					                                        f32_2 %73 = OpLoad %39 
					                                        f32_2 %74 = OpLoad %39 
					                                          f32 %75 = OpDot %73 %74 
					                                                      OpStore %72 %75 
					                                          f32 %77 = OpLoad %72 
					                                          f32 %78 = OpExtInst %1 31 %77 
					                                                      OpStore %76 %78 
					                                          f32 %79 = OpLoad %72 
					                                          f32 %80 = OpExtInst %1 32 %79 
					                                                      OpStore %72 %80 
					                                          f32 %81 = OpLoad %72 
					                                        f32_2 %82 = OpCompositeConstruct %81 %81 
					                                        f32_2 %83 = OpLoad %39 
					                                        f32_2 %84 = OpFMul %82 %83 
					                                                      OpStore %39 %84 
					                                 Private f32* %85 = OpAccessChain %21 %25 
					                                          f32 %86 = OpLoad %85 
					                                          f32 %87 = OpLoad %76 
					                                          f32 %88 = OpFMul %86 %87 
					                                 Private f32* %89 = OpAccessChain %21 %25 
					                                                      OpStore %89 %88 
					                                          f32 %90 = OpLoad %76 
					                                          f32 %92 = OpFMul %90 %91 
					                                          f32 %94 = OpFAdd %92 %93 
					                                                      OpStore %72 %94 
					                                 Uniform f32* %96 = OpAccessChain %13 %95 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %99 = OpFMul %97 %98 
					                                                      OpStore %76 %99 
					                                Private f32* %100 = OpAccessChain %21 %25 
					                                         f32 %101 = OpLoad %100 
					                                         f32 %103 = OpFMul %101 %102 
					                                         f32 %104 = OpLoad %76 
					                                         f32 %105 = OpFAdd %103 %104 
					                                Private f32* %106 = OpAccessChain %21 %25 
					                                                      OpStore %106 %105 
					                                Private f32* %107 = OpAccessChain %21 %25 
					                                         f32 %108 = OpLoad %107 
					                                         f32 %109 = OpExtInst %1 13 %108 
					                                Private f32* %110 = OpAccessChain %21 %25 
					                                                      OpStore %110 %109 
					                                Private f32* %111 = OpAccessChain %21 %25 
					                                         f32 %112 = OpLoad %111 
					                                         f32 %113 = OpFAdd %112 %93 
					                                Private f32* %114 = OpAccessChain %21 %25 
					                                                      OpStore %114 %113 
					                                Private f32* %115 = OpAccessChain %21 %25 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFMul %116 %35 
					                                         f32 %119 = OpFAdd %117 %118 
					                                Private f32* %120 = OpAccessChain %21 %25 
					                                                      OpStore %120 %119 
					                                Private f32* %121 = OpAccessChain %21 %25 
					                                         f32 %122 = OpLoad %121 
					                                Private f32* %123 = OpAccessChain %21 %25 
					                                         f32 %124 = OpLoad %123 
					                                         f32 %125 = OpFMul %122 %124 
					                                                      OpStore %76 %125 
					                                Private f32* %126 = OpAccessChain %21 %25 
					                                         f32 %127 = OpLoad %126 
					                                         f32 %128 = OpLoad %76 
					                                         f32 %129 = OpFMul %127 %128 
					                                Private f32* %130 = OpAccessChain %21 %25 
					                                                      OpStore %130 %129 
					                                Private f32* %131 = OpAccessChain %21 %25 
					                                         f32 %132 = OpLoad %131 
					                                Uniform f32* %133 = OpAccessChain %13 %18 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpFMul %132 %134 
					                                Private f32* %136 = OpAccessChain %21 %25 
					                                                      OpStore %136 %135 
					                                Private f32* %137 = OpAccessChain %21 %25 
					                                         f32 %138 = OpLoad %137 
					                                         f32 %140 = OpFMul %138 %139 
					                                Private f32* %141 = OpAccessChain %21 %25 
					                                                      OpStore %141 %140 
					                                       f32_4 %142 = OpLoad %21 
					                                       f32_2 %143 = OpVectorShuffle %142 %142 0 0 
					                                       f32_2 %144 = OpLoad %39 
					                                       f32_2 %145 = OpFNegate %144 
					                                       f32_2 %146 = OpFMul %143 %145 
					                                                      OpStore %39 %146 
					                                       f32_2 %147 = OpLoad %39 
					                                         f32 %148 = OpLoad %72 
					                                       f32_2 %149 = OpCompositeConstruct %148 %148 
					                                       f32_2 %150 = OpFDiv %147 %149 
					                                       f32_4 %151 = OpLoad %21 
					                                       f32_4 %152 = OpVectorShuffle %151 %150 4 1 2 5 
					                                                      OpStore %21 %152 
					                                       f32_4 %153 = OpLoad %21 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 0 3 
					                                       f32_2 %155 = OpLoad %30 
					                                       f32_2 %156 = OpFAdd %154 %155 
					                                       f32_4 %157 = OpLoad %21 
					                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 2 3 
					                                                      OpStore %21 %158 
					                         read_only Texture2D %164 = OpLoad %163 
					                                     sampler %168 = OpLoad %167 
					                  read_only Texture2DSampled %170 = OpSampledImage %164 %168 
					                                       f32_4 %171 = OpLoad %21 
					                                       f32_2 %172 = OpVectorShuffle %171 %171 0 1 
					                                       f32_4 %173 = OpImageSampleImplicitLod %170 %172 
					                                                      OpStore %160 %173 
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
						vec4 unused_0_2;
						float _CenterX;
						float _CenterY;
						float _WaveIntensity;
						int _NumberOfWaves;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					float u_xlat5;
					float u_xlat6;
					void main()
					{
					    u_xlati0 = _NumberOfWaves + 3;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat2.x = _CenterX * 0.5 + 0.5;
					    u_xlat1.x = (-u_xlat2.x);
					    u_xlat2.x = (-_CenterY) * 0.5 + 0.5;
					    u_xlat1.y = (-u_xlat2.x);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat1.xy + u_xlat2.xy;
					    u_xlat6 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat5 = sqrt(u_xlat6);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xy = vec2(u_xlat6) * u_xlat1.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat6 = u_xlat5 * 5.0 + 1.0;
					    u_xlat5 = _TimeX * -5.0;
					    u_xlat0.x = u_xlat0.x * 8.0 + u_xlat5;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5 + -0.300000012;
					    u_xlat5 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat0.x = u_xlat0.x * _WaveIntensity;
					    u_xlat0.x = u_xlat0.x * 0.333333343;
					    u_xlat1.xy = u_xlat0.xx * (-u_xlat1.xy);
					    u_xlat0.xw = u_xlat1.xy / vec2(u_xlat6);
					    u_xlat0.xy = u_xlat0.xw + u_xlat2.xy;
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