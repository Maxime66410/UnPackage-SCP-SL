Shader "CameraFilterPack/Distortion_Noise" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 58799
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
					uniform 	float _Distortion;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec2 u_xlat10;
					vec2 u_xlat13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10.xy = u_xlat0.xy * vec2(10.0, 10.0);
					    u_xlat1 = floor(u_xlat10.xxyy);
					    u_xlat2 = u_xlat1 + vec4(0.0, 1.0, 0.0, 1.0);
					    u_xlat10.xy = u_xlat0.xy * vec2(10.0, 10.0) + (-u_xlat1.yw);
					    u_xlat1 = u_xlat2.xyxy * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1;
					    u_xlat3 = u_xlat1.zwzw * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat3 = floor(u_xlat3);
					    u_xlat1 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
					    u_xlat1 = u_xlat2.zzww + u_xlat1;
					    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat2 = u_xlat1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat2 = floor(u_xlat2);
					    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
					    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat3 = floor(u_xlat3);
					    u_xlat2 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat2;
					    u_xlat2 = u_xlat2 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat2 = fract(u_xlat2);
					    u_xlat3.xy = u_xlat10.xy * u_xlat10.xy;
					    u_xlat10.xy = (-u_xlat10.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat13.xy = (-u_xlat3.xy) * u_xlat10.xy + vec2(1.0, 1.0);
					    u_xlat10.xy = u_xlat10.xy * u_xlat3.xy;
					    u_xlat2.xz = u_xlat2.xz * u_xlat13.xx;
					    u_xlat2.xy = u_xlat2.yw * u_xlat10.xx + u_xlat2.xz;
					    u_xlat2.x = u_xlat13.y * u_xlat2.x;
					    u_xlat2.x = u_xlat2.y * u_xlat10.y + u_xlat2.x;
					    u_xlat4 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = u_xlat1 * u_xlat4;
					    u_xlat4 = u_xlat1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat4 = floor(u_xlat4);
					    u_xlat1 = (-u_xlat4) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
					    u_xlat1 = u_xlat1 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat1 = fract(u_xlat1);
					    u_xlat1.xz = u_xlat13.xx * u_xlat1.xz;
					    u_xlat1.xy = u_xlat1.yw * u_xlat10.xx + u_xlat1.xz;
					    u_xlat10.x = u_xlat13.y * u_xlat1.x;
					    u_xlat2.y = u_xlat1.y * u_xlat10.y + u_xlat10.x;
					    u_xlat10.xy = u_xlat2.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat10.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
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
					; Bound: 265
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %251 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 11 
					                                              OpMemberDecorate %14 0 Offset 14 
					                                              OpMemberDecorate %14 1 RelaxedPrecision 
					                                              OpMemberDecorate %14 1 Offset 14 
					                                              OpDecorate %14 Block 
					                                              OpDecorate %16 DescriptorSet 16 
					                                              OpDecorate %16 Binding 16 
					                                              OpDecorate %21 RelaxedPrecision 
					                                              OpDecorate %22 RelaxedPrecision 
					                                              OpDecorate %25 RelaxedPrecision 
					                                              OpDecorate %26 RelaxedPrecision 
					                                              OpDecorate %251 Location 251 
					                                              OpDecorate %254 RelaxedPrecision 
					                                              OpDecorate %254 DescriptorSet 254 
					                                              OpDecorate %254 Binding 254 
					                                              OpDecorate %255 RelaxedPrecision 
					                                              OpDecorate %258 RelaxedPrecision 
					                                              OpDecorate %258 DescriptorSet 258 
					                                              OpDecorate %258 Binding 258 
					                                              OpDecorate %259 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeVector %6 4 
					                                      %14 = OpTypeStruct %6 %13 
					                                      %15 = OpTypePointer Uniform %14 
					        Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
					                                      %17 = OpTypeInt 32 1 
					                                  i32 %18 = OpConstant 1 
					                                      %19 = OpTypePointer Uniform %13 
					                       Private f32_2* %28 = OpVariable Private 
					                                  f32 %30 = OpConstant 3,674022E-40 
					                                f32_2 %31 = OpConstantComposite %30 %30 
					                                      %33 = OpTypePointer Private %13 
					                       Private f32_4* %34 = OpVariable Private 
					                       Private f32_4* %38 = OpVariable Private 
					                                  f32 %40 = OpConstant 3,674022E-40 
					                                  f32 %41 = OpConstant 3,674022E-40 
					                                f32_4 %42 = OpConstantComposite %40 %41 %40 %41 
					                                  f32 %52 = OpConstant 3,674022E-40 
					                                f32_4 %53 = OpConstantComposite %52 %52 %52 %52 
					                                f32_4 %55 = OpConstantComposite %41 %41 %41 %41 
					                       Private f32_4* %61 = OpVariable Private 
					                                  f32 %64 = OpConstant 3,674022E-40 
					                                f32_4 %65 = OpConstantComposite %64 %64 %64 %64 
					                                  f32 %71 = OpConstant 3,674022E-40 
					                                f32_4 %72 = OpConstantComposite %71 %71 %71 %71 
					                                 f32 %113 = OpConstant 3,674022E-40 
					                               f32_4 %114 = OpConstantComposite %113 %113 %113 %113 
					                                 f32 %125 = OpConstant 3,674022E-40 
					                               f32_2 %126 = OpConstantComposite %125 %125 
					                                 f32 %128 = OpConstant 3,674022E-40 
					                               f32_2 %129 = OpConstantComposite %128 %128 
					                      Private f32_2* %131 = OpVariable Private 
					                               f32_2 %137 = OpConstantComposite %41 %41 
					                                     %160 = OpTypeInt 32 0 
					                                 u32 %161 = OpConstant 1 
					                                     %162 = OpTypePointer Private %6 
					                                 u32 %165 = OpConstant 0 
					                      Private f32_4* %179 = OpVariable Private 
					                                 i32 %233 = OpConstant 0 
					                                     %234 = OpTypePointer Uniform %6 
					                                 f32 %245 = OpConstant 3,674022E-40 
					                               f32_2 %246 = OpConstantComposite %245 %245 
					                                     %250 = OpTypePointer Output %13 
					                       Output f32_4* %251 = OpVariable Output 
					                                     %252 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %253 = OpTypePointer UniformConstant %252 
					UniformConstant read_only Texture2D* %254 = OpVariable UniformConstant 
					                                     %256 = OpTypeSampler 
					                                     %257 = OpTypePointer UniformConstant %256 
					            UniformConstant sampler* %258 = OpVariable UniformConstant 
					                                     %260 = OpTypeSampledImage %252 
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
					                                f32_2 %29 = OpLoad %9 
					                                f32_2 %32 = OpFMul %29 %31 
					                                              OpStore %28 %32 
					                                f32_2 %35 = OpLoad %28 
					                                f32_4 %36 = OpVectorShuffle %35 %35 0 0 1 1 
					                                f32_4 %37 = OpExtInst %1 8 %36 
					                                              OpStore %34 %37 
					                                f32_4 %39 = OpLoad %34 
					                                f32_4 %43 = OpFAdd %39 %42 
					                                              OpStore %38 %43 
					                                f32_2 %44 = OpLoad %9 
					                                f32_2 %45 = OpFMul %44 %31 
					                                f32_4 %46 = OpLoad %34 
					                                f32_2 %47 = OpVectorShuffle %46 %46 1 3 
					                                f32_2 %48 = OpFNegate %47 
					                                f32_2 %49 = OpFAdd %45 %48 
					                                              OpStore %28 %49 
					                                f32_4 %50 = OpLoad %38 
					                                f32_4 %51 = OpVectorShuffle %50 %50 0 1 0 1 
					                                f32_4 %54 = OpFMul %51 %53 
					                                f32_4 %56 = OpFAdd %54 %55 
					                                              OpStore %34 %56 
					                                f32_4 %57 = OpLoad %38 
					                                f32_4 %58 = OpVectorShuffle %57 %57 0 1 0 1 
					                                f32_4 %59 = OpLoad %34 
					                                f32_4 %60 = OpFMul %58 %59 
					                                              OpStore %34 %60 
					                                f32_4 %62 = OpLoad %34 
					                                f32_4 %63 = OpVectorShuffle %62 %62 2 3 2 3 
					                                f32_4 %66 = OpFMul %63 %65 
					                                              OpStore %61 %66 
					                                f32_4 %67 = OpLoad %61 
					                                f32_4 %68 = OpExtInst %1 8 %67 
					                                              OpStore %61 %68 
					                                f32_4 %69 = OpLoad %61 
					                                f32_4 %70 = OpFNegate %69 
					                                f32_4 %73 = OpFMul %70 %72 
					                                f32_4 %74 = OpLoad %34 
					                                f32_4 %75 = OpFAdd %73 %74 
					                                              OpStore %34 %75 
					                                f32_4 %76 = OpLoad %38 
					                                f32_4 %77 = OpVectorShuffle %76 %76 2 2 3 3 
					                                f32_4 %78 = OpLoad %34 
					                                f32_4 %79 = OpFAdd %77 %78 
					                                              OpStore %34 %79 
					                                f32_4 %80 = OpLoad %34 
					                                f32_4 %81 = OpFMul %80 %53 
					                                f32_4 %82 = OpFAdd %81 %55 
					                                              OpStore %38 %82 
					                                f32_4 %83 = OpLoad %34 
					                                f32_4 %84 = OpLoad %38 
					                                f32_4 %85 = OpFMul %83 %84 
					                                              OpStore %34 %85 
					                                f32_4 %86 = OpLoad %34 
					                                f32_4 %87 = OpFMul %86 %65 
					                                              OpStore %38 %87 
					                                f32_4 %88 = OpLoad %38 
					                                f32_4 %89 = OpExtInst %1 8 %88 
					                                              OpStore %38 %89 
					                                f32_4 %90 = OpLoad %38 
					                                f32_4 %91 = OpFNegate %90 
					                                f32_4 %92 = OpFMul %91 %72 
					                                f32_4 %93 = OpLoad %34 
					                                f32_4 %94 = OpFAdd %92 %93 
					                                              OpStore %34 %94 
					                                f32_4 %95 = OpLoad %34 
					                                f32_4 %96 = OpFMul %95 %53 
					                                f32_4 %97 = OpFAdd %96 %55 
					                                              OpStore %38 %97 
					                                f32_4 %98 = OpLoad %34 
					                                f32_4 %99 = OpLoad %38 
					                               f32_4 %100 = OpFMul %98 %99 
					                                              OpStore %38 %100 
					                               f32_4 %101 = OpLoad %34 
					                               f32_4 %102 = OpFAdd %101 %55 
					                                              OpStore %34 %102 
					                               f32_4 %103 = OpLoad %38 
					                               f32_4 %104 = OpFMul %103 %65 
					                                              OpStore %61 %104 
					                               f32_4 %105 = OpLoad %61 
					                               f32_4 %106 = OpExtInst %1 8 %105 
					                                              OpStore %61 %106 
					                               f32_4 %107 = OpLoad %61 
					                               f32_4 %108 = OpFNegate %107 
					                               f32_4 %109 = OpFMul %108 %72 
					                               f32_4 %110 = OpLoad %38 
					                               f32_4 %111 = OpFAdd %109 %110 
					                                              OpStore %38 %111 
					                               f32_4 %112 = OpLoad %38 
					                               f32_4 %115 = OpFMul %112 %114 
					                                              OpStore %38 %115 
					                               f32_4 %116 = OpLoad %38 
					                               f32_4 %117 = OpExtInst %1 10 %116 
					                                              OpStore %38 %117 
					                               f32_2 %118 = OpLoad %28 
					                               f32_2 %119 = OpLoad %28 
					                               f32_2 %120 = OpFMul %118 %119 
					                               f32_4 %121 = OpLoad %61 
					                               f32_4 %122 = OpVectorShuffle %121 %120 4 5 2 3 
					                                              OpStore %61 %122 
					                               f32_2 %123 = OpLoad %28 
					                               f32_2 %124 = OpFNegate %123 
					                               f32_2 %127 = OpFMul %124 %126 
					                               f32_2 %130 = OpFAdd %127 %129 
					                                              OpStore %28 %130 
					                               f32_4 %132 = OpLoad %61 
					                               f32_2 %133 = OpVectorShuffle %132 %132 0 1 
					                               f32_2 %134 = OpFNegate %133 
					                               f32_2 %135 = OpLoad %28 
					                               f32_2 %136 = OpFMul %134 %135 
					                               f32_2 %138 = OpFAdd %136 %137 
					                                              OpStore %131 %138 
					                               f32_2 %139 = OpLoad %28 
					                               f32_4 %140 = OpLoad %61 
					                               f32_2 %141 = OpVectorShuffle %140 %140 0 1 
					                               f32_2 %142 = OpFMul %139 %141 
					                                              OpStore %28 %142 
					                               f32_4 %143 = OpLoad %38 
					                               f32_2 %144 = OpVectorShuffle %143 %143 0 2 
					                               f32_2 %145 = OpLoad %131 
					                               f32_2 %146 = OpVectorShuffle %145 %145 0 0 
					                               f32_2 %147 = OpFMul %144 %146 
					                               f32_4 %148 = OpLoad %38 
					                               f32_4 %149 = OpVectorShuffle %148 %147 4 1 5 3 
					                                              OpStore %38 %149 
					                               f32_4 %150 = OpLoad %38 
					                               f32_2 %151 = OpVectorShuffle %150 %150 1 3 
					                               f32_2 %152 = OpLoad %28 
					                               f32_2 %153 = OpVectorShuffle %152 %152 0 0 
					                               f32_2 %154 = OpFMul %151 %153 
					                               f32_4 %155 = OpLoad %38 
					                               f32_2 %156 = OpVectorShuffle %155 %155 0 2 
					                               f32_2 %157 = OpFAdd %154 %156 
					                               f32_4 %158 = OpLoad %38 
					                               f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
					                                              OpStore %38 %159 
					                        Private f32* %163 = OpAccessChain %131 %161 
					                                 f32 %164 = OpLoad %163 
					                        Private f32* %166 = OpAccessChain %38 %165 
					                                 f32 %167 = OpLoad %166 
					                                 f32 %168 = OpFMul %164 %167 
					                        Private f32* %169 = OpAccessChain %38 %165 
					                                              OpStore %169 %168 
					                        Private f32* %170 = OpAccessChain %38 %161 
					                                 f32 %171 = OpLoad %170 
					                        Private f32* %172 = OpAccessChain %28 %161 
					                                 f32 %173 = OpLoad %172 
					                                 f32 %174 = OpFMul %171 %173 
					                        Private f32* %175 = OpAccessChain %38 %165 
					                                 f32 %176 = OpLoad %175 
					                                 f32 %177 = OpFAdd %174 %176 
					                        Private f32* %178 = OpAccessChain %38 %165 
					                                              OpStore %178 %177 
					                               f32_4 %180 = OpLoad %34 
					                               f32_4 %181 = OpFMul %180 %53 
					                               f32_4 %182 = OpFAdd %181 %55 
					                                              OpStore %179 %182 
					                               f32_4 %183 = OpLoad %34 
					                               f32_4 %184 = OpLoad %179 
					                               f32_4 %185 = OpFMul %183 %184 
					                                              OpStore %34 %185 
					                               f32_4 %186 = OpLoad %34 
					                               f32_4 %187 = OpFMul %186 %65 
					                                              OpStore %179 %187 
					                               f32_4 %188 = OpLoad %179 
					                               f32_4 %189 = OpExtInst %1 8 %188 
					                                              OpStore %179 %189 
					                               f32_4 %190 = OpLoad %179 
					                               f32_4 %191 = OpFNegate %190 
					                               f32_4 %192 = OpFMul %191 %72 
					                               f32_4 %193 = OpLoad %34 
					                               f32_4 %194 = OpFAdd %192 %193 
					                                              OpStore %34 %194 
					                               f32_4 %195 = OpLoad %34 
					                               f32_4 %196 = OpFMul %195 %114 
					                                              OpStore %34 %196 
					                               f32_4 %197 = OpLoad %34 
					                               f32_4 %198 = OpExtInst %1 10 %197 
					                                              OpStore %34 %198 
					                               f32_2 %199 = OpLoad %131 
					                               f32_2 %200 = OpVectorShuffle %199 %199 0 0 
					                               f32_4 %201 = OpLoad %34 
					                               f32_2 %202 = OpVectorShuffle %201 %201 0 2 
					                               f32_2 %203 = OpFMul %200 %202 
					                               f32_4 %204 = OpLoad %34 
					                               f32_4 %205 = OpVectorShuffle %204 %203 4 1 5 3 
					                                              OpStore %34 %205 
					                               f32_4 %206 = OpLoad %34 
					                               f32_2 %207 = OpVectorShuffle %206 %206 1 3 
					                               f32_2 %208 = OpLoad %28 
					                               f32_2 %209 = OpVectorShuffle %208 %208 0 0 
					                               f32_2 %210 = OpFMul %207 %209 
					                               f32_4 %211 = OpLoad %34 
					                               f32_2 %212 = OpVectorShuffle %211 %211 0 2 
					                               f32_2 %213 = OpFAdd %210 %212 
					                               f32_4 %214 = OpLoad %34 
					                               f32_4 %215 = OpVectorShuffle %214 %213 4 5 2 3 
					                                              OpStore %34 %215 
					                        Private f32* %216 = OpAccessChain %131 %161 
					                                 f32 %217 = OpLoad %216 
					                        Private f32* %218 = OpAccessChain %34 %165 
					                                 f32 %219 = OpLoad %218 
					                                 f32 %220 = OpFMul %217 %219 
					                        Private f32* %221 = OpAccessChain %28 %165 
					                                              OpStore %221 %220 
					                        Private f32* %222 = OpAccessChain %34 %161 
					                                 f32 %223 = OpLoad %222 
					                        Private f32* %224 = OpAccessChain %28 %161 
					                                 f32 %225 = OpLoad %224 
					                                 f32 %226 = OpFMul %223 %225 
					                        Private f32* %227 = OpAccessChain %28 %165 
					                                 f32 %228 = OpLoad %227 
					                                 f32 %229 = OpFAdd %226 %228 
					                        Private f32* %230 = OpAccessChain %38 %161 
					                                              OpStore %230 %229 
					                               f32_4 %231 = OpLoad %38 
					                               f32_2 %232 = OpVectorShuffle %231 %231 0 1 
					                        Uniform f32* %235 = OpAccessChain %16 %233 
					                                 f32 %236 = OpLoad %235 
					                        Uniform f32* %237 = OpAccessChain %16 %233 
					                                 f32 %238 = OpLoad %237 
					                               f32_2 %239 = OpCompositeConstruct %236 %238 
					                                 f32 %240 = OpCompositeExtract %239 0 
					                                 f32 %241 = OpCompositeExtract %239 1 
					                               f32_2 %242 = OpCompositeConstruct %240 %241 
					                               f32_2 %243 = OpFMul %232 %242 
					                                              OpStore %28 %243 
					                               f32_2 %244 = OpLoad %28 
					                               f32_2 %247 = OpFMul %244 %246 
					                               f32_2 %248 = OpLoad %9 
					                               f32_2 %249 = OpFAdd %247 %248 
					                                              OpStore %9 %249 
					                 read_only Texture2D %255 = OpLoad %254 
					                             sampler %259 = OpLoad %258 
					          read_only Texture2DSampled %261 = OpSampledImage %255 %259 
					                               f32_2 %262 = OpLoad %9 
					                               f32_4 %263 = OpImageSampleImplicitLod %261 %262 
					                                              OpStore %251 %263 
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
						float _Distortion;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec2 u_xlat10;
					vec2 u_xlat13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10.xy = u_xlat0.xy * vec2(10.0, 10.0);
					    u_xlat1 = floor(u_xlat10.xxyy);
					    u_xlat2 = u_xlat1 + vec4(0.0, 1.0, 0.0, 1.0);
					    u_xlat10.xy = u_xlat0.xy * vec2(10.0, 10.0) + (-u_xlat1.yw);
					    u_xlat1 = u_xlat2.xyxy * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1;
					    u_xlat3 = u_xlat1.zwzw * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat3 = floor(u_xlat3);
					    u_xlat1 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
					    u_xlat1 = u_xlat2.zzww + u_xlat1;
					    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat2 = u_xlat1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat2 = floor(u_xlat2);
					    u_xlat1 = (-u_xlat2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
					    u_xlat2 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat3 = floor(u_xlat3);
					    u_xlat2 = (-u_xlat3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat2;
					    u_xlat2 = u_xlat2 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat2 = fract(u_xlat2);
					    u_xlat3.xy = u_xlat10.xy * u_xlat10.xy;
					    u_xlat10.xy = (-u_xlat10.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat13.xy = (-u_xlat3.xy) * u_xlat10.xy + vec2(1.0, 1.0);
					    u_xlat10.xy = u_xlat10.xy * u_xlat3.xy;
					    u_xlat2.xz = u_xlat2.xz * u_xlat13.xx;
					    u_xlat2.xy = u_xlat2.yw * u_xlat10.xx + u_xlat2.xz;
					    u_xlat2.x = u_xlat13.y * u_xlat2.x;
					    u_xlat2.x = u_xlat2.y * u_xlat10.y + u_xlat2.x;
					    u_xlat4 = u_xlat1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = u_xlat1 * u_xlat4;
					    u_xlat4 = u_xlat1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat4 = floor(u_xlat4);
					    u_xlat1 = (-u_xlat4) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat1;
					    u_xlat1 = u_xlat1 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat1 = fract(u_xlat1);
					    u_xlat1.xz = u_xlat13.xx * u_xlat1.xz;
					    u_xlat1.xy = u_xlat1.yw * u_xlat10.xx + u_xlat1.xz;
					    u_xlat10.x = u_xlat13.y * u_xlat1.x;
					    u_xlat2.y = u_xlat1.y * u_xlat10.y + u_xlat10.x;
					    u_xlat10.xy = u_xlat2.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat10.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
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