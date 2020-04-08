Shader "CameraFilterPack/FX_Screens" {
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
			GpuProgramID 41546
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	vec4 _color;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					float u_xlat5;
					float u_xlat16_5;
					vec2 u_xlat8;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = u_xlat0.xy * vec2(vec2(_Value, _Value));
					    u_xlat8.xy = floor(u_xlat8.xy);
					    u_xlat1.x = u_xlat0.x * _Value + (-u_xlat8.x);
					    u_xlat8.xy = u_xlat8.xy / vec2(vec2(_Value, _Value));
					    u_xlat10_2 = texture(_MainTex, u_xlat8.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.x = u_xlat1.x + -0.5;
					    u_xlat3.x = (-_Value3);
					    u_xlat3.y = (-_Value4);
					    u_xlat1.xy = u_xlat1.xx * u_xlat1.xx + u_xlat3.xy;
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = u_xlat1.x * 12.0;
					    u_xlat1.x = min(u_xlat1.x, 1.0);
					    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
					    u_xlat16_5 = u_xlat10_2.y + u_xlat10_2.x;
					    u_xlat16_5 = u_xlat10_2.z + u_xlat16_5;
					    u_xlat5 = _TimeX * _Value2 + u_xlat16_5;
					    u_xlat9 = floor(u_xlat5);
					    u_xlat5 = (-u_xlat9) + u_xlat5;
					    u_xlat5 = (-u_xlat5) + 1.0;
					    u_xlat5 = u_xlat5 * 3.0 + -1.79999995;
					    u_xlat5 = max(u_xlat5, 0.100000001);
					    u_xlat5 = min(u_xlat5, 2.0);
					    u_xlat1.x = u_xlat1.x * u_xlat5;
					    u_xlat1.y = float(1.0);
					    u_xlat1.z = float(1.10000002);
					    u_xlat2 = u_xlat1.xxxy * _color;
					    SV_Target0 = u_xlat2 * u_xlat1.zzzx + u_xlat10_0;
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
					; Bound: 206
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %198 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %14 0 Offset 14 
					                                                      OpMemberDecorate %14 1 Offset 14 
					                                                      OpMemberDecorate %14 2 Offset 14 
					                                                      OpMemberDecorate %14 3 Offset 14 
					                                                      OpMemberDecorate %14 4 Offset 14 
					                                                      OpMemberDecorate %14 5 Offset 14 
					                                                      OpMemberDecorate %14 6 RelaxedPrecision 
					                                                      OpMemberDecorate %14 6 Offset 14 
					                                                      OpDecorate %14 Block 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %69 RelaxedPrecision 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %72 DescriptorSet 72 
					                                                      OpDecorate %72 Binding 72 
					                                                      OpDecorate %73 RelaxedPrecision 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %76 DescriptorSet 76 
					                                                      OpDecorate %76 Binding 76 
					                                                      OpDecorate %77 RelaxedPrecision 
					                                                      OpDecorate %82 RelaxedPrecision 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %198 Location 198 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeVector %6 4 
					                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %13 %13 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 6 
					                                              %19 = OpTypePointer Uniform %13 
					                               Private f32_2* %28 = OpVariable Private 
					                                          i32 %30 = OpConstant 1 
					                                              %31 = OpTypePointer Uniform %6 
					                                              %43 = OpTypeVector %6 3 
					                                              %44 = OpTypePointer Private %43 
					                               Private f32_3* %45 = OpVariable Private 
					                                              %46 = OpTypeInt 32 0 
					                                          u32 %47 = OpConstant 0 
					                                              %48 = OpTypePointer Private %6 
					                               Private f32_3* %69 = OpVariable Private 
					                                              %70 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %71 = OpTypePointer UniformConstant %70 
					         UniformConstant read_only Texture2D* %72 = OpVariable UniformConstant 
					                                              %74 = OpTypeSampler 
					                                              %75 = OpTypePointer UniformConstant %74 
					                     UniformConstant sampler* %76 = OpVariable UniformConstant 
					                                              %78 = OpTypeSampledImage %70 
					                                              %83 = OpTypePointer Private %13 
					                               Private f32_4* %84 = OpVariable Private 
					                                          f32 %92 = OpConstant 3,674022E-40 
					                               Private f32_4* %95 = OpVariable Private 
					                                          i32 %96 = OpConstant 3 
					                                         i32 %101 = OpConstant 4 
					                                         u32 %105 = OpConstant 1 
					                                         f32 %125 = OpConstant 3,674022E-40 
					                                         f32 %130 = OpConstant 3,674022E-40 
					                                Private f32* %141 = OpVariable Private 
					                                         u32 %147 = OpConstant 2 
					                                Private f32* %152 = OpVariable Private 
					                                         i32 %153 = OpConstant 0 
					                                         i32 %156 = OpConstant 2 
					                                Private f32* %162 = OpVariable Private 
					                                         f32 %173 = OpConstant 3,674022E-40 
					                                         f32 %175 = OpConstant 3,674022E-40 
					                                         f32 %178 = OpConstant 3,674022E-40 
					                                         f32 %181 = OpConstant 3,674022E-40 
					                                         f32 %189 = OpConstant 3,674022E-40 
					                                         i32 %193 = OpConstant 5 
					                                             %197 = OpTypePointer Output %13 
					                               Output f32_4* %198 = OpVariable Output 
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
					                                 Uniform f32* %32 = OpAccessChain %16 %30 
					                                          f32 %33 = OpLoad %32 
					                                 Uniform f32* %34 = OpAccessChain %16 %30 
					                                          f32 %35 = OpLoad %34 
					                                        f32_2 %36 = OpCompositeConstruct %33 %35 
					                                          f32 %37 = OpCompositeExtract %36 0 
					                                          f32 %38 = OpCompositeExtract %36 1 
					                                        f32_2 %39 = OpCompositeConstruct %37 %38 
					                                        f32_2 %40 = OpFMul %29 %39 
					                                                      OpStore %28 %40 
					                                        f32_2 %41 = OpLoad %28 
					                                        f32_2 %42 = OpExtInst %1 8 %41 
					                                                      OpStore %28 %42 
					                                 Private f32* %49 = OpAccessChain %9 %47 
					                                          f32 %50 = OpLoad %49 
					                                 Uniform f32* %51 = OpAccessChain %16 %30 
					                                          f32 %52 = OpLoad %51 
					                                          f32 %53 = OpFMul %50 %52 
					                                 Private f32* %54 = OpAccessChain %28 %47 
					                                          f32 %55 = OpLoad %54 
					                                          f32 %56 = OpFNegate %55 
					                                          f32 %57 = OpFAdd %53 %56 
					                                 Private f32* %58 = OpAccessChain %45 %47 
					                                                      OpStore %58 %57 
					                                        f32_2 %59 = OpLoad %28 
					                                 Uniform f32* %60 = OpAccessChain %16 %30 
					                                          f32 %61 = OpLoad %60 
					                                 Uniform f32* %62 = OpAccessChain %16 %30 
					                                          f32 %63 = OpLoad %62 
					                                        f32_2 %64 = OpCompositeConstruct %61 %63 
					                                          f32 %65 = OpCompositeExtract %64 0 
					                                          f32 %66 = OpCompositeExtract %64 1 
					                                        f32_2 %67 = OpCompositeConstruct %65 %66 
					                                        f32_2 %68 = OpFDiv %59 %67 
					                                                      OpStore %28 %68 
					                          read_only Texture2D %73 = OpLoad %72 
					                                      sampler %77 = OpLoad %76 
					                   read_only Texture2DSampled %79 = OpSampledImage %73 %77 
					                                        f32_2 %80 = OpLoad %28 
					                                        f32_4 %81 = OpImageSampleImplicitLod %79 %80 
					                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
					                                                      OpStore %69 %82 
					                          read_only Texture2D %85 = OpLoad %72 
					                                      sampler %86 = OpLoad %76 
					                   read_only Texture2DSampled %87 = OpSampledImage %85 %86 
					                                        f32_2 %88 = OpLoad %9 
					                                        f32_4 %89 = OpImageSampleImplicitLod %87 %88 
					                                                      OpStore %84 %89 
					                                 Private f32* %90 = OpAccessChain %45 %47 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %93 = OpFAdd %91 %92 
					                                 Private f32* %94 = OpAccessChain %45 %47 
					                                                      OpStore %94 %93 
					                                 Uniform f32* %97 = OpAccessChain %16 %96 
					                                          f32 %98 = OpLoad %97 
					                                          f32 %99 = OpFNegate %98 
					                                Private f32* %100 = OpAccessChain %95 %47 
					                                                      OpStore %100 %99 
					                                Uniform f32* %102 = OpAccessChain %16 %101 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpFNegate %103 
					                                Private f32* %106 = OpAccessChain %95 %105 
					                                                      OpStore %106 %104 
					                                       f32_3 %107 = OpLoad %45 
					                                       f32_2 %108 = OpVectorShuffle %107 %107 0 0 
					                                       f32_3 %109 = OpLoad %45 
					                                       f32_2 %110 = OpVectorShuffle %109 %109 0 0 
					                                       f32_2 %111 = OpFMul %108 %110 
					                                       f32_4 %112 = OpLoad %95 
					                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                                       f32_2 %114 = OpFAdd %111 %113 
					                                       f32_4 %115 = OpLoad %95 
					                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 3 
					                                                      OpStore %95 %116 
					                                       f32_4 %117 = OpLoad %95 
					                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
					                                       f32_4 %119 = OpLoad %95 
					                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
					                                         f32 %121 = OpDot %118 %120 
					                                Private f32* %122 = OpAccessChain %45 %47 
					                                                      OpStore %122 %121 
					                                Private f32* %123 = OpAccessChain %45 %47 
					                                         f32 %124 = OpLoad %123 
					                                         f32 %126 = OpFMul %124 %125 
					                                Private f32* %127 = OpAccessChain %45 %47 
					                                                      OpStore %127 %126 
					                                Private f32* %128 = OpAccessChain %45 %47 
					                                         f32 %129 = OpLoad %128 
					                                         f32 %131 = OpExtInst %1 37 %129 %130 
					                                Private f32* %132 = OpAccessChain %45 %47 
					                                                      OpStore %132 %131 
					                                Private f32* %133 = OpAccessChain %45 %47 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpFNegate %134 
					                                Private f32* %136 = OpAccessChain %45 %47 
					                                         f32 %137 = OpLoad %136 
					                                         f32 %138 = OpFMul %135 %137 
					                                         f32 %139 = OpFAdd %138 %130 
					                                Private f32* %140 = OpAccessChain %45 %47 
					                                                      OpStore %140 %139 
					                                Private f32* %142 = OpAccessChain %69 %105 
					                                         f32 %143 = OpLoad %142 
					                                Private f32* %144 = OpAccessChain %69 %47 
					                                         f32 %145 = OpLoad %144 
					                                         f32 %146 = OpFAdd %143 %145 
					                                                      OpStore %141 %146 
					                                Private f32* %148 = OpAccessChain %69 %147 
					                                         f32 %149 = OpLoad %148 
					                                         f32 %150 = OpLoad %141 
					                                         f32 %151 = OpFAdd %149 %150 
					                                                      OpStore %141 %151 
					                                Uniform f32* %154 = OpAccessChain %16 %153 
					                                         f32 %155 = OpLoad %154 
					                                Uniform f32* %157 = OpAccessChain %16 %156 
					                                         f32 %158 = OpLoad %157 
					                                         f32 %159 = OpFMul %155 %158 
					                                         f32 %160 = OpLoad %141 
					                                         f32 %161 = OpFAdd %159 %160 
					                                                      OpStore %152 %161 
					                                         f32 %163 = OpLoad %152 
					                                         f32 %164 = OpExtInst %1 8 %163 
					                                                      OpStore %162 %164 
					                                         f32 %165 = OpLoad %162 
					                                         f32 %166 = OpFNegate %165 
					                                         f32 %167 = OpLoad %152 
					                                         f32 %168 = OpFAdd %166 %167 
					                                                      OpStore %152 %168 
					                                         f32 %169 = OpLoad %152 
					                                         f32 %170 = OpFNegate %169 
					                                         f32 %171 = OpFAdd %170 %130 
					                                                      OpStore %152 %171 
					                                         f32 %172 = OpLoad %152 
					                                         f32 %174 = OpFMul %172 %173 
					                                         f32 %176 = OpFAdd %174 %175 
					                                                      OpStore %152 %176 
					                                         f32 %177 = OpLoad %152 
					                                         f32 %179 = OpExtInst %1 40 %177 %178 
					                                                      OpStore %152 %179 
					                                         f32 %180 = OpLoad %152 
					                                         f32 %182 = OpExtInst %1 37 %180 %181 
					                                                      OpStore %152 %182 
					                                Private f32* %183 = OpAccessChain %45 %47 
					                                         f32 %184 = OpLoad %183 
					                                         f32 %185 = OpLoad %152 
					                                         f32 %186 = OpFMul %184 %185 
					                                Private f32* %187 = OpAccessChain %45 %47 
					                                                      OpStore %187 %186 
					                                Private f32* %188 = OpAccessChain %45 %105 
					                                                      OpStore %188 %130 
					                                Private f32* %190 = OpAccessChain %45 %147 
					                                                      OpStore %190 %189 
					                                       f32_3 %191 = OpLoad %45 
					                                       f32_4 %192 = OpVectorShuffle %191 %191 0 0 0 1 
					                              Uniform f32_4* %194 = OpAccessChain %16 %193 
					                                       f32_4 %195 = OpLoad %194 
					                                       f32_4 %196 = OpFMul %192 %195 
					                                                      OpStore %95 %196 
					                                       f32_4 %199 = OpLoad %95 
					                                       f32_3 %200 = OpLoad %45 
					                                       f32_4 %201 = OpVectorShuffle %200 %200 2 2 2 0 
					                                       f32_4 %202 = OpFMul %199 %201 
					                                       f32_4 %203 = OpLoad %84 
					                                       f32_4 %204 = OpFAdd %202 %203 
					                                                      OpStore %198 %204 
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
						float _Value;
						float _Value2;
						float _Value3;
						float _Value4;
						vec4 _color;
						vec4 unused_0_7;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					float u_xlat5;
					float u_xlat16_5;
					vec2 u_xlat8;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = u_xlat0.xy * vec2(vec2(_Value, _Value));
					    u_xlat8.xy = floor(u_xlat8.xy);
					    u_xlat1.x = u_xlat0.x * _Value + (-u_xlat8.x);
					    u_xlat8.xy = u_xlat8.xy / vec2(vec2(_Value, _Value));
					    u_xlat10_2 = texture(_MainTex, u_xlat8.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.x = u_xlat1.x + -0.5;
					    u_xlat3.x = (-_Value3);
					    u_xlat3.y = (-_Value4);
					    u_xlat1.xy = u_xlat1.xx * u_xlat1.xx + u_xlat3.xy;
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = u_xlat1.x * 12.0;
					    u_xlat1.x = min(u_xlat1.x, 1.0);
					    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
					    u_xlat16_5 = u_xlat10_2.y + u_xlat10_2.x;
					    u_xlat16_5 = u_xlat10_2.z + u_xlat16_5;
					    u_xlat5 = _TimeX * _Value2 + u_xlat16_5;
					    u_xlat9 = floor(u_xlat5);
					    u_xlat5 = (-u_xlat9) + u_xlat5;
					    u_xlat5 = (-u_xlat5) + 1.0;
					    u_xlat5 = u_xlat5 * 3.0 + -1.79999995;
					    u_xlat5 = max(u_xlat5, 0.100000001);
					    u_xlat5 = min(u_xlat5, 2.0);
					    u_xlat1.x = u_xlat1.x * u_xlat5;
					    u_xlat1.y = float(1.0);
					    u_xlat1.z = float(1.10000002);
					    u_xlat2 = u_xlat1.xxxy * _color;
					    SV_Target0 = u_xlat2 * u_xlat1.zzzx + u_xlat10_0;
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