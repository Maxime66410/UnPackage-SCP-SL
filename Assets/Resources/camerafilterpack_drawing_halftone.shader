Shader "CameraFilterPack/Drawing_floattone" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_DotSize ("_DotSize", Range(1, 16)) = 10
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 61282
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
					uniform 	float _DotSize;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat16_0;
					float u_xlat1;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat1 = u_xlat0.x * 0.707106411 + (-u_xlat6.y);
					    u_xlat6.x = u_xlat6.y + u_xlat6.x;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0 = dot(u_xlat10_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
					    u_xlat3.x = 2136.28125 / _DotSize;
					    u_xlat3.z = u_xlat3.x * u_xlat1;
					    u_xlat3.x = u_xlat3.x * u_xlat6.x;
					    u_xlat3.xy = cos(u_xlat3.xz);
					    u_xlat3.x = u_xlat3.x * 0.25 + 0.5;
					    u_xlat3.x = u_xlat3.y * 0.25 + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * _Distortion + u_xlat16_0;
					    u_xlat0.x = u_xlat0.x + (-_Distortion);
					    u_xlat3.x = (-_Distortion) + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx / u_xlat3.xxx;
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
					; Bound: 152
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %140 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpMemberDecorate %14 2 RelaxedPrecision 
					                                             OpMemberDecorate %14 2 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %55 DescriptorSet 55 
					                                             OpDecorate %55 Binding 55 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %59 DescriptorSet 59 
					                                             OpDecorate %59 Binding 59 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %123 RelaxedPrecision 
					                                             OpDecorate %140 Location 140 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %6 %6 %13 
					                                     %15 = OpTypePointer Uniform %14 
					  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 2 
					                                     %19 = OpTypePointer Uniform %13 
					                      Private f32_2* %28 = OpVariable Private 
					                                 f32 %30 = OpConstant 3,674022E-40 
					                               f32_2 %31 = OpConstantComposite %30 %30 
					                                     %33 = OpTypePointer Private %6 
					                        Private f32* %34 = OpVariable Private 
					                                     %35 = OpTypeInt 32 0 
					                                 u32 %36 = OpConstant 0 
					                                 u32 %40 = OpConstant 1 
					                                     %51 = OpTypePointer Private %13 
					                      Private f32_4* %52 = OpVariable Private 
					                                     %53 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %54 = OpTypePointer UniformConstant %53 
					UniformConstant read_only Texture2D* %55 = OpVariable UniformConstant 
					                                     %57 = OpTypeSampler 
					                                     %58 = OpTypePointer UniformConstant %57 
					            UniformConstant sampler* %59 = OpVariable UniformConstant 
					                                     %61 = OpTypeSampledImage %53 
					                                     %65 = OpTypeVector %6 3 
					                        Private f32* %69 = OpVariable Private 
					                                 f32 %72 = OpConstant 3,674022E-40 
					                                 f32 %73 = OpConstant 3,674022E-40 
					                                 f32 %74 = OpConstant 3,674022E-40 
					                               f32_3 %75 = OpConstantComposite %72 %73 %74 
					                                     %77 = OpTypePointer Private %65 
					                      Private f32_3* %78 = OpVariable Private 
					                                 f32 %79 = OpConstant 3,674022E-40 
					                                 i32 %80 = OpConstant 1 
					                                     %81 = OpTypePointer Uniform %6 
					                                 u32 %90 = OpConstant 2 
					                                f32 %105 = OpConstant 3,674022E-40 
					                                f32 %107 = OpConstant 3,674022E-40 
					                                i32 %119 = OpConstant 0 
					                                f32 %136 = OpConstant 3,674022E-40 
					                                    %139 = OpTypePointer Output %13 
					                      Output f32_4* %140 = OpVariable Output 
					                                u32 %148 = OpConstant 3 
					                                    %149 = OpTypePointer Output %6 
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
					                        Private f32* %37 = OpAccessChain %9 %36 
					                                 f32 %38 = OpLoad %37 
					                                 f32 %39 = OpFMul %38 %30 
					                        Private f32* %41 = OpAccessChain %28 %40 
					                                 f32 %42 = OpLoad %41 
					                                 f32 %43 = OpFNegate %42 
					                                 f32 %44 = OpFAdd %39 %43 
					                                             OpStore %34 %44 
					                        Private f32* %45 = OpAccessChain %28 %40 
					                                 f32 %46 = OpLoad %45 
					                        Private f32* %47 = OpAccessChain %28 %36 
					                                 f32 %48 = OpLoad %47 
					                                 f32 %49 = OpFAdd %46 %48 
					                        Private f32* %50 = OpAccessChain %28 %36 
					                                             OpStore %50 %49 
					                 read_only Texture2D %56 = OpLoad %55 
					                             sampler %60 = OpLoad %59 
					          read_only Texture2DSampled %62 = OpSampledImage %56 %60 
					                               f32_2 %63 = OpLoad %9 
					                               f32_4 %64 = OpImageSampleImplicitLod %62 %63 
					                               f32_3 %66 = OpVectorShuffle %64 %64 0 1 2 
					                               f32_4 %67 = OpLoad %52 
					                               f32_4 %68 = OpVectorShuffle %67 %66 4 5 2 6 
					                                             OpStore %52 %68 
					                               f32_4 %70 = OpLoad %52 
					                               f32_3 %71 = OpVectorShuffle %70 %70 0 1 3 
					                                 f32 %76 = OpDot %71 %75 
					                                             OpStore %69 %76 
					                        Uniform f32* %82 = OpAccessChain %16 %80 
					                                 f32 %83 = OpLoad %82 
					                                 f32 %84 = OpFDiv %79 %83 
					                        Private f32* %85 = OpAccessChain %78 %36 
					                                             OpStore %85 %84 
					                        Private f32* %86 = OpAccessChain %78 %36 
					                                 f32 %87 = OpLoad %86 
					                                 f32 %88 = OpLoad %34 
					                                 f32 %89 = OpFMul %87 %88 
					                        Private f32* %91 = OpAccessChain %78 %90 
					                                             OpStore %91 %89 
					                        Private f32* %92 = OpAccessChain %78 %36 
					                                 f32 %93 = OpLoad %92 
					                        Private f32* %94 = OpAccessChain %28 %36 
					                                 f32 %95 = OpLoad %94 
					                                 f32 %96 = OpFMul %93 %95 
					                        Private f32* %97 = OpAccessChain %78 %36 
					                                             OpStore %97 %96 
					                               f32_3 %98 = OpLoad %78 
					                               f32_2 %99 = OpVectorShuffle %98 %98 0 2 
					                              f32_2 %100 = OpExtInst %1 14 %99 
					                              f32_3 %101 = OpLoad %78 
					                              f32_3 %102 = OpVectorShuffle %101 %100 3 4 2 
					                                             OpStore %78 %102 
					                       Private f32* %103 = OpAccessChain %78 %36 
					                                f32 %104 = OpLoad %103 
					                                f32 %106 = OpFMul %104 %105 
					                                f32 %108 = OpFAdd %106 %107 
					                       Private f32* %109 = OpAccessChain %78 %36 
					                                             OpStore %109 %108 
					                       Private f32* %110 = OpAccessChain %78 %40 
					                                f32 %111 = OpLoad %110 
					                                f32 %112 = OpFMul %111 %105 
					                       Private f32* %113 = OpAccessChain %78 %36 
					                                f32 %114 = OpLoad %113 
					                                f32 %115 = OpFAdd %112 %114 
					                       Private f32* %116 = OpAccessChain %78 %36 
					                                             OpStore %116 %115 
					                       Private f32* %117 = OpAccessChain %78 %36 
					                                f32 %118 = OpLoad %117 
					                       Uniform f32* %120 = OpAccessChain %16 %119 
					                                f32 %121 = OpLoad %120 
					                                f32 %122 = OpFMul %118 %121 
					                                f32 %123 = OpLoad %69 
					                                f32 %124 = OpFAdd %122 %123 
					                       Private f32* %125 = OpAccessChain %9 %36 
					                                             OpStore %125 %124 
					                       Private f32* %126 = OpAccessChain %9 %36 
					                                f32 %127 = OpLoad %126 
					                       Uniform f32* %128 = OpAccessChain %16 %119 
					                                f32 %129 = OpLoad %128 
					                                f32 %130 = OpFNegate %129 
					                                f32 %131 = OpFAdd %127 %130 
					                       Private f32* %132 = OpAccessChain %9 %36 
					                                             OpStore %132 %131 
					                       Uniform f32* %133 = OpAccessChain %16 %119 
					                                f32 %134 = OpLoad %133 
					                                f32 %135 = OpFNegate %134 
					                                f32 %137 = OpFAdd %135 %136 
					                       Private f32* %138 = OpAccessChain %78 %36 
					                                             OpStore %138 %137 
					                              f32_2 %141 = OpLoad %9 
					                              f32_3 %142 = OpVectorShuffle %141 %141 0 0 0 
					                              f32_3 %143 = OpLoad %78 
					                              f32_3 %144 = OpVectorShuffle %143 %143 0 0 0 
					                              f32_3 %145 = OpFDiv %142 %144 
					                              f32_4 %146 = OpLoad %140 
					                              f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
					                                             OpStore %140 %147 
					                        Output f32* %150 = OpAccessChain %140 %148 
					                                             OpStore %150 %136 
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
						float _DotSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat16_0;
					float u_xlat1;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat1 = u_xlat0.x * 0.707106411 + (-u_xlat6.y);
					    u_xlat6.x = u_xlat6.y + u_xlat6.x;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0 = dot(u_xlat10_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
					    u_xlat3.x = 2136.28125 / _DotSize;
					    u_xlat3.z = u_xlat3.x * u_xlat1;
					    u_xlat3.x = u_xlat3.x * u_xlat6.x;
					    u_xlat3.xy = cos(u_xlat3.xz);
					    u_xlat3.x = u_xlat3.x * 0.25 + 0.5;
					    u_xlat3.x = u_xlat3.y * 0.25 + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * _Distortion + u_xlat16_0;
					    u_xlat0.x = u_xlat0.x + (-_Distortion);
					    u_xlat3.x = (-_Distortion) + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx / u_xlat3.xxx;
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