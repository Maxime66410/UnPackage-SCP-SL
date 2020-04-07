Shader "Hidden/Post FX/Builtin Debug Views" {
	Properties {
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 24293
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[5];
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
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 _CameraDepthTexture_ST;
					uniform 	float _DepthScale;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					float u_xlat1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _DepthScale;
					    u_xlat1 = u_xlat0.x * 0.305306017 + 0.682171106;
					    u_xlat1 = u_xlat0.x * u_xlat1 + 0.0125228781;
					    SV_Target0.xyz = vec3(u_xlat1) * u_xlat0.xxx;
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
					; Bound: 96
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %83 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpMemberDecorate %14 2 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %30 DescriptorSet 30 
					                                             OpDecorate %30 Binding 30 
					                                             OpDecorate %34 DescriptorSet 34 
					                                             OpDecorate %34 Binding 34 
					                                             OpDecorate %83 Location 83 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %13 %13 %6 
					                                     %15 = OpTypePointer Uniform %14 
					Uniform struct {f32_4; f32_4; f32;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 1 
					                                     %19 = OpTypePointer Uniform %13 
					                                     %28 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %29 = OpTypePointer UniformConstant %28 
					UniformConstant read_only Texture2D* %30 = OpVariable UniformConstant 
					                                     %32 = OpTypeSampler 
					                                     %33 = OpTypePointer UniformConstant %32 
					            UniformConstant sampler* %34 = OpVariable UniformConstant 
					                                     %36 = OpTypeSampledImage %28 
					                                     %40 = OpTypeInt 32 0 
					                                 u32 %41 = OpConstant 0 
					                                     %43 = OpTypePointer Private %6 
					                                 i32 %45 = OpConstant 0 
					                                     %46 = OpTypePointer Uniform %6 
					                                 u32 %52 = OpConstant 1 
					                                 f32 %57 = OpConstant 3,674022E-40 
					                                 i32 %64 = OpConstant 2 
					                        Private f32* %69 = OpVariable Private 
					                                 f32 %72 = OpConstant 3,674022E-40 
					                                 f32 %74 = OpConstant 3,674022E-40 
					                                 f32 %80 = OpConstant 3,674022E-40 
					                                     %82 = OpTypePointer Output %13 
					                       Output f32_4* %83 = OpVariable Output 
					                                     %85 = OpTypeVector %6 3 
					                                 u32 %92 = OpConstant 3 
					                                     %93 = OpTypePointer Output %6 
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
					                 read_only Texture2D %31 = OpLoad %30 
					                             sampler %35 = OpLoad %34 
					          read_only Texture2DSampled %37 = OpSampledImage %31 %35 
					                               f32_2 %38 = OpLoad %9 
					                               f32_4 %39 = OpImageSampleImplicitLod %37 %38 
					                                 f32 %42 = OpCompositeExtract %39 0 
					                        Private f32* %44 = OpAccessChain %9 %41 
					                                             OpStore %44 %42 
					                        Uniform f32* %47 = OpAccessChain %16 %45 %41 
					                                 f32 %48 = OpLoad %47 
					                        Private f32* %49 = OpAccessChain %9 %41 
					                                 f32 %50 = OpLoad %49 
					                                 f32 %51 = OpFMul %48 %50 
					                        Uniform f32* %53 = OpAccessChain %16 %45 %52 
					                                 f32 %54 = OpLoad %53 
					                                 f32 %55 = OpFAdd %51 %54 
					                        Private f32* %56 = OpAccessChain %9 %41 
					                                             OpStore %56 %55 
					                        Private f32* %58 = OpAccessChain %9 %41 
					                                 f32 %59 = OpLoad %58 
					                                 f32 %60 = OpFDiv %57 %59 
					                        Private f32* %61 = OpAccessChain %9 %41 
					                                             OpStore %61 %60 
					                        Private f32* %62 = OpAccessChain %9 %41 
					                                 f32 %63 = OpLoad %62 
					                        Uniform f32* %65 = OpAccessChain %16 %64 
					                                 f32 %66 = OpLoad %65 
					                                 f32 %67 = OpFMul %63 %66 
					                        Private f32* %68 = OpAccessChain %9 %41 
					                                             OpStore %68 %67 
					                        Private f32* %70 = OpAccessChain %9 %41 
					                                 f32 %71 = OpLoad %70 
					                                 f32 %73 = OpFMul %71 %72 
					                                 f32 %75 = OpFAdd %73 %74 
					                                             OpStore %69 %75 
					                        Private f32* %76 = OpAccessChain %9 %41 
					                                 f32 %77 = OpLoad %76 
					                                 f32 %78 = OpLoad %69 
					                                 f32 %79 = OpFMul %77 %78 
					                                 f32 %81 = OpFAdd %79 %80 
					                                             OpStore %69 %81 
					                                 f32 %84 = OpLoad %69 
					                               f32_3 %86 = OpCompositeConstruct %84 %84 %84 
					                               f32_2 %87 = OpLoad %9 
					                               f32_3 %88 = OpVectorShuffle %87 %87 0 0 0 
					                               f32_3 %89 = OpFMul %86 %88 
					                               f32_4 %90 = OpLoad %83 
					                               f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
					                                             OpStore %83 %91 
					                         Output f32* %94 = OpAccessChain %83 %92 
					                                             OpStore %94 %57 
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
						vec4 unused_0_0[4];
						vec4 _CameraDepthTexture_ST;
						vec4 unused_0_2[2];
						float _DepthScale;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					float u_xlat1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _DepthScale;
					    u_xlat1 = u_xlat0.x * 0.305306017 + 0.682171106;
					    u_xlat1 = u_xlat0.x * u_xlat1 + 0.0125228781;
					    SV_Target0.xyz = vec3(u_xlat1) * u_xlat0.xxx;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 116861
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[5];
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
					uniform 	vec4 _CameraDepthNormalsTexture_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat16_4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthNormalsTexture_ST.xy + _CameraDepthNormalsTexture_ST.zw;
					    u_xlat10_0 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_4 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_4 = 2.0 / u_xlat16_4;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_4);
					    u_xlat1.z = u_xlat16_4 + -1.0;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
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
					; Bound: 87
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %77 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
					                                             OpMemberDecorate %15 0 Offset 15 
					                                             OpDecorate %15 Block 
					                                             OpDecorate %17 DescriptorSet 17 
					                                             OpDecorate %17 Binding 17 
					                                             OpDecorate %33 DescriptorSet 33 
					                                             OpDecorate %33 Binding 33 
					                                             OpDecorate %37 DescriptorSet 37 
					                                             OpDecorate %37 Binding 37 
					                                             OpDecorate %77 Location 77 
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
					                                     %15 = OpTypeStruct %14 
					                                     %16 = OpTypePointer Uniform %15 
					            Uniform struct {f32_4;}* %17 = OpVariable Uniform 
					                                     %18 = OpTypeInt 32 1 
					                                 i32 %19 = OpConstant 0 
					                                     %20 = OpTypePointer Uniform %14 
					                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %32 = OpTypePointer UniformConstant %31 
					UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
					                                     %35 = OpTypeSampler 
					                                     %36 = OpTypePointer UniformConstant %35 
					            UniformConstant sampler* %37 = OpVariable UniformConstant 
					                                     %39 = OpTypeSampledImage %31 
					                                 f32 %46 = OpConstant 3,674022E-40 
					                                 f32 %47 = OpConstant 3,674022E-40 
					                               f32_3 %48 = OpConstantComposite %46 %46 %47 
					                                 f32 %50 = OpConstant 3,674022E-40 
					                                 f32 %51 = OpConstant 3,674022E-40 
					                               f32_3 %52 = OpConstantComposite %50 %50 %51 
					                                     %54 = OpTypePointer Private %6 
					                        Private f32* %55 = OpVariable Private 
					                                 f32 %59 = OpConstant 3,674022E-40 
					                      Private f32_3* %62 = OpVariable Private 
					                                 f32 %71 = OpConstant 3,674022E-40 
					                                     %73 = OpTypeInt 32 0 
					                                 u32 %74 = OpConstant 2 
					                                     %76 = OpTypePointer Output %14 
					                       Output f32_4* %77 = OpVariable Output 
					                               f32_3 %79 = OpConstantComposite %51 %51 %71 
					                                 u32 %83 = OpConstant 3 
					                                     %84 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
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
					                 read_only Texture2D %34 = OpLoad %33 
					                             sampler %38 = OpLoad %37 
					          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
					                               f32_3 %41 = OpLoad %9 
					                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                               f32_4 %43 = OpImageSampleImplicitLod %40 %42 
					                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
					                                             OpStore %9 %44 
					                               f32_3 %45 = OpLoad %9 
					                               f32_3 %49 = OpFMul %45 %48 
					                               f32_3 %53 = OpFAdd %49 %52 
					                                             OpStore %9 %53 
					                               f32_3 %56 = OpLoad %9 
					                               f32_3 %57 = OpLoad %9 
					                                 f32 %58 = OpDot %56 %57 
					                                             OpStore %55 %58 
					                                 f32 %60 = OpLoad %55 
					                                 f32 %61 = OpFDiv %59 %60 
					                                             OpStore %55 %61 
					                               f32_3 %63 = OpLoad %9 
					                               f32_2 %64 = OpVectorShuffle %63 %63 0 1 
					                                 f32 %65 = OpLoad %55 
					                               f32_2 %66 = OpCompositeConstruct %65 %65 
					                               f32_2 %67 = OpFMul %64 %66 
					                               f32_3 %68 = OpLoad %62 
					                               f32_3 %69 = OpVectorShuffle %68 %67 3 4 2 
					                                             OpStore %62 %69 
					                                 f32 %70 = OpLoad %55 
					                                 f32 %72 = OpFAdd %70 %71 
					                        Private f32* %75 = OpAccessChain %62 %74 
					                                             OpStore %75 %72 
					                               f32_3 %78 = OpLoad %62 
					                               f32_3 %80 = OpFMul %78 %79 
					                               f32_4 %81 = OpLoad %77 
					                               f32_4 %82 = OpVectorShuffle %81 %80 4 5 6 3 
					                                             OpStore %77 %82 
					                         Output f32* %85 = OpAccessChain %77 %83 
					                                             OpStore %85 %51 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "SOURCE_GBUFFER" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[6];
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
					Keywords { "SOURCE_GBUFFER" }
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _CameraDepthNormalsTexture_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraGBufferTexture2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthNormalsTexture_ST.xy + _CameraDepthNormalsTexture_ST.zw;
					    u_xlat10_0 = texture(_CameraGBufferTexture2, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = u_xlat16_0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat16_0.xxx + u_xlat1.xyz;
					    SV_Target0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat16_0.zzz + u_xlat0.xyw;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "SOURCE_GBUFFER" }
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
					; Bound: 95
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %77 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
					                                             OpDecorate %16 ArrayStride 16 
					                                             OpMemberDecorate %17 0 Offset 17 
					                                             OpMemberDecorate %17 1 Offset 17 
					                                             OpDecorate %17 Block 
					                                             OpDecorate %19 DescriptorSet 19 
					                                             OpDecorate %19 Binding 19 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %38 DescriptorSet 38 
					                                             OpDecorate %38 Binding 38 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %42 DescriptorSet 42 
					                                             OpDecorate %42 Binding 42 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %77 Location 77 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %14 = OpTypeInt 32 0 
					                                 u32 %15 = OpConstant 4 
					                                     %16 = OpTypeArray %7 %15 
					                                     %17 = OpTypeStruct %16 %7 
					                                     %18 = OpTypePointer Uniform %17 
					  Uniform struct {f32_4[4]; f32_4;}* %19 = OpVariable Uniform 
					                                     %20 = OpTypeInt 32 1 
					                                 i32 %21 = OpConstant 1 
					                                     %22 = OpTypePointer Uniform %7 
					                                     %33 = OpTypeVector %6 3 
					                                     %34 = OpTypePointer Private %33 
					                      Private f32_3* %35 = OpVariable Private 
					                                     %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %37 = OpTypePointer UniformConstant %36 
					UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
					                                     %40 = OpTypeSampler 
					                                     %41 = OpTypePointer UniformConstant %40 
					            UniformConstant sampler* %42 = OpVariable UniformConstant 
					                                     %44 = OpTypeSampledImage %36 
					                      Private f32_3* %50 = OpVariable Private 
					                                 f32 %52 = OpConstant 3,674022E-40 
					                               f32_3 %53 = OpConstantComposite %52 %52 %52 
					                                 f32 %55 = OpConstant 3,674022E-40 
					                               f32_3 %56 = OpConstantComposite %55 %55 %55 
					                      Private f32_3* %58 = OpVariable Private 
					                                 i32 %61 = OpConstant 0 
					                                     %76 = OpTypePointer Output %7 
					                       Output f32_4* %77 = OpVariable Output 
					                                 i32 %78 = OpConstant 2 
					                                 f32 %90 = OpConstant 3,674022E-40 
					                                 u32 %91 = OpConstant 3 
					                                     %92 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_2 %13 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %23 = OpAccessChain %19 %21 
					                               f32_4 %24 = OpLoad %23 
					                               f32_2 %25 = OpVectorShuffle %24 %24 0 1 
					                               f32_2 %26 = OpFMul %13 %25 
					                      Uniform f32_4* %27 = OpAccessChain %19 %21 
					                               f32_4 %28 = OpLoad %27 
					                               f32_2 %29 = OpVectorShuffle %28 %28 2 3 
					                               f32_2 %30 = OpFAdd %26 %29 
					                               f32_4 %31 = OpLoad %9 
					                               f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
					                                             OpStore %9 %32 
					                 read_only Texture2D %39 = OpLoad %38 
					                             sampler %43 = OpLoad %42 
					          read_only Texture2DSampled %45 = OpSampledImage %39 %43 
					                               f32_4 %46 = OpLoad %9 
					                               f32_2 %47 = OpVectorShuffle %46 %46 0 1 
					                               f32_4 %48 = OpImageSampleImplicitLod %45 %47 
					                               f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
					                                             OpStore %35 %49 
					                               f32_3 %51 = OpLoad %35 
					                               f32_3 %54 = OpFMul %51 %53 
					                               f32_3 %57 = OpFAdd %54 %56 
					                                             OpStore %50 %57 
					                               f32_3 %59 = OpLoad %50 
					                               f32_3 %60 = OpVectorShuffle %59 %59 1 1 1 
					                      Uniform f32_4* %62 = OpAccessChain %19 %61 %21 
					                               f32_4 %63 = OpLoad %62 
					                               f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
					                               f32_3 %65 = OpFMul %60 %64 
					                                             OpStore %58 %65 
					                      Uniform f32_4* %66 = OpAccessChain %19 %61 %61 
					                               f32_4 %67 = OpLoad %66 
					                               f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                               f32_3 %69 = OpLoad %50 
					                               f32_3 %70 = OpVectorShuffle %69 %69 0 0 0 
					                               f32_3 %71 = OpFMul %68 %70 
					                               f32_3 %72 = OpLoad %58 
					                               f32_3 %73 = OpFAdd %71 %72 
					                               f32_4 %74 = OpLoad %9 
					                               f32_4 %75 = OpVectorShuffle %74 %73 4 5 2 6 
					                                             OpStore %9 %75 
					                      Uniform f32_4* %79 = OpAccessChain %19 %61 %78 
					                               f32_4 %80 = OpLoad %79 
					                               f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
					                               f32_3 %82 = OpLoad %50 
					                               f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
					                               f32_3 %84 = OpFMul %81 %83 
					                               f32_4 %85 = OpLoad %9 
					                               f32_3 %86 = OpVectorShuffle %85 %85 0 1 3 
					                               f32_3 %87 = OpFAdd %84 %86 
					                               f32_4 %88 = OpLoad %77 
					                               f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
					                                             OpStore %77 %89 
					                         Output f32* %93 = OpAccessChain %77 %91 
					                                             OpStore %93 %90 
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
						vec4 unused_0_0[5];
						vec4 _CameraDepthNormalsTexture_ST;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat16_4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthNormalsTexture_ST.xy + _CameraDepthNormalsTexture_ST.zw;
					    u_xlat10_0 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_4 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_4 = 2.0 / u_xlat16_4;
					    u_xlat1.xy = u_xlat16_0.xy * vec2(u_xlat16_4);
					    u_xlat1.z = u_xlat16_4 + -1.0;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(1.0, 1.0, -1.0);
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
				SubProgram "d3d11 " {
					Keywords { "SOURCE_GBUFFER" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[5];
						vec4 _CameraDepthNormalsTexture_ST;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_1_0[14];
						mat4x4 unity_WorldToCamera;
						vec4 unused_1_2[4];
					};
					uniform  sampler2D _CameraGBufferTexture2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthNormalsTexture_ST.xy + _CameraDepthNormalsTexture_ST.zw;
					    u_xlat10_0 = texture(_CameraGBufferTexture2, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = u_xlat16_0.yyy * unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = unity_WorldToCamera[0].xyz * u_xlat16_0.xxx + u_xlat1.xyz;
					    SV_Target0.xyz = unity_WorldToCamera[2].xyz * u_xlat16_0.zzz + u_xlat0.xyw;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "SOURCE_GBUFFER" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "SOURCE_GBUFFER" }
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 159781
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[5];
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
					uniform 	float _Opacity;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz * vec3(vec3(_Opacity, _Opacity, _Opacity));
					    SV_Target0.w = u_xlat10_0.w;
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
					; Bound: 58
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %26 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate %9 RelaxedPrecision 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate %13 RelaxedPrecision 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %17 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 22 
					                                             OpDecorate %26 Location 26 
					                                             OpDecorate %28 RelaxedPrecision 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpMemberDecorate %30 0 Offset 30 
					                                             OpDecorate %30 Block 
					                                             OpDecorate %32 DescriptorSet 32 
					                                             OpDecorate %32 Binding 32 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                     %14 = OpTypeSampler 
					                                     %15 = OpTypePointer UniformConstant %14 
					            UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                     %18 = OpTypeSampledImage %10 
					                                     %20 = OpTypeVector %6 2 
					                                     %21 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %25 = OpTypePointer Output %7 
					                       Output f32_4* %26 = OpVariable Output 
					                                     %27 = OpTypeVector %6 3 
					                                     %30 = OpTypeStruct %6 
					                                     %31 = OpTypePointer Uniform %30 
					              Uniform struct {f32;}* %32 = OpVariable Uniform 
					                                     %33 = OpTypeInt 32 1 
					                                 i32 %34 = OpConstant 0 
					                                     %35 = OpTypePointer Uniform %6 
					                                     %50 = OpTypeInt 32 0 
					                                 u32 %51 = OpConstant 3 
					                                     %52 = OpTypePointer Private %6 
					                                     %55 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD0 
					                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                             OpStore %9 %24 
					                               f32_4 %28 = OpLoad %9 
					                               f32_3 %29 = OpVectorShuffle %28 %28 0 1 2 
					                        Uniform f32* %36 = OpAccessChain %32 %34 
					                                 f32 %37 = OpLoad %36 
					                        Uniform f32* %38 = OpAccessChain %32 %34 
					                                 f32 %39 = OpLoad %38 
					                        Uniform f32* %40 = OpAccessChain %32 %34 
					                                 f32 %41 = OpLoad %40 
					                               f32_3 %42 = OpCompositeConstruct %37 %39 %41 
					                                 f32 %43 = OpCompositeExtract %42 0 
					                                 f32 %44 = OpCompositeExtract %42 1 
					                                 f32 %45 = OpCompositeExtract %42 2 
					                               f32_3 %46 = OpCompositeConstruct %43 %44 %45 
					                               f32_3 %47 = OpFMul %29 %46 
					                               f32_4 %48 = OpLoad %26 
					                               f32_4 %49 = OpVectorShuffle %48 %47 4 5 6 3 
					                                             OpStore %26 %49 
					                        Private f32* %53 = OpAccessChain %9 %51 
					                                 f32 %54 = OpLoad %53 
					                         Output f32* %56 = OpAccessChain %26 %51 
					                                             OpStore %56 %54 
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
						vec4 unused_0_0[7];
						float _Opacity;
						vec4 unused_0_2;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz * vec3(vec3(_Opacity, _Opacity, _Opacity));
					    SV_Target0.w = u_xlat10_0.w;
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
			GpuProgramID 232283
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[5];
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
					uniform 	float _Opacity;
					uniform 	float _Amplitude;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _CameraMotionVectorsTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					bool u_xlatb3;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat10_0 = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.xy);
					    u_xlat0.xy = u_xlat10_0.xy * vec2(vec2(_Amplitude, _Amplitude));
					    u_xlat4 = max(abs(u_xlat0.y), abs(u_xlat0.x));
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
					    u_xlat4 = u_xlat4 * u_xlat6;
					    u_xlat6 = u_xlat4 * u_xlat4;
					    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
					    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
					    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
					    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
					    u_xlat1.x = u_xlat6 * u_xlat4;
					    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
					    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
					    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
					    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
					    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
					    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
					    u_xlat4 = u_xlat6 + u_xlat4;
					    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
					    u_xlatb6 = u_xlat6<(-u_xlat6);
					    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Opacity;
					    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
					    u_xlatb2 = u_xlatb2 && u_xlatb6;
					    u_xlat2.x = (u_xlatb2) ? (-u_xlat4) : u_xlat4;
					    u_xlat2.x = u_xlat2.x * 0.318309873 + 1.0;
					    u_xlat2.xyz = u_xlat2.xxx * vec3(3.0, 3.0, 3.0) + vec3(-3.0, -2.0, -4.0);
					    u_xlat2.xyz = abs(u_xlat2.xyz) * vec3(1.0, -1.0, -1.0) + vec3(-1.0, 2.0, 2.0);
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2.xyz = u_xlat2.xyz + (-u_xlat16_1.xyz);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
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
					; Bound: 322
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %22 %260 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate %16 DescriptorSet 16 
					                                              OpDecorate %16 Binding 16 
					                                              OpDecorate vs_TEXCOORD0 Location 22 
					                                              OpMemberDecorate %30 0 Offset 30 
					                                              OpMemberDecorate %30 1 Offset 30 
					                                              OpDecorate %30 Block 
					                                              OpDecorate %32 DescriptorSet 32 
					                                              OpDecorate %32 Binding 32 
					                                              OpDecorate %246 RelaxedPrecision 
					                                              OpDecorate %247 RelaxedPrecision 
					                                              OpDecorate %247 DescriptorSet 247 
					                                              OpDecorate %247 Binding 247 
					                                              OpDecorate %248 RelaxedPrecision 
					                                              OpDecorate %249 RelaxedPrecision 
					                                              OpDecorate %249 DescriptorSet 249 
					                                              OpDecorate %249 Binding 249 
					                                              OpDecorate %250 RelaxedPrecision 
					                                              OpDecorate %254 RelaxedPrecision 
					                                              OpDecorate %255 RelaxedPrecision 
					                                              OpDecorate %256 RelaxedPrecision 
					                                              OpDecorate %258 RelaxedPrecision 
					                                              OpDecorate %260 Location 260 
					                                              OpDecorate %263 RelaxedPrecision 
					                                              OpDecorate %266 RelaxedPrecision 
					                                              OpDecorate %267 RelaxedPrecision 
					                                              OpDecorate %268 RelaxedPrecision 
					                                              OpDecorate %269 RelaxedPrecision 
					                                              OpDecorate %272 RelaxedPrecision 
					                                              OpDecorate %273 RelaxedPrecision 
					                                              OpDecorate %274 RelaxedPrecision 
					                                              OpDecorate %275 RelaxedPrecision 
					                                              OpDecorate %278 RelaxedPrecision 
					                                              OpDecorate %281 RelaxedPrecision 
					                                              OpDecorate %282 RelaxedPrecision 
					                                              OpDecorate %283 RelaxedPrecision 
					                                              OpDecorate %286 RelaxedPrecision 
					                                              OpDecorate %287 RelaxedPrecision 
					                                              OpDecorate %296 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %11 = OpTypePointer UniformConstant %10 
					 UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                      %14 = OpTypeSampler 
					                                      %15 = OpTypePointer UniformConstant %14 
					             UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                      %18 = OpTypeSampledImage %10 
					                                      %20 = OpTypeVector %6 2 
					                                      %21 = OpTypePointer Input %20 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %30 = OpTypeStruct %6 %6 
					                                      %31 = OpTypePointer Uniform %30 
					          Uniform struct {f32; f32;}* %32 = OpVariable Uniform 
					                                      %33 = OpTypeInt 32 1 
					                                  i32 %34 = OpConstant 1 
					                                      %35 = OpTypePointer Uniform %6 
					                                      %52 = OpTypeVector %6 3 
					                                      %53 = OpTypePointer Private %52 
					                       Private f32_3* %54 = OpVariable Private 
					                                      %55 = OpTypeInt 32 0 
					                                  u32 %56 = OpConstant 0 
					                                      %57 = OpTypePointer Private %6 
					                                  u32 %61 = OpConstant 1 
					                                  f32 %67 = OpConstant 3,674022E-40 
					                         Private f32* %72 = OpVariable Private 
					                         Private f32* %90 = OpVariable Private 
					                                  f32 %92 = OpConstant 3,674022E-40 
					                                  f32 %94 = OpConstant 3,674022E-40 
					                                  f32 %99 = OpConstant 3,674022E-40 
					                                 f32 %104 = OpConstant 3,674022E-40 
					                                 f32 %109 = OpConstant 3,674022E-40 
					                                 f32 %116 = OpConstant 3,674022E-40 
					                                 f32 %118 = OpConstant 3,674022E-40 
					                                     %120 = OpTypeBool 
					                                     %121 = OpTypePointer Private %120 
					                       Private bool* %122 = OpVariable Private 
					                                 f32 %132 = OpConstant 3,674022E-40 
					                       Private bool* %141 = OpVariable Private 
					                                 u32 %144 = OpConstant 2 
					                        Private f32* %148 = OpVariable Private 
					                                 f32 %150 = OpConstant 3,674022E-40 
					                       Private bool* %162 = OpVariable Private 
					                        Private f32* %175 = OpVariable Private 
					                                 i32 %186 = OpConstant 0 
					                       Private bool* %190 = OpVariable Private 
					                                     %201 = OpTypePointer Function %6 
					                                 f32 %213 = OpConstant 3,674022E-40 
					                                 f32 %219 = OpConstant 3,674022E-40 
					                               f32_3 %220 = OpConstantComposite %219 %219 %219 
					                                 f32 %222 = OpConstant 3,674022E-40 
					                                 f32 %223 = OpConstant 3,674022E-40 
					                               f32_3 %224 = OpConstantComposite %222 %116 %223 
					                                 f32 %231 = OpConstant 3,674022E-40 
					                               f32_3 %232 = OpConstantComposite %67 %231 %231 
					                                 f32 %234 = OpConstant 3,674022E-40 
					                               f32_3 %235 = OpConstantComposite %231 %234 %234 
					                      Private f32_4* %246 = OpVariable Private 
					UniformConstant read_only Texture2D* %247 = OpVariable UniformConstant 
					            UniformConstant sampler* %249 = OpVariable UniformConstant 
					                      Private f32_3* %254 = OpVariable Private 
					                               f32_3 %257 = OpConstantComposite %132 %132 %132 
					                                     %259 = OpTypePointer Output %7 
					                       Output f32_4* %260 = OpVariable Output 
					                                 u32 %261 = OpConstant 3 
					                                     %264 = OpTypePointer Output %6 
					                      Private f32_3* %266 = OpVariable Private 
					                                 f32 %270 = OpConstant 3,674022E-40 
					                               f32_3 %271 = OpConstantComposite %270 %270 %270 
					                                 f32 %276 = OpConstant 3,674022E-40 
					                               f32_3 %277 = OpConstantComposite %276 %276 %276 
					                                 f32 %279 = OpConstant 3,674022E-40 
					                               f32_3 %280 = OpConstantComposite %279 %279 %279 
					                                 f32 %302 = OpConstant 3,674022E-40 
					                               f32_3 %303 = OpConstantComposite %302 %302 %302 
					                                 f32 %305 = OpConstant 3,674022E-40 
					                               f32_3 %306 = OpConstantComposite %305 %305 %305 
					                                 f32 %312 = OpConstant 3,674022E-40 
					                               f32_3 %313 = OpConstantComposite %312 %312 %312 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Function f32* %202 = OpVariable Function 
					                  read_only Texture2D %13 = OpLoad %12 
					                              sampler %17 = OpLoad %16 
					           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                f32_2 %25 = OpVectorShuffle %24 %24 0 1 
					                                f32_4 %26 = OpLoad %9 
					                                f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
					                                              OpStore %9 %27 
					                                f32_4 %28 = OpLoad %9 
					                                f32_2 %29 = OpVectorShuffle %28 %28 0 1 
					                         Uniform f32* %36 = OpAccessChain %32 %34 
					                                  f32 %37 = OpLoad %36 
					                         Uniform f32* %38 = OpAccessChain %32 %34 
					                                  f32 %39 = OpLoad %38 
					                                f32_2 %40 = OpCompositeConstruct %37 %39 
					                                  f32 %41 = OpCompositeExtract %40 0 
					                                  f32 %42 = OpCompositeExtract %40 1 
					                                f32_2 %43 = OpCompositeConstruct %41 %42 
					                                f32_2 %44 = OpFMul %29 %43 
					                                f32_4 %45 = OpLoad %9 
					                                f32_4 %46 = OpVectorShuffle %45 %44 0 4 5 3 
					                                              OpStore %9 %46 
					                                f32_4 %47 = OpLoad %9 
					                                f32_2 %48 = OpVectorShuffle %47 %47 2 2 
					                                f32_2 %49 = OpFNegate %48 
					                                f32_4 %50 = OpLoad %9 
					                                f32_4 %51 = OpVectorShuffle %50 %49 4 1 2 5 
					                                              OpStore %9 %51 
					                         Private f32* %58 = OpAccessChain %9 %56 
					                                  f32 %59 = OpLoad %58 
					                                  f32 %60 = OpExtInst %1 4 %59 
					                         Private f32* %62 = OpAccessChain %9 %61 
					                                  f32 %63 = OpLoad %62 
					                                  f32 %64 = OpExtInst %1 4 %63 
					                                  f32 %65 = OpExtInst %1 40 %60 %64 
					                         Private f32* %66 = OpAccessChain %54 %56 
					                                              OpStore %66 %65 
					                         Private f32* %68 = OpAccessChain %54 %56 
					                                  f32 %69 = OpLoad %68 
					                                  f32 %70 = OpFDiv %67 %69 
					                         Private f32* %71 = OpAccessChain %54 %56 
					                                              OpStore %71 %70 
					                         Private f32* %73 = OpAccessChain %9 %56 
					                                  f32 %74 = OpLoad %73 
					                                  f32 %75 = OpExtInst %1 4 %74 
					                         Private f32* %76 = OpAccessChain %9 %61 
					                                  f32 %77 = OpLoad %76 
					                                  f32 %78 = OpExtInst %1 4 %77 
					                                  f32 %79 = OpExtInst %1 37 %75 %78 
					                                              OpStore %72 %79 
					                         Private f32* %80 = OpAccessChain %54 %56 
					                                  f32 %81 = OpLoad %80 
					                                  f32 %82 = OpLoad %72 
					                                  f32 %83 = OpFMul %81 %82 
					                         Private f32* %84 = OpAccessChain %54 %56 
					                                              OpStore %84 %83 
					                         Private f32* %85 = OpAccessChain %54 %56 
					                                  f32 %86 = OpLoad %85 
					                         Private f32* %87 = OpAccessChain %54 %56 
					                                  f32 %88 = OpLoad %87 
					                                  f32 %89 = OpFMul %86 %88 
					                                              OpStore %72 %89 
					                                  f32 %91 = OpLoad %72 
					                                  f32 %93 = OpFMul %91 %92 
					                                  f32 %95 = OpFAdd %93 %94 
					                                              OpStore %90 %95 
					                                  f32 %96 = OpLoad %72 
					                                  f32 %97 = OpLoad %90 
					                                  f32 %98 = OpFMul %96 %97 
					                                 f32 %100 = OpFAdd %98 %99 
					                                              OpStore %90 %100 
					                                 f32 %101 = OpLoad %72 
					                                 f32 %102 = OpLoad %90 
					                                 f32 %103 = OpFMul %101 %102 
					                                 f32 %105 = OpFAdd %103 %104 
					                                              OpStore %90 %105 
					                                 f32 %106 = OpLoad %72 
					                                 f32 %107 = OpLoad %90 
					                                 f32 %108 = OpFMul %106 %107 
					                                 f32 %110 = OpFAdd %108 %109 
					                                              OpStore %72 %110 
					                                 f32 %111 = OpLoad %72 
					                        Private f32* %112 = OpAccessChain %54 %56 
					                                 f32 %113 = OpLoad %112 
					                                 f32 %114 = OpFMul %111 %113 
					                                              OpStore %90 %114 
					                                 f32 %115 = OpLoad %90 
					                                 f32 %117 = OpFMul %115 %116 
					                                 f32 %119 = OpFAdd %117 %118 
					                                              OpStore %90 %119 
					                        Private f32* %123 = OpAccessChain %9 %56 
					                                 f32 %124 = OpLoad %123 
					                                 f32 %125 = OpExtInst %1 4 %124 
					                        Private f32* %126 = OpAccessChain %9 %61 
					                                 f32 %127 = OpLoad %126 
					                                 f32 %128 = OpExtInst %1 4 %127 
					                                bool %129 = OpFOrdLessThan %125 %128 
					                                              OpStore %122 %129 
					                                bool %130 = OpLoad %122 
					                                 f32 %131 = OpLoad %90 
					                                 f32 %133 = OpSelect %130 %131 %132 
					                                              OpStore %90 %133 
					                        Private f32* %134 = OpAccessChain %54 %56 
					                                 f32 %135 = OpLoad %134 
					                                 f32 %136 = OpLoad %72 
					                                 f32 %137 = OpFMul %135 %136 
					                                 f32 %138 = OpLoad %90 
					                                 f32 %139 = OpFAdd %137 %138 
					                        Private f32* %140 = OpAccessChain %54 %56 
					                                              OpStore %140 %139 
					                        Private f32* %142 = OpAccessChain %9 %56 
					                                 f32 %143 = OpLoad %142 
					                        Private f32* %145 = OpAccessChain %9 %144 
					                                 f32 %146 = OpLoad %145 
					                                bool %147 = OpFOrdLessThan %143 %146 
					                                              OpStore %141 %147 
					                                bool %149 = OpLoad %141 
					                                 f32 %151 = OpSelect %149 %150 %132 
					                                              OpStore %148 %151 
					                                 f32 %152 = OpLoad %148 
					                        Private f32* %153 = OpAccessChain %54 %56 
					                                 f32 %154 = OpLoad %153 
					                                 f32 %155 = OpFAdd %152 %154 
					                                              OpStore %148 %155 
					                        Private f32* %156 = OpAccessChain %9 %56 
					                                 f32 %157 = OpLoad %156 
					                        Private f32* %158 = OpAccessChain %9 %61 
					                                 f32 %159 = OpLoad %158 
					                                 f32 %160 = OpExtInst %1 37 %157 %159 
					                        Private f32* %161 = OpAccessChain %54 %56 
					                                              OpStore %161 %160 
					                        Private f32* %163 = OpAccessChain %54 %56 
					                                 f32 %164 = OpLoad %163 
					                        Private f32* %165 = OpAccessChain %54 %56 
					                                 f32 %166 = OpLoad %165 
					                                 f32 %167 = OpFNegate %166 
					                                bool %168 = OpFOrdLessThan %164 %167 
					                                              OpStore %162 %168 
					                        Private f32* %169 = OpAccessChain %9 %56 
					                                 f32 %170 = OpLoad %169 
					                        Private f32* %171 = OpAccessChain %9 %61 
					                                 f32 %172 = OpLoad %171 
					                                 f32 %173 = OpExtInst %1 40 %170 %172 
					                        Private f32* %174 = OpAccessChain %9 %56 
					                                              OpStore %174 %173 
					                               f32_4 %176 = OpLoad %9 
					                               f32_2 %177 = OpVectorShuffle %176 %176 1 3 
					                               f32_4 %178 = OpLoad %9 
					                               f32_2 %179 = OpVectorShuffle %178 %178 1 3 
					                                 f32 %180 = OpDot %177 %179 
					                                              OpStore %175 %180 
					                                 f32 %181 = OpLoad %175 
					                                 f32 %182 = OpExtInst %1 31 %181 
					                                              OpStore %175 %182 
					                                 f32 %183 = OpLoad %175 
					                                 f32 %184 = OpExtInst %1 43 %183 %132 %67 
					                                              OpStore %175 %184 
					                                 f32 %185 = OpLoad %175 
					                        Uniform f32* %187 = OpAccessChain %32 %186 
					                                 f32 %188 = OpLoad %187 
					                                 f32 %189 = OpFMul %185 %188 
					                                              OpStore %175 %189 
					                        Private f32* %191 = OpAccessChain %9 %56 
					                                 f32 %192 = OpLoad %191 
					                        Private f32* %193 = OpAccessChain %9 %56 
					                                 f32 %194 = OpLoad %193 
					                                 f32 %195 = OpFNegate %194 
					                                bool %196 = OpFOrdGreaterThanEqual %192 %195 
					                                              OpStore %190 %196 
					                                bool %197 = OpLoad %190 
					                                bool %198 = OpLoad %162 
					                                bool %199 = OpLogicalAnd %197 %198 
					                                              OpStore %190 %199 
					                                bool %200 = OpLoad %190 
					                                              OpSelectionMerge %204 None 
					                                              OpBranchConditional %200 %203 %207 
					                                     %203 = OpLabel 
					                                 f32 %205 = OpLoad %148 
					                                 f32 %206 = OpFNegate %205 
					                                              OpStore %202 %206 
					                                              OpBranch %204 
					                                     %207 = OpLabel 
					                                 f32 %208 = OpLoad %148 
					                                              OpStore %202 %208 
					                                              OpBranch %204 
					                                     %204 = OpLabel 
					                                 f32 %209 = OpLoad %202 
					                        Private f32* %210 = OpAccessChain %9 %56 
					                                              OpStore %210 %209 
					                        Private f32* %211 = OpAccessChain %9 %56 
					                                 f32 %212 = OpLoad %211 
					                                 f32 %214 = OpFMul %212 %213 
					                                 f32 %215 = OpFAdd %214 %67 
					                        Private f32* %216 = OpAccessChain %9 %56 
					                                              OpStore %216 %215 
					                               f32_4 %217 = OpLoad %9 
					                               f32_3 %218 = OpVectorShuffle %217 %217 0 0 0 
					                               f32_3 %221 = OpFMul %218 %220 
					                               f32_3 %225 = OpFAdd %221 %224 
					                               f32_4 %226 = OpLoad %9 
					                               f32_4 %227 = OpVectorShuffle %226 %225 4 1 5 6 
					                                              OpStore %9 %227 
					                               f32_4 %228 = OpLoad %9 
					                               f32_3 %229 = OpVectorShuffle %228 %228 0 2 3 
					                               f32_3 %230 = OpExtInst %1 4 %229 
					                               f32_3 %233 = OpFMul %230 %232 
					                               f32_3 %236 = OpFAdd %233 %235 
					                               f32_4 %237 = OpLoad %9 
					                               f32_4 %238 = OpVectorShuffle %237 %236 4 1 5 6 
					                                              OpStore %9 %238 
					                               f32_4 %239 = OpLoad %9 
					                               f32_3 %240 = OpVectorShuffle %239 %239 0 2 3 
					                               f32_3 %241 = OpCompositeConstruct %132 %132 %132 
					                               f32_3 %242 = OpCompositeConstruct %67 %67 %67 
					                               f32_3 %243 = OpExtInst %1 43 %240 %241 %242 
					                               f32_4 %244 = OpLoad %9 
					                               f32_4 %245 = OpVectorShuffle %244 %243 4 1 5 6 
					                                              OpStore %9 %245 
					                 read_only Texture2D %248 = OpLoad %247 
					                             sampler %250 = OpLoad %249 
					          read_only Texture2DSampled %251 = OpSampledImage %248 %250 
					                               f32_2 %252 = OpLoad vs_TEXCOORD0 
					                               f32_4 %253 = OpImageSampleImplicitLod %251 %252 
					                                              OpStore %246 %253 
					                               f32_4 %255 = OpLoad %246 
					                               f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
					                               f32_3 %258 = OpExtInst %1 40 %256 %257 
					                                              OpStore %254 %258 
					                        Private f32* %262 = OpAccessChain %246 %261 
					                                 f32 %263 = OpLoad %262 
					                         Output f32* %265 = OpAccessChain %260 %261 
					                                              OpStore %265 %263 
					                               f32_3 %267 = OpLoad %254 
					                               f32_3 %268 = OpExtInst %1 30 %267 
					                                              OpStore %266 %268 
					                               f32_3 %269 = OpLoad %266 
					                               f32_3 %272 = OpFMul %269 %271 
					                                              OpStore %266 %272 
					                               f32_3 %273 = OpLoad %266 
					                               f32_3 %274 = OpExtInst %1 29 %273 
					                                              OpStore %266 %274 
					                               f32_3 %275 = OpLoad %266 
					                               f32_3 %278 = OpFMul %275 %277 
					                               f32_3 %281 = OpFAdd %278 %280 
					                                              OpStore %266 %281 
					                               f32_3 %282 = OpLoad %266 
					                               f32_3 %283 = OpExtInst %1 40 %282 %257 
					                                              OpStore %266 %283 
					                               f32_4 %284 = OpLoad %9 
					                               f32_3 %285 = OpVectorShuffle %284 %284 0 2 3 
					                               f32_3 %286 = OpLoad %266 
					                               f32_3 %287 = OpFNegate %286 
					                               f32_3 %288 = OpFAdd %285 %287 
					                               f32_4 %289 = OpLoad %9 
					                               f32_4 %290 = OpVectorShuffle %289 %288 4 1 5 6 
					                                              OpStore %9 %290 
					                                 f32 %291 = OpLoad %175 
					                               f32_3 %292 = OpCompositeConstruct %291 %291 %291 
					                               f32_4 %293 = OpLoad %9 
					                               f32_3 %294 = OpVectorShuffle %293 %293 0 2 3 
					                               f32_3 %295 = OpFMul %292 %294 
					                               f32_3 %296 = OpLoad %266 
					                               f32_3 %297 = OpFAdd %295 %296 
					                               f32_4 %298 = OpLoad %9 
					                               f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
					                                              OpStore %9 %299 
					                               f32_4 %300 = OpLoad %9 
					                               f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
					                               f32_3 %304 = OpFMul %301 %303 
					                               f32_3 %307 = OpFAdd %304 %306 
					                                              OpStore %54 %307 
					                               f32_4 %308 = OpLoad %9 
					                               f32_3 %309 = OpVectorShuffle %308 %308 0 1 2 
					                               f32_3 %310 = OpLoad %54 
					                               f32_3 %311 = OpFMul %309 %310 
					                               f32_3 %314 = OpFAdd %311 %313 
					                                              OpStore %54 %314 
					                               f32_4 %315 = OpLoad %9 
					                               f32_3 %316 = OpVectorShuffle %315 %315 0 1 2 
					                               f32_3 %317 = OpLoad %54 
					                               f32_3 %318 = OpFMul %316 %317 
					                               f32_4 %319 = OpLoad %260 
					                               f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
					                                              OpStore %260 %320 
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
						vec4 unused_0_2[5];
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
					uniform 	float _Opacity;
					uniform 	float _Amplitude;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _CameraMotionVectorsTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					bool u_xlatb3;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat10_0 = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.xy);
					    u_xlat0.xy = u_xlat10_0.xy * vec2(vec2(_Amplitude, _Amplitude));
					    u_xlat4 = max(abs(u_xlat0.y), abs(u_xlat0.x));
					    u_xlat4 = float(1.0) / u_xlat4;
					    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
					    u_xlat4 = u_xlat4 * u_xlat6;
					    u_xlat6 = u_xlat4 * u_xlat4;
					    u_xlat1 = u_xlat6 * 0.0208350997 + -0.0851330012;
					    u_xlat1 = u_xlat6 * u_xlat1 + 0.180141002;
					    u_xlat1 = u_xlat6 * u_xlat1 + -0.330299497;
					    u_xlat6 = u_xlat6 * u_xlat1 + 0.999866009;
					    u_xlat1 = u_xlat6 * u_xlat4;
					    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
					    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
					    u_xlat1 = u_xlatb3 ? u_xlat1 : float(0.0);
					    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1;
					    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
					    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
					    u_xlat4 = u_xlat6 + u_xlat4;
					    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
					    u_xlatb6 = u_xlat6<(-u_xlat6);
					    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * _Opacity;
					    u_xlatb2 = u_xlat1>=(-u_xlat1);
					    u_xlatb2 = u_xlatb2 && u_xlatb6;
					    u_xlat2.x = (u_xlatb2) ? (-u_xlat4) : u_xlat4;
					    u_xlat2.x = u_xlat2.x * 0.318309873 + 1.0;
					    u_xlat2.xyz = u_xlat2.xxx * vec3(3.0, 3.0, 3.0) + vec3(-3.0, -2.0, -4.0);
					    u_xlat2.xyz = abs(u_xlat2.xyz) * vec3(1.0, -1.0, -1.0) + vec3(-1.0, 2.0, 2.0);
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat2.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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
					; Bound: 265
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %22 %248 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate %16 DescriptorSet 16 
					                                              OpDecorate %16 Binding 16 
					                                              OpDecorate vs_TEXCOORD0 Location 22 
					                                              OpMemberDecorate %30 0 Offset 30 
					                                              OpMemberDecorate %30 1 Offset 30 
					                                              OpDecorate %30 Block 
					                                              OpDecorate %32 DescriptorSet 32 
					                                              OpDecorate %32 Binding 32 
					                                              OpDecorate %231 RelaxedPrecision 
					                                              OpDecorate %232 RelaxedPrecision 
					                                              OpDecorate %232 DescriptorSet 232 
					                                              OpDecorate %232 Binding 232 
					                                              OpDecorate %233 RelaxedPrecision 
					                                              OpDecorate %234 RelaxedPrecision 
					                                              OpDecorate %234 DescriptorSet 234 
					                                              OpDecorate %234 Binding 234 
					                                              OpDecorate %235 RelaxedPrecision 
					                                              OpDecorate %241 RelaxedPrecision 
					                                              OpDecorate %242 RelaxedPrecision 
					                                              OpDecorate %243 RelaxedPrecision 
					                                              OpDecorate %248 Location 248 
					                                              OpDecorate %254 RelaxedPrecision 
					                                              OpDecorate %255 RelaxedPrecision 
					                                              OpDecorate %261 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %11 = OpTypePointer UniformConstant %10 
					 UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                      %14 = OpTypeSampler 
					                                      %15 = OpTypePointer UniformConstant %14 
					             UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                      %18 = OpTypeSampledImage %10 
					                                      %20 = OpTypeVector %6 2 
					                                      %21 = OpTypePointer Input %20 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %30 = OpTypeStruct %6 %6 
					                                      %31 = OpTypePointer Uniform %30 
					          Uniform struct {f32; f32;}* %32 = OpVariable Uniform 
					                                      %33 = OpTypeInt 32 1 
					                                  i32 %34 = OpConstant 1 
					                                      %35 = OpTypePointer Uniform %6 
					                                      %52 = OpTypePointer Private %6 
					                         Private f32* %53 = OpVariable Private 
					                                      %54 = OpTypeInt 32 0 
					                                  u32 %55 = OpConstant 0 
					                                  u32 %59 = OpConstant 1 
					                                  f32 %64 = OpConstant 3,674022E-40 
					                         Private f32* %67 = OpVariable Private 
					                         Private f32* %81 = OpVariable Private 
					                                  f32 %83 = OpConstant 3,674022E-40 
					                                  f32 %85 = OpConstant 3,674022E-40 
					                                  f32 %90 = OpConstant 3,674022E-40 
					                                  f32 %95 = OpConstant 3,674022E-40 
					                                 f32 %100 = OpConstant 3,674022E-40 
					                                 f32 %106 = OpConstant 3,674022E-40 
					                                 f32 %108 = OpConstant 3,674022E-40 
					                                     %110 = OpTypeBool 
					                                     %111 = OpTypePointer Private %110 
					                       Private bool* %112 = OpVariable Private 
					                                 f32 %122 = OpConstant 3,674022E-40 
					                       Private bool* %129 = OpVariable Private 
					                                 u32 %132 = OpConstant 2 
					                        Private f32* %136 = OpVariable Private 
					                                 f32 %138 = OpConstant 3,674022E-40 
					                       Private bool* %148 = OpVariable Private 
					                        Private f32* %159 = OpVariable Private 
					                                 i32 %170 = OpConstant 0 
					                       Private bool* %174 = OpVariable Private 
					                                     %185 = OpTypePointer Function %6 
					                                 f32 %197 = OpConstant 3,674022E-40 
					                                     %201 = OpTypeVector %6 3 
					                                 f32 %204 = OpConstant 3,674022E-40 
					                               f32_3 %205 = OpConstantComposite %204 %204 %204 
					                                 f32 %207 = OpConstant 3,674022E-40 
					                                 f32 %208 = OpConstant 3,674022E-40 
					                               f32_3 %209 = OpConstantComposite %207 %106 %208 
					                                 f32 %216 = OpConstant 3,674022E-40 
					                               f32_3 %217 = OpConstantComposite %64 %216 %216 
					                                 f32 %219 = OpConstant 3,674022E-40 
					                               f32_3 %220 = OpConstantComposite %216 %219 %219 
					                      Private f32_4* %231 = OpVariable Private 
					UniformConstant read_only Texture2D* %232 = OpVariable UniformConstant 
					            UniformConstant sampler* %234 = OpVariable UniformConstant 
					                                     %247 = OpTypePointer Output %7 
					                       Output f32_4* %248 = OpVariable Output 
					                                 u32 %259 = OpConstant 3 
					                                     %262 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Function f32* %186 = OpVariable Function 
					                  read_only Texture2D %13 = OpLoad %12 
					                              sampler %17 = OpLoad %16 
					           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                f32_2 %25 = OpVectorShuffle %24 %24 0 1 
					                                f32_4 %26 = OpLoad %9 
					                                f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
					                                              OpStore %9 %27 
					                                f32_4 %28 = OpLoad %9 
					                                f32_2 %29 = OpVectorShuffle %28 %28 0 1 
					                         Uniform f32* %36 = OpAccessChain %32 %34 
					                                  f32 %37 = OpLoad %36 
					                         Uniform f32* %38 = OpAccessChain %32 %34 
					                                  f32 %39 = OpLoad %38 
					                                f32_2 %40 = OpCompositeConstruct %37 %39 
					                                  f32 %41 = OpCompositeExtract %40 0 
					                                  f32 %42 = OpCompositeExtract %40 1 
					                                f32_2 %43 = OpCompositeConstruct %41 %42 
					                                f32_2 %44 = OpFMul %29 %43 
					                                f32_4 %45 = OpLoad %9 
					                                f32_4 %46 = OpVectorShuffle %45 %44 0 4 5 3 
					                                              OpStore %9 %46 
					                                f32_4 %47 = OpLoad %9 
					                                f32_2 %48 = OpVectorShuffle %47 %47 2 2 
					                                f32_2 %49 = OpFNegate %48 
					                                f32_4 %50 = OpLoad %9 
					                                f32_4 %51 = OpVectorShuffle %50 %49 4 1 2 5 
					                                              OpStore %9 %51 
					                         Private f32* %56 = OpAccessChain %9 %55 
					                                  f32 %57 = OpLoad %56 
					                                  f32 %58 = OpExtInst %1 4 %57 
					                         Private f32* %60 = OpAccessChain %9 %59 
					                                  f32 %61 = OpLoad %60 
					                                  f32 %62 = OpExtInst %1 4 %61 
					                                  f32 %63 = OpExtInst %1 40 %58 %62 
					                                              OpStore %53 %63 
					                                  f32 %65 = OpLoad %53 
					                                  f32 %66 = OpFDiv %64 %65 
					                                              OpStore %53 %66 
					                         Private f32* %68 = OpAccessChain %9 %55 
					                                  f32 %69 = OpLoad %68 
					                                  f32 %70 = OpExtInst %1 4 %69 
					                         Private f32* %71 = OpAccessChain %9 %59 
					                                  f32 %72 = OpLoad %71 
					                                  f32 %73 = OpExtInst %1 4 %72 
					                                  f32 %74 = OpExtInst %1 37 %70 %73 
					                                              OpStore %67 %74 
					                                  f32 %75 = OpLoad %53 
					                                  f32 %76 = OpLoad %67 
					                                  f32 %77 = OpFMul %75 %76 
					                                              OpStore %53 %77 
					                                  f32 %78 = OpLoad %53 
					                                  f32 %79 = OpLoad %53 
					                                  f32 %80 = OpFMul %78 %79 
					                                              OpStore %67 %80 
					                                  f32 %82 = OpLoad %67 
					                                  f32 %84 = OpFMul %82 %83 
					                                  f32 %86 = OpFAdd %84 %85 
					                                              OpStore %81 %86 
					                                  f32 %87 = OpLoad %67 
					                                  f32 %88 = OpLoad %81 
					                                  f32 %89 = OpFMul %87 %88 
					                                  f32 %91 = OpFAdd %89 %90 
					                                              OpStore %81 %91 
					                                  f32 %92 = OpLoad %67 
					                                  f32 %93 = OpLoad %81 
					                                  f32 %94 = OpFMul %92 %93 
					                                  f32 %96 = OpFAdd %94 %95 
					                                              OpStore %81 %96 
					                                  f32 %97 = OpLoad %67 
					                                  f32 %98 = OpLoad %81 
					                                  f32 %99 = OpFMul %97 %98 
					                                 f32 %101 = OpFAdd %99 %100 
					                                              OpStore %67 %101 
					                                 f32 %102 = OpLoad %67 
					                                 f32 %103 = OpLoad %53 
					                                 f32 %104 = OpFMul %102 %103 
					                                              OpStore %81 %104 
					                                 f32 %105 = OpLoad %81 
					                                 f32 %107 = OpFMul %105 %106 
					                                 f32 %109 = OpFAdd %107 %108 
					                                              OpStore %81 %109 
					                        Private f32* %113 = OpAccessChain %9 %55 
					                                 f32 %114 = OpLoad %113 
					                                 f32 %115 = OpExtInst %1 4 %114 
					                        Private f32* %116 = OpAccessChain %9 %59 
					                                 f32 %117 = OpLoad %116 
					                                 f32 %118 = OpExtInst %1 4 %117 
					                                bool %119 = OpFOrdLessThan %115 %118 
					                                              OpStore %112 %119 
					                                bool %120 = OpLoad %112 
					                                 f32 %121 = OpLoad %81 
					                                 f32 %123 = OpSelect %120 %121 %122 
					                                              OpStore %81 %123 
					                                 f32 %124 = OpLoad %53 
					                                 f32 %125 = OpLoad %67 
					                                 f32 %126 = OpFMul %124 %125 
					                                 f32 %127 = OpLoad %81 
					                                 f32 %128 = OpFAdd %126 %127 
					                                              OpStore %53 %128 
					                        Private f32* %130 = OpAccessChain %9 %55 
					                                 f32 %131 = OpLoad %130 
					                        Private f32* %133 = OpAccessChain %9 %132 
					                                 f32 %134 = OpLoad %133 
					                                bool %135 = OpFOrdLessThan %131 %134 
					                                              OpStore %129 %135 
					                                bool %137 = OpLoad %129 
					                                 f32 %139 = OpSelect %137 %138 %122 
					                                              OpStore %136 %139 
					                                 f32 %140 = OpLoad %136 
					                                 f32 %141 = OpLoad %53 
					                                 f32 %142 = OpFAdd %140 %141 
					                                              OpStore %136 %142 
					                        Private f32* %143 = OpAccessChain %9 %55 
					                                 f32 %144 = OpLoad %143 
					                        Private f32* %145 = OpAccessChain %9 %59 
					                                 f32 %146 = OpLoad %145 
					                                 f32 %147 = OpExtInst %1 37 %144 %146 
					                                              OpStore %53 %147 
					                                 f32 %149 = OpLoad %53 
					                                 f32 %150 = OpLoad %53 
					                                 f32 %151 = OpFNegate %150 
					                                bool %152 = OpFOrdLessThan %149 %151 
					                                              OpStore %148 %152 
					                        Private f32* %153 = OpAccessChain %9 %55 
					                                 f32 %154 = OpLoad %153 
					                        Private f32* %155 = OpAccessChain %9 %59 
					                                 f32 %156 = OpLoad %155 
					                                 f32 %157 = OpExtInst %1 40 %154 %156 
					                        Private f32* %158 = OpAccessChain %9 %55 
					                                              OpStore %158 %157 
					                               f32_4 %160 = OpLoad %9 
					                               f32_2 %161 = OpVectorShuffle %160 %160 1 3 
					                               f32_4 %162 = OpLoad %9 
					                               f32_2 %163 = OpVectorShuffle %162 %162 1 3 
					                                 f32 %164 = OpDot %161 %163 
					                                              OpStore %159 %164 
					                                 f32 %165 = OpLoad %159 
					                                 f32 %166 = OpExtInst %1 31 %165 
					                                              OpStore %159 %166 
					                                 f32 %167 = OpLoad %159 
					                                 f32 %168 = OpExtInst %1 43 %167 %122 %64 
					                                              OpStore %159 %168 
					                                 f32 %169 = OpLoad %159 
					                        Uniform f32* %171 = OpAccessChain %32 %170 
					                                 f32 %172 = OpLoad %171 
					                                 f32 %173 = OpFMul %169 %172 
					                                              OpStore %159 %173 
					                        Private f32* %175 = OpAccessChain %9 %55 
					                                 f32 %176 = OpLoad %175 
					                        Private f32* %177 = OpAccessChain %9 %55 
					                                 f32 %178 = OpLoad %177 
					                                 f32 %179 = OpFNegate %178 
					                                bool %180 = OpFOrdGreaterThanEqual %176 %179 
					                                              OpStore %174 %180 
					                                bool %181 = OpLoad %174 
					                                bool %182 = OpLoad %148 
					                                bool %183 = OpLogicalAnd %181 %182 
					                                              OpStore %174 %183 
					                                bool %184 = OpLoad %174 
					                                              OpSelectionMerge %188 None 
					                                              OpBranchConditional %184 %187 %191 
					                                     %187 = OpLabel 
					                                 f32 %189 = OpLoad %136 
					                                 f32 %190 = OpFNegate %189 
					                                              OpStore %186 %190 
					                                              OpBranch %188 
					                                     %191 = OpLabel 
					                                 f32 %192 = OpLoad %136 
					                                              OpStore %186 %192 
					                                              OpBranch %188 
					                                     %188 = OpLabel 
					                                 f32 %193 = OpLoad %186 
					                        Private f32* %194 = OpAccessChain %9 %55 
					                                              OpStore %194 %193 
					                        Private f32* %195 = OpAccessChain %9 %55 
					                                 f32 %196 = OpLoad %195 
					                                 f32 %198 = OpFMul %196 %197 
					                                 f32 %199 = OpFAdd %198 %64 
					                        Private f32* %200 = OpAccessChain %9 %55 
					                                              OpStore %200 %199 
					                               f32_4 %202 = OpLoad %9 
					                               f32_3 %203 = OpVectorShuffle %202 %202 0 0 0 
					                               f32_3 %206 = OpFMul %203 %205 
					                               f32_3 %210 = OpFAdd %206 %209 
					                               f32_4 %211 = OpLoad %9 
					                               f32_4 %212 = OpVectorShuffle %211 %210 4 1 5 6 
					                                              OpStore %9 %212 
					                               f32_4 %213 = OpLoad %9 
					                               f32_3 %214 = OpVectorShuffle %213 %213 0 2 3 
					                               f32_3 %215 = OpExtInst %1 4 %214 
					                               f32_3 %218 = OpFMul %215 %217 
					                               f32_3 %221 = OpFAdd %218 %220 
					                               f32_4 %222 = OpLoad %9 
					                               f32_4 %223 = OpVectorShuffle %222 %221 4 1 5 6 
					                                              OpStore %9 %223 
					                               f32_4 %224 = OpLoad %9 
					                               f32_3 %225 = OpVectorShuffle %224 %224 0 2 3 
					                               f32_3 %226 = OpCompositeConstruct %122 %122 %122 
					                               f32_3 %227 = OpCompositeConstruct %64 %64 %64 
					                               f32_3 %228 = OpExtInst %1 43 %225 %226 %227 
					                               f32_4 %229 = OpLoad %9 
					                               f32_4 %230 = OpVectorShuffle %229 %228 4 1 5 6 
					                                              OpStore %9 %230 
					                 read_only Texture2D %233 = OpLoad %232 
					                             sampler %235 = OpLoad %234 
					          read_only Texture2DSampled %236 = OpSampledImage %233 %235 
					                               f32_2 %237 = OpLoad vs_TEXCOORD0 
					                               f32_4 %238 = OpImageSampleImplicitLod %236 %237 
					                                              OpStore %231 %238 
					                               f32_4 %239 = OpLoad %9 
					                               f32_3 %240 = OpVectorShuffle %239 %239 0 2 3 
					                               f32_4 %241 = OpLoad %231 
					                               f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
					                               f32_3 %243 = OpFNegate %242 
					                               f32_3 %244 = OpFAdd %240 %243 
					                               f32_4 %245 = OpLoad %9 
					                               f32_4 %246 = OpVectorShuffle %245 %244 4 1 5 6 
					                                              OpStore %9 %246 
					                                 f32 %249 = OpLoad %159 
					                               f32_3 %250 = OpCompositeConstruct %249 %249 %249 
					                               f32_4 %251 = OpLoad %9 
					                               f32_3 %252 = OpVectorShuffle %251 %251 0 2 3 
					                               f32_3 %253 = OpFMul %250 %252 
					                               f32_4 %254 = OpLoad %231 
					                               f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
					                               f32_3 %256 = OpFAdd %253 %255 
					                               f32_4 %257 = OpLoad %248 
					                               f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
					                                              OpStore %248 %258 
					                        Private f32* %260 = OpAccessChain %231 %259 
					                                 f32 %261 = OpLoad %260 
					                         Output f32* %263 = OpAccessChain %248 %259 
					                                              OpStore %263 %261 
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
						vec4 unused_0_0[7];
						float _Opacity;
						float _Amplitude;
						vec4 unused_0_3;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraMotionVectorsTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat5;
					bool u_xlatb7;
					void main()
					{
					    u_xlat10_0 = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.xy);
					    u_xlat0.yz = u_xlat10_0.xy * vec2(vec2(_Amplitude, _Amplitude));
					    u_xlat0.xw = (-u_xlat0.zz);
					    u_xlat1.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat3 = min(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat1.x = u_xlat1.x * u_xlat3;
					    u_xlat3 = u_xlat1.x * u_xlat1.x;
					    u_xlat5 = u_xlat3 * 0.0208350997 + -0.0851330012;
					    u_xlat5 = u_xlat3 * u_xlat5 + 0.180141002;
					    u_xlat5 = u_xlat3 * u_xlat5 + -0.330299497;
					    u_xlat3 = u_xlat3 * u_xlat5 + 0.999866009;
					    u_xlat5 = u_xlat3 * u_xlat1.x;
					    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
					    u_xlatb7 = abs(u_xlat0.x)<abs(u_xlat0.y);
					    u_xlat5 = u_xlatb7 ? u_xlat5 : float(0.0);
					    u_xlat1.x = u_xlat1.x * u_xlat3 + u_xlat5;
					    u_xlatb4 = u_xlat0.x<u_xlat0.z;
					    u_xlat4 = u_xlatb4 ? -3.14159274 : float(0.0);
					    u_xlat4 = u_xlat4 + u_xlat1.x;
					    u_xlat1.x = min(u_xlat0.x, u_xlat0.y);
					    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
					    u_xlat0.x = max(u_xlat0.x, u_xlat0.y);
					    u_xlat2 = dot(u_xlat0.yw, u_xlat0.yw);
					    u_xlat2 = sqrt(u_xlat2);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat2 = u_xlat2 * _Opacity;
					    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlatb0 = u_xlatb0 && u_xlatb1;
					    u_xlat0.x = (u_xlatb0) ? (-u_xlat4) : u_xlat4;
					    u_xlat0.x = u_xlat0.x * 0.318309873 + 1.0;
					    u_xlat0.xzw = u_xlat0.xxx * vec3(3.0, 3.0, 3.0) + vec3(-3.0, -2.0, -4.0);
					    u_xlat0.xzw = abs(u_xlat0.xzw) * vec3(1.0, -1.0, -1.0) + vec3(-1.0, 2.0, 2.0);
					    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xzw = u_xlat0.xzw + (-u_xlat16_1.xyz);
					    u_xlat0.xyz = vec3(u_xlat2) * u_xlat0.xzw + u_xlat16_1.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
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
						vec4 unused_0_0[7];
						float _Opacity;
						float _Amplitude;
						vec4 unused_0_3;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraMotionVectorsTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat5;
					bool u_xlatb7;
					void main()
					{
					    u_xlat10_0 = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.xy);
					    u_xlat0.yz = u_xlat10_0.xy * vec2(vec2(_Amplitude, _Amplitude));
					    u_xlat0.xw = (-u_xlat0.zz);
					    u_xlat1 = max(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat1 = float(1.0) / u_xlat1;
					    u_xlat3 = min(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat3 = u_xlat1 * u_xlat1;
					    u_xlat5 = u_xlat3 * 0.0208350997 + -0.0851330012;
					    u_xlat5 = u_xlat3 * u_xlat5 + 0.180141002;
					    u_xlat5 = u_xlat3 * u_xlat5 + -0.330299497;
					    u_xlat3 = u_xlat3 * u_xlat5 + 0.999866009;
					    u_xlat5 = u_xlat3 * u_xlat1;
					    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
					    u_xlatb7 = abs(u_xlat0.x)<abs(u_xlat0.y);
					    u_xlat5 = u_xlatb7 ? u_xlat5 : float(0.0);
					    u_xlat1 = u_xlat1 * u_xlat3 + u_xlat5;
					    u_xlatb4 = u_xlat0.x<u_xlat0.z;
					    u_xlat4 = u_xlatb4 ? -3.14159274 : float(0.0);
					    u_xlat4 = u_xlat4 + u_xlat1;
					    u_xlat1 = min(u_xlat0.x, u_xlat0.y);
					    u_xlatb1 = u_xlat1<(-u_xlat1);
					    u_xlat0.x = max(u_xlat0.x, u_xlat0.y);
					    u_xlat2 = dot(u_xlat0.yw, u_xlat0.yw);
					    u_xlat2 = sqrt(u_xlat2);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat2 = u_xlat2 * _Opacity;
					    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlatb0 = u_xlatb0 && u_xlatb1;
					    u_xlat0.x = (u_xlatb0) ? (-u_xlat4) : u_xlat4;
					    u_xlat0.x = u_xlat0.x * 0.318309873 + 1.0;
					    u_xlat0.xzw = u_xlat0.xxx * vec3(3.0, 3.0, 3.0) + vec3(-3.0, -2.0, -4.0);
					    u_xlat0.xzw = abs(u_xlat0.xzw) * vec3(1.0, -1.0, -1.0) + vec3(-1.0, 2.0, 2.0);
					    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xzw = u_xlat0.xzw + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(u_xlat2) * u_xlat0.xzw + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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
			}
		}
		Pass {
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 290292
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[7];
						float _Opacity;
						float _Amplitude;
						vec4 _Scale;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _CameraMotionVectorsTexture;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					void main()
					{
					    u_xlat0.y = -abs(in_POSITION0.x);
					    u_xlat0.x = in_POSITION0.x;
					    u_xlat10.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
					    u_xlat1 = textureLod(_CameraMotionVectorsTexture, u_xlat10.xy, 0.0);
					    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_Amplitude, _Amplitude));
					    u_xlat1.zw = (-u_xlat1.yy);
					    u_xlat10.x = dot(u_xlat1.xz, u_xlat1.xz);
					    u_xlat15 = sqrt(u_xlat10.x);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat10.x = inversesqrt(u_xlat10.x);
					    u_xlat2.xy = u_xlat10.xx * u_xlat1.xw;
					    u_xlat3.x = dot(u_xlat1.xw, in_POSITION0.yz);
					    u_xlat0.xy = vec2(u_xlat15) * u_xlat0.xy;
					    vs_COLOR0.w = u_xlat15 * _Opacity;
					    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.300000012, 0.300000012);
					    u_xlat2.z = (-u_xlat2.x);
					    u_xlat4.y = dot(u_xlat2.zy, u_xlat0.xy);
					    u_xlat4.x = dot(u_xlat2.yx, u_xlat0.xy);
					    u_xlat0.xy = u_xlat4.xy * _Scale.xy;
					    u_xlat3.y = dot((-u_xlat1.yx), in_POSITION0.yz);
					    u_xlat0.xy = u_xlat3.xy * _Scale.xy + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _ScreenParams.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat0.xy = roundEven(u_xlat0.xy);
					    u_xlat10.xy = u_xlat0.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat10.xy;
					    gl_Position.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    gl_Position.zw = vec2(0.0, 1.0);
					    u_xlat0.x = abs(u_xlat1.y);
					    u_xlat5 = max(u_xlat0.x, abs(u_xlat1.x));
					    u_xlat5 = float(1.0) / u_xlat5;
					    u_xlat10.x = min(u_xlat0.x, abs(u_xlat1.x));
					    u_xlatb0 = u_xlat0.x<abs(u_xlat1.x);
					    u_xlat5 = u_xlat5 * u_xlat10.x;
					    u_xlat10.x = u_xlat5 * u_xlat5;
					    u_xlat15 = u_xlat10.x * 0.0208350997 + -0.0851330012;
					    u_xlat15 = u_xlat10.x * u_xlat15 + 0.180141002;
					    u_xlat15 = u_xlat10.x * u_xlat15 + -0.330299497;
					    u_xlat10.x = u_xlat10.x * u_xlat15 + 0.999866009;
					    u_xlat15 = u_xlat10.x * u_xlat5;
					    u_xlat15 = u_xlat15 * -2.0 + 1.57079637;
					    u_xlat0.x = u_xlatb0 ? u_xlat15 : float(0.0);
					    u_xlat0.x = u_xlat5 * u_xlat10.x + u_xlat0.x;
					    u_xlatb5 = (-u_xlat1.y)<u_xlat1.y;
					    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
					    u_xlat0.x = u_xlat5 + u_xlat0.x;
					    u_xlat5 = min((-u_xlat1.y), u_xlat1.x);
					    u_xlat10.x = max((-u_xlat1.y), u_xlat1.x);
					    u_xlatb10 = u_xlat10.x>=(-u_xlat10.x);
					    u_xlatb5 = u_xlat5<(-u_xlat5);
					    u_xlatb5 = u_xlatb10 && u_xlatb5;
					    u_xlat0.x = (u_xlatb5) ? (-u_xlat0.x) : u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.318309873 + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * vec3(3.0, 3.0, 3.0) + vec3(-3.0, -2.0, -4.0);
					    u_xlat0.xyz = abs(u_xlat0.xyz) * vec3(1.0, -1.0, -1.0) + vec3(-1.0, 2.0, 2.0);
					    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    vs_COLOR0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
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
					uniform 	vec4 _ScreenParams;
					uniform 	float _Opacity;
					uniform 	float _Amplitude;
					uniform 	vec4 _Scale;
					UNITY_LOCATION(0) uniform  sampler2D _CameraMotionVectorsTexture;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.y = -abs(in_POSITION0.x);
					    u_xlat0.x = in_POSITION0.x;
					    u_xlat1 = textureLod(_CameraMotionVectorsTexture, in_TEXCOORD0.xy, 0.0);
					    u_xlat1.yz = u_xlat1.xy * vec2(vec2(_Amplitude, _Amplitude));
					    u_xlat8 = dot(u_xlat1.yz, u_xlat1.yz);
					    u_xlat12 = sqrt(u_xlat8);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat8 = inversesqrt(u_xlat8);
					    u_xlat2.xy = vec2(u_xlat8) * u_xlat1.yz;
					    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
					    vs_COLOR0.w = u_xlat12 * _Opacity;
					    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.300000012, 0.300000012);
					    u_xlat2.z = (-u_xlat2.x);
					    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xy);
					    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xy);
					    u_xlat0.xy = u_xlat3.xy * _Scale.xy;
					    u_xlat1.xw = (-u_xlat1.zy);
					    u_xlat2.y = dot(u_xlat1.zw, in_POSITION0.yz);
					    u_xlatb8 = u_xlat1.z<u_xlat1.x;
					    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
					    u_xlat2.x = dot(u_xlat1.yz, in_POSITION0.yz);
					    u_xlat0.xy = u_xlat2.xy * _Scale.xy + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _ScreenParams.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat0.xy = roundEven(u_xlat0.xy);
					    u_xlat1.xw = u_xlat0.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.xw;
					    gl_Position.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    gl_Position.zw = vec2(0.0, 1.0);
					    u_xlat0.x = max(abs(u_xlat1.z), abs(u_xlat1.y));
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat4 = min(abs(u_xlat1.z), abs(u_xlat1.y));
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat4 = u_xlat0.x * u_xlat0.x;
					    u_xlat12 = u_xlat4 * 0.0208350997 + -0.0851330012;
					    u_xlat12 = u_xlat4 * u_xlat12 + 0.180141002;
					    u_xlat12 = u_xlat4 * u_xlat12 + -0.330299497;
					    u_xlat4 = u_xlat4 * u_xlat12 + 0.999866009;
					    u_xlat12 = u_xlat4 * u_xlat0.x;
					    u_xlat12 = u_xlat12 * -2.0 + 1.57079637;
					    u_xlatb1 = abs(u_xlat1.z)<abs(u_xlat1.y);
					    u_xlat12 = u_xlatb1 ? u_xlat12 : float(0.0);
					    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat12;
					    u_xlat0.x = u_xlat8 + u_xlat0.x;
					    u_xlat4 = min(u_xlat1.z, u_xlat1.y);
					    u_xlat8 = max(u_xlat1.z, u_xlat1.y);
					    u_xlatb8 = u_xlat8>=(-u_xlat8);
					    u_xlatb4 = u_xlat4<(-u_xlat4);
					    u_xlatb4 = u_xlatb8 && u_xlatb4;
					    u_xlat0.x = (u_xlatb4) ? (-u_xlat0.x) : u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.318309873 + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * vec3(3.0, 3.0, 3.0) + vec3(-3.0, -2.0, -4.0);
					    u_xlat0.xyz = abs(u_xlat0.xyz) * vec3(1.0, -1.0, -1.0) + vec3(-1.0, 2.0, 2.0);
					    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    vs_COLOR0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#ifdef GL_ARB_shader_bit_encoding
					#extension GL_ARB_shader_bit_encoding : enable
					#endif
					
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0.xy = fract(vs_TEXCOORD0.xy);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat1 = u_xlat0.x * 0.431833118 + 0.682171106;
					    u_xlat0.x = u_xlat0.x * 1.41442716;
					    u_xlat1 = u_xlat0.x * u_xlat1 + 0.0125228781;
					    u_xlat0.x = u_xlat1 * u_xlat0.x;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    SV_Target0.xyz = vs_COLOR0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 456
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Vertex %4 "main" %12 %29 %116 %215 %234 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpDecorate %12 Location 12 
					                                                  OpDecorate %29 Location 29 
					                                                  OpDecorate %41 DescriptorSet 41 
					                                                  OpDecorate %41 Binding 41 
					                                                  OpDecorate %45 DescriptorSet 45 
					                                                  OpDecorate %45 Binding 45 
					                                                  OpMemberDecorate %55 0 Offset 55 
					                                                  OpMemberDecorate %55 1 Offset 55 
					                                                  OpMemberDecorate %55 2 Offset 55 
					                                                  OpMemberDecorate %55 3 Offset 55 
					                                                  OpDecorate %55 Block 
					                                                  OpDecorate %57 DescriptorSet 57 
					                                                  OpDecorate %57 Binding 57 
					                                                  OpDecorate %116 Location 116 
					                                                  OpDecorate vs_TEXCOORD0 Location 215 
					                                                  OpMemberDecorate %232 0 BuiltIn 232 
					                                                  OpMemberDecorate %232 1 BuiltIn 232 
					                                                  OpMemberDecorate %232 2 BuiltIn 232 
					                                                  OpDecorate %232 Block 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 3 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_3* %9 = OpVariable Private 
					                                          %10 = OpTypeVector %6 4 
					                                          %11 = OpTypePointer Input %10 
					                             Input f32_4* %12 = OpVariable Input 
					                                          %13 = OpTypeInt 32 0 
					                                      u32 %14 = OpConstant 0 
					                                          %15 = OpTypePointer Input %6 
					                                      u32 %20 = OpConstant 1 
					                                          %21 = OpTypePointer Private %6 
					                                          %26 = OpTypeVector %6 2 
					                                          %27 = OpTypePointer Private %26 
					                           Private f32_2* %28 = OpVariable Private 
					                             Input f32_4* %29 = OpVariable Input 
					                                      f32 %32 = OpConstant 3,674022E-40 
					                                      f32 %33 = OpConstant 3,674022E-40 
					                                    f32_2 %34 = OpConstantComposite %32 %33 
					                                      f32 %36 = OpConstant 3,674022E-40 
					                                    f32_2 %37 = OpConstantComposite %36 %32 
					                                          %39 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %40 = OpTypePointer UniformConstant %39 
					     UniformConstant read_only Texture2D* %41 = OpVariable UniformConstant 
					                                          %43 = OpTypeSampler 
					                                          %44 = OpTypePointer UniformConstant %43 
					                 UniformConstant sampler* %45 = OpVariable UniformConstant 
					                                          %47 = OpTypeSampledImage %39 
					                                          %52 = OpTypePointer Private %10 
					                           Private f32_4* %53 = OpVariable Private 
					                                          %55 = OpTypeStruct %10 %6 %6 %10 
					                                          %56 = OpTypePointer Uniform %55 
					Uniform struct {f32_4; f32; f32; f32_4;}* %57 = OpVariable Uniform 
					                                          %58 = OpTypeInt 32 1 
					                                      i32 %59 = OpConstant 2 
					                                          %60 = OpTypePointer Uniform %6 
					                             Private f32* %83 = OpVariable Private 
					                           Private f32_3* %93 = OpVariable Private 
					                          Private f32_2* %101 = OpVariable Private 
					                                         %115 = OpTypePointer Output %10 
					                           Output f32_4* %116 = OpVariable Output 
					                                     i32 %118 = OpConstant 1 
					                                     u32 %122 = OpConstant 3 
					                                         %123 = OpTypePointer Output %6 
					                                     f32 %131 = OpConstant 3,674022E-40 
					                                   f32_2 %132 = OpConstantComposite %131 %131 
					                                     u32 %139 = OpConstant 2 
					                          Private f32_2* %141 = OpVariable Private 
					                                     i32 %155 = OpConstant 3 
					                                         %156 = OpTypePointer Uniform %10 
					                                     f32 %182 = OpConstant 3,674022E-40 
					                                   f32_2 %183 = OpConstantComposite %182 %182 
					                                     i32 %192 = OpConstant 0 
					                                     f32 %201 = OpConstant 3,674022E-40 
					                                   f32_2 %202 = OpConstantComposite %201 %201 
					                                         %214 = OpTypePointer Output %26 
					                   Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                   f32_2 %221 = OpConstantComposite %33 %33 
					                                         %231 = OpTypeArray %6 %20 
					                                         %232 = OpTypeStruct %10 %6 %231 
					                                         %233 = OpTypePointer Output %232 
					    Output struct {f32_4; f32; f32[1];}* %234 = OpVariable Output 
					                            Private f32* %249 = OpVariable Private 
					                                         %265 = OpTypeBool 
					                                         %266 = OpTypePointer Private %265 
					                           Private bool* %267 = OpVariable Private 
					                                     f32 %284 = OpConstant 3,674022E-40 
					                                     f32 %286 = OpConstant 3,674022E-40 
					                                     f32 %292 = OpConstant 3,674022E-40 
					                                     f32 %298 = OpConstant 3,674022E-40 
					                                     f32 %304 = OpConstant 3,674022E-40 
					                                     f32 %312 = OpConstant 3,674022E-40 
					                                     f32 %314 = OpConstant 3,674022E-40 
					                           Private bool* %328 = OpVariable Private 
					                                     f32 %336 = OpConstant 3,674022E-40 
					                           Private bool* %356 = OpVariable Private 
					                                         %371 = OpTypePointer Function %6 
					                                     f32 %385 = OpConstant 3,674022E-40 
					                                     f32 %391 = OpConstant 3,674022E-40 
					                                   f32_3 %392 = OpConstantComposite %391 %391 %391 
					                                     f32 %394 = OpConstant 3,674022E-40 
					                                     f32 %395 = OpConstant 3,674022E-40 
					                                   f32_3 %396 = OpConstantComposite %394 %312 %395 
					                                   f32_3 %400 = OpConstantComposite %32 %33 %33 
					                                   f32_3 %402 = OpConstantComposite %33 %182 %182 
					                                   f32_3 %410 = OpConstantComposite %32 %32 %32 
					                                   f32_3 %416 = OpConstantComposite %201 %201 %201 
					                                     f32 %421 = OpConstant 3,674022E-40 
					                                   f32_3 %422 = OpConstantComposite %421 %421 %421 
					                                     f32 %424 = OpConstant 3,674022E-40 
					                                   f32_3 %425 = OpConstantComposite %424 %424 %424 
					                                     f32 %433 = OpConstant 3,674022E-40 
					                                   f32_3 %434 = OpConstantComposite %433 %433 %433 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                           Function f32* %372 = OpVariable Function 
					                               Input f32* %16 = OpAccessChain %12 %14 
					                                      f32 %17 = OpLoad %16 
					                                      f32 %18 = OpExtInst %1 4 %17 
					                                      f32 %19 = OpFNegate %18 
					                             Private f32* %22 = OpAccessChain %9 %20 
					                                                  OpStore %22 %19 
					                               Input f32* %23 = OpAccessChain %12 %14 
					                                      f32 %24 = OpLoad %23 
					                             Private f32* %25 = OpAccessChain %9 %14 
					                                                  OpStore %25 %24 
					                                    f32_4 %30 = OpLoad %29 
					                                    f32_2 %31 = OpVectorShuffle %30 %30 0 1 
					                                    f32_2 %35 = OpFMul %31 %34 
					                                    f32_2 %38 = OpFAdd %35 %37 
					                                                  OpStore %28 %38 
					                      read_only Texture2D %42 = OpLoad %41 
					                                  sampler %46 = OpLoad %45 
					               read_only Texture2DSampled %48 = OpSampledImage %42 %46 
					                                    f32_2 %49 = OpLoad %28 
					                                    f32_4 %50 = OpImageSampleExplicitLod %48 %49 Lod %10 
					                                    f32_2 %51 = OpVectorShuffle %50 %50 0 1 
					                                                  OpStore %28 %51 
					                                    f32_2 %54 = OpLoad %28 
					                             Uniform f32* %61 = OpAccessChain %57 %59 
					                                      f32 %62 = OpLoad %61 
					                             Uniform f32* %63 = OpAccessChain %57 %59 
					                                      f32 %64 = OpLoad %63 
					                                    f32_2 %65 = OpCompositeConstruct %62 %64 
					                                      f32 %66 = OpCompositeExtract %65 0 
					                                      f32 %67 = OpCompositeExtract %65 1 
					                                    f32_2 %68 = OpCompositeConstruct %66 %67 
					                                    f32_2 %69 = OpFMul %54 %68 
					                                    f32_4 %70 = OpLoad %53 
					                                    f32_4 %71 = OpVectorShuffle %70 %69 4 5 2 3 
					                                                  OpStore %53 %71 
					                                    f32_4 %72 = OpLoad %53 
					                                    f32_2 %73 = OpVectorShuffle %72 %72 1 1 
					                                    f32_2 %74 = OpFNegate %73 
					                                    f32_4 %75 = OpLoad %53 
					                                    f32_4 %76 = OpVectorShuffle %75 %74 0 1 4 5 
					                                                  OpStore %53 %76 
					                                    f32_4 %77 = OpLoad %53 
					                                    f32_2 %78 = OpVectorShuffle %77 %77 0 2 
					                                    f32_4 %79 = OpLoad %53 
					                                    f32_2 %80 = OpVectorShuffle %79 %79 0 2 
					                                      f32 %81 = OpDot %78 %80 
					                             Private f32* %82 = OpAccessChain %28 %14 
					                                                  OpStore %82 %81 
					                             Private f32* %84 = OpAccessChain %28 %14 
					                                      f32 %85 = OpLoad %84 
					                                      f32 %86 = OpExtInst %1 31 %85 
					                                                  OpStore %83 %86 
					                                      f32 %87 = OpLoad %83 
					                                      f32 %88 = OpExtInst %1 43 %87 %36 %32 
					                                                  OpStore %83 %88 
					                             Private f32* %89 = OpAccessChain %28 %14 
					                                      f32 %90 = OpLoad %89 
					                                      f32 %91 = OpExtInst %1 32 %90 
					                             Private f32* %92 = OpAccessChain %28 %14 
					                                                  OpStore %92 %91 
					                                    f32_2 %94 = OpLoad %28 
					                                    f32_2 %95 = OpVectorShuffle %94 %94 0 0 
					                                    f32_4 %96 = OpLoad %53 
					                                    f32_2 %97 = OpVectorShuffle %96 %96 0 3 
					                                    f32_2 %98 = OpFMul %95 %97 
					                                    f32_3 %99 = OpLoad %93 
					                                   f32_3 %100 = OpVectorShuffle %99 %98 3 4 2 
					                                                  OpStore %93 %100 
					                                   f32_4 %102 = OpLoad %53 
					                                   f32_2 %103 = OpVectorShuffle %102 %102 0 3 
					                                   f32_4 %104 = OpLoad %12 
					                                   f32_2 %105 = OpVectorShuffle %104 %104 1 2 
					                                     f32 %106 = OpDot %103 %105 
					                            Private f32* %107 = OpAccessChain %101 %14 
					                                                  OpStore %107 %106 
					                                     f32 %108 = OpLoad %83 
					                                   f32_2 %109 = OpCompositeConstruct %108 %108 
					                                   f32_3 %110 = OpLoad %9 
					                                   f32_2 %111 = OpVectorShuffle %110 %110 0 1 
					                                   f32_2 %112 = OpFMul %109 %111 
					                                   f32_3 %113 = OpLoad %9 
					                                   f32_3 %114 = OpVectorShuffle %113 %112 3 4 2 
					                                                  OpStore %9 %114 
					                                     f32 %117 = OpLoad %83 
					                            Uniform f32* %119 = OpAccessChain %57 %118 
					                                     f32 %120 = OpLoad %119 
					                                     f32 %121 = OpFMul %117 %120 
					                             Output f32* %124 = OpAccessChain %116 %122 
					                                                  OpStore %124 %121 
					                             Output f32* %125 = OpAccessChain %116 %122 
					                                     f32 %126 = OpLoad %125 
					                                     f32 %127 = OpExtInst %1 43 %126 %36 %32 
					                             Output f32* %128 = OpAccessChain %116 %122 
					                                                  OpStore %128 %127 
					                                   f32_3 %129 = OpLoad %9 
					                                   f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                   f32_2 %133 = OpFMul %130 %132 
					                                   f32_3 %134 = OpLoad %9 
					                                   f32_3 %135 = OpVectorShuffle %134 %133 3 4 2 
					                                                  OpStore %9 %135 
					                            Private f32* %136 = OpAccessChain %93 %14 
					                                     f32 %137 = OpLoad %136 
					                                     f32 %138 = OpFNegate %137 
					                            Private f32* %140 = OpAccessChain %93 %139 
					                                                  OpStore %140 %138 
					                                   f32_3 %142 = OpLoad %93 
					                                   f32_2 %143 = OpVectorShuffle %142 %142 2 1 
					                                   f32_3 %144 = OpLoad %9 
					                                   f32_2 %145 = OpVectorShuffle %144 %144 0 1 
					                                     f32 %146 = OpDot %143 %145 
					                            Private f32* %147 = OpAccessChain %141 %20 
					                                                  OpStore %147 %146 
					                                   f32_3 %148 = OpLoad %93 
					                                   f32_2 %149 = OpVectorShuffle %148 %148 1 0 
					                                   f32_3 %150 = OpLoad %9 
					                                   f32_2 %151 = OpVectorShuffle %150 %150 0 1 
					                                     f32 %152 = OpDot %149 %151 
					                            Private f32* %153 = OpAccessChain %141 %14 
					                                                  OpStore %153 %152 
					                                   f32_2 %154 = OpLoad %141 
					                          Uniform f32_4* %157 = OpAccessChain %57 %155 
					                                   f32_4 %158 = OpLoad %157 
					                                   f32_2 %159 = OpVectorShuffle %158 %158 0 1 
					                                   f32_2 %160 = OpFMul %154 %159 
					                                   f32_3 %161 = OpLoad %9 
					                                   f32_3 %162 = OpVectorShuffle %161 %160 3 4 2 
					                                                  OpStore %9 %162 
					                                   f32_4 %163 = OpLoad %53 
					                                   f32_2 %164 = OpVectorShuffle %163 %163 1 0 
					                                   f32_2 %165 = OpFNegate %164 
					                                   f32_4 %166 = OpLoad %12 
					                                   f32_2 %167 = OpVectorShuffle %166 %166 1 2 
					                                     f32 %168 = OpDot %165 %167 
					                            Private f32* %169 = OpAccessChain %101 %20 
					                                                  OpStore %169 %168 
					                                   f32_2 %170 = OpLoad %101 
					                          Uniform f32_4* %171 = OpAccessChain %57 %155 
					                                   f32_4 %172 = OpLoad %171 
					                                   f32_2 %173 = OpVectorShuffle %172 %172 0 1 
					                                   f32_2 %174 = OpFMul %170 %173 
					                                   f32_3 %175 = OpLoad %9 
					                                   f32_2 %176 = OpVectorShuffle %175 %175 0 1 
					                                   f32_2 %177 = OpFAdd %174 %176 
					                                   f32_3 %178 = OpLoad %9 
					                                   f32_3 %179 = OpVectorShuffle %178 %177 3 4 2 
					                                                  OpStore %9 %179 
					                                   f32_4 %180 = OpLoad %29 
					                                   f32_2 %181 = OpVectorShuffle %180 %180 0 1 
					                                   f32_2 %184 = OpFMul %181 %183 
					                                   f32_3 %185 = OpLoad %9 
					                                   f32_2 %186 = OpVectorShuffle %185 %185 0 1 
					                                   f32_2 %187 = OpFAdd %184 %186 
					                                   f32_3 %188 = OpLoad %9 
					                                   f32_3 %189 = OpVectorShuffle %188 %187 3 4 2 
					                                                  OpStore %9 %189 
					                                   f32_3 %190 = OpLoad %9 
					                                   f32_2 %191 = OpVectorShuffle %190 %190 0 1 
					                          Uniform f32_4* %193 = OpAccessChain %57 %192 
					                                   f32_4 %194 = OpLoad %193 
					                                   f32_2 %195 = OpVectorShuffle %194 %194 0 1 
					                                   f32_2 %196 = OpFMul %191 %195 
					                                   f32_3 %197 = OpLoad %9 
					                                   f32_3 %198 = OpVectorShuffle %197 %196 3 4 2 
					                                                  OpStore %9 %198 
					                                   f32_3 %199 = OpLoad %9 
					                                   f32_2 %200 = OpVectorShuffle %199 %199 0 1 
					                                   f32_2 %203 = OpFMul %200 %202 
					                                   f32_3 %204 = OpLoad %9 
					                                   f32_3 %205 = OpVectorShuffle %204 %203 3 4 2 
					                                                  OpStore %9 %205 
					                                   f32_3 %206 = OpLoad %9 
					                                   f32_2 %207 = OpVectorShuffle %206 %206 0 1 
					                                   f32_2 %208 = OpExtInst %1 2 %207 
					                                   f32_3 %209 = OpLoad %9 
					                                   f32_3 %210 = OpVectorShuffle %209 %208 3 4 2 
					                                                  OpStore %9 %210 
					                                   f32_3 %211 = OpLoad %9 
					                                   f32_2 %212 = OpVectorShuffle %211 %211 0 1 
					                                   f32_2 %213 = OpFAdd %212 %202 
					                                                  OpStore %28 %213 
					                                   f32_3 %216 = OpLoad %9 
					                                   f32_2 %217 = OpVectorShuffle %216 %216 0 1 
					                                                  OpStore vs_TEXCOORD0 %217 
					                          Uniform f32_4* %218 = OpAccessChain %57 %192 
					                                   f32_4 %219 = OpLoad %218 
					                                   f32_2 %220 = OpVectorShuffle %219 %219 2 3 
					                                   f32_2 %222 = OpFAdd %220 %221 
					                                   f32_3 %223 = OpLoad %9 
					                                   f32_3 %224 = OpVectorShuffle %223 %222 3 4 2 
					                                                  OpStore %9 %224 
					                                   f32_3 %225 = OpLoad %9 
					                                   f32_2 %226 = OpVectorShuffle %225 %225 0 1 
					                                   f32_2 %227 = OpLoad %28 
					                                   f32_2 %228 = OpFMul %226 %227 
					                                   f32_3 %229 = OpLoad %9 
					                                   f32_3 %230 = OpVectorShuffle %229 %228 3 4 2 
					                                                  OpStore %9 %230 
					                                   f32_3 %235 = OpLoad %9 
					                                   f32_2 %236 = OpVectorShuffle %235 %235 0 1 
					                                   f32_2 %237 = OpFMul %236 %183 
					                                   f32_2 %238 = OpFAdd %237 %221 
					                           Output f32_4* %239 = OpAccessChain %234 %192 
					                                   f32_4 %240 = OpLoad %239 
					                                   f32_4 %241 = OpVectorShuffle %240 %238 4 5 2 3 
					                                                  OpStore %239 %241 
					                           Output f32_4* %242 = OpAccessChain %234 %192 
					                                   f32_4 %243 = OpLoad %242 
					                                   f32_4 %244 = OpVectorShuffle %243 %37 0 1 4 5 
					                                                  OpStore %242 %244 
					                            Private f32* %245 = OpAccessChain %53 %20 
					                                     f32 %246 = OpLoad %245 
					                                     f32 %247 = OpExtInst %1 4 %246 
					                            Private f32* %248 = OpAccessChain %9 %14 
					                                                  OpStore %248 %247 
					                            Private f32* %250 = OpAccessChain %9 %14 
					                                     f32 %251 = OpLoad %250 
					                            Private f32* %252 = OpAccessChain %53 %14 
					                                     f32 %253 = OpLoad %252 
					                                     f32 %254 = OpExtInst %1 4 %253 
					                                     f32 %255 = OpExtInst %1 40 %251 %254 
					                                                  OpStore %249 %255 
					                                     f32 %256 = OpLoad %249 
					                                     f32 %257 = OpFDiv %32 %256 
					                                                  OpStore %249 %257 
					                            Private f32* %258 = OpAccessChain %9 %14 
					                                     f32 %259 = OpLoad %258 
					                            Private f32* %260 = OpAccessChain %53 %14 
					                                     f32 %261 = OpLoad %260 
					                                     f32 %262 = OpExtInst %1 4 %261 
					                                     f32 %263 = OpExtInst %1 37 %259 %262 
					                            Private f32* %264 = OpAccessChain %28 %14 
					                                                  OpStore %264 %263 
					                            Private f32* %268 = OpAccessChain %9 %14 
					                                     f32 %269 = OpLoad %268 
					                            Private f32* %270 = OpAccessChain %53 %14 
					                                     f32 %271 = OpLoad %270 
					                                     f32 %272 = OpExtInst %1 4 %271 
					                                    bool %273 = OpFOrdLessThan %269 %272 
					                                                  OpStore %267 %273 
					                                     f32 %274 = OpLoad %249 
					                            Private f32* %275 = OpAccessChain %28 %14 
					                                     f32 %276 = OpLoad %275 
					                                     f32 %277 = OpFMul %274 %276 
					                                                  OpStore %249 %277 
					                                     f32 %278 = OpLoad %249 
					                                     f32 %279 = OpLoad %249 
					                                     f32 %280 = OpFMul %278 %279 
					                            Private f32* %281 = OpAccessChain %28 %14 
					                                                  OpStore %281 %280 
					                            Private f32* %282 = OpAccessChain %28 %14 
					                                     f32 %283 = OpLoad %282 
					                                     f32 %285 = OpFMul %283 %284 
					                                     f32 %287 = OpFAdd %285 %286 
					                                                  OpStore %83 %287 
					                            Private f32* %288 = OpAccessChain %28 %14 
					                                     f32 %289 = OpLoad %288 
					                                     f32 %290 = OpLoad %83 
					                                     f32 %291 = OpFMul %289 %290 
					                                     f32 %293 = OpFAdd %291 %292 
					                                                  OpStore %83 %293 
					                            Private f32* %294 = OpAccessChain %28 %14 
					                                     f32 %295 = OpLoad %294 
					                                     f32 %296 = OpLoad %83 
					                                     f32 %297 = OpFMul %295 %296 
					                                     f32 %299 = OpFAdd %297 %298 
					                                                  OpStore %83 %299 
					                            Private f32* %300 = OpAccessChain %28 %14 
					                                     f32 %301 = OpLoad %300 
					                                     f32 %302 = OpLoad %83 
					                                     f32 %303 = OpFMul %301 %302 
					                                     f32 %305 = OpFAdd %303 %304 
					                            Private f32* %306 = OpAccessChain %28 %14 
					                                                  OpStore %306 %305 
					                            Private f32* %307 = OpAccessChain %28 %14 
					                                     f32 %308 = OpLoad %307 
					                                     f32 %309 = OpLoad %249 
					                                     f32 %310 = OpFMul %308 %309 
					                                                  OpStore %83 %310 
					                                     f32 %311 = OpLoad %83 
					                                     f32 %313 = OpFMul %311 %312 
					                                     f32 %315 = OpFAdd %313 %314 
					                                                  OpStore %83 %315 
					                                    bool %316 = OpLoad %267 
					                                     f32 %317 = OpLoad %83 
					                                     f32 %318 = OpSelect %316 %317 %36 
					                            Private f32* %319 = OpAccessChain %9 %14 
					                                                  OpStore %319 %318 
					                                     f32 %320 = OpLoad %249 
					                            Private f32* %321 = OpAccessChain %28 %14 
					                                     f32 %322 = OpLoad %321 
					                                     f32 %323 = OpFMul %320 %322 
					                            Private f32* %324 = OpAccessChain %9 %14 
					                                     f32 %325 = OpLoad %324 
					                                     f32 %326 = OpFAdd %323 %325 
					                            Private f32* %327 = OpAccessChain %9 %14 
					                                                  OpStore %327 %326 
					                            Private f32* %329 = OpAccessChain %53 %20 
					                                     f32 %330 = OpLoad %329 
					                                     f32 %331 = OpFNegate %330 
					                            Private f32* %332 = OpAccessChain %53 %20 
					                                     f32 %333 = OpLoad %332 
					                                    bool %334 = OpFOrdLessThan %331 %333 
					                                                  OpStore %328 %334 
					                                    bool %335 = OpLoad %328 
					                                     f32 %337 = OpSelect %335 %336 %36 
					                                                  OpStore %249 %337 
					                                     f32 %338 = OpLoad %249 
					                            Private f32* %339 = OpAccessChain %9 %14 
					                                     f32 %340 = OpLoad %339 
					                                     f32 %341 = OpFAdd %338 %340 
					                            Private f32* %342 = OpAccessChain %9 %14 
					                                                  OpStore %342 %341 
					                            Private f32* %343 = OpAccessChain %53 %20 
					                                     f32 %344 = OpLoad %343 
					                                     f32 %345 = OpFNegate %344 
					                            Private f32* %346 = OpAccessChain %53 %14 
					                                     f32 %347 = OpLoad %346 
					                                     f32 %348 = OpExtInst %1 37 %345 %347 
					                                                  OpStore %249 %348 
					                            Private f32* %349 = OpAccessChain %53 %20 
					                                     f32 %350 = OpLoad %349 
					                                     f32 %351 = OpFNegate %350 
					                            Private f32* %352 = OpAccessChain %53 %14 
					                                     f32 %353 = OpLoad %352 
					                                     f32 %354 = OpExtInst %1 40 %351 %353 
					                            Private f32* %355 = OpAccessChain %28 %14 
					                                                  OpStore %355 %354 
					                            Private f32* %357 = OpAccessChain %28 %14 
					                                     f32 %358 = OpLoad %357 
					                            Private f32* %359 = OpAccessChain %28 %14 
					                                     f32 %360 = OpLoad %359 
					                                     f32 %361 = OpFNegate %360 
					                                    bool %362 = OpFOrdGreaterThanEqual %358 %361 
					                                                  OpStore %356 %362 
					                                     f32 %363 = OpLoad %249 
					                                     f32 %364 = OpLoad %249 
					                                     f32 %365 = OpFNegate %364 
					                                    bool %366 = OpFOrdLessThan %363 %365 
					                                                  OpStore %328 %366 
					                                    bool %367 = OpLoad %356 
					                                    bool %368 = OpLoad %328 
					                                    bool %369 = OpLogicalAnd %367 %368 
					                                                  OpStore %328 %369 
					                                    bool %370 = OpLoad %328 
					                                                  OpSelectionMerge %374 None 
					                                                  OpBranchConditional %370 %373 %378 
					                                         %373 = OpLabel 
					                            Private f32* %375 = OpAccessChain %9 %14 
					                                     f32 %376 = OpLoad %375 
					                                     f32 %377 = OpFNegate %376 
					                                                  OpStore %372 %377 
					                                                  OpBranch %374 
					                                         %378 = OpLabel 
					                            Private f32* %379 = OpAccessChain %9 %14 
					                                     f32 %380 = OpLoad %379 
					                                                  OpStore %372 %380 
					                                                  OpBranch %374 
					                                         %374 = OpLabel 
					                                     f32 %381 = OpLoad %372 
					                            Private f32* %382 = OpAccessChain %9 %14 
					                                                  OpStore %382 %381 
					                            Private f32* %383 = OpAccessChain %9 %14 
					                                     f32 %384 = OpLoad %383 
					                                     f32 %386 = OpFMul %384 %385 
					                                     f32 %387 = OpFAdd %386 %32 
					                            Private f32* %388 = OpAccessChain %9 %14 
					                                                  OpStore %388 %387 
					                                   f32_3 %389 = OpLoad %9 
					                                   f32_3 %390 = OpVectorShuffle %389 %389 0 0 0 
					                                   f32_3 %393 = OpFMul %390 %392 
					                                   f32_3 %397 = OpFAdd %393 %396 
					                                                  OpStore %9 %397 
					                                   f32_3 %398 = OpLoad %9 
					                                   f32_3 %399 = OpExtInst %1 4 %398 
					                                   f32_3 %401 = OpFMul %399 %400 
					                                   f32_3 %403 = OpFAdd %401 %402 
					                                                  OpStore %9 %403 
					                                   f32_3 %404 = OpLoad %9 
					                                   f32_3 %405 = OpCompositeConstruct %36 %36 %36 
					                                   f32_3 %406 = OpCompositeConstruct %32 %32 %32 
					                                   f32_3 %407 = OpExtInst %1 43 %404 %405 %406 
					                                                  OpStore %9 %407 
					                                   f32_3 %408 = OpLoad %9 
					                                   f32_3 %409 = OpFNegate %408 
					                                   f32_3 %411 = OpFAdd %409 %410 
					                                   f32_4 %412 = OpLoad %53 
					                                   f32_4 %413 = OpVectorShuffle %412 %411 4 5 6 3 
					                                                  OpStore %53 %413 
					                                   f32_4 %414 = OpLoad %53 
					                                   f32_3 %415 = OpVectorShuffle %414 %414 0 1 2 
					                                   f32_3 %417 = OpFMul %415 %416 
					                                   f32_3 %418 = OpLoad %9 
					                                   f32_3 %419 = OpFAdd %417 %418 
					                                                  OpStore %9 %419 
					                                   f32_3 %420 = OpLoad %9 
					                                   f32_3 %423 = OpFMul %420 %422 
					                                   f32_3 %426 = OpFAdd %423 %425 
					                                   f32_4 %427 = OpLoad %53 
					                                   f32_4 %428 = OpVectorShuffle %427 %426 4 5 6 3 
					                                                  OpStore %53 %428 
					                                   f32_3 %429 = OpLoad %9 
					                                   f32_4 %430 = OpLoad %53 
					                                   f32_3 %431 = OpVectorShuffle %430 %430 0 1 2 
					                                   f32_3 %432 = OpFMul %429 %431 
					                                   f32_3 %435 = OpFAdd %432 %434 
					                                   f32_4 %436 = OpLoad %53 
					                                   f32_4 %437 = OpVectorShuffle %436 %435 4 5 6 3 
					                                                  OpStore %53 %437 
					                                   f32_3 %438 = OpLoad %9 
					                                   f32_4 %439 = OpLoad %53 
					                                   f32_3 %440 = OpVectorShuffle %439 %439 0 1 2 
					                                   f32_3 %441 = OpFMul %438 %440 
					                                   f32_4 %442 = OpLoad %116 
					                                   f32_4 %443 = OpVectorShuffle %442 %441 4 5 6 3 
					                                                  OpStore %116 %443 
					                                   f32_4 %444 = OpLoad %116 
					                                   f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
					                                   f32_3 %446 = OpCompositeConstruct %36 %36 %36 
					                                   f32_3 %447 = OpCompositeConstruct %32 %32 %32 
					                                   f32_3 %448 = OpExtInst %1 43 %445 %446 %447 
					                                   f32_4 %449 = OpLoad %116 
					                                   f32_4 %450 = OpVectorShuffle %449 %448 4 5 6 3 
					                                                  OpStore %116 %450 
					                             Output f32* %451 = OpAccessChain %234 %192 %20 
					                                     f32 %452 = OpLoad %451 
					                                     f32 %453 = OpFNegate %452 
					                             Output f32* %454 = OpAccessChain %234 %192 %20 
					                                                  OpStore %454 %453 
					                                                  OpReturn
					                                                  OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 72
					; Schema: 0
					                              OpCapability Shader 
					                       %1 = OpExtInstImport "GLSL.std.450" 
					                              OpMemoryModel Logical GLSL450 
					                              OpEntryPoint Fragment %4 "main" %11 %54 %58 
					                              OpExecutionMode %4 OriginUpperLeft 
					                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                              OpDecorate vs_TEXCOORD0 Location 11 
					                              OpDecorate %54 Location 54 
					                              OpDecorate %58 Location 58 
					                       %2 = OpTypeVoid 
					                       %3 = OpTypeFunction %2 
					                       %6 = OpTypeFloat 32 
					                       %7 = OpTypeVector %6 2 
					                       %8 = OpTypePointer Private %7 
					        Private f32_2* %9 = OpVariable Private 
					                      %10 = OpTypePointer Input %7 
					Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                  f32 %15 = OpConstant 3,674022E-40 
					                f32_2 %16 = OpConstantComposite %15 %15 
					                      %21 = OpTypeInt 32 0 
					                  u32 %22 = OpConstant 0 
					                      %23 = OpTypePointer Private %6 
					         Private f32* %29 = OpVariable Private 
					                  f32 %32 = OpConstant 3,674022E-40 
					                  f32 %34 = OpConstant 3,674022E-40 
					                  f32 %38 = OpConstant 3,674022E-40 
					                  f32 %45 = OpConstant 3,674022E-40 
					                      %52 = OpTypeVector %6 4 
					                      %53 = OpTypePointer Output %52 
					        Output f32_4* %54 = OpVariable Output 
					                      %57 = OpTypePointer Input %52 
					         Input f32_4* %58 = OpVariable Input 
					                  u32 %59 = OpConstant 3 
					                      %60 = OpTypePointer Input %6 
					                      %64 = OpTypePointer Output %6 
					                      %66 = OpTypeVector %6 3 
					                  void %4 = OpFunction None %3 
					                       %5 = OpLabel 
					                f32_2 %12 = OpLoad vs_TEXCOORD0 
					                f32_2 %13 = OpExtInst %1 10 %12 
					                              OpStore %9 %13 
					                f32_2 %14 = OpLoad %9 
					                f32_2 %17 = OpFAdd %14 %16 
					                              OpStore %9 %17 
					                f32_2 %18 = OpLoad %9 
					                f32_2 %19 = OpLoad %9 
					                  f32 %20 = OpDot %18 %19 
					         Private f32* %24 = OpAccessChain %9 %22 
					                              OpStore %24 %20 
					         Private f32* %25 = OpAccessChain %9 %22 
					                  f32 %26 = OpLoad %25 
					                  f32 %27 = OpExtInst %1 31 %26 
					         Private f32* %28 = OpAccessChain %9 %22 
					                              OpStore %28 %27 
					         Private f32* %30 = OpAccessChain %9 %22 
					                  f32 %31 = OpLoad %30 
					                  f32 %33 = OpFMul %31 %32 
					                  f32 %35 = OpFAdd %33 %34 
					                              OpStore %29 %35 
					         Private f32* %36 = OpAccessChain %9 %22 
					                  f32 %37 = OpLoad %36 
					                  f32 %39 = OpFMul %37 %38 
					         Private f32* %40 = OpAccessChain %9 %22 
					                              OpStore %40 %39 
					         Private f32* %41 = OpAccessChain %9 %22 
					                  f32 %42 = OpLoad %41 
					                  f32 %43 = OpLoad %29 
					                  f32 %44 = OpFMul %42 %43 
					                  f32 %46 = OpFAdd %44 %45 
					                              OpStore %29 %46 
					                  f32 %47 = OpLoad %29 
					         Private f32* %48 = OpAccessChain %9 %22 
					                  f32 %49 = OpLoad %48 
					                  f32 %50 = OpFMul %47 %49 
					         Private f32* %51 = OpAccessChain %9 %22 
					                              OpStore %51 %50 
					         Private f32* %55 = OpAccessChain %9 %22 
					                  f32 %56 = OpLoad %55 
					           Input f32* %61 = OpAccessChain %58 %59 
					                  f32 %62 = OpLoad %61 
					                  f32 %63 = OpFMul %56 %62 
					          Output f32* %65 = OpAccessChain %54 %59 
					                              OpStore %65 %63 
					                f32_4 %67 = OpLoad %58 
					                f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                f32_4 %69 = OpLoad %54 
					                f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
					                              OpStore %54 %70 
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
					
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0.xy = fract(vs_TEXCOORD0.xy);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat1 = u_xlat0.x * 0.431833118 + 0.682171106;
					    u_xlat0.x = u_xlat0.x * 1.41442716;
					    u_xlat1 = u_xlat0.x * u_xlat1 + 0.0125228781;
					    u_xlat0.x = u_xlat1 * u_xlat0.x;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    SV_Target0.xyz = vs_COLOR0.xyz;
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