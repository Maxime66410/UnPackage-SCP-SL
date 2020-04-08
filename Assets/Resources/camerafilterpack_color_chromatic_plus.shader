Shader "CameraFilterPack/Color_Chromatic_Plus" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(-0.02, 0.02)) = 0.02
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 56397
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.y = _Distortion;
					    u_xlat0.x = 0.0;
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.yxxy + u_xlat6.xyxy;
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat2.z = u_xlat10_1.z;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat0.xy = (-u_xlat6.xy) + vec2(0.5, 0.5);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value);
					    u_xlat2.yw = u_xlat10_1.yw;
					    u_xlat2 = (-u_xlat10_1) + u_xlat2;
					    u_xlat3 = float(1.0) / (-_Value2);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat10_1;
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
					; Bound: 151
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %28 %143 
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
					                                                OpDecorate vs_TEXCOORD0 Location 28 
					                                                OpDecorate %33 RelaxedPrecision 
					                                                OpDecorate %34 RelaxedPrecision 
					                                                OpDecorate %37 RelaxedPrecision 
					                                                OpDecorate %38 RelaxedPrecision 
					                                                OpDecorate %50 RelaxedPrecision 
					                                                OpDecorate %50 DescriptorSet 50 
					                                                OpDecorate %50 Binding 50 
					                                                OpDecorate %51 RelaxedPrecision 
					                                                OpDecorate %54 RelaxedPrecision 
					                                                OpDecorate %54 DescriptorSet 54 
					                                                OpDecorate %54 Binding 54 
					                                                OpDecorate %55 RelaxedPrecision 
					                                                OpDecorate %63 RelaxedPrecision 
					                                                OpDecorate %64 RelaxedPrecision 
					                                                OpDecorate %72 RelaxedPrecision 
					                                                OpDecorate %73 RelaxedPrecision 
					                                                OpDecorate %74 RelaxedPrecision 
					                                                OpDecorate %99 RelaxedPrecision 
					                                                OpDecorate %100 RelaxedPrecision 
					                                                OpDecorate %103 RelaxedPrecision 
					                                                OpDecorate %104 RelaxedPrecision 
					                                                OpDecorate %143 Location 143 
					                                                OpDecorate %148 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 2 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_2* %9 = OpVariable Private 
					                                        %10 = OpTypeVector %6 4 
					                                        %11 = OpTypeStruct %6 %6 %6 %10 
					                                        %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                        %14 = OpTypeInt 32 1 
					                                    i32 %15 = OpConstant 0 
					                                        %16 = OpTypePointer Uniform %6 
					                                        %19 = OpTypeInt 32 0 
					                                    u32 %20 = OpConstant 1 
					                                        %21 = OpTypePointer Private %6 
					                                    f32 %23 = OpConstant 3,674022E-40 
					                                    u32 %24 = OpConstant 0 
					                         Private f32_2* %26 = OpVariable Private 
					                                        %27 = OpTypePointer Input %7 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                    i32 %30 = OpConstant 3 
					                                        %31 = OpTypePointer Uniform %10 
					                                        %40 = OpTypePointer Private %10 
					                         Private f32_4* %41 = OpVariable Private 
					                         Private f32_4* %47 = OpVariable Private 
					                                        %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %49 = OpTypePointer UniformConstant %48 
					   UniformConstant read_only Texture2D* %50 = OpVariable UniformConstant 
					                                        %52 = OpTypeSampler 
					                                        %53 = OpTypePointer UniformConstant %52 
					               UniformConstant sampler* %54 = OpVariable UniformConstant 
					                                        %56 = OpTypeSampledImage %48 
					                                    u32 %69 = OpConstant 2 
					                         Private f32_4* %72 = OpVariable Private 
					                                    f32 %80 = OpConstant 3,674022E-40 
					                                  f32_2 %81 = OpConstantComposite %80 %80 
					                                    i32 %93 = OpConstant 1 
					                          Private f32* %107 = OpVariable Private 
					                                   f32 %108 = OpConstant 3,674022E-40 
					                                   i32 %109 = OpConstant 2 
					                                   f32 %125 = OpConstant 3,674022E-40 
					                                   f32 %127 = OpConstant 3,674022E-40 
					                                       %142 = OpTypePointer Output %10 
					                         Output f32_4* %143 = OpVariable Output 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                           Uniform f32* %17 = OpAccessChain %13 %15 
					                                    f32 %18 = OpLoad %17 
					                           Private f32* %22 = OpAccessChain %9 %20 
					                                                OpStore %22 %18 
					                           Private f32* %25 = OpAccessChain %9 %24 
					                                                OpStore %25 %23 
					                                  f32_2 %29 = OpLoad vs_TEXCOORD0 
					                         Uniform f32_4* %32 = OpAccessChain %13 %30 
					                                  f32_4 %33 = OpLoad %32 
					                                  f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                  f32_2 %35 = OpFMul %29 %34 
					                         Uniform f32_4* %36 = OpAccessChain %13 %30 
					                                  f32_4 %37 = OpLoad %36 
					                                  f32_2 %38 = OpVectorShuffle %37 %37 2 3 
					                                  f32_2 %39 = OpFAdd %35 %38 
					                                                OpStore %26 %39 
					                                  f32_2 %42 = OpLoad %9 
					                                  f32_4 %43 = OpVectorShuffle %42 %42 1 0 0 1 
					                                  f32_2 %44 = OpLoad %26 
					                                  f32_4 %45 = OpVectorShuffle %44 %44 0 1 0 1 
					                                  f32_4 %46 = OpFAdd %43 %45 
					                                                OpStore %41 %46 
					                    read_only Texture2D %51 = OpLoad %50 
					                                sampler %55 = OpLoad %54 
					             read_only Texture2DSampled %57 = OpSampledImage %51 %55 
					                                  f32_4 %58 = OpLoad %41 
					                                  f32_2 %59 = OpVectorShuffle %58 %58 0 1 
					                                  f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                    f32 %61 = OpCompositeExtract %60 0 
					                           Private f32* %62 = OpAccessChain %47 %24 
					                                                OpStore %62 %61 
					                    read_only Texture2D %63 = OpLoad %50 
					                                sampler %64 = OpLoad %54 
					             read_only Texture2DSampled %65 = OpSampledImage %63 %64 
					                                  f32_4 %66 = OpLoad %41 
					                                  f32_2 %67 = OpVectorShuffle %66 %66 2 3 
					                                  f32_4 %68 = OpImageSampleImplicitLod %65 %67 
					                                    f32 %70 = OpCompositeExtract %68 2 
					                           Private f32* %71 = OpAccessChain %47 %69 
					                                                OpStore %71 %70 
					                    read_only Texture2D %73 = OpLoad %50 
					                                sampler %74 = OpLoad %54 
					             read_only Texture2DSampled %75 = OpSampledImage %73 %74 
					                                  f32_2 %76 = OpLoad %26 
					                                  f32_4 %77 = OpImageSampleImplicitLod %75 %76 
					                                                OpStore %72 %77 
					                                  f32_2 %78 = OpLoad %26 
					                                  f32_2 %79 = OpFNegate %78 
					                                  f32_2 %82 = OpFAdd %79 %81 
					                                                OpStore %9 %82 
					                                  f32_2 %83 = OpLoad %9 
					                                  f32_2 %84 = OpLoad %9 
					                                    f32 %85 = OpDot %83 %84 
					                           Private f32* %86 = OpAccessChain %9 %24 
					                                                OpStore %86 %85 
					                           Private f32* %87 = OpAccessChain %9 %24 
					                                    f32 %88 = OpLoad %87 
					                                    f32 %89 = OpExtInst %1 31 %88 
					                           Private f32* %90 = OpAccessChain %9 %24 
					                                                OpStore %90 %89 
					                           Private f32* %91 = OpAccessChain %9 %24 
					                                    f32 %92 = OpLoad %91 
					                           Uniform f32* %94 = OpAccessChain %13 %93 
					                                    f32 %95 = OpLoad %94 
					                                    f32 %96 = OpFNegate %95 
					                                    f32 %97 = OpFAdd %92 %96 
					                           Private f32* %98 = OpAccessChain %9 %24 
					                                                OpStore %98 %97 
					                                  f32_4 %99 = OpLoad %72 
					                                 f32_2 %100 = OpVectorShuffle %99 %99 1 3 
					                                 f32_4 %101 = OpLoad %47 
					                                 f32_4 %102 = OpVectorShuffle %101 %100 0 4 2 5 
					                                                OpStore %47 %102 
					                                 f32_4 %103 = OpLoad %72 
					                                 f32_4 %104 = OpFNegate %103 
					                                 f32_4 %105 = OpLoad %47 
					                                 f32_4 %106 = OpFAdd %104 %105 
					                                                OpStore %47 %106 
					                          Uniform f32* %110 = OpAccessChain %13 %109 
					                                   f32 %111 = OpLoad %110 
					                                   f32 %112 = OpFNegate %111 
					                                   f32 %113 = OpFDiv %108 %112 
					                                                OpStore %107 %113 
					                                   f32 %114 = OpLoad %107 
					                          Private f32* %115 = OpAccessChain %9 %24 
					                                   f32 %116 = OpLoad %115 
					                                   f32 %117 = OpFMul %114 %116 
					                          Private f32* %118 = OpAccessChain %9 %24 
					                                                OpStore %118 %117 
					                          Private f32* %119 = OpAccessChain %9 %24 
					                                   f32 %120 = OpLoad %119 
					                                   f32 %121 = OpExtInst %1 43 %120 %23 %108 
					                          Private f32* %122 = OpAccessChain %9 %24 
					                                                OpStore %122 %121 
					                          Private f32* %123 = OpAccessChain %9 %24 
					                                   f32 %124 = OpLoad %123 
					                                   f32 %126 = OpFMul %124 %125 
					                                   f32 %128 = OpFAdd %126 %127 
					                                                OpStore %107 %128 
					                          Private f32* %129 = OpAccessChain %9 %24 
					                                   f32 %130 = OpLoad %129 
					                          Private f32* %131 = OpAccessChain %9 %24 
					                                   f32 %132 = OpLoad %131 
					                                   f32 %133 = OpFMul %130 %132 
					                          Private f32* %134 = OpAccessChain %9 %24 
					                                                OpStore %134 %133 
					                                   f32 %135 = OpLoad %107 
					                                   f32 %136 = OpFNegate %135 
					                          Private f32* %137 = OpAccessChain %9 %24 
					                                   f32 %138 = OpLoad %137 
					                                   f32 %139 = OpFMul %136 %138 
					                                   f32 %140 = OpFAdd %139 %108 
					                          Private f32* %141 = OpAccessChain %9 %24 
					                                                OpStore %141 %140 
					                                 f32_2 %144 = OpLoad %9 
					                                 f32_4 %145 = OpVectorShuffle %144 %144 0 0 0 0 
					                                 f32_4 %146 = OpLoad %47 
					                                 f32_4 %147 = OpFMul %145 %146 
					                                 f32_4 %148 = OpLoad %72 
					                                 f32_4 %149 = OpFAdd %147 %148 
					                                                OpStore %143 %149 
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
						float _Value;
						float _Value2;
						vec4 unused_0_4;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.y = _Distortion;
					    u_xlat0.x = 0.0;
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.yxxy + u_xlat6.xyxy;
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat2.z = u_xlat10_1.z;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat0.xy = (-u_xlat6.xy) + vec2(0.5, 0.5);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value);
					    u_xlat2.yw = u_xlat10_1.yw;
					    u_xlat2 = (-u_xlat10_1) + u_xlat2;
					    u_xlat3 = float(1.0) / (-_Value2);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat10_1;
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