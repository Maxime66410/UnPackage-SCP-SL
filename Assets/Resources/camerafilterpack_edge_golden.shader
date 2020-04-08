Shader "CameraFilterPack/Edge_Golden" {
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
			GpuProgramID 36431
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat2 = u_xlat1.zwzw * vec4(-1.5, -1.5, 1.5, -1.5) + u_xlat0.zwzw;
					    u_xlat0 = u_xlat1 * vec4(-1.5, 1.5, 1.5, 1.5) + u_xlat0;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat1.w = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat1.x = dot(u_xlat10_1.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat10_2 = texture(_MainTex, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat10_0.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.y = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.wx;
					    u_xlat0.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(4.5, 1.80000007, -1.50000012) + vec3(0.100000001, 0.180000007, 0.300000012);
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
					; Bound: 154
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %136 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
					                                             OpMemberDecorate %15 0 Offset 15 
					                                             OpMemberDecorate %15 1 RelaxedPrecision 
					                                             OpMemberDecorate %15 1 Offset 15 
					                                             OpDecorate %15 Block 
					                                             OpDecorate %17 DescriptorSet 17 
					                                             OpDecorate %17 Binding 17 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %23 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %57 DescriptorSet 57 
					                                             OpDecorate %57 Binding 57 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %61 DescriptorSet 61 
					                                             OpDecorate %61 Binding 61 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %136 Location 136 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %15 = OpTypeStruct %7 %7 
					                                     %16 = OpTypePointer Uniform %15 
					     Uniform struct {f32_4; f32_4;}* %17 = OpVariable Uniform 
					                                     %18 = OpTypeInt 32 1 
					                                 i32 %19 = OpConstant 1 
					                                     %20 = OpTypePointer Uniform %7 
					                      Private f32_4* %29 = OpVariable Private 
					                                 f32 %30 = OpConstant 3,674022E-40 
					                               f32_4 %31 = OpConstantComposite %30 %30 %30 %30 
					                                 i32 %32 = OpConstant 0 
					                      Private f32_4* %37 = OpVariable Private 
					                                 f32 %40 = OpConstant 3,674022E-40 
					                                 f32 %41 = OpConstant 3,674022E-40 
					                               f32_4 %42 = OpConstantComposite %40 %40 %41 %40 
					                               f32_4 %48 = OpConstantComposite %40 %41 %41 %41 
					                                     %52 = OpTypeVector %6 3 
					                                     %53 = OpTypePointer Private %52 
					                      Private f32_3* %54 = OpVariable Private 
					                                     %55 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %56 = OpTypePointer UniformConstant %55 
					UniformConstant read_only Texture2D* %57 = OpVariable UniformConstant 
					                                     %59 = OpTypeSampler 
					                                     %60 = OpTypePointer UniformConstant %59 
					            UniformConstant sampler* %61 = OpVariable UniformConstant 
					                                     %63 = OpTypeSampledImage %55 
					                      Private f32_3* %69 = OpVariable Private 
					                                 f32 %78 = OpConstant 3,674022E-40 
					                               f32_3 %79 = OpConstantComposite %78 %78 %78 
					                                     %81 = OpTypeInt 32 0 
					                                 u32 %82 = OpConstant 3 
					                                     %83 = OpTypePointer Private %6 
					                                 u32 %87 = OpConstant 0 
					                      Private f32_3* %96 = OpVariable Private 
					                                u32 %109 = OpConstant 1 
					                                    %135 = OpTypePointer Output %7 
					                      Output f32_4* %136 = OpVariable Output 
					                                f32 %139 = OpConstant 3,674022E-40 
					                                f32 %140 = OpConstant 3,674022E-40 
					                                f32 %141 = OpConstant 3,674022E-40 
					                              f32_3 %142 = OpConstantComposite %139 %140 %141 
					                                f32 %144 = OpConstant 3,674022E-40 
					                                f32 %145 = OpConstant 3,674022E-40 
					                                f32 %146 = OpConstant 3,674022E-40 
					                              f32_3 %147 = OpConstantComposite %144 %145 %146 
					                                    %151 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
					                      Uniform f32_4* %21 = OpAccessChain %17 %19 
					                               f32_4 %22 = OpLoad %21 
					                               f32_4 %23 = OpVectorShuffle %22 %22 0 1 0 1 
					                               f32_4 %24 = OpFMul %14 %23 
					                      Uniform f32_4* %25 = OpAccessChain %17 %19 
					                               f32_4 %26 = OpLoad %25 
					                               f32_4 %27 = OpVectorShuffle %26 %26 2 3 2 3 
					                               f32_4 %28 = OpFAdd %24 %27 
					                                             OpStore %9 %28 
					                      Uniform f32_4* %33 = OpAccessChain %17 %32 
					                               f32_4 %34 = OpLoad %33 
					                               f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 1 
					                               f32_4 %36 = OpFDiv %31 %35 
					                                             OpStore %29 %36 
					                               f32_4 %38 = OpLoad %29 
					                               f32_4 %39 = OpVectorShuffle %38 %38 2 3 2 3 
					                               f32_4 %43 = OpFMul %39 %42 
					                               f32_4 %44 = OpLoad %9 
					                               f32_4 %45 = OpVectorShuffle %44 %44 2 3 2 3 
					                               f32_4 %46 = OpFAdd %43 %45 
					                                             OpStore %37 %46 
					                               f32_4 %47 = OpLoad %29 
					                               f32_4 %49 = OpFMul %47 %48 
					                               f32_4 %50 = OpLoad %9 
					                               f32_4 %51 = OpFAdd %49 %50 
					                                             OpStore %9 %51 
					                 read_only Texture2D %58 = OpLoad %57 
					                             sampler %62 = OpLoad %61 
					          read_only Texture2DSampled %64 = OpSampledImage %58 %62 
					                               f32_4 %65 = OpLoad %37 
					                               f32_2 %66 = OpVectorShuffle %65 %65 0 1 
					                               f32_4 %67 = OpImageSampleImplicitLod %64 %66 
					                               f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                             OpStore %54 %68 
					                 read_only Texture2D %70 = OpLoad %57 
					                             sampler %71 = OpLoad %61 
					          read_only Texture2DSampled %72 = OpSampledImage %70 %71 
					                               f32_4 %73 = OpLoad %37 
					                               f32_2 %74 = OpVectorShuffle %73 %73 2 3 
					                               f32_4 %75 = OpImageSampleImplicitLod %72 %74 
					                               f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
					                                             OpStore %69 %76 
					                               f32_3 %77 = OpLoad %69 
					                                 f32 %80 = OpDot %77 %79 
					                        Private f32* %84 = OpAccessChain %29 %82 
					                                             OpStore %84 %80 
					                               f32_3 %85 = OpLoad %54 
					                                 f32 %86 = OpDot %85 %79 
					                        Private f32* %88 = OpAccessChain %29 %87 
					                                             OpStore %88 %86 
					                 read_only Texture2D %89 = OpLoad %57 
					                             sampler %90 = OpLoad %61 
					          read_only Texture2DSampled %91 = OpSampledImage %89 %90 
					                               f32_4 %92 = OpLoad %9 
					                               f32_2 %93 = OpVectorShuffle %92 %92 2 3 
					                               f32_4 %94 = OpImageSampleImplicitLod %91 %93 
					                               f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
					                                             OpStore %69 %95 
					                 read_only Texture2D %97 = OpLoad %57 
					                             sampler %98 = OpLoad %61 
					          read_only Texture2DSampled %99 = OpSampledImage %97 %98 
					                              f32_4 %100 = OpLoad %9 
					                              f32_2 %101 = OpVectorShuffle %100 %100 0 1 
					                              f32_4 %102 = OpImageSampleImplicitLod %99 %101 
					                              f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
					                                             OpStore %96 %103 
					                              f32_3 %104 = OpLoad %96 
					                                f32 %105 = OpDot %104 %79 
					                       Private f32* %106 = OpAccessChain %9 %87 
					                                             OpStore %106 %105 
					                              f32_3 %107 = OpLoad %69 
					                                f32 %108 = OpDot %107 %79 
					                       Private f32* %110 = OpAccessChain %9 %109 
					                                             OpStore %110 %108 
					                              f32_4 %111 = OpLoad %9 
					                              f32_2 %112 = OpVectorShuffle %111 %111 0 1 
					                              f32_2 %113 = OpFNegate %112 
					                              f32_4 %114 = OpLoad %29 
					                              f32_2 %115 = OpVectorShuffle %114 %114 3 0 
					                              f32_2 %116 = OpFAdd %113 %115 
					                              f32_4 %117 = OpLoad %9 
					                              f32_4 %118 = OpVectorShuffle %117 %116 4 5 2 3 
					                                             OpStore %9 %118 
					                       Private f32* %119 = OpAccessChain %9 %87 
					                                f32 %120 = OpLoad %119 
					                                f32 %121 = OpExtInst %1 4 %120 
					                       Private f32* %122 = OpAccessChain %9 %109 
					                                f32 %123 = OpLoad %122 
					                                f32 %124 = OpExtInst %1 4 %123 
					                                f32 %125 = OpExtInst %1 40 %121 %124 
					                       Private f32* %126 = OpAccessChain %9 %87 
					                                             OpStore %126 %125 
					                       Private f32* %127 = OpAccessChain %9 %87 
					                                f32 %128 = OpLoad %127 
					                                f32 %129 = OpExtInst %1 32 %128 
					                       Private f32* %130 = OpAccessChain %9 %87 
					                                             OpStore %130 %129 
					                       Private f32* %131 = OpAccessChain %9 %87 
					                                f32 %132 = OpLoad %131 
					                                f32 %133 = OpFDiv %30 %132 
					                       Private f32* %134 = OpAccessChain %9 %87 
					                                             OpStore %134 %133 
					                              f32_4 %137 = OpLoad %9 
					                              f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
					                              f32_3 %143 = OpFMul %138 %142 
					                              f32_3 %148 = OpFAdd %143 %147 
					                              f32_4 %149 = OpLoad %136 
					                              f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
					                                             OpStore %136 %150 
					                        Output f32* %152 = OpAccessChain %136 %82 
					                                             OpStore %152 %30 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat2 = u_xlat1.zwzw * vec4(-1.5, -1.5, 1.5, -1.5) + u_xlat0.zwzw;
					    u_xlat0 = u_xlat1 * vec4(-1.5, 1.5, 1.5, 1.5) + u_xlat0;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat1.w = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat1.x = dot(u_xlat10_1.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat10_2 = texture(_MainTex, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat10_0.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.y = dot(u_xlat10_2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.wx;
					    u_xlat0.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(4.5, 1.80000007, -1.50000012) + vec3(0.100000001, 0.180000007, 0.300000012);
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