Shader "CameraFilterPack/Oculus_NightVision1" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Vignette ("_Vignette", Range(0, 100)) = 1.5
		_Linecount ("_Linecount", Range(1, 150)) = 90
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 13541
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
					uniform 	float _Vignette;
					uniform 	float _Linecount;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat5;
					float u_xlat16_5;
					bool u_xlatb5;
					float u_xlat8;
					float u_xlat16_8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12 = u_xlat0.y * _Linecount;
					    u_xlat1.x = floor(u_xlat12);
					    u_xlat0.z = u_xlat1.x / _Linecount;
					    u_xlat1.xy = vec2(_TimeX) * vec2(9.0, 7.0) + u_xlat0.xz;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat5.xy = u_xlat10_1.xx * vec2(0.0100000007, 0.0) + u_xlat0.xz;
					    u_xlat16_8 = u_xlat10_1.x * 0.300000012 + 0.699999988;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = abs(u_xlat0.xy) * vec2(_Vignette);
					    u_xlat10_1 = texture(_MainTex, u_xlat5.xy);
					    u_xlat16_1 = dot(u_xlat10_1.xyz, vec3(0.200000003, 0.5, 0.300000012));
					    u_xlat16_5 = (-u_xlat16_1) * u_xlat16_8 + 1.0;
					    u_xlat16_8 = u_xlat16_8 * u_xlat16_1;
					    u_xlat16_1 = u_xlat16_5 * 2.0 + 0.5;
					    u_xlatb5 = u_xlat12>=(-u_xlat12);
					    u_xlat12 = fract(abs(u_xlat12));
					    u_xlat12 = (u_xlatb5) ? u_xlat12 : (-u_xlat12);
					    u_xlat12 = u_xlat12 * 2.0 + -1.0;
					    u_xlat12 = -abs(u_xlat12) + 1.0;
					    u_xlat12 = log2(u_xlat12);
					    u_xlat12 = u_xlat12 * u_xlat16_1;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat8 = u_xlat16_8 * u_xlat12;
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat12 = (-u_xlat8) * 2.0 + 1.0;
					    u_xlat1 = vec4(u_xlat8) * vec4(0.400000006, 1.0, 0.200000003, 2.0);
					    u_xlat1 = vec4(u_xlat12) * vec4(0.0, 0.100000001, 0.0, 1.0) + u_xlat1;
					    u_xlat12 = u_xlat8 * 2.0 + -1.0;
					    u_xlatb8 = u_xlat8<0.5;
					    u_xlat2.x = (-u_xlat12) + 1.0;
					    u_xlat3 = vec4(u_xlat12) * vec4(0.899999976, 1.0, 0.600000024, 1.0);
					    u_xlat2 = u_xlat2.xxxx * vec4(0.200000003, 0.5, 0.100000001, 1.0) + u_xlat3;
					    u_xlat1 = (bool(u_xlatb8)) ? u_xlat1 : u_xlat2;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = (-u_xlat0.y) * u_xlat0.y + u_xlat0.x;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
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
					; Bound: 257
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %12 %251 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpDecorate vs_TEXCOORD0 Location 12 
					                                                OpMemberDecorate %15 0 Offset 15 
					                                                OpMemberDecorate %15 1 Offset 15 
					                                                OpMemberDecorate %15 2 Offset 15 
					                                                OpMemberDecorate %15 3 RelaxedPrecision 
					                                                OpMemberDecorate %15 3 Offset 15 
					                                                OpDecorate %15 Block 
					                                                OpDecorate %17 DescriptorSet 17 
					                                                OpDecorate %17 Binding 17 
					                                                OpDecorate %22 RelaxedPrecision 
					                                                OpDecorate %23 RelaxedPrecision 
					                                                OpDecorate %26 RelaxedPrecision 
					                                                OpDecorate %27 RelaxedPrecision 
					                                                OpDecorate %68 RelaxedPrecision 
					                                                OpDecorate %71 RelaxedPrecision 
					                                                OpDecorate %71 DescriptorSet 71 
					                                                OpDecorate %71 Binding 71 
					                                                OpDecorate %72 RelaxedPrecision 
					                                                OpDecorate %75 RelaxedPrecision 
					                                                OpDecorate %75 DescriptorSet 75 
					                                                OpDecorate %75 Binding 75 
					                                                OpDecorate %76 RelaxedPrecision 
					                                                OpDecorate %82 RelaxedPrecision 
					                                                OpDecorate %86 RelaxedPrecision 
					                                                OpDecorate %87 RelaxedPrecision 
					                                                OpDecorate %91 RelaxedPrecision 
					                                                OpDecorate %95 RelaxedPrecision 
					                                                OpDecorate %97 RelaxedPrecision 
					                                                OpDecorate %99 RelaxedPrecision 
					                                                OpDecorate %101 RelaxedPrecision 
					                                                OpDecorate %119 RelaxedPrecision 
					                                                OpDecorate %120 RelaxedPrecision 
					                                                OpDecorate %124 RelaxedPrecision 
					                                                OpDecorate %125 RelaxedPrecision 
					                                                OpDecorate %126 RelaxedPrecision 
					                                                OpDecorate %130 RelaxedPrecision 
					                                                OpDecorate %131 RelaxedPrecision 
					                                                OpDecorate %132 RelaxedPrecision 
					                                                OpDecorate %133 RelaxedPrecision 
					                                                OpDecorate %134 RelaxedPrecision 
					                                                OpDecorate %135 RelaxedPrecision 
					                                                OpDecorate %137 RelaxedPrecision 
					                                                OpDecorate %138 RelaxedPrecision 
					                                                OpDecorate %139 RelaxedPrecision 
					                                                OpDecorate %140 RelaxedPrecision 
					                                                OpDecorate %141 RelaxedPrecision 
					                                                OpDecorate %143 RelaxedPrecision 
					                                                OpDecorate %144 RelaxedPrecision 
					                                                OpDecorate %176 RelaxedPrecision 
					                                                OpDecorate %181 RelaxedPrecision 
					                                                OpDecorate %251 Location 251 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 3 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_3* %9 = OpVariable Private 
					                                        %10 = OpTypeVector %6 2 
					                                        %11 = OpTypePointer Input %10 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                        %14 = OpTypeVector %6 4 
					                                        %15 = OpTypeStruct %6 %6 %6 %14 
					                                        %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                        %18 = OpTypeInt 32 1 
					                                    i32 %19 = OpConstant 3 
					                                        %20 = OpTypePointer Uniform %14 
					                                        %31 = OpTypePointer Private %6 
					                           Private f32* %32 = OpVariable Private 
					                                        %33 = OpTypeInt 32 0 
					                                    u32 %34 = OpConstant 1 
					                                    i32 %37 = OpConstant 2 
					                                        %38 = OpTypePointer Uniform %6 
					                                        %42 = OpTypePointer Private %14 
					                         Private f32_4* %43 = OpVariable Private 
					                                    u32 %46 = OpConstant 0 
					                                    u32 %53 = OpConstant 2 
					                                    i32 %55 = OpConstant 0 
					                                    f32 %59 = OpConstant 3,674022E-40 
					                                    f32 %60 = OpConstant 3,674022E-40 
					                                  f32_2 %61 = OpConstantComposite %59 %60 
					                         Private f32_3* %68 = OpVariable Private 
					                                        %69 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %70 = OpTypePointer UniformConstant %69 
					   UniformConstant read_only Texture2D* %71 = OpVariable UniformConstant 
					                                        %73 = OpTypeSampler 
					                                        %74 = OpTypePointer UniformConstant %73 
					               UniformConstant sampler* %75 = OpVariable UniformConstant 
					                                        %77 = OpTypeSampledImage %69 
					                                        %84 = OpTypePointer Private %10 
					                         Private f32_2* %85 = OpVariable Private 
					                                    f32 %88 = OpConstant 3,674022E-40 
					                                    f32 %89 = OpConstant 3,674022E-40 
					                                  f32_2 %90 = OpConstantComposite %88 %89 
					                           Private f32* %95 = OpVariable Private 
					                                    f32 %98 = OpConstant 3,674022E-40 
					                                   f32 %100 = OpConstant 3,674022E-40 
					                                   f32 %104 = OpConstant 3,674022E-40 
					                                 f32_2 %105 = OpConstantComposite %104 %104 
					                                   i32 %112 = OpConstant 1 
					                          Private f32* %125 = OpVariable Private 
					                                   f32 %127 = OpConstant 3,674022E-40 
					                                   f32 %128 = OpConstant 3,674022E-40 
					                                 f32_3 %129 = OpConstantComposite %127 %128 %98 
					                          Private f32* %131 = OpVariable Private 
					                                   f32 %136 = OpConstant 3,674022E-40 
					                                   f32 %142 = OpConstant 3,674022E-40 
					                                       %145 = OpTypeBool 
					                                       %146 = OpTypePointer Private %145 
					                         Private bool* %147 = OpVariable Private 
					                                       %156 = OpTypePointer Function %6 
					                                   f32 %167 = OpConstant 3,674022E-40 
					                          Private f32* %180 = OpVariable Private 
					                                   f32 %192 = OpConstant 3,674022E-40 
					                                 f32_4 %193 = OpConstantComposite %192 %136 %127 %142 
					                                   f32 %197 = OpConstant 3,674022E-40 
					                                 f32_4 %198 = OpConstantComposite %89 %197 %89 %136 
					                         Private bool* %205 = OpVariable Private 
					                        Private f32_4* %208 = OpVariable Private 
					                        Private f32_4* %213 = OpVariable Private 
					                                   f32 %216 = OpConstant 3,674022E-40 
					                                   f32 %217 = OpConstant 3,674022E-40 
					                                 f32_4 %218 = OpConstantComposite %216 %136 %217 %136 
					                                 f32_4 %222 = OpConstantComposite %127 %128 %197 %136 
					                                       %229 = OpTypeVector %145 4 
					                                       %250 = OpTypePointer Output %14 
					                         Output f32_4* %251 = OpVariable Output 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                         Function f32* %157 = OpVariable Function 
					                                  f32_2 %13 = OpLoad vs_TEXCOORD0 
					                         Uniform f32_4* %21 = OpAccessChain %17 %19 
					                                  f32_4 %22 = OpLoad %21 
					                                  f32_2 %23 = OpVectorShuffle %22 %22 0 1 
					                                  f32_2 %24 = OpFMul %13 %23 
					                         Uniform f32_4* %25 = OpAccessChain %17 %19 
					                                  f32_4 %26 = OpLoad %25 
					                                  f32_2 %27 = OpVectorShuffle %26 %26 2 3 
					                                  f32_2 %28 = OpFAdd %24 %27 
					                                  f32_3 %29 = OpLoad %9 
					                                  f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
					                                                OpStore %9 %30 
					                           Private f32* %35 = OpAccessChain %9 %34 
					                                    f32 %36 = OpLoad %35 
					                           Uniform f32* %39 = OpAccessChain %17 %37 
					                                    f32 %40 = OpLoad %39 
					                                    f32 %41 = OpFMul %36 %40 
					                                                OpStore %32 %41 
					                                    f32 %44 = OpLoad %32 
					                                    f32 %45 = OpExtInst %1 8 %44 
					                           Private f32* %47 = OpAccessChain %43 %46 
					                                                OpStore %47 %45 
					                           Private f32* %48 = OpAccessChain %43 %46 
					                                    f32 %49 = OpLoad %48 
					                           Uniform f32* %50 = OpAccessChain %17 %37 
					                                    f32 %51 = OpLoad %50 
					                                    f32 %52 = OpFDiv %49 %51 
					                           Private f32* %54 = OpAccessChain %9 %53 
					                                                OpStore %54 %52 
					                           Uniform f32* %56 = OpAccessChain %17 %55 
					                                    f32 %57 = OpLoad %56 
					                                  f32_2 %58 = OpCompositeConstruct %57 %57 
					                                  f32_2 %62 = OpFMul %58 %61 
					                                  f32_3 %63 = OpLoad %9 
					                                  f32_2 %64 = OpVectorShuffle %63 %63 0 2 
					                                  f32_2 %65 = OpFAdd %62 %64 
					                                  f32_4 %66 = OpLoad %43 
					                                  f32_4 %67 = OpVectorShuffle %66 %65 4 5 2 3 
					                                                OpStore %43 %67 
					                    read_only Texture2D %72 = OpLoad %71 
					                                sampler %76 = OpLoad %75 
					             read_only Texture2DSampled %78 = OpSampledImage %72 %76 
					                                  f32_4 %79 = OpLoad %43 
					                                  f32_2 %80 = OpVectorShuffle %79 %79 0 1 
					                                  f32_4 %81 = OpImageSampleImplicitLod %78 %80 
					                                    f32 %82 = OpCompositeExtract %81 0 
					                           Private f32* %83 = OpAccessChain %68 %46 
					                                                OpStore %83 %82 
					                                  f32_3 %86 = OpLoad %68 
					                                  f32_2 %87 = OpVectorShuffle %86 %86 0 0 
					                                  f32_2 %91 = OpFMul %87 %90 
					                                  f32_3 %92 = OpLoad %9 
					                                  f32_2 %93 = OpVectorShuffle %92 %92 0 2 
					                                  f32_2 %94 = OpFAdd %91 %93 
					                                                OpStore %85 %94 
					                           Private f32* %96 = OpAccessChain %68 %46 
					                                    f32 %97 = OpLoad %96 
					                                    f32 %99 = OpFMul %97 %98 
					                                   f32 %101 = OpFAdd %99 %100 
					                                                OpStore %95 %101 
					                                 f32_3 %102 = OpLoad %9 
					                                 f32_2 %103 = OpVectorShuffle %102 %102 0 1 
					                                 f32_2 %106 = OpFAdd %103 %105 
					                                 f32_3 %107 = OpLoad %9 
					                                 f32_3 %108 = OpVectorShuffle %107 %106 3 4 2 
					                                                OpStore %9 %108 
					                                 f32_3 %109 = OpLoad %9 
					                                 f32_2 %110 = OpVectorShuffle %109 %109 0 1 
					                                 f32_2 %111 = OpExtInst %1 4 %110 
					                          Uniform f32* %113 = OpAccessChain %17 %112 
					                                   f32 %114 = OpLoad %113 
					                                 f32_2 %115 = OpCompositeConstruct %114 %114 
					                                 f32_2 %116 = OpFMul %111 %115 
					                                 f32_3 %117 = OpLoad %9 
					                                 f32_3 %118 = OpVectorShuffle %117 %116 3 4 2 
					                                                OpStore %9 %118 
					                   read_only Texture2D %119 = OpLoad %71 
					                               sampler %120 = OpLoad %75 
					            read_only Texture2DSampled %121 = OpSampledImage %119 %120 
					                                 f32_2 %122 = OpLoad %85 
					                                 f32_4 %123 = OpImageSampleImplicitLod %121 %122 
					                                 f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
					                                                OpStore %68 %124 
					                                 f32_3 %126 = OpLoad %68 
					                                   f32 %130 = OpDot %126 %129 
					                                                OpStore %125 %130 
					                                   f32 %132 = OpLoad %125 
					                                   f32 %133 = OpFNegate %132 
					                                   f32 %134 = OpLoad %95 
					                                   f32 %135 = OpFMul %133 %134 
					                                   f32 %137 = OpFAdd %135 %136 
					                                                OpStore %131 %137 
					                                   f32 %138 = OpLoad %95 
					                                   f32 %139 = OpLoad %125 
					                                   f32 %140 = OpFMul %138 %139 
					                                                OpStore %95 %140 
					                                   f32 %141 = OpLoad %131 
					                                   f32 %143 = OpFMul %141 %142 
					                                   f32 %144 = OpFAdd %143 %128 
					                                                OpStore %125 %144 
					                                   f32 %148 = OpLoad %32 
					                                   f32 %149 = OpLoad %32 
					                                   f32 %150 = OpFNegate %149 
					                                  bool %151 = OpFOrdGreaterThanEqual %148 %150 
					                                                OpStore %147 %151 
					                                   f32 %152 = OpLoad %32 
					                                   f32 %153 = OpExtInst %1 4 %152 
					                                   f32 %154 = OpExtInst %1 10 %153 
					                                                OpStore %32 %154 
					                                  bool %155 = OpLoad %147 
					                                                OpSelectionMerge %159 None 
					                                                OpBranchConditional %155 %158 %161 
					                                       %158 = OpLabel 
					                                   f32 %160 = OpLoad %32 
					                                                OpStore %157 %160 
					                                                OpBranch %159 
					                                       %161 = OpLabel 
					                                   f32 %162 = OpLoad %32 
					                                   f32 %163 = OpFNegate %162 
					                                                OpStore %157 %163 
					                                                OpBranch %159 
					                                       %159 = OpLabel 
					                                   f32 %164 = OpLoad %157 
					                                                OpStore %32 %164 
					                                   f32 %165 = OpLoad %32 
					                                   f32 %166 = OpFMul %165 %142 
					                                   f32 %168 = OpFAdd %166 %167 
					                                                OpStore %32 %168 
					                                   f32 %169 = OpLoad %32 
					                                   f32 %170 = OpExtInst %1 4 %169 
					                                   f32 %171 = OpFNegate %170 
					                                   f32 %172 = OpFAdd %171 %136 
					                                                OpStore %32 %172 
					                                   f32 %173 = OpLoad %32 
					                                   f32 %174 = OpExtInst %1 30 %173 
					                                                OpStore %32 %174 
					                                   f32 %175 = OpLoad %32 
					                                   f32 %176 = OpLoad %125 
					                                   f32 %177 = OpFMul %175 %176 
					                                                OpStore %32 %177 
					                                   f32 %178 = OpLoad %32 
					                                   f32 %179 = OpExtInst %1 29 %178 
					                                                OpStore %32 %179 
					                                   f32 %181 = OpLoad %95 
					                                   f32 %182 = OpLoad %32 
					                                   f32 %183 = OpFMul %181 %182 
					                                                OpStore %180 %183 
					                                   f32 %184 = OpLoad %180 
					                                   f32 %185 = OpExtInst %1 43 %184 %89 %136 
					                                                OpStore %180 %185 
					                                   f32 %186 = OpLoad %180 
					                                   f32 %187 = OpFNegate %186 
					                                   f32 %188 = OpFMul %187 %142 
					                                   f32 %189 = OpFAdd %188 %136 
					                                                OpStore %32 %189 
					                                   f32 %190 = OpLoad %180 
					                                 f32_4 %191 = OpCompositeConstruct %190 %190 %190 %190 
					                                 f32_4 %194 = OpFMul %191 %193 
					                                                OpStore %43 %194 
					                                   f32 %195 = OpLoad %32 
					                                 f32_4 %196 = OpCompositeConstruct %195 %195 %195 %195 
					                                 f32_4 %199 = OpFMul %196 %198 
					                                 f32_4 %200 = OpLoad %43 
					                                 f32_4 %201 = OpFAdd %199 %200 
					                                                OpStore %43 %201 
					                                   f32 %202 = OpLoad %180 
					                                   f32 %203 = OpFMul %202 %142 
					                                   f32 %204 = OpFAdd %203 %167 
					                                                OpStore %32 %204 
					                                   f32 %206 = OpLoad %180 
					                                  bool %207 = OpFOrdLessThan %206 %128 
					                                                OpStore %205 %207 
					                                   f32 %209 = OpLoad %32 
					                                   f32 %210 = OpFNegate %209 
					                                   f32 %211 = OpFAdd %210 %136 
					                          Private f32* %212 = OpAccessChain %208 %46 
					                                                OpStore %212 %211 
					                                   f32 %214 = OpLoad %32 
					                                 f32_4 %215 = OpCompositeConstruct %214 %214 %214 %214 
					                                 f32_4 %219 = OpFMul %215 %218 
					                                                OpStore %213 %219 
					                                 f32_4 %220 = OpLoad %208 
					                                 f32_4 %221 = OpVectorShuffle %220 %220 0 0 0 0 
					                                 f32_4 %223 = OpFMul %221 %222 
					                                 f32_4 %224 = OpLoad %213 
					                                 f32_4 %225 = OpFAdd %223 %224 
					                                                OpStore %208 %225 
					                                  bool %226 = OpLoad %205 
					                                 f32_4 %227 = OpLoad %43 
					                                 f32_4 %228 = OpLoad %208 
					                                bool_4 %230 = OpCompositeConstruct %226 %226 %226 %226 
					                                 f32_4 %231 = OpSelect %230 %227 %228 
					                                                OpStore %43 %231 
					                          Private f32* %232 = OpAccessChain %9 %46 
					                                   f32 %233 = OpLoad %232 
					                                   f32 %234 = OpFNegate %233 
					                          Private f32* %235 = OpAccessChain %9 %46 
					                                   f32 %236 = OpLoad %235 
					                                   f32 %237 = OpFMul %234 %236 
					                                   f32 %238 = OpFAdd %237 %136 
					                          Private f32* %239 = OpAccessChain %9 %46 
					                                                OpStore %239 %238 
					                          Private f32* %240 = OpAccessChain %9 %34 
					                                   f32 %241 = OpLoad %240 
					                                   f32 %242 = OpFNegate %241 
					                          Private f32* %243 = OpAccessChain %9 %34 
					                                   f32 %244 = OpLoad %243 
					                                   f32 %245 = OpFMul %242 %244 
					                          Private f32* %246 = OpAccessChain %9 %46 
					                                   f32 %247 = OpLoad %246 
					                                   f32 %248 = OpFAdd %245 %247 
					                          Private f32* %249 = OpAccessChain %9 %46 
					                                                OpStore %249 %248 
					                                 f32_3 %252 = OpLoad %9 
					                                 f32_4 %253 = OpVectorShuffle %252 %252 0 0 0 0 
					                                 f32_4 %254 = OpLoad %43 
					                                 f32_4 %255 = OpFMul %253 %254 
					                                                OpStore %251 %255 
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
						float _Vignette;
						float _Linecount;
						vec4 unused_0_5;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat5;
					float u_xlat16_5;
					bool u_xlatb5;
					float u_xlat8;
					float u_xlat16_8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12 = u_xlat0.y * _Linecount;
					    u_xlat1.x = floor(u_xlat12);
					    u_xlat0.z = u_xlat1.x / _Linecount;
					    u_xlat1.xy = vec2(_TimeX) * vec2(9.0, 7.0) + u_xlat0.xz;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat5.xy = u_xlat10_1.xx * vec2(0.0100000007, 0.0) + u_xlat0.xz;
					    u_xlat16_8 = u_xlat10_1.x * 0.300000012 + 0.699999988;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = abs(u_xlat0.xy) * vec2(_Vignette);
					    u_xlat10_1 = texture(_MainTex, u_xlat5.xy);
					    u_xlat16_1 = dot(u_xlat10_1.xyz, vec3(0.200000003, 0.5, 0.300000012));
					    u_xlat16_5 = (-u_xlat16_1) * u_xlat16_8 + 1.0;
					    u_xlat16_8 = u_xlat16_8 * u_xlat16_1;
					    u_xlat16_1 = u_xlat16_5 * 2.0 + 0.5;
					    u_xlatb5 = u_xlat12>=(-u_xlat12);
					    u_xlat12 = fract(abs(u_xlat12));
					    u_xlat12 = (u_xlatb5) ? u_xlat12 : (-u_xlat12);
					    u_xlat12 = u_xlat12 * 2.0 + -1.0;
					    u_xlat12 = -abs(u_xlat12) + 1.0;
					    u_xlat12 = log2(u_xlat12);
					    u_xlat12 = u_xlat12 * u_xlat16_1;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat8 = u_xlat16_8 * u_xlat12;
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat12 = (-u_xlat8) * 2.0 + 1.0;
					    u_xlat1 = vec4(u_xlat8) * vec4(0.400000006, 1.0, 0.200000003, 2.0);
					    u_xlat1 = vec4(u_xlat12) * vec4(0.0, 0.100000001, 0.0, 1.0) + u_xlat1;
					    u_xlat12 = u_xlat8 * 2.0 + -1.0;
					    u_xlatb8 = u_xlat8<0.5;
					    u_xlat2.x = (-u_xlat12) + 1.0;
					    u_xlat3 = vec4(u_xlat12) * vec4(0.899999976, 1.0, 0.600000024, 1.0);
					    u_xlat2 = u_xlat2.xxxx * vec4(0.200000003, 0.5, 0.100000001, 1.0) + u_xlat3;
					    u_xlat1 = (bool(u_xlatb8)) ? u_xlat1 : u_xlat2;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = (-u_xlat0.y) * u_xlat0.y + u_xlat0.x;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
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