Shader "Hidden/Post FX/Bloom" {
	Properties {
		_MainTex ("", 2D) = "" {}
		_BaseTex ("", 2D) = "" {}
		_AutoExposure ("", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 22696
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _MainTex_ST;
					uniform 	float _PrefilterOffs;
					uniform 	float _Threshold;
					uniform 	vec3 _Curve;
					UNITY_LOCATION(0) uniform  sampler2D _AutoExposure;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_AutoExposure, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_1.xxx * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_6 = max(u_xlat16_0.z, u_xlat16_0.y);
					    u_xlat16_6 = max(u_xlat16_6, u_xlat16_0.x);
					    u_xlat1 = u_xlat16_6 + (-_Curve.x);
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat1 = min(u_xlat1, _Curve.y);
					    u_xlat3 = u_xlat1 * _Curve.z;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat3 = u_xlat16_6 + (-_Threshold);
					    u_xlat16_6 = max(u_xlat16_6, 9.99999975e-06);
					    u_xlat1 = max(u_xlat3, u_xlat1);
					    u_xlat6 = u_xlat1 / u_xlat16_6;
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 168
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %33 %160 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 33 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %55 RelaxedPrecision 
					                                                      OpDecorate %55 DescriptorSet 55 
					                                                      OpDecorate %55 Binding 55 
					                                                      OpDecorate %56 RelaxedPrecision 
					                                                      OpDecorate %59 RelaxedPrecision 
					                                                      OpDecorate %59 DescriptorSet 59 
					                                                      OpDecorate %59 Binding 59 
					                                                      OpDecorate %60 RelaxedPrecision 
					                                                      OpDecorate %68 RelaxedPrecision 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %71 RelaxedPrecision 
					                                                      OpDecorate %71 DescriptorSet 71 
					                                                      OpDecorate %71 Binding 71 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %73 RelaxedPrecision 
					                                                      OpDecorate %73 DescriptorSet 73 
					                                                      OpDecorate %73 Binding 73 
					                                                      OpDecorate %74 RelaxedPrecision 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %82 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %89 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %160 Location 160 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %10 %10 %6 %6 %7 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32_4; f32; f32; f32_3;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 0 
					                                              %16 = OpTypeVector %6 2 
					                                              %17 = OpTypePointer Uniform %10 
					                                          i32 %21 = OpConstant 2 
					                                              %22 = OpTypePointer Uniform %6 
					                                              %32 = OpTypePointer Input %16 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %40 = OpConstant 1 
					                                              %51 = OpTypePointer Private %6 
					                                 Private f32* %52 = OpVariable Private 
					                                              %53 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %54 = OpTypePointer UniformConstant %53 
					         UniformConstant read_only Texture2D* %55 = OpVariable UniformConstant 
					                                              %57 = OpTypeSampler 
					                                              %58 = OpTypePointer UniformConstant %57 
					                     UniformConstant sampler* %59 = OpVariable UniformConstant 
					                                              %61 = OpTypeSampledImage %53 
					                                              %66 = OpTypeInt 32 0 
					                                          u32 %67 = OpConstant 0 
					                                              %69 = OpTypePointer Private %10 
					                               Private f32_4* %70 = OpVariable Private 
					         UniformConstant read_only Texture2D* %71 = OpVariable UniformConstant 
					                     UniformConstant sampler* %73 = OpVariable UniformConstant 
					                               Private f32_3* %82 = OpVariable Private 
					                               Private f32_3* %88 = OpVariable Private 
					                                          f32 %90 = OpConstant 3,674022E-40 
					                                        f32_3 %91 = OpConstantComposite %90 %90 %90 
					                                 Private f32* %93 = OpVariable Private 
					                                          u32 %94 = OpConstant 2 
					                                          u32 %97 = OpConstant 1 
					                                         i32 %106 = OpConstant 4 
					                                         f32 %114 = OpConstant 3,674022E-40 
					                                Private f32* %135 = OpVariable Private 
					                                         i32 %137 = OpConstant 3 
					                                         f32 %143 = OpConstant 3,674022E-40 
					                                             %159 = OpTypePointer Output %10 
					                               Output f32_4* %160 = OpVariable Output 
					                                         u32 %164 = OpConstant 3 
					                                             %165 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Uniform f32_4* %18 = OpAccessChain %13 %15 
					                                        f32_4 %19 = OpLoad %18 
					                                        f32_2 %20 = OpVectorShuffle %19 %19 0 1 
					                                 Uniform f32* %23 = OpAccessChain %13 %21 
					                                          f32 %24 = OpLoad %23 
					                                 Uniform f32* %25 = OpAccessChain %13 %21 
					                                          f32 %26 = OpLoad %25 
					                                        f32_2 %27 = OpCompositeConstruct %24 %26 
					                                          f32 %28 = OpCompositeExtract %27 0 
					                                          f32 %29 = OpCompositeExtract %27 1 
					                                        f32_2 %30 = OpCompositeConstruct %28 %29 
					                                        f32_2 %31 = OpFMul %20 %30 
					                                        f32_2 %34 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %35 = OpFAdd %31 %34 
					                                        f32_3 %36 = OpLoad %9 
					                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
					                                                      OpStore %9 %37 
					                                        f32_3 %38 = OpLoad %9 
					                                        f32_2 %39 = OpVectorShuffle %38 %38 0 1 
					                               Uniform f32_4* %41 = OpAccessChain %13 %40 
					                                        f32_4 %42 = OpLoad %41 
					                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
					                                        f32_2 %44 = OpFMul %39 %43 
					                               Uniform f32_4* %45 = OpAccessChain %13 %40 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_2 %47 = OpVectorShuffle %46 %46 2 3 
					                                        f32_2 %48 = OpFAdd %44 %47 
					                                        f32_3 %49 = OpLoad %9 
					                                        f32_3 %50 = OpVectorShuffle %49 %48 3 4 2 
					                                                      OpStore %9 %50 
					                          read_only Texture2D %56 = OpLoad %55 
					                                      sampler %60 = OpLoad %59 
					                   read_only Texture2DSampled %62 = OpSampledImage %56 %60 
					                                        f32_3 %63 = OpLoad %9 
					                                        f32_2 %64 = OpVectorShuffle %63 %63 0 1 
					                                        f32_4 %65 = OpImageSampleImplicitLod %62 %64 
					                                          f32 %68 = OpCompositeExtract %65 0 
					                                                      OpStore %52 %68 
					                          read_only Texture2D %72 = OpLoad %71 
					                                      sampler %74 = OpLoad %73 
					                   read_only Texture2DSampled %75 = OpSampledImage %72 %74 
					                                        f32_3 %76 = OpLoad %9 
					                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
					                                        f32_4 %78 = OpImageSampleImplicitLod %75 %77 
					                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
					                                        f32_4 %80 = OpLoad %70 
					                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 2 6 
					                                                      OpStore %70 %81 
					                                          f32 %83 = OpLoad %52 
					                                        f32_3 %84 = OpCompositeConstruct %83 %83 %83 
					                                        f32_4 %85 = OpLoad %70 
					                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 3 
					                                        f32_3 %87 = OpFMul %84 %86 
					                                                      OpStore %82 %87 
					                                        f32_3 %89 = OpLoad %82 
					                                        f32_3 %92 = OpExtInst %1 37 %89 %91 
					                                                      OpStore %88 %92 
					                                 Private f32* %95 = OpAccessChain %88 %94 
					                                          f32 %96 = OpLoad %95 
					                                 Private f32* %98 = OpAccessChain %88 %97 
					                                          f32 %99 = OpLoad %98 
					                                         f32 %100 = OpExtInst %1 40 %96 %99 
					                                                      OpStore %93 %100 
					                                         f32 %101 = OpLoad %93 
					                                Private f32* %102 = OpAccessChain %88 %67 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpExtInst %1 40 %101 %103 
					                                                      OpStore %93 %104 
					                                         f32 %105 = OpLoad %93 
					                                Uniform f32* %107 = OpAccessChain %13 %106 %67 
					                                         f32 %108 = OpLoad %107 
					                                         f32 %109 = OpFNegate %108 
					                                         f32 %110 = OpFAdd %105 %109 
					                                Private f32* %111 = OpAccessChain %9 %67 
					                                                      OpStore %111 %110 
					                                Private f32* %112 = OpAccessChain %9 %67 
					                                         f32 %113 = OpLoad %112 
					                                         f32 %115 = OpExtInst %1 40 %113 %114 
					                                Private f32* %116 = OpAccessChain %9 %67 
					                                                      OpStore %116 %115 
					                                Private f32* %117 = OpAccessChain %9 %67 
					                                         f32 %118 = OpLoad %117 
					                                Uniform f32* %119 = OpAccessChain %13 %106 %97 
					                                         f32 %120 = OpLoad %119 
					                                         f32 %121 = OpExtInst %1 37 %118 %120 
					                                Private f32* %122 = OpAccessChain %9 %67 
					                                                      OpStore %122 %121 
					                                Private f32* %123 = OpAccessChain %9 %67 
					                                         f32 %124 = OpLoad %123 
					                                Private f32* %125 = OpAccessChain %9 %67 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpFMul %124 %126 
					                                Private f32* %128 = OpAccessChain %9 %67 
					                                                      OpStore %128 %127 
					                                Private f32* %129 = OpAccessChain %9 %67 
					                                         f32 %130 = OpLoad %129 
					                                Uniform f32* %131 = OpAccessChain %13 %106 %94 
					                                         f32 %132 = OpLoad %131 
					                                         f32 %133 = OpFMul %130 %132 
					                                Private f32* %134 = OpAccessChain %9 %67 
					                                                      OpStore %134 %133 
					                                         f32 %136 = OpLoad %93 
					                                Uniform f32* %138 = OpAccessChain %13 %137 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFNegate %139 
					                                         f32 %141 = OpFAdd %136 %140 
					                                                      OpStore %135 %141 
					                                         f32 %142 = OpLoad %93 
					                                         f32 %144 = OpExtInst %1 40 %142 %143 
					                                                      OpStore %93 %144 
					                                         f32 %145 = OpLoad %135 
					                                Private f32* %146 = OpAccessChain %9 %67 
					                                         f32 %147 = OpLoad %146 
					                                         f32 %148 = OpExtInst %1 40 %145 %147 
					                                Private f32* %149 = OpAccessChain %9 %67 
					                                                      OpStore %149 %148 
					                                Private f32* %150 = OpAccessChain %9 %67 
					                                         f32 %151 = OpLoad %150 
					                                         f32 %152 = OpLoad %93 
					                                         f32 %153 = OpFDiv %151 %152 
					                                Private f32* %154 = OpAccessChain %9 %67 
					                                                      OpStore %154 %153 
					                                       f32_3 %155 = OpLoad %9 
					                                       f32_3 %156 = OpVectorShuffle %155 %155 0 0 0 
					                                       f32_3 %157 = OpLoad %88 
					                                       f32_3 %158 = OpFMul %156 %157 
					                                                      OpStore %9 %158 
					                                       f32_3 %161 = OpLoad %9 
					                                       f32_4 %162 = OpLoad %160 
					                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
					                                                      OpStore %160 %163 
					                                 Output f32* %166 = OpAccessChain %160 %164 
					                                                      OpStore %166 %114 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_COLORSPACE_GAMMA" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "UNITY_COLORSPACE_GAMMA" }
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _MainTex_ST;
					uniform 	float _PrefilterOffs;
					uniform 	float _Threshold;
					uniform 	vec3 _Curve;
					UNITY_LOCATION(0) uniform  sampler2D _AutoExposure;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_AutoExposure, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_1.xxx * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
					    u_xlat16_6 = max(u_xlat16_0.z, u_xlat16_0.y);
					    u_xlat16_6 = max(u_xlat16_6, u_xlat16_0.x);
					    u_xlat1 = u_xlat16_6 + (-_Curve.x);
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat1 = min(u_xlat1, _Curve.y);
					    u_xlat3 = u_xlat1 * _Curve.z;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat3 = u_xlat16_6 + (-_Threshold);
					    u_xlat16_6 = max(u_xlat16_6, 9.99999975e-06);
					    u_xlat1 = max(u_xlat3, u_xlat1);
					    u_xlat6 = u_xlat1 / u_xlat16_6;
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "UNITY_COLORSPACE_GAMMA" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 178
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %33 %170 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 33 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %55 RelaxedPrecision 
					                                                      OpDecorate %55 DescriptorSet 55 
					                                                      OpDecorate %55 Binding 55 
					                                                      OpDecorate %56 RelaxedPrecision 
					                                                      OpDecorate %59 RelaxedPrecision 
					                                                      OpDecorate %59 DescriptorSet 59 
					                                                      OpDecorate %59 Binding 59 
					                                                      OpDecorate %60 RelaxedPrecision 
					                                                      OpDecorate %68 RelaxedPrecision 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %71 RelaxedPrecision 
					                                                      OpDecorate %71 DescriptorSet 71 
					                                                      OpDecorate %71 Binding 71 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %73 RelaxedPrecision 
					                                                      OpDecorate %73 DescriptorSet 73 
					                                                      OpDecorate %73 Binding 73 
					                                                      OpDecorate %74 RelaxedPrecision 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %82 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %89 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %166 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %170 Location 170 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %10 %10 %6 %6 %7 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32_4; f32; f32; f32_3;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 0 
					                                              %16 = OpTypeVector %6 2 
					                                              %17 = OpTypePointer Uniform %10 
					                                          i32 %21 = OpConstant 2 
					                                              %22 = OpTypePointer Uniform %6 
					                                              %32 = OpTypePointer Input %16 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %40 = OpConstant 1 
					                                              %51 = OpTypePointer Private %6 
					                                 Private f32* %52 = OpVariable Private 
					                                              %53 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %54 = OpTypePointer UniformConstant %53 
					         UniformConstant read_only Texture2D* %55 = OpVariable UniformConstant 
					                                              %57 = OpTypeSampler 
					                                              %58 = OpTypePointer UniformConstant %57 
					                     UniformConstant sampler* %59 = OpVariable UniformConstant 
					                                              %61 = OpTypeSampledImage %53 
					                                              %66 = OpTypeInt 32 0 
					                                          u32 %67 = OpConstant 0 
					                                              %69 = OpTypePointer Private %10 
					                               Private f32_4* %70 = OpVariable Private 
					         UniformConstant read_only Texture2D* %71 = OpVariable UniformConstant 
					                     UniformConstant sampler* %73 = OpVariable UniformConstant 
					                               Private f32_3* %82 = OpVariable Private 
					                               Private f32_3* %88 = OpVariable Private 
					                                          f32 %90 = OpConstant 3,674022E-40 
					                                        f32_3 %91 = OpConstantComposite %90 %90 %90 
					                                          f32 %94 = OpConstant 3,674022E-40 
					                                        f32_3 %95 = OpConstantComposite %94 %94 %94 
					                                          f32 %97 = OpConstant 3,674022E-40 
					                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
					                                         f32 %103 = OpConstant 3,674022E-40 
					                                       f32_3 %104 = OpConstantComposite %103 %103 %103 
					                                         u32 %109 = OpConstant 2 
					                                         u32 %112 = OpConstant 1 
					                                Private f32* %123 = OpVariable Private 
					                                         i32 %126 = OpConstant 4 
					                                         f32 %132 = OpConstant 3,674022E-40 
					                                Private f32* %145 = OpVariable Private 
					                                         i32 %148 = OpConstant 3 
					                                         f32 %155 = OpConstant 3,674022E-40 
					                                             %169 = OpTypePointer Output %10 
					                               Output f32_4* %170 = OpVariable Output 
					                                         u32 %174 = OpConstant 3 
					                                             %175 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Uniform f32_4* %18 = OpAccessChain %13 %15 
					                                        f32_4 %19 = OpLoad %18 
					                                        f32_2 %20 = OpVectorShuffle %19 %19 0 1 
					                                 Uniform f32* %23 = OpAccessChain %13 %21 
					                                          f32 %24 = OpLoad %23 
					                                 Uniform f32* %25 = OpAccessChain %13 %21 
					                                          f32 %26 = OpLoad %25 
					                                        f32_2 %27 = OpCompositeConstruct %24 %26 
					                                          f32 %28 = OpCompositeExtract %27 0 
					                                          f32 %29 = OpCompositeExtract %27 1 
					                                        f32_2 %30 = OpCompositeConstruct %28 %29 
					                                        f32_2 %31 = OpFMul %20 %30 
					                                        f32_2 %34 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %35 = OpFAdd %31 %34 
					                                        f32_3 %36 = OpLoad %9 
					                                        f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
					                                                      OpStore %9 %37 
					                                        f32_3 %38 = OpLoad %9 
					                                        f32_2 %39 = OpVectorShuffle %38 %38 0 1 
					                               Uniform f32_4* %41 = OpAccessChain %13 %40 
					                                        f32_4 %42 = OpLoad %41 
					                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
					                                        f32_2 %44 = OpFMul %39 %43 
					                               Uniform f32_4* %45 = OpAccessChain %13 %40 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_2 %47 = OpVectorShuffle %46 %46 2 3 
					                                        f32_2 %48 = OpFAdd %44 %47 
					                                        f32_3 %49 = OpLoad %9 
					                                        f32_3 %50 = OpVectorShuffle %49 %48 3 4 2 
					                                                      OpStore %9 %50 
					                          read_only Texture2D %56 = OpLoad %55 
					                                      sampler %60 = OpLoad %59 
					                   read_only Texture2DSampled %62 = OpSampledImage %56 %60 
					                                        f32_3 %63 = OpLoad %9 
					                                        f32_2 %64 = OpVectorShuffle %63 %63 0 1 
					                                        f32_4 %65 = OpImageSampleImplicitLod %62 %64 
					                                          f32 %68 = OpCompositeExtract %65 0 
					                                                      OpStore %52 %68 
					                          read_only Texture2D %72 = OpLoad %71 
					                                      sampler %74 = OpLoad %73 
					                   read_only Texture2DSampled %75 = OpSampledImage %72 %74 
					                                        f32_3 %76 = OpLoad %9 
					                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
					                                        f32_4 %78 = OpImageSampleImplicitLod %75 %77 
					                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
					                                        f32_4 %80 = OpLoad %70 
					                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 2 6 
					                                                      OpStore %70 %81 
					                                          f32 %83 = OpLoad %52 
					                                        f32_3 %84 = OpCompositeConstruct %83 %83 %83 
					                                        f32_4 %85 = OpLoad %70 
					                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 3 
					                                        f32_3 %87 = OpFMul %84 %86 
					                                                      OpStore %82 %87 
					                                        f32_3 %89 = OpLoad %82 
					                                        f32_3 %92 = OpExtInst %1 37 %89 %91 
					                                                      OpStore %88 %92 
					                                        f32_3 %93 = OpLoad %88 
					                                        f32_3 %96 = OpFMul %93 %95 
					                                        f32_3 %99 = OpFAdd %96 %98 
					                                                      OpStore %82 %99 
					                                       f32_3 %100 = OpLoad %88 
					                                       f32_3 %101 = OpLoad %82 
					                                       f32_3 %102 = OpFMul %100 %101 
					                                       f32_3 %105 = OpFAdd %102 %104 
					                                                      OpStore %82 %105 
					                                       f32_3 %106 = OpLoad %82 
					                                       f32_3 %107 = OpLoad %88 
					                                       f32_3 %108 = OpFMul %106 %107 
					                                                      OpStore %82 %108 
					                                Private f32* %110 = OpAccessChain %82 %109 
					                                         f32 %111 = OpLoad %110 
					                                Private f32* %113 = OpAccessChain %82 %112 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %115 = OpExtInst %1 40 %111 %114 
					                                Private f32* %116 = OpAccessChain %88 %67 
					                                                      OpStore %116 %115 
					                                Private f32* %117 = OpAccessChain %82 %67 
					                                         f32 %118 = OpLoad %117 
					                                Private f32* %119 = OpAccessChain %88 %67 
					                                         f32 %120 = OpLoad %119 
					                                         f32 %121 = OpExtInst %1 40 %118 %120 
					                                Private f32* %122 = OpAccessChain %88 %67 
					                                                      OpStore %122 %121 
					                                Private f32* %124 = OpAccessChain %88 %67 
					                                         f32 %125 = OpLoad %124 
					                                Uniform f32* %127 = OpAccessChain %13 %126 %67 
					                                         f32 %128 = OpLoad %127 
					                                         f32 %129 = OpFNegate %128 
					                                         f32 %130 = OpFAdd %125 %129 
					                                                      OpStore %123 %130 
					                                         f32 %131 = OpLoad %123 
					                                         f32 %133 = OpExtInst %1 40 %131 %132 
					                                                      OpStore %123 %133 
					                                         f32 %134 = OpLoad %123 
					                                Uniform f32* %135 = OpAccessChain %13 %126 %112 
					                                         f32 %136 = OpLoad %135 
					                                         f32 %137 = OpExtInst %1 37 %134 %136 
					                                                      OpStore %123 %137 
					                                         f32 %138 = OpLoad %123 
					                                         f32 %139 = OpLoad %123 
					                                         f32 %140 = OpFMul %138 %139 
					                                                      OpStore %123 %140 
					                                         f32 %141 = OpLoad %123 
					                                Uniform f32* %142 = OpAccessChain %13 %126 %109 
					                                         f32 %143 = OpLoad %142 
					                                         f32 %144 = OpFMul %141 %143 
					                                                      OpStore %123 %144 
					                                Private f32* %146 = OpAccessChain %88 %67 
					                                         f32 %147 = OpLoad %146 
					                                Uniform f32* %149 = OpAccessChain %13 %148 
					                                         f32 %150 = OpLoad %149 
					                                         f32 %151 = OpFNegate %150 
					                                         f32 %152 = OpFAdd %147 %151 
					                                                      OpStore %145 %152 
					                                Private f32* %153 = OpAccessChain %88 %67 
					                                         f32 %154 = OpLoad %153 
					                                         f32 %156 = OpExtInst %1 40 %154 %155 
					                                Private f32* %157 = OpAccessChain %88 %67 
					                                                      OpStore %157 %156 
					                                         f32 %158 = OpLoad %123 
					                                         f32 %159 = OpLoad %145 
					                                         f32 %160 = OpExtInst %1 40 %158 %159 
					                                                      OpStore %123 %160 
					                                         f32 %161 = OpLoad %123 
					                                Private f32* %162 = OpAccessChain %88 %67 
					                                         f32 %163 = OpLoad %162 
					                                         f32 %164 = OpFDiv %161 %163 
					                                                      OpStore %123 %164 
					                                         f32 %165 = OpLoad %123 
					                                       f32_3 %166 = OpCompositeConstruct %165 %165 %165 
					                                       f32_3 %167 = OpLoad %82 
					                                       f32_3 %168 = OpFMul %166 %167 
					                                                      OpStore %9 %168 
					                                       f32_3 %171 = OpLoad %9 
					                                       f32_4 %172 = OpLoad %170 
					                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
					                                                      OpStore %170 %173 
					                                 Output f32* %176 = OpAccessChain %170 %174 
					                                                      OpStore %176 %132 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "ANTI_FLICKER" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "ANTI_FLICKER" }
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _MainTex_ST;
					uniform 	float _PrefilterOffs;
					uniform 	float _Threshold;
					uniform 	vec3 _Curve;
					UNITY_LOCATION(0) uniform  sampler2D _AutoExposure;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat16_6;
					vec4 u_xlat10_6;
					float u_xlat8;
					float u_xlat21;
					float u_xlat16_21;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(vec4(_PrefilterOffs, _PrefilterOffs, _PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_2 = texture(_AutoExposure, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1.xyz = u_xlat10_2.xxx * u_xlat10_1.xyz;
					    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat2 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
					    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
					    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat10_3 = texture(_AutoExposure, u_xlat2.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_3.xyz = u_xlat10_3.xxx * u_xlat10_4.xyz;
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_4.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
					    u_xlat10_5 = texture(_AutoExposure, u_xlat0.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_5.xyz = u_xlat10_5.xxx * u_xlat10_6.xyz;
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
					    u_xlat16_6.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_5.xyz, u_xlat16_1.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_1.xyz = (-u_xlat16_1.xyz) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture(_AutoExposure, u_xlat2.zw);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2.xyz = u_xlat10_3.xxx * u_xlat10_2.xyz;
					    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat10_4 = texture(_AutoExposure, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_4.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_4.xyz);
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_21 = max(u_xlat16_0.z, u_xlat16_0.y);
					    u_xlat16_21 = max(u_xlat16_21, u_xlat16_0.x);
					    u_xlat1.x = u_xlat16_21 + (-_Curve.x);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _Curve.y);
					    u_xlat8 = u_xlat1.x * _Curve.z;
					    u_xlat1.x = u_xlat1.x * u_xlat8;
					    u_xlat8 = u_xlat16_21 + (-_Threshold);
					    u_xlat16_21 = max(u_xlat16_21, 9.99999975e-06);
					    u_xlat1.x = max(u_xlat8, u_xlat1.x);
					    u_xlat21 = u_xlat1.x / u_xlat16_21;
					    SV_Target0.xyz = vec3(u_xlat21) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "ANTI_FLICKER" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 358
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %39 %349 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 39 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %61 DescriptorSet 61 
					                                                      OpDecorate %61 Binding 61 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %65 RelaxedPrecision 
					                                                      OpDecorate %65 DescriptorSet 65 
					                                                      OpDecorate %65 Binding 65 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %74 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %76 DescriptorSet 76 
					                                                      OpDecorate %76 Binding 76 
					                                                      OpDecorate %77 RelaxedPrecision 
					                                                      OpDecorate %78 RelaxedPrecision 
					                                                      OpDecorate %78 DescriptorSet 78 
					                                                      OpDecorate %78 Binding 78 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %89 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
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
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %232 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %244 RelaxedPrecision 
					                                                      OpDecorate %245 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %252 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %323 RelaxedPrecision 
					                                                      OpDecorate %329 RelaxedPrecision 
					                                                      OpDecorate %331 RelaxedPrecision 
					                                                      OpDecorate %339 RelaxedPrecision 
					                                                      OpDecorate %344 RelaxedPrecision 
					                                                      OpDecorate %349 RelaxedPrecision 
					                                                      OpDecorate %349 Location 349 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 3 
					                                              %11 = OpTypeStruct %7 %7 %6 %6 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32_4; f32; f32; f32_3;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 0 
					                                              %16 = OpTypePointer Uniform %7 
					                                          i32 %20 = OpConstant 2 
					                                              %21 = OpTypePointer Uniform %6 
					                                              %37 = OpTypeVector %6 2 
					                                              %38 = OpTypePointer Input %37 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                               Private f32_4* %43 = OpVariable Private 
					                                          i32 %46 = OpConstant 1 
					                                              %57 = OpTypePointer Private %6 
					                                 Private f32* %58 = OpVariable Private 
					                                              %59 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %60 = OpTypePointer UniformConstant %59 
					         UniformConstant read_only Texture2D* %61 = OpVariable UniformConstant 
					                                              %63 = OpTypeSampler 
					                                              %64 = OpTypePointer UniformConstant %63 
					                     UniformConstant sampler* %65 = OpVariable UniformConstant 
					                                              %67 = OpTypeSampledImage %59 
					                                              %72 = OpTypeInt 32 0 
					                                          u32 %73 = OpConstant 0 
					                               Private f32_4* %75 = OpVariable Private 
					         UniformConstant read_only Texture2D* %76 = OpVariable UniformConstant 
					                     UniformConstant sampler* %78 = OpVariable UniformConstant 
					                                              %87 = OpTypePointer Private %10 
					                               Private f32_3* %88 = OpVariable Private 
					                               Private f32_3* %94 = OpVariable Private 
					                                          f32 %96 = OpConstant 3,674022E-40 
					                                        f32_3 %97 = OpConstantComposite %96 %96 %96 
					                                         f32 %103 = OpConstant 3,674022E-40 
					                                         f32 %104 = OpConstant 3,674022E-40 
					                                       f32_4 %105 = OpConstantComposite %103 %104 %104 %103 
					                              Private f32_3* %134 = OpVariable Private 
					                              Private f32_3* %143 = OpVariable Private 
					                              Private f32_3* %151 = OpVariable Private 
					                              Private f32_3* %156 = OpVariable Private 
					                              Private f32_3* %159 = OpVariable Private 
					                              Private f32_3* %182 = OpVariable Private 
					                              Private f32_3* %188 = OpVariable Private 
					                                Private f32* %209 = OpVariable Private 
					                              Private f32_3* %243 = OpVariable Private 
					                              Private f32_3* %251 = OpVariable Private 
					                                Private f32* %281 = OpVariable Private 
					                                         u32 %282 = OpConstant 2 
					                                         u32 %285 = OpConstant 1 
					                                         i32 %294 = OpConstant 4 
					                                Private f32* %322 = OpVariable Private 
					                                         i32 %324 = OpConstant 3 
					                                         f32 %330 = OpConstant 3,674022E-40 
					                                             %348 = OpTypePointer Output %7 
					                               Output f32_4* %349 = OpVariable Output 
					                                         u32 %354 = OpConstant 3 
					                                             %355 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Uniform f32_4* %17 = OpAccessChain %13 %15 
					                                        f32_4 %18 = OpLoad %17 
					                                        f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
					                                 Uniform f32* %22 = OpAccessChain %13 %20 
					                                          f32 %23 = OpLoad %22 
					                                 Uniform f32* %24 = OpAccessChain %13 %20 
					                                          f32 %25 = OpLoad %24 
					                                 Uniform f32* %26 = OpAccessChain %13 %20 
					                                          f32 %27 = OpLoad %26 
					                                 Uniform f32* %28 = OpAccessChain %13 %20 
					                                          f32 %29 = OpLoad %28 
					                                        f32_4 %30 = OpCompositeConstruct %23 %25 %27 %29 
					                                          f32 %31 = OpCompositeExtract %30 0 
					                                          f32 %32 = OpCompositeExtract %30 1 
					                                          f32 %33 = OpCompositeExtract %30 2 
					                                          f32 %34 = OpCompositeExtract %30 3 
					                                        f32_4 %35 = OpCompositeConstruct %31 %32 %33 %34 
					                                        f32_4 %36 = OpFMul %19 %35 
					                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
					                                        f32_4 %41 = OpVectorShuffle %40 %40 0 1 0 1 
					                                        f32_4 %42 = OpFAdd %36 %41 
					                                                      OpStore %9 %42 
					                                        f32_4 %44 = OpLoad %9 
					                                        f32_2 %45 = OpVectorShuffle %44 %44 2 3 
					                               Uniform f32_4* %47 = OpAccessChain %13 %46 
					                                        f32_4 %48 = OpLoad %47 
					                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                        f32_2 %50 = OpFMul %45 %49 
					                               Uniform f32_4* %51 = OpAccessChain %13 %46 
					                                        f32_4 %52 = OpLoad %51 
					                                        f32_2 %53 = OpVectorShuffle %52 %52 2 3 
					                                        f32_2 %54 = OpFAdd %50 %53 
					                                        f32_4 %55 = OpLoad %43 
					                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 2 3 
					                                                      OpStore %43 %56 
					                          read_only Texture2D %62 = OpLoad %61 
					                                      sampler %66 = OpLoad %65 
					                   read_only Texture2DSampled %68 = OpSampledImage %62 %66 
					                                        f32_4 %69 = OpLoad %43 
					                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
					                                        f32_4 %71 = OpImageSampleImplicitLod %68 %70 
					                                          f32 %74 = OpCompositeExtract %71 0 
					                                                      OpStore %58 %74 
					                          read_only Texture2D %77 = OpLoad %76 
					                                      sampler %79 = OpLoad %78 
					                   read_only Texture2DSampled %80 = OpSampledImage %77 %79 
					                                        f32_4 %81 = OpLoad %43 
					                                        f32_2 %82 = OpVectorShuffle %81 %81 0 1 
					                                        f32_4 %83 = OpImageSampleImplicitLod %80 %82 
					                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
					                                        f32_4 %85 = OpLoad %75 
					                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 2 6 
					                                                      OpStore %75 %86 
					                                          f32 %89 = OpLoad %58 
					                                        f32_3 %90 = OpCompositeConstruct %89 %89 %89 
					                                        f32_4 %91 = OpLoad %75 
					                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 3 
					                                        f32_3 %93 = OpFMul %90 %92 
					                                                      OpStore %88 %93 
					                                        f32_3 %95 = OpLoad %88 
					                                        f32_3 %98 = OpExtInst %1 37 %95 %97 
					                                                      OpStore %94 %98 
					                               Uniform f32_4* %99 = OpAccessChain %13 %15 
					                                       f32_4 %100 = OpLoad %99 
					                                       f32_4 %101 = OpVectorShuffle %100 %100 0 0 0 1 
					                                       f32_4 %102 = OpFNegate %101 
					                                       f32_4 %106 = OpFMul %102 %105 
					                                       f32_4 %107 = OpLoad %9 
					                                       f32_4 %108 = OpVectorShuffle %107 %107 2 3 2 3 
					                                       f32_4 %109 = OpFAdd %106 %108 
					                                                      OpStore %43 %109 
					                              Uniform f32_4* %110 = OpAccessChain %13 %15 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_4 %112 = OpVectorShuffle %111 %111 0 0 0 1 
					                                       f32_4 %113 = OpFMul %112 %105 
					                                       f32_4 %114 = OpLoad %9 
					                                       f32_4 %115 = OpFAdd %113 %114 
					                                                      OpStore %9 %115 
					                                       f32_4 %116 = OpLoad %9 
					                              Uniform f32_4* %117 = OpAccessChain %13 %46 
					                                       f32_4 %118 = OpLoad %117 
					                                       f32_4 %119 = OpVectorShuffle %118 %118 0 1 0 1 
					                                       f32_4 %120 = OpFMul %116 %119 
					                              Uniform f32_4* %121 = OpAccessChain %13 %46 
					                                       f32_4 %122 = OpLoad %121 
					                                       f32_4 %123 = OpVectorShuffle %122 %122 2 3 2 3 
					                                       f32_4 %124 = OpFAdd %120 %123 
					                                                      OpStore %9 %124 
					                                       f32_4 %125 = OpLoad %43 
					                              Uniform f32_4* %126 = OpAccessChain %13 %46 
					                                       f32_4 %127 = OpLoad %126 
					                                       f32_4 %128 = OpVectorShuffle %127 %127 0 1 0 1 
					                                       f32_4 %129 = OpFMul %125 %128 
					                              Uniform f32_4* %130 = OpAccessChain %13 %46 
					                                       f32_4 %131 = OpLoad %130 
					                                       f32_4 %132 = OpVectorShuffle %131 %131 2 3 2 3 
					                                       f32_4 %133 = OpFAdd %129 %132 
					                                                      OpStore %43 %133 
					                         read_only Texture2D %135 = OpLoad %61 
					                                     sampler %136 = OpLoad %65 
					                  read_only Texture2DSampled %137 = OpSampledImage %135 %136 
					                                       f32_4 %138 = OpLoad %43 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                                       f32_4 %140 = OpImageSampleImplicitLod %137 %139 
					                                         f32 %141 = OpCompositeExtract %140 0 
					                                Private f32* %142 = OpAccessChain %134 %73 
					                                                      OpStore %142 %141 
					                         read_only Texture2D %144 = OpLoad %76 
					                                     sampler %145 = OpLoad %78 
					                  read_only Texture2DSampled %146 = OpSampledImage %144 %145 
					                                       f32_4 %147 = OpLoad %43 
					                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
					                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
					                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
					                                                      OpStore %143 %150 
					                                       f32_3 %152 = OpLoad %134 
					                                       f32_3 %153 = OpVectorShuffle %152 %152 0 0 0 
					                                       f32_3 %154 = OpLoad %143 
					                                       f32_3 %155 = OpFMul %153 %154 
					                                                      OpStore %151 %155 
					                                       f32_3 %157 = OpLoad %151 
					                                       f32_3 %158 = OpExtInst %1 37 %157 %97 
					                                                      OpStore %156 %158 
					                                       f32_3 %160 = OpLoad %94 
					                                       f32_3 %161 = OpLoad %156 
					                                       f32_3 %162 = OpFAdd %160 %161 
					                                                      OpStore %159 %162 
					                         read_only Texture2D %163 = OpLoad %61 
					                                     sampler %164 = OpLoad %65 
					                  read_only Texture2DSampled %165 = OpSampledImage %163 %164 
					                                       f32_4 %166 = OpLoad %9 
					                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
					                                       f32_4 %168 = OpImageSampleImplicitLod %165 %167 
					                                         f32 %169 = OpCompositeExtract %168 0 
					                                Private f32* %170 = OpAccessChain %75 %73 
					                                                      OpStore %170 %169 
					                         read_only Texture2D %171 = OpLoad %76 
					                                     sampler %172 = OpLoad %78 
					                  read_only Texture2DSampled %173 = OpSampledImage %171 %172 
					                                       f32_4 %174 = OpLoad %9 
					                                       f32_2 %175 = OpVectorShuffle %174 %174 0 1 
					                                       f32_4 %176 = OpImageSampleImplicitLod %173 %175 
					                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
					                                                      OpStore %134 %177 
					                                       f32_4 %178 = OpLoad %75 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 0 0 
					                                       f32_3 %180 = OpLoad %134 
					                                       f32_3 %181 = OpFMul %179 %180 
					                                                      OpStore %151 %181 
					                                       f32_3 %183 = OpLoad %151 
					                                       f32_3 %184 = OpExtInst %1 37 %183 %97 
					                                                      OpStore %182 %184 
					                                       f32_3 %185 = OpLoad %159 
					                                       f32_3 %186 = OpLoad %182 
					                                       f32_3 %187 = OpFAdd %185 %186 
					                                                      OpStore %159 %187 
					                                       f32_3 %189 = OpLoad %94 
					                                       f32_3 %190 = OpLoad %156 
					                                       f32_3 %191 = OpExtInst %1 37 %189 %190 
					                                                      OpStore %188 %191 
					                                       f32_3 %192 = OpLoad %94 
					                                       f32_3 %193 = OpLoad %156 
					                                       f32_3 %194 = OpExtInst %1 40 %192 %193 
					                                                      OpStore %94 %194 
					                                       f32_3 %195 = OpLoad %182 
					                                       f32_3 %196 = OpLoad %94 
					                                       f32_3 %197 = OpExtInst %1 40 %195 %196 
					                                                      OpStore %94 %197 
					                                       f32_3 %198 = OpLoad %182 
					                                       f32_3 %199 = OpLoad %188 
					                                       f32_3 %200 = OpExtInst %1 37 %198 %199 
					                                                      OpStore %156 %200 
					                                       f32_3 %201 = OpLoad %156 
					                                       f32_3 %202 = OpFNegate %201 
					                                       f32_3 %203 = OpLoad %159 
					                                       f32_3 %204 = OpFAdd %202 %203 
					                                                      OpStore %156 %204 
					                                       f32_3 %205 = OpLoad %94 
					                                       f32_3 %206 = OpFNegate %205 
					                                       f32_3 %207 = OpLoad %156 
					                                       f32_3 %208 = OpFAdd %206 %207 
					                                                      OpStore %94 %208 
					                         read_only Texture2D %210 = OpLoad %61 
					                                     sampler %211 = OpLoad %65 
					                  read_only Texture2DSampled %212 = OpSampledImage %210 %211 
					                                       f32_4 %213 = OpLoad %43 
					                                       f32_2 %214 = OpVectorShuffle %213 %213 2 3 
					                                       f32_4 %215 = OpImageSampleImplicitLod %212 %214 
					                                         f32 %216 = OpCompositeExtract %215 0 
					                                                      OpStore %209 %216 
					                         read_only Texture2D %217 = OpLoad %76 
					                                     sampler %218 = OpLoad %78 
					                  read_only Texture2DSampled %219 = OpSampledImage %217 %218 
					                                       f32_4 %220 = OpLoad %43 
					                                       f32_2 %221 = OpVectorShuffle %220 %220 2 3 
					                                       f32_4 %222 = OpImageSampleImplicitLod %219 %221 
					                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
					                                       f32_4 %224 = OpLoad %75 
					                                       f32_4 %225 = OpVectorShuffle %224 %223 4 5 6 3 
					                                                      OpStore %75 %225 
					                                         f32 %226 = OpLoad %209 
					                                       f32_3 %227 = OpCompositeConstruct %226 %226 %226 
					                                       f32_4 %228 = OpLoad %75 
					                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
					                                       f32_3 %230 = OpFMul %227 %229 
					                                                      OpStore %88 %230 
					                                       f32_3 %231 = OpLoad %88 
					                                       f32_3 %232 = OpExtInst %1 37 %231 %97 
					                                                      OpStore %156 %232 
					                                       f32_3 %233 = OpLoad %94 
					                                       f32_3 %234 = OpLoad %156 
					                                       f32_3 %235 = OpFAdd %233 %234 
					                                                      OpStore %159 %235 
					                         read_only Texture2D %236 = OpLoad %61 
					                                     sampler %237 = OpLoad %65 
					                  read_only Texture2DSampled %238 = OpSampledImage %236 %237 
					                                       f32_4 %239 = OpLoad %9 
					                                       f32_2 %240 = OpVectorShuffle %239 %239 2 3 
					                                       f32_4 %241 = OpImageSampleImplicitLod %238 %240 
					                                         f32 %242 = OpCompositeExtract %241 0 
					                                                      OpStore %209 %242 
					                         read_only Texture2D %244 = OpLoad %76 
					                                     sampler %245 = OpLoad %78 
					                  read_only Texture2DSampled %246 = OpSampledImage %244 %245 
					                                       f32_4 %247 = OpLoad %9 
					                                       f32_2 %248 = OpVectorShuffle %247 %247 2 3 
					                                       f32_4 %249 = OpImageSampleImplicitLod %246 %248 
					                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
					                                                      OpStore %243 %250 
					                                         f32 %252 = OpLoad %209 
					                                       f32_3 %253 = OpCompositeConstruct %252 %252 %252 
					                                       f32_3 %254 = OpLoad %243 
					                                       f32_3 %255 = OpFMul %253 %254 
					                                                      OpStore %251 %255 
					                                       f32_3 %256 = OpLoad %251 
					                                       f32_3 %257 = OpExtInst %1 37 %256 %97 
					                                                      OpStore %182 %257 
					                                       f32_3 %258 = OpLoad %159 
					                                       f32_3 %259 = OpLoad %182 
					                                       f32_3 %260 = OpFAdd %258 %259 
					                                                      OpStore %159 %260 
					                                       f32_3 %261 = OpLoad %94 
					                                       f32_3 %262 = OpLoad %156 
					                                       f32_3 %263 = OpExtInst %1 37 %261 %262 
					                                                      OpStore %188 %263 
					                                       f32_3 %264 = OpLoad %94 
					                                       f32_3 %265 = OpLoad %156 
					                                       f32_3 %266 = OpExtInst %1 40 %264 %265 
					                                                      OpStore %94 %266 
					                                       f32_3 %267 = OpLoad %182 
					                                       f32_3 %268 = OpLoad %94 
					                                       f32_3 %269 = OpExtInst %1 40 %267 %268 
					                                                      OpStore %94 %269 
					                                       f32_3 %270 = OpLoad %182 
					                                       f32_3 %271 = OpLoad %188 
					                                       f32_3 %272 = OpExtInst %1 37 %270 %271 
					                                                      OpStore %156 %272 
					                                       f32_3 %273 = OpLoad %156 
					                                       f32_3 %274 = OpFNegate %273 
					                                       f32_3 %275 = OpLoad %159 
					                                       f32_3 %276 = OpFAdd %274 %275 
					                                                      OpStore %156 %276 
					                                       f32_3 %277 = OpLoad %94 
					                                       f32_3 %278 = OpFNegate %277 
					                                       f32_3 %279 = OpLoad %156 
					                                       f32_3 %280 = OpFAdd %278 %279 
					                                                      OpStore %94 %280 
					                                Private f32* %283 = OpAccessChain %94 %282 
					                                         f32 %284 = OpLoad %283 
					                                Private f32* %286 = OpAccessChain %94 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpExtInst %1 40 %284 %287 
					                                                      OpStore %281 %288 
					                                         f32 %289 = OpLoad %281 
					                                Private f32* %290 = OpAccessChain %94 %73 
					                                         f32 %291 = OpLoad %290 
					                                         f32 %292 = OpExtInst %1 40 %289 %291 
					                                                      OpStore %281 %292 
					                                         f32 %293 = OpLoad %281 
					                                Uniform f32* %295 = OpAccessChain %13 %294 %73 
					                                         f32 %296 = OpLoad %295 
					                                         f32 %297 = OpFNegate %296 
					                                         f32 %298 = OpFAdd %293 %297 
					                                Private f32* %299 = OpAccessChain %9 %73 
					                                                      OpStore %299 %298 
					                                Private f32* %300 = OpAccessChain %9 %73 
					                                         f32 %301 = OpLoad %300 
					                                         f32 %302 = OpExtInst %1 40 %301 %104 
					                                Private f32* %303 = OpAccessChain %9 %73 
					                                                      OpStore %303 %302 
					                                Private f32* %304 = OpAccessChain %9 %73 
					                                         f32 %305 = OpLoad %304 
					                                Uniform f32* %306 = OpAccessChain %13 %294 %285 
					                                         f32 %307 = OpLoad %306 
					                                         f32 %308 = OpExtInst %1 37 %305 %307 
					                                Private f32* %309 = OpAccessChain %9 %73 
					                                                      OpStore %309 %308 
					                                Private f32* %310 = OpAccessChain %9 %73 
					                                         f32 %311 = OpLoad %310 
					                                Private f32* %312 = OpAccessChain %9 %73 
					                                         f32 %313 = OpLoad %312 
					                                         f32 %314 = OpFMul %311 %313 
					                                Private f32* %315 = OpAccessChain %9 %73 
					                                                      OpStore %315 %314 
					                                Private f32* %316 = OpAccessChain %9 %73 
					                                         f32 %317 = OpLoad %316 
					                                Uniform f32* %318 = OpAccessChain %13 %294 %282 
					                                         f32 %319 = OpLoad %318 
					                                         f32 %320 = OpFMul %317 %319 
					                                Private f32* %321 = OpAccessChain %9 %73 
					                                                      OpStore %321 %320 
					                                         f32 %323 = OpLoad %281 
					                                Uniform f32* %325 = OpAccessChain %13 %324 
					                                         f32 %326 = OpLoad %325 
					                                         f32 %327 = OpFNegate %326 
					                                         f32 %328 = OpFAdd %323 %327 
					                                                      OpStore %322 %328 
					                                         f32 %329 = OpLoad %281 
					                                         f32 %331 = OpExtInst %1 40 %329 %330 
					                                                      OpStore %281 %331 
					                                         f32 %332 = OpLoad %322 
					                                Private f32* %333 = OpAccessChain %9 %73 
					                                         f32 %334 = OpLoad %333 
					                                         f32 %335 = OpExtInst %1 40 %332 %334 
					                                Private f32* %336 = OpAccessChain %9 %73 
					                                                      OpStore %336 %335 
					                                Private f32* %337 = OpAccessChain %9 %73 
					                                         f32 %338 = OpLoad %337 
					                                         f32 %339 = OpLoad %281 
					                                         f32 %340 = OpFDiv %338 %339 
					                                Private f32* %341 = OpAccessChain %9 %73 
					                                                      OpStore %341 %340 
					                                       f32_4 %342 = OpLoad %9 
					                                       f32_3 %343 = OpVectorShuffle %342 %342 0 0 0 
					                                       f32_3 %344 = OpLoad %94 
					                                       f32_3 %345 = OpFMul %343 %344 
					                                       f32_4 %346 = OpLoad %9 
					                                       f32_4 %347 = OpVectorShuffle %346 %345 4 5 6 3 
					                                                      OpStore %9 %347 
					                                       f32_4 %350 = OpLoad %9 
					                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
					                                       f32_4 %352 = OpLoad %349 
					                                       f32_4 %353 = OpVectorShuffle %352 %351 4 5 6 3 
					                                                      OpStore %349 %353 
					                                 Output f32* %356 = OpAccessChain %349 %354 
					                                                      OpStore %356 %104 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "ANTI_FLICKER" "UNITY_COLORSPACE_GAMMA" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "ANTI_FLICKER" "UNITY_COLORSPACE_GAMMA" }
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _MainTex_ST;
					uniform 	float _PrefilterOffs;
					uniform 	float _Threshold;
					uniform 	vec3 _Curve;
					UNITY_LOCATION(0) uniform  sampler2D _AutoExposure;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat16_6;
					vec4 u_xlat10_6;
					float u_xlat8;
					float u_xlat21;
					float u_xlat16_21;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(vec4(_PrefilterOffs, _PrefilterOffs, _PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_2 = texture(_AutoExposure, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1.xyz = u_xlat10_2.xxx * u_xlat10_1.xyz;
					    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat2 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
					    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
					    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat10_3 = texture(_AutoExposure, u_xlat2.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_3.xyz = u_xlat10_3.xxx * u_xlat10_4.xyz;
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_4.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
					    u_xlat10_5 = texture(_AutoExposure, u_xlat0.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_5.xyz = u_xlat10_5.xxx * u_xlat10_6.xyz;
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
					    u_xlat16_6.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_5.xyz, u_xlat16_1.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_1.xyz = (-u_xlat16_1.xyz) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture(_AutoExposure, u_xlat2.zw);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2.xyz = u_xlat10_3.xxx * u_xlat10_2.xyz;
					    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat10_4 = texture(_AutoExposure, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_4.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_4.xyz);
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
					    u_xlat16_21 = max(u_xlat16_0.z, u_xlat16_0.y);
					    u_xlat16_21 = max(u_xlat16_21, u_xlat16_0.x);
					    u_xlat1.x = u_xlat16_21 + (-_Curve.x);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _Curve.y);
					    u_xlat8 = u_xlat1.x * _Curve.z;
					    u_xlat1.x = u_xlat1.x * u_xlat8;
					    u_xlat8 = u_xlat16_21 + (-_Threshold);
					    u_xlat16_21 = max(u_xlat16_21, 9.99999975e-06);
					    u_xlat1.x = max(u_xlat8, u_xlat1.x);
					    u_xlat21 = u_xlat1.x / u_xlat16_21;
					    SV_Target0.xyz = vec3(u_xlat21) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "ANTI_FLICKER" "UNITY_COLORSPACE_GAMMA" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 369
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %39 %360 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 39 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %61 DescriptorSet 61 
					                                                      OpDecorate %61 Binding 61 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %65 RelaxedPrecision 
					                                                      OpDecorate %65 DescriptorSet 65 
					                                                      OpDecorate %65 Binding 65 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %74 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %76 DescriptorSet 76 
					                                                      OpDecorate %76 Binding 76 
					                                                      OpDecorate %77 RelaxedPrecision 
					                                                      OpDecorate %78 RelaxedPrecision 
					                                                      OpDecorate %78 DescriptorSet 78 
					                                                      OpDecorate %78 Binding 78 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %89 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
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
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %232 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %244 RelaxedPrecision 
					                                                      OpDecorate %245 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %252 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %308 RelaxedPrecision 
					                                                      OpDecorate %309 RelaxedPrecision 
					                                                      OpDecorate %313 RelaxedPrecision 
					                                                      OpDecorate %333 RelaxedPrecision 
					                                                      OpDecorate %341 RelaxedPrecision 
					                                                      OpDecorate %343 RelaxedPrecision 
					                                                      OpDecorate %351 RelaxedPrecision 
					                                                      OpDecorate %354 RelaxedPrecision 
					                                                      OpDecorate %355 RelaxedPrecision 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %360 Location 360 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 3 
					                                              %11 = OpTypeStruct %7 %7 %6 %6 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32_4; f32; f32; f32_3;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 0 
					                                              %16 = OpTypePointer Uniform %7 
					                                          i32 %20 = OpConstant 2 
					                                              %21 = OpTypePointer Uniform %6 
					                                              %37 = OpTypeVector %6 2 
					                                              %38 = OpTypePointer Input %37 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                               Private f32_4* %43 = OpVariable Private 
					                                          i32 %46 = OpConstant 1 
					                                              %57 = OpTypePointer Private %6 
					                                 Private f32* %58 = OpVariable Private 
					                                              %59 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %60 = OpTypePointer UniformConstant %59 
					         UniformConstant read_only Texture2D* %61 = OpVariable UniformConstant 
					                                              %63 = OpTypeSampler 
					                                              %64 = OpTypePointer UniformConstant %63 
					                     UniformConstant sampler* %65 = OpVariable UniformConstant 
					                                              %67 = OpTypeSampledImage %59 
					                                              %72 = OpTypeInt 32 0 
					                                          u32 %73 = OpConstant 0 
					                               Private f32_4* %75 = OpVariable Private 
					         UniformConstant read_only Texture2D* %76 = OpVariable UniformConstant 
					                     UniformConstant sampler* %78 = OpVariable UniformConstant 
					                                              %87 = OpTypePointer Private %10 
					                               Private f32_3* %88 = OpVariable Private 
					                               Private f32_3* %94 = OpVariable Private 
					                                          f32 %96 = OpConstant 3,674022E-40 
					                                        f32_3 %97 = OpConstantComposite %96 %96 %96 
					                                         f32 %103 = OpConstant 3,674022E-40 
					                                         f32 %104 = OpConstant 3,674022E-40 
					                                       f32_4 %105 = OpConstantComposite %103 %104 %104 %103 
					                              Private f32_3* %134 = OpVariable Private 
					                              Private f32_3* %143 = OpVariable Private 
					                              Private f32_3* %151 = OpVariable Private 
					                              Private f32_3* %156 = OpVariable Private 
					                              Private f32_3* %159 = OpVariable Private 
					                              Private f32_3* %182 = OpVariable Private 
					                              Private f32_3* %188 = OpVariable Private 
					                                Private f32* %209 = OpVariable Private 
					                              Private f32_3* %243 = OpVariable Private 
					                              Private f32_3* %251 = OpVariable Private 
					                                         f32 %282 = OpConstant 3,674022E-40 
					                                       f32_3 %283 = OpConstantComposite %282 %282 %282 
					                                         f32 %285 = OpConstant 3,674022E-40 
					                                       f32_3 %286 = OpConstantComposite %285 %285 %285 
					                                         f32 %291 = OpConstant 3,674022E-40 
					                                       f32_3 %292 = OpConstantComposite %291 %291 %291 
					                                         u32 %297 = OpConstant 2 
					                                         u32 %300 = OpConstant 1 
					                                Private f32* %311 = OpVariable Private 
					                                         i32 %314 = OpConstant 4 
					                                         i32 %334 = OpConstant 3 
					                                         f32 %342 = OpConstant 3,674022E-40 
					                                             %359 = OpTypePointer Output %7 
					                               Output f32_4* %360 = OpVariable Output 
					                                         u32 %365 = OpConstant 3 
					                                             %366 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Uniform f32_4* %17 = OpAccessChain %13 %15 
					                                        f32_4 %18 = OpLoad %17 
					                                        f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
					                                 Uniform f32* %22 = OpAccessChain %13 %20 
					                                          f32 %23 = OpLoad %22 
					                                 Uniform f32* %24 = OpAccessChain %13 %20 
					                                          f32 %25 = OpLoad %24 
					                                 Uniform f32* %26 = OpAccessChain %13 %20 
					                                          f32 %27 = OpLoad %26 
					                                 Uniform f32* %28 = OpAccessChain %13 %20 
					                                          f32 %29 = OpLoad %28 
					                                        f32_4 %30 = OpCompositeConstruct %23 %25 %27 %29 
					                                          f32 %31 = OpCompositeExtract %30 0 
					                                          f32 %32 = OpCompositeExtract %30 1 
					                                          f32 %33 = OpCompositeExtract %30 2 
					                                          f32 %34 = OpCompositeExtract %30 3 
					                                        f32_4 %35 = OpCompositeConstruct %31 %32 %33 %34 
					                                        f32_4 %36 = OpFMul %19 %35 
					                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
					                                        f32_4 %41 = OpVectorShuffle %40 %40 0 1 0 1 
					                                        f32_4 %42 = OpFAdd %36 %41 
					                                                      OpStore %9 %42 
					                                        f32_4 %44 = OpLoad %9 
					                                        f32_2 %45 = OpVectorShuffle %44 %44 2 3 
					                               Uniform f32_4* %47 = OpAccessChain %13 %46 
					                                        f32_4 %48 = OpLoad %47 
					                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                        f32_2 %50 = OpFMul %45 %49 
					                               Uniform f32_4* %51 = OpAccessChain %13 %46 
					                                        f32_4 %52 = OpLoad %51 
					                                        f32_2 %53 = OpVectorShuffle %52 %52 2 3 
					                                        f32_2 %54 = OpFAdd %50 %53 
					                                        f32_4 %55 = OpLoad %43 
					                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 2 3 
					                                                      OpStore %43 %56 
					                          read_only Texture2D %62 = OpLoad %61 
					                                      sampler %66 = OpLoad %65 
					                   read_only Texture2DSampled %68 = OpSampledImage %62 %66 
					                                        f32_4 %69 = OpLoad %43 
					                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
					                                        f32_4 %71 = OpImageSampleImplicitLod %68 %70 
					                                          f32 %74 = OpCompositeExtract %71 0 
					                                                      OpStore %58 %74 
					                          read_only Texture2D %77 = OpLoad %76 
					                                      sampler %79 = OpLoad %78 
					                   read_only Texture2DSampled %80 = OpSampledImage %77 %79 
					                                        f32_4 %81 = OpLoad %43 
					                                        f32_2 %82 = OpVectorShuffle %81 %81 0 1 
					                                        f32_4 %83 = OpImageSampleImplicitLod %80 %82 
					                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
					                                        f32_4 %85 = OpLoad %75 
					                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 2 6 
					                                                      OpStore %75 %86 
					                                          f32 %89 = OpLoad %58 
					                                        f32_3 %90 = OpCompositeConstruct %89 %89 %89 
					                                        f32_4 %91 = OpLoad %75 
					                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 3 
					                                        f32_3 %93 = OpFMul %90 %92 
					                                                      OpStore %88 %93 
					                                        f32_3 %95 = OpLoad %88 
					                                        f32_3 %98 = OpExtInst %1 37 %95 %97 
					                                                      OpStore %94 %98 
					                               Uniform f32_4* %99 = OpAccessChain %13 %15 
					                                       f32_4 %100 = OpLoad %99 
					                                       f32_4 %101 = OpVectorShuffle %100 %100 0 0 0 1 
					                                       f32_4 %102 = OpFNegate %101 
					                                       f32_4 %106 = OpFMul %102 %105 
					                                       f32_4 %107 = OpLoad %9 
					                                       f32_4 %108 = OpVectorShuffle %107 %107 2 3 2 3 
					                                       f32_4 %109 = OpFAdd %106 %108 
					                                                      OpStore %43 %109 
					                              Uniform f32_4* %110 = OpAccessChain %13 %15 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_4 %112 = OpVectorShuffle %111 %111 0 0 0 1 
					                                       f32_4 %113 = OpFMul %112 %105 
					                                       f32_4 %114 = OpLoad %9 
					                                       f32_4 %115 = OpFAdd %113 %114 
					                                                      OpStore %9 %115 
					                                       f32_4 %116 = OpLoad %9 
					                              Uniform f32_4* %117 = OpAccessChain %13 %46 
					                                       f32_4 %118 = OpLoad %117 
					                                       f32_4 %119 = OpVectorShuffle %118 %118 0 1 0 1 
					                                       f32_4 %120 = OpFMul %116 %119 
					                              Uniform f32_4* %121 = OpAccessChain %13 %46 
					                                       f32_4 %122 = OpLoad %121 
					                                       f32_4 %123 = OpVectorShuffle %122 %122 2 3 2 3 
					                                       f32_4 %124 = OpFAdd %120 %123 
					                                                      OpStore %9 %124 
					                                       f32_4 %125 = OpLoad %43 
					                              Uniform f32_4* %126 = OpAccessChain %13 %46 
					                                       f32_4 %127 = OpLoad %126 
					                                       f32_4 %128 = OpVectorShuffle %127 %127 0 1 0 1 
					                                       f32_4 %129 = OpFMul %125 %128 
					                              Uniform f32_4* %130 = OpAccessChain %13 %46 
					                                       f32_4 %131 = OpLoad %130 
					                                       f32_4 %132 = OpVectorShuffle %131 %131 2 3 2 3 
					                                       f32_4 %133 = OpFAdd %129 %132 
					                                                      OpStore %43 %133 
					                         read_only Texture2D %135 = OpLoad %61 
					                                     sampler %136 = OpLoad %65 
					                  read_only Texture2DSampled %137 = OpSampledImage %135 %136 
					                                       f32_4 %138 = OpLoad %43 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                                       f32_4 %140 = OpImageSampleImplicitLod %137 %139 
					                                         f32 %141 = OpCompositeExtract %140 0 
					                                Private f32* %142 = OpAccessChain %134 %73 
					                                                      OpStore %142 %141 
					                         read_only Texture2D %144 = OpLoad %76 
					                                     sampler %145 = OpLoad %78 
					                  read_only Texture2DSampled %146 = OpSampledImage %144 %145 
					                                       f32_4 %147 = OpLoad %43 
					                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
					                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
					                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
					                                                      OpStore %143 %150 
					                                       f32_3 %152 = OpLoad %134 
					                                       f32_3 %153 = OpVectorShuffle %152 %152 0 0 0 
					                                       f32_3 %154 = OpLoad %143 
					                                       f32_3 %155 = OpFMul %153 %154 
					                                                      OpStore %151 %155 
					                                       f32_3 %157 = OpLoad %151 
					                                       f32_3 %158 = OpExtInst %1 37 %157 %97 
					                                                      OpStore %156 %158 
					                                       f32_3 %160 = OpLoad %94 
					                                       f32_3 %161 = OpLoad %156 
					                                       f32_3 %162 = OpFAdd %160 %161 
					                                                      OpStore %159 %162 
					                         read_only Texture2D %163 = OpLoad %61 
					                                     sampler %164 = OpLoad %65 
					                  read_only Texture2DSampled %165 = OpSampledImage %163 %164 
					                                       f32_4 %166 = OpLoad %9 
					                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
					                                       f32_4 %168 = OpImageSampleImplicitLod %165 %167 
					                                         f32 %169 = OpCompositeExtract %168 0 
					                                Private f32* %170 = OpAccessChain %75 %73 
					                                                      OpStore %170 %169 
					                         read_only Texture2D %171 = OpLoad %76 
					                                     sampler %172 = OpLoad %78 
					                  read_only Texture2DSampled %173 = OpSampledImage %171 %172 
					                                       f32_4 %174 = OpLoad %9 
					                                       f32_2 %175 = OpVectorShuffle %174 %174 0 1 
					                                       f32_4 %176 = OpImageSampleImplicitLod %173 %175 
					                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
					                                                      OpStore %134 %177 
					                                       f32_4 %178 = OpLoad %75 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 0 0 
					                                       f32_3 %180 = OpLoad %134 
					                                       f32_3 %181 = OpFMul %179 %180 
					                                                      OpStore %151 %181 
					                                       f32_3 %183 = OpLoad %151 
					                                       f32_3 %184 = OpExtInst %1 37 %183 %97 
					                                                      OpStore %182 %184 
					                                       f32_3 %185 = OpLoad %159 
					                                       f32_3 %186 = OpLoad %182 
					                                       f32_3 %187 = OpFAdd %185 %186 
					                                                      OpStore %159 %187 
					                                       f32_3 %189 = OpLoad %94 
					                                       f32_3 %190 = OpLoad %156 
					                                       f32_3 %191 = OpExtInst %1 37 %189 %190 
					                                                      OpStore %188 %191 
					                                       f32_3 %192 = OpLoad %94 
					                                       f32_3 %193 = OpLoad %156 
					                                       f32_3 %194 = OpExtInst %1 40 %192 %193 
					                                                      OpStore %94 %194 
					                                       f32_3 %195 = OpLoad %182 
					                                       f32_3 %196 = OpLoad %94 
					                                       f32_3 %197 = OpExtInst %1 40 %195 %196 
					                                                      OpStore %94 %197 
					                                       f32_3 %198 = OpLoad %182 
					                                       f32_3 %199 = OpLoad %188 
					                                       f32_3 %200 = OpExtInst %1 37 %198 %199 
					                                                      OpStore %156 %200 
					                                       f32_3 %201 = OpLoad %156 
					                                       f32_3 %202 = OpFNegate %201 
					                                       f32_3 %203 = OpLoad %159 
					                                       f32_3 %204 = OpFAdd %202 %203 
					                                                      OpStore %156 %204 
					                                       f32_3 %205 = OpLoad %94 
					                                       f32_3 %206 = OpFNegate %205 
					                                       f32_3 %207 = OpLoad %156 
					                                       f32_3 %208 = OpFAdd %206 %207 
					                                                      OpStore %94 %208 
					                         read_only Texture2D %210 = OpLoad %61 
					                                     sampler %211 = OpLoad %65 
					                  read_only Texture2DSampled %212 = OpSampledImage %210 %211 
					                                       f32_4 %213 = OpLoad %43 
					                                       f32_2 %214 = OpVectorShuffle %213 %213 2 3 
					                                       f32_4 %215 = OpImageSampleImplicitLod %212 %214 
					                                         f32 %216 = OpCompositeExtract %215 0 
					                                                      OpStore %209 %216 
					                         read_only Texture2D %217 = OpLoad %76 
					                                     sampler %218 = OpLoad %78 
					                  read_only Texture2DSampled %219 = OpSampledImage %217 %218 
					                                       f32_4 %220 = OpLoad %43 
					                                       f32_2 %221 = OpVectorShuffle %220 %220 2 3 
					                                       f32_4 %222 = OpImageSampleImplicitLod %219 %221 
					                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
					                                       f32_4 %224 = OpLoad %75 
					                                       f32_4 %225 = OpVectorShuffle %224 %223 4 5 6 3 
					                                                      OpStore %75 %225 
					                                         f32 %226 = OpLoad %209 
					                                       f32_3 %227 = OpCompositeConstruct %226 %226 %226 
					                                       f32_4 %228 = OpLoad %75 
					                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
					                                       f32_3 %230 = OpFMul %227 %229 
					                                                      OpStore %88 %230 
					                                       f32_3 %231 = OpLoad %88 
					                                       f32_3 %232 = OpExtInst %1 37 %231 %97 
					                                                      OpStore %156 %232 
					                                       f32_3 %233 = OpLoad %94 
					                                       f32_3 %234 = OpLoad %156 
					                                       f32_3 %235 = OpFAdd %233 %234 
					                                                      OpStore %159 %235 
					                         read_only Texture2D %236 = OpLoad %61 
					                                     sampler %237 = OpLoad %65 
					                  read_only Texture2DSampled %238 = OpSampledImage %236 %237 
					                                       f32_4 %239 = OpLoad %9 
					                                       f32_2 %240 = OpVectorShuffle %239 %239 2 3 
					                                       f32_4 %241 = OpImageSampleImplicitLod %238 %240 
					                                         f32 %242 = OpCompositeExtract %241 0 
					                                                      OpStore %209 %242 
					                         read_only Texture2D %244 = OpLoad %76 
					                                     sampler %245 = OpLoad %78 
					                  read_only Texture2DSampled %246 = OpSampledImage %244 %245 
					                                       f32_4 %247 = OpLoad %9 
					                                       f32_2 %248 = OpVectorShuffle %247 %247 2 3 
					                                       f32_4 %249 = OpImageSampleImplicitLod %246 %248 
					                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
					                                                      OpStore %243 %250 
					                                         f32 %252 = OpLoad %209 
					                                       f32_3 %253 = OpCompositeConstruct %252 %252 %252 
					                                       f32_3 %254 = OpLoad %243 
					                                       f32_3 %255 = OpFMul %253 %254 
					                                                      OpStore %251 %255 
					                                       f32_3 %256 = OpLoad %251 
					                                       f32_3 %257 = OpExtInst %1 37 %256 %97 
					                                                      OpStore %182 %257 
					                                       f32_3 %258 = OpLoad %159 
					                                       f32_3 %259 = OpLoad %182 
					                                       f32_3 %260 = OpFAdd %258 %259 
					                                                      OpStore %159 %260 
					                                       f32_3 %261 = OpLoad %94 
					                                       f32_3 %262 = OpLoad %156 
					                                       f32_3 %263 = OpExtInst %1 37 %261 %262 
					                                                      OpStore %188 %263 
					                                       f32_3 %264 = OpLoad %94 
					                                       f32_3 %265 = OpLoad %156 
					                                       f32_3 %266 = OpExtInst %1 40 %264 %265 
					                                                      OpStore %94 %266 
					                                       f32_3 %267 = OpLoad %182 
					                                       f32_3 %268 = OpLoad %94 
					                                       f32_3 %269 = OpExtInst %1 40 %267 %268 
					                                                      OpStore %94 %269 
					                                       f32_3 %270 = OpLoad %182 
					                                       f32_3 %271 = OpLoad %188 
					                                       f32_3 %272 = OpExtInst %1 37 %270 %271 
					                                                      OpStore %156 %272 
					                                       f32_3 %273 = OpLoad %156 
					                                       f32_3 %274 = OpFNegate %273 
					                                       f32_3 %275 = OpLoad %159 
					                                       f32_3 %276 = OpFAdd %274 %275 
					                                                      OpStore %156 %276 
					                                       f32_3 %277 = OpLoad %94 
					                                       f32_3 %278 = OpFNegate %277 
					                                       f32_3 %279 = OpLoad %156 
					                                       f32_3 %280 = OpFAdd %278 %279 
					                                                      OpStore %94 %280 
					                                       f32_3 %281 = OpLoad %94 
					                                       f32_3 %284 = OpFMul %281 %283 
					                                       f32_3 %287 = OpFAdd %284 %286 
					                                                      OpStore %251 %287 
					                                       f32_3 %288 = OpLoad %94 
					                                       f32_3 %289 = OpLoad %251 
					                                       f32_3 %290 = OpFMul %288 %289 
					                                       f32_3 %293 = OpFAdd %290 %292 
					                                                      OpStore %251 %293 
					                                       f32_3 %294 = OpLoad %251 
					                                       f32_3 %295 = OpLoad %94 
					                                       f32_3 %296 = OpFMul %294 %295 
					                                                      OpStore %251 %296 
					                                Private f32* %298 = OpAccessChain %251 %297 
					                                         f32 %299 = OpLoad %298 
					                                Private f32* %301 = OpAccessChain %251 %300 
					                                         f32 %302 = OpLoad %301 
					                                         f32 %303 = OpExtInst %1 40 %299 %302 
					                                Private f32* %304 = OpAccessChain %94 %73 
					                                                      OpStore %304 %303 
					                                Private f32* %305 = OpAccessChain %251 %73 
					                                         f32 %306 = OpLoad %305 
					                                Private f32* %307 = OpAccessChain %94 %73 
					                                         f32 %308 = OpLoad %307 
					                                         f32 %309 = OpExtInst %1 40 %306 %308 
					                                Private f32* %310 = OpAccessChain %94 %73 
					                                                      OpStore %310 %309 
					                                Private f32* %312 = OpAccessChain %94 %73 
					                                         f32 %313 = OpLoad %312 
					                                Uniform f32* %315 = OpAccessChain %13 %314 %73 
					                                         f32 %316 = OpLoad %315 
					                                         f32 %317 = OpFNegate %316 
					                                         f32 %318 = OpFAdd %313 %317 
					                                                      OpStore %311 %318 
					                                         f32 %319 = OpLoad %311 
					                                         f32 %320 = OpExtInst %1 40 %319 %104 
					                                                      OpStore %311 %320 
					                                         f32 %321 = OpLoad %311 
					                                Uniform f32* %322 = OpAccessChain %13 %314 %300 
					                                         f32 %323 = OpLoad %322 
					                                         f32 %324 = OpExtInst %1 37 %321 %323 
					                                                      OpStore %311 %324 
					                                         f32 %325 = OpLoad %311 
					                                         f32 %326 = OpLoad %311 
					                                         f32 %327 = OpFMul %325 %326 
					                                                      OpStore %311 %327 
					                                         f32 %328 = OpLoad %311 
					                                Uniform f32* %329 = OpAccessChain %13 %314 %297 
					                                         f32 %330 = OpLoad %329 
					                                         f32 %331 = OpFMul %328 %330 
					                                                      OpStore %311 %331 
					                                Private f32* %332 = OpAccessChain %94 %73 
					                                         f32 %333 = OpLoad %332 
					                                Uniform f32* %335 = OpAccessChain %13 %334 
					                                         f32 %336 = OpLoad %335 
					                                         f32 %337 = OpFNegate %336 
					                                         f32 %338 = OpFAdd %333 %337 
					                                Private f32* %339 = OpAccessChain %43 %73 
					                                                      OpStore %339 %338 
					                                Private f32* %340 = OpAccessChain %94 %73 
					                                         f32 %341 = OpLoad %340 
					                                         f32 %343 = OpExtInst %1 40 %341 %342 
					                                Private f32* %344 = OpAccessChain %94 %73 
					                                                      OpStore %344 %343 
					                                         f32 %345 = OpLoad %311 
					                                Private f32* %346 = OpAccessChain %43 %73 
					                                         f32 %347 = OpLoad %346 
					                                         f32 %348 = OpExtInst %1 40 %345 %347 
					                                                      OpStore %311 %348 
					                                         f32 %349 = OpLoad %311 
					                                Private f32* %350 = OpAccessChain %94 %73 
					                                         f32 %351 = OpLoad %350 
					                                         f32 %352 = OpFDiv %349 %351 
					                                                      OpStore %311 %352 
					                                         f32 %353 = OpLoad %311 
					                                       f32_3 %354 = OpCompositeConstruct %353 %353 %353 
					                                       f32_3 %355 = OpLoad %251 
					                                       f32_3 %356 = OpFMul %354 %355 
					                                       f32_4 %357 = OpLoad %9 
					                                       f32_4 %358 = OpVectorShuffle %357 %356 4 5 6 3 
					                                                      OpStore %9 %358 
					                                       f32_4 %361 = OpLoad %9 
					                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
					                                       f32_4 %363 = OpLoad %360 
					                                       f32_4 %364 = OpVectorShuffle %363 %362 4 5 6 3 
					                                                      OpStore %360 %364 
					                                 Output f32* %367 = OpAccessChain %360 %365 
					                                                      OpStore %367 %104 
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
						vec4 _MainTex_TexelSize;
						vec4 _MainTex_ST;
						float _PrefilterOffs;
						float _Threshold;
						vec3 _Curve;
					};
					uniform  sampler2D _AutoExposure;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_AutoExposure, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_1.xxx * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_6 = max(u_xlat16_0.z, u_xlat16_0.y);
					    u_xlat16_6 = max(u_xlat16_6, u_xlat16_0.x);
					    u_xlat1 = u_xlat16_6 + (-_Curve.x);
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat1 = min(u_xlat1, _Curve.y);
					    u_xlat3 = u_xlat1 * _Curve.z;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat3 = u_xlat16_6 + (-_Threshold);
					    u_xlat16_6 = max(u_xlat16_6, 9.99999975e-06);
					    u_xlat1 = max(u_xlat3, u_xlat1);
					    u_xlat6 = u_xlat1 / u_xlat16_6;
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_COLORSPACE_GAMMA" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 _MainTex_ST;
						float _PrefilterOffs;
						float _Threshold;
						vec3 _Curve;
					};
					uniform  sampler2D _AutoExposure;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_AutoExposure, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_1.xxx * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
					    u_xlat16_6 = max(u_xlat16_0.z, u_xlat16_0.y);
					    u_xlat16_6 = max(u_xlat16_6, u_xlat16_0.x);
					    u_xlat1 = u_xlat16_6 + (-_Curve.x);
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat1 = min(u_xlat1, _Curve.y);
					    u_xlat3 = u_xlat1 * _Curve.z;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat3 = u_xlat16_6 + (-_Threshold);
					    u_xlat16_6 = max(u_xlat16_6, 9.99999975e-06);
					    u_xlat1 = max(u_xlat3, u_xlat1);
					    u_xlat6 = u_xlat1 / u_xlat16_6;
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "UNITY_COLORSPACE_GAMMA" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "UNITY_COLORSPACE_GAMMA" }
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "ANTI_FLICKER" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 _MainTex_ST;
						float _PrefilterOffs;
						float _Threshold;
						vec3 _Curve;
					};
					uniform  sampler2D _AutoExposure;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat16_6;
					vec4 u_xlat10_6;
					float u_xlat8;
					float u_xlat21;
					float u_xlat16_21;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(vec4(_PrefilterOffs, _PrefilterOffs, _PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_2 = texture(_AutoExposure, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1.xyz = u_xlat10_2.xxx * u_xlat10_1.xyz;
					    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat2 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
					    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
					    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat10_3 = texture(_AutoExposure, u_xlat2.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_3.xyz = u_xlat10_3.xxx * u_xlat10_4.xyz;
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_4.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
					    u_xlat10_5 = texture(_AutoExposure, u_xlat0.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_5.xyz = u_xlat10_5.xxx * u_xlat10_6.xyz;
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
					    u_xlat16_6.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_5.xyz, u_xlat16_1.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_1.xyz = (-u_xlat16_1.xyz) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture(_AutoExposure, u_xlat2.zw);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2.xyz = u_xlat10_3.xxx * u_xlat10_2.xyz;
					    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat10_4 = texture(_AutoExposure, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_4.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_4.xyz);
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_21 = max(u_xlat16_0.z, u_xlat16_0.y);
					    u_xlat16_21 = max(u_xlat16_21, u_xlat16_0.x);
					    u_xlat1.x = u_xlat16_21 + (-_Curve.x);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _Curve.y);
					    u_xlat8 = u_xlat1.x * _Curve.z;
					    u_xlat1.x = u_xlat1.x * u_xlat8;
					    u_xlat8 = u_xlat16_21 + (-_Threshold);
					    u_xlat16_21 = max(u_xlat16_21, 9.99999975e-06);
					    u_xlat1.x = max(u_xlat8, u_xlat1.x);
					    u_xlat21 = u_xlat1.x / u_xlat16_21;
					    SV_Target0.xyz = vec3(u_xlat21) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "ANTI_FLICKER" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "ANTI_FLICKER" }
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "ANTI_FLICKER" "UNITY_COLORSPACE_GAMMA" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 _MainTex_ST;
						float _PrefilterOffs;
						float _Threshold;
						vec3 _Curve;
					};
					uniform  sampler2D _AutoExposure;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat16_6;
					vec4 u_xlat10_6;
					float u_xlat8;
					float u_xlat21;
					float u_xlat16_21;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(vec4(_PrefilterOffs, _PrefilterOffs, _PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xyxy;
					    u_xlat1.xy = u_xlat0.zw * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_2 = texture(_AutoExposure, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1.xyz = u_xlat10_2.xxx * u_xlat10_1.xyz;
					    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat2 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
					    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
					    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat10_3 = texture(_AutoExposure, u_xlat2.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_3.xyz = u_xlat10_3.xxx * u_xlat10_4.xyz;
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_4.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
					    u_xlat10_5 = texture(_AutoExposure, u_xlat0.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_5.xyz = u_xlat10_5.xxx * u_xlat10_6.xyz;
					    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
					    u_xlat16_6.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_5.xyz, u_xlat16_1.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_1.xyz = (-u_xlat16_1.xyz) + u_xlat16_3.xyz;
					    u_xlat10_3 = texture(_AutoExposure, u_xlat2.zw);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2.xyz = u_xlat10_3.xxx * u_xlat10_2.xyz;
					    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat10_4 = texture(_AutoExposure, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_4.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_4.xyz);
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
					    u_xlat16_21 = max(u_xlat16_0.z, u_xlat16_0.y);
					    u_xlat16_21 = max(u_xlat16_21, u_xlat16_0.x);
					    u_xlat1.x = u_xlat16_21 + (-_Curve.x);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _Curve.y);
					    u_xlat8 = u_xlat1.x * _Curve.z;
					    u_xlat1.x = u_xlat1.x * u_xlat8;
					    u_xlat8 = u_xlat16_21 + (-_Threshold);
					    u_xlat16_21 = max(u_xlat16_21, 9.99999975e-06);
					    u_xlat1.x = max(u_xlat8, u_xlat1.x);
					    u_xlat21 = u_xlat1.x / u_xlat16_21;
					    SV_Target0.xyz = vec3(u_xlat21) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "ANTI_FLICKER" "UNITY_COLORSPACE_GAMMA" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "ANTI_FLICKER" "UNITY_COLORSPACE_GAMMA" }
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 75912
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 102
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %25 %89 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD1 Location 25 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %34 DescriptorSet 34 
					                                             OpDecorate %34 Binding 34 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %38 DescriptorSet 38 
					                                             OpDecorate %38 Binding 38 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %89 Location 89 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeStruct %7 
					                                     %11 = OpTypePointer Uniform %10 
					            Uniform struct {f32_4;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 0 
					                                     %15 = OpTypePointer Uniform %7 
					                                 f32 %19 = OpConstant 3,674022E-40 
					                                 f32 %20 = OpConstant 3,674022E-40 
					                               f32_4 %21 = OpConstantComposite %19 %19 %20 %19 
					                                     %23 = OpTypeVector %6 2 
					                                     %24 = OpTypePointer Input %23 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %29 = OpTypeVector %6 3 
					                                     %30 = OpTypePointer Private %29 
					                      Private f32_3* %31 = OpVariable Private 
					                                     %32 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %33 = OpTypePointer UniformConstant %32 
					UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
					                                     %36 = OpTypeSampler 
					                                     %37 = OpTypePointer UniformConstant %36 
					            UniformConstant sampler* %38 = OpVariable UniformConstant 
					                                     %40 = OpTypeSampledImage %32 
					                      Private f32_3* %46 = OpVariable Private 
					                      Private f32_3* %54 = OpVariable Private 
					                      Private f32_4* %58 = OpVariable Private 
					                               f32_4 %62 = OpConstantComposite %19 %20 %20 %20 
					                      Private f32_3* %67 = OpVariable Private 
					                                     %88 = OpTypePointer Output %7 
					                       Output f32_4* %89 = OpVariable Output 
					                                 f32 %91 = OpConstant 3,674022E-40 
					                               f32_3 %92 = OpConstantComposite %91 %91 %91 
					                                 f32 %96 = OpConstant 3,674022E-40 
					                                     %97 = OpTypeInt 32 0 
					                                 u32 %98 = OpConstant 3 
					                                     %99 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Uniform f32_4* %16 = OpAccessChain %12 %14 
					                               f32_4 %17 = OpLoad %16 
					                               f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
					                               f32_4 %22 = OpFMul %18 %21 
					                               f32_2 %26 = OpLoad vs_TEXCOORD1 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                               f32_4 %28 = OpFAdd %22 %27 
					                                             OpStore %9 %28 
					                 read_only Texture2D %35 = OpLoad %34 
					                             sampler %39 = OpLoad %38 
					          read_only Texture2DSampled %41 = OpSampledImage %35 %39 
					                               f32_4 %42 = OpLoad %9 
					                               f32_2 %43 = OpVectorShuffle %42 %42 0 1 
					                               f32_4 %44 = OpImageSampleImplicitLod %41 %43 
					                               f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
					                                             OpStore %31 %45 
					                 read_only Texture2D %47 = OpLoad %34 
					                             sampler %48 = OpLoad %38 
					          read_only Texture2DSampled %49 = OpSampledImage %47 %48 
					                               f32_4 %50 = OpLoad %9 
					                               f32_2 %51 = OpVectorShuffle %50 %50 2 3 
					                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
					                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
					                                             OpStore %46 %53 
					                               f32_3 %55 = OpLoad %46 
					                               f32_3 %56 = OpLoad %31 
					                               f32_3 %57 = OpFAdd %55 %56 
					                                             OpStore %54 %57 
					                      Uniform f32_4* %59 = OpAccessChain %12 %14 
					                               f32_4 %60 = OpLoad %59 
					                               f32_4 %61 = OpVectorShuffle %60 %60 0 1 0 1 
					                               f32_4 %63 = OpFMul %61 %62 
					                               f32_2 %64 = OpLoad vs_TEXCOORD1 
					                               f32_4 %65 = OpVectorShuffle %64 %64 0 1 0 1 
					                               f32_4 %66 = OpFAdd %63 %65 
					                                             OpStore %58 %66 
					                 read_only Texture2D %68 = OpLoad %34 
					                             sampler %69 = OpLoad %38 
					          read_only Texture2DSampled %70 = OpSampledImage %68 %69 
					                               f32_4 %71 = OpLoad %58 
					                               f32_2 %72 = OpVectorShuffle %71 %71 0 1 
					                               f32_4 %73 = OpImageSampleImplicitLod %70 %72 
					                               f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
					                                             OpStore %67 %74 
					                 read_only Texture2D %75 = OpLoad %34 
					                             sampler %76 = OpLoad %38 
					          read_only Texture2DSampled %77 = OpSampledImage %75 %76 
					                               f32_4 %78 = OpLoad %58 
					                               f32_2 %79 = OpVectorShuffle %78 %78 2 3 
					                               f32_4 %80 = OpImageSampleImplicitLod %77 %79 
					                               f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
					                                             OpStore %31 %81 
					                               f32_3 %82 = OpLoad %54 
					                               f32_3 %83 = OpLoad %67 
					                               f32_3 %84 = OpFAdd %82 %83 
					                                             OpStore %54 %84 
					                               f32_3 %85 = OpLoad %31 
					                               f32_3 %86 = OpLoad %54 
					                               f32_3 %87 = OpFAdd %85 %86 
					                                             OpStore %54 %87 
					                               f32_3 %90 = OpLoad %54 
					                               f32_3 %93 = OpFMul %90 %92 
					                               f32_4 %94 = OpLoad %89 
					                               f32_4 %95 = OpVectorShuffle %94 %93 4 5 6 3 
					                                             OpStore %89 %95 
					                        Output f32* %100 = OpAccessChain %89 %98 
					                                             OpStore %100 %96 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "ANTI_FLICKER" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "ANTI_FLICKER" }
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat16_9;
					float u_xlat16_10;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_9 = max(u_xlat16_9, u_xlat10_1.x);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_1.xyz = vec3(u_xlat16_9) * u_xlat10_1.xyz;
					    u_xlat16_10 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_10 = max(u_xlat10_0.x, u_xlat16_10);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_10 = max(u_xlat10_2.z, u_xlat10_2.y);
					    u_xlat16_10 = max(u_xlat16_10, u_xlat10_2.x);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(u_xlat16_10) + u_xlat16_0.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat16_10 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_10 = max(u_xlat16_10, u_xlat10_1.x);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_1.xyz * vec3(u_xlat16_10) + u_xlat16_0.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    SV_Target0.xyz = vec3(u_xlat16_9) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "ANTI_FLICKER" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 182
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %25 %170 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD1 Location 25 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %34 DescriptorSet 34 
					                                             OpDecorate %34 Binding 34 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %38 DescriptorSet 38 
					                                             OpDecorate %38 Binding 38 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %124 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %130 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %135 RelaxedPrecision 
					                                             OpDecorate %136 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
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
					                                             OpDecorate %168 RelaxedPrecision 
					                                             OpDecorate %170 RelaxedPrecision 
					                                             OpDecorate %170 Location 170 
					                                             OpDecorate %171 RelaxedPrecision 
					                                             OpDecorate %172 RelaxedPrecision 
					                                             OpDecorate %173 RelaxedPrecision 
					                                             OpDecorate %174 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeStruct %7 
					                                     %11 = OpTypePointer Uniform %10 
					            Uniform struct {f32_4;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 0 
					                                     %15 = OpTypePointer Uniform %7 
					                                 f32 %19 = OpConstant 3,674022E-40 
					                                 f32 %20 = OpConstant 3,674022E-40 
					                               f32_4 %21 = OpConstantComposite %19 %19 %20 %19 
					                                     %23 = OpTypeVector %6 2 
					                                     %24 = OpTypePointer Input %23 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %29 = OpTypeVector %6 3 
					                                     %30 = OpTypePointer Private %29 
					                      Private f32_3* %31 = OpVariable Private 
					                                     %32 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %33 = OpTypePointer UniformConstant %32 
					UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
					                                     %36 = OpTypeSampler 
					                                     %37 = OpTypePointer UniformConstant %36 
					            UniformConstant sampler* %38 = OpVariable UniformConstant 
					                                     %40 = OpTypeSampledImage %32 
					                      Private f32_3* %46 = OpVariable Private 
					                                     %54 = OpTypePointer Private %6 
					                        Private f32* %55 = OpVariable Private 
					                                     %56 = OpTypeInt 32 0 
					                                 u32 %57 = OpConstant 2 
					                                 u32 %60 = OpConstant 1 
					                                 u32 %64 = OpConstant 0 
					                      Private f32_3* %73 = OpVariable Private 
					                        Private f32* %78 = OpVariable Private 
					                              f32_4 %104 = OpConstantComposite %19 %20 %20 %20 
					                                    %169 = OpTypePointer Output %7 
					                      Output f32_4* %170 = OpVariable Output 
					                                f32 %177 = OpConstant 3,674022E-40 
					                                u32 %178 = OpConstant 3 
					                                    %179 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Uniform f32_4* %16 = OpAccessChain %12 %14 
					                               f32_4 %17 = OpLoad %16 
					                               f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
					                               f32_4 %22 = OpFMul %18 %21 
					                               f32_2 %26 = OpLoad vs_TEXCOORD1 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                               f32_4 %28 = OpFAdd %22 %27 
					                                             OpStore %9 %28 
					                 read_only Texture2D %35 = OpLoad %34 
					                             sampler %39 = OpLoad %38 
					          read_only Texture2DSampled %41 = OpSampledImage %35 %39 
					                               f32_4 %42 = OpLoad %9 
					                               f32_2 %43 = OpVectorShuffle %42 %42 2 3 
					                               f32_4 %44 = OpImageSampleImplicitLod %41 %43 
					                               f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
					                                             OpStore %31 %45 
					                 read_only Texture2D %47 = OpLoad %34 
					                             sampler %48 = OpLoad %38 
					          read_only Texture2DSampled %49 = OpSampledImage %47 %48 
					                               f32_4 %50 = OpLoad %9 
					                               f32_2 %51 = OpVectorShuffle %50 %50 0 1 
					                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
					                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
					                                             OpStore %46 %53 
					                        Private f32* %58 = OpAccessChain %31 %57 
					                                 f32 %59 = OpLoad %58 
					                        Private f32* %61 = OpAccessChain %31 %60 
					                                 f32 %62 = OpLoad %61 
					                                 f32 %63 = OpExtInst %1 40 %59 %62 
					                                             OpStore %55 %63 
					                        Private f32* %65 = OpAccessChain %31 %64 
					                                 f32 %66 = OpLoad %65 
					                                 f32 %67 = OpLoad %55 
					                                 f32 %68 = OpExtInst %1 40 %66 %67 
					                                             OpStore %55 %68 
					                                 f32 %69 = OpLoad %55 
					                                 f32 %70 = OpFAdd %69 %20 
					                                             OpStore %55 %70 
					                                 f32 %71 = OpLoad %55 
					                                 f32 %72 = OpFDiv %20 %71 
					                                             OpStore %55 %72 
					                               f32_3 %74 = OpLoad %31 
					                                 f32 %75 = OpLoad %55 
					                               f32_3 %76 = OpCompositeConstruct %75 %75 %75 
					                               f32_3 %77 = OpFMul %74 %76 
					                                             OpStore %73 %77 
					                        Private f32* %79 = OpAccessChain %46 %57 
					                                 f32 %80 = OpLoad %79 
					                        Private f32* %81 = OpAccessChain %46 %60 
					                                 f32 %82 = OpLoad %81 
					                                 f32 %83 = OpExtInst %1 40 %80 %82 
					                                             OpStore %78 %83 
					                        Private f32* %84 = OpAccessChain %46 %64 
					                                 f32 %85 = OpLoad %84 
					                                 f32 %86 = OpLoad %78 
					                                 f32 %87 = OpExtInst %1 40 %85 %86 
					                                             OpStore %78 %87 
					                                 f32 %88 = OpLoad %78 
					                                 f32 %89 = OpFAdd %88 %20 
					                                             OpStore %78 %89 
					                                 f32 %90 = OpLoad %78 
					                                 f32 %91 = OpFDiv %20 %90 
					                                             OpStore %78 %91 
					                               f32_3 %92 = OpLoad %46 
					                                 f32 %93 = OpLoad %78 
					                               f32_3 %94 = OpCompositeConstruct %93 %93 %93 
					                               f32_3 %95 = OpFMul %92 %94 
					                               f32_3 %96 = OpLoad %73 
					                               f32_3 %97 = OpFAdd %95 %96 
					                                             OpStore %73 %97 
					                                 f32 %98 = OpLoad %55 
					                                 f32 %99 = OpLoad %78 
					                                f32 %100 = OpFAdd %98 %99 
					                                             OpStore %55 %100 
					                     Uniform f32_4* %101 = OpAccessChain %12 %14 
					                              f32_4 %102 = OpLoad %101 
					                              f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
					                              f32_4 %105 = OpFMul %103 %104 
					                              f32_2 %106 = OpLoad vs_TEXCOORD1 
					                              f32_4 %107 = OpVectorShuffle %106 %106 0 1 0 1 
					                              f32_4 %108 = OpFAdd %105 %107 
					                                             OpStore %9 %108 
					                read_only Texture2D %109 = OpLoad %34 
					                            sampler %110 = OpLoad %38 
					         read_only Texture2DSampled %111 = OpSampledImage %109 %110 
					                              f32_4 %112 = OpLoad %9 
					                              f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                              f32_4 %114 = OpImageSampleImplicitLod %111 %113 
					                              f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
					                                             OpStore %31 %115 
					                read_only Texture2D %116 = OpLoad %34 
					                            sampler %117 = OpLoad %38 
					         read_only Texture2DSampled %118 = OpSampledImage %116 %117 
					                              f32_4 %119 = OpLoad %9 
					                              f32_2 %120 = OpVectorShuffle %119 %119 2 3 
					                              f32_4 %121 = OpImageSampleImplicitLod %118 %120 
					                              f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
					                                             OpStore %46 %122 
					                       Private f32* %123 = OpAccessChain %31 %57 
					                                f32 %124 = OpLoad %123 
					                       Private f32* %125 = OpAccessChain %31 %60 
					                                f32 %126 = OpLoad %125 
					                                f32 %127 = OpExtInst %1 40 %124 %126 
					                                             OpStore %78 %127 
					                       Private f32* %128 = OpAccessChain %31 %64 
					                                f32 %129 = OpLoad %128 
					                                f32 %130 = OpLoad %78 
					                                f32 %131 = OpExtInst %1 40 %129 %130 
					                                             OpStore %78 %131 
					                                f32 %132 = OpLoad %78 
					                                f32 %133 = OpFAdd %132 %20 
					                                             OpStore %78 %133 
					                                f32 %134 = OpLoad %78 
					                                f32 %135 = OpFDiv %20 %134 
					                                             OpStore %78 %135 
					                              f32_3 %136 = OpLoad %31 
					                                f32 %137 = OpLoad %78 
					                              f32_3 %138 = OpCompositeConstruct %137 %137 %137 
					                              f32_3 %139 = OpFMul %136 %138 
					                              f32_3 %140 = OpLoad %73 
					                              f32_3 %141 = OpFAdd %139 %140 
					                                             OpStore %73 %141 
					                                f32 %142 = OpLoad %55 
					                                f32 %143 = OpLoad %78 
					                                f32 %144 = OpFAdd %142 %143 
					                                             OpStore %55 %144 
					                       Private f32* %145 = OpAccessChain %46 %57 
					                                f32 %146 = OpLoad %145 
					                       Private f32* %147 = OpAccessChain %46 %60 
					                                f32 %148 = OpLoad %147 
					                                f32 %149 = OpExtInst %1 40 %146 %148 
					                                             OpStore %78 %149 
					                       Private f32* %150 = OpAccessChain %46 %64 
					                                f32 %151 = OpLoad %150 
					                                f32 %152 = OpLoad %78 
					                                f32 %153 = OpExtInst %1 40 %151 %152 
					                                             OpStore %78 %153 
					                                f32 %154 = OpLoad %78 
					                                f32 %155 = OpFAdd %154 %20 
					                                             OpStore %78 %155 
					                                f32 %156 = OpLoad %78 
					                                f32 %157 = OpFDiv %20 %156 
					                                             OpStore %78 %157 
					                              f32_3 %158 = OpLoad %46 
					                                f32 %159 = OpLoad %78 
					                              f32_3 %160 = OpCompositeConstruct %159 %159 %159 
					                              f32_3 %161 = OpFMul %158 %160 
					                              f32_3 %162 = OpLoad %73 
					                              f32_3 %163 = OpFAdd %161 %162 
					                                             OpStore %73 %163 
					                                f32 %164 = OpLoad %55 
					                                f32 %165 = OpLoad %78 
					                                f32 %166 = OpFAdd %164 %165 
					                                             OpStore %55 %166 
					                                f32 %167 = OpLoad %55 
					                                f32 %168 = OpFDiv %20 %167 
					                                             OpStore %55 %168 
					                                f32 %171 = OpLoad %55 
					                              f32_3 %172 = OpCompositeConstruct %171 %171 %171 
					                              f32_3 %173 = OpLoad %73 
					                              f32_3 %174 = OpFMul %172 %173 
					                              f32_4 %175 = OpLoad %170 
					                              f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
					                                             OpStore %170 %176 
					                        Output f32* %180 = OpAccessChain %170 %178 
					                                             OpStore %180 %177 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25);
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "ANTI_FLICKER" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat16_9;
					float u_xlat16_10;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_9 = max(u_xlat16_9, u_xlat10_1.x);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_1.xyz = vec3(u_xlat16_9) * u_xlat10_1.xyz;
					    u_xlat16_10 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_10 = max(u_xlat10_0.x, u_xlat16_10);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_10 = max(u_xlat10_2.z, u_xlat10_2.y);
					    u_xlat16_10 = max(u_xlat16_10, u_xlat10_2.x);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(u_xlat16_10) + u_xlat16_0.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat16_10 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_10 = max(u_xlat16_10, u_xlat10_1.x);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_1.xyz * vec3(u_xlat16_10) + u_xlat16_0.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    SV_Target0.xyz = vec3(u_xlat16_9) * u_xlat16_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "ANTI_FLICKER" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "ANTI_FLICKER" }
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 156826
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 102
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %25 %89 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD1 Location 25 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %34 DescriptorSet 34 
					                                             OpDecorate %34 Binding 34 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %38 DescriptorSet 38 
					                                             OpDecorate %38 Binding 38 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %89 Location 89 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeStruct %7 
					                                     %11 = OpTypePointer Uniform %10 
					            Uniform struct {f32_4;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 0 
					                                     %15 = OpTypePointer Uniform %7 
					                                 f32 %19 = OpConstant 3,674022E-40 
					                                 f32 %20 = OpConstant 3,674022E-40 
					                               f32_4 %21 = OpConstantComposite %19 %19 %20 %19 
					                                     %23 = OpTypeVector %6 2 
					                                     %24 = OpTypePointer Input %23 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %29 = OpTypeVector %6 3 
					                                     %30 = OpTypePointer Private %29 
					                      Private f32_3* %31 = OpVariable Private 
					                                     %32 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %33 = OpTypePointer UniformConstant %32 
					UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
					                                     %36 = OpTypeSampler 
					                                     %37 = OpTypePointer UniformConstant %36 
					            UniformConstant sampler* %38 = OpVariable UniformConstant 
					                                     %40 = OpTypeSampledImage %32 
					                      Private f32_3* %46 = OpVariable Private 
					                      Private f32_3* %54 = OpVariable Private 
					                      Private f32_4* %58 = OpVariable Private 
					                               f32_4 %62 = OpConstantComposite %19 %20 %20 %20 
					                      Private f32_3* %67 = OpVariable Private 
					                                     %88 = OpTypePointer Output %7 
					                       Output f32_4* %89 = OpVariable Output 
					                                 f32 %91 = OpConstant 3,674022E-40 
					                               f32_3 %92 = OpConstantComposite %91 %91 %91 
					                                 f32 %96 = OpConstant 3,674022E-40 
					                                     %97 = OpTypeInt 32 0 
					                                 u32 %98 = OpConstant 3 
					                                     %99 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Uniform f32_4* %16 = OpAccessChain %12 %14 
					                               f32_4 %17 = OpLoad %16 
					                               f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
					                               f32_4 %22 = OpFMul %18 %21 
					                               f32_2 %26 = OpLoad vs_TEXCOORD1 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                               f32_4 %28 = OpFAdd %22 %27 
					                                             OpStore %9 %28 
					                 read_only Texture2D %35 = OpLoad %34 
					                             sampler %39 = OpLoad %38 
					          read_only Texture2DSampled %41 = OpSampledImage %35 %39 
					                               f32_4 %42 = OpLoad %9 
					                               f32_2 %43 = OpVectorShuffle %42 %42 0 1 
					                               f32_4 %44 = OpImageSampleImplicitLod %41 %43 
					                               f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
					                                             OpStore %31 %45 
					                 read_only Texture2D %47 = OpLoad %34 
					                             sampler %48 = OpLoad %38 
					          read_only Texture2DSampled %49 = OpSampledImage %47 %48 
					                               f32_4 %50 = OpLoad %9 
					                               f32_2 %51 = OpVectorShuffle %50 %50 2 3 
					                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
					                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
					                                             OpStore %46 %53 
					                               f32_3 %55 = OpLoad %46 
					                               f32_3 %56 = OpLoad %31 
					                               f32_3 %57 = OpFAdd %55 %56 
					                                             OpStore %54 %57 
					                      Uniform f32_4* %59 = OpAccessChain %12 %14 
					                               f32_4 %60 = OpLoad %59 
					                               f32_4 %61 = OpVectorShuffle %60 %60 0 1 0 1 
					                               f32_4 %63 = OpFMul %61 %62 
					                               f32_2 %64 = OpLoad vs_TEXCOORD1 
					                               f32_4 %65 = OpVectorShuffle %64 %64 0 1 0 1 
					                               f32_4 %66 = OpFAdd %63 %65 
					                                             OpStore %58 %66 
					                 read_only Texture2D %68 = OpLoad %34 
					                             sampler %69 = OpLoad %38 
					          read_only Texture2DSampled %70 = OpSampledImage %68 %69 
					                               f32_4 %71 = OpLoad %58 
					                               f32_2 %72 = OpVectorShuffle %71 %71 0 1 
					                               f32_4 %73 = OpImageSampleImplicitLod %70 %72 
					                               f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
					                                             OpStore %67 %74 
					                 read_only Texture2D %75 = OpLoad %34 
					                             sampler %76 = OpLoad %38 
					          read_only Texture2DSampled %77 = OpSampledImage %75 %76 
					                               f32_4 %78 = OpLoad %58 
					                               f32_2 %79 = OpVectorShuffle %78 %78 2 3 
					                               f32_4 %80 = OpImageSampleImplicitLod %77 %79 
					                               f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
					                                             OpStore %31 %81 
					                               f32_3 %82 = OpLoad %54 
					                               f32_3 %83 = OpLoad %67 
					                               f32_3 %84 = OpFAdd %82 %83 
					                                             OpStore %54 %84 
					                               f32_3 %85 = OpLoad %31 
					                               f32_3 %86 = OpLoad %54 
					                               f32_3 %87 = OpFAdd %85 %86 
					                                             OpStore %54 %87 
					                               f32_3 %90 = OpLoad %54 
					                               f32_3 %93 = OpFMul %90 %92 
					                               f32_4 %94 = OpLoad %89 
					                               f32_4 %95 = OpVectorShuffle %94 %93 4 5 6 3 
					                                             OpStore %89 %95 
					                        Output f32* %100 = OpAccessChain %89 %98 
					                                             OpStore %100 %96 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25);
					    SV_Target0.w = 0.0;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 261257
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec2 _BaseTex_TexelSize;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _BaseTex_TexelSize.y<0.0;
					    u_xlat2.xyz = in_TEXCOORD0.xyx * _MainTex_ST.xyx + _MainTex_ST.zwz;
					    u_xlat1.x = (-u_xlat2.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat1.x : u_xlat2.y;
					    phase0_Output0_1.xyz = u_xlat2.xyz;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	float _SampleScale;
					UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					void main()
					{
					    u_xlat0.x = 1.0;
					    u_xlat0.z = _SampleScale;
					    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
					    u_xlat1.z = float(-1.0);
					    u_xlat1.w = float(0.0);
					    u_xlat1.x = _SampleScale;
					    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_3.xyz;
					    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
					    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_1.xyz;
					    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat10_1.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 143
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %131 %134 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %19 0 Offset 19 
					                                                      OpMemberDecorate %19 1 Offset 19 
					                                                      OpMemberDecorate %19 2 Offset 19 
					                                                      OpMemberDecorate %19 3 Offset 19 
					                                                      OpDecorate %19 Block 
					                                                      OpDecorate %21 DescriptorSet 21 
					                                                      OpDecorate %21 Binding 21 
					                                                      OpMemberDecorate %71 0 BuiltIn 71 
					                                                      OpMemberDecorate %71 1 BuiltIn 71 
					                                                      OpMemberDecorate %71 2 BuiltIn 71 
					                                                      OpDecorate %71 Block 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate vs_TEXCOORD0 Location 131 
					                                                      OpDecorate vs_TEXCOORD1 Location 134 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                                 Input f32_4* %11 = OpVariable Input 
					                                              %14 = OpTypeInt 32 0 
					                                          u32 %15 = OpConstant 4 
					                                              %16 = OpTypeArray %7 %15 
					                                              %17 = OpTypeArray %7 %15 
					                                              %18 = OpTypeVector %6 2 
					                                              %19 = OpTypeStruct %16 %17 %7 %18 
					                                              %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_2;}* %21 = OpVariable Uniform 
					                                              %22 = OpTypeInt 32 1 
					                                          i32 %23 = OpConstant 0 
					                                          i32 %24 = OpConstant 1 
					                                              %25 = OpTypePointer Uniform %7 
					                                          i32 %36 = OpConstant 2 
					                                          i32 %45 = OpConstant 3 
					                               Private f32_4* %49 = OpVariable Private 
					                                          u32 %69 = OpConstant 1 
					                                              %70 = OpTypeArray %6 %69 
					                                              %71 = OpTypeStruct %7 %6 %70 
					                                              %72 = OpTypePointer Output %71 
					         Output struct {f32_4; f32; f32[1];}* %73 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeBool 
					                                              %84 = OpTypePointer Private %83 
					                                Private bool* %85 = OpVariable Private 
					                                              %86 = OpTypePointer Uniform %6 
					                                          f32 %89 = OpConstant 3,674022E-40 
					                                              %91 = OpTypeVector %6 3 
					                                              %92 = OpTypePointer Private %91 
					                               Private f32_3* %93 = OpVariable Private 
					                                 Input f32_4* %94 = OpVariable Input 
					                                             %105 = OpTypePointer Private %6 
					                                         f32 %109 = OpConstant 3,674022E-40 
					                                         u32 %111 = OpConstant 0 
					                              Private f32_4* %113 = OpVariable Private 
					                                             %115 = OpTypePointer Function %6 
					                                         u32 %125 = OpConstant 3 
					                                             %130 = OpTypePointer Output %18 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                             %137 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %116 = OpVariable Function 
					                                        f32_4 %12 = OpLoad %11 
					                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
					                                        f32_4 %27 = OpLoad %26 
					                                        f32_4 %28 = OpFMul %13 %27 
					                                                      OpStore %9 %28 
					                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
					                                        f32_4 %30 = OpLoad %29 
					                                        f32_4 %31 = OpLoad %11 
					                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
					                                        f32_4 %33 = OpFMul %30 %32 
					                                        f32_4 %34 = OpLoad %9 
					                                        f32_4 %35 = OpFAdd %33 %34 
					                                                      OpStore %9 %35 
					                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
					                                        f32_4 %38 = OpLoad %37 
					                                        f32_4 %39 = OpLoad %11 
					                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
					                                        f32_4 %41 = OpFMul %38 %40 
					                                        f32_4 %42 = OpLoad %9 
					                                        f32_4 %43 = OpFAdd %41 %42 
					                                                      OpStore %9 %43 
					                                        f32_4 %44 = OpLoad %9 
					                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
					                                        f32_4 %47 = OpLoad %46 
					                                        f32_4 %48 = OpFAdd %44 %47 
					                                                      OpStore %9 %48 
					                                        f32_4 %50 = OpLoad %9 
					                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
					                               Uniform f32_4* %52 = OpAccessChain %21 %24 %24 
					                                        f32_4 %53 = OpLoad %52 
					                                        f32_4 %54 = OpFMul %51 %53 
					                                                      OpStore %49 %54 
					                               Uniform f32_4* %55 = OpAccessChain %21 %24 %23 
					                                        f32_4 %56 = OpLoad %55 
					                                        f32_4 %57 = OpLoad %9 
					                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
					                                        f32_4 %59 = OpFMul %56 %58 
					                                        f32_4 %60 = OpLoad %49 
					                                        f32_4 %61 = OpFAdd %59 %60 
					                                                      OpStore %49 %61 
					                               Uniform f32_4* %62 = OpAccessChain %21 %24 %36 
					                                        f32_4 %63 = OpLoad %62 
					                                        f32_4 %64 = OpLoad %9 
					                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
					                                        f32_4 %66 = OpFMul %63 %65 
					                                        f32_4 %67 = OpLoad %49 
					                                        f32_4 %68 = OpFAdd %66 %67 
					                                                      OpStore %49 %68 
					                               Uniform f32_4* %74 = OpAccessChain %21 %24 %45 
					                                        f32_4 %75 = OpLoad %74 
					                                        f32_4 %76 = OpLoad %9 
					                                        f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
					                                        f32_4 %78 = OpFMul %75 %77 
					                                        f32_4 %79 = OpLoad %49 
					                                        f32_4 %80 = OpFAdd %78 %79 
					                                Output f32_4* %82 = OpAccessChain %73 %23 
					                                                      OpStore %82 %80 
					                                 Uniform f32* %87 = OpAccessChain %21 %45 %69 
					                                          f32 %88 = OpLoad %87 
					                                         bool %90 = OpFOrdLessThan %88 %89 
					                                                      OpStore %85 %90 
					                                        f32_4 %95 = OpLoad %94 
					                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 0 
					                               Uniform f32_4* %97 = OpAccessChain %21 %36 
					                                        f32_4 %98 = OpLoad %97 
					                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 0 
					                                       f32_3 %100 = OpFMul %96 %99 
					                              Uniform f32_4* %101 = OpAccessChain %21 %36 
					                                       f32_4 %102 = OpLoad %101 
					                                       f32_3 %103 = OpVectorShuffle %102 %102 2 3 2 
					                                       f32_3 %104 = OpFAdd %100 %103 
					                                                      OpStore %93 %104 
					                                Private f32* %106 = OpAccessChain %93 %69 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFNegate %107 
					                                         f32 %110 = OpFAdd %108 %109 
					                                Private f32* %112 = OpAccessChain %49 %111 
					                                                      OpStore %112 %110 
					                                        bool %114 = OpLoad %85 
					                                                      OpSelectionMerge %118 None 
					                                                      OpBranchConditional %114 %117 %121 
					                                             %117 = OpLabel 
					                                Private f32* %119 = OpAccessChain %49 %111 
					                                         f32 %120 = OpLoad %119 
					                                                      OpStore %116 %120 
					                                                      OpBranch %118 
					                                             %121 = OpLabel 
					                                Private f32* %122 = OpAccessChain %93 %69 
					                                         f32 %123 = OpLoad %122 
					                                                      OpStore %116 %123 
					                                                      OpBranch %118 
					                                             %118 = OpLabel 
					                                         f32 %124 = OpLoad %116 
					                                Private f32* %126 = OpAccessChain %113 %125 
					                                                      OpStore %126 %124 
					                                       f32_3 %127 = OpLoad %93 
					                                       f32_4 %128 = OpLoad %113 
					                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
					                                                      OpStore %113 %129 
					                                       f32_4 %132 = OpLoad %113 
					                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
					                                                      OpStore vs_TEXCOORD0 %133 
					                                       f32_4 %135 = OpLoad %113 
					                                       f32_2 %136 = OpVectorShuffle %135 %135 2 3 
					                                                      OpStore vs_TEXCOORD1 %136 
					                                 Output f32* %138 = OpAccessChain %73 %23 %69 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFNegate %139 
					                                 Output f32* %141 = OpAccessChain %73 %23 %69 
					                                                      OpStore %141 %140 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 225
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %51 %208 %213 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                              OpMemberDecorate %15 0 Offset 15 
					                                              OpMemberDecorate %15 1 Offset 15 
					                                              OpDecorate %15 Block 
					                                              OpDecorate %17 DescriptorSet 17 
					                                              OpDecorate %17 Binding 17 
					                                              OpDecorate vs_TEXCOORD0 Location 51 
					                                              OpDecorate %57 RelaxedPrecision 
					                                              OpDecorate %60 RelaxedPrecision 
					                                              OpDecorate %60 DescriptorSet 60 
					                                              OpDecorate %60 Binding 60 
					                                              OpDecorate %61 RelaxedPrecision 
					                                              OpDecorate %64 RelaxedPrecision 
					                                              OpDecorate %64 DescriptorSet 64 
					                                              OpDecorate %64 Binding 64 
					                                              OpDecorate %65 RelaxedPrecision 
					                                              OpDecorate %71 RelaxedPrecision 
					                                              OpDecorate %72 RelaxedPrecision 
					                                              OpDecorate %73 RelaxedPrecision 
					                                              OpDecorate %74 RelaxedPrecision 
					                                              OpDecorate %79 RelaxedPrecision 
					                                              OpDecorate %80 RelaxedPrecision 
					                                              OpDecorate %81 RelaxedPrecision 
					                                              OpDecorate %84 RelaxedPrecision 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %99 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %107 RelaxedPrecision 
					                                              OpDecorate %134 RelaxedPrecision 
					                                              OpDecorate %135 RelaxedPrecision 
					                                              OpDecorate %136 RelaxedPrecision 
					                                              OpDecorate %141 RelaxedPrecision 
					                                              OpDecorate %142 RelaxedPrecision 
					                                              OpDecorate %143 RelaxedPrecision 
					                                              OpDecorate %144 RelaxedPrecision 
					                                              OpDecorate %149 RelaxedPrecision 
					                                              OpDecorate %150 RelaxedPrecision 
					                                              OpDecorate %151 RelaxedPrecision 
					                                              OpDecorate %156 RelaxedPrecision 
					                                              OpDecorate %157 RelaxedPrecision 
					                                              OpDecorate %158 RelaxedPrecision 
					                                              OpDecorate %159 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %161 RelaxedPrecision 
					                                              OpDecorate %162 RelaxedPrecision 
					                                              OpDecorate %163 RelaxedPrecision 
					                                              OpDecorate %167 RelaxedPrecision 
					                                              OpDecorate %168 RelaxedPrecision 
					                                              OpDecorate %171 RelaxedPrecision 
					                                              OpDecorate %172 RelaxedPrecision 
					                                              OpDecorate %173 RelaxedPrecision 
					                                              OpDecorate %174 RelaxedPrecision 
					                                              OpDecorate %175 RelaxedPrecision 
					                                              OpDecorate %176 RelaxedPrecision 
					                                              OpDecorate %177 RelaxedPrecision 
					                                              OpDecorate %178 RelaxedPrecision 
					                                              OpDecorate %179 RelaxedPrecision 
					                                              OpDecorate %184 RelaxedPrecision 
					                                              OpDecorate %185 RelaxedPrecision 
					                                              OpDecorate %186 RelaxedPrecision 
					                                              OpDecorate %191 RelaxedPrecision 
					                                              OpDecorate %192 RelaxedPrecision 
					                                              OpDecorate %193 RelaxedPrecision 
					                                              OpDecorate %194 RelaxedPrecision 
					                                              OpDecorate %195 RelaxedPrecision 
					                                              OpDecorate %196 RelaxedPrecision 
					                                              OpDecorate %197 RelaxedPrecision 
					                                              OpDecorate %198 RelaxedPrecision 
					                                              OpDecorate %199 RelaxedPrecision 
					                                              OpDecorate %200 RelaxedPrecision 
					                                              OpDecorate %201 RelaxedPrecision 
					                                              OpDecorate %202 RelaxedPrecision 
					                                              OpDecorate %203 RelaxedPrecision 
					                                              OpDecorate %203 DescriptorSet 203 
					                                              OpDecorate %203 Binding 203 
					                                              OpDecorate %204 RelaxedPrecision 
					                                              OpDecorate %205 RelaxedPrecision 
					                                              OpDecorate %205 DescriptorSet 205 
					                                              OpDecorate %205 Binding 205 
					                                              OpDecorate %206 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD1 Location 208 
					                                              OpDecorate %211 RelaxedPrecision 
					                                              OpDecorate %213 RelaxedPrecision 
					                                              OpDecorate %213 Location 213 
					                                              OpDecorate %214 RelaxedPrecision 
					                                              OpDecorate %217 RelaxedPrecision 
					                                              OpDecorate %218 RelaxedPrecision 
					                                              OpDecorate %219 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                  f32 %10 = OpConstant 3,674022E-40 
					                                      %11 = OpTypeInt 32 0 
					                                  u32 %12 = OpConstant 0 
					                                      %13 = OpTypePointer Private %6 
					                                      %15 = OpTypeStruct %7 %6 
					                                      %16 = OpTypePointer Uniform %15 
					        Uniform struct {f32_4; f32;}* %17 = OpVariable Uniform 
					                                      %18 = OpTypeInt 32 1 
					                                  i32 %19 = OpConstant 1 
					                                      %20 = OpTypePointer Uniform %6 
					                                  u32 %23 = OpConstant 2 
					                                  i32 %27 = OpConstant 0 
					                                      %28 = OpTypePointer Uniform %7 
					                       Private f32_4* %33 = OpVariable Private 
					                                  f32 %34 = OpConstant 3,674022E-40 
					                                  f32 %36 = OpConstant 3,674022E-40 
					                                  u32 %37 = OpConstant 3 
					                       Private f32_4* %42 = OpVariable Private 
					                                      %49 = OpTypeVector %6 2 
					                                      %50 = OpTypePointer Input %49 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %55 = OpTypeVector %6 3 
					                                      %56 = OpTypePointer Private %55 
					                       Private f32_3* %57 = OpVariable Private 
					                                      %58 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %59 = OpTypePointer UniformConstant %58 
					 UniformConstant read_only Texture2D* %60 = OpVariable UniformConstant 
					                                      %62 = OpTypeSampler 
					                                      %63 = OpTypePointer UniformConstant %62 
					             UniformConstant sampler* %64 = OpVariable UniformConstant 
					                                      %66 = OpTypeSampledImage %58 
					                       Private f32_3* %72 = OpVariable Private 
					                       Private f32_3* %80 = OpVariable Private 
					                                  f32 %82 = OpConstant 3,674022E-40 
					                                f32_3 %83 = OpConstantComposite %82 %82 %82 
					                       Private f32_4* %87 = OpVariable Private 
					                      Private f32_4* %116 = OpVariable Private 
					                      Private f32_3* %134 = OpVariable Private 
					                      Private f32_3* %142 = OpVariable Private 
					                      Private f32_3* %157 = OpVariable Private 
					                                 f32 %169 = OpConstant 3,674022E-40 
					                               f32_3 %170 = OpConstantComposite %169 %169 %169 
					                      Private f32_3* %199 = OpVariable Private 
					UniformConstant read_only Texture2D* %203 = OpVariable UniformConstant 
					            UniformConstant sampler* %205 = OpVariable UniformConstant 
					                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %212 = OpTypePointer Output %7 
					                       Output f32_4* %213 = OpVariable Output 
					                                 f32 %215 = OpConstant 3,674022E-40 
					                               f32_3 %216 = OpConstantComposite %215 %215 %215 
					                                     %222 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                         Private f32* %14 = OpAccessChain %9 %12 
					                                              OpStore %14 %10 
					                         Uniform f32* %21 = OpAccessChain %17 %19 
					                                  f32 %22 = OpLoad %21 
					                         Private f32* %24 = OpAccessChain %9 %23 
					                                              OpStore %24 %22 
					                                f32_4 %25 = OpLoad %9 
					                                f32_4 %26 = OpVectorShuffle %25 %25 0 0 2 2 
					                       Uniform f32_4* %29 = OpAccessChain %17 %27 
					                                f32_4 %30 = OpLoad %29 
					                                f32_4 %31 = OpVectorShuffle %30 %30 0 1 0 1 
					                                f32_4 %32 = OpFMul %26 %31 
					                                              OpStore %9 %32 
					                         Private f32* %35 = OpAccessChain %33 %23 
					                                              OpStore %35 %34 
					                         Private f32* %38 = OpAccessChain %33 %37 
					                                              OpStore %38 %36 
					                         Uniform f32* %39 = OpAccessChain %17 %19 
					                                  f32 %40 = OpLoad %39 
					                         Private f32* %41 = OpAccessChain %33 %12 
					                                              OpStore %41 %40 
					                                f32_4 %43 = OpLoad %9 
					                                f32_4 %44 = OpVectorShuffle %43 %43 0 1 3 1 
					                                f32_4 %45 = OpFNegate %44 
					                                f32_4 %46 = OpLoad %33 
					                                f32_4 %47 = OpVectorShuffle %46 %46 0 0 3 0 
					                                f32_4 %48 = OpFMul %45 %47 
					                                f32_2 %52 = OpLoad vs_TEXCOORD0 
					                                f32_4 %53 = OpVectorShuffle %52 %52 0 1 0 1 
					                                f32_4 %54 = OpFAdd %48 %53 
					                                              OpStore %42 %54 
					                  read_only Texture2D %61 = OpLoad %60 
					                              sampler %65 = OpLoad %64 
					           read_only Texture2DSampled %67 = OpSampledImage %61 %65 
					                                f32_4 %68 = OpLoad %42 
					                                f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                f32_4 %70 = OpImageSampleImplicitLod %67 %69 
					                                f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                              OpStore %57 %71 
					                  read_only Texture2D %73 = OpLoad %60 
					                              sampler %74 = OpLoad %64 
					           read_only Texture2DSampled %75 = OpSampledImage %73 %74 
					                                f32_4 %76 = OpLoad %42 
					                                f32_2 %77 = OpVectorShuffle %76 %76 2 3 
					                                f32_4 %78 = OpImageSampleImplicitLod %75 %77 
					                                f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
					                                              OpStore %72 %79 
					                                f32_3 %81 = OpLoad %72 
					                                f32_3 %84 = OpFMul %81 %83 
					                                f32_3 %85 = OpLoad %57 
					                                f32_3 %86 = OpFAdd %84 %85 
					                                              OpStore %80 %86 
					                                f32_4 %88 = OpLoad %9 
					                                f32_2 %89 = OpVectorShuffle %88 %88 2 1 
					                                f32_2 %90 = OpFNegate %89 
					                                f32_4 %91 = OpLoad %33 
					                                f32_2 %92 = OpVectorShuffle %91 %91 2 0 
					                                f32_2 %93 = OpFMul %90 %92 
					                                f32_2 %94 = OpLoad vs_TEXCOORD0 
					                                f32_2 %95 = OpFAdd %93 %94 
					                                f32_4 %96 = OpLoad %87 
					                                f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
					                                              OpStore %87 %97 
					                  read_only Texture2D %98 = OpLoad %60 
					                              sampler %99 = OpLoad %64 
					          read_only Texture2DSampled %100 = OpSampledImage %98 %99 
					                               f32_4 %101 = OpLoad %87 
					                               f32_2 %102 = OpVectorShuffle %101 %101 0 1 
					                               f32_4 %103 = OpImageSampleImplicitLod %100 %102 
					                               f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
					                                              OpStore %57 %104 
					                               f32_3 %105 = OpLoad %80 
					                               f32_3 %106 = OpLoad %57 
					                               f32_3 %107 = OpFAdd %105 %106 
					                                              OpStore %80 %107 
					                               f32_4 %108 = OpLoad %9 
					                               f32_4 %109 = OpVectorShuffle %108 %108 2 3 0 3 
					                               f32_4 %110 = OpLoad %33 
					                               f32_4 %111 = OpVectorShuffle %110 %110 2 3 0 3 
					                               f32_4 %112 = OpFMul %109 %111 
					                               f32_2 %113 = OpLoad vs_TEXCOORD0 
					                               f32_4 %114 = OpVectorShuffle %113 %113 0 1 0 1 
					                               f32_4 %115 = OpFAdd %112 %114 
					                                              OpStore %87 %115 
					                               f32_4 %117 = OpLoad %9 
					                               f32_4 %118 = OpVectorShuffle %117 %117 2 1 3 1 
					                               f32_4 %119 = OpLoad %33 
					                               f32_4 %120 = OpVectorShuffle %119 %119 2 0 3 0 
					                               f32_4 %121 = OpFMul %118 %120 
					                               f32_2 %122 = OpLoad vs_TEXCOORD0 
					                               f32_4 %123 = OpVectorShuffle %122 %122 0 1 0 1 
					                               f32_4 %124 = OpFAdd %121 %123 
					                                              OpStore %116 %124 
					                               f32_4 %125 = OpLoad %9 
					                               f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                               f32_4 %127 = OpLoad %33 
					                               f32_2 %128 = OpVectorShuffle %127 %127 0 0 
					                               f32_2 %129 = OpFMul %126 %128 
					                               f32_2 %130 = OpLoad vs_TEXCOORD0 
					                               f32_2 %131 = OpFAdd %129 %130 
					                               f32_4 %132 = OpLoad %9 
					                               f32_4 %133 = OpVectorShuffle %132 %131 4 5 2 3 
					                                              OpStore %9 %133 
					                 read_only Texture2D %135 = OpLoad %60 
					                             sampler %136 = OpLoad %64 
					          read_only Texture2DSampled %137 = OpSampledImage %135 %136 
					                               f32_4 %138 = OpLoad %9 
					                               f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                               f32_4 %140 = OpImageSampleImplicitLod %137 %139 
					                               f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
					                                              OpStore %134 %141 
					                 read_only Texture2D %143 = OpLoad %60 
					                             sampler %144 = OpLoad %64 
					          read_only Texture2DSampled %145 = OpSampledImage %143 %144 
					                               f32_4 %146 = OpLoad %87 
					                               f32_2 %147 = OpVectorShuffle %146 %146 0 1 
					                               f32_4 %148 = OpImageSampleImplicitLod %145 %147 
					                               f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
					                                              OpStore %142 %149 
					                 read_only Texture2D %150 = OpLoad %60 
					                             sampler %151 = OpLoad %64 
					          read_only Texture2DSampled %152 = OpSampledImage %150 %151 
					                               f32_4 %153 = OpLoad %87 
					                               f32_2 %154 = OpVectorShuffle %153 %153 2 3 
					                               f32_4 %155 = OpImageSampleImplicitLod %152 %154 
					                               f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
					                                              OpStore %57 %156 
					                               f32_3 %158 = OpLoad %142 
					                               f32_3 %159 = OpFMul %158 %83 
					                               f32_3 %160 = OpLoad %80 
					                               f32_3 %161 = OpFAdd %159 %160 
					                                              OpStore %157 %161 
					                 read_only Texture2D %162 = OpLoad %60 
					                             sampler %163 = OpLoad %64 
					          read_only Texture2DSampled %164 = OpSampledImage %162 %163 
					                               f32_2 %165 = OpLoad vs_TEXCOORD0 
					                               f32_4 %166 = OpImageSampleImplicitLod %164 %165 
					                               f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
					                                              OpStore %72 %167 
					                               f32_3 %168 = OpLoad %72 
					                               f32_3 %171 = OpFMul %168 %170 
					                               f32_3 %172 = OpLoad %157 
					                               f32_3 %173 = OpFAdd %171 %172 
					                                              OpStore %157 %173 
					                               f32_3 %174 = OpLoad %57 
					                               f32_3 %175 = OpFMul %174 %83 
					                               f32_3 %176 = OpLoad %157 
					                               f32_3 %177 = OpFAdd %175 %176 
					                                              OpStore %157 %177 
					                 read_only Texture2D %178 = OpLoad %60 
					                             sampler %179 = OpLoad %64 
					          read_only Texture2DSampled %180 = OpSampledImage %178 %179 
					                               f32_4 %181 = OpLoad %116 
					                               f32_2 %182 = OpVectorShuffle %181 %181 0 1 
					                               f32_4 %183 = OpImageSampleImplicitLod %180 %182 
					                               f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
					                                              OpStore %72 %184 
					                 read_only Texture2D %185 = OpLoad %60 
					                             sampler %186 = OpLoad %64 
					          read_only Texture2DSampled %187 = OpSampledImage %185 %186 
					                               f32_4 %188 = OpLoad %116 
					                               f32_2 %189 = OpVectorShuffle %188 %188 2 3 
					                               f32_4 %190 = OpImageSampleImplicitLod %187 %189 
					                               f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
					                                              OpStore %57 %191 
					                               f32_3 %192 = OpLoad %157 
					                               f32_3 %193 = OpLoad %72 
					                               f32_3 %194 = OpFAdd %192 %193 
					                                              OpStore %157 %194 
					                               f32_3 %195 = OpLoad %57 
					                               f32_3 %196 = OpFMul %195 %83 
					                               f32_3 %197 = OpLoad %157 
					                               f32_3 %198 = OpFAdd %196 %197 
					                                              OpStore %157 %198 
					                               f32_3 %200 = OpLoad %134 
					                               f32_3 %201 = OpLoad %157 
					                               f32_3 %202 = OpFAdd %200 %201 
					                                              OpStore %199 %202 
					                 read_only Texture2D %204 = OpLoad %203 
					                             sampler %206 = OpLoad %205 
					          read_only Texture2DSampled %207 = OpSampledImage %204 %206 
					                               f32_2 %209 = OpLoad vs_TEXCOORD1 
					                               f32_4 %210 = OpImageSampleImplicitLod %207 %209 
					                               f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
					                                              OpStore %142 %211 
					                               f32_3 %214 = OpLoad %199 
					                               f32_3 %217 = OpFMul %214 %216 
					                               f32_3 %218 = OpLoad %142 
					                               f32_3 %219 = OpFAdd %217 %218 
					                               f32_4 %220 = OpLoad %213 
					                               f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
					                                              OpStore %213 %221 
					                         Output f32* %223 = OpAccessChain %213 %37 
					                                              OpStore %223 %36 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[2];
						float _SampleScale;
					};
					uniform  sampler2D _BaseTex;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					void main()
					{
					    u_xlat0.x = 1.0;
					    u_xlat0.z = _SampleScale;
					    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
					    u_xlat1.z = float(-1.0);
					    u_xlat1.w = float(0.0);
					    u_xlat1.x = _SampleScale;
					    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_3.xyz;
					    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
					    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_1.xyz;
					    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat10_1.xyz;
					    SV_Target0.w = 0.0;
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