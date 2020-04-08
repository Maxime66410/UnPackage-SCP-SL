Shader "CameraFilterPack/Color_Switching" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 8)) = 8
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 5973
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb1 = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(0.0, 1.0, 2.0, 3.0));
					    if(u_xlatb1.x){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy);
					    } else {
					        u_xlat2.x = float(1.0);
					        u_xlat2.y = float(1.0);
					        u_xlat2.z = float(1.0);
					    }
					    if(u_xlatb1.y){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).xzyw;
					    }
					    if(u_xlatb1.z){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).yzxw;
					    }
					    if(u_xlatb1.w){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).yxzw;
					    }
					    u_xlatb6.xy = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(4.0, 5.0, 4.0, 5.0)).xy;
					    if(u_xlatb6.x){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).zyxw;
					    }
					    if(u_xlatb6.y){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).zxyw;
					    }
					    SV_Target0.xyz = u_xlat2.xyz;
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
					; Bound: 165
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %158 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 RelaxedPrecision 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %66 DescriptorSet 66 
					                                             OpDecorate %66 Binding 66 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %70 DescriptorSet 70 
					                                             OpDecorate %70 Binding 70 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %151 RelaxedPrecision 
					                                             OpDecorate %152 RelaxedPrecision 
					                                             OpDecorate %158 Location 158 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %6 %13 
					                                     %15 = OpTypePointer Uniform %14 
					       Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 1 
					                                     %19 = OpTypePointer Uniform %13 
					                                     %28 = OpTypeBool 
					                                     %29 = OpTypeVector %28 4 
					                                     %30 = OpTypePointer Private %29 
					                     Private bool_4* %31 = OpVariable Private 
					                                 i32 %32 = OpConstant 0 
					                                     %33 = OpTypePointer Uniform %6 
					                                 f32 %48 = OpConstant 3,674022E-40 
					                                 f32 %49 = OpConstant 3,674022E-40 
					                                 f32 %50 = OpConstant 3,674022E-40 
					                                 f32 %51 = OpConstant 3,674022E-40 
					                               f32_4 %52 = OpConstantComposite %48 %49 %50 %51 
					                                     %54 = OpTypeInt 32 0 
					                                 u32 %55 = OpConstant 0 
					                                     %56 = OpTypePointer Private %28 
					                                     %61 = OpTypeVector %6 3 
					                                     %62 = OpTypePointer Private %61 
					                      Private f32_3* %63 = OpVariable Private 
					                                     %64 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %65 = OpTypePointer UniformConstant %64 
					UniformConstant read_only Texture2D* %66 = OpVariable UniformConstant 
					                                     %68 = OpTypeSampler 
					                                     %69 = OpTypePointer UniformConstant %68 
					            UniformConstant sampler* %70 = OpVariable UniformConstant 
					                                     %72 = OpTypeSampledImage %64 
					                                     %78 = OpTypePointer Private %6 
					                                 u32 %80 = OpConstant 1 
					                                 u32 %82 = OpConstant 2 
					                                u32 %104 = OpConstant 3 
					                                    %115 = OpTypeVector %28 2 
					                                    %116 = OpTypePointer Private %115 
					                    Private bool_2* %117 = OpVariable Private 
					                                f32 %132 = OpConstant 3,674022E-40 
					                                f32 %133 = OpConstant 3,674022E-40 
					                              f32_4 %134 = OpConstantComposite %132 %133 %132 %133 
					                                    %157 = OpTypePointer Output %13 
					                      Output f32_4* %158 = OpVariable Output 
					                                    %162 = OpTypePointer Output %6 
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
					                        Uniform f32* %34 = OpAccessChain %16 %32 
					                                 f32 %35 = OpLoad %34 
					                        Uniform f32* %36 = OpAccessChain %16 %32 
					                                 f32 %37 = OpLoad %36 
					                        Uniform f32* %38 = OpAccessChain %16 %32 
					                                 f32 %39 = OpLoad %38 
					                        Uniform f32* %40 = OpAccessChain %16 %32 
					                                 f32 %41 = OpLoad %40 
					                               f32_4 %42 = OpCompositeConstruct %35 %37 %39 %41 
					                                 f32 %43 = OpCompositeExtract %42 0 
					                                 f32 %44 = OpCompositeExtract %42 1 
					                                 f32 %45 = OpCompositeExtract %42 2 
					                                 f32 %46 = OpCompositeExtract %42 3 
					                               f32_4 %47 = OpCompositeConstruct %43 %44 %45 %46 
					                              bool_4 %53 = OpFOrdEqual %47 %52 
					                                             OpStore %31 %53 
					                       Private bool* %57 = OpAccessChain %31 %55 
					                                bool %58 = OpLoad %57 
					                                             OpSelectionMerge %60 None 
					                                             OpBranchConditional %58 %59 %77 
					                                     %59 = OpLabel 
					                 read_only Texture2D %67 = OpLoad %66 
					                             sampler %71 = OpLoad %70 
					          read_only Texture2DSampled %73 = OpSampledImage %67 %71 
					                               f32_2 %74 = OpLoad %9 
					                               f32_4 %75 = OpImageSampleImplicitLod %73 %74 
					                               f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
					                                             OpStore %63 %76 
					                                             OpBranch %60 
					                                     %77 = OpLabel 
					                        Private f32* %79 = OpAccessChain %63 %55 
					                                             OpStore %79 %49 
					                        Private f32* %81 = OpAccessChain %63 %80 
					                                             OpStore %81 %49 
					                        Private f32* %83 = OpAccessChain %63 %82 
					                                             OpStore %83 %49 
					                                             OpBranch %60 
					                                     %60 = OpLabel 
					                       Private bool* %84 = OpAccessChain %31 %80 
					                                bool %85 = OpLoad %84 
					                                             OpSelectionMerge %87 None 
					                                             OpBranchConditional %85 %86 %87 
					                                     %86 = OpLabel 
					                 read_only Texture2D %88 = OpLoad %66 
					                             sampler %89 = OpLoad %70 
					          read_only Texture2DSampled %90 = OpSampledImage %88 %89 
					                               f32_2 %91 = OpLoad %9 
					                               f32_4 %92 = OpImageSampleImplicitLod %90 %91 
					                               f32_3 %93 = OpVectorShuffle %92 %92 0 2 1 
					                                             OpStore %63 %93 
					                                             OpBranch %87 
					                                     %87 = OpLabel 
					                       Private bool* %94 = OpAccessChain %31 %82 
					                                bool %95 = OpLoad %94 
					                                             OpSelectionMerge %97 None 
					                                             OpBranchConditional %95 %96 %97 
					                                     %96 = OpLabel 
					                 read_only Texture2D %98 = OpLoad %66 
					                             sampler %99 = OpLoad %70 
					         read_only Texture2DSampled %100 = OpSampledImage %98 %99 
					                              f32_2 %101 = OpLoad %9 
					                              f32_4 %102 = OpImageSampleImplicitLod %100 %101 
					                              f32_3 %103 = OpVectorShuffle %102 %102 1 2 0 
					                                             OpStore %63 %103 
					                                             OpBranch %97 
					                                     %97 = OpLabel 
					                      Private bool* %105 = OpAccessChain %31 %104 
					                               bool %106 = OpLoad %105 
					                                             OpSelectionMerge %108 None 
					                                             OpBranchConditional %106 %107 %108 
					                                    %107 = OpLabel 
					                read_only Texture2D %109 = OpLoad %66 
					                            sampler %110 = OpLoad %70 
					         read_only Texture2DSampled %111 = OpSampledImage %109 %110 
					                              f32_2 %112 = OpLoad %9 
					                              f32_4 %113 = OpImageSampleImplicitLod %111 %112 
					                              f32_3 %114 = OpVectorShuffle %113 %113 1 0 2 
					                                             OpStore %63 %114 
					                                             OpBranch %108 
					                                    %108 = OpLabel 
					                       Uniform f32* %118 = OpAccessChain %16 %32 
					                                f32 %119 = OpLoad %118 
					                       Uniform f32* %120 = OpAccessChain %16 %32 
					                                f32 %121 = OpLoad %120 
					                       Uniform f32* %122 = OpAccessChain %16 %32 
					                                f32 %123 = OpLoad %122 
					                       Uniform f32* %124 = OpAccessChain %16 %32 
					                                f32 %125 = OpLoad %124 
					                              f32_4 %126 = OpCompositeConstruct %119 %121 %123 %125 
					                                f32 %127 = OpCompositeExtract %126 0 
					                                f32 %128 = OpCompositeExtract %126 1 
					                                f32 %129 = OpCompositeExtract %126 2 
					                                f32 %130 = OpCompositeExtract %126 3 
					                              f32_4 %131 = OpCompositeConstruct %127 %128 %129 %130 
					                             bool_4 %135 = OpFOrdEqual %131 %134 
					                             bool_2 %136 = OpVectorShuffle %135 %135 0 1 
					                                             OpStore %117 %136 
					                      Private bool* %137 = OpAccessChain %117 %55 
					                               bool %138 = OpLoad %137 
					                                             OpSelectionMerge %140 None 
					                                             OpBranchConditional %138 %139 %140 
					                                    %139 = OpLabel 
					                read_only Texture2D %141 = OpLoad %66 
					                            sampler %142 = OpLoad %70 
					         read_only Texture2DSampled %143 = OpSampledImage %141 %142 
					                              f32_2 %144 = OpLoad %9 
					                              f32_4 %145 = OpImageSampleImplicitLod %143 %144 
					                              f32_3 %146 = OpVectorShuffle %145 %145 2 1 0 
					                                             OpStore %63 %146 
					                                             OpBranch %140 
					                                    %140 = OpLabel 
					                      Private bool* %147 = OpAccessChain %117 %80 
					                               bool %148 = OpLoad %147 
					                                             OpSelectionMerge %150 None 
					                                             OpBranchConditional %148 %149 %150 
					                                    %149 = OpLabel 
					                read_only Texture2D %151 = OpLoad %66 
					                            sampler %152 = OpLoad %70 
					         read_only Texture2DSampled %153 = OpSampledImage %151 %152 
					                              f32_2 %154 = OpLoad %9 
					                              f32_4 %155 = OpImageSampleImplicitLod %153 %154 
					                              f32_3 %156 = OpVectorShuffle %155 %155 2 0 1 
					                                             OpStore %63 %156 
					                                             OpBranch %150 
					                                    %150 = OpLabel 
					                              f32_3 %159 = OpLoad %63 
					                              f32_4 %160 = OpLoad %158 
					                              f32_4 %161 = OpVectorShuffle %160 %159 4 5 6 3 
					                                             OpStore %158 %161 
					                        Output f32* %163 = OpAccessChain %158 %104 
					                                             OpStore %163 %49 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb1 = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(0.0, 1.0, 2.0, 3.0));
					    if(u_xlatb1.x){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy);
					    } else {
					        u_xlat2.x = float(1.0);
					        u_xlat2.y = float(1.0);
					        u_xlat2.z = float(1.0);
					    //ENDIF
					    }
					    if(u_xlatb1.y){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).xzyw;
					    //ENDIF
					    }
					    if(u_xlatb1.z){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).yzxw;
					    //ENDIF
					    }
					    if(u_xlatb1.w){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).yxzw;
					    //ENDIF
					    }
					    u_xlatb6.xy = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(4.0, 5.0, 4.0, 5.0)).xy;
					    if(u_xlatb6.x){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).zyxw;
					    //ENDIF
					    }
					    if(u_xlatb6.y){
					        u_xlat2 = texture(_MainTex, u_xlat0.xy).zxyw;
					    //ENDIF
					    }
					    SV_Target0.xyz = u_xlat2.xyz;
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