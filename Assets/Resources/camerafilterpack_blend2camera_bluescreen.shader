Shader "CameraFilterPack/Blend2Camera_BlueScreen" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 57303
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
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform 	float _Value7;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat7;
					float u_xlat9;
					float u_xlat16_9;
					float u_xlat16_10;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_10 = u_xlat16_9 * 0.800000012;
					    u_xlat16_9 = (-u_xlat16_9) + u_xlat10_1.z;
					    u_xlat9 = u_xlat16_9 + (-_Value3);
					    u_xlat9 = u_xlat9 * 3.0;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat2.x = u_xlat10_1.z + (-_Value2);
					    u_xlat2.z = min(u_xlat16_10, u_xlat2.x);
					    u_xlat7 = u_xlat10_1.z + (-u_xlat2.z);
					    u_xlat2.xy = u_xlat10_1.xy;
					    u_xlat1.x = u_xlat7 + (-_Value4);
					    u_xlat1.xyz = u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + vec3(_Value5, _Value7, _Value6);
					    u_xlat2.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					; Bound: 200
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %28 %177 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpMemberDecorate %12 4 Offset 12 
					                                                      OpMemberDecorate %12 5 Offset 12 
					                                                      OpMemberDecorate %12 6 Offset 12 
					                                                      OpMemberDecorate %12 7 Offset 12 
					                                                      OpMemberDecorate %12 8 RelaxedPrecision 
					                                                      OpMemberDecorate %12 8 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 28 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %64 DescriptorSet 64 
					                                                      OpDecorate %64 Binding 64 
					                                                      OpDecorate %65 RelaxedPrecision 
					                                                      OpDecorate %68 RelaxedPrecision 
					                                                      OpDecorate %68 DescriptorSet 68 
					                                                      OpDecorate %68 Binding 68 
					                                                      OpDecorate %69 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %77 RelaxedPrecision 
					                                                      OpDecorate %77 DescriptorSet 77 
					                                                      OpDecorate %77 Binding 77 
					                                                      OpDecorate %78 RelaxedPrecision 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %79 DescriptorSet 79 
					                                                      OpDecorate %79 Binding 79 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %177 Location 177 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 2 
					                                              %11 = OpTypeVector %9 4 
					                                              %12 = OpTypeStruct %9 %9 %9 %9 %9 %9 %9 %10 %11 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 7 
					                                              %17 = OpTypeInt 32 0 
					                                          u32 %18 = OpConstant 1 
					                                              %19 = OpTypePointer Uniform %9 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                              %24 = OpTypeVector %9 3 
					                                              %25 = OpTypePointer Private %24 
					                               Private f32_3* %26 = OpVariable Private 
					                                              %27 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %30 = OpConstant 8 
					                                              %31 = OpTypePointer Uniform %11 
					                                              %42 = OpTypePointer Private %9 
					                                 Private f32* %43 = OpVariable Private 
					                                          f32 %47 = OpConstant 3,674022E-40 
					                                              %50 = OpTypePointer Function %9 
					                                          u32 %59 = OpConstant 2 
					                               Private f32_3* %61 = OpVariable Private 
					                                              %62 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                              %63 = OpTypePointer UniformConstant %62 
					         UniformConstant read_only Texture2D* %64 = OpVariable UniformConstant 
					                                              %66 = OpTypeSampler 
					                                              %67 = OpTypePointer UniformConstant %66 
					                     UniformConstant sampler* %68 = OpVariable UniformConstant 
					                                              %70 = OpTypeSampledImage %62 
					                               Private f32_3* %76 = OpVariable Private 
					         UniformConstant read_only Texture2D* %77 = OpVariable UniformConstant 
					                     UniformConstant sampler* %79 = OpVariable UniformConstant 
					                                 Private f32* %86 = OpVariable Private 
					                                          i32 %89 = OpConstant 1 
					                                 Private f32* %94 = OpVariable Private 
					                                          u32 %97 = OpConstant 0 
					                                Private f32* %101 = OpVariable Private 
					                                         f32 %103 = OpConstant 3,674022E-40 
					                                Private f32* %110 = OpVariable Private 
					                                         i32 %112 = OpConstant 2 
					                                         f32 %118 = OpConstant 3,674022E-40 
					                              Private f32_3* %122 = OpVariable Private 
					                                Private f32* %127 = OpVariable Private 
					                              Private f32_3* %138 = OpVariable Private 
					                                         i32 %140 = OpConstant 3 
					                                         i32 %151 = OpConstant 4 
					                                         i32 %154 = OpConstant 6 
					                                         i32 %157 = OpConstant 5 
					                                             %176 = OpTypePointer Output %11 
					                               Output f32_4* %177 = OpVariable Output 
					                                         i32 %178 = OpConstant 0 
					                                         u32 %196 = OpConstant 3 
					                                             %197 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %51 = OpVariable Function 
					                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
					                                          f32 %21 = OpLoad %20 
					                                         bool %23 = OpFOrdLessThan %21 %22 
					                                                      OpStore %8 %23 
					                                        f32_2 %29 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %32 = OpAccessChain %14 %30 
					                                        f32_4 %33 = OpLoad %32 
					                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                        f32_2 %35 = OpFMul %29 %34 
					                               Uniform f32_4* %36 = OpAccessChain %14 %30 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
					                                        f32_2 %39 = OpFAdd %35 %38 
					                                        f32_3 %40 = OpLoad %26 
					                                        f32_3 %41 = OpVectorShuffle %40 %39 3 4 2 
					                                                      OpStore %26 %41 
					                                 Private f32* %44 = OpAccessChain %26 %18 
					                                          f32 %45 = OpLoad %44 
					                                          f32 %46 = OpFNegate %45 
					                                          f32 %48 = OpFAdd %46 %47 
					                                                      OpStore %43 %48 
					                                         bool %49 = OpLoad %8 
					                                                      OpSelectionMerge %53 None 
					                                                      OpBranchConditional %49 %52 %55 
					                                              %52 = OpLabel 
					                                          f32 %54 = OpLoad %43 
					                                                      OpStore %51 %54 
					                                                      OpBranch %53 
					                                              %55 = OpLabel 
					                                 Private f32* %56 = OpAccessChain %26 %18 
					                                          f32 %57 = OpLoad %56 
					                                                      OpStore %51 %57 
					                                                      OpBranch %53 
					                                              %53 = OpLabel 
					                                          f32 %58 = OpLoad %51 
					                                 Private f32* %60 = OpAccessChain %26 %59 
					                                                      OpStore %60 %58 
					                          read_only Texture2D %65 = OpLoad %64 
					                                      sampler %69 = OpLoad %68 
					                   read_only Texture2DSampled %71 = OpSampledImage %65 %69 
					                                        f32_3 %72 = OpLoad %26 
					                                        f32_2 %73 = OpVectorShuffle %72 %72 0 2 
					                                        f32_4 %74 = OpImageSampleImplicitLod %71 %73 
					                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
					                                                      OpStore %61 %75 
					                          read_only Texture2D %78 = OpLoad %77 
					                                      sampler %80 = OpLoad %79 
					                   read_only Texture2DSampled %81 = OpSampledImage %78 %80 
					                                        f32_3 %82 = OpLoad %26 
					                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
					                                        f32_4 %84 = OpImageSampleImplicitLod %81 %83 
					                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                                      OpStore %76 %85 
					                                 Private f32* %87 = OpAccessChain %61 %59 
					                                          f32 %88 = OpLoad %87 
					                                 Uniform f32* %90 = OpAccessChain %14 %89 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %92 = OpFNegate %91 
					                                          f32 %93 = OpFAdd %88 %92 
					                                                      OpStore %86 %93 
					                                 Private f32* %95 = OpAccessChain %61 %18 
					                                          f32 %96 = OpLoad %95 
					                                 Private f32* %98 = OpAccessChain %61 %97 
					                                          f32 %99 = OpLoad %98 
					                                         f32 %100 = OpExtInst %1 40 %96 %99 
					                                                      OpStore %94 %100 
					                                         f32 %102 = OpLoad %94 
					                                         f32 %104 = OpFMul %102 %103 
					                                                      OpStore %101 %104 
					                                Private f32* %105 = OpAccessChain %61 %59 
					                                         f32 %106 = OpLoad %105 
					                                         f32 %107 = OpLoad %94 
					                                         f32 %108 = OpFNegate %107 
					                                         f32 %109 = OpFAdd %106 %108 
					                                                      OpStore %94 %109 
					                                         f32 %111 = OpLoad %94 
					                                Uniform f32* %113 = OpAccessChain %14 %112 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %115 = OpFNegate %114 
					                                         f32 %116 = OpFAdd %111 %115 
					                                                      OpStore %110 %116 
					                                         f32 %117 = OpLoad %110 
					                                         f32 %119 = OpFMul %117 %118 
					                                                      OpStore %110 %119 
					                                         f32 %120 = OpLoad %110 
					                                         f32 %121 = OpExtInst %1 43 %120 %22 %47 
					                                                      OpStore %110 %121 
					                                         f32 %123 = OpLoad %86 
					                                         f32 %124 = OpLoad %101 
					                                         f32 %125 = OpExtInst %1 37 %123 %124 
					                                Private f32* %126 = OpAccessChain %122 %59 
					                                                      OpStore %126 %125 
					                                Private f32* %128 = OpAccessChain %61 %59 
					                                         f32 %129 = OpLoad %128 
					                                Private f32* %130 = OpAccessChain %122 %59 
					                                         f32 %131 = OpLoad %130 
					                                         f32 %132 = OpFNegate %131 
					                                         f32 %133 = OpFAdd %129 %132 
					                                                      OpStore %127 %133 
					                                       f32_3 %134 = OpLoad %61 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_3 %136 = OpLoad %122 
					                                       f32_3 %137 = OpVectorShuffle %136 %135 3 4 2 
					                                                      OpStore %122 %137 
					                                         f32 %139 = OpLoad %127 
					                                Uniform f32* %141 = OpAccessChain %14 %140 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFNegate %142 
					                                         f32 %144 = OpFAdd %139 %143 
					                                Private f32* %145 = OpAccessChain %138 %97 
					                                                      OpStore %145 %144 
					                                       f32_3 %146 = OpLoad %138 
					                                       f32_3 %147 = OpVectorShuffle %146 %146 0 0 0 
					                                       f32_3 %148 = OpLoad %122 
					                                       f32_3 %149 = OpFAdd %147 %148 
					                                                      OpStore %138 %149 
					                                       f32_3 %150 = OpLoad %138 
					                                Uniform f32* %152 = OpAccessChain %14 %151 
					                                         f32 %153 = OpLoad %152 
					                                Uniform f32* %155 = OpAccessChain %14 %154 
					                                         f32 %156 = OpLoad %155 
					                                Uniform f32* %158 = OpAccessChain %14 %157 
					                                         f32 %159 = OpLoad %158 
					                                       f32_3 %160 = OpCompositeConstruct %153 %156 %159 
					                                       f32_3 %161 = OpFAdd %150 %160 
					                                                      OpStore %138 %161 
					                                       f32_3 %162 = OpLoad %138 
					                                       f32_3 %163 = OpFNegate %162 
					                                       f32_3 %164 = OpLoad %76 
					                                       f32_3 %165 = OpFAdd %163 %164 
					                                                      OpStore %122 %165 
					                                         f32 %166 = OpLoad %110 
					                                       f32_3 %167 = OpCompositeConstruct %166 %166 %166 
					                                       f32_3 %168 = OpLoad %122 
					                                       f32_3 %169 = OpFMul %167 %168 
					                                       f32_3 %170 = OpLoad %138 
					                                       f32_3 %171 = OpFAdd %169 %170 
					                                                      OpStore %138 %171 
					                                       f32_3 %172 = OpLoad %76 
					                                       f32_3 %173 = OpFNegate %172 
					                                       f32_3 %174 = OpLoad %138 
					                                       f32_3 %175 = OpFAdd %173 %174 
					                                                      OpStore %138 %175 
					                                Uniform f32* %179 = OpAccessChain %14 %178 
					                                         f32 %180 = OpLoad %179 
					                                Uniform f32* %181 = OpAccessChain %14 %178 
					                                         f32 %182 = OpLoad %181 
					                                Uniform f32* %183 = OpAccessChain %14 %178 
					                                         f32 %184 = OpLoad %183 
					                                       f32_3 %185 = OpCompositeConstruct %180 %182 %184 
					                                         f32 %186 = OpCompositeExtract %185 0 
					                                         f32 %187 = OpCompositeExtract %185 1 
					                                         f32 %188 = OpCompositeExtract %185 2 
					                                       f32_3 %189 = OpCompositeConstruct %186 %187 %188 
					                                       f32_3 %190 = OpLoad %138 
					                                       f32_3 %191 = OpFMul %189 %190 
					                                       f32_3 %192 = OpLoad %76 
					                                       f32_3 %193 = OpFAdd %191 %192 
					                                       f32_4 %194 = OpLoad %177 
					                                       f32_4 %195 = OpVectorShuffle %194 %193 4 5 6 3 
					                                                      OpStore %177 %195 
					                                 Output f32* %198 = OpAccessChain %177 %196 
					                                                      OpStore %198 %47 
					                                                      OpReturn
					                                                      OpFunctionEnd
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
						float _Value4;
						float _Value5;
						float _Value6;
						float _Value7;
						vec4 unused_0_8;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat16_2;
					float u_xlat3;
					float u_xlat6;
					float u_xlat9;
					float u_xlat10;
					float u_xlat16_10;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat3 = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb0) ? u_xlat3 : u_xlat1.y;
					    u_xlat10_0 = texture(_MainTex2, u_xlat1.xz);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat9 = u_xlat10_0.z + (-_Value2);
					    u_xlat16_10 = max(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlat16_2 = u_xlat16_10 * 0.800000012;
					    u_xlat16_10 = u_xlat10_0.z + (-u_xlat16_10);
					    u_xlat10 = u_xlat16_10 + (-_Value3);
					    u_xlat10 = u_xlat10 * 3.0;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat2.z = min(u_xlat9, u_xlat16_2);
					    u_xlat6 = u_xlat10_0.z + (-u_xlat2.z);
					    u_xlat2.xy = u_xlat10_0.xy;
					    u_xlat0.x = u_xlat6 + (-_Value4);
					    u_xlat0.xyz = u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + vec3(_Value5, _Value7, _Value6);
					    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat10_1.xyz;
					    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat10_1.xyz;
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