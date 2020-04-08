Shader "CameraFilterPack/Distortion_Lens" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_CenterX ("_CenterX", Range(-1, 1)) = 0
		_CenterY ("_CenterY", Range(-1, 1)) = 0
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 3000
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
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat1;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _CenterX * 0.5 + 0.5;
					    u_xlat0.z = (-_CenterY) * 0.5 + 0.5;
					    u_xlat0.xy = (-u_xlat0.xz);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy + u_xlat4.xy;
					    u_xlat1 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = inversesqrt(u_xlat1);
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat1);
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(0.100000001, 0.100000001) + u_xlat4.xy;
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
					; Bound: 116
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %43 %101 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpMemberDecorate %11 0 Offset 11 
					                                                OpMemberDecorate %11 1 Offset 11 
					                                                OpMemberDecorate %11 2 Offset 11 
					                                                OpMemberDecorate %11 3 RelaxedPrecision 
					                                                OpMemberDecorate %11 3 Offset 11 
					                                                OpDecorate %11 Block 
					                                                OpDecorate %13 DescriptorSet 13 
					                                                OpDecorate %13 Binding 13 
					                                                OpDecorate vs_TEXCOORD0 Location 43 
					                                                OpDecorate %48 RelaxedPrecision 
					                                                OpDecorate %49 RelaxedPrecision 
					                                                OpDecorate %52 RelaxedPrecision 
					                                                OpDecorate %53 RelaxedPrecision 
					                                                OpDecorate %101 Location 101 
					                                                OpDecorate %104 RelaxedPrecision 
					                                                OpDecorate %104 DescriptorSet 104 
					                                                OpDecorate %104 Binding 104 
					                                                OpDecorate %105 RelaxedPrecision 
					                                                OpDecorate %108 RelaxedPrecision 
					                                                OpDecorate %108 DescriptorSet 108 
					                                                OpDecorate %108 Binding 108 
					                                                OpDecorate %109 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 3 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_3* %9 = OpVariable Private 
					                                        %10 = OpTypeVector %6 4 
					                                        %11 = OpTypeStruct %6 %6 %6 %10 
					                                        %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                        %14 = OpTypeInt 32 1 
					                                    i32 %15 = OpConstant 1 
					                                        %16 = OpTypePointer Uniform %6 
					                                    f32 %19 = OpConstant 3,674022E-40 
					                                        %22 = OpTypeInt 32 0 
					                                    u32 %23 = OpConstant 0 
					                                        %24 = OpTypePointer Private %6 
					                                    i32 %26 = OpConstant 2 
					                                    u32 %32 = OpConstant 2 
					                                        %34 = OpTypeVector %6 2 
					                                        %40 = OpTypePointer Private %34 
					                         Private f32_2* %41 = OpVariable Private 
					                                        %42 = OpTypePointer Input %34 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                    i32 %45 = OpConstant 3 
					                                        %46 = OpTypePointer Uniform %10 
					                           Private f32* %61 = OpVariable Private 
					                                    i32 %78 = OpConstant 0 
					                                    f32 %93 = OpConstant 3,674022E-40 
					                                  f32_2 %94 = OpConstantComposite %93 %93 
					                                       %100 = OpTypePointer Output %10 
					                         Output f32_4* %101 = OpVariable Output 
					                                       %102 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                       %103 = OpTypePointer UniformConstant %102 
					  UniformConstant read_only Texture2D* %104 = OpVariable UniformConstant 
					                                       %106 = OpTypeSampler 
					                                       %107 = OpTypePointer UniformConstant %106 
					              UniformConstant sampler* %108 = OpVariable UniformConstant 
					                                       %110 = OpTypeSampledImage %102 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                           Uniform f32* %17 = OpAccessChain %13 %15 
					                                    f32 %18 = OpLoad %17 
					                                    f32 %20 = OpFMul %18 %19 
					                                    f32 %21 = OpFAdd %20 %19 
					                           Private f32* %25 = OpAccessChain %9 %23 
					                                                OpStore %25 %21 
					                           Uniform f32* %27 = OpAccessChain %13 %26 
					                                    f32 %28 = OpLoad %27 
					                                    f32 %29 = OpFNegate %28 
					                                    f32 %30 = OpFMul %29 %19 
					                                    f32 %31 = OpFAdd %30 %19 
					                           Private f32* %33 = OpAccessChain %9 %32 
					                                                OpStore %33 %31 
					                                  f32_3 %35 = OpLoad %9 
					                                  f32_2 %36 = OpVectorShuffle %35 %35 0 2 
					                                  f32_2 %37 = OpFNegate %36 
					                                  f32_3 %38 = OpLoad %9 
					                                  f32_3 %39 = OpVectorShuffle %38 %37 3 4 2 
					                                                OpStore %9 %39 
					                                  f32_2 %44 = OpLoad vs_TEXCOORD0 
					                         Uniform f32_4* %47 = OpAccessChain %13 %45 
					                                  f32_4 %48 = OpLoad %47 
					                                  f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                  f32_2 %50 = OpFMul %44 %49 
					                         Uniform f32_4* %51 = OpAccessChain %13 %45 
					                                  f32_4 %52 = OpLoad %51 
					                                  f32_2 %53 = OpVectorShuffle %52 %52 2 3 
					                                  f32_2 %54 = OpFAdd %50 %53 
					                                                OpStore %41 %54 
					                                  f32_3 %55 = OpLoad %9 
					                                  f32_2 %56 = OpVectorShuffle %55 %55 0 1 
					                                  f32_2 %57 = OpLoad %41 
					                                  f32_2 %58 = OpFAdd %56 %57 
					                                  f32_3 %59 = OpLoad %9 
					                                  f32_3 %60 = OpVectorShuffle %59 %58 3 4 2 
					                                                OpStore %9 %60 
					                                  f32_3 %62 = OpLoad %9 
					                                  f32_2 %63 = OpVectorShuffle %62 %62 0 1 
					                                  f32_3 %64 = OpLoad %9 
					                                  f32_2 %65 = OpVectorShuffle %64 %64 0 1 
					                                    f32 %66 = OpDot %63 %65 
					                                                OpStore %61 %66 
					                                    f32 %67 = OpLoad %61 
					                                    f32 %68 = OpExtInst %1 32 %67 
					                                                OpStore %61 %68 
					                                  f32_3 %69 = OpLoad %9 
					                                  f32_2 %70 = OpVectorShuffle %69 %69 0 1 
					                                    f32 %71 = OpLoad %61 
					                                  f32_2 %72 = OpCompositeConstruct %71 %71 
					                                  f32_2 %73 = OpFMul %70 %72 
					                                  f32_3 %74 = OpLoad %9 
					                                  f32_3 %75 = OpVectorShuffle %74 %73 3 4 2 
					                                                OpStore %9 %75 
					                                  f32_3 %76 = OpLoad %9 
					                                  f32_2 %77 = OpVectorShuffle %76 %76 0 1 
					                           Uniform f32* %79 = OpAccessChain %13 %78 
					                                    f32 %80 = OpLoad %79 
					                           Uniform f32* %81 = OpAccessChain %13 %78 
					                                    f32 %82 = OpLoad %81 
					                                  f32_2 %83 = OpCompositeConstruct %80 %82 
					                                    f32 %84 = OpCompositeExtract %83 0 
					                                    f32 %85 = OpCompositeExtract %83 1 
					                                  f32_2 %86 = OpCompositeConstruct %84 %85 
					                                  f32_2 %87 = OpFMul %77 %86 
					                                  f32_3 %88 = OpLoad %9 
					                                  f32_3 %89 = OpVectorShuffle %88 %87 3 4 2 
					                                                OpStore %9 %89 
					                                  f32_3 %90 = OpLoad %9 
					                                  f32_2 %91 = OpVectorShuffle %90 %90 0 1 
					                                  f32_2 %92 = OpFNegate %91 
					                                  f32_2 %95 = OpFMul %92 %94 
					                                  f32_2 %96 = OpLoad %41 
					                                  f32_2 %97 = OpFAdd %95 %96 
					                                  f32_3 %98 = OpLoad %9 
					                                  f32_3 %99 = OpVectorShuffle %98 %97 3 4 2 
					                                                OpStore %9 %99 
					                   read_only Texture2D %105 = OpLoad %104 
					                               sampler %109 = OpLoad %108 
					            read_only Texture2DSampled %111 = OpSampledImage %105 %109 
					                                 f32_3 %112 = OpLoad %9 
					                                 f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                                 f32_4 %114 = OpImageSampleImplicitLod %111 %113 
					                                                OpStore %101 %114 
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
						float _CenterX;
						float _CenterY;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat1;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _CenterX * 0.5 + 0.5;
					    u_xlat0.z = (-_CenterY) * 0.5 + 0.5;
					    u_xlat0.xy = (-u_xlat0.xz);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy + u_xlat4.xy;
					    u_xlat1 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = inversesqrt(u_xlat1);
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat1);
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(0.100000001, 0.100000001) + u_xlat4.xy;
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