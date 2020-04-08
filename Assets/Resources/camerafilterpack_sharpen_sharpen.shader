Shader "CameraFilterPack/Sharpen_Sharpen" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Value ("Value", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 18114
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
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat16_5;
					vec4 u_xlat10_6;
					float u_xlat7;
					vec2 u_xlat14;
					void main()
					{
					    u_xlat0.x = _Value * 9.0 + 1.0;
					    u_xlat7 = _Value * 9.0;
					    u_xlat1.y = _Value2 / _ScreenResolution.x;
					    u_xlat1.x = 0.0;
					    u_xlat14.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = (-u_xlat1.yxxy) + u_xlat14.xyxy;
					    u_xlat1 = u_xlat1.yxxy + u_xlat14.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat14.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_5 = u_xlat10_3 + u_xlat10_4;
					    u_xlat10_6 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_6;
					    u_xlat16_5 = u_xlat10_2 + u_xlat16_5;
					    u_xlat16_5 = u_xlat10_1 + u_xlat16_5;
					    u_xlat5 = vec4(u_xlat7) * u_xlat16_5;
					    u_xlat5 = u_xlat5 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat0 = u_xlat0.xxxx * u_xlat10_3 + (-u_xlat5);
					    u_xlat16_5 = min(u_xlat10_3, u_xlat10_4);
					    u_xlat16_3 = max(u_xlat10_3, u_xlat10_4);
					    u_xlat16_3 = max(u_xlat10_6, u_xlat16_3);
					    u_xlat16_4 = min(u_xlat10_6, u_xlat16_5);
					    u_xlat16_4 = min(u_xlat10_2, u_xlat16_4);
					    u_xlat16_2 = max(u_xlat10_2, u_xlat16_3);
					    u_xlat16_2 = max(u_xlat10_1, u_xlat16_2);
					    u_xlat16_1 = min(u_xlat10_1, u_xlat16_4);
					    u_xlat0 = max(u_xlat0, u_xlat16_1);
					    SV_Target0 = min(u_xlat16_2, u_xlat0);
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
					; Bound: 177
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %46 %172 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpMemberDecorate %10 0 Offset 10 
					                                                  OpMemberDecorate %10 1 Offset 10 
					                                                  OpMemberDecorate %10 2 Offset 10 
					                                                  OpMemberDecorate %10 3 RelaxedPrecision 
					                                                  OpMemberDecorate %10 3 Offset 10 
					                                                  OpDecorate %10 Block 
					                                                  OpDecorate %12 DescriptorSet 12 
					                                                  OpDecorate %12 Binding 12 
					                                                  OpDecorate vs_TEXCOORD0 Location 46 
					                                                  OpDecorate %51 RelaxedPrecision 
					                                                  OpDecorate %52 RelaxedPrecision 
					                                                  OpDecorate %55 RelaxedPrecision 
					                                                  OpDecorate %56 RelaxedPrecision 
					                                                  OpDecorate %70 RelaxedPrecision 
					                                                  OpDecorate %73 RelaxedPrecision 
					                                                  OpDecorate %73 DescriptorSet 73 
					                                                  OpDecorate %73 Binding 73 
					                                                  OpDecorate %74 RelaxedPrecision 
					                                                  OpDecorate %77 RelaxedPrecision 
					                                                  OpDecorate %77 DescriptorSet 77 
					                                                  OpDecorate %77 Binding 77 
					                                                  OpDecorate %78 RelaxedPrecision 
					                                                  OpDecorate %83 RelaxedPrecision 
					                                                  OpDecorate %84 RelaxedPrecision 
					                                                  OpDecorate %85 RelaxedPrecision 
					                                                  OpDecorate %90 RelaxedPrecision 
					                                                  OpDecorate %91 RelaxedPrecision 
					                                                  OpDecorate %92 RelaxedPrecision 
					                                                  OpDecorate %97 RelaxedPrecision 
					                                                  OpDecorate %98 RelaxedPrecision 
					                                                  OpDecorate %99 RelaxedPrecision 
					                                                  OpDecorate %100 RelaxedPrecision 
					                                                  OpDecorate %101 RelaxedPrecision 
					                                                  OpDecorate %102 RelaxedPrecision 
					                                                  OpDecorate %103 RelaxedPrecision 
					                                                  OpDecorate %108 RelaxedPrecision 
					                                                  OpDecorate %109 RelaxedPrecision 
					                                                  OpDecorate %110 RelaxedPrecision 
					                                                  OpDecorate %115 RelaxedPrecision 
					                                                  OpDecorate %116 RelaxedPrecision 
					                                                  OpDecorate %117 RelaxedPrecision 
					                                                  OpDecorate %118 RelaxedPrecision 
					                                                  OpDecorate %119 RelaxedPrecision 
					                                                  OpDecorate %120 RelaxedPrecision 
					                                                  OpDecorate %121 RelaxedPrecision 
					                                                  OpDecorate %122 RelaxedPrecision 
					                                                  OpDecorate %123 RelaxedPrecision 
					                                                  OpDecorate %126 RelaxedPrecision 
					                                                  OpDecorate %127 RelaxedPrecision 
					                                                  OpDecorate %128 RelaxedPrecision 
					                                                  OpDecorate %135 RelaxedPrecision 
					                                                  OpDecorate %140 RelaxedPrecision 
					                                                  OpDecorate %141 RelaxedPrecision 
					                                                  OpDecorate %142 RelaxedPrecision 
					                                                  OpDecorate %143 RelaxedPrecision 
					                                                  OpDecorate %144 RelaxedPrecision 
					                                                  OpDecorate %145 RelaxedPrecision 
					                                                  OpDecorate %146 RelaxedPrecision 
					                                                  OpDecorate %147 RelaxedPrecision 
					                                                  OpDecorate %148 RelaxedPrecision 
					                                                  OpDecorate %149 RelaxedPrecision 
					                                                  OpDecorate %150 RelaxedPrecision 
					                                                  OpDecorate %151 RelaxedPrecision 
					                                                  OpDecorate %152 RelaxedPrecision 
					                                                  OpDecorate %153 RelaxedPrecision 
					                                                  OpDecorate %154 RelaxedPrecision 
					                                                  OpDecorate %155 RelaxedPrecision 
					                                                  OpDecorate %156 RelaxedPrecision 
					                                                  OpDecorate %157 RelaxedPrecision 
					                                                  OpDecorate %158 RelaxedPrecision 
					                                                  OpDecorate %159 RelaxedPrecision 
					                                                  OpDecorate %160 RelaxedPrecision 
					                                                  OpDecorate %161 RelaxedPrecision 
					                                                  OpDecorate %162 RelaxedPrecision 
					                                                  OpDecorate %163 RelaxedPrecision 
					                                                  OpDecorate %164 RelaxedPrecision 
					                                                  OpDecorate %165 RelaxedPrecision 
					                                                  OpDecorate %166 RelaxedPrecision 
					                                                  OpDecorate %167 RelaxedPrecision 
					                                                  OpDecorate %169 RelaxedPrecision 
					                                                  OpDecorate %172 Location 172 
					                                                  OpDecorate %173 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 4 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_4* %9 = OpVariable Private 
					                                          %10 = OpTypeStruct %6 %6 %7 %7 
					                                          %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32_4; f32_4;}* %12 = OpVariable Uniform 
					                                          %13 = OpTypeInt 32 1 
					                                      i32 %14 = OpConstant 0 
					                                          %15 = OpTypePointer Uniform %6 
					                                      f32 %18 = OpConstant 3,674022E-40 
					                                      f32 %20 = OpConstant 3,674022E-40 
					                                          %22 = OpTypeInt 32 0 
					                                      u32 %23 = OpConstant 0 
					                                          %24 = OpTypePointer Private %6 
					                             Private f32* %26 = OpVariable Private 
					                           Private f32_4* %30 = OpVariable Private 
					                                      i32 %31 = OpConstant 1 
					                                      i32 %34 = OpConstant 2 
					                                      u32 %38 = OpConstant 1 
					                                      f32 %40 = OpConstant 3,674022E-40 
					                                          %42 = OpTypeVector %6 2 
					                                          %43 = OpTypePointer Private %42 
					                           Private f32_2* %44 = OpVariable Private 
					                                          %45 = OpTypePointer Input %42 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      i32 %48 = OpConstant 3 
					                                          %49 = OpTypePointer Uniform %7 
					                           Private f32_4* %58 = OpVariable Private 
					                           Private f32_4* %70 = OpVariable Private 
					                                          %71 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %72 = OpTypePointer UniformConstant %71 
					     UniformConstant read_only Texture2D* %73 = OpVariable UniformConstant 
					                                          %75 = OpTypeSampler 
					                                          %76 = OpTypePointer UniformConstant %75 
					                 UniformConstant sampler* %77 = OpVariable UniformConstant 
					                                          %79 = OpTypeSampledImage %71 
					                           Private f32_4* %83 = OpVariable Private 
					                           Private f32_4* %90 = OpVariable Private 
					                           Private f32_4* %97 = OpVariable Private 
					                          Private f32_4* %101 = OpVariable Private 
					                          Private f32_4* %108 = OpVariable Private 
					                          Private f32_4* %124 = OpVariable Private 
					                                     f32 %130 = OpConstant 3,674022E-40 
					                                   f32_4 %131 = OpConstantComposite %130 %130 %130 %130 
					                          Private f32_4* %143 = OpVariable Private 
					                          Private f32_4* %150 = OpVariable Private 
					                          Private f32_4* %157 = OpVariable Private 
					                          Private f32_4* %164 = OpVariable Private 
					                                         %171 = OpTypePointer Output %7 
					                           Output f32_4* %172 = OpVariable Output 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                             Uniform f32* %16 = OpAccessChain %12 %14 
					                                      f32 %17 = OpLoad %16 
					                                      f32 %19 = OpFMul %17 %18 
					                                      f32 %21 = OpFAdd %19 %20 
					                             Private f32* %25 = OpAccessChain %9 %23 
					                                                  OpStore %25 %21 
					                             Uniform f32* %27 = OpAccessChain %12 %14 
					                                      f32 %28 = OpLoad %27 
					                                      f32 %29 = OpFMul %28 %18 
					                                                  OpStore %26 %29 
					                             Uniform f32* %32 = OpAccessChain %12 %31 
					                                      f32 %33 = OpLoad %32 
					                             Uniform f32* %35 = OpAccessChain %12 %34 %23 
					                                      f32 %36 = OpLoad %35 
					                                      f32 %37 = OpFDiv %33 %36 
					                             Private f32* %39 = OpAccessChain %30 %38 
					                                                  OpStore %39 %37 
					                             Private f32* %41 = OpAccessChain %30 %23 
					                                                  OpStore %41 %40 
					                                    f32_2 %47 = OpLoad vs_TEXCOORD0 
					                           Uniform f32_4* %50 = OpAccessChain %12 %48 
					                                    f32_4 %51 = OpLoad %50 
					                                    f32_2 %52 = OpVectorShuffle %51 %51 0 1 
					                                    f32_2 %53 = OpFMul %47 %52 
					                           Uniform f32_4* %54 = OpAccessChain %12 %48 
					                                    f32_4 %55 = OpLoad %54 
					                                    f32_2 %56 = OpVectorShuffle %55 %55 2 3 
					                                    f32_2 %57 = OpFAdd %53 %56 
					                                                  OpStore %44 %57 
					                                    f32_4 %59 = OpLoad %30 
					                                    f32_4 %60 = OpVectorShuffle %59 %59 1 0 0 1 
					                                    f32_4 %61 = OpFNegate %60 
					                                    f32_2 %62 = OpLoad %44 
					                                    f32_4 %63 = OpVectorShuffle %62 %62 0 1 0 1 
					                                    f32_4 %64 = OpFAdd %61 %63 
					                                                  OpStore %58 %64 
					                                    f32_4 %65 = OpLoad %30 
					                                    f32_4 %66 = OpVectorShuffle %65 %65 1 0 0 1 
					                                    f32_2 %67 = OpLoad %44 
					                                    f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
					                                    f32_4 %69 = OpFAdd %66 %68 
					                                                  OpStore %30 %69 
					                      read_only Texture2D %74 = OpLoad %73 
					                                  sampler %78 = OpLoad %77 
					               read_only Texture2DSampled %80 = OpSampledImage %74 %78 
					                                    f32_2 %81 = OpLoad %44 
					                                    f32_4 %82 = OpImageSampleImplicitLod %80 %81 
					                                                  OpStore %70 %82 
					                      read_only Texture2D %84 = OpLoad %73 
					                                  sampler %85 = OpLoad %77 
					               read_only Texture2DSampled %86 = OpSampledImage %84 %85 
					                                    f32_4 %87 = OpLoad %58 
					                                    f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                    f32_4 %89 = OpImageSampleImplicitLod %86 %88 
					                                                  OpStore %83 %89 
					                      read_only Texture2D %91 = OpLoad %73 
					                                  sampler %92 = OpLoad %77 
					               read_only Texture2DSampled %93 = OpSampledImage %91 %92 
					                                    f32_4 %94 = OpLoad %58 
					                                    f32_2 %95 = OpVectorShuffle %94 %94 2 3 
					                                    f32_4 %96 = OpImageSampleImplicitLod %93 %95 
					                                                  OpStore %90 %96 
					                                    f32_4 %98 = OpLoad %70 
					                                    f32_4 %99 = OpLoad %83 
					                                   f32_4 %100 = OpFAdd %98 %99 
					                                                  OpStore %97 %100 
					                     read_only Texture2D %102 = OpLoad %73 
					                                 sampler %103 = OpLoad %77 
					              read_only Texture2DSampled %104 = OpSampledImage %102 %103 
					                                   f32_4 %105 = OpLoad %30 
					                                   f32_2 %106 = OpVectorShuffle %105 %105 0 1 
					                                   f32_4 %107 = OpImageSampleImplicitLod %104 %106 
					                                                  OpStore %101 %107 
					                     read_only Texture2D %109 = OpLoad %73 
					                                 sampler %110 = OpLoad %77 
					              read_only Texture2DSampled %111 = OpSampledImage %109 %110 
					                                   f32_4 %112 = OpLoad %30 
					                                   f32_2 %113 = OpVectorShuffle %112 %112 2 3 
					                                   f32_4 %114 = OpImageSampleImplicitLod %111 %113 
					                                                  OpStore %108 %114 
					                                   f32_4 %115 = OpLoad %97 
					                                   f32_4 %116 = OpLoad %101 
					                                   f32_4 %117 = OpFAdd %115 %116 
					                                                  OpStore %97 %117 
					                                   f32_4 %118 = OpLoad %90 
					                                   f32_4 %119 = OpLoad %97 
					                                   f32_4 %120 = OpFAdd %118 %119 
					                                                  OpStore %97 %120 
					                                   f32_4 %121 = OpLoad %108 
					                                   f32_4 %122 = OpLoad %97 
					                                   f32_4 %123 = OpFAdd %121 %122 
					                                                  OpStore %97 %123 
					                                     f32 %125 = OpLoad %26 
					                                   f32_4 %126 = OpCompositeConstruct %125 %125 %125 %125 
					                                   f32_4 %127 = OpLoad %97 
					                                   f32_4 %128 = OpFMul %126 %127 
					                                                  OpStore %124 %128 
					                                   f32_4 %129 = OpLoad %124 
					                                   f32_4 %132 = OpFMul %129 %131 
					                                                  OpStore %124 %132 
					                                   f32_4 %133 = OpLoad %9 
					                                   f32_4 %134 = OpVectorShuffle %133 %133 0 0 0 0 
					                                   f32_4 %135 = OpLoad %70 
					                                   f32_4 %136 = OpFMul %134 %135 
					                                   f32_4 %137 = OpLoad %124 
					                                   f32_4 %138 = OpFNegate %137 
					                                   f32_4 %139 = OpFAdd %136 %138 
					                                                  OpStore %9 %139 
					                                   f32_4 %140 = OpLoad %70 
					                                   f32_4 %141 = OpLoad %83 
					                                   f32_4 %142 = OpExtInst %1 37 %140 %141 
					                                                  OpStore %97 %142 
					                                   f32_4 %144 = OpLoad %70 
					                                   f32_4 %145 = OpLoad %83 
					                                   f32_4 %146 = OpExtInst %1 40 %144 %145 
					                                                  OpStore %143 %146 
					                                   f32_4 %147 = OpLoad %101 
					                                   f32_4 %148 = OpLoad %143 
					                                   f32_4 %149 = OpExtInst %1 40 %147 %148 
					                                                  OpStore %143 %149 
					                                   f32_4 %151 = OpLoad %101 
					                                   f32_4 %152 = OpLoad %97 
					                                   f32_4 %153 = OpExtInst %1 37 %151 %152 
					                                                  OpStore %150 %153 
					                                   f32_4 %154 = OpLoad %90 
					                                   f32_4 %155 = OpLoad %150 
					                                   f32_4 %156 = OpExtInst %1 37 %154 %155 
					                                                  OpStore %150 %156 
					                                   f32_4 %158 = OpLoad %90 
					                                   f32_4 %159 = OpLoad %143 
					                                   f32_4 %160 = OpExtInst %1 40 %158 %159 
					                                                  OpStore %157 %160 
					                                   f32_4 %161 = OpLoad %108 
					                                   f32_4 %162 = OpLoad %157 
					                                   f32_4 %163 = OpExtInst %1 40 %161 %162 
					                                                  OpStore %157 %163 
					                                   f32_4 %165 = OpLoad %108 
					                                   f32_4 %166 = OpLoad %150 
					                                   f32_4 %167 = OpExtInst %1 37 %165 %166 
					                                                  OpStore %164 %167 
					                                   f32_4 %168 = OpLoad %9 
					                                   f32_4 %169 = OpLoad %164 
					                                   f32_4 %170 = OpExtInst %1 40 %168 %169 
					                                                  OpStore %9 %170 
					                                   f32_4 %173 = OpLoad %157 
					                                   f32_4 %174 = OpLoad %9 
					                                   f32_4 %175 = OpExtInst %1 37 %173 %174 
					                                                  OpStore %172 %175 
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
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat16_5;
					vec4 u_xlat10_6;
					float u_xlat7;
					vec2 u_xlat14;
					void main()
					{
					    u_xlat0.x = _Value * 9.0 + 1.0;
					    u_xlat7 = _Value * 9.0;
					    u_xlat1.y = _Value2 / _ScreenResolution.x;
					    u_xlat1.x = 0.0;
					    u_xlat14.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = (-u_xlat1.yxxy) + u_xlat14.xyxy;
					    u_xlat1 = u_xlat1.yxxy + u_xlat14.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat14.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_5 = u_xlat10_3 + u_xlat10_4;
					    u_xlat10_6 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_6;
					    u_xlat16_5 = u_xlat10_2 + u_xlat16_5;
					    u_xlat16_5 = u_xlat10_1 + u_xlat16_5;
					    u_xlat5 = vec4(u_xlat7) * u_xlat16_5;
					    u_xlat5 = u_xlat5 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat0 = u_xlat0.xxxx * u_xlat10_3 + (-u_xlat5);
					    u_xlat16_5 = min(u_xlat10_3, u_xlat10_4);
					    u_xlat16_3 = max(u_xlat10_3, u_xlat10_4);
					    u_xlat16_3 = max(u_xlat10_6, u_xlat16_3);
					    u_xlat16_4 = min(u_xlat10_6, u_xlat16_5);
					    u_xlat16_4 = min(u_xlat10_2, u_xlat16_4);
					    u_xlat16_2 = max(u_xlat10_2, u_xlat16_3);
					    u_xlat16_2 = max(u_xlat10_1, u_xlat16_2);
					    u_xlat16_1 = min(u_xlat10_1, u_xlat16_4);
					    u_xlat0 = max(u_xlat0, u_xlat16_1);
					    SV_Target0 = min(u_xlat16_2, u_xlat0);
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