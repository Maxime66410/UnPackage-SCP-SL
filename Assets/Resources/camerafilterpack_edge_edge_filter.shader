Shader "CameraFilterPack/Edge_Edge_filter" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_RedAmplifier ("_RedAmplifier", Range(0, 10)) = 0
		_GreenAmplifier ("_GreenAmplifier", Range(0, 10)) = 2
		_BlueAmplifier ("_BlueAmplifier", Range(0, 10)) = 0
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 65196
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _RedAmplifier;
					uniform 	float _GreenAmplifier;
					uniform 	float _BlueAmplifier;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
					    u_xlat1 = u_xlat1 / _ScreenResolution.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1 = (-u_xlat10_1) + u_xlat10_2;
					    u_xlat2 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat2 = u_xlat2 / _ScreenResolution.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2 = (-u_xlat10_2) + u_xlat10_3;
					    u_xlat16_1 = abs(u_xlat16_1) + abs(u_xlat16_2);
					    u_xlat16_1 = u_xlat16_1 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_1.x = dot(u_xlat16_1, u_xlat16_1);
					    u_xlat16_1.x = sqrt(u_xlat16_1.x);
					    SV_Target0.xyz = u_xlat16_1.xxx * vec3(_RedAmplifier, _GreenAmplifier, _BlueAmplifier) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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
					; Bound: 169
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %142 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
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
					                                                      OpDecorate %47 RelaxedPrecision 
					                                                      OpDecorate %50 RelaxedPrecision 
					                                                      OpDecorate %50 DescriptorSet 50 
					                                                      OpDecorate %50 Binding 50 
					                                                      OpDecorate %51 RelaxedPrecision 
					                                                      OpDecorate %54 RelaxedPrecision 
					                                                      OpDecorate %54 DescriptorSet 54 
					                                                      OpDecorate %54 Binding 54 
					                                                      OpDecorate %55 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %68 RelaxedPrecision 
					                                                      OpDecorate %69 RelaxedPrecision 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %71 RelaxedPrecision 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %142 Location 142 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %165 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeVector %6 4 
					                                              %14 = OpTypeStruct %13 %6 %6 %6 %13 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32_4; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 4 
					                                              %19 = OpTypePointer Uniform %13 
					                                              %28 = OpTypePointer Private %13 
					                               Private f32_4* %29 = OpVariable Private 
					                                          i32 %32 = OpConstant 0 
					                                          f32 %37 = OpConstant 3,674022E-40 
					                                          f32 %38 = OpConstant 3,674022E-40 
					                                          f32 %39 = OpConstant 3,674022E-40 
					                                        f32_4 %40 = OpConstantComposite %37 %38 %37 %39 
					                               Private f32_4* %47 = OpVariable Private 
					                                              %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %49 = OpTypePointer UniformConstant %48 
					         UniformConstant read_only Texture2D* %50 = OpVariable UniformConstant 
					                                              %52 = OpTypeSampler 
					                                              %53 = OpTypePointer UniformConstant %52 
					                     UniformConstant sampler* %54 = OpVariable UniformConstant 
					                                              %56 = OpTypeSampledImage %48 
					                               Private f32_4* %61 = OpVariable Private 
					                               Private f32_4* %68 = OpVariable Private 
					                               Private f32_4* %73 = OpVariable Private 
					                                        f32_4 %80 = OpConstantComposite %38 %37 %39 %37 
					                               Private f32_4* %92 = OpVariable Private 
					                              Private f32_4* %103 = OpVariable Private 
					                              Private f32_4* %116 = OpVariable Private 
					                                         f32 %127 = OpConstant 3,674022E-40 
					                                       f32_4 %128 = OpConstantComposite %127 %127 %127 %127 
					                                             %133 = OpTypeInt 32 0 
					                                         u32 %134 = OpConstant 0 
					                                             %135 = OpTypePointer Private %6 
					                                             %141 = OpTypePointer Output %13 
					                               Output f32_4* %142 = OpVariable Output 
					                                             %143 = OpTypeVector %6 3 
					                                         i32 %146 = OpConstant 1 
					                                             %147 = OpTypePointer Uniform %6 
					                                         i32 %150 = OpConstant 2 
					                                         i32 %153 = OpConstant 3 
					                                         u32 %163 = OpConstant 3 
					                                             %166 = OpTypePointer Output %6 
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
					                                        f32_2 %30 = OpLoad %9 
					                                        f32_4 %31 = OpVectorShuffle %30 %30 0 1 0 1 
					                               Uniform f32_4* %33 = OpAccessChain %16 %32 
					                                        f32_4 %34 = OpLoad %33 
					                                        f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 1 
					                                        f32_4 %36 = OpFMul %31 %35 
					                                        f32_4 %41 = OpFAdd %36 %40 
					                                                      OpStore %29 %41 
					                                        f32_4 %42 = OpLoad %29 
					                               Uniform f32_4* %43 = OpAccessChain %16 %32 
					                                        f32_4 %44 = OpLoad %43 
					                                        f32_4 %45 = OpVectorShuffle %44 %44 0 1 0 1 
					                                        f32_4 %46 = OpFDiv %42 %45 
					                                                      OpStore %29 %46 
					                          read_only Texture2D %51 = OpLoad %50 
					                                      sampler %55 = OpLoad %54 
					                   read_only Texture2DSampled %57 = OpSampledImage %51 %55 
					                                        f32_4 %58 = OpLoad %29 
					                                        f32_2 %59 = OpVectorShuffle %58 %58 0 1 
					                                        f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                      OpStore %47 %60 
					                          read_only Texture2D %62 = OpLoad %50 
					                                      sampler %63 = OpLoad %54 
					                   read_only Texture2DSampled %64 = OpSampledImage %62 %63 
					                                        f32_4 %65 = OpLoad %29 
					                                        f32_2 %66 = OpVectorShuffle %65 %65 2 3 
					                                        f32_4 %67 = OpImageSampleImplicitLod %64 %66 
					                                                      OpStore %61 %67 
					                                        f32_4 %69 = OpLoad %61 
					                                        f32_4 %70 = OpFNegate %69 
					                                        f32_4 %71 = OpLoad %47 
					                                        f32_4 %72 = OpFAdd %70 %71 
					                                                      OpStore %68 %72 
					                                        f32_2 %74 = OpLoad %9 
					                                        f32_4 %75 = OpVectorShuffle %74 %74 0 1 0 1 
					                               Uniform f32_4* %76 = OpAccessChain %16 %32 
					                                        f32_4 %77 = OpLoad %76 
					                                        f32_4 %78 = OpVectorShuffle %77 %77 0 1 0 1 
					                                        f32_4 %79 = OpFMul %75 %78 
					                                        f32_4 %81 = OpFAdd %79 %80 
					                                                      OpStore %73 %81 
					                                        f32_2 %82 = OpLoad %9 
					                               Uniform f32_4* %83 = OpAccessChain %16 %32 
					                                        f32_4 %84 = OpLoad %83 
					                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                                        f32_2 %86 = OpFMul %82 %85 
					                                                      OpStore %9 %86 
					                                        f32_2 %87 = OpLoad %9 
					                               Uniform f32_4* %88 = OpAccessChain %16 %32 
					                                        f32_4 %89 = OpLoad %88 
					                                        f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                        f32_2 %91 = OpFDiv %87 %90 
					                                                      OpStore %9 %91 
					                          read_only Texture2D %93 = OpLoad %50 
					                                      sampler %94 = OpLoad %54 
					                   read_only Texture2DSampled %95 = OpSampledImage %93 %94 
					                                        f32_2 %96 = OpLoad %9 
					                                        f32_4 %97 = OpImageSampleImplicitLod %95 %96 
					                                                      OpStore %92 %97 
					                                        f32_4 %98 = OpLoad %73 
					                               Uniform f32_4* %99 = OpAccessChain %16 %32 
					                                       f32_4 %100 = OpLoad %99 
					                                       f32_4 %101 = OpVectorShuffle %100 %100 0 1 0 1 
					                                       f32_4 %102 = OpFDiv %98 %101 
					                                                      OpStore %73 %102 
					                         read_only Texture2D %104 = OpLoad %50 
					                                     sampler %105 = OpLoad %54 
					                  read_only Texture2DSampled %106 = OpSampledImage %104 %105 
					                                       f32_4 %107 = OpLoad %73 
					                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
					                                       f32_4 %109 = OpImageSampleImplicitLod %106 %108 
					                                                      OpStore %103 %109 
					                         read_only Texture2D %110 = OpLoad %50 
					                                     sampler %111 = OpLoad %54 
					                  read_only Texture2DSampled %112 = OpSampledImage %110 %111 
					                                       f32_4 %113 = OpLoad %73 
					                                       f32_2 %114 = OpVectorShuffle %113 %113 2 3 
					                                       f32_4 %115 = OpImageSampleImplicitLod %112 %114 
					                                                      OpStore %47 %115 
					                                       f32_4 %117 = OpLoad %47 
					                                       f32_4 %118 = OpFNegate %117 
					                                       f32_4 %119 = OpLoad %103 
					                                       f32_4 %120 = OpFAdd %118 %119 
					                                                      OpStore %116 %120 
					                                       f32_4 %121 = OpLoad %68 
					                                       f32_4 %122 = OpExtInst %1 4 %121 
					                                       f32_4 %123 = OpLoad %116 
					                                       f32_4 %124 = OpExtInst %1 4 %123 
					                                       f32_4 %125 = OpFAdd %122 %124 
					                                                      OpStore %68 %125 
					                                       f32_4 %126 = OpLoad %68 
					                                       f32_4 %129 = OpFMul %126 %128 
					                                                      OpStore %68 %129 
					                                       f32_4 %130 = OpLoad %68 
					                                       f32_4 %131 = OpLoad %68 
					                                         f32 %132 = OpDot %130 %131 
					                                Private f32* %136 = OpAccessChain %68 %134 
					                                                      OpStore %136 %132 
					                                Private f32* %137 = OpAccessChain %68 %134 
					                                         f32 %138 = OpLoad %137 
					                                         f32 %139 = OpExtInst %1 31 %138 
					                                Private f32* %140 = OpAccessChain %68 %134 
					                                                      OpStore %140 %139 
					                                       f32_4 %144 = OpLoad %68 
					                                       f32_3 %145 = OpVectorShuffle %144 %144 0 0 0 
					                                Uniform f32* %148 = OpAccessChain %16 %146 
					                                         f32 %149 = OpLoad %148 
					                                Uniform f32* %151 = OpAccessChain %16 %150 
					                                         f32 %152 = OpLoad %151 
					                                Uniform f32* %154 = OpAccessChain %16 %153 
					                                         f32 %155 = OpLoad %154 
					                                       f32_3 %156 = OpCompositeConstruct %149 %152 %155 
					                                       f32_3 %157 = OpFMul %145 %156 
					                                       f32_4 %158 = OpLoad %92 
					                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                                       f32_3 %160 = OpFAdd %157 %159 
					                                       f32_4 %161 = OpLoad %142 
					                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
					                                                      OpStore %142 %162 
					                                Private f32* %164 = OpAccessChain %92 %163 
					                                         f32 %165 = OpLoad %164 
					                                 Output f32* %167 = OpAccessChain %142 %163 
					                                                      OpStore %167 %165 
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
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
						float _RedAmplifier;
						float _GreenAmplifier;
						float _BlueAmplifier;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
					    u_xlat1 = u_xlat1 / _ScreenResolution.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1 = (-u_xlat10_1) + u_xlat10_2;
					    u_xlat2 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat2 = u_xlat2 / _ScreenResolution.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2 = (-u_xlat10_2) + u_xlat10_3;
					    u_xlat16_1 = abs(u_xlat16_1) + abs(u_xlat16_2);
					    u_xlat16_1 = u_xlat16_1 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_1.x = dot(u_xlat16_1, u_xlat16_1);
					    u_xlat16_1.x = sqrt(u_xlat16_1.x);
					    SV_Target0.xyz = u_xlat16_1.xxx * vec3(_RedAmplifier, _GreenAmplifier, _BlueAmplifier) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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