Shader "Hidden/Post FX/Motion Blur" {
	Properties {
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 42792
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
					uniform 	vec4 unity_OrthoParams;
					uniform 	vec4 _CameraMotionVectorsTexture_TexelSize;
					uniform 	float _VelocityScale;
					uniform 	float _RcpMaxBlurRadius;
					UNITY_LOCATION(0) uniform  sampler2D _CameraMotionVectorsTexture;
					UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.x = _VelocityScale * 0.5;
					    u_xlat0.xy = u_xlat0.xx * _CameraMotionVectorsTexture_TexelSize.zw;
					    u_xlat10_1 = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat10_1.xy;
					    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat4 = sqrt(u_xlat4);
					    u_xlat4 = u_xlat4 * _RcpMaxBlurRadius;
					    u_xlat4 = max(u_xlat4, 1.0);
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_RcpMaxBlurRadius, _RcpMaxBlurRadius)) + vec2(1.0, 1.0);
					    SV_Target0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat0.x = (-unity_OrthoParams.w) + 1.0;
					    u_xlat10_1 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat10_1.x * _ZBufferParams.x;
					    u_xlat0.x = u_xlat0.x * u_xlat2 + _ZBufferParams.y;
					    u_xlat2 = (-unity_OrthoParams.w) * u_xlat2 + 1.0;
					    SV_Target0.z = u_xlat2 / u_xlat0.x;
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
					; Bound: 142
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %48 %139 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %10 0 Offset 10 
					                                                      OpMemberDecorate %10 1 Offset 10 
					                                                      OpMemberDecorate %10 2 Offset 10 
					                                                      OpMemberDecorate %10 3 Offset 10 
					                                                      OpMemberDecorate %10 4 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate %36 RelaxedPrecision 
					                                                      OpDecorate %39 RelaxedPrecision 
					                                                      OpDecorate %39 DescriptorSet 39 
					                                                      OpDecorate %39 Binding 39 
					                                                      OpDecorate %40 RelaxedPrecision 
					                                                      OpDecorate %43 RelaxedPrecision 
					                                                      OpDecorate %43 DescriptorSet 43 
					                                                      OpDecorate %43 Binding 43 
					                                                      OpDecorate %44 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 48 
					                                                      OpDecorate %51 RelaxedPrecision 
					                                                      OpDecorate %54 RelaxedPrecision 
					                                                      OpDecorate %105 DescriptorSet 105 
					                                                      OpDecorate %105 Binding 105 
					                                                      OpDecorate %107 DescriptorSet 107 
					                                                      OpDecorate %107 Binding 107 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %139 Location 139 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %7 %7 %7 %6 %6 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32_4; f32_4; f32_4; f32; f32;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 3 
					                                              %15 = OpTypePointer Uniform %6 
					                                          f32 %18 = OpConstant 3,674022E-40 
					                                              %20 = OpTypeInt 32 0 
					                                          u32 %21 = OpConstant 0 
					                                              %22 = OpTypePointer Private %6 
					                                              %24 = OpTypeVector %6 2 
					                                          i32 %27 = OpConstant 2 
					                                              %28 = OpTypePointer Uniform %7 
					                                              %35 = OpTypePointer Private %24 
					                               Private f32_2* %36 = OpVariable Private 
					                                              %37 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %38 = OpTypePointer UniformConstant %37 
					         UniformConstant read_only Texture2D* %39 = OpVariable UniformConstant 
					                                              %41 = OpTypeSampler 
					                                              %42 = OpTypePointer UniformConstant %41 
					                     UniformConstant sampler* %43 = OpVariable UniformConstant 
					                                              %45 = OpTypeSampledImage %37 
					                                              %47 = OpTypePointer Input %24 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 Private f32* %58 = OpVariable Private 
					                                          i32 %67 = OpConstant 4 
					                                          f32 %72 = OpConstant 3,674022E-40 
					                                        f32_2 %87 = OpConstantComposite %72 %72 
					                                        f32_2 %93 = OpConstantComposite %18 %18 
					                                 Private f32* %97 = OpVariable Private 
					                                          i32 %98 = OpConstant 1 
					                                          u32 %99 = OpConstant 3 
					                                Private f32* %104 = OpVariable Private 
					        UniformConstant read_only Texture2D* %105 = OpVariable UniformConstant 
					                    UniformConstant sampler* %107 = OpVariable UniformConstant 
					                                         i32 %114 = OpConstant 0 
					                                         u32 %121 = OpConstant 1 
					                                         u32 %134 = OpConstant 2 
					                                         f32 %136 = OpConstant 3,674022E-40 
					                                             %138 = OpTypePointer Output %7 
					                               Output f32_4* %139 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                          f32 %19 = OpFMul %17 %18 
					                                 Private f32* %23 = OpAccessChain %9 %21 
					                                                      OpStore %23 %19 
					                                        f32_4 %25 = OpLoad %9 
					                                        f32_2 %26 = OpVectorShuffle %25 %25 0 0 
					                               Uniform f32_4* %29 = OpAccessChain %12 %27 
					                                        f32_4 %30 = OpLoad %29 
					                                        f32_2 %31 = OpVectorShuffle %30 %30 2 3 
					                                        f32_2 %32 = OpFMul %26 %31 
					                                        f32_4 %33 = OpLoad %9 
					                                        f32_4 %34 = OpVectorShuffle %33 %32 4 5 2 3 
					                                                      OpStore %9 %34 
					                          read_only Texture2D %40 = OpLoad %39 
					                                      sampler %44 = OpLoad %43 
					                   read_only Texture2DSampled %46 = OpSampledImage %40 %44 
					                                        f32_2 %49 = OpLoad vs_TEXCOORD0 
					                                        f32_4 %50 = OpImageSampleImplicitLod %46 %49 
					                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
					                                                      OpStore %36 %51 
					                                        f32_4 %52 = OpLoad %9 
					                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
					                                        f32_2 %54 = OpLoad %36 
					                                        f32_2 %55 = OpFMul %53 %54 
					                                        f32_4 %56 = OpLoad %9 
					                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
					                                                      OpStore %9 %57 
					                                        f32_4 %59 = OpLoad %9 
					                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
					                                        f32_4 %61 = OpLoad %9 
					                                        f32_2 %62 = OpVectorShuffle %61 %61 0 1 
					                                          f32 %63 = OpDot %60 %62 
					                                                      OpStore %58 %63 
					                                          f32 %64 = OpLoad %58 
					                                          f32 %65 = OpExtInst %1 31 %64 
					                                                      OpStore %58 %65 
					                                          f32 %66 = OpLoad %58 
					                                 Uniform f32* %68 = OpAccessChain %12 %67 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpFMul %66 %69 
					                                                      OpStore %58 %70 
					                                          f32 %71 = OpLoad %58 
					                                          f32 %73 = OpExtInst %1 40 %71 %72 
					                                                      OpStore %58 %73 
					                                        f32_4 %74 = OpLoad %9 
					                                        f32_2 %75 = OpVectorShuffle %74 %74 0 1 
					                                          f32 %76 = OpLoad %58 
					                                        f32_2 %77 = OpCompositeConstruct %76 %76 
					                                        f32_2 %78 = OpFDiv %75 %77 
					                                        f32_4 %79 = OpLoad %9 
					                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 2 3 
					                                                      OpStore %9 %80 
					                                        f32_4 %81 = OpLoad %9 
					                                        f32_2 %82 = OpVectorShuffle %81 %81 0 1 
					                                 Uniform f32* %83 = OpAccessChain %12 %67 
					                                          f32 %84 = OpLoad %83 
					                                        f32_2 %85 = OpCompositeConstruct %84 %84 
					                                        f32_2 %86 = OpFMul %82 %85 
					                                        f32_2 %88 = OpFAdd %86 %87 
					                                        f32_4 %89 = OpLoad %9 
					                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
					                                                      OpStore %9 %90 
					                                        f32_4 %91 = OpLoad %9 
					                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
					                                        f32_2 %94 = OpFMul %92 %93 
					                                        f32_4 %95 = OpLoad %9 
					                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 3 
					                                                      OpStore %9 %96 
					                                Uniform f32* %100 = OpAccessChain %12 %98 %99 
					                                         f32 %101 = OpLoad %100 
					                                         f32 %102 = OpFNegate %101 
					                                         f32 %103 = OpFAdd %102 %72 
					                                                      OpStore %97 %103 
					                         read_only Texture2D %106 = OpLoad %105 
					                                     sampler %108 = OpLoad %107 
					                  read_only Texture2DSampled %109 = OpSampledImage %106 %108 
					                                       f32_2 %110 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %111 = OpImageSampleImplicitLod %109 %110 
					                                         f32 %112 = OpCompositeExtract %111 0 
					                                                      OpStore %104 %112 
					                                         f32 %113 = OpLoad %104 
					                                Uniform f32* %115 = OpAccessChain %12 %114 %21 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFMul %113 %116 
					                                                      OpStore %104 %117 
					                                         f32 %118 = OpLoad %97 
					                                         f32 %119 = OpLoad %104 
					                                         f32 %120 = OpFMul %118 %119 
					                                Uniform f32* %122 = OpAccessChain %12 %114 %121 
					                                         f32 %123 = OpLoad %122 
					                                         f32 %124 = OpFAdd %120 %123 
					                                                      OpStore %97 %124 
					                                Uniform f32* %125 = OpAccessChain %12 %98 %99 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpFNegate %126 
					                                         f32 %128 = OpLoad %104 
					                                         f32 %129 = OpFMul %127 %128 
					                                         f32 %130 = OpFAdd %129 %72 
					                                                      OpStore %104 %130 
					                                         f32 %131 = OpLoad %104 
					                                         f32 %132 = OpLoad %97 
					                                         f32 %133 = OpFDiv %131 %132 
					                                Private f32* %135 = OpAccessChain %9 %134 
					                                                      OpStore %135 %133 
					                                Private f32* %137 = OpAccessChain %9 %99 
					                                                      OpStore %137 %136 
					                                       f32_4 %140 = OpLoad %9 
					                                                      OpStore %139 %140 
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
						vec4 _CameraMotionVectorsTexture_TexelSize;
						vec4 unused_0_2;
						float _VelocityScale;
						vec4 unused_0_4;
						float _RcpMaxBlurRadius;
						vec4 unused_0_6;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unity_OrthoParams;
					};
					uniform  sampler2D _CameraMotionVectorsTexture;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.x = _VelocityScale * 0.5;
					    u_xlat0.xy = u_xlat0.xx * _CameraMotionVectorsTexture_TexelSize.zw;
					    u_xlat10_1 = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat10_1.xy;
					    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat4 = sqrt(u_xlat4);
					    u_xlat4 = u_xlat4 * unused_0_4.y;
					    u_xlat4 = max(u_xlat4, 1.0);
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
					    u_xlat0.xy = u_xlat0.xy * unused_0_4.yy + vec2(1.0, 1.0);
					    SV_Target0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat0.x = (-unity_OrthoParams.w) + 1.0;
					    u_xlat10_1 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat10_1.x * _ZBufferParams.x;
					    u_xlat0.x = u_xlat0.x * u_xlat2 + _ZBufferParams.y;
					    u_xlat2 = (-unity_OrthoParams.w) * u_xlat2 + 1.0;
					    SV_Target0.z = u_xlat2 / u_xlat0.x;
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
			GpuProgramID 71108
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	float _MaxBlurRadius;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat10_2;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.zw = u_xlat10_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0 = u_xlat0 * vec4(_MaxBlurRadius);
					    u_xlat1.x = dot(u_xlat0.zw, u_xlat0.zw);
					    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlatb1 = u_xlat1.x<u_xlat4;
					    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xy : u_xlat0.zw;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat1.xy = u_xlat10_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.zw = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1 = u_xlat1 * vec4(_MaxBlurRadius);
					    u_xlat9 = dot(u_xlat1.zw, u_xlat1.zw);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat1.zw : u_xlat0.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    SV_Target0.xy = (bool(u_xlatb6)) ? u_xlat1.xy : u_xlat0.xy;
					    SV_Target0.zw = vec2(0.0, 0.0);
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
					; Bound: 207
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %25 %189 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpMemberDecorate %10 1 RelaxedPrecision 
					                                             OpMemberDecorate %10 1 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD0 Location 25 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %33 DescriptorSet 33 
					                                             OpDecorate %33 Binding 33 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %37 RelaxedPrecision 
					                                             OpDecorate %37 DescriptorSet 37 
					                                             OpDecorate %37 Binding 37 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
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
					                                             OpDecorate %167 RelaxedPrecision 
					                                             OpDecorate %168 RelaxedPrecision 
					                                             OpDecorate %170 RelaxedPrecision 
					                                             OpDecorate %171 RelaxedPrecision 
					                                             OpDecorate %172 RelaxedPrecision 
					                                             OpDecorate %175 RelaxedPrecision 
					                                             OpDecorate %176 RelaxedPrecision 
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
					                                             OpDecorate %189 RelaxedPrecision 
					                                             OpDecorate %189 Location 189 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %195 RelaxedPrecision 
					                                             OpDecorate %197 RelaxedPrecision 
					                                             OpDecorate %198 RelaxedPrecision 
					                                             OpDecorate %199 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeStruct %7 %6 
					                                     %11 = OpTypePointer Uniform %10 
					       Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 0 
					                                     %15 = OpTypePointer Uniform %7 
					                                 f32 %19 = OpConstant 3,674022E-40 
					                                 f32 %20 = OpConstant 3,674022E-40 
					                               f32_4 %21 = OpConstantComposite %19 %19 %20 %19 
					                                     %23 = OpTypeVector %6 2 
					                                     %24 = OpTypePointer Input %23 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %29 = OpTypePointer Private %23 
					                      Private f32_2* %30 = OpVariable Private 
					                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %32 = OpTypePointer UniformConstant %31 
					UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
					                                     %35 = OpTypeSampler 
					                                     %36 = OpTypePointer UniformConstant %35 
					            UniformConstant sampler* %37 = OpVariable UniformConstant 
					                                     %39 = OpTypeSampledImage %31 
					                      Private f32_2* %45 = OpVariable Private 
					                      Private f32_4* %53 = OpVariable Private 
					                                 f32 %55 = OpConstant 3,674022E-40 
					                               f32_2 %56 = OpConstantComposite %55 %55 
					                                 f32 %58 = OpConstant 3,674022E-40 
					                               f32_2 %59 = OpConstantComposite %58 %58 
					                                 i32 %69 = OpConstant 1 
					                                     %70 = OpTypePointer Uniform %6 
					                      Private f32_4* %75 = OpVariable Private 
					                                     %81 = OpTypeInt 32 0 
					                                 u32 %82 = OpConstant 0 
					                                     %83 = OpTypePointer Private %6 
					                        Private f32* %85 = OpVariable Private 
					                                     %91 = OpTypeBool 
					                                     %92 = OpTypePointer Private %91 
					                       Private bool* %93 = OpVariable Private 
					                                     %99 = OpTypePointer Function %23 
					                       Private f32* %111 = OpVariable Private 
					                              f32_4 %120 = OpConstantComposite %19 %20 %20 %20 
					                       Private f32* %154 = OpVariable Private 
					                                    %188 = OpTypePointer Output %7 
					                      Output f32_4* %189 = OpVariable Output 
					                                f32 %202 = OpConstant 3,674022E-40 
					                              f32_2 %203 = OpConstantComposite %202 %202 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                    Function f32_2* %100 = OpVariable Function 
					                    Function f32_2* %164 = OpVariable Function 
					                    Function f32_2* %191 = OpVariable Function 
					                      Uniform f32_4* %16 = OpAccessChain %12 %14 
					                               f32_4 %17 = OpLoad %16 
					                               f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
					                               f32_4 %22 = OpFMul %18 %21 
					                               f32_2 %26 = OpLoad vs_TEXCOORD0 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                               f32_4 %28 = OpFAdd %22 %27 
					                                             OpStore %9 %28 
					                 read_only Texture2D %34 = OpLoad %33 
					                             sampler %38 = OpLoad %37 
					          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
					                               f32_4 %41 = OpLoad %9 
					                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                               f32_4 %43 = OpImageSampleImplicitLod %40 %42 
					                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
					                                             OpStore %30 %44 
					                 read_only Texture2D %46 = OpLoad %33 
					                             sampler %47 = OpLoad %37 
					          read_only Texture2DSampled %48 = OpSampledImage %46 %47 
					                               f32_4 %49 = OpLoad %9 
					                               f32_2 %50 = OpVectorShuffle %49 %49 2 3 
					                               f32_4 %51 = OpImageSampleImplicitLod %48 %50 
					                               f32_2 %52 = OpVectorShuffle %51 %51 0 1 
					                                             OpStore %45 %52 
					                               f32_2 %54 = OpLoad %45 
					                               f32_2 %57 = OpFMul %54 %56 
					                               f32_2 %60 = OpFAdd %57 %59 
					                               f32_4 %61 = OpLoad %53 
					                               f32_4 %62 = OpVectorShuffle %61 %60 4 5 2 3 
					                                             OpStore %53 %62 
					                               f32_2 %63 = OpLoad %30 
					                               f32_2 %64 = OpFMul %63 %56 
					                               f32_2 %65 = OpFAdd %64 %59 
					                               f32_4 %66 = OpLoad %53 
					                               f32_4 %67 = OpVectorShuffle %66 %65 0 1 4 5 
					                                             OpStore %53 %67 
					                               f32_4 %68 = OpLoad %53 
					                        Uniform f32* %71 = OpAccessChain %12 %69 
					                                 f32 %72 = OpLoad %71 
					                               f32_4 %73 = OpCompositeConstruct %72 %72 %72 %72 
					                               f32_4 %74 = OpFMul %68 %73 
					                                             OpStore %53 %74 
					                               f32_4 %76 = OpLoad %53 
					                               f32_2 %77 = OpVectorShuffle %76 %76 2 3 
					                               f32_4 %78 = OpLoad %53 
					                               f32_2 %79 = OpVectorShuffle %78 %78 2 3 
					                                 f32 %80 = OpDot %77 %79 
					                        Private f32* %84 = OpAccessChain %75 %82 
					                                             OpStore %84 %80 
					                               f32_4 %86 = OpLoad %53 
					                               f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                               f32_4 %88 = OpLoad %53 
					                               f32_2 %89 = OpVectorShuffle %88 %88 0 1 
					                                 f32 %90 = OpDot %87 %89 
					                                             OpStore %85 %90 
					                        Private f32* %94 = OpAccessChain %75 %82 
					                                 f32 %95 = OpLoad %94 
					                                 f32 %96 = OpLoad %85 
					                                bool %97 = OpFOrdLessThan %95 %96 
					                                             OpStore %93 %97 
					                                bool %98 = OpLoad %93 
					                                             OpSelectionMerge %102 None 
					                                             OpBranchConditional %98 %101 %105 
					                                    %101 = OpLabel 
					                              f32_4 %103 = OpLoad %53 
					                              f32_2 %104 = OpVectorShuffle %103 %103 0 1 
					                                             OpStore %100 %104 
					                                             OpBranch %102 
					                                    %105 = OpLabel 
					                              f32_4 %106 = OpLoad %53 
					                              f32_2 %107 = OpVectorShuffle %106 %106 2 3 
					                                             OpStore %100 %107 
					                                             OpBranch %102 
					                                    %102 = OpLabel 
					                              f32_2 %108 = OpLoad %100 
					                              f32_4 %109 = OpLoad %53 
					                              f32_4 %110 = OpVectorShuffle %109 %108 4 5 2 3 
					                                             OpStore %53 %110 
					                              f32_4 %112 = OpLoad %53 
					                              f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                              f32_4 %114 = OpLoad %53 
					                              f32_2 %115 = OpVectorShuffle %114 %114 0 1 
					                                f32 %116 = OpDot %113 %115 
					                                             OpStore %111 %116 
					                     Uniform f32_4* %117 = OpAccessChain %12 %14 
					                              f32_4 %118 = OpLoad %117 
					                              f32_4 %119 = OpVectorShuffle %118 %118 0 1 0 1 
					                              f32_4 %121 = OpFMul %119 %120 
					                              f32_2 %122 = OpLoad vs_TEXCOORD0 
					                              f32_4 %123 = OpVectorShuffle %122 %122 0 1 0 1 
					                              f32_4 %124 = OpFAdd %121 %123 
					                                             OpStore %9 %124 
					                read_only Texture2D %125 = OpLoad %33 
					                            sampler %126 = OpLoad %37 
					         read_only Texture2DSampled %127 = OpSampledImage %125 %126 
					                              f32_4 %128 = OpLoad %9 
					                              f32_2 %129 = OpVectorShuffle %128 %128 0 1 
					                              f32_4 %130 = OpImageSampleImplicitLod %127 %129 
					                              f32_2 %131 = OpVectorShuffle %130 %130 0 1 
					                                             OpStore %30 %131 
					                read_only Texture2D %132 = OpLoad %33 
					                            sampler %133 = OpLoad %37 
					         read_only Texture2DSampled %134 = OpSampledImage %132 %133 
					                              f32_4 %135 = OpLoad %9 
					                              f32_2 %136 = OpVectorShuffle %135 %135 2 3 
					                              f32_4 %137 = OpImageSampleImplicitLod %134 %136 
					                              f32_2 %138 = OpVectorShuffle %137 %137 0 1 
					                                             OpStore %45 %138 
					                              f32_2 %139 = OpLoad %45 
					                              f32_2 %140 = OpFMul %139 %56 
					                              f32_2 %141 = OpFAdd %140 %59 
					                              f32_4 %142 = OpLoad %75 
					                              f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
					                                             OpStore %75 %143 
					                              f32_2 %144 = OpLoad %30 
					                              f32_2 %145 = OpFMul %144 %56 
					                              f32_2 %146 = OpFAdd %145 %59 
					                              f32_4 %147 = OpLoad %75 
					                              f32_4 %148 = OpVectorShuffle %147 %146 0 1 4 5 
					                                             OpStore %75 %148 
					                              f32_4 %149 = OpLoad %75 
					                       Uniform f32* %150 = OpAccessChain %12 %69 
					                                f32 %151 = OpLoad %150 
					                              f32_4 %152 = OpCompositeConstruct %151 %151 %151 %151 
					                              f32_4 %153 = OpFMul %149 %152 
					                                             OpStore %75 %153 
					                              f32_4 %155 = OpLoad %75 
					                              f32_2 %156 = OpVectorShuffle %155 %155 2 3 
					                              f32_4 %157 = OpLoad %75 
					                              f32_2 %158 = OpVectorShuffle %157 %157 2 3 
					                                f32 %159 = OpDot %156 %158 
					                                             OpStore %154 %159 
					                                f32 %160 = OpLoad %111 
					                                f32 %161 = OpLoad %154 
					                               bool %162 = OpFOrdLessThan %160 %161 
					                                             OpStore %93 %162 
					                               bool %163 = OpLoad %93 
					                                             OpSelectionMerge %166 None 
					                                             OpBranchConditional %163 %165 %169 
					                                    %165 = OpLabel 
					                              f32_4 %167 = OpLoad %75 
					                              f32_2 %168 = OpVectorShuffle %167 %167 2 3 
					                                             OpStore %164 %168 
					                                             OpBranch %166 
					                                    %169 = OpLabel 
					                              f32_4 %170 = OpLoad %53 
					                              f32_2 %171 = OpVectorShuffle %170 %170 0 1 
					                                             OpStore %164 %171 
					                                             OpBranch %166 
					                                    %166 = OpLabel 
					                              f32_2 %172 = OpLoad %164 
					                              f32_4 %173 = OpLoad %53 
					                              f32_4 %174 = OpVectorShuffle %173 %172 4 5 2 3 
					                                             OpStore %53 %174 
					                              f32_4 %175 = OpLoad %53 
					                              f32_2 %176 = OpVectorShuffle %175 %175 0 1 
					                              f32_4 %177 = OpLoad %53 
					                              f32_2 %178 = OpVectorShuffle %177 %177 0 1 
					                                f32 %179 = OpDot %176 %178 
					                                             OpStore %111 %179 
					                              f32_4 %180 = OpLoad %75 
					                              f32_2 %181 = OpVectorShuffle %180 %180 0 1 
					                              f32_4 %182 = OpLoad %75 
					                              f32_2 %183 = OpVectorShuffle %182 %182 0 1 
					                                f32 %184 = OpDot %181 %183 
					                                             OpStore %154 %184 
					                                f32 %185 = OpLoad %111 
					                                f32 %186 = OpLoad %154 
					                               bool %187 = OpFOrdLessThan %185 %186 
					                                             OpStore %93 %187 
					                               bool %190 = OpLoad %93 
					                                             OpSelectionMerge %193 None 
					                                             OpBranchConditional %190 %192 %196 
					                                    %192 = OpLabel 
					                              f32_4 %194 = OpLoad %75 
					                              f32_2 %195 = OpVectorShuffle %194 %194 0 1 
					                                             OpStore %191 %195 
					                                             OpBranch %193 
					                                    %196 = OpLabel 
					                              f32_4 %197 = OpLoad %53 
					                              f32_2 %198 = OpVectorShuffle %197 %197 0 1 
					                                             OpStore %191 %198 
					                                             OpBranch %193 
					                                    %193 = OpLabel 
					                              f32_2 %199 = OpLoad %191 
					                              f32_4 %200 = OpLoad %189 
					                              f32_4 %201 = OpVectorShuffle %200 %199 4 5 2 3 
					                                             OpStore %189 %201 
					                              f32_4 %204 = OpLoad %189 
					                              f32_4 %205 = OpVectorShuffle %204 %203 0 1 4 5 
					                                             OpStore %189 %205 
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
						vec4 unused_0_2[4];
						float _MaxBlurRadius;
						vec4 unused_0_4;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat10_2;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.zw = u_xlat10_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0 = u_xlat0 * vec4(_MaxBlurRadius);
					    u_xlat1.x = dot(u_xlat0.zw, u_xlat0.zw);
					    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlatb1 = u_xlat1.x<u_xlat4;
					    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xy : u_xlat0.zw;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat1.xy = u_xlat10_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.zw = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1 = u_xlat1 * vec4(_MaxBlurRadius);
					    u_xlat9 = dot(u_xlat1.zw, u_xlat1.zw);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat1.zw : u_xlat0.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    SV_Target0.xy = (bool(u_xlatb6)) ? u_xlat1.xy : u_xlat0.xy;
					    SV_Target0.zw = vec2(0.0, 0.0);
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
			GpuProgramID 175366
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
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat6 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlat9 = dot(u_xlat10_0.xy, u_xlat10_0.xy);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat10_0.xy : u_xlat10_1.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat9 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat10_2.xy : u_xlat0.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    SV_Target0.xy = (bool(u_xlatb6)) ? u_xlat10_1.xy : u_xlat0.xy;
					    SV_Target0.zw = vec2(0.0, 0.0);
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
					; Bound: 158
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %25 %142 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD0 Location 25 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %31 DescriptorSet 31 
					                                             OpDecorate %31 Binding 31 
					                                             OpDecorate %32 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %35 DescriptorSet 35 
					                                             OpDecorate %35 Binding 35 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %142 Location 142 
					                                             OpDecorate %149 RelaxedPrecision 
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
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %29 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %30 = OpTypePointer UniformConstant %29 
					UniformConstant read_only Texture2D* %31 = OpVariable UniformConstant 
					                                     %33 = OpTypeSampler 
					                                     %34 = OpTypePointer UniformConstant %33 
					            UniformConstant sampler* %35 = OpVariable UniformConstant 
					                                     %37 = OpTypeSampledImage %29 
					                                     %45 = OpTypePointer Private %23 
					                      Private f32_2* %46 = OpVariable Private 
					                      Private f32_2* %54 = OpVariable Private 
					                                     %60 = OpTypeInt 32 0 
					                                 u32 %61 = OpConstant 0 
					                                     %62 = OpTypePointer Private %6 
					                        Private f32* %64 = OpVariable Private 
					                                     %68 = OpTypeBool 
					                                     %69 = OpTypePointer Private %68 
					                       Private bool* %70 = OpVariable Private 
					                                     %76 = OpTypePointer Function %23 
					                        Private f32* %85 = OpVariable Private 
					                               f32_4 %92 = OpConstantComposite %19 %20 %20 %20 
					                       Private f32* %113 = OpVariable Private 
					                      Private bool* %137 = OpVariable Private 
					                                    %141 = OpTypePointer Output %7 
					                      Output f32_4* %142 = OpVariable Output 
					                                f32 %153 = OpConstant 3,674022E-40 
					                              f32_2 %154 = OpConstantComposite %153 %153 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                     Function f32_2* %77 = OpVariable Function 
					                    Function f32_2* %123 = OpVariable Function 
					                    Function f32_2* %144 = OpVariable Function 
					                      Uniform f32_4* %16 = OpAccessChain %12 %14 
					                               f32_4 %17 = OpLoad %16 
					                               f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
					                               f32_4 %22 = OpFMul %18 %21 
					                               f32_2 %26 = OpLoad vs_TEXCOORD0 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                               f32_4 %28 = OpFAdd %22 %27 
					                                             OpStore %9 %28 
					                 read_only Texture2D %32 = OpLoad %31 
					                             sampler %36 = OpLoad %35 
					          read_only Texture2DSampled %38 = OpSampledImage %32 %36 
					                               f32_4 %39 = OpLoad %9 
					                               f32_2 %40 = OpVectorShuffle %39 %39 0 1 
					                               f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                               f32_4 %43 = OpLoad %9 
					                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
					                                             OpStore %9 %44 
					                 read_only Texture2D %47 = OpLoad %31 
					                             sampler %48 = OpLoad %35 
					          read_only Texture2DSampled %49 = OpSampledImage %47 %48 
					                               f32_4 %50 = OpLoad %9 
					                               f32_2 %51 = OpVectorShuffle %50 %50 2 3 
					                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
					                               f32_2 %53 = OpVectorShuffle %52 %52 0 1 
					                                             OpStore %46 %53 
					                               f32_4 %55 = OpLoad %9 
					                               f32_2 %56 = OpVectorShuffle %55 %55 0 1 
					                               f32_4 %57 = OpLoad %9 
					                               f32_2 %58 = OpVectorShuffle %57 %57 0 1 
					                                 f32 %59 = OpDot %56 %58 
					                        Private f32* %63 = OpAccessChain %54 %61 
					                                             OpStore %63 %59 
					                               f32_2 %65 = OpLoad %46 
					                               f32_2 %66 = OpLoad %46 
					                                 f32 %67 = OpDot %65 %66 
					                                             OpStore %64 %67 
					                        Private f32* %71 = OpAccessChain %54 %61 
					                                 f32 %72 = OpLoad %71 
					                                 f32 %73 = OpLoad %64 
					                                bool %74 = OpFOrdLessThan %72 %73 
					                                             OpStore %70 %74 
					                                bool %75 = OpLoad %70 
					                                             OpSelectionMerge %79 None 
					                                             OpBranchConditional %75 %78 %81 
					                                     %78 = OpLabel 
					                               f32_2 %80 = OpLoad %46 
					                                             OpStore %77 %80 
					                                             OpBranch %79 
					                                     %81 = OpLabel 
					                               f32_4 %82 = OpLoad %9 
					                               f32_2 %83 = OpVectorShuffle %82 %82 0 1 
					                                             OpStore %77 %83 
					                                             OpBranch %79 
					                                     %79 = OpLabel 
					                               f32_2 %84 = OpLoad %77 
					                                             OpStore %54 %84 
					                               f32_2 %86 = OpLoad %54 
					                               f32_2 %87 = OpLoad %54 
					                                 f32 %88 = OpDot %86 %87 
					                                             OpStore %85 %88 
					                      Uniform f32_4* %89 = OpAccessChain %12 %14 
					                               f32_4 %90 = OpLoad %89 
					                               f32_4 %91 = OpVectorShuffle %90 %90 0 1 0 1 
					                               f32_4 %93 = OpFMul %91 %92 
					                               f32_2 %94 = OpLoad vs_TEXCOORD0 
					                               f32_4 %95 = OpVectorShuffle %94 %94 0 1 0 1 
					                               f32_4 %96 = OpFAdd %93 %95 
					                                             OpStore %9 %96 
					                 read_only Texture2D %97 = OpLoad %31 
					                             sampler %98 = OpLoad %35 
					          read_only Texture2DSampled %99 = OpSampledImage %97 %98 
					                              f32_4 %100 = OpLoad %9 
					                              f32_2 %101 = OpVectorShuffle %100 %100 0 1 
					                              f32_4 %102 = OpImageSampleImplicitLod %99 %101 
					                              f32_2 %103 = OpVectorShuffle %102 %102 0 1 
					                              f32_4 %104 = OpLoad %9 
					                              f32_4 %105 = OpVectorShuffle %104 %103 4 5 2 3 
					                                             OpStore %9 %105 
					                read_only Texture2D %106 = OpLoad %31 
					                            sampler %107 = OpLoad %35 
					         read_only Texture2DSampled %108 = OpSampledImage %106 %107 
					                              f32_4 %109 = OpLoad %9 
					                              f32_2 %110 = OpVectorShuffle %109 %109 2 3 
					                              f32_4 %111 = OpImageSampleImplicitLod %108 %110 
					                              f32_2 %112 = OpVectorShuffle %111 %111 0 1 
					                                             OpStore %46 %112 
					                              f32_4 %114 = OpLoad %9 
					                              f32_2 %115 = OpVectorShuffle %114 %114 0 1 
					                              f32_4 %116 = OpLoad %9 
					                              f32_2 %117 = OpVectorShuffle %116 %116 0 1 
					                                f32 %118 = OpDot %115 %117 
					                                             OpStore %113 %118 
					                                f32 %119 = OpLoad %85 
					                                f32 %120 = OpLoad %113 
					                               bool %121 = OpFOrdLessThan %119 %120 
					                                             OpStore %70 %121 
					                               bool %122 = OpLoad %70 
					                                             OpSelectionMerge %125 None 
					                                             OpBranchConditional %122 %124 %128 
					                                    %124 = OpLabel 
					                              f32_4 %126 = OpLoad %9 
					                              f32_2 %127 = OpVectorShuffle %126 %126 0 1 
					                                             OpStore %123 %127 
					                                             OpBranch %125 
					                                    %128 = OpLabel 
					                              f32_2 %129 = OpLoad %54 
					                                             OpStore %123 %129 
					                                             OpBranch %125 
					                                    %125 = OpLabel 
					                              f32_2 %130 = OpLoad %123 
					                                             OpStore %54 %130 
					                              f32_2 %131 = OpLoad %54 
					                              f32_2 %132 = OpLoad %54 
					                                f32 %133 = OpDot %131 %132 
					                                             OpStore %85 %133 
					                              f32_2 %134 = OpLoad %46 
					                              f32_2 %135 = OpLoad %46 
					                                f32 %136 = OpDot %134 %135 
					                                             OpStore %113 %136 
					                                f32 %138 = OpLoad %85 
					                                f32 %139 = OpLoad %113 
					                               bool %140 = OpFOrdLessThan %138 %139 
					                                             OpStore %137 %140 
					                               bool %143 = OpLoad %137 
					                                             OpSelectionMerge %146 None 
					                                             OpBranchConditional %143 %145 %148 
					                                    %145 = OpLabel 
					                              f32_2 %147 = OpLoad %46 
					                                             OpStore %144 %147 
					                                             OpBranch %146 
					                                    %148 = OpLabel 
					                              f32_2 %149 = OpLoad %54 
					                                             OpStore %144 %149 
					                                             OpBranch %146 
					                                    %146 = OpLabel 
					                              f32_2 %150 = OpLoad %144 
					                              f32_4 %151 = OpLoad %142 
					                              f32_4 %152 = OpVectorShuffle %151 %150 4 5 2 3 
					                                             OpStore %142 %152 
					                              f32_4 %155 = OpLoad %142 
					                              f32_4 %156 = OpVectorShuffle %155 %154 0 1 4 5 
					                                             OpStore %142 %156 
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
						vec4 unused_0_2[6];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat6 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlat9 = dot(u_xlat10_0.xy, u_xlat10_0.xy);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat10_0.xy : u_xlat10_1.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat9 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat10_2.xy : u_xlat0.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlatb6 = u_xlat6<u_xlat9;
					    SV_Target0.xy = (bool(u_xlatb6)) ? u_xlat10_1.xy : u_xlat0.xy;
					    SV_Target0.zw = vec2(0.0, 0.0);
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
			GpuProgramID 233458
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	int _TileMaxLoop;
					uniform 	vec2 _TileMaxOffs;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					int u_xlati2;
					vec2 u_xlat3;
					vec4 u_xlat10_4;
					vec2 u_xlat7;
					bool u_xlatb7;
					vec2 u_xlat10;
					vec2 u_xlat13;
					bool u_xlatb13;
					int u_xlati17;
					float u_xlat18;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_TileMaxOffs.x, _TileMaxOffs.y) + vs_TEXCOORD0.xy;
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.xw = _MainTex_TexelSize.xy;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_TileMaxLoop ; u_xlati_loop_1++)
					    {
					        u_xlat7.x = float(u_xlati_loop_1);
					        u_xlat7.xy = u_xlat1.xy * u_xlat7.xx + u_xlat0.xy;
					        u_xlat3.xy = u_xlat10.xy;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<_TileMaxLoop ; u_xlati_loop_2++)
					        {
					            u_xlat13.x = float(u_xlati_loop_2);
					            u_xlat13.xy = u_xlat1.zw * u_xlat13.xx + u_xlat7.xy;
					            u_xlat10_4 = texture(_MainTex, u_xlat13.xy);
					            u_xlat13.x = dot(u_xlat3.xy, u_xlat3.xy);
					            u_xlat18 = dot(u_xlat10_4.xy, u_xlat10_4.xy);
					            u_xlatb13 = u_xlat13.x<u_xlat18;
					            u_xlat3.xy = (bool(u_xlatb13)) ? u_xlat10_4.xy : u_xlat3.xy;
					        }
					        u_xlat10.xy = u_xlat3.xy;
					    }
					    SV_Target0.xy = u_xlat10.xy;
					    SV_Target0.zw = vec2(0.0, 0.0);
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
					; Bound: 152
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %32 %139 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %12 0 Offset 12 
					                                              OpMemberDecorate %12 1 Offset 12 
					                                              OpMemberDecorate %12 2 Offset 12 
					                                              OpDecorate %12 Block 
					                                              OpDecorate %14 DescriptorSet 14 
					                                              OpDecorate %14 Binding 14 
					                                              OpDecorate vs_TEXCOORD0 Location 32 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %75 RelaxedPrecision 
					                                              OpDecorate %76 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %100 DescriptorSet 100 
					                                              OpDecorate %100 Binding 100 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %104 DescriptorSet 104 
					                                              OpDecorate %104 Binding 104 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 RelaxedPrecision 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %121 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %131 RelaxedPrecision 
					                                              OpDecorate %135 RelaxedPrecision 
					                                              OpDecorate %139 RelaxedPrecision 
					                                              OpDecorate %139 Location 139 
					                                              OpDecorate %140 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 4 
					                                      %11 = OpTypeInt 32 1 
					                                      %12 = OpTypeStruct %10 %11 %7 
					                                      %13 = OpTypePointer Uniform %12 
					 Uniform struct {f32_4; i32; f32_2;}* %14 = OpVariable Uniform 
					                                  i32 %15 = OpConstant 0 
					                                      %16 = OpTypePointer Uniform %10 
					                                  i32 %20 = OpConstant 2 
					                                      %21 = OpTypeInt 32 0 
					                                  u32 %22 = OpConstant 0 
					                                      %23 = OpTypePointer Uniform %6 
					                                  u32 %26 = OpConstant 1 
					                                      %31 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %35 = OpTypePointer Private %10 
					                       Private f32_4* %36 = OpVariable Private 
					                                  f32 %37 = OpConstant 3,674022E-40 
					                                      %38 = OpTypePointer Private %6 
					                                  u32 %40 = OpConstant 2 
					                       Private f32_2* %47 = OpVariable Private 
					                                      %50 = OpTypePointer Function %11 
					                                  i32 %58 = OpConstant 1 
					                                      %59 = OpTypePointer Uniform %11 
					                                      %62 = OpTypeBool 
					                         Private f32* %64 = OpVariable Private 
					                       Private f32_2* %67 = OpVariable Private 
					                       Private f32_2* %75 = OpVariable Private 
					                       Private f32_2* %87 = OpVariable Private 
					                                      %98 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %99 = OpTypePointer UniformConstant %98 
					UniformConstant read_only Texture2D* %100 = OpVariable UniformConstant 
					                                     %102 = OpTypeSampler 
					                                     %103 = OpTypePointer UniformConstant %102 
					            UniformConstant sampler* %104 = OpVariable UniformConstant 
					                                     %106 = OpTypeSampledImage %98 
					                        Private f32* %111 = OpVariable Private 
					                        Private f32* %115 = OpVariable Private 
					                                     %119 = OpTypePointer Private %62 
					                       Private bool* %120 = OpVariable Private 
					                                     %125 = OpTypePointer Function %7 
					                                     %138 = OpTypePointer Output %10 
					                       Output f32_4* %139 = OpVariable Output 
					                               f32_2 %143 = OpConstantComposite %37 %37 
					                                     %147 = OpTypePointer Private %11 
					                        Private i32* %148 = OpVariable Private 
					                       Private bool* %149 = OpVariable Private 
					                        Private i32* %150 = OpVariable Private 
					                       Private bool* %151 = OpVariable Private 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function i32* %51 = OpVariable Function 
					                        Function i32* %77 = OpVariable Function 
					                     Function f32_2* %126 = OpVariable Function 
					                       Uniform f32_4* %17 = OpAccessChain %14 %15 
					                                f32_4 %18 = OpLoad %17 
					                                f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                         Uniform f32* %24 = OpAccessChain %14 %20 %22 
					                                  f32 %25 = OpLoad %24 
					                         Uniform f32* %27 = OpAccessChain %14 %20 %26 
					                                  f32 %28 = OpLoad %27 
					                                f32_2 %29 = OpCompositeConstruct %25 %28 
					                                f32_2 %30 = OpFMul %19 %29 
					                                f32_2 %33 = OpLoad vs_TEXCOORD0 
					                                f32_2 %34 = OpFAdd %30 %33 
					                                              OpStore %9 %34 
					                         Private f32* %39 = OpAccessChain %36 %26 
					                                              OpStore %39 %37 
					                         Private f32* %41 = OpAccessChain %36 %40 
					                                              OpStore %41 %37 
					                       Uniform f32_4* %42 = OpAccessChain %14 %15 
					                                f32_4 %43 = OpLoad %42 
					                                f32_2 %44 = OpVectorShuffle %43 %43 0 1 
					                                f32_4 %45 = OpLoad %36 
					                                f32_4 %46 = OpVectorShuffle %45 %44 4 1 2 5 
					                                              OpStore %36 %46 
					                         Private f32* %48 = OpAccessChain %47 %22 
					                                              OpStore %48 %37 
					                         Private f32* %49 = OpAccessChain %47 %26 
					                                              OpStore %49 %37 
					                                              OpStore %51 %15 
					                                              OpBranch %52 
					                                      %52 = OpLabel 
					                                              OpLoopMerge %54 %55 None 
					                                              OpBranch %56 
					                                      %56 = OpLabel 
					                                  i32 %57 = OpLoad %51 
					                         Uniform i32* %60 = OpAccessChain %14 %58 
					                                  i32 %61 = OpLoad %60 
					                                 bool %63 = OpSLessThan %57 %61 
					                                              OpBranchConditional %63 %53 %54 
					                                      %53 = OpLabel 
					                                  i32 %65 = OpLoad %51 
					                                  f32 %66 = OpConvertSToF %65 
					                                              OpStore %64 %66 
					                                f32_4 %68 = OpLoad %36 
					                                f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                  f32 %70 = OpLoad %64 
					                                f32_2 %71 = OpCompositeConstruct %70 %70 
					                                f32_2 %72 = OpFMul %69 %71 
					                                f32_2 %73 = OpLoad %9 
					                                f32_2 %74 = OpFAdd %72 %73 
					                                              OpStore %67 %74 
					                                f32_2 %76 = OpLoad %47 
					                                              OpStore %75 %76 
					                                              OpStore %77 %15 
					                                              OpBranch %78 
					                                      %78 = OpLabel 
					                                              OpLoopMerge %80 %81 None 
					                                              OpBranch %82 
					                                      %82 = OpLabel 
					                                  i32 %83 = OpLoad %77 
					                         Uniform i32* %84 = OpAccessChain %14 %58 
					                                  i32 %85 = OpLoad %84 
					                                 bool %86 = OpSLessThan %83 %85 
					                                              OpBranchConditional %86 %79 %80 
					                                      %79 = OpLabel 
					                                  i32 %88 = OpLoad %77 
					                                  f32 %89 = OpConvertSToF %88 
					                         Private f32* %90 = OpAccessChain %87 %22 
					                                              OpStore %90 %89 
					                                f32_4 %91 = OpLoad %36 
					                                f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                f32_2 %93 = OpLoad %87 
					                                f32_2 %94 = OpVectorShuffle %93 %93 0 0 
					                                f32_2 %95 = OpFMul %92 %94 
					                                f32_2 %96 = OpLoad %67 
					                                f32_2 %97 = OpFAdd %95 %96 
					                                              OpStore %87 %97 
					                 read_only Texture2D %101 = OpLoad %100 
					                             sampler %105 = OpLoad %104 
					          read_only Texture2DSampled %107 = OpSampledImage %101 %105 
					                               f32_2 %108 = OpLoad %87 
					                               f32_4 %109 = OpImageSampleImplicitLod %107 %108 
					                               f32_2 %110 = OpVectorShuffle %109 %109 0 1 
					                                              OpStore %87 %110 
					                               f32_2 %112 = OpLoad %75 
					                               f32_2 %113 = OpLoad %75 
					                                 f32 %114 = OpDot %112 %113 
					                                              OpStore %111 %114 
					                               f32_2 %116 = OpLoad %87 
					                               f32_2 %117 = OpLoad %87 
					                                 f32 %118 = OpDot %116 %117 
					                                              OpStore %115 %118 
					                                 f32 %121 = OpLoad %111 
					                                 f32 %122 = OpLoad %115 
					                                bool %123 = OpFOrdLessThan %121 %122 
					                                              OpStore %120 %123 
					                                bool %124 = OpLoad %120 
					                                              OpSelectionMerge %128 None 
					                                              OpBranchConditional %124 %127 %130 
					                                     %127 = OpLabel 
					                               f32_2 %129 = OpLoad %87 
					                                              OpStore %126 %129 
					                                              OpBranch %128 
					                                     %130 = OpLabel 
					                               f32_2 %131 = OpLoad %75 
					                                              OpStore %126 %131 
					                                              OpBranch %128 
					                                     %128 = OpLabel 
					                               f32_2 %132 = OpLoad %126 
					                                              OpStore %75 %132 
					                                              OpBranch %81 
					                                      %81 = OpLabel 
					                                 i32 %133 = OpLoad %77 
					                                 i32 %134 = OpIAdd %133 %58 
					                                              OpStore %77 %134 
					                                              OpBranch %78 
					                                      %80 = OpLabel 
					                               f32_2 %135 = OpLoad %75 
					                                              OpStore %47 %135 
					                                              OpBranch %55 
					                                      %55 = OpLabel 
					                                 i32 %136 = OpLoad %51 
					                                 i32 %137 = OpIAdd %136 %58 
					                                              OpStore %51 %137 
					                                              OpBranch %52 
					                                      %54 = OpLabel 
					                               f32_2 %140 = OpLoad %47 
					                               f32_4 %141 = OpLoad %139 
					                               f32_4 %142 = OpVectorShuffle %141 %140 4 5 2 3 
					                                              OpStore %139 %142 
					                               f32_4 %144 = OpLoad %139 
					                               f32_4 %145 = OpVectorShuffle %144 %143 0 1 4 5 
					                                              OpStore %139 %145 
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
						int _TileMaxLoop;
						vec2 _TileMaxOffs;
						vec4 unused_0_5[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					int u_xlati2;
					vec2 u_xlat3;
					vec4 u_xlat10_4;
					vec2 u_xlat7;
					bool u_xlatb7;
					vec2 u_xlat10;
					vec2 u_xlat13;
					bool u_xlatb13;
					int u_xlati17;
					float u_xlat18;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_TileMaxOffs.x, _TileMaxOffs.y) + vs_TEXCOORD0.xy;
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.xw = _MainTex_TexelSize.xy;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_TileMaxLoop ; u_xlati_loop_1++)
					    {
					        u_xlat7.x = float(u_xlati_loop_1);
					        u_xlat7.xy = u_xlat1.xy * u_xlat7.xx + u_xlat0.xy;
					        u_xlat3.xy = u_xlat10.xy;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<_TileMaxLoop ; u_xlati_loop_2++)
					        {
					            u_xlat13.x = float(u_xlati_loop_2);
					            u_xlat13.xy = u_xlat1.zw * u_xlat13.xx + u_xlat7.xy;
					            u_xlat10_4 = texture(_MainTex, u_xlat13.xy);
					            u_xlat13.x = dot(u_xlat3.xy, u_xlat3.xy);
					            u_xlat18 = dot(u_xlat10_4.xy, u_xlat10_4.xy);
					            u_xlatb13 = u_xlat13.x<u_xlat18;
					            u_xlat3.xy = (bool(u_xlatb13)) ? u_xlat10_4.xy : u_xlat3.xy;
					        }
					        u_xlat10.xy = u_xlat3.xy;
					    }
					    SV_Target0.xy = u_xlat10.xy;
					    SV_Target0.zw = vec2(0.0, 0.0);
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
			GpuProgramID 317650
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
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					float u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.yyxy * vec4(0.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat8 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlat12 = dot(u_xlat10_0.xy, u_xlat10_0.xy);
					    u_xlatb8 = u_xlat8<u_xlat12;
					    u_xlat0.xy = (bool(u_xlatb8)) ? u_xlat10_0.xy : u_xlat10_1.xy;
					    u_xlat8 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat12 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlatb8 = u_xlat12<u_xlat8;
					    u_xlat0.xy = (bool(u_xlatb8)) ? u_xlat0.xy : u_xlat10_2.xy;
					    u_xlat8 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat9.xy = u_xlat10_2.xy * vec2(1.00999999, 1.00999999);
					    u_xlat2.x = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlatb12 = u_xlat2.x<u_xlat12;
					    u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat10_1.xy : u_xlat9.xy;
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(-1.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.zw);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat9.x = dot(u_xlat10_3.xy, u_xlat10_3.xy);
					    u_xlatb12 = u_xlat9.x<u_xlat12;
					    u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat1.xy : u_xlat10_3.xy;
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb8 = u_xlat12<u_xlat8;
					    u_xlat0.xy = (bool(u_xlatb8)) ? u_xlat0.xy : u_xlat1.xy;
					    u_xlat8 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlat1 = (-_MainTex_TexelSize.xyyy) * vec4(1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat9.x = dot(u_xlat10_3.xy, u_xlat10_3.xy);
					    u_xlatb12 = u_xlat9.x<u_xlat12;
					    u_xlat9.xy = (bool(u_xlatb12)) ? u_xlat10_2.xy : u_xlat10_3.xy;
					    u_xlat12 = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlat2.x = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlatb12 = u_xlat2.x<u_xlat12;
					    u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat9.xy : u_xlat10_1.xy;
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb8 = u_xlat12<u_xlat8;
					    u_xlat0.xy = (bool(u_xlatb8)) ? u_xlat0.xy : u_xlat1.xy;
					    SV_Target0.xy = u_xlat0.xy * vec2(0.990099013, 0.990099013);
					    SV_Target0.zw = vec2(0.0, 0.0);
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
					; Bound: 323
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %25 %312 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD0 Location 25 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %31 DescriptorSet 31 
					                                             OpDecorate %31 Binding 31 
					                                             OpDecorate %32 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %35 DescriptorSet 35 
					                                             OpDecorate %35 Binding 35 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %130 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %166 RelaxedPrecision 
					                                             OpDecorate %167 RelaxedPrecision 
					                                             OpDecorate %168 RelaxedPrecision 
					                                             OpDecorate %178 RelaxedPrecision 
					                                             OpDecorate %179 RelaxedPrecision 
					                                             OpDecorate %185 RelaxedPrecision 
					                                             OpDecorate %186 RelaxedPrecision 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %198 RelaxedPrecision 
					                                             OpDecorate %199 RelaxedPrecision 
					                                             OpDecorate %205 RelaxedPrecision 
					                                             OpDecorate %209 RelaxedPrecision 
					                                             OpDecorate %210 RelaxedPrecision 
					                                             OpDecorate %211 RelaxedPrecision 
					                                             OpDecorate %213 RelaxedPrecision 
					                                             OpDecorate %214 RelaxedPrecision 
					                                             OpDecorate %220 RelaxedPrecision 
					                                             OpDecorate %222 RelaxedPrecision 
					                                             OpDecorate %223 RelaxedPrecision 
					                                             OpDecorate %224 RelaxedPrecision 
					                                             OpDecorate %225 RelaxedPrecision 
					                                             OpDecorate %226 RelaxedPrecision 
					                                             OpDecorate %242 RelaxedPrecision 
					                                             OpDecorate %243 RelaxedPrecision 
					                                             OpDecorate %249 RelaxedPrecision 
					                                             OpDecorate %250 RelaxedPrecision 
					                                             OpDecorate %264 RelaxedPrecision 
					                                             OpDecorate %265 RelaxedPrecision 
					                                             OpDecorate %276 RelaxedPrecision 
					                                             OpDecorate %277 RelaxedPrecision 
					                                             OpDecorate %278 RelaxedPrecision 
					                                             OpDecorate %285 RelaxedPrecision 
					                                             OpDecorate %286 RelaxedPrecision 
					                                             OpDecorate %292 RelaxedPrecision 
					                                             OpDecorate %297 RelaxedPrecision 
					                                             OpDecorate %298 RelaxedPrecision 
					                                             OpDecorate %299 RelaxedPrecision 
					                                             OpDecorate %300 RelaxedPrecision 
					                                             OpDecorate %301 RelaxedPrecision 
					                                             OpDecorate %307 RelaxedPrecision 
					                                             OpDecorate %309 RelaxedPrecision 
					                                             OpDecorate %310 RelaxedPrecision 
					                                             OpDecorate %312 RelaxedPrecision 
					                                             OpDecorate %312 Location 312 
					                                             OpDecorate %313 RelaxedPrecision 
					                                             OpDecorate %316 RelaxedPrecision 
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
					                               f32_4 %21 = OpConstantComposite %19 %20 %20 %20 
					                                     %23 = OpTypeVector %6 2 
					                                     %24 = OpTypePointer Input %23 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %29 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %30 = OpTypePointer UniformConstant %29 
					UniformConstant read_only Texture2D* %31 = OpVariable UniformConstant 
					                                     %33 = OpTypeSampler 
					                                     %34 = OpTypePointer UniformConstant %33 
					            UniformConstant sampler* %35 = OpVariable UniformConstant 
					                                     %37 = OpTypeSampledImage %29 
					                                     %45 = OpTypePointer Private %23 
					                      Private f32_2* %46 = OpVariable Private 
					                      Private f32_2* %54 = OpVariable Private 
					                                     %60 = OpTypeInt 32 0 
					                                 u32 %61 = OpConstant 0 
					                                     %62 = OpTypePointer Private %6 
					                        Private f32* %64 = OpVariable Private 
					                                     %68 = OpTypeBool 
					                                     %69 = OpTypePointer Private %68 
					                       Private bool* %70 = OpVariable Private 
					                                     %76 = OpTypePointer Function %23 
					                        Private f32* %85 = OpVariable Private 
					                                 f32 %92 = OpConstant 3,674022E-40 
					                               f32_4 %93 = OpConstantComposite %20 %19 %92 %20 
					                       Private f32* %114 = OpVariable Private 
					                     Private f32_2* %137 = OpVariable Private 
					                                f32 %145 = OpConstant 3,674022E-40 
					                              f32_2 %146 = OpConstantComposite %145 %145 
					                     Private f32_2* %148 = OpVariable Private 
					                              f32_4 %173 = OpConstantComposite %92 %20 %20 %19 
					                       Private f32* %194 = OpVariable Private 
					                      Private bool* %212 = OpVariable Private 
					                     Private f32_4* %232 = OpVariable Private 
					                              f32_4 %237 = OpConstantComposite %20 %20 %19 %20 
					                      Private bool* %262 = OpVariable Private 
					                      Private bool* %284 = OpVariable Private 
					                                    %311 = OpTypePointer Output %7 
					                      Output f32_4* %312 = OpVariable Output 
					                                f32 %314 = OpConstant 3,674022E-40 
					                              f32_2 %315 = OpConstantComposite %314 %314 
					                              f32_2 %319 = OpConstantComposite %19 %19 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                     Function f32_2* %77 = OpVariable Function 
					                    Function f32_2* %122 = OpVariable Function 
					                    Function f32_2* %158 = OpVariable Function 
					                    Function f32_2* %202 = OpVariable Function 
					                    Function f32_2* %217 = OpVariable Function 
					                    Function f32_2* %268 = OpVariable Function 
					                    Function f32_2* %289 = OpVariable Function 
					                    Function f32_2* %304 = OpVariable Function 
					                      Uniform f32_4* %16 = OpAccessChain %12 %14 
					                               f32_4 %17 = OpLoad %16 
					                               f32_4 %18 = OpVectorShuffle %17 %17 1 1 0 1 
					                               f32_4 %22 = OpFMul %18 %21 
					                               f32_2 %26 = OpLoad vs_TEXCOORD0 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                               f32_4 %28 = OpFAdd %22 %27 
					                                             OpStore %9 %28 
					                 read_only Texture2D %32 = OpLoad %31 
					                             sampler %36 = OpLoad %35 
					          read_only Texture2DSampled %38 = OpSampledImage %32 %36 
					                               f32_4 %39 = OpLoad %9 
					                               f32_2 %40 = OpVectorShuffle %39 %39 0 1 
					                               f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                               f32_4 %43 = OpLoad %9 
					                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
					                                             OpStore %9 %44 
					                 read_only Texture2D %47 = OpLoad %31 
					                             sampler %48 = OpLoad %35 
					          read_only Texture2DSampled %49 = OpSampledImage %47 %48 
					                               f32_4 %50 = OpLoad %9 
					                               f32_2 %51 = OpVectorShuffle %50 %50 2 3 
					                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
					                               f32_2 %53 = OpVectorShuffle %52 %52 0 1 
					                                             OpStore %46 %53 
					                               f32_4 %55 = OpLoad %9 
					                               f32_2 %56 = OpVectorShuffle %55 %55 0 1 
					                               f32_4 %57 = OpLoad %9 
					                               f32_2 %58 = OpVectorShuffle %57 %57 0 1 
					                                 f32 %59 = OpDot %56 %58 
					                        Private f32* %63 = OpAccessChain %54 %61 
					                                             OpStore %63 %59 
					                               f32_2 %65 = OpLoad %46 
					                               f32_2 %66 = OpLoad %46 
					                                 f32 %67 = OpDot %65 %66 
					                                             OpStore %64 %67 
					                        Private f32* %71 = OpAccessChain %54 %61 
					                                 f32 %72 = OpLoad %71 
					                                 f32 %73 = OpLoad %64 
					                                bool %74 = OpFOrdLessThan %72 %73 
					                                             OpStore %70 %74 
					                                bool %75 = OpLoad %70 
					                                             OpSelectionMerge %79 None 
					                                             OpBranchConditional %75 %78 %81 
					                                     %78 = OpLabel 
					                               f32_2 %80 = OpLoad %46 
					                                             OpStore %77 %80 
					                                             OpBranch %79 
					                                     %81 = OpLabel 
					                               f32_4 %82 = OpLoad %9 
					                               f32_2 %83 = OpVectorShuffle %82 %82 0 1 
					                                             OpStore %77 %83 
					                                             OpBranch %79 
					                                     %79 = OpLabel 
					                               f32_2 %84 = OpLoad %77 
					                                             OpStore %54 %84 
					                               f32_2 %86 = OpLoad %54 
					                               f32_2 %87 = OpLoad %54 
					                                 f32 %88 = OpDot %86 %87 
					                                             OpStore %85 %88 
					                      Uniform f32_4* %89 = OpAccessChain %12 %14 
					                               f32_4 %90 = OpLoad %89 
					                               f32_4 %91 = OpVectorShuffle %90 %90 0 1 0 1 
					                               f32_4 %94 = OpFMul %91 %93 
					                               f32_2 %95 = OpLoad vs_TEXCOORD0 
					                               f32_4 %96 = OpVectorShuffle %95 %95 0 1 0 1 
					                               f32_4 %97 = OpFAdd %94 %96 
					                                             OpStore %9 %97 
					                 read_only Texture2D %98 = OpLoad %31 
					                             sampler %99 = OpLoad %35 
					         read_only Texture2DSampled %100 = OpSampledImage %98 %99 
					                              f32_4 %101 = OpLoad %9 
					                              f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                              f32_4 %103 = OpImageSampleImplicitLod %100 %102 
					                              f32_2 %104 = OpVectorShuffle %103 %103 0 1 
					                                             OpStore %46 %104 
					                read_only Texture2D %105 = OpLoad %31 
					                            sampler %106 = OpLoad %35 
					         read_only Texture2DSampled %107 = OpSampledImage %105 %106 
					                              f32_4 %108 = OpLoad %9 
					                              f32_2 %109 = OpVectorShuffle %108 %108 0 1 
					                              f32_4 %110 = OpImageSampleImplicitLod %107 %109 
					                              f32_2 %111 = OpVectorShuffle %110 %110 0 1 
					                              f32_4 %112 = OpLoad %9 
					                              f32_4 %113 = OpVectorShuffle %112 %111 4 5 2 3 
					                                             OpStore %9 %113 
					                              f32_2 %115 = OpLoad %46 
					                              f32_2 %116 = OpLoad %46 
					                                f32 %117 = OpDot %115 %116 
					                                             OpStore %114 %117 
					                                f32 %118 = OpLoad %114 
					                                f32 %119 = OpLoad %85 
					                               bool %120 = OpFOrdLessThan %118 %119 
					                                             OpStore %70 %120 
					                               bool %121 = OpLoad %70 
					                                             OpSelectionMerge %124 None 
					                                             OpBranchConditional %121 %123 %126 
					                                    %123 = OpLabel 
					                              f32_2 %125 = OpLoad %54 
					                                             OpStore %122 %125 
					                                             OpBranch %124 
					                                    %126 = OpLabel 
					                              f32_2 %127 = OpLoad %46 
					                                             OpStore %122 %127 
					                                             OpBranch %124 
					                                    %124 = OpLabel 
					                              f32_2 %128 = OpLoad %122 
					                                             OpStore %54 %128 
					                              f32_2 %129 = OpLoad %54 
					                              f32_2 %130 = OpLoad %54 
					                                f32 %131 = OpDot %129 %130 
					                                             OpStore %85 %131 
					                              f32_4 %132 = OpLoad %9 
					                              f32_2 %133 = OpVectorShuffle %132 %132 0 1 
					                              f32_4 %134 = OpLoad %9 
					                              f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                f32 %136 = OpDot %133 %135 
					                                             OpStore %114 %136 
					                read_only Texture2D %138 = OpLoad %31 
					                            sampler %139 = OpLoad %35 
					         read_only Texture2DSampled %140 = OpSampledImage %138 %139 
					                              f32_2 %141 = OpLoad vs_TEXCOORD0 
					                              f32_4 %142 = OpImageSampleImplicitLod %140 %141 
					                              f32_2 %143 = OpVectorShuffle %142 %142 0 1 
					                                             OpStore %137 %143 
					                              f32_2 %144 = OpLoad %137 
					                              f32_2 %147 = OpFMul %144 %146 
					                                             OpStore %46 %147 
					                              f32_2 %149 = OpLoad %46 
					                              f32_2 %150 = OpLoad %46 
					                                f32 %151 = OpDot %149 %150 
					                       Private f32* %152 = OpAccessChain %148 %61 
					                                             OpStore %152 %151 
					                       Private f32* %153 = OpAccessChain %148 %61 
					                                f32 %154 = OpLoad %153 
					                                f32 %155 = OpLoad %114 
					                               bool %156 = OpFOrdLessThan %154 %155 
					                                             OpStore %70 %156 
					                               bool %157 = OpLoad %70 
					                                             OpSelectionMerge %160 None 
					                                             OpBranchConditional %157 %159 %163 
					                                    %159 = OpLabel 
					                              f32_4 %161 = OpLoad %9 
					                              f32_2 %162 = OpVectorShuffle %161 %161 0 1 
					                                             OpStore %158 %162 
					                                             OpBranch %160 
					                                    %163 = OpLabel 
					                              f32_2 %164 = OpLoad %46 
					                                             OpStore %158 %164 
					                                             OpBranch %160 
					                                    %160 = OpLabel 
					                              f32_2 %165 = OpLoad %158 
					                                             OpStore %148 %165 
					                              f32_2 %166 = OpLoad %148 
					                              f32_2 %167 = OpLoad %148 
					                                f32 %168 = OpDot %166 %167 
					                                             OpStore %114 %168 
					                     Uniform f32_4* %169 = OpAccessChain %12 %14 
					                              f32_4 %170 = OpLoad %169 
					                              f32_4 %171 = OpVectorShuffle %170 %170 0 1 0 1 
					                              f32_4 %172 = OpFNegate %171 
					                              f32_4 %174 = OpFMul %172 %173 
					                              f32_2 %175 = OpLoad vs_TEXCOORD0 
					                              f32_4 %176 = OpVectorShuffle %175 %175 0 1 0 1 
					                              f32_4 %177 = OpFAdd %174 %176 
					                                             OpStore %9 %177 
					                read_only Texture2D %178 = OpLoad %31 
					                            sampler %179 = OpLoad %35 
					         read_only Texture2DSampled %180 = OpSampledImage %178 %179 
					                              f32_4 %181 = OpLoad %9 
					                              f32_2 %182 = OpVectorShuffle %181 %181 2 3 
					                              f32_4 %183 = OpImageSampleImplicitLod %180 %182 
					                              f32_2 %184 = OpVectorShuffle %183 %183 0 1 
					                                             OpStore %46 %184 
					                read_only Texture2D %185 = OpLoad %31 
					                            sampler %186 = OpLoad %35 
					         read_only Texture2DSampled %187 = OpSampledImage %185 %186 
					                              f32_4 %188 = OpLoad %9 
					                              f32_2 %189 = OpVectorShuffle %188 %188 0 1 
					                              f32_4 %190 = OpImageSampleImplicitLod %187 %189 
					                              f32_2 %191 = OpVectorShuffle %190 %190 0 1 
					                              f32_4 %192 = OpLoad %9 
					                              f32_4 %193 = OpVectorShuffle %192 %191 4 5 2 3 
					                                             OpStore %9 %193 
					                              f32_2 %195 = OpLoad %46 
					                              f32_2 %196 = OpLoad %46 
					                                f32 %197 = OpDot %195 %196 
					                                             OpStore %194 %197 
					                                f32 %198 = OpLoad %194 
					                                f32 %199 = OpLoad %114 
					                               bool %200 = OpFOrdLessThan %198 %199 
					                                             OpStore %70 %200 
					                               bool %201 = OpLoad %70 
					                                             OpSelectionMerge %204 None 
					                                             OpBranchConditional %201 %203 %206 
					                                    %203 = OpLabel 
					                              f32_2 %205 = OpLoad %148 
					                                             OpStore %202 %205 
					                                             OpBranch %204 
					                                    %206 = OpLabel 
					                              f32_2 %207 = OpLoad %46 
					                                             OpStore %202 %207 
					                                             OpBranch %204 
					                                    %204 = OpLabel 
					                              f32_2 %208 = OpLoad %202 
					                                             OpStore %148 %208 
					                              f32_2 %209 = OpLoad %148 
					                              f32_2 %210 = OpLoad %148 
					                                f32 %211 = OpDot %209 %210 
					                                             OpStore %114 %211 
					                                f32 %213 = OpLoad %114 
					                                f32 %214 = OpLoad %85 
					                               bool %215 = OpFOrdLessThan %213 %214 
					                                             OpStore %212 %215 
					                               bool %216 = OpLoad %212 
					                                             OpSelectionMerge %219 None 
					                                             OpBranchConditional %216 %218 %221 
					                                    %218 = OpLabel 
					                              f32_2 %220 = OpLoad %54 
					                                             OpStore %217 %220 
					                                             OpBranch %219 
					                                    %221 = OpLabel 
					                              f32_2 %222 = OpLoad %148 
					                                             OpStore %217 %222 
					                                             OpBranch %219 
					                                    %219 = OpLabel 
					                              f32_2 %223 = OpLoad %217 
					                                             OpStore %54 %223 
					                              f32_2 %224 = OpLoad %54 
					                              f32_2 %225 = OpLoad %54 
					                                f32 %226 = OpDot %224 %225 
					                                             OpStore %85 %226 
					                              f32_4 %227 = OpLoad %9 
					                              f32_2 %228 = OpVectorShuffle %227 %227 0 1 
					                              f32_4 %229 = OpLoad %9 
					                              f32_2 %230 = OpVectorShuffle %229 %229 0 1 
					                                f32 %231 = OpDot %228 %230 
					                                             OpStore %114 %231 
					                     Uniform f32_4* %233 = OpAccessChain %12 %14 
					                              f32_4 %234 = OpLoad %233 
					                              f32_4 %235 = OpVectorShuffle %234 %234 0 1 1 1 
					                              f32_4 %236 = OpFNegate %235 
					                              f32_4 %238 = OpFMul %236 %237 
					                              f32_2 %239 = OpLoad vs_TEXCOORD0 
					                              f32_4 %240 = OpVectorShuffle %239 %239 0 1 0 1 
					                              f32_4 %241 = OpFAdd %238 %240 
					                                             OpStore %232 %241 
					                read_only Texture2D %242 = OpLoad %31 
					                            sampler %243 = OpLoad %35 
					         read_only Texture2DSampled %244 = OpSampledImage %242 %243 
					                              f32_4 %245 = OpLoad %232 
					                              f32_2 %246 = OpVectorShuffle %245 %245 2 3 
					                              f32_4 %247 = OpImageSampleImplicitLod %244 %246 
					                              f32_2 %248 = OpVectorShuffle %247 %247 0 1 
					                                             OpStore %46 %248 
					                read_only Texture2D %249 = OpLoad %31 
					                            sampler %250 = OpLoad %35 
					         read_only Texture2DSampled %251 = OpSampledImage %249 %250 
					                              f32_4 %252 = OpLoad %232 
					                              f32_2 %253 = OpVectorShuffle %252 %252 0 1 
					                              f32_4 %254 = OpImageSampleImplicitLod %251 %253 
					                              f32_2 %255 = OpVectorShuffle %254 %254 0 1 
					                              f32_4 %256 = OpLoad %232 
					                              f32_4 %257 = OpVectorShuffle %256 %255 4 5 2 3 
					                                             OpStore %232 %257 
					                              f32_2 %258 = OpLoad %46 
					                              f32_2 %259 = OpLoad %46 
					                                f32 %260 = OpDot %258 %259 
					                       Private f32* %261 = OpAccessChain %148 %61 
					                                             OpStore %261 %260 
					                       Private f32* %263 = OpAccessChain %148 %61 
					                                f32 %264 = OpLoad %263 
					                                f32 %265 = OpLoad %114 
					                               bool %266 = OpFOrdLessThan %264 %265 
					                                             OpStore %262 %266 
					                               bool %267 = OpLoad %262 
					                                             OpSelectionMerge %270 None 
					                                             OpBranchConditional %267 %269 %273 
					                                    %269 = OpLabel 
					                              f32_4 %271 = OpLoad %9 
					                              f32_2 %272 = OpVectorShuffle %271 %271 0 1 
					                                             OpStore %268 %272 
					                                             OpBranch %270 
					                                    %273 = OpLabel 
					                              f32_2 %274 = OpLoad %46 
					                                             OpStore %268 %274 
					                                             OpBranch %270 
					                                    %270 = OpLabel 
					                              f32_2 %275 = OpLoad %268 
					                                             OpStore %148 %275 
					                              f32_2 %276 = OpLoad %148 
					                              f32_2 %277 = OpLoad %148 
					                                f32 %278 = OpDot %276 %277 
					                                             OpStore %114 %278 
					                              f32_4 %279 = OpLoad %232 
					                              f32_2 %280 = OpVectorShuffle %279 %279 0 1 
					                              f32_4 %281 = OpLoad %232 
					                              f32_2 %282 = OpVectorShuffle %281 %281 0 1 
					                                f32 %283 = OpDot %280 %282 
					                                             OpStore %194 %283 
					                                f32 %285 = OpLoad %194 
					                                f32 %286 = OpLoad %114 
					                               bool %287 = OpFOrdLessThan %285 %286 
					                                             OpStore %284 %287 
					                               bool %288 = OpLoad %284 
					                                             OpSelectionMerge %291 None 
					                                             OpBranchConditional %288 %290 %293 
					                                    %290 = OpLabel 
					                              f32_2 %292 = OpLoad %148 
					                                             OpStore %289 %292 
					                                             OpBranch %291 
					                                    %293 = OpLabel 
					                              f32_4 %294 = OpLoad %232 
					                              f32_2 %295 = OpVectorShuffle %294 %294 0 1 
					                                             OpStore %289 %295 
					                                             OpBranch %291 
					                                    %291 = OpLabel 
					                              f32_2 %296 = OpLoad %289 
					                                             OpStore %148 %296 
					                              f32_2 %297 = OpLoad %148 
					                              f32_2 %298 = OpLoad %148 
					                                f32 %299 = OpDot %297 %298 
					                                             OpStore %114 %299 
					                                f32 %300 = OpLoad %114 
					                                f32 %301 = OpLoad %85 
					                               bool %302 = OpFOrdLessThan %300 %301 
					                                             OpStore %284 %302 
					                               bool %303 = OpLoad %284 
					                                             OpSelectionMerge %306 None 
					                                             OpBranchConditional %303 %305 %308 
					                                    %305 = OpLabel 
					                              f32_2 %307 = OpLoad %54 
					                                             OpStore %304 %307 
					                                             OpBranch %306 
					                                    %308 = OpLabel 
					                              f32_2 %309 = OpLoad %148 
					                                             OpStore %304 %309 
					                                             OpBranch %306 
					                                    %306 = OpLabel 
					                              f32_2 %310 = OpLoad %304 
					                                             OpStore %54 %310 
					                              f32_2 %313 = OpLoad %54 
					                              f32_2 %316 = OpFMul %313 %315 
					                              f32_4 %317 = OpLoad %312 
					                              f32_4 %318 = OpVectorShuffle %317 %316 4 5 2 3 
					                                             OpStore %312 %318 
					                              f32_4 %320 = OpLoad %312 
					                              f32_4 %321 = OpVectorShuffle %320 %319 0 1 4 5 
					                                             OpStore %312 %321 
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
						vec4 unused_0_2[6];
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
					vec4 u_xlat10_3;
					float u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.yyxy * vec4(0.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat8 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlat12 = dot(u_xlat10_0.xy, u_xlat10_0.xy);
					    u_xlatb8 = u_xlat8<u_xlat12;
					    u_xlat0.xy = (bool(u_xlatb8)) ? u_xlat10_0.xy : u_xlat10_1.xy;
					    u_xlat8 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat12 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlatb8 = u_xlat12<u_xlat8;
					    u_xlat0.xy = (bool(u_xlatb8)) ? u_xlat0.xy : u_xlat10_2.xy;
					    u_xlat8 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat9.xy = u_xlat10_2.xy * vec2(1.00999999, 1.00999999);
					    u_xlat2.x = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlatb12 = u_xlat2.x<u_xlat12;
					    u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat10_1.xy : u_xlat9.xy;
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(-1.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.zw);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat9.x = dot(u_xlat10_3.xy, u_xlat10_3.xy);
					    u_xlatb12 = u_xlat9.x<u_xlat12;
					    u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat1.xy : u_xlat10_3.xy;
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb8 = u_xlat12<u_xlat8;
					    u_xlat0.xy = (bool(u_xlatb8)) ? u_xlat0.xy : u_xlat1.xy;
					    u_xlat8 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat12 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlat1 = (-_MainTex_TexelSize.xyyy) * vec4(1.0, 1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat9.x = dot(u_xlat10_3.xy, u_xlat10_3.xy);
					    u_xlatb12 = u_xlat9.x<u_xlat12;
					    u_xlat9.xy = (bool(u_xlatb12)) ? u_xlat10_2.xy : u_xlat10_3.xy;
					    u_xlat12 = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlat2.x = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlatb12 = u_xlat2.x<u_xlat12;
					    u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat9.xy : u_xlat10_1.xy;
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb8 = u_xlat12<u_xlat8;
					    u_xlat0.xy = (bool(u_xlatb8)) ? u_xlat0.xy : u_xlat1.xy;
					    SV_Target0.xy = u_xlat0.xy * vec2(0.990099013, 0.990099013);
					    SV_Target0.zw = vec2(0.0, 0.0);
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
			GpuProgramID 336874
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
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
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
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
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _VelocityTex_TexelSize;
					uniform 	vec2 _NeighborMaxTex_TexelSize;
					uniform 	float _MaxBlurRadius;
					uniform 	float _LoopCount;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _VelocityTex;
					UNITY_LOCATION(2) uniform  sampler2D _NeighborMaxTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec2 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat16_7;
					bvec2 u_xlatb7;
					vec2 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat10_9;
					float u_xlat14;
					float u_xlat21;
					float u_xlat16_21;
					vec2 u_xlat23;
					float u_xlat24;
					float u_xlat27;
					float u_xlat31;
					float u_xlat16_31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					float u_xlat34;
					float u_xlat37;
					float u_xlat16_38;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(2.0, 0.0);
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat1.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat1.xy);
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 52.9829178;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 6.28318548;
					    u_xlat2.x = cos(u_xlat1.x);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat2.y = u_xlat1.x;
					    u_xlat1.xy = u_xlat2.xy * vec2(_NeighborMaxTex_TexelSize.x, _NeighborMaxTex_TexelSize.y);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.25, 0.25) + vs_TEXCOORD1.xy;
					    u_xlat10_1 = texture(_NeighborMaxTex, u_xlat1.xy);
					    u_xlat16_21 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlat21 = sqrt(u_xlat16_21);
					    u_xlatb31 = u_xlat21<2.0;
					    if(u_xlatb31){
					        SV_Target0 = u_xlat10_0;
					        return;
					    }
					    u_xlat10_2 = textureLod(_VelocityTex, vs_TEXCOORD1.xy, 0.0);
					    u_xlat16_2.xy = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat2.xy = u_xlat16_2.xy * vec2(_MaxBlurRadius);
					    u_xlat31 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat31 = sqrt(u_xlat31);
					    u_xlat3.xy = max(vec2(u_xlat31), vec2(0.5, 1.0));
					    u_xlat16_31 = float(1.0) / u_xlat10_2.z;
					    u_xlat32 = u_xlat3.x + u_xlat3.x;
					    u_xlatb32 = u_xlat21<u_xlat32;
					    u_xlat3.x = u_xlat21 / u_xlat3.x;
					    u_xlat2.xy = u_xlat2.xy * u_xlat3.xx;
					    u_xlat2.xy = (bool(u_xlatb32)) ? u_xlat2.xy : u_xlat10_1.xy;
					    u_xlat32 = u_xlat21 * 0.5;
					    u_xlat32 = min(u_xlat32, _LoopCount);
					    u_xlat32 = floor(u_xlat32);
					    u_xlat3.x = float(1.0) / u_xlat32;
					    u_xlat23.xy = vs_TEXCOORD0.xy * _ScreenParams.xy;
					    u_xlat23.xy = floor(u_xlat23.xy);
					    u_xlat23.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat23.xy);
					    u_xlat3.z = fract(u_xlat23.x);
					    u_xlat23.xy = u_xlat3.zx * vec2(52.9829178, 0.25);
					    u_xlat23.x = fract(u_xlat23.x);
					    u_xlat23.x = u_xlat23.x + -0.5;
					    u_xlat4 = (-u_xlat3.x) * 0.5 + 1.0;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    u_xlat6.w = float(0.0);
					    u_xlat14 = u_xlat4;
					    u_xlat24 = 0.0;
					    u_xlat34 = u_xlat3.y;
					    while(true){
					        u_xlatb7.x = u_xlat23.y>=u_xlat14;
					        if(u_xlatb7.x){break;}
					        u_xlat7.xy = vec2(u_xlat24) * vec2(0.25, 0.5);
					        u_xlat7.xy = fract(u_xlat7.xy);
					        u_xlatb7.xy = lessThan(vec4(0.499000013, 0.499000013, 0.0, 0.0), u_xlat7.xyxx).xy;
					        u_xlat7.xz = (u_xlatb7.x) ? u_xlat2.xy : u_xlat10_1.xy;
					        u_xlat37 = (u_xlatb7.y) ? (-u_xlat14) : u_xlat14;
					        u_xlat37 = u_xlat23.x * u_xlat3.x + u_xlat37;
					        u_xlat7.xz = vec2(u_xlat37) * u_xlat7.xz;
					        u_xlat8.xy = u_xlat7.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					        u_xlat7.xz = u_xlat7.xz * _VelocityTex_TexelSize.xy + vs_TEXCOORD1.xy;
					        u_xlat10_8 = textureLod(_MainTex, u_xlat8.xy, 0.0);
					        u_xlat10_9 = textureLod(_VelocityTex, u_xlat7.xz, 0.0);
					        u_xlat16_7.xz = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					        u_xlat7.xz = u_xlat16_7.xz * vec2(_MaxBlurRadius);
					        u_xlat16_38 = u_xlat10_2.z + (-u_xlat10_9.z);
					        u_xlat16_38 = u_xlat16_31 * u_xlat16_38;
					        u_xlat16_38 = u_xlat16_38 * 20.0;
					        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
					        u_xlat7.x = dot(u_xlat7.xz, u_xlat7.xz);
					        u_xlat7.x = sqrt(u_xlat7.x);
					        u_xlat7.x = (-u_xlat34) + u_xlat7.x;
					        u_xlat7.x = u_xlat16_38 * u_xlat7.x + u_xlat34;
					        u_xlat27 = (-u_xlat21) * abs(u_xlat37) + u_xlat7.x;
					        u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					        u_xlat27 = u_xlat27 / u_xlat7.x;
					        u_xlat37 = (-u_xlat14) + 1.20000005;
					        u_xlat27 = u_xlat37 * u_xlat27;
					        u_xlat5.xyz = u_xlat10_8.xyz;
					        u_xlat6 = u_xlat5 * vec4(u_xlat27) + u_xlat6;
					        u_xlat34 = max(u_xlat34, u_xlat7.x);
					        u_xlat5.x = (-u_xlat3.x) + u_xlat14;
					        u_xlat14 = (u_xlatb7.y) ? u_xlat5.x : u_xlat14;
					        u_xlat24 = u_xlat24 + 1.0;
					    }
					    u_xlat1.x = dot(vec2(u_xlat34), vec2(u_xlat32));
					    u_xlat1.x = 1.20000005 / u_xlat1.x;
					    u_xlat2.xyz = u_xlat10_0.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1 = u_xlat2 * u_xlat1.xxxx + u_xlat6;
					    SV_Target0.xyz = u_xlat1.xyz / u_xlat1.www;
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
					; Bound: 131
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %119 %122 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate vs_TEXCOORD0 Location 119 
					                                                     OpDecorate vs_TEXCOORD1 Location 122 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                              Private f32_4* %99 = OpVariable Private 
					                                            %101 = OpTypePointer Function %6 
					                                        u32 %110 = OpConstant 3 
					                                            %112 = OpTypeVector %6 3 
					                                            %117 = OpTypeVector %6 2 
					                                            %118 = OpTypePointer Output %117 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %125 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %102 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                       bool %100 = OpLoad %84 
					                                                     OpSelectionMerge %104 None 
					                                                     OpBranchConditional %100 %103 %106 
					                                            %103 = OpLabel 
					                                        f32 %105 = OpLoad %91 
					                                                     OpStore %102 %105 
					                                                     OpBranch %104 
					                                            %106 = OpLabel 
					                                 Input f32* %107 = OpAccessChain %92 %68 
					                                        f32 %108 = OpLoad %107 
					                                                     OpStore %102 %108 
					                                                     OpBranch %104 
					                                            %104 = OpLabel 
					                                        f32 %109 = OpLoad %102 
					                               Private f32* %111 = OpAccessChain %99 %110 
					                                                     OpStore %111 %109 
					                                      f32_4 %113 = OpLoad %92 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 1 0 
					                                      f32_4 %115 = OpLoad %99 
					                                      f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
					                                                     OpStore %99 %116 
					                                      f32_4 %120 = OpLoad %99 
					                                      f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                                     OpStore vs_TEXCOORD0 %121 
					                                      f32_4 %123 = OpLoad %99 
					                                      f32_2 %124 = OpVectorShuffle %123 %123 2 3 
					                                                     OpStore vs_TEXCOORD1 %124 
					                                Output f32* %126 = OpAccessChain %72 %22 %68 
					                                        f32 %127 = OpLoad %126 
					                                        f32 %128 = OpFNegate %127 
					                                Output f32* %129 = OpAccessChain %72 %22 %68 
					                                                     OpStore %129 %128 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 489
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %22 %27 %125 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
					                                                      OpDecorate vs_TEXCOORD1 Location 27 
					                                                      OpMemberDecorate %34 0 Offset 34 
					                                                      OpMemberDecorate %34 1 Offset 34 
					                                                      OpMemberDecorate %34 2 Offset 34 
					                                                      OpMemberDecorate %34 3 Offset 34 
					                                                      OpMemberDecorate %34 4 RelaxedPrecision 
					                                                      OpMemberDecorate %34 4 Offset 34 
					                                                      OpMemberDecorate %34 5 RelaxedPrecision 
					                                                      OpMemberDecorate %34 5 Offset 34 
					                                                      OpDecorate %34 Block 
					                                                      OpDecorate %36 DescriptorSet 36 
					                                                      OpDecorate %36 Binding 36 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %102 DescriptorSet 102 
					                                                      OpDecorate %102 Binding 102 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %104 DescriptorSet 104 
					                                                      OpDecorate %104 Binding 104 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %125 Location 125 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 DescriptorSet 131 
					                                                      OpDecorate %131 Binding 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %133 DescriptorSet 133 
					                                                      OpDecorate %133 Binding 133 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
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
					                                                      OpDecorate %165 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %212 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %244 RelaxedPrecision 
					                                                      OpDecorate %245 RelaxedPrecision 
					                                                      OpDecorate %246 RelaxedPrecision 
					                                                      OpDecorate %247 RelaxedPrecision 
					                                                      OpDecorate %248 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %309 RelaxedPrecision 
					                                                      OpDecorate %310 RelaxedPrecision 
					                                                      OpDecorate %312 RelaxedPrecision 
					                                                      OpDecorate %313 RelaxedPrecision 
					                                                      OpDecorate %316 RelaxedPrecision 
					                                                      OpDecorate %318 RelaxedPrecision 
					                                                      OpDecorate %320 RelaxedPrecision 
					                                                      OpDecorate %321 RelaxedPrecision 
					                                                      OpDecorate %322 RelaxedPrecision 
					                                                      OpDecorate %323 RelaxedPrecision 
					                                                      OpDecorate %324 RelaxedPrecision 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                                      OpDecorate %343 RelaxedPrecision 
					                                                      OpDecorate %344 RelaxedPrecision 
					                                                      OpDecorate %345 RelaxedPrecision 
					                                                      OpDecorate %350 RelaxedPrecision 
					                                                      OpDecorate %351 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %353 RelaxedPrecision 
					                                                      OpDecorate %357 RelaxedPrecision 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %361 RelaxedPrecision 
					                                                      OpDecorate %362 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %366 RelaxedPrecision 
					                                                      OpDecorate %367 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %369 RelaxedPrecision 
					                                                      OpDecorate %371 RelaxedPrecision 
					                                                      OpDecorate %373 RelaxedPrecision 
					                                                      OpDecorate %374 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %376 RelaxedPrecision 
					                                                      OpDecorate %377 RelaxedPrecision 
					                                                      OpDecorate %378 RelaxedPrecision 
					                                                      OpDecorate %379 RelaxedPrecision 
					                                                      OpDecorate %381 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %383 RelaxedPrecision 
					                                                      OpDecorate %384 RelaxedPrecision 
					                                                      OpDecorate %385 RelaxedPrecision 
					                                                      OpDecorate %386 RelaxedPrecision 
					                                                      OpDecorate %389 RelaxedPrecision 
					                                                      OpDecorate %390 RelaxedPrecision 
					                                                      OpDecorate %392 RelaxedPrecision 
					                                                      OpDecorate %393 RelaxedPrecision 
					                                                      OpDecorate %395 RelaxedPrecision 
					                                                      OpDecorate %396 RelaxedPrecision 
					                                                      OpDecorate %398 RelaxedPrecision 
					                                                      OpDecorate %400 RelaxedPrecision 
					                                                      OpDecorate %401 RelaxedPrecision 
					                                                      OpDecorate %402 RelaxedPrecision 
					                                                      OpDecorate %403 RelaxedPrecision 
					                                                      OpDecorate %405 RelaxedPrecision 
					                                                      OpDecorate %406 RelaxedPrecision 
					                                                      OpDecorate %407 RelaxedPrecision 
					                                                      OpDecorate %408 RelaxedPrecision 
					                                                      OpDecorate %409 RelaxedPrecision 
					                                                      OpDecorate %410 RelaxedPrecision 
					                                                      OpDecorate %412 RelaxedPrecision 
					                                                      OpDecorate %413 RelaxedPrecision 
					                                                      OpDecorate %414 RelaxedPrecision 
					                                                      OpDecorate %415 RelaxedPrecision 
					                                                      OpDecorate %416 RelaxedPrecision 
					                                                      OpDecorate %418 RelaxedPrecision 
					                                                      OpDecorate %419 RelaxedPrecision 
					                                                      OpDecorate %420 RelaxedPrecision 
					                                                      OpDecorate %421 RelaxedPrecision 
					                                                      OpDecorate %423 RelaxedPrecision 
					                                                      OpDecorate %424 RelaxedPrecision 
					                                                      OpDecorate %425 RelaxedPrecision 
					                                                      OpDecorate %426 RelaxedPrecision 
					                                                      OpDecorate %428 RelaxedPrecision 
					                                                      OpDecorate %429 RelaxedPrecision 
					                                                      OpDecorate %430 RelaxedPrecision 
					                                                      OpDecorate %431 RelaxedPrecision 
					                                                      OpDecorate %434 RelaxedPrecision 
					                                                      OpDecorate %435 RelaxedPrecision 
					                                                      OpDecorate %436 RelaxedPrecision 
					                                                      OpDecorate %437 RelaxedPrecision 
					                                                      OpDecorate %439 RelaxedPrecision 
					                                                      OpDecorate %440 RelaxedPrecision 
					                                                      OpDecorate %441 RelaxedPrecision 
					                                                      OpDecorate %442 RelaxedPrecision 
					                                                      OpDecorate %443 RelaxedPrecision 
					                                                      OpDecorate %444 RelaxedPrecision 
					                                                      OpDecorate %452 RelaxedPrecision 
					                                                      OpDecorate %454 RelaxedPrecision 
					                                                      OpDecorate %455 RelaxedPrecision 
					                                                      OpDecorate %456 RelaxedPrecision 
					                                                      OpDecorate %457 RelaxedPrecision 
					                                                      OpDecorate %458 RelaxedPrecision 
					                                                      OpDecorate %459 RelaxedPrecision 
					                                                      OpDecorate %460 RelaxedPrecision 
					                                                      OpDecorate %461 RelaxedPrecision 
					                                                      OpDecorate %462 RelaxedPrecision 
					                                                      OpDecorate %463 RelaxedPrecision 
					                                                      OpDecorate %464 RelaxedPrecision 
					                                                      OpDecorate %465 RelaxedPrecision 
					                                                      OpDecorate %467 RelaxedPrecision 
					                                                      OpDecorate %468 RelaxedPrecision 
					                                                      OpDecorate %469 RelaxedPrecision 
					                                                      OpDecorate %470 RelaxedPrecision 
					                                                      OpDecorate %471 RelaxedPrecision 
					                                                      OpDecorate %474 RelaxedPrecision 
					                                                      OpDecorate %475 RelaxedPrecision 
					                                                      OpDecorate %476 RelaxedPrecision 
					                                                      OpDecorate %477 RelaxedPrecision 
					                                                      OpDecorate %478 RelaxedPrecision 
					                                                      OpDecorate %479 RelaxedPrecision 
					                                                      OpDecorate %480 RelaxedPrecision 
					                                                      OpDecorate %481 RelaxedPrecision 
					                                                      OpDecorate %485 RelaxedPrecision 
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
					                                              %25 = OpTypePointer Private %20 
					                               Private f32_2* %26 = OpVariable Private 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                          f32 %29 = OpConstant 3,674022E-40 
					                                          f32 %30 = OpConstant 3,674022E-40 
					                                        f32_2 %31 = OpConstantComposite %29 %30 
					                                              %34 = OpTypeStruct %7 %7 %20 %20 %6 %6 
					                                              %35 = OpTypePointer Uniform %34 
					Uniform struct {f32_4; f32_4; f32_2; f32_2; f32; f32;}* %36 = OpVariable Uniform 
					                                              %37 = OpTypeInt 32 1 
					                                          i32 %38 = OpConstant 0 
					                                              %39 = OpTypePointer Uniform %7 
					                                          f32 %46 = OpConstant 3,674022E-40 
					                                          f32 %47 = OpConstant 3,674022E-40 
					                                        f32_2 %48 = OpConstantComposite %46 %47 
					                                              %51 = OpTypeInt 32 0 
					                                          u32 %52 = OpConstant 0 
					                                              %53 = OpTypePointer Private %6 
					                                          f32 %61 = OpConstant 3,674022E-40 
					                                          f32 %70 = OpConstant 3,674022E-40 
					                               Private f32_4* %73 = OpVariable Private 
					                                          u32 %84 = OpConstant 1 
					                                          i32 %88 = OpConstant 3 
					                                              %89 = OpTypePointer Uniform %6 
					                                          f32 %97 = OpConstant 3,674022E-40 
					                                        f32_2 %98 = OpConstantComposite %97 %97 
					        UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
					                    UniformConstant sampler* %104 = OpVariable UniformConstant 
					                                Private f32* %110 = OpVariable Private 
					                                             %116 = OpTypeBool 
					                                             %117 = OpTypePointer Private %116 
					                               Private bool* %118 = OpVariable Private 
					                                             %124 = OpTypePointer Output %7 
					                               Output f32_4* %125 = OpVariable Output 
					                                             %128 = OpTypeVector %6 3 
					                                             %129 = OpTypePointer Private %128 
					                              Private f32_3* %130 = OpVariable Private 
					        UniformConstant read_only Texture2D* %131 = OpVariable UniformConstant 
					                    UniformConstant sampler* %133 = OpVariable UniformConstant 
					                              Private f32_2* %139 = OpVariable Private 
					                                       f32_2 %142 = OpConstantComposite %29 %29 
					                                         f32 %144 = OpConstant 3,674022E-40 
					                                       f32_2 %145 = OpConstantComposite %144 %144 
					                                         i32 %148 = OpConstant 4 
					                                Private f32* %153 = OpVariable Private 
					                              Private f32_2* %159 = OpVariable Private 
					                                         f32 %162 = OpConstant 3,674022E-40 
					                                         f32 %163 = OpConstant 3,674022E-40 
					                                       f32_2 %164 = OpConstantComposite %162 %163 
					                                         u32 %166 = OpConstant 2 
					                                Private f32* %170 = OpVariable Private 
					                                             %189 = OpTypePointer Function %20 
					                                         i32 %202 = OpConstant 5 
					                              Private f32_2* %214 = OpVariable Private 
					                                         f32 %239 = OpConstant 3,674022E-40 
					                                Private f32* %242 = OpVariable Private 
					                                Private f32* %245 = OpVariable Private 
					                              Private f32_4* %250 = OpVariable Private 
					                                         u32 %254 = OpConstant 3 
					                                Private f32* %256 = OpVariable Private 
					                                Private f32* %258 = OpVariable Private 
					                                Private f32* %259 = OpVariable Private 
					                                        bool %267 = OpConstantTrue 
					                               Private bool* %268 = OpVariable Private 
					                              Private f32_2* %276 = OpVariable Private 
					                                       f32_2 %279 = OpConstantComposite %97 %162 
					                                             %283 = OpTypeVector %116 2 
					                                             %284 = OpTypePointer Private %283 
					                             Private bool_2* %285 = OpVariable Private 
					                                         f32 %286 = OpConstant 3,674022E-40 
					                                       f32_4 %287 = OpConstantComposite %286 %286 %30 %30 
					                                             %290 = OpTypeVector %116 4 
					                                Private f32* %302 = OpVariable Private 
					                                             %305 = OpTypePointer Function %6 
					                                         i32 %325 = OpConstant 1 
					                              Private f32_2* %334 = OpVariable Private 
					                                         i32 %336 = OpConstant 2 
					                                             %337 = OpTypePointer Uniform %20 
					                              Private f32_3* %343 = OpVariable Private 
					                              Private f32_4* %351 = OpVariable Private 
					                                Private f32* %369 = OpVariable Private 
					                                         f32 %380 = OpConstant 3,674022E-40 
					                                Private f32* %405 = OpVariable Private 
					                                         f32 %422 = OpConstant 3,674022E-40 
					                              Private f32_4* %463 = OpVariable Private 
					                                             %486 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                             Function f32_2* %190 = OpVariable Function 
					                             Function f32_2* %295 = OpVariable Function 
					                               Function f32* %306 = OpVariable Function 
					                               Function f32* %448 = OpVariable Function 
					                          read_only Texture2D %13 = OpLoad %12 
					                                      sampler %17 = OpLoad %16 
					                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                                      OpStore %9 %24 
					                                        f32_2 %28 = OpLoad vs_TEXCOORD1 
					                                        f32_2 %32 = OpFAdd %28 %31 
					                                                      OpStore %26 %32 
					                                        f32_2 %33 = OpLoad %26 
					                               Uniform f32_4* %40 = OpAccessChain %36 %38 
					                                        f32_4 %41 = OpLoad %40 
					                                        f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                                        f32_2 %43 = OpFMul %33 %42 
					                                                      OpStore %26 %43 
					                                        f32_2 %44 = OpLoad %26 
					                                        f32_2 %45 = OpExtInst %1 8 %44 
					                                                      OpStore %26 %45 
					                                        f32_2 %49 = OpLoad %26 
					                                          f32 %50 = OpDot %48 %49 
					                                 Private f32* %54 = OpAccessChain %26 %52 
					                                                      OpStore %54 %50 
					                                 Private f32* %55 = OpAccessChain %26 %52 
					                                          f32 %56 = OpLoad %55 
					                                          f32 %57 = OpExtInst %1 10 %56 
					                                 Private f32* %58 = OpAccessChain %26 %52 
					                                                      OpStore %58 %57 
					                                 Private f32* %59 = OpAccessChain %26 %52 
					                                          f32 %60 = OpLoad %59 
					                                          f32 %62 = OpFMul %60 %61 
					                                 Private f32* %63 = OpAccessChain %26 %52 
					                                                      OpStore %63 %62 
					                                 Private f32* %64 = OpAccessChain %26 %52 
					                                          f32 %65 = OpLoad %64 
					                                          f32 %66 = OpExtInst %1 10 %65 
					                                 Private f32* %67 = OpAccessChain %26 %52 
					                                                      OpStore %67 %66 
					                                 Private f32* %68 = OpAccessChain %26 %52 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %71 = OpFMul %69 %70 
					                                 Private f32* %72 = OpAccessChain %26 %52 
					                                                      OpStore %72 %71 
					                                 Private f32* %74 = OpAccessChain %26 %52 
					                                          f32 %75 = OpLoad %74 
					                                          f32 %76 = OpExtInst %1 14 %75 
					                                 Private f32* %77 = OpAccessChain %73 %52 
					                                                      OpStore %77 %76 
					                                 Private f32* %78 = OpAccessChain %26 %52 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpExtInst %1 13 %79 
					                                 Private f32* %81 = OpAccessChain %26 %52 
					                                                      OpStore %81 %80 
					                                 Private f32* %82 = OpAccessChain %26 %52 
					                                          f32 %83 = OpLoad %82 
					                                 Private f32* %85 = OpAccessChain %73 %84 
					                                                      OpStore %85 %83 
					                                        f32_4 %86 = OpLoad %73 
					                                        f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                                 Uniform f32* %90 = OpAccessChain %36 %88 %52 
					                                          f32 %91 = OpLoad %90 
					                                 Uniform f32* %92 = OpAccessChain %36 %88 %84 
					                                          f32 %93 = OpLoad %92 
					                                        f32_2 %94 = OpCompositeConstruct %91 %93 
					                                        f32_2 %95 = OpFMul %87 %94 
					                                                      OpStore %26 %95 
					                                        f32_2 %96 = OpLoad %26 
					                                        f32_2 %99 = OpFMul %96 %98 
					                                       f32_2 %100 = OpLoad vs_TEXCOORD1 
					                                       f32_2 %101 = OpFAdd %99 %100 
					                                                      OpStore %26 %101 
					                         read_only Texture2D %103 = OpLoad %102 
					                                     sampler %105 = OpLoad %104 
					                  read_only Texture2DSampled %106 = OpSampledImage %103 %105 
					                                       f32_2 %107 = OpLoad %26 
					                                       f32_4 %108 = OpImageSampleImplicitLod %106 %107 
					                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
					                                                      OpStore %26 %109 
					                                       f32_2 %111 = OpLoad %26 
					                                       f32_2 %112 = OpLoad %26 
					                                         f32 %113 = OpDot %111 %112 
					                                                      OpStore %110 %113 
					                                         f32 %114 = OpLoad %110 
					                                         f32 %115 = OpExtInst %1 31 %114 
					                                                      OpStore %110 %115 
					                                         f32 %119 = OpLoad %110 
					                                        bool %120 = OpFOrdLessThan %119 %29 
					                                                      OpStore %118 %120 
					                                        bool %121 = OpLoad %118 
					                                                      OpSelectionMerge %123 None 
					                                                      OpBranchConditional %121 %122 %123 
					                                             %122 = OpLabel 
					                                       f32_4 %126 = OpLoad %9 
					                                                      OpStore %125 %126 
					                                                      OpReturn
					                                             %123 = OpLabel 
					                         read_only Texture2D %132 = OpLoad %131 
					                                     sampler %134 = OpLoad %133 
					                  read_only Texture2DSampled %135 = OpSampledImage %132 %134 
					                                       f32_2 %136 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %137 = OpImageSampleExplicitLod %135 %136 Lod %7 
					                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
					                                                      OpStore %130 %138 
					                                       f32_3 %140 = OpLoad %130 
					                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
					                                       f32_2 %143 = OpFMul %141 %142 
					                                       f32_2 %146 = OpFAdd %143 %145 
					                                                      OpStore %139 %146 
					                                       f32_2 %147 = OpLoad %139 
					                                Uniform f32* %149 = OpAccessChain %36 %148 
					                                         f32 %150 = OpLoad %149 
					                                       f32_2 %151 = OpCompositeConstruct %150 %150 
					                                       f32_2 %152 = OpFMul %147 %151 
					                                                      OpStore %139 %152 
					                                       f32_2 %154 = OpLoad %139 
					                                       f32_2 %155 = OpLoad %139 
					                                         f32 %156 = OpDot %154 %155 
					                                                      OpStore %153 %156 
					                                         f32 %157 = OpLoad %153 
					                                         f32 %158 = OpExtInst %1 31 %157 
					                                                      OpStore %153 %158 
					                                         f32 %160 = OpLoad %153 
					                                       f32_2 %161 = OpCompositeConstruct %160 %160 
					                                       f32_2 %165 = OpExtInst %1 40 %161 %164 
					                                                      OpStore %159 %165 
					                                Private f32* %167 = OpAccessChain %130 %166 
					                                         f32 %168 = OpLoad %167 
					                                         f32 %169 = OpFDiv %163 %168 
					                                                      OpStore %153 %169 
					                                Private f32* %171 = OpAccessChain %159 %52 
					                                         f32 %172 = OpLoad %171 
					                                Private f32* %173 = OpAccessChain %159 %52 
					                                         f32 %174 = OpLoad %173 
					                                         f32 %175 = OpFAdd %172 %174 
					                                                      OpStore %170 %175 
					                                         f32 %176 = OpLoad %110 
					                                         f32 %177 = OpLoad %170 
					                                        bool %178 = OpFOrdLessThan %176 %177 
					                                                      OpStore %118 %178 
					                                         f32 %179 = OpLoad %110 
					                                Private f32* %180 = OpAccessChain %159 %52 
					                                         f32 %181 = OpLoad %180 
					                                         f32 %182 = OpFDiv %179 %181 
					                                Private f32* %183 = OpAccessChain %159 %52 
					                                                      OpStore %183 %182 
					                                       f32_2 %184 = OpLoad %139 
					                                       f32_2 %185 = OpLoad %159 
					                                       f32_2 %186 = OpVectorShuffle %185 %185 0 0 
					                                       f32_2 %187 = OpFMul %184 %186 
					                                                      OpStore %139 %187 
					                                        bool %188 = OpLoad %118 
					                                                      OpSelectionMerge %192 None 
					                                                      OpBranchConditional %188 %191 %194 
					                                             %191 = OpLabel 
					                                       f32_2 %193 = OpLoad %139 
					                                                      OpStore %190 %193 
					                                                      OpBranch %192 
					                                             %194 = OpLabel 
					                                       f32_2 %195 = OpLoad %26 
					                                                      OpStore %190 %195 
					                                                      OpBranch %192 
					                                             %192 = OpLabel 
					                                       f32_2 %196 = OpLoad %190 
					                                                      OpStore %139 %196 
					                                         f32 %197 = OpLoad %110 
					                                         f32 %198 = OpFMul %197 %162 
					                                Private f32* %199 = OpAccessChain %159 %52 
					                                                      OpStore %199 %198 
					                                Private f32* %200 = OpAccessChain %159 %52 
					                                         f32 %201 = OpLoad %200 
					                                Uniform f32* %203 = OpAccessChain %36 %202 
					                                         f32 %204 = OpLoad %203 
					                                         f32 %205 = OpExtInst %1 37 %201 %204 
					                                Private f32* %206 = OpAccessChain %159 %52 
					                                                      OpStore %206 %205 
					                                Private f32* %207 = OpAccessChain %159 %52 
					                                         f32 %208 = OpLoad %207 
					                                         f32 %209 = OpExtInst %1 8 %208 
					                                Private f32* %210 = OpAccessChain %159 %52 
					                                                      OpStore %210 %209 
					                                Private f32* %211 = OpAccessChain %159 %52 
					                                         f32 %212 = OpLoad %211 
					                                         f32 %213 = OpFDiv %163 %212 
					                                                      OpStore %170 %213 
					                                       f32_2 %215 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %216 = OpAccessChain %36 %38 
					                                       f32_4 %217 = OpLoad %216 
					                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
					                                       f32_2 %219 = OpFMul %215 %218 
					                                                      OpStore %214 %219 
					                                       f32_2 %220 = OpLoad %214 
					                                       f32_2 %221 = OpExtInst %1 8 %220 
					                                                      OpStore %214 %221 
					                                       f32_2 %222 = OpLoad %214 
					                                         f32 %223 = OpDot %48 %222 
					                                Private f32* %224 = OpAccessChain %214 %52 
					                                                      OpStore %224 %223 
					                                Private f32* %225 = OpAccessChain %214 %52 
					                                         f32 %226 = OpLoad %225 
					                                         f32 %227 = OpExtInst %1 10 %226 
					                                Private f32* %228 = OpAccessChain %214 %52 
					                                                      OpStore %228 %227 
					                                Private f32* %229 = OpAccessChain %214 %52 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFMul %230 %61 
					                                Private f32* %232 = OpAccessChain %214 %52 
					                                                      OpStore %232 %231 
					                                Private f32* %233 = OpAccessChain %214 %52 
					                                         f32 %234 = OpLoad %233 
					                                         f32 %235 = OpExtInst %1 10 %234 
					                                Private f32* %236 = OpAccessChain %214 %52 
					                                                      OpStore %236 %235 
					                                Private f32* %237 = OpAccessChain %214 %52 
					                                         f32 %238 = OpLoad %237 
					                                         f32 %240 = OpFAdd %238 %239 
					                                Private f32* %241 = OpAccessChain %214 %52 
					                                                      OpStore %241 %240 
					                                         f32 %243 = OpLoad %170 
					                                         f32 %244 = OpFMul %243 %97 
					                                                      OpStore %242 %244 
					                                         f32 %246 = OpLoad %170 
					                                         f32 %247 = OpFNegate %246 
					                                         f32 %248 = OpFMul %247 %162 
					                                         f32 %249 = OpFAdd %248 %163 
					                                                      OpStore %245 %249 
					                                Private f32* %251 = OpAccessChain %250 %52 
					                                                      OpStore %251 %30 
					                                Private f32* %252 = OpAccessChain %250 %84 
					                                                      OpStore %252 %30 
					                                Private f32* %253 = OpAccessChain %250 %166 
					                                                      OpStore %253 %30 
					                                Private f32* %255 = OpAccessChain %250 %254 
					                                                      OpStore %255 %30 
					                                         f32 %257 = OpLoad %245 
					                                                      OpStore %256 %257 
					                                                      OpStore %258 %30 
					                                Private f32* %260 = OpAccessChain %159 %84 
					                                         f32 %261 = OpLoad %260 
					                                                      OpStore %259 %261 
					                                                      OpBranch %262 
					                                             %262 = OpLabel 
					                                                      OpLoopMerge %264 %265 None 
					                                                      OpBranch %266 
					                                             %266 = OpLabel 
					                                                      OpBranchConditional %267 %263 %264 
					                                             %263 = OpLabel 
					                                         f32 %269 = OpLoad %242 
					                                         f32 %270 = OpLoad %256 
					                                        bool %271 = OpFOrdGreaterThanEqual %269 %270 
					                                                      OpStore %268 %271 
					                                        bool %272 = OpLoad %268 
					                                                      OpSelectionMerge %274 None 
					                                                      OpBranchConditional %272 %273 %274 
					                                             %273 = OpLabel 
					                                                      OpBranch %264 
					                                             %274 = OpLabel 
					                                         f32 %277 = OpLoad %258 
					                                       f32_2 %278 = OpCompositeConstruct %277 %277 
					                                       f32_2 %280 = OpFMul %278 %279 
					                                                      OpStore %276 %280 
					                                       f32_2 %281 = OpLoad %276 
					                                       f32_2 %282 = OpExtInst %1 10 %281 
					                                                      OpStore %276 %282 
					                                       f32_2 %288 = OpLoad %276 
					                                       f32_4 %289 = OpVectorShuffle %288 %288 0 1 0 0 
					                                      bool_4 %291 = OpFOrdLessThan %287 %289 
					                                      bool_2 %292 = OpVectorShuffle %291 %291 0 1 
					                                                      OpStore %285 %292 
					                               Private bool* %293 = OpAccessChain %285 %52 
					                                        bool %294 = OpLoad %293 
					                                                      OpSelectionMerge %297 None 
					                                                      OpBranchConditional %294 %296 %299 
					                                             %296 = OpLabel 
					                                       f32_2 %298 = OpLoad %139 
					                                                      OpStore %295 %298 
					                                                      OpBranch %297 
					                                             %299 = OpLabel 
					                                       f32_2 %300 = OpLoad %26 
					                                                      OpStore %295 %300 
					                                                      OpBranch %297 
					                                             %297 = OpLabel 
					                                       f32_2 %301 = OpLoad %295 
					                                                      OpStore %276 %301 
					                               Private bool* %303 = OpAccessChain %285 %84 
					                                        bool %304 = OpLoad %303 
					                                                      OpSelectionMerge %308 None 
					                                                      OpBranchConditional %304 %307 %311 
					                                             %307 = OpLabel 
					                                         f32 %309 = OpLoad %256 
					                                         f32 %310 = OpFNegate %309 
					                                                      OpStore %306 %310 
					                                                      OpBranch %308 
					                                             %311 = OpLabel 
					                                         f32 %312 = OpLoad %256 
					                                                      OpStore %306 %312 
					                                                      OpBranch %308 
					                                             %308 = OpLabel 
					                                         f32 %313 = OpLoad %306 
					                                                      OpStore %302 %313 
					                                Private f32* %314 = OpAccessChain %214 %52 
					                                         f32 %315 = OpLoad %314 
					                                         f32 %316 = OpLoad %170 
					                                         f32 %317 = OpFMul %315 %316 
					                                         f32 %318 = OpLoad %302 
					                                         f32 %319 = OpFAdd %317 %318 
					                                                      OpStore %302 %319 
					                                         f32 %320 = OpLoad %302 
					                                       f32_2 %321 = OpCompositeConstruct %320 %320 
					                                       f32_2 %322 = OpLoad %276 
					                                       f32_2 %323 = OpFMul %321 %322 
					                                                      OpStore %276 %323 
					                                       f32_2 %324 = OpLoad %276 
					                              Uniform f32_4* %326 = OpAccessChain %36 %325 
					                                       f32_4 %327 = OpLoad %326 
					                                       f32_2 %328 = OpVectorShuffle %327 %327 0 1 
					                                       f32_2 %329 = OpFMul %324 %328 
					                                       f32_2 %330 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %331 = OpFAdd %329 %330 
					                                       f32_4 %332 = OpLoad %73 
					                                       f32_4 %333 = OpVectorShuffle %332 %331 4 1 2 5 
					                                                      OpStore %73 %333 
					                                       f32_2 %335 = OpLoad %276 
					                              Uniform f32_2* %338 = OpAccessChain %36 %336 
					                                       f32_2 %339 = OpLoad %338 
					                                       f32_2 %340 = OpFMul %335 %339 
					                                       f32_2 %341 = OpLoad vs_TEXCOORD1 
					                                       f32_2 %342 = OpFAdd %340 %341 
					                                                      OpStore %334 %342 
					                         read_only Texture2D %344 = OpLoad %12 
					                                     sampler %345 = OpLoad %16 
					                  read_only Texture2DSampled %346 = OpSampledImage %344 %345 
					                                       f32_4 %347 = OpLoad %73 
					                                       f32_2 %348 = OpVectorShuffle %347 %347 0 3 
					                                       f32_4 %349 = OpImageSampleExplicitLod %346 %348 Lod %7 
					                                       f32_3 %350 = OpVectorShuffle %349 %349 0 1 2 
					                                                      OpStore %343 %350 
					                         read_only Texture2D %352 = OpLoad %131 
					                                     sampler %353 = OpLoad %133 
					                  read_only Texture2DSampled %354 = OpSampledImage %352 %353 
					                                       f32_2 %355 = OpLoad %334 
					                                       f32_4 %356 = OpImageSampleExplicitLod %354 %355 Lod %7 
					                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
					                                       f32_4 %358 = OpLoad %351 
					                                       f32_4 %359 = OpVectorShuffle %358 %357 4 5 6 3 
					                                                      OpStore %351 %359 
					                                       f32_4 %360 = OpLoad %351 
					                                       f32_2 %361 = OpVectorShuffle %360 %360 0 1 
					                                       f32_2 %362 = OpFMul %361 %142 
					                                       f32_2 %363 = OpFAdd %362 %145 
					                                                      OpStore %276 %363 
					                                       f32_2 %364 = OpLoad %276 
					                                Uniform f32* %365 = OpAccessChain %36 %148 
					                                         f32 %366 = OpLoad %365 
					                                       f32_2 %367 = OpCompositeConstruct %366 %366 
					                                       f32_2 %368 = OpFMul %364 %367 
					                                                      OpStore %276 %368 
					                                Private f32* %370 = OpAccessChain %130 %166 
					                                         f32 %371 = OpLoad %370 
					                                Private f32* %372 = OpAccessChain %351 %166 
					                                         f32 %373 = OpLoad %372 
					                                         f32 %374 = OpFNegate %373 
					                                         f32 %375 = OpFAdd %371 %374 
					                                                      OpStore %369 %375 
					                                         f32 %376 = OpLoad %153 
					                                         f32 %377 = OpLoad %369 
					                                         f32 %378 = OpFMul %376 %377 
					                                                      OpStore %369 %378 
					                                         f32 %379 = OpLoad %369 
					                                         f32 %381 = OpFMul %379 %380 
					                                                      OpStore %369 %381 
					                                         f32 %382 = OpLoad %369 
					                                         f32 %383 = OpExtInst %1 43 %382 %30 %163 
					                                                      OpStore %369 %383 
					                                       f32_2 %384 = OpLoad %276 
					                                       f32_2 %385 = OpLoad %276 
					                                         f32 %386 = OpDot %384 %385 
					                                Private f32* %387 = OpAccessChain %276 %52 
					                                                      OpStore %387 %386 
					                                Private f32* %388 = OpAccessChain %276 %52 
					                                         f32 %389 = OpLoad %388 
					                                         f32 %390 = OpExtInst %1 31 %389 
					                                Private f32* %391 = OpAccessChain %276 %52 
					                                                      OpStore %391 %390 
					                                         f32 %392 = OpLoad %259 
					                                         f32 %393 = OpFNegate %392 
					                                Private f32* %394 = OpAccessChain %276 %52 
					                                         f32 %395 = OpLoad %394 
					                                         f32 %396 = OpFAdd %393 %395 
					                                Private f32* %397 = OpAccessChain %276 %52 
					                                                      OpStore %397 %396 
					                                         f32 %398 = OpLoad %369 
					                                Private f32* %399 = OpAccessChain %276 %52 
					                                         f32 %400 = OpLoad %399 
					                                         f32 %401 = OpFMul %398 %400 
					                                         f32 %402 = OpLoad %259 
					                                         f32 %403 = OpFAdd %401 %402 
					                                Private f32* %404 = OpAccessChain %276 %52 
					                                                      OpStore %404 %403 
					                                         f32 %406 = OpLoad %110 
					                                         f32 %407 = OpFNegate %406 
					                                         f32 %408 = OpLoad %302 
					                                         f32 %409 = OpExtInst %1 4 %408 
					                                         f32 %410 = OpFMul %407 %409 
					                                Private f32* %411 = OpAccessChain %276 %52 
					                                         f32 %412 = OpLoad %411 
					                                         f32 %413 = OpFAdd %410 %412 
					                                                      OpStore %405 %413 
					                                         f32 %414 = OpLoad %405 
					                                         f32 %415 = OpExtInst %1 43 %414 %30 %163 
					                                                      OpStore %405 %415 
					                                         f32 %416 = OpLoad %405 
					                                Private f32* %417 = OpAccessChain %276 %52 
					                                         f32 %418 = OpLoad %417 
					                                         f32 %419 = OpFDiv %416 %418 
					                                                      OpStore %405 %419 
					                                         f32 %420 = OpLoad %256 
					                                         f32 %421 = OpFNegate %420 
					                                         f32 %423 = OpFAdd %421 %422 
					                                                      OpStore %302 %423 
					                                         f32 %424 = OpLoad %302 
					                                         f32 %425 = OpLoad %405 
					                                         f32 %426 = OpFMul %424 %425 
					                                Private f32* %427 = OpAccessChain %351 %254 
					                                                      OpStore %427 %426 
					                                       f32_4 %428 = OpLoad %351 
					                                       f32_3 %429 = OpVectorShuffle %428 %428 3 3 3 
					                                       f32_3 %430 = OpLoad %343 
					                                       f32_3 %431 = OpFMul %429 %430 
					                                       f32_4 %432 = OpLoad %351 
					                                       f32_4 %433 = OpVectorShuffle %432 %431 4 5 6 3 
					                                                      OpStore %351 %433 
					                                       f32_4 %434 = OpLoad %250 
					                                       f32_4 %435 = OpLoad %351 
					                                       f32_4 %436 = OpFAdd %434 %435 
					                                                      OpStore %250 %436 
					                                         f32 %437 = OpLoad %259 
					                                Private f32* %438 = OpAccessChain %276 %52 
					                                         f32 %439 = OpLoad %438 
					                                         f32 %440 = OpExtInst %1 40 %437 %439 
					                                                      OpStore %259 %440 
					                                         f32 %441 = OpLoad %170 
					                                         f32 %442 = OpFNegate %441 
					                                         f32 %443 = OpLoad %256 
					                                         f32 %444 = OpFAdd %442 %443 
					                                Private f32* %445 = OpAccessChain %276 %52 
					                                                      OpStore %445 %444 
					                               Private bool* %446 = OpAccessChain %285 %84 
					                                        bool %447 = OpLoad %446 
					                                                      OpSelectionMerge %450 None 
					                                                      OpBranchConditional %447 %449 %453 
					                                             %449 = OpLabel 
					                                Private f32* %451 = OpAccessChain %276 %52 
					                                         f32 %452 = OpLoad %451 
					                                                      OpStore %448 %452 
					                                                      OpBranch %450 
					                                             %453 = OpLabel 
					                                         f32 %454 = OpLoad %256 
					                                                      OpStore %448 %454 
					                                                      OpBranch %450 
					                                             %450 = OpLabel 
					                                         f32 %455 = OpLoad %448 
					                                                      OpStore %256 %455 
					                                         f32 %456 = OpLoad %258 
					                                         f32 %457 = OpFAdd %456 %163 
					                                                      OpStore %258 %457 
					                                                      OpBranch %265 
					                                             %265 = OpLabel 
					                                                      OpBranch %262 
					                                             %264 = OpLabel 
					                                         f32 %458 = OpLoad %259 
					                                       f32_2 %459 = OpCompositeConstruct %458 %458 
					                                       f32_2 %460 = OpLoad %159 
					                                       f32_2 %461 = OpVectorShuffle %460 %460 0 0 
					                                         f32 %462 = OpDot %459 %461 
					                                                      OpStore %110 %462 
					                                         f32 %464 = OpLoad %110 
					                                         f32 %465 = OpFDiv %422 %464 
					                                Private f32* %466 = OpAccessChain %463 %254 
					                                                      OpStore %466 %465 
					                                       f32_4 %467 = OpLoad %9 
					                                       f32_3 %468 = OpVectorShuffle %467 %467 0 1 2 
					                                       f32_4 %469 = OpLoad %463 
					                                       f32_3 %470 = OpVectorShuffle %469 %469 3 3 3 
					                                       f32_3 %471 = OpFMul %468 %470 
					                                       f32_4 %472 = OpLoad %463 
					                                       f32_4 %473 = OpVectorShuffle %472 %471 4 5 6 3 
					                                                      OpStore %463 %473 
					                                       f32_4 %474 = OpLoad %463 
					                                       f32_4 %475 = OpLoad %250 
					                                       f32_4 %476 = OpFAdd %474 %475 
					                                                      OpStore %463 %476 
					                                       f32_4 %477 = OpLoad %463 
					                                       f32_3 %478 = OpVectorShuffle %477 %477 0 1 2 
					                                       f32_4 %479 = OpLoad %463 
					                                       f32_3 %480 = OpVectorShuffle %479 %479 3 3 3 
					                                       f32_3 %481 = OpFDiv %478 %480 
					                                       f32_4 %482 = OpLoad %125 
					                                       f32_4 %483 = OpVectorShuffle %482 %481 4 5 6 3 
					                                                      OpStore %125 %483 
					                                Private f32* %484 = OpAccessChain %9 %254 
					                                         f32 %485 = OpLoad %484 
					                                 Output f32* %487 = OpAccessChain %125 %254 
					                                                      OpStore %487 %485 
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
						vec2 _VelocityTex_TexelSize;
						vec2 _NeighborMaxTex_TexelSize;
						vec4 unused_0_5;
						float _MaxBlurRadius;
						float _LoopCount;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _VelocityTex;
					uniform  sampler2D _NeighborMaxTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec2 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat16_7;
					bvec2 u_xlatb7;
					vec2 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat10_9;
					float u_xlat14;
					float u_xlat21;
					float u_xlat16_21;
					vec2 u_xlat23;
					float u_xlat24;
					float u_xlat27;
					float u_xlat31;
					float u_xlat16_31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					float u_xlat34;
					float u_xlat37;
					float u_xlat16_38;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(2.0, 0.0);
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat1.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat1.xy);
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 52.9829178;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 6.28318548;
					    u_xlat2.x = cos(u_xlat1.x);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat2.y = u_xlat1.x;
					    u_xlat1.xy = u_xlat2.xy * vec2(_NeighborMaxTex_TexelSize.x, _NeighborMaxTex_TexelSize.y);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.25, 0.25) + vs_TEXCOORD1.xy;
					    u_xlat10_1 = texture(_NeighborMaxTex, u_xlat1.xy);
					    u_xlat16_21 = dot(u_xlat10_1.xy, u_xlat10_1.xy);
					    u_xlat21 = sqrt(u_xlat16_21);
					    u_xlatb31 = u_xlat21<2.0;
					    if(u_xlatb31){
					        SV_Target0 = u_xlat10_0;
					        return;
					    //ENDIF
					    }
					    u_xlat10_2 = textureLod(_VelocityTex, vs_TEXCOORD1.xy, 0.0);
					    u_xlat16_2.xy = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat2.xy = u_xlat16_2.xy * vec2(_MaxBlurRadius);
					    u_xlat31 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat31 = sqrt(u_xlat31);
					    u_xlat3.xy = max(vec2(u_xlat31), vec2(0.5, 1.0));
					    u_xlat16_31 = float(1.0) / u_xlat10_2.z;
					    u_xlat32 = u_xlat3.x + u_xlat3.x;
					    u_xlatb32 = u_xlat21<u_xlat32;
					    u_xlat3.x = u_xlat21 / u_xlat3.x;
					    u_xlat2.xy = u_xlat2.xy * u_xlat3.xx;
					    u_xlat2.xy = (bool(u_xlatb32)) ? u_xlat2.xy : u_xlat10_1.xy;
					    u_xlat32 = u_xlat21 * 0.5;
					    u_xlat32 = min(u_xlat32, _LoopCount);
					    u_xlat32 = floor(u_xlat32);
					    u_xlat3.x = float(1.0) / u_xlat32;
					    u_xlat23.xy = vs_TEXCOORD0.xy * _ScreenParams.xy;
					    u_xlat23.xy = floor(u_xlat23.xy);
					    u_xlat23.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat23.xy);
					    u_xlat3.z = fract(u_xlat23.x);
					    u_xlat23.xy = u_xlat3.zx * vec2(52.9829178, 0.25);
					    u_xlat23.x = fract(u_xlat23.x);
					    u_xlat23.x = u_xlat23.x + -0.5;
					    u_xlat4 = (-u_xlat3.x) * 0.5 + 1.0;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = float(0.0);
					    u_xlat6.y = float(0.0);
					    u_xlat6.z = float(0.0);
					    u_xlat6.w = float(0.0);
					    u_xlat14 = u_xlat4;
					    u_xlat24 = 0.0;
					    u_xlat34 = u_xlat3.y;
					    while(true){
					        u_xlatb7.x = u_xlat23.y>=u_xlat14;
					        if(u_xlatb7.x){break;}
					        u_xlat7.xy = vec2(u_xlat24) * vec2(0.25, 0.5);
					        u_xlat7.xy = fract(u_xlat7.xy);
					        u_xlatb7.xy = lessThan(vec4(0.499000013, 0.499000013, 0.0, 0.0), u_xlat7.xyxx).xy;
					        u_xlat7.xz = (u_xlatb7.x) ? u_xlat2.xy : u_xlat10_1.xy;
					        u_xlat37 = (u_xlatb7.y) ? (-u_xlat14) : u_xlat14;
					        u_xlat37 = u_xlat23.x * u_xlat3.x + u_xlat37;
					        u_xlat7.xz = vec2(u_xlat37) * u_xlat7.xz;
					        u_xlat8.xy = u_xlat7.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					        u_xlat7.xz = u_xlat7.xz * _VelocityTex_TexelSize.xy + vs_TEXCOORD1.xy;
					        u_xlat10_8 = textureLod(_MainTex, u_xlat8.xy, 0.0);
					        u_xlat10_9 = textureLod(_VelocityTex, u_xlat7.xz, 0.0);
					        u_xlat16_7.xz = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					        u_xlat7.xz = u_xlat16_7.xz * vec2(_MaxBlurRadius);
					        u_xlat16_38 = u_xlat10_2.z + (-u_xlat10_9.z);
					        u_xlat16_38 = u_xlat16_31 * u_xlat16_38;
					        u_xlat16_38 = u_xlat16_38 * 20.0;
					        u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
					        u_xlat7.x = dot(u_xlat7.xz, u_xlat7.xz);
					        u_xlat7.x = sqrt(u_xlat7.x);
					        u_xlat7.x = (-u_xlat34) + u_xlat7.x;
					        u_xlat7.x = u_xlat16_38 * u_xlat7.x + u_xlat34;
					        u_xlat27 = (-u_xlat21) * abs(u_xlat37) + u_xlat7.x;
					        u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					        u_xlat27 = u_xlat27 / u_xlat7.x;
					        u_xlat37 = (-u_xlat14) + 1.20000005;
					        u_xlat27 = u_xlat37 * u_xlat27;
					        u_xlat5.xyz = u_xlat10_8.xyz;
					        u_xlat6 = u_xlat5 * vec4(u_xlat27) + u_xlat6;
					        u_xlat34 = max(u_xlat34, u_xlat7.x);
					        u_xlat5.x = (-u_xlat3.x) + u_xlat14;
					        u_xlat14 = (u_xlatb7.y) ? u_xlat5.x : u_xlat14;
					        u_xlat24 = u_xlat24 + 1.0;
					    }
					    u_xlat1.x = dot(vec2(u_xlat34), vec2(u_xlat32));
					    u_xlat1.x = 1.20000005 / u_xlat1.x;
					    u_xlat2.xyz = u_xlat10_0.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1 = u_xlat2 * u_xlat1.xxxx + u_xlat6;
					    SV_Target0.xyz = u_xlat1.xyz / u_xlat1.www;
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
			GpuProgramID 434452
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					void main()
					{
					    gl_Position = in_POSITION0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
					    vs_TEXCOORD1.xy = vec2(0.0, 0.0);
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
					
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					void main()
					{
					    gl_Position = in_POSITION0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = vec2(0.0, 0.0);
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
					uniform 	vec4 _ScreenParams;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec2 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0 = vec4(dot(vec3(0.298999995, 0.587000012, 0.114), u_xlat16_0.xyz));
					    u_xlat0.x = vs_TEXCOORD0.x * _ScreenParams.x;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat2 = floor(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatb0 = 0.5<u_xlat0.x;
					    u_xlat0.xzw = (bool(u_xlatb0)) ? vec3(0.5, -0.418687999, -0.0813120008) : vec3(-0.168735996, -0.331263989, 0.5);
					    u_xlat2 = u_xlat2 * 2.0 + 1.0;
					    u_xlat1.x = _ScreenParams.z + -1.0;
					    u_xlat1.x = u_xlat2 * u_xlat1.x;
					    u_xlat1.y = vs_TEXCOORD0.y;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.x = dot(u_xlat0.xzw, u_xlat16_1.xyz);
					    SV_Target1 = u_xlat0.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 42
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Vertex %4 "main" %13 %17 %23 %24 %34 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
					                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
					                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %17 Location 17 
					                                             OpDecorate vs_TEXCOORD0 Location 23 
					                                             OpDecorate %24 Location 24 
					                                             OpDecorate vs_TEXCOORD1 Location 34 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypeInt 32 0 
					                                  u32 %9 = OpConstant 1 
					                                     %10 = OpTypeArray %6 %9 
					                                     %11 = OpTypeStruct %7 %6 %10 
					                                     %12 = OpTypePointer Output %11 
					Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
					                                     %14 = OpTypeInt 32 1 
					                                 i32 %15 = OpConstant 0 
					                                     %16 = OpTypePointer Input %7 
					                        Input f32_4* %17 = OpVariable Input 
					                                     %19 = OpTypePointer Output %7 
					                                     %21 = OpTypeVector %6 2 
					                                     %22 = OpTypePointer Output %21 
					              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                        Input f32_4* %24 = OpVariable Input 
					                                 f32 %27 = OpConstant 3,674022E-40 
					                                 f32 %28 = OpConstant 3,674022E-40 
					                               f32_2 %29 = OpConstantComposite %27 %28 
					                                 f32 %31 = OpConstant 3,674022E-40 
					                               f32_2 %32 = OpConstantComposite %31 %27 
					              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                               f32_2 %35 = OpConstantComposite %31 %31 
					                                     %36 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_4 %18 = OpLoad %17 
					                       Output f32_4* %20 = OpAccessChain %13 %15 
					                                             OpStore %20 %18 
					                               f32_4 %25 = OpLoad %24 
					                               f32_2 %26 = OpVectorShuffle %25 %25 0 1 
					                               f32_2 %30 = OpFMul %26 %29 
					                               f32_2 %33 = OpFAdd %30 %32 
					                                             OpStore vs_TEXCOORD0 %33 
					                                             OpStore vs_TEXCOORD1 %35 
					                         Output f32* %37 = OpAccessChain %13 %15 %9 
					                                 f32 %38 = OpLoad %37 
					                                 f32 %39 = OpFNegate %38 
					                         Output f32* %40 = OpAccessChain %13 %15 %9 
					                                             OpStore %40 %39 
					                                             OpReturn
					                                             OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 156
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %51 %150 
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
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %28 RelaxedPrecision 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %32 RelaxedPrecision 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %51 Location 51 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpMemberDecorate %66 0 Offset 66 
					                                             OpDecorate %66 Block 
					                                             OpDecorate %68 DescriptorSet 68 
					                                             OpDecorate %68 Binding 68 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
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
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %150 Location 150 
					                                             OpDecorate %151 RelaxedPrecision 
					                                             OpDecorate %152 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
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
					                                     %24 = OpTypeVector %6 4 
					                      Private f32_3* %27 = OpVariable Private 
					                                 f32 %29 = OpConstant 3,674022E-40 
					                               f32_3 %30 = OpConstantComposite %29 %29 %29 
					                      Private f32_3* %32 = OpVariable Private 
					                                 f32 %36 = OpConstant 3,674022E-40 
					                               f32_3 %37 = OpConstantComposite %36 %36 %36 
					                                 f32 %42 = OpConstant 3,674022E-40 
					                               f32_3 %43 = OpConstantComposite %42 %42 %42 
					                                 f32 %45 = OpConstant 3,674022E-40 
					                               f32_3 %46 = OpConstantComposite %45 %45 %45 
					                                     %50 = OpTypePointer Output %24 
					                       Output f32_4* %51 = OpVariable Output 
					                                 f32 %52 = OpConstant 3,674022E-40 
					                                 f32 %53 = OpConstant 3,674022E-40 
					                                 f32 %54 = OpConstant 3,674022E-40 
					                               f32_3 %55 = OpConstantComposite %52 %53 %54 
					                                     %59 = OpTypePointer Private %20 
					                      Private f32_2* %60 = OpVariable Private 
					                                     %61 = OpTypeInt 32 0 
					                                 u32 %62 = OpConstant 0 
					                                     %63 = OpTypePointer Input %6 
					                                     %66 = OpTypeStruct %24 
					                                     %67 = OpTypePointer Uniform %66 
					            Uniform struct {f32_4;}* %68 = OpVariable Uniform 
					                                     %69 = OpTypeInt 32 1 
					                                 i32 %70 = OpConstant 0 
					                                     %71 = OpTypePointer Uniform %6 
					                                     %75 = OpTypePointer Private %6 
					                                 f32 %79 = OpConstant 3,674022E-40 
					                        Private f32* %82 = OpVariable Private 
					                                     %90 = OpTypeBool 
					                                     %91 = OpTypePointer Private %90 
					                       Private bool* %92 = OpVariable Private 
					                                 f32 %97 = OpConstant 3,674022E-40 
					                                 f32 %98 = OpConstant 3,674022E-40 
					                               f32_3 %99 = OpConstantComposite %79 %97 %98 
					                                f32 %100 = OpConstant 3,674022E-40 
					                                f32 %101 = OpConstant 3,674022E-40 
					                              f32_3 %102 = OpConstantComposite %100 %101 %79 
					                                    %103 = OpTypeVector %90 3 
					                                f32 %107 = OpConstant 3,674022E-40 
					                                f32 %109 = OpConstant 3,674022E-40 
					                                u32 %112 = OpConstant 2 
					                                f32 %115 = OpConstant 3,674022E-40 
					                                u32 %122 = OpConstant 1 
					                     Private f32_3* %132 = OpVariable Private 
					                      Output f32_4* %150 = OpVariable Output 
					                              f32_4 %153 = OpConstantComposite %79 %79 %79 %79 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD0 
					                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                             OpStore %9 %26 
					                               f32_3 %28 = OpLoad %9 
					                               f32_3 %31 = OpExtInst %1 40 %28 %30 
					                                             OpStore %27 %31 
					                               f32_3 %33 = OpLoad %27 
					                               f32_3 %34 = OpExtInst %1 30 %33 
					                                             OpStore %32 %34 
					                               f32_3 %35 = OpLoad %32 
					                               f32_3 %38 = OpFMul %35 %37 
					                                             OpStore %32 %38 
					                               f32_3 %39 = OpLoad %32 
					                               f32_3 %40 = OpExtInst %1 29 %39 
					                                             OpStore %32 %40 
					                               f32_3 %41 = OpLoad %32 
					                               f32_3 %44 = OpFMul %41 %43 
					                               f32_3 %47 = OpFAdd %44 %46 
					                                             OpStore %32 %47 
					                               f32_3 %48 = OpLoad %32 
					                               f32_3 %49 = OpExtInst %1 40 %48 %30 
					                                             OpStore %32 %49 
					                               f32_3 %56 = OpLoad %32 
					                                 f32 %57 = OpDot %55 %56 
					                               f32_4 %58 = OpCompositeConstruct %57 %57 %57 %57 
					                                             OpStore %51 %58 
					                          Input f32* %64 = OpAccessChain vs_TEXCOORD0 %62 
					                                 f32 %65 = OpLoad %64 
					                        Uniform f32* %72 = OpAccessChain %68 %70 %62 
					                                 f32 %73 = OpLoad %72 
					                                 f32 %74 = OpFMul %65 %73 
					                        Private f32* %76 = OpAccessChain %60 %62 
					                                             OpStore %76 %74 
					                        Private f32* %77 = OpAccessChain %60 %62 
					                                 f32 %78 = OpLoad %77 
					                                 f32 %80 = OpFMul %78 %79 
					                        Private f32* %81 = OpAccessChain %60 %62 
					                                             OpStore %81 %80 
					                        Private f32* %83 = OpAccessChain %60 %62 
					                                 f32 %84 = OpLoad %83 
					                                 f32 %85 = OpExtInst %1 8 %84 
					                                             OpStore %82 %85 
					                        Private f32* %86 = OpAccessChain %60 %62 
					                                 f32 %87 = OpLoad %86 
					                                 f32 %88 = OpExtInst %1 10 %87 
					                        Private f32* %89 = OpAccessChain %60 %62 
					                                             OpStore %89 %88 
					                        Private f32* %93 = OpAccessChain %60 %62 
					                                 f32 %94 = OpLoad %93 
					                                bool %95 = OpFOrdLessThan %79 %94 
					                                             OpStore %92 %95 
					                                bool %96 = OpLoad %92 
					                             bool_3 %104 = OpCompositeConstruct %96 %96 %96 
					                              f32_3 %105 = OpSelect %104 %99 %102 
					                                             OpStore %27 %105 
					                                f32 %106 = OpLoad %82 
					                                f32 %108 = OpFMul %106 %107 
					                                f32 %110 = OpFAdd %108 %109 
					                       Private f32* %111 = OpAccessChain %60 %62 
					                                             OpStore %111 %110 
					                       Uniform f32* %113 = OpAccessChain %68 %70 %112 
					                                f32 %114 = OpLoad %113 
					                                f32 %116 = OpFAdd %114 %115 
					                                             OpStore %82 %116 
					                                f32 %117 = OpLoad %82 
					                       Private f32* %118 = OpAccessChain %60 %62 
					                                f32 %119 = OpLoad %118 
					                                f32 %120 = OpFMul %117 %119 
					                       Private f32* %121 = OpAccessChain %60 %62 
					                                             OpStore %121 %120 
					                         Input f32* %123 = OpAccessChain vs_TEXCOORD0 %122 
					                                f32 %124 = OpLoad %123 
					                       Private f32* %125 = OpAccessChain %60 %122 
					                                             OpStore %125 %124 
					                read_only Texture2D %126 = OpLoad %12 
					                            sampler %127 = OpLoad %16 
					         read_only Texture2DSampled %128 = OpSampledImage %126 %127 
					                              f32_2 %129 = OpLoad %60 
					                              f32_4 %130 = OpImageSampleImplicitLod %128 %129 
					                              f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
					                                             OpStore %9 %131 
					                              f32_3 %133 = OpLoad %9 
					                              f32_3 %134 = OpExtInst %1 40 %133 %30 
					                                             OpStore %132 %134 
					                              f32_3 %135 = OpLoad %132 
					                              f32_3 %136 = OpExtInst %1 30 %135 
					                                             OpStore %32 %136 
					                              f32_3 %137 = OpLoad %32 
					                              f32_3 %138 = OpFMul %137 %37 
					                                             OpStore %32 %138 
					                              f32_3 %139 = OpLoad %32 
					                              f32_3 %140 = OpExtInst %1 29 %139 
					                                             OpStore %32 %140 
					                              f32_3 %141 = OpLoad %32 
					                              f32_3 %142 = OpFMul %141 %43 
					                              f32_3 %143 = OpFAdd %142 %46 
					                                             OpStore %32 %143 
					                              f32_3 %144 = OpLoad %32 
					                              f32_3 %145 = OpExtInst %1 40 %144 %30 
					                                             OpStore %32 %145 
					                              f32_3 %146 = OpLoad %27 
					                              f32_3 %147 = OpLoad %32 
					                                f32 %148 = OpDot %146 %147 
					                       Private f32* %149 = OpAccessChain %27 %62 
					                                             OpStore %149 %148 
					                              f32_3 %151 = OpLoad %27 
					                              f32_4 %152 = OpVectorShuffle %151 %151 0 0 0 0 
					                              f32_4 %154 = OpFAdd %152 %153 
					                                             OpStore %150 %154 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_COLORSPACE_GAMMA" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					void main()
					{
					    gl_Position = in_POSITION0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
					    vs_TEXCOORD1.xy = vec2(0.0, 0.0);
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
					
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					void main()
					{
					    gl_Position = in_POSITION0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = vec2(0.0, 0.0);
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
					uniform 	vec4 _ScreenParams;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = vec4(dot(vec3(0.298999995, 0.587000012, 0.114), u_xlat10_0.xyz));
					    u_xlat0.x = vs_TEXCOORD0.x * _ScreenParams.x;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat2 = floor(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatb0 = 0.5<u_xlat0.x;
					    u_xlat0.xzw = (bool(u_xlatb0)) ? vec3(0.5, -0.418687999, -0.0813120008) : vec3(-0.168735996, -0.331263989, 0.5);
					    u_xlat2 = u_xlat2 * 2.0 + 1.0;
					    u_xlat1.x = _ScreenParams.z + -1.0;
					    u_xlat1.x = u_xlat2 * u_xlat1.x;
					    u_xlat1.y = vs_TEXCOORD0.y;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.x = dot(u_xlat0.xzw, u_xlat10_1.xyz);
					    SV_Target1 = u_xlat0.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
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
					; Bound: 42
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Vertex %4 "main" %13 %17 %23 %24 %34 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
					                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
					                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %17 Location 17 
					                                             OpDecorate vs_TEXCOORD0 Location 23 
					                                             OpDecorate %24 Location 24 
					                                             OpDecorate vs_TEXCOORD1 Location 34 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypeInt 32 0 
					                                  u32 %9 = OpConstant 1 
					                                     %10 = OpTypeArray %6 %9 
					                                     %11 = OpTypeStruct %7 %6 %10 
					                                     %12 = OpTypePointer Output %11 
					Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
					                                     %14 = OpTypeInt 32 1 
					                                 i32 %15 = OpConstant 0 
					                                     %16 = OpTypePointer Input %7 
					                        Input f32_4* %17 = OpVariable Input 
					                                     %19 = OpTypePointer Output %7 
					                                     %21 = OpTypeVector %6 2 
					                                     %22 = OpTypePointer Output %21 
					              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                        Input f32_4* %24 = OpVariable Input 
					                                 f32 %27 = OpConstant 3,674022E-40 
					                                 f32 %28 = OpConstant 3,674022E-40 
					                               f32_2 %29 = OpConstantComposite %27 %28 
					                                 f32 %31 = OpConstant 3,674022E-40 
					                               f32_2 %32 = OpConstantComposite %31 %27 
					              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                               f32_2 %35 = OpConstantComposite %31 %31 
					                                     %36 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_4 %18 = OpLoad %17 
					                       Output f32_4* %20 = OpAccessChain %13 %15 
					                                             OpStore %20 %18 
					                               f32_4 %25 = OpLoad %24 
					                               f32_2 %26 = OpVectorShuffle %25 %25 0 1 
					                               f32_2 %30 = OpFMul %26 %29 
					                               f32_2 %33 = OpFAdd %30 %32 
					                                             OpStore vs_TEXCOORD0 %33 
					                                             OpStore vs_TEXCOORD1 %35 
					                         Output f32* %37 = OpAccessChain %13 %15 %9 
					                                 f32 %38 = OpLoad %37 
					                                 f32 %39 = OpFNegate %38 
					                         Output f32* %40 = OpAccessChain %13 %15 %9 
					                                             OpStore %40 %39 
					                                             OpReturn
					                                             OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 120
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %28 %114 
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
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %28 RelaxedPrecision 
					                                             OpDecorate %28 Location 28 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpMemberDecorate %43 0 Offset 43 
					                                             OpDecorate %43 Block 
					                                             OpDecorate %45 DescriptorSet 45 
					                                             OpDecorate %45 Binding 45 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %114 Location 114 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
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
					                                     %24 = OpTypeVector %6 4 
					                                     %27 = OpTypePointer Output %24 
					                       Output f32_4* %28 = OpVariable Output 
					                                 f32 %29 = OpConstant 3,674022E-40 
					                                 f32 %30 = OpConstant 3,674022E-40 
					                                 f32 %31 = OpConstant 3,674022E-40 
					                               f32_3 %32 = OpConstantComposite %29 %30 %31 
					                                     %36 = OpTypePointer Private %20 
					                      Private f32_2* %37 = OpVariable Private 
					                                     %38 = OpTypeInt 32 0 
					                                 u32 %39 = OpConstant 0 
					                                     %40 = OpTypePointer Input %6 
					                                     %43 = OpTypeStruct %24 
					                                     %44 = OpTypePointer Uniform %43 
					            Uniform struct {f32_4;}* %45 = OpVariable Uniform 
					                                     %46 = OpTypeInt 32 1 
					                                 i32 %47 = OpConstant 0 
					                                     %48 = OpTypePointer Uniform %6 
					                                     %52 = OpTypePointer Private %6 
					                                 f32 %56 = OpConstant 3,674022E-40 
					                        Private f32* %59 = OpVariable Private 
					                                     %67 = OpTypeBool 
					                                     %68 = OpTypePointer Private %67 
					                       Private bool* %69 = OpVariable Private 
					                      Private f32_3* %73 = OpVariable Private 
					                                 f32 %75 = OpConstant 3,674022E-40 
					                                 f32 %76 = OpConstant 3,674022E-40 
					                               f32_3 %77 = OpConstantComposite %56 %75 %76 
					                                 f32 %78 = OpConstant 3,674022E-40 
					                                 f32 %79 = OpConstant 3,674022E-40 
					                               f32_3 %80 = OpConstantComposite %78 %79 %56 
					                                     %81 = OpTypeVector %67 3 
					                                 f32 %85 = OpConstant 3,674022E-40 
					                                 f32 %87 = OpConstant 3,674022E-40 
					                                 u32 %90 = OpConstant 2 
					                                 f32 %93 = OpConstant 3,674022E-40 
					                                u32 %100 = OpConstant 1 
					                      Output f32_4* %114 = OpVariable Output 
					                              f32_4 %117 = OpConstantComposite %56 %56 %56 %56 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD0 
					                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                             OpStore %9 %26 
					                               f32_3 %33 = OpLoad %9 
					                                 f32 %34 = OpDot %32 %33 
					                               f32_4 %35 = OpCompositeConstruct %34 %34 %34 %34 
					                                             OpStore %28 %35 
					                          Input f32* %41 = OpAccessChain vs_TEXCOORD0 %39 
					                                 f32 %42 = OpLoad %41 
					                        Uniform f32* %49 = OpAccessChain %45 %47 %39 
					                                 f32 %50 = OpLoad %49 
					                                 f32 %51 = OpFMul %42 %50 
					                        Private f32* %53 = OpAccessChain %37 %39 
					                                             OpStore %53 %51 
					                        Private f32* %54 = OpAccessChain %37 %39 
					                                 f32 %55 = OpLoad %54 
					                                 f32 %57 = OpFMul %55 %56 
					                        Private f32* %58 = OpAccessChain %37 %39 
					                                             OpStore %58 %57 
					                        Private f32* %60 = OpAccessChain %37 %39 
					                                 f32 %61 = OpLoad %60 
					                                 f32 %62 = OpExtInst %1 8 %61 
					                                             OpStore %59 %62 
					                        Private f32* %63 = OpAccessChain %37 %39 
					                                 f32 %64 = OpLoad %63 
					                                 f32 %65 = OpExtInst %1 10 %64 
					                        Private f32* %66 = OpAccessChain %37 %39 
					                                             OpStore %66 %65 
					                        Private f32* %70 = OpAccessChain %37 %39 
					                                 f32 %71 = OpLoad %70 
					                                bool %72 = OpFOrdLessThan %56 %71 
					                                             OpStore %69 %72 
					                                bool %74 = OpLoad %69 
					                              bool_3 %82 = OpCompositeConstruct %74 %74 %74 
					                               f32_3 %83 = OpSelect %82 %77 %80 
					                                             OpStore %73 %83 
					                                 f32 %84 = OpLoad %59 
					                                 f32 %86 = OpFMul %84 %85 
					                                 f32 %88 = OpFAdd %86 %87 
					                        Private f32* %89 = OpAccessChain %37 %39 
					                                             OpStore %89 %88 
					                        Uniform f32* %91 = OpAccessChain %45 %47 %90 
					                                 f32 %92 = OpLoad %91 
					                                 f32 %94 = OpFAdd %92 %93 
					                                             OpStore %59 %94 
					                                 f32 %95 = OpLoad %59 
					                        Private f32* %96 = OpAccessChain %37 %39 
					                                 f32 %97 = OpLoad %96 
					                                 f32 %98 = OpFMul %95 %97 
					                        Private f32* %99 = OpAccessChain %37 %39 
					                                             OpStore %99 %98 
					                         Input f32* %101 = OpAccessChain vs_TEXCOORD0 %100 
					                                f32 %102 = OpLoad %101 
					                       Private f32* %103 = OpAccessChain %37 %100 
					                                             OpStore %103 %102 
					                read_only Texture2D %104 = OpLoad %12 
					                            sampler %105 = OpLoad %16 
					         read_only Texture2DSampled %106 = OpSampledImage %104 %105 
					                              f32_2 %107 = OpLoad %37 
					                              f32_4 %108 = OpImageSampleImplicitLod %106 %107 
					                              f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
					                                             OpStore %9 %109 
					                              f32_3 %110 = OpLoad %73 
					                              f32_3 %111 = OpLoad %9 
					                                f32 %112 = OpDot %110 %111 
					                       Private f32* %113 = OpAccessChain %73 %39 
					                                             OpStore %113 %112 
					                              f32_3 %115 = OpLoad %73 
					                              f32_4 %116 = OpVectorShuffle %115 %115 0 0 0 0 
					                              f32_4 %118 = OpFAdd %116 %117 
					                                             OpStore %114 %118 
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
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[6];
						vec4 _ScreenParams;
						vec4 unused_0_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec2 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0 = vec4(dot(vec3(0.298999995, 0.587000012, 0.114), u_xlat16_0.xyz));
					    u_xlat0.x = vs_TEXCOORD0.x * _ScreenParams.x;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat2 = floor(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatb0 = 0.5<u_xlat0.x;
					    u_xlat0.xzw = (bool(u_xlatb0)) ? vec3(0.5, -0.418687999, -0.0813120008) : vec3(-0.168735996, -0.331263989, 0.5);
					    u_xlat2 = u_xlat2 * 2.0 + 1.0;
					    u_xlat1.x = _ScreenParams.z + -1.0;
					    u_xlat1.x = u_xlat2 * u_xlat1.x;
					    u_xlat1.y = vs_TEXCOORD0.y;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.x = dot(u_xlat0.xzw, u_xlat16_1.xyz);
					    SV_Target1 = u_xlat0.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
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
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[6];
						vec4 _ScreenParams;
						vec4 unused_0_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = vec4(dot(vec3(0.298999995, 0.587000012, 0.114), u_xlat10_0.xyz));
					    u_xlat0.x = vs_TEXCOORD0.x * _ScreenParams.x;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat2 = floor(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatb0 = 0.5<u_xlat0.x;
					    u_xlat0.xzw = (bool(u_xlatb0)) ? vec3(0.5, -0.418687999, -0.0813120008) : vec3(-0.168735996, -0.331263989, 0.5);
					    u_xlat2 = u_xlat2 * 2.0 + 1.0;
					    u_xlat1.x = _ScreenParams.z + -1.0;
					    u_xlat1.x = u_xlat2 * u_xlat1.x;
					    u_xlat1.y = vs_TEXCOORD0.y;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.x = dot(u_xlat0.xzw, u_xlat10_1.xyz);
					    SV_Target1 = u_xlat0.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
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
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 509180
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
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
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
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
					uniform 	float _History1Weight;
					uniform 	float _History2Weight;
					uniform 	float _History3Weight;
					uniform 	float _History4Weight;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _History1LumaTex;
					UNITY_LOCATION(2) uniform  sampler2D _History1ChromaTex;
					UNITY_LOCATION(3) uniform  sampler2D _History2LumaTex;
					UNITY_LOCATION(4) uniform  sampler2D _History2ChromaTex;
					UNITY_LOCATION(5) uniform  sampler2D _History3LumaTex;
					UNITY_LOCATION(6) uniform  sampler2D _History3ChromaTex;
					UNITY_LOCATION(7) uniform  sampler2D _History4LumaTex;
					UNITY_LOCATION(8) uniform  sampler2D _History4ChromaTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat15;
					float u_xlat16_15;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = u_xlat10_0.w;
					    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat10_1 = texture(_History1LumaTex, vs_TEXCOORD1.xy);
					    u_xlat15 = vs_TEXCOORD1.x * _MainTex_TexelSize.z;
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat15 = floor(u_xlat15);
					    u_xlat15 = u_xlat15 * 2.0 + 0.5;
					    u_xlat2.z = u_xlat15 * _MainTex_TexelSize.x + _MainTex_TexelSize.x;
					    u_xlat2.x = u_xlat15 * _MainTex_TexelSize.x;
					    u_xlat2.yw = vs_TEXCOORD1.yy;
					    u_xlat10_3 = texture(_History1ChromaTex, u_xlat2.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History1ChromaTex, u_xlat2.xy);
					    u_xlat16_15 = u_xlat10_4.x + -0.5;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat1.xyz = u_xlat10_1.xxx + u_xlat3.xzw;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History1Weight, _History1Weight, _History1Weight)) + u_xlat16_0.xyz;
					    u_xlat10_1 = texture(_History2LumaTex, vs_TEXCOORD1.xy);
					    u_xlat10_3 = texture(_History2ChromaTex, u_xlat2.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History2ChromaTex, u_xlat2.xy);
					    u_xlat16_15 = u_xlat10_4.x + -0.5;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat1.xyz = u_xlat10_1.xxx + u_xlat3.xzw;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(_History2Weight) + u_xlat0.xyz;
					    u_xlat10_1 = texture(_History3ChromaTex, u_xlat2.zw);
					    u_xlat10_3 = texture(_History4ChromaTex, u_xlat2.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat16_15 = u_xlat10_1.x + -0.5;
					    u_xlat1.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History3ChromaTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_History4ChromaTex, u_xlat2.xy);
					    u_xlat16_15 = u_xlat10_2.x + -0.5;
					    u_xlat16_2 = u_xlat10_4.x + -0.5;
					    u_xlat1.z = u_xlat16_2 * -0.344139993 + (-u_xlat1.y);
					    u_xlat1.w = u_xlat16_2 * 1.77199996;
					    u_xlat10_2 = texture(_History3LumaTex, vs_TEXCOORD1.xy);
					    u_xlat1.xyz = u_xlat1.xzw + u_xlat10_2.xxx;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History3Weight, _History3Weight, _History3Weight)) + u_xlat0.xyz;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat10_1 = texture(_History4LumaTex, vs_TEXCOORD1.xy);
					    u_xlat1.xyz = u_xlat3.xzw + u_xlat10_1.xxx;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History4Weight, _History4Weight, _History4Weight)) + u_xlat0.xyz;
					    u_xlat15 = _History1Weight + _History2Weight;
					    u_xlat15 = u_xlat15 + _History3Weight;
					    u_xlat15 = u_xlat15 + _History4Weight;
					    u_xlat15 = u_xlat15 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat15);
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
					; Bound: 131
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %119 %122 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate vs_TEXCOORD0 Location 119 
					                                                     OpDecorate vs_TEXCOORD1 Location 122 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                              Private f32_4* %99 = OpVariable Private 
					                                            %101 = OpTypePointer Function %6 
					                                        u32 %110 = OpConstant 3 
					                                            %112 = OpTypeVector %6 3 
					                                            %117 = OpTypeVector %6 2 
					                                            %118 = OpTypePointer Output %117 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %125 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %102 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                       bool %100 = OpLoad %84 
					                                                     OpSelectionMerge %104 None 
					                                                     OpBranchConditional %100 %103 %106 
					                                            %103 = OpLabel 
					                                        f32 %105 = OpLoad %91 
					                                                     OpStore %102 %105 
					                                                     OpBranch %104 
					                                            %106 = OpLabel 
					                                 Input f32* %107 = OpAccessChain %92 %68 
					                                        f32 %108 = OpLoad %107 
					                                                     OpStore %102 %108 
					                                                     OpBranch %104 
					                                            %104 = OpLabel 
					                                        f32 %109 = OpLoad %102 
					                               Private f32* %111 = OpAccessChain %99 %110 
					                                                     OpStore %111 %109 
					                                      f32_4 %113 = OpLoad %92 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 1 0 
					                                      f32_4 %115 = OpLoad %99 
					                                      f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
					                                                     OpStore %99 %116 
					                                      f32_4 %120 = OpLoad %99 
					                                      f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                                     OpStore vs_TEXCOORD0 %121 
					                                      f32_4 %123 = OpLoad %99 
					                                      f32_2 %124 = OpVectorShuffle %123 %123 2 3 
					                                                     OpStore vs_TEXCOORD1 %124 
					                                Output f32* %126 = OpAccessChain %72 %22 %68 
					                                        f32 %127 = OpLoad %126 
					                                        f32 %128 = OpFNegate %127 
					                                Output f32* %129 = OpAccessChain %72 %22 %68 
					                                                     OpStore %129 %128 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 432
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %22 %72 %429 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %12 RelaxedPrecision 
					                                                     OpDecorate %12 DescriptorSet 12 
					                                                     OpDecorate %12 Binding 12 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %16 RelaxedPrecision 
					                                                     OpDecorate %16 DescriptorSet 16 
					                                                     OpDecorate %16 Binding 16 
					                                                     OpDecorate %17 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 22 
					                                                     OpDecorate %27 RelaxedPrecision 
					                                                     OpDecorate %33 RelaxedPrecision 
					                                                     OpDecorate %34 RelaxedPrecision 
					                                                     OpDecorate %35 RelaxedPrecision 
					                                                     OpDecorate %38 RelaxedPrecision 
					                                                     OpDecorate %39 RelaxedPrecision 
					                                                     OpDecorate %42 RelaxedPrecision 
					                                                     OpDecorate %45 RelaxedPrecision 
					                                                     OpDecorate %46 RelaxedPrecision 
					                                                     OpDecorate %47 RelaxedPrecision 
					                                                     OpDecorate %50 RelaxedPrecision 
					                                                     OpDecorate %51 RelaxedPrecision 
					                                                     OpDecorate %54 RelaxedPrecision 
					                                                     OpDecorate %57 RelaxedPrecision 
					                                                     OpDecorate %60 RelaxedPrecision 
					                                                     OpDecorate %61 RelaxedPrecision 
					                                                     OpDecorate %62 RelaxedPrecision 
					                                                     OpDecorate %66 RelaxedPrecision 
					                                                     OpDecorate %67 RelaxedPrecision 
					                                                     OpDecorate %67 DescriptorSet 67 
					                                                     OpDecorate %67 Binding 67 
					                                                     OpDecorate %68 RelaxedPrecision 
					                                                     OpDecorate %69 RelaxedPrecision 
					                                                     OpDecorate %69 DescriptorSet 69 
					                                                     OpDecorate %69 Binding 69 
					                                                     OpDecorate %70 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 Location 72 
					                                                     OpDecorate %77 RelaxedPrecision 
					                                                     OpMemberDecorate %82 0 Offset 82 
					                                                     OpMemberDecorate %82 1 RelaxedPrecision 
					                                                     OpMemberDecorate %82 1 Offset 82 
					                                                     OpMemberDecorate %82 2 RelaxedPrecision 
					                                                     OpMemberDecorate %82 2 Offset 82 
					                                                     OpMemberDecorate %82 3 RelaxedPrecision 
					                                                     OpMemberDecorate %82 3 Offset 82 
					                                                     OpMemberDecorate %82 4 RelaxedPrecision 
					                                                     OpMemberDecorate %82 4 Offset 82 
					                                                     OpDecorate %82 Block 
					                                                     OpDecorate %84 DescriptorSet 84 
					                                                     OpDecorate %84 Binding 84 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                                     OpDecorate %120 RelaxedPrecision 
					                                                     OpDecorate %120 DescriptorSet 120 
					                                                     OpDecorate %120 Binding 120 
					                                                     OpDecorate %121 RelaxedPrecision 
					                                                     OpDecorate %122 RelaxedPrecision 
					                                                     OpDecorate %122 DescriptorSet 122 
					                                                     OpDecorate %122 Binding 122 
					                                                     OpDecorate %123 RelaxedPrecision 
					                                                     OpDecorate %128 RelaxedPrecision 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %134 RelaxedPrecision 
					                                                     OpDecorate %135 RelaxedPrecision 
					                                                     OpDecorate %139 RelaxedPrecision 
					                                                     OpDecorate %142 RelaxedPrecision 
					                                                     OpDecorate %143 RelaxedPrecision 
					                                                     OpDecorate %144 RelaxedPrecision 
					                                                     OpDecorate %149 RelaxedPrecision 
					                                                     OpDecorate %150 RelaxedPrecision 
					                                                     OpDecorate %151 RelaxedPrecision 
					                                                     OpDecorate %152 RelaxedPrecision 
					                                                     OpDecorate %155 RelaxedPrecision 
					                                                     OpDecorate %157 RelaxedPrecision 
					                                                     OpDecorate %160 RelaxedPrecision 
					                                                     OpDecorate %161 RelaxedPrecision 
					                                                     OpDecorate %162 RelaxedPrecision 
					                                                     OpDecorate %165 RelaxedPrecision 
					                                                     OpDecorate %167 RelaxedPrecision 
					                                                     OpDecorate %170 RelaxedPrecision 
					                                                     OpDecorate %171 RelaxedPrecision 
					                                                     OpDecorate %172 RelaxedPrecision 
					                                                     OpDecorate %173 RelaxedPrecision 
					                                                     OpDecorate %174 RelaxedPrecision 
					                                                     OpDecorate %175 RelaxedPrecision 
					                                                     OpDecorate %176 RelaxedPrecision 
					                                                     OpDecorate %179 RelaxedPrecision 
					                                                     OpDecorate %181 RelaxedPrecision 
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
					                                                     OpDecorate %194 DescriptorSet 194 
					                                                     OpDecorate %194 Binding 194 
					                                                     OpDecorate %195 RelaxedPrecision 
					                                                     OpDecorate %196 RelaxedPrecision 
					                                                     OpDecorate %196 DescriptorSet 196 
					                                                     OpDecorate %196 Binding 196 
					                                                     OpDecorate %197 RelaxedPrecision 
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
					                                                     OpDecorate %211 RelaxedPrecision 
					                                                     OpDecorate %212 RelaxedPrecision 
					                                                     OpDecorate %213 RelaxedPrecision 
					                                                     OpDecorate %214 RelaxedPrecision 
					                                                     OpDecorate %215 RelaxedPrecision 
					                                                     OpDecorate %216 RelaxedPrecision 
					                                                     OpDecorate %217 RelaxedPrecision 
					                                                     OpDecorate %220 RelaxedPrecision 
					                                                     OpDecorate %221 RelaxedPrecision 
					                                                     OpDecorate %226 RelaxedPrecision 
					                                                     OpDecorate %227 RelaxedPrecision 
					                                                     OpDecorate %228 RelaxedPrecision 
					                                                     OpDecorate %229 RelaxedPrecision 
					                                                     OpDecorate %230 RelaxedPrecision 
					                                                     OpDecorate %232 RelaxedPrecision 
					                                                     OpDecorate %233 RelaxedPrecision 
					                                                     OpDecorate %234 RelaxedPrecision 
					                                                     OpDecorate %236 RelaxedPrecision 
					                                                     OpDecorate %237 RelaxedPrecision 
					                                                     OpDecorate %239 RelaxedPrecision 
					                                                     OpDecorate %240 RelaxedPrecision 
					                                                     OpDecorate %241 RelaxedPrecision 
					                                                     OpDecorate %242 RelaxedPrecision 
					                                                     OpDecorate %243 RelaxedPrecision 
					                                                     OpDecorate %244 RelaxedPrecision 
					                                                     OpDecorate %245 RelaxedPrecision 
					                                                     OpDecorate %248 RelaxedPrecision 
					                                                     OpDecorate %250 RelaxedPrecision 
					                                                     OpDecorate %252 RelaxedPrecision 
					                                                     OpDecorate %253 RelaxedPrecision 
					                                                     OpDecorate %254 RelaxedPrecision 
					                                                     OpDecorate %255 RelaxedPrecision 
					                                                     OpDecorate %256 RelaxedPrecision 
					                                                     OpDecorate %257 RelaxedPrecision 
					                                                     OpDecorate %258 RelaxedPrecision 
					                                                     OpDecorate %259 RelaxedPrecision 
					                                                     OpDecorate %260 RelaxedPrecision 
					                                                     OpDecorate %263 RelaxedPrecision 
					                                                     OpDecorate %263 DescriptorSet 263 
					                                                     OpDecorate %263 Binding 263 
					                                                     OpDecorate %264 RelaxedPrecision 
					                                                     OpDecorate %265 RelaxedPrecision 
					                                                     OpDecorate %265 DescriptorSet 265 
					                                                     OpDecorate %265 Binding 265 
					                                                     OpDecorate %266 RelaxedPrecision 
					                                                     OpDecorate %273 RelaxedPrecision 
					                                                     OpDecorate %273 DescriptorSet 273 
					                                                     OpDecorate %273 Binding 273 
					                                                     OpDecorate %274 RelaxedPrecision 
					                                                     OpDecorate %275 RelaxedPrecision 
					                                                     OpDecorate %275 DescriptorSet 275 
					                                                     OpDecorate %275 Binding 275 
					                                                     OpDecorate %276 RelaxedPrecision 
					                                                     OpDecorate %297 RelaxedPrecision 
					                                                     OpDecorate %298 RelaxedPrecision 
					                                                     OpDecorate %305 RelaxedPrecision 
					                                                     OpDecorate %306 RelaxedPrecision 
					                                                     OpDecorate %319 RelaxedPrecision 
					                                                     OpDecorate %320 RelaxedPrecision 
					                                                     OpDecorate %327 RelaxedPrecision 
					                                                     OpDecorate %327 DescriptorSet 327 
					                                                     OpDecorate %327 Binding 327 
					                                                     OpDecorate %328 RelaxedPrecision 
					                                                     OpDecorate %329 RelaxedPrecision 
					                                                     OpDecorate %329 DescriptorSet 329 
					                                                     OpDecorate %329 Binding 329 
					                                                     OpDecorate %330 RelaxedPrecision 
					                                                     OpDecorate %334 RelaxedPrecision 
					                                                     OpDecorate %335 RelaxedPrecision 
					                                                     OpDecorate %336 RelaxedPrecision 
					                                                     OpDecorate %337 RelaxedPrecision 
					                                                     OpDecorate %338 RelaxedPrecision 
					                                                     OpDecorate %339 RelaxedPrecision 
					                                                     OpDecorate %340 RelaxedPrecision 
					                                                     OpDecorate %343 RelaxedPrecision 
					                                                     OpDecorate %345 RelaxedPrecision 
					                                                     OpDecorate %347 RelaxedPrecision 
					                                                     OpDecorate %348 RelaxedPrecision 
					                                                     OpDecorate %349 RelaxedPrecision 
					                                                     OpDecorate %350 RelaxedPrecision 
					                                                     OpDecorate %351 RelaxedPrecision 
					                                                     OpDecorate %352 RelaxedPrecision 
					                                                     OpDecorate %353 RelaxedPrecision 
					                                                     OpDecorate %354 RelaxedPrecision 
					                                                     OpDecorate %355 RelaxedPrecision 
					                                                     OpDecorate %360 RelaxedPrecision 
					                                                     OpDecorate %361 RelaxedPrecision 
					                                                     OpDecorate %368 RelaxedPrecision 
					                                                     OpDecorate %368 DescriptorSet 368 
					                                                     OpDecorate %368 Binding 368 
					                                                     OpDecorate %369 RelaxedPrecision 
					                                                     OpDecorate %370 RelaxedPrecision 
					                                                     OpDecorate %370 DescriptorSet 370 
					                                                     OpDecorate %370 Binding 370 
					                                                     OpDecorate %371 RelaxedPrecision 
					                                                     OpDecorate %375 RelaxedPrecision 
					                                                     OpDecorate %376 RelaxedPrecision 
					                                                     OpDecorate %377 RelaxedPrecision 
					                                                     OpDecorate %378 RelaxedPrecision 
					                                                     OpDecorate %379 RelaxedPrecision 
					                                                     OpDecorate %380 RelaxedPrecision 
					                                                     OpDecorate %381 RelaxedPrecision 
					                                                     OpDecorate %384 RelaxedPrecision 
					                                                     OpDecorate %385 RelaxedPrecision 
					                                                     OpDecorate %386 RelaxedPrecision 
					                                                     OpDecorate %387 RelaxedPrecision 
					                                                     OpDecorate %388 RelaxedPrecision 
					                                                     OpDecorate %389 RelaxedPrecision 
					                                                     OpDecorate %391 RelaxedPrecision 
					                                                     OpDecorate %393 RelaxedPrecision 
					                                                     OpDecorate %394 RelaxedPrecision 
					                                                     OpDecorate %395 RelaxedPrecision 
					                                                     OpDecorate %397 RelaxedPrecision 
					                                                     OpDecorate %398 RelaxedPrecision 
					                                                     OpDecorate %399 RelaxedPrecision 
					                                                     OpDecorate %401 RelaxedPrecision 
					                                                     OpDecorate %402 RelaxedPrecision 
					                                                     OpDecorate %403 RelaxedPrecision 
					                                                     OpDecorate %405 RelaxedPrecision 
					                                                     OpDecorate %406 RelaxedPrecision 
					                                                     OpDecorate %407 RelaxedPrecision 
					                                                     OpDecorate %408 RelaxedPrecision 
					                                                     OpDecorate %409 RelaxedPrecision 
					                                                     OpDecorate %410 RelaxedPrecision 
					                                                     OpDecorate %413 RelaxedPrecision 
					                                                     OpDecorate %416 RelaxedPrecision 
					                                                     OpDecorate %417 RelaxedPrecision 
					                                                     OpDecorate %418 RelaxedPrecision 
					                                                     OpDecorate %419 RelaxedPrecision 
					                                                     OpDecorate %422 RelaxedPrecision 
					                                                     OpDecorate %423 RelaxedPrecision 
					                                                     OpDecorate %424 RelaxedPrecision 
					                                                     OpDecorate %425 RelaxedPrecision 
					                                                     OpDecorate %429 RelaxedPrecision 
					                                                     OpDecorate %429 Location 429 
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
					                                             %25 = OpTypeVector %6 3 
					                                             %26 = OpTypePointer Private %25 
					                              Private f32_3* %27 = OpVariable Private 
					                                         f32 %30 = OpConstant 3,674022E-40 
					                                       f32_3 %31 = OpConstantComposite %30 %30 %30 
					                              Private f32_4* %33 = OpVariable Private 
					                                         f32 %40 = OpConstant 3,674022E-40 
					                                       f32_3 %41 = OpConstantComposite %40 %40 %40 
					                                         f32 %52 = OpConstant 3,674022E-40 
					                                       f32_3 %53 = OpConstantComposite %52 %52 %52 
					                                         f32 %55 = OpConstant 3,674022E-40 
					                                       f32_3 %56 = OpConstantComposite %55 %55 %55 
					                                             %65 = OpTypePointer Private %6 
					                                Private f32* %66 = OpVariable Private 
					        UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
					                    UniformConstant sampler* %69 = OpVariable UniformConstant 
					                       Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                             %75 = OpTypeInt 32 0 
					                                         u32 %76 = OpConstant 0 
					                                Private f32* %78 = OpVariable Private 
					                                             %79 = OpTypePointer Input %6 
					                                             %82 = OpTypeStruct %7 %6 %6 %6 %6 
					                                             %83 = OpTypePointer Uniform %82 
					Uniform struct {f32_4; f32; f32; f32; f32;}* %84 = OpVariable Uniform 
					                                             %85 = OpTypeInt 32 1 
					                                         i32 %86 = OpConstant 0 
					                                         u32 %87 = OpConstant 2 
					                                             %88 = OpTypePointer Uniform %6 
					                                         f32 %93 = OpConstant 3,674022E-40 
					                                         f32 %98 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                               Private f32* %119 = OpVariable Private 
					       UniformConstant read_only Texture2D* %120 = OpVariable UniformConstant 
					                   UniformConstant sampler* %122 = OpVariable UniformConstant 
					                             Private f32_4* %129 = OpVariable Private 
					                                        f32 %131 = OpConstant 3,674022E-40 
					                                        f32 %136 = OpConstant 3,674022E-40 
					                                        f32 %137 = OpConstant 3,674022E-40 
					                                      f32_2 %138 = OpConstantComposite %136 %137 
					                               Private f32* %142 = OpVariable Private 
					                             Private f32_3* %150 = OpVariable Private 
					                                        f32 %156 = OpConstant 3,674022E-40 
					                                        u32 %158 = OpConstant 1 
					                                        f32 %166 = OpConstant 3,674022E-40 
					                                        u32 %168 = OpConstant 3 
					                             Private f32_3* %170 = OpVariable Private 
					                                        i32 %177 = OpConstant 1 
					                               Private f32* %193 = OpVariable Private 
					       UniformConstant read_only Texture2D* %194 = OpVariable UniformConstant 
					                   UniformConstant sampler* %196 = OpVariable UniformConstant 
					                               Private f32* %202 = OpVariable Private 
					       UniformConstant read_only Texture2D* %203 = OpVariable UniformConstant 
					                   UniformConstant sampler* %205 = OpVariable UniformConstant 
					                               Private f32* %212 = OpVariable Private 
					                             Private f32_3* %239 = OpVariable Private 
					                                        i32 %246 = OpConstant 2 
					                                            %261 = OpTypePointer Private %20 
					                             Private f32_2* %262 = OpVariable Private 
					       UniformConstant read_only Texture2D* %263 = OpVariable UniformConstant 
					                   UniformConstant sampler* %265 = OpVariable UniformConstant 
					       UniformConstant read_only Texture2D* %273 = OpVariable UniformConstant 
					                   UniformConstant sampler* %275 = OpVariable UniformConstant 
					                                      f32_2 %284 = OpConstantComposite %131 %131 
					                             Private f32_2* %296 = OpVariable Private 
					       UniformConstant read_only Texture2D* %327 = OpVariable UniformConstant 
					                   UniformConstant sampler* %329 = OpVariable UniformConstant 
					                                        i32 %341 = OpConstant 3 
					       UniformConstant read_only Texture2D* %368 = OpVariable UniformConstant 
					                   UniformConstant sampler* %370 = OpVariable UniformConstant 
					                                        i32 %382 = OpConstant 4 
					                               Private f32* %389 = OpVariable Private 
					                                        f32 %404 = OpConstant 3,674022E-40 
					                                        f32 %411 = OpConstant 3,674022E-40 
					                                      f32_3 %412 = OpConstantComposite %411 %411 %411 
					                                        f32 %414 = OpConstant 3,674022E-40 
					                                      f32_3 %415 = OpConstantComposite %414 %414 %414 
					                                        f32 %420 = OpConstant 3,674022E-40 
					                                      f32_3 %421 = OpConstantComposite %420 %420 %420 
					                                            %428 = OpTypePointer Output %7 
					                              Output f32_4* %429 = OpVariable Output 
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
					                                       f32_3 %32 = OpExtInst %1 40 %29 %31 
					                                                     OpStore %27 %32 
					                                       f32_3 %34 = OpLoad %27 
					                                       f32_3 %35 = OpExtInst %1 30 %34 
					                                       f32_4 %36 = OpLoad %33 
					                                       f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
					                                                     OpStore %33 %37 
					                                       f32_4 %38 = OpLoad %33 
					                                       f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
					                                       f32_3 %42 = OpFMul %39 %41 
					                                       f32_4 %43 = OpLoad %33 
					                                       f32_4 %44 = OpVectorShuffle %43 %42 4 5 6 3 
					                                                     OpStore %33 %44 
					                                       f32_4 %45 = OpLoad %33 
					                                       f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
					                                       f32_3 %47 = OpExtInst %1 29 %46 
					                                       f32_4 %48 = OpLoad %33 
					                                       f32_4 %49 = OpVectorShuffle %48 %47 4 5 6 3 
					                                                     OpStore %33 %49 
					                                       f32_4 %50 = OpLoad %33 
					                                       f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
					                                       f32_3 %54 = OpFMul %51 %53 
					                                       f32_3 %57 = OpFAdd %54 %56 
					                                       f32_4 %58 = OpLoad %33 
					                                       f32_4 %59 = OpVectorShuffle %58 %57 4 5 6 3 
					                                                     OpStore %33 %59 
					                                       f32_4 %60 = OpLoad %33 
					                                       f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
					                                       f32_3 %62 = OpExtInst %1 40 %61 %31 
					                                       f32_4 %63 = OpLoad %33 
					                                       f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
					                                                     OpStore %33 %64 
					                         read_only Texture2D %68 = OpLoad %67 
					                                     sampler %70 = OpLoad %69 
					                  read_only Texture2DSampled %71 = OpSampledImage %68 %70 
					                                       f32_2 %73 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %74 = OpImageSampleImplicitLod %71 %73 
					                                         f32 %77 = OpCompositeExtract %74 0 
					                                                     OpStore %66 %77 
					                                  Input f32* %80 = OpAccessChain vs_TEXCOORD1 %76 
					                                         f32 %81 = OpLoad %80 
					                                Uniform f32* %89 = OpAccessChain %84 %86 %87 
					                                         f32 %90 = OpLoad %89 
					                                         f32 %91 = OpFMul %81 %90 
					                                                     OpStore %78 %91 
					                                         f32 %92 = OpLoad %78 
					                                         f32 %94 = OpFMul %92 %93 
					                                                     OpStore %78 %94 
					                                         f32 %95 = OpLoad %78 
					                                         f32 %96 = OpExtInst %1 8 %95 
					                                                     OpStore %78 %96 
					                                         f32 %97 = OpLoad %78 
					                                         f32 %99 = OpFMul %97 %98 
					                                        f32 %100 = OpFAdd %99 %93 
					                                                     OpStore %78 %100 
					                                        f32 %102 = OpLoad %78 
					                               Uniform f32* %103 = OpAccessChain %84 %86 %76 
					                                        f32 %104 = OpLoad %103 
					                                        f32 %105 = OpFMul %102 %104 
					                               Uniform f32* %106 = OpAccessChain %84 %86 %76 
					                                        f32 %107 = OpLoad %106 
					                                        f32 %108 = OpFAdd %105 %107 
					                               Private f32* %109 = OpAccessChain %101 %87 
					                                                     OpStore %109 %108 
					                                        f32 %110 = OpLoad %78 
					                               Uniform f32* %111 = OpAccessChain %84 %86 %76 
					                                        f32 %112 = OpLoad %111 
					                                        f32 %113 = OpFMul %110 %112 
					                               Private f32* %114 = OpAccessChain %101 %76 
					                                                     OpStore %114 %113 
					                                      f32_2 %115 = OpLoad vs_TEXCOORD1 
					                                      f32_2 %116 = OpVectorShuffle %115 %115 1 1 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 0 4 2 5 
					                                                     OpStore %101 %118 
					                        read_only Texture2D %121 = OpLoad %120 
					                                    sampler %123 = OpLoad %122 
					                 read_only Texture2DSampled %124 = OpSampledImage %121 %123 
					                                      f32_4 %125 = OpLoad %101 
					                                      f32_2 %126 = OpVectorShuffle %125 %125 2 3 
					                                      f32_4 %127 = OpImageSampleImplicitLod %124 %126 
					                                        f32 %128 = OpCompositeExtract %127 0 
					                                                     OpStore %119 %128 
					                                        f32 %130 = OpLoad %119 
					                                        f32 %132 = OpFAdd %130 %131 
					                               Private f32* %133 = OpAccessChain %129 %76 
					                                                     OpStore %133 %132 
					                                      f32_4 %134 = OpLoad %129 
					                                      f32_2 %135 = OpVectorShuffle %134 %134 0 0 
					                                      f32_2 %139 = OpFMul %135 %138 
					                                      f32_4 %140 = OpLoad %129 
					                                      f32_4 %141 = OpVectorShuffle %140 %139 4 5 2 3 
					                                                     OpStore %129 %141 
					                        read_only Texture2D %143 = OpLoad %120 
					                                    sampler %144 = OpLoad %122 
					                 read_only Texture2DSampled %145 = OpSampledImage %143 %144 
					                                      f32_4 %146 = OpLoad %101 
					                                      f32_2 %147 = OpVectorShuffle %146 %146 0 1 
					                                      f32_4 %148 = OpImageSampleImplicitLod %145 %147 
					                                        f32 %149 = OpCompositeExtract %148 0 
					                                                     OpStore %142 %149 
					                                        f32 %151 = OpLoad %142 
					                                        f32 %152 = OpFAdd %151 %131 
					                               Private f32* %153 = OpAccessChain %150 %76 
					                                                     OpStore %153 %152 
					                               Private f32* %154 = OpAccessChain %150 %76 
					                                        f32 %155 = OpLoad %154 
					                                        f32 %157 = OpFMul %155 %156 
					                               Private f32* %159 = OpAccessChain %129 %158 
					                                        f32 %160 = OpLoad %159 
					                                        f32 %161 = OpFNegate %160 
					                                        f32 %162 = OpFAdd %157 %161 
					                               Private f32* %163 = OpAccessChain %129 %87 
					                                                     OpStore %163 %162 
					                               Private f32* %164 = OpAccessChain %150 %76 
					                                        f32 %165 = OpLoad %164 
					                                        f32 %167 = OpFMul %165 %166 
					                               Private f32* %169 = OpAccessChain %129 %168 
					                                                     OpStore %169 %167 
					                                        f32 %171 = OpLoad %66 
					                                      f32_3 %172 = OpCompositeConstruct %171 %171 %171 
					                                      f32_4 %173 = OpLoad %129 
					                                      f32_3 %174 = OpVectorShuffle %173 %173 0 2 3 
					                                      f32_3 %175 = OpFAdd %172 %174 
					                                                     OpStore %170 %175 
					                                      f32_3 %176 = OpLoad %170 
					                               Uniform f32* %178 = OpAccessChain %84 %177 
					                                        f32 %179 = OpLoad %178 
					                               Uniform f32* %180 = OpAccessChain %84 %177 
					                                        f32 %181 = OpLoad %180 
					                               Uniform f32* %182 = OpAccessChain %84 %177 
					                                        f32 %183 = OpLoad %182 
					                                      f32_3 %184 = OpCompositeConstruct %179 %181 %183 
					                                        f32 %185 = OpCompositeExtract %184 0 
					                                        f32 %186 = OpCompositeExtract %184 1 
					                                        f32 %187 = OpCompositeExtract %184 2 
					                                      f32_3 %188 = OpCompositeConstruct %185 %186 %187 
					                                      f32_3 %189 = OpFMul %176 %188 
					                                      f32_4 %190 = OpLoad %33 
					                                      f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
					                                      f32_3 %192 = OpFAdd %189 %191 
					                                                     OpStore %170 %192 
					                        read_only Texture2D %195 = OpLoad %194 
					                                    sampler %197 = OpLoad %196 
					                 read_only Texture2DSampled %198 = OpSampledImage %195 %197 
					                                      f32_2 %199 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %200 = OpImageSampleImplicitLod %198 %199 
					                                        f32 %201 = OpCompositeExtract %200 0 
					                                                     OpStore %193 %201 
					                        read_only Texture2D %204 = OpLoad %203 
					                                    sampler %206 = OpLoad %205 
					                 read_only Texture2DSampled %207 = OpSampledImage %204 %206 
					                                      f32_4 %208 = OpLoad %101 
					                                      f32_2 %209 = OpVectorShuffle %208 %208 2 3 
					                                      f32_4 %210 = OpImageSampleImplicitLod %207 %209 
					                                        f32 %211 = OpCompositeExtract %210 0 
					                                                     OpStore %202 %211 
					                                        f32 %213 = OpLoad %202 
					                                        f32 %214 = OpFAdd %213 %131 
					                                                     OpStore %212 %214 
					                                        f32 %215 = OpLoad %212 
					                                      f32_2 %216 = OpCompositeConstruct %215 %215 
					                                      f32_2 %217 = OpFMul %216 %138 
					                                      f32_4 %218 = OpLoad %129 
					                                      f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
					                                                     OpStore %129 %219 
					                        read_only Texture2D %220 = OpLoad %203 
					                                    sampler %221 = OpLoad %205 
					                 read_only Texture2DSampled %222 = OpSampledImage %220 %221 
					                                      f32_4 %223 = OpLoad %101 
					                                      f32_2 %224 = OpVectorShuffle %223 %223 0 1 
					                                      f32_4 %225 = OpImageSampleImplicitLod %222 %224 
					                                        f32 %226 = OpCompositeExtract %225 0 
					                                                     OpStore %202 %226 
					                                        f32 %227 = OpLoad %202 
					                                        f32 %228 = OpFAdd %227 %131 
					                                                     OpStore %212 %228 
					                                        f32 %229 = OpLoad %212 
					                                        f32 %230 = OpFMul %229 %156 
					                               Private f32* %231 = OpAccessChain %129 %158 
					                                        f32 %232 = OpLoad %231 
					                                        f32 %233 = OpFNegate %232 
					                                        f32 %234 = OpFAdd %230 %233 
					                               Private f32* %235 = OpAccessChain %129 %87 
					                                                     OpStore %235 %234 
					                                        f32 %236 = OpLoad %212 
					                                        f32 %237 = OpFMul %236 %166 
					                               Private f32* %238 = OpAccessChain %129 %168 
					                                                     OpStore %238 %237 
					                                        f32 %240 = OpLoad %193 
					                                      f32_3 %241 = OpCompositeConstruct %240 %240 %240 
					                                      f32_4 %242 = OpLoad %129 
					                                      f32_3 %243 = OpVectorShuffle %242 %242 0 2 3 
					                                      f32_3 %244 = OpFAdd %241 %243 
					                                                     OpStore %239 %244 
					                                      f32_3 %245 = OpLoad %239 
					                               Uniform f32* %247 = OpAccessChain %84 %246 
					                                        f32 %248 = OpLoad %247 
					                               Uniform f32* %249 = OpAccessChain %84 %246 
					                                        f32 %250 = OpLoad %249 
					                               Uniform f32* %251 = OpAccessChain %84 %246 
					                                        f32 %252 = OpLoad %251 
					                                      f32_3 %253 = OpCompositeConstruct %248 %250 %252 
					                                        f32 %254 = OpCompositeExtract %253 0 
					                                        f32 %255 = OpCompositeExtract %253 1 
					                                        f32 %256 = OpCompositeExtract %253 2 
					                                      f32_3 %257 = OpCompositeConstruct %254 %255 %256 
					                                      f32_3 %258 = OpFMul %245 %257 
					                                      f32_3 %259 = OpLoad %170 
					                                      f32_3 %260 = OpFAdd %258 %259 
					                                                     OpStore %170 %260 
					                        read_only Texture2D %264 = OpLoad %263 
					                                    sampler %266 = OpLoad %265 
					                 read_only Texture2DSampled %267 = OpSampledImage %264 %266 
					                                      f32_4 %268 = OpLoad %101 
					                                      f32_2 %269 = OpVectorShuffle %268 %268 2 3 
					                                      f32_4 %270 = OpImageSampleImplicitLod %267 %269 
					                                        f32 %271 = OpCompositeExtract %270 0 
					                               Private f32* %272 = OpAccessChain %262 %76 
					                                                     OpStore %272 %271 
					                        read_only Texture2D %274 = OpLoad %273 
					                                    sampler %276 = OpLoad %275 
					                 read_only Texture2DSampled %277 = OpSampledImage %274 %276 
					                                      f32_4 %278 = OpLoad %101 
					                                      f32_2 %279 = OpVectorShuffle %278 %278 2 3 
					                                      f32_4 %280 = OpImageSampleImplicitLod %277 %279 
					                                        f32 %281 = OpCompositeExtract %280 0 
					                               Private f32* %282 = OpAccessChain %262 %158 
					                                                     OpStore %282 %281 
					                                      f32_2 %283 = OpLoad %262 
					                                      f32_2 %285 = OpFAdd %283 %284 
					                                                     OpStore %262 %285 
					                                      f32_2 %286 = OpLoad %262 
					                                      f32_2 %287 = OpVectorShuffle %286 %286 1 1 
					                                      f32_2 %288 = OpFMul %287 %138 
					                                      f32_4 %289 = OpLoad %129 
					                                      f32_4 %290 = OpVectorShuffle %289 %288 4 5 2 3 
					                                                     OpStore %129 %290 
					                                      f32_2 %291 = OpLoad %262 
					                                      f32_2 %292 = OpVectorShuffle %291 %291 0 0 
					                                      f32_2 %293 = OpFMul %292 %138 
					                                      f32_4 %294 = OpLoad %33 
					                                      f32_4 %295 = OpVectorShuffle %294 %293 4 5 2 3 
					                                                     OpStore %33 %295 
					                        read_only Texture2D %297 = OpLoad %263 
					                                    sampler %298 = OpLoad %265 
					                 read_only Texture2DSampled %299 = OpSampledImage %297 %298 
					                                      f32_4 %300 = OpLoad %101 
					                                      f32_2 %301 = OpVectorShuffle %300 %300 0 1 
					                                      f32_4 %302 = OpImageSampleImplicitLod %299 %301 
					                                        f32 %303 = OpCompositeExtract %302 0 
					                               Private f32* %304 = OpAccessChain %296 %76 
					                                                     OpStore %304 %303 
					                        read_only Texture2D %305 = OpLoad %273 
					                                    sampler %306 = OpLoad %275 
					                 read_only Texture2DSampled %307 = OpSampledImage %305 %306 
					                                      f32_4 %308 = OpLoad %101 
					                                      f32_2 %309 = OpVectorShuffle %308 %308 0 1 
					                                      f32_4 %310 = OpImageSampleImplicitLod %307 %309 
					                                        f32 %311 = OpCompositeExtract %310 0 
					                               Private f32* %312 = OpAccessChain %296 %158 
					                                                     OpStore %312 %311 
					                                      f32_2 %313 = OpLoad %296 
					                                      f32_2 %314 = OpFAdd %313 %284 
					                                                     OpStore %296 %314 
					                               Private f32* %315 = OpAccessChain %296 %76 
					                                        f32 %316 = OpLoad %315 
					                                        f32 %317 = OpFMul %316 %156 
					                               Private f32* %318 = OpAccessChain %33 %158 
					                                        f32 %319 = OpLoad %318 
					                                        f32 %320 = OpFNegate %319 
					                                        f32 %321 = OpFAdd %317 %320 
					                               Private f32* %322 = OpAccessChain %33 %87 
					                                                     OpStore %322 %321 
					                               Private f32* %323 = OpAccessChain %296 %76 
					                                        f32 %324 = OpLoad %323 
					                                        f32 %325 = OpFMul %324 %166 
					                               Private f32* %326 = OpAccessChain %33 %168 
					                                                     OpStore %326 %325 
					                        read_only Texture2D %328 = OpLoad %327 
					                                    sampler %330 = OpLoad %329 
					                 read_only Texture2DSampled %331 = OpSampledImage %328 %330 
					                                      f32_2 %332 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %333 = OpImageSampleImplicitLod %331 %332 
					                                        f32 %334 = OpCompositeExtract %333 0 
					                                                     OpStore %142 %334 
					                                      f32_4 %335 = OpLoad %33 
					                                      f32_3 %336 = OpVectorShuffle %335 %335 0 2 3 
					                                        f32 %337 = OpLoad %142 
					                                      f32_3 %338 = OpCompositeConstruct %337 %337 %337 
					                                      f32_3 %339 = OpFAdd %336 %338 
					                                                     OpStore %239 %339 
					                                      f32_3 %340 = OpLoad %239 
					                               Uniform f32* %342 = OpAccessChain %84 %341 
					                                        f32 %343 = OpLoad %342 
					                               Uniform f32* %344 = OpAccessChain %84 %341 
					                                        f32 %345 = OpLoad %344 
					                               Uniform f32* %346 = OpAccessChain %84 %341 
					                                        f32 %347 = OpLoad %346 
					                                      f32_3 %348 = OpCompositeConstruct %343 %345 %347 
					                                        f32 %349 = OpCompositeExtract %348 0 
					                                        f32 %350 = OpCompositeExtract %348 1 
					                                        f32 %351 = OpCompositeExtract %348 2 
					                                      f32_3 %352 = OpCompositeConstruct %349 %350 %351 
					                                      f32_3 %353 = OpFMul %340 %352 
					                                      f32_3 %354 = OpLoad %170 
					                                      f32_3 %355 = OpFAdd %353 %354 
					                                                     OpStore %170 %355 
					                               Private f32* %356 = OpAccessChain %296 %158 
					                                        f32 %357 = OpLoad %356 
					                                        f32 %358 = OpFMul %357 %156 
					                               Private f32* %359 = OpAccessChain %129 %158 
					                                        f32 %360 = OpLoad %359 
					                                        f32 %361 = OpFNegate %360 
					                                        f32 %362 = OpFAdd %358 %361 
					                               Private f32* %363 = OpAccessChain %129 %87 
					                                                     OpStore %363 %362 
					                               Private f32* %364 = OpAccessChain %296 %158 
					                                        f32 %365 = OpLoad %364 
					                                        f32 %366 = OpFMul %365 %166 
					                               Private f32* %367 = OpAccessChain %129 %168 
					                                                     OpStore %367 %366 
					                        read_only Texture2D %369 = OpLoad %368 
					                                    sampler %371 = OpLoad %370 
					                 read_only Texture2DSampled %372 = OpSampledImage %369 %371 
					                                      f32_2 %373 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %374 = OpImageSampleImplicitLod %372 %373 
					                                        f32 %375 = OpCompositeExtract %374 0 
					                                                     OpStore %142 %375 
					                                      f32_4 %376 = OpLoad %129 
					                                      f32_3 %377 = OpVectorShuffle %376 %376 0 2 3 
					                                        f32 %378 = OpLoad %142 
					                                      f32_3 %379 = OpCompositeConstruct %378 %378 %378 
					                                      f32_3 %380 = OpFAdd %377 %379 
					                                                     OpStore %239 %380 
					                                      f32_3 %381 = OpLoad %239 
					                               Uniform f32* %383 = OpAccessChain %84 %382 
					                                        f32 %384 = OpLoad %383 
					                                      f32_3 %385 = OpCompositeConstruct %384 %384 %384 
					                                      f32_3 %386 = OpFMul %381 %385 
					                                      f32_3 %387 = OpLoad %170 
					                                      f32_3 %388 = OpFAdd %386 %387 
					                                                     OpStore %170 %388 
					                               Uniform f32* %390 = OpAccessChain %84 %177 
					                                        f32 %391 = OpLoad %390 
					                               Uniform f32* %392 = OpAccessChain %84 %246 
					                                        f32 %393 = OpLoad %392 
					                                        f32 %394 = OpFAdd %391 %393 
					                                                     OpStore %389 %394 
					                                        f32 %395 = OpLoad %389 
					                               Uniform f32* %396 = OpAccessChain %84 %341 
					                                        f32 %397 = OpLoad %396 
					                                        f32 %398 = OpFAdd %395 %397 
					                                                     OpStore %389 %398 
					                                        f32 %399 = OpLoad %389 
					                               Uniform f32* %400 = OpAccessChain %84 %382 
					                                        f32 %401 = OpLoad %400 
					                                        f32 %402 = OpFAdd %399 %401 
					                                                     OpStore %389 %402 
					                                        f32 %403 = OpLoad %389 
					                                        f32 %405 = OpFAdd %403 %404 
					                                                     OpStore %389 %405 
					                                      f32_3 %406 = OpLoad %170 
					                                        f32 %407 = OpLoad %389 
					                                      f32_3 %408 = OpCompositeConstruct %407 %407 %407 
					                                      f32_3 %409 = OpFDiv %406 %408 
					                                                     OpStore %170 %409 
					                                      f32_3 %410 = OpLoad %170 
					                                      f32_3 %413 = OpFMul %410 %412 
					                                      f32_3 %416 = OpFAdd %413 %415 
					                                                     OpStore %150 %416 
					                                      f32_3 %417 = OpLoad %170 
					                                      f32_3 %418 = OpLoad %150 
					                                      f32_3 %419 = OpFMul %417 %418 
					                                      f32_3 %422 = OpFAdd %419 %421 
					                                                     OpStore %150 %422 
					                                      f32_3 %423 = OpLoad %150 
					                                      f32_3 %424 = OpLoad %170 
					                                      f32_3 %425 = OpFMul %423 %424 
					                                      f32_4 %426 = OpLoad %9 
					                                      f32_4 %427 = OpVectorShuffle %426 %425 4 5 6 3 
					                                                     OpStore %9 %427 
					                                      f32_4 %430 = OpLoad %9 
					                                                     OpStore %429 %430 
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
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
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
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
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
					uniform 	float _History1Weight;
					uniform 	float _History2Weight;
					uniform 	float _History3Weight;
					uniform 	float _History4Weight;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _History1LumaTex;
					UNITY_LOCATION(2) uniform  sampler2D _History1ChromaTex;
					UNITY_LOCATION(3) uniform  sampler2D _History2LumaTex;
					UNITY_LOCATION(4) uniform  sampler2D _History2ChromaTex;
					UNITY_LOCATION(5) uniform  sampler2D _History3LumaTex;
					UNITY_LOCATION(6) uniform  sampler2D _History3ChromaTex;
					UNITY_LOCATION(7) uniform  sampler2D _History4LumaTex;
					UNITY_LOCATION(8) uniform  sampler2D _History4ChromaTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat16_5;
					float u_xlat15;
					float u_xlat16_15;
					void main()
					{
					    u_xlat10_0 = texture(_History1LumaTex, vs_TEXCOORD1.xy);
					    u_xlat5 = vs_TEXCOORD1.x * _MainTex_TexelSize.z;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = floor(u_xlat5);
					    u_xlat5 = u_xlat5 * 2.0 + 0.5;
					    u_xlat1.z = u_xlat5 * _MainTex_TexelSize.x + _MainTex_TexelSize.x;
					    u_xlat1.x = u_xlat5 * _MainTex_TexelSize.x;
					    u_xlat1.yw = vs_TEXCOORD1.yy;
					    u_xlat10_2 = texture(_History1ChromaTex, u_xlat1.zw);
					    u_xlat16_5 = u_xlat10_2.x + -0.5;
					    u_xlat2.xy = vec2(u_xlat16_5) * vec2(1.40199995, 0.714139998);
					    u_xlat10_3 = texture(_History1ChromaTex, u_xlat1.xy);
					    u_xlat16_5 = u_xlat10_3.x + -0.5;
					    u_xlat2.z = u_xlat16_5 * -0.344139993 + (-u_xlat2.y);
					    u_xlat2.w = u_xlat16_5 * 1.77199996;
					    u_xlat0.xyz = u_xlat10_0.xxx + u_xlat2.xzw;
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_History1Weight, _History1Weight, _History1Weight)) + u_xlat10_2.xyz;
					    SV_Target0.w = u_xlat10_2.w;
					    u_xlat10_2 = texture(_History2LumaTex, vs_TEXCOORD1.xy);
					    u_xlat10_3 = texture(_History2ChromaTex, u_xlat1.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History2ChromaTex, u_xlat1.xy);
					    u_xlat16_15 = u_xlat10_4.x + -0.5;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat2.xyz = u_xlat10_2.xxx + u_xlat3.xzw;
					    u_xlat0.xyz = u_xlat2.xyz * vec3(_History2Weight) + u_xlat0.xyz;
					    u_xlat10_2 = texture(_History3ChromaTex, u_xlat1.zw);
					    u_xlat10_3 = texture(_History4ChromaTex, u_xlat1.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat16_15 = u_xlat10_2.x + -0.5;
					    u_xlat2.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History3ChromaTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_History4ChromaTex, u_xlat1.xy);
					    u_xlat16_15 = u_xlat10_1.x + -0.5;
					    u_xlat16_1 = u_xlat10_4.x + -0.5;
					    u_xlat2.z = u_xlat16_1 * -0.344139993 + (-u_xlat2.y);
					    u_xlat2.w = u_xlat16_1 * 1.77199996;
					    u_xlat10_1 = texture(_History3LumaTex, vs_TEXCOORD1.xy);
					    u_xlat1.xyz = u_xlat2.xzw + u_xlat10_1.xxx;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History3Weight, _History3Weight, _History3Weight)) + u_xlat0.xyz;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat10_1 = texture(_History4LumaTex, vs_TEXCOORD1.xy);
					    u_xlat1.xyz = u_xlat3.xzw + u_xlat10_1.xxx;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History4Weight, _History4Weight, _History4Weight)) + u_xlat0.xyz;
					    u_xlat15 = _History1Weight + _History2Weight;
					    u_xlat15 = u_xlat15 + _History3Weight;
					    u_xlat15 = u_xlat15 + _History4Weight;
					    u_xlat15 = u_xlat15 + 1.0;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat15);
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
					; Bound: 131
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %119 %122 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate vs_TEXCOORD0 Location 119 
					                                                     OpDecorate vs_TEXCOORD1 Location 122 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                              Private f32_4* %99 = OpVariable Private 
					                                            %101 = OpTypePointer Function %6 
					                                        u32 %110 = OpConstant 3 
					                                            %112 = OpTypeVector %6 3 
					                                            %117 = OpTypeVector %6 2 
					                                            %118 = OpTypePointer Output %117 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %125 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %102 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                       bool %100 = OpLoad %84 
					                                                     OpSelectionMerge %104 None 
					                                                     OpBranchConditional %100 %103 %106 
					                                            %103 = OpLabel 
					                                        f32 %105 = OpLoad %91 
					                                                     OpStore %102 %105 
					                                                     OpBranch %104 
					                                            %106 = OpLabel 
					                                 Input f32* %107 = OpAccessChain %92 %68 
					                                        f32 %108 = OpLoad %107 
					                                                     OpStore %102 %108 
					                                                     OpBranch %104 
					                                            %104 = OpLabel 
					                                        f32 %109 = OpLoad %102 
					                               Private f32* %111 = OpAccessChain %99 %110 
					                                                     OpStore %111 %109 
					                                      f32_4 %113 = OpLoad %92 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 1 0 
					                                      f32_4 %115 = OpLoad %99 
					                                      f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
					                                                     OpStore %99 %116 
					                                      f32_4 %120 = OpLoad %99 
					                                      f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                                     OpStore vs_TEXCOORD0 %121 
					                                      f32_4 %123 = OpLoad %99 
					                                      f32_2 %124 = OpVectorShuffle %123 %123 2 3 
					                                                     OpStore vs_TEXCOORD1 %124 
					                                Output f32* %126 = OpAccessChain %72 %22 %68 
					                                        f32 %127 = OpLoad %126 
					                                        f32 %128 = OpFNegate %127 
					                                Output f32* %129 = OpAccessChain %72 %22 %68 
					                                                     OpStore %129 %128 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 400
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %22 %130 %154 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
					                                                     OpDecorate vs_TEXCOORD1 Location 22 
					                                                     OpDecorate %27 RelaxedPrecision 
					                                                     OpMemberDecorate %34 0 Offset 34 
					                                                     OpMemberDecorate %34 1 RelaxedPrecision 
					                                                     OpMemberDecorate %34 1 Offset 34 
					                                                     OpMemberDecorate %34 2 RelaxedPrecision 
					                                                     OpMemberDecorate %34 2 Offset 34 
					                                                     OpMemberDecorate %34 3 RelaxedPrecision 
					                                                     OpMemberDecorate %34 3 Offset 34 
					                                                     OpMemberDecorate %34 4 RelaxedPrecision 
					                                                     OpMemberDecorate %34 4 Offset 34 
					                                                     OpDecorate %34 Block 
					                                                     OpDecorate %36 DescriptorSet 36 
					                                                     OpDecorate %36 Binding 36 
					                                                     OpDecorate %71 RelaxedPrecision 
					                                                     OpDecorate %72 RelaxedPrecision 
					                                                     OpDecorate %72 DescriptorSet 72 
					                                                     OpDecorate %72 Binding 72 
					                                                     OpDecorate %73 RelaxedPrecision 
					                                                     OpDecorate %74 RelaxedPrecision 
					                                                     OpDecorate %74 DescriptorSet 74 
					                                                     OpDecorate %74 Binding 74 
					                                                     OpDecorate %75 RelaxedPrecision 
					                                                     OpDecorate %80 RelaxedPrecision 
					                                                     OpDecorate %81 RelaxedPrecision 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %95 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %112 RelaxedPrecision 
					                                                     OpDecorate %114 RelaxedPrecision 
					                                                     OpDecorate %118 RelaxedPrecision 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                                     OpDecorate %120 RelaxedPrecision 
					                                                     OpDecorate %121 RelaxedPrecision 
					                                                     OpDecorate %122 RelaxedPrecision 
					                                                     OpDecorate %125 RelaxedPrecision 
					                                                     OpDecorate %125 DescriptorSet 125 
					                                                     OpDecorate %125 Binding 125 
					                                                     OpDecorate %126 RelaxedPrecision 
					                                                     OpDecorate %127 RelaxedPrecision 
					                                                     OpDecorate %127 DescriptorSet 127 
					                                                     OpDecorate %127 Binding 127 
					                                                     OpDecorate %128 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 130 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                                     OpDecorate %134 RelaxedPrecision 
					                                                     OpDecorate %137 RelaxedPrecision 
					                                                     OpDecorate %139 RelaxedPrecision 
					                                                     OpDecorate %141 RelaxedPrecision 
					                                                     OpDecorate %142 RelaxedPrecision 
					                                                     OpDecorate %143 RelaxedPrecision 
					                                                     OpDecorate %144 RelaxedPrecision 
					                                                     OpDecorate %145 RelaxedPrecision 
					                                                     OpDecorate %146 RelaxedPrecision 
					                                                     OpDecorate %147 RelaxedPrecision 
					                                                     OpDecorate %148 RelaxedPrecision 
					                                                     OpDecorate %149 RelaxedPrecision 
					                                                     OpDecorate %150 RelaxedPrecision 
					                                                     OpDecorate %154 RelaxedPrecision 
					                                                     OpDecorate %154 Location 154 
					                                                     OpDecorate %156 RelaxedPrecision 
					                                                     OpDecorate %159 RelaxedPrecision 
					                                                     OpDecorate %159 DescriptorSet 159 
					                                                     OpDecorate %159 Binding 159 
					                                                     OpDecorate %160 RelaxedPrecision 
					                                                     OpDecorate %161 RelaxedPrecision 
					                                                     OpDecorate %161 DescriptorSet 161 
					                                                     OpDecorate %161 Binding 161 
					                                                     OpDecorate %162 RelaxedPrecision 
					                                                     OpDecorate %166 RelaxedPrecision 
					                                                     OpDecorate %168 RelaxedPrecision 
					                                                     OpDecorate %168 DescriptorSet 168 
					                                                     OpDecorate %168 Binding 168 
					                                                     OpDecorate %169 RelaxedPrecision 
					                                                     OpDecorate %170 RelaxedPrecision 
					                                                     OpDecorate %170 DescriptorSet 170 
					                                                     OpDecorate %170 Binding 170 
					                                                     OpDecorate %171 RelaxedPrecision 
					                                                     OpDecorate %176 RelaxedPrecision 
					                                                     OpDecorate %177 RelaxedPrecision 
					                                                     OpDecorate %178 RelaxedPrecision 
					                                                     OpDecorate %179 RelaxedPrecision 
					                                                     OpDecorate %180 RelaxedPrecision 
					                                                     OpDecorate %181 RelaxedPrecision 
					                                                     OpDecorate %182 RelaxedPrecision 
					                                                     OpDecorate %185 RelaxedPrecision 
					                                                     OpDecorate %186 RelaxedPrecision 
					                                                     OpDecorate %191 RelaxedPrecision 
					                                                     OpDecorate %192 RelaxedPrecision 
					                                                     OpDecorate %193 RelaxedPrecision 
					                                                     OpDecorate %194 RelaxedPrecision 
					                                                     OpDecorate %195 RelaxedPrecision 
					                                                     OpDecorate %197 RelaxedPrecision 
					                                                     OpDecorate %198 RelaxedPrecision 
					                                                     OpDecorate %199 RelaxedPrecision 
					                                                     OpDecorate %201 RelaxedPrecision 
					                                                     OpDecorate %202 RelaxedPrecision 
					                                                     OpDecorate %204 RelaxedPrecision 
					                                                     OpDecorate %205 RelaxedPrecision 
					                                                     OpDecorate %206 RelaxedPrecision 
					                                                     OpDecorate %207 RelaxedPrecision 
					                                                     OpDecorate %208 RelaxedPrecision 
					                                                     OpDecorate %211 RelaxedPrecision 
					                                                     OpDecorate %212 RelaxedPrecision 
					                                                     OpDecorate %215 RelaxedPrecision 
					                                                     OpDecorate %217 RelaxedPrecision 
					                                                     OpDecorate %219 RelaxedPrecision 
					                                                     OpDecorate %220 RelaxedPrecision 
					                                                     OpDecorate %221 RelaxedPrecision 
					                                                     OpDecorate %222 RelaxedPrecision 
					                                                     OpDecorate %223 RelaxedPrecision 
					                                                     OpDecorate %224 RelaxedPrecision 
					                                                     OpDecorate %225 RelaxedPrecision 
					                                                     OpDecorate %226 RelaxedPrecision 
					                                                     OpDecorate %227 RelaxedPrecision 
					                                                     OpDecorate %228 RelaxedPrecision 
					                                                     OpDecorate %233 RelaxedPrecision 
					                                                     OpDecorate %233 DescriptorSet 233 
					                                                     OpDecorate %233 Binding 233 
					                                                     OpDecorate %234 RelaxedPrecision 
					                                                     OpDecorate %235 RelaxedPrecision 
					                                                     OpDecorate %235 DescriptorSet 235 
					                                                     OpDecorate %235 Binding 235 
					                                                     OpDecorate %236 RelaxedPrecision 
					                                                     OpDecorate %243 RelaxedPrecision 
					                                                     OpDecorate %243 DescriptorSet 243 
					                                                     OpDecorate %243 Binding 243 
					                                                     OpDecorate %244 RelaxedPrecision 
					                                                     OpDecorate %245 RelaxedPrecision 
					                                                     OpDecorate %245 DescriptorSet 245 
					                                                     OpDecorate %245 Binding 245 
					                                                     OpDecorate %246 RelaxedPrecision 
					                                                     OpDecorate %261 RelaxedPrecision 
					                                                     OpDecorate %267 RelaxedPrecision 
					                                                     OpDecorate %268 RelaxedPrecision 
					                                                     OpDecorate %275 RelaxedPrecision 
					                                                     OpDecorate %276 RelaxedPrecision 
					                                                     OpDecorate %292 RelaxedPrecision 
					                                                     OpDecorate %293 RelaxedPrecision 
					                                                     OpDecorate %300 RelaxedPrecision 
					                                                     OpDecorate %301 RelaxedPrecision 
					                                                     OpDecorate %301 DescriptorSet 301 
					                                                     OpDecorate %301 Binding 301 
					                                                     OpDecorate %302 RelaxedPrecision 
					                                                     OpDecorate %303 RelaxedPrecision 
					                                                     OpDecorate %303 DescriptorSet 303 
					                                                     OpDecorate %303 Binding 303 
					                                                     OpDecorate %304 RelaxedPrecision 
					                                                     OpDecorate %308 RelaxedPrecision 
					                                                     OpDecorate %310 RelaxedPrecision 
					                                                     OpDecorate %311 RelaxedPrecision 
					                                                     OpDecorate %312 RelaxedPrecision 
					                                                     OpDecorate %313 RelaxedPrecision 
					                                                     OpDecorate %314 RelaxedPrecision 
					                                                     OpDecorate %315 RelaxedPrecision 
					                                                     OpDecorate %316 RelaxedPrecision 
					                                                     OpDecorate %319 RelaxedPrecision 
					                                                     OpDecorate %321 RelaxedPrecision 
					                                                     OpDecorate %323 RelaxedPrecision 
					                                                     OpDecorate %324 RelaxedPrecision 
					                                                     OpDecorate %325 RelaxedPrecision 
					                                                     OpDecorate %326 RelaxedPrecision 
					                                                     OpDecorate %327 RelaxedPrecision 
					                                                     OpDecorate %328 RelaxedPrecision 
					                                                     OpDecorate %329 RelaxedPrecision 
					                                                     OpDecorate %330 RelaxedPrecision 
					                                                     OpDecorate %331 RelaxedPrecision 
					                                                     OpDecorate %332 RelaxedPrecision 
					                                                     OpDecorate %339 RelaxedPrecision 
					                                                     OpDecorate %340 RelaxedPrecision 
					                                                     OpDecorate %347 RelaxedPrecision 
					                                                     OpDecorate %348 RelaxedPrecision 
					                                                     OpDecorate %348 DescriptorSet 348 
					                                                     OpDecorate %348 Binding 348 
					                                                     OpDecorate %349 RelaxedPrecision 
					                                                     OpDecorate %350 RelaxedPrecision 
					                                                     OpDecorate %350 DescriptorSet 350 
					                                                     OpDecorate %350 Binding 350 
					                                                     OpDecorate %351 RelaxedPrecision 
					                                                     OpDecorate %355 RelaxedPrecision 
					                                                     OpDecorate %356 RelaxedPrecision 
					                                                     OpDecorate %357 RelaxedPrecision 
					                                                     OpDecorate %358 RelaxedPrecision 
					                                                     OpDecorate %359 RelaxedPrecision 
					                                                     OpDecorate %360 RelaxedPrecision 
					                                                     OpDecorate %363 RelaxedPrecision 
					                                                     OpDecorate %364 RelaxedPrecision 
					                                                     OpDecorate %367 RelaxedPrecision 
					                                                     OpDecorate %368 RelaxedPrecision 
					                                                     OpDecorate %369 RelaxedPrecision 
					                                                     OpDecorate %370 RelaxedPrecision 
					                                                     OpDecorate %371 RelaxedPrecision 
					                                                     OpDecorate %372 RelaxedPrecision 
					                                                     OpDecorate %375 RelaxedPrecision 
					                                                     OpDecorate %377 RelaxedPrecision 
					                                                     OpDecorate %379 RelaxedPrecision 
					                                                     OpDecorate %380 RelaxedPrecision 
					                                                     OpDecorate %381 RelaxedPrecision 
					                                                     OpDecorate %383 RelaxedPrecision 
					                                                     OpDecorate %384 RelaxedPrecision 
					                                                     OpDecorate %385 RelaxedPrecision 
					                                                     OpDecorate %387 RelaxedPrecision 
					                                                     OpDecorate %388 RelaxedPrecision 
					                                                     OpDecorate %389 RelaxedPrecision 
					                                                     OpDecorate %391 RelaxedPrecision 
					                                                     OpDecorate %392 RelaxedPrecision 
					                                                     OpDecorate %393 RelaxedPrecision 
					                                                     OpDecorate %394 RelaxedPrecision 
					                                                     OpDecorate %395 RelaxedPrecision 
					                                                     OpDecorate %396 RelaxedPrecision 
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
					                       Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                             %25 = OpTypeInt 32 0 
					                                         u32 %26 = OpConstant 0 
					                                             %28 = OpTypePointer Private %6 
					                                Private f32* %30 = OpVariable Private 
					                                             %31 = OpTypePointer Input %6 
					                                             %34 = OpTypeStruct %7 %6 %6 %6 %6 
					                                             %35 = OpTypePointer Uniform %34 
					Uniform struct {f32_4; f32; f32; f32; f32;}* %36 = OpVariable Uniform 
					                                             %37 = OpTypeInt 32 1 
					                                         i32 %38 = OpConstant 0 
					                                         u32 %39 = OpConstant 2 
					                                             %40 = OpTypePointer Uniform %6 
					                                         f32 %45 = OpConstant 3,674022E-40 
					                                         f32 %50 = OpConstant 3,674022E-40 
					                              Private f32_4* %53 = OpVariable Private 
					                                Private f32* %71 = OpVariable Private 
					        UniformConstant read_only Texture2D* %72 = OpVariable UniformConstant 
					                    UniformConstant sampler* %74 = OpVariable UniformConstant 
					                                Private f32* %81 = OpVariable Private 
					                                         f32 %83 = OpConstant 3,674022E-40 
					                              Private f32_4* %85 = OpVariable Private 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                         f32 %89 = OpConstant 3,674022E-40 
					                                       f32_2 %90 = OpConstantComposite %88 %89 
					                                        f32 %104 = OpConstant 3,674022E-40 
					                                        u32 %106 = OpConstant 1 
					                                        f32 %113 = OpConstant 3,674022E-40 
					                                        u32 %115 = OpConstant 3 
					                                            %117 = OpTypeVector %6 3 
					       UniformConstant read_only Texture2D* %125 = OpVariable UniformConstant 
					                   UniformConstant sampler* %127 = OpVariable UniformConstant 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                        i32 %135 = OpConstant 1 
					                                            %153 = OpTypePointer Output %7 
					                              Output f32_4* %154 = OpVariable Output 
					                                            %157 = OpTypePointer Output %6 
					       UniformConstant read_only Texture2D* %159 = OpVariable UniformConstant 
					                   UniformConstant sampler* %161 = OpVariable UniformConstant 
					       UniformConstant read_only Texture2D* %168 = OpVariable UniformConstant 
					                   UniformConstant sampler* %170 = OpVariable UniformConstant 
					                             Private f32_4* %179 = OpVariable Private 
					                                        i32 %213 = OpConstant 2 
					                                            %231 = OpTypePointer Private %20 
					                             Private f32_2* %232 = OpVariable Private 
					       UniformConstant read_only Texture2D* %233 = OpVariable UniformConstant 
					                   UniformConstant sampler* %235 = OpVariable UniformConstant 
					       UniformConstant read_only Texture2D* %243 = OpVariable UniformConstant 
					                   UniformConstant sampler* %245 = OpVariable UniformConstant 
					                                      f32_2 %254 = OpConstantComposite %83 %83 
					                             Private f32_4* %261 = OpVariable Private 
					                               Private f32* %300 = OpVariable Private 
					       UniformConstant read_only Texture2D* %301 = OpVariable UniformConstant 
					                   UniformConstant sampler* %303 = OpVariable UniformConstant 
					                                            %309 = OpTypePointer Private %117 
					                             Private f32_3* %310 = OpVariable Private 
					                                        i32 %317 = OpConstant 3 
					                               Private f32* %347 = OpVariable Private 
					       UniformConstant read_only Texture2D* %348 = OpVariable UniformConstant 
					                   UniformConstant sampler* %350 = OpVariable UniformConstant 
					                                        i32 %365 = OpConstant 4 
					                               Private f32* %375 = OpVariable Private 
					                                        f32 %390 = OpConstant 3,674022E-40 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                         read_only Texture2D %13 = OpLoad %12 
					                                     sampler %17 = OpLoad %16 
					                  read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                       f32_2 %23 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                         f32 %27 = OpCompositeExtract %24 0 
					                                Private f32* %29 = OpAccessChain %9 %26 
					                                                     OpStore %29 %27 
					                                  Input f32* %32 = OpAccessChain vs_TEXCOORD1 %26 
					                                         f32 %33 = OpLoad %32 
					                                Uniform f32* %41 = OpAccessChain %36 %38 %39 
					                                         f32 %42 = OpLoad %41 
					                                         f32 %43 = OpFMul %33 %42 
					                                                     OpStore %30 %43 
					                                         f32 %44 = OpLoad %30 
					                                         f32 %46 = OpFMul %44 %45 
					                                                     OpStore %30 %46 
					                                         f32 %47 = OpLoad %30 
					                                         f32 %48 = OpExtInst %1 8 %47 
					                                                     OpStore %30 %48 
					                                         f32 %49 = OpLoad %30 
					                                         f32 %51 = OpFMul %49 %50 
					                                         f32 %52 = OpFAdd %51 %45 
					                                                     OpStore %30 %52 
					                                         f32 %54 = OpLoad %30 
					                                Uniform f32* %55 = OpAccessChain %36 %38 %26 
					                                         f32 %56 = OpLoad %55 
					                                         f32 %57 = OpFMul %54 %56 
					                                Uniform f32* %58 = OpAccessChain %36 %38 %26 
					                                         f32 %59 = OpLoad %58 
					                                         f32 %60 = OpFAdd %57 %59 
					                                Private f32* %61 = OpAccessChain %53 %39 
					                                                     OpStore %61 %60 
					                                         f32 %62 = OpLoad %30 
					                                Uniform f32* %63 = OpAccessChain %36 %38 %26 
					                                         f32 %64 = OpLoad %63 
					                                         f32 %65 = OpFMul %62 %64 
					                                Private f32* %66 = OpAccessChain %53 %26 
					                                                     OpStore %66 %65 
					                                       f32_2 %67 = OpLoad vs_TEXCOORD1 
					                                       f32_2 %68 = OpVectorShuffle %67 %67 1 1 
					                                       f32_4 %69 = OpLoad %53 
					                                       f32_4 %70 = OpVectorShuffle %69 %68 0 4 2 5 
					                                                     OpStore %53 %70 
					                         read_only Texture2D %73 = OpLoad %72 
					                                     sampler %75 = OpLoad %74 
					                  read_only Texture2DSampled %76 = OpSampledImage %73 %75 
					                                       f32_4 %77 = OpLoad %53 
					                                       f32_2 %78 = OpVectorShuffle %77 %77 2 3 
					                                       f32_4 %79 = OpImageSampleImplicitLod %76 %78 
					                                         f32 %80 = OpCompositeExtract %79 0 
					                                                     OpStore %71 %80 
					                                         f32 %82 = OpLoad %71 
					                                         f32 %84 = OpFAdd %82 %83 
					                                                     OpStore %81 %84 
					                                         f32 %86 = OpLoad %81 
					                                       f32_2 %87 = OpCompositeConstruct %86 %86 
					                                       f32_2 %91 = OpFMul %87 %90 
					                                       f32_4 %92 = OpLoad %85 
					                                       f32_4 %93 = OpVectorShuffle %92 %91 4 5 2 3 
					                                                     OpStore %85 %93 
					                         read_only Texture2D %94 = OpLoad %72 
					                                     sampler %95 = OpLoad %74 
					                  read_only Texture2DSampled %96 = OpSampledImage %94 %95 
					                                       f32_4 %97 = OpLoad %53 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                       f32_4 %99 = OpImageSampleImplicitLod %96 %98 
					                                        f32 %100 = OpCompositeExtract %99 0 
					                                                     OpStore %71 %100 
					                                        f32 %101 = OpLoad %71 
					                                        f32 %102 = OpFAdd %101 %83 
					                                                     OpStore %81 %102 
					                                        f32 %103 = OpLoad %81 
					                                        f32 %105 = OpFMul %103 %104 
					                               Private f32* %107 = OpAccessChain %85 %106 
					                                        f32 %108 = OpLoad %107 
					                                        f32 %109 = OpFNegate %108 
					                                        f32 %110 = OpFAdd %105 %109 
					                               Private f32* %111 = OpAccessChain %85 %39 
					                                                     OpStore %111 %110 
					                                        f32 %112 = OpLoad %81 
					                                        f32 %114 = OpFMul %112 %113 
					                               Private f32* %116 = OpAccessChain %85 %115 
					                                                     OpStore %116 %114 
					                                      f32_4 %118 = OpLoad %9 
					                                      f32_3 %119 = OpVectorShuffle %118 %118 0 0 0 
					                                      f32_4 %120 = OpLoad %85 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 2 3 
					                                      f32_3 %122 = OpFAdd %119 %121 
					                                      f32_4 %123 = OpLoad %85 
					                                      f32_4 %124 = OpVectorShuffle %123 %122 4 5 6 3 
					                                                     OpStore %85 %124 
					                        read_only Texture2D %126 = OpLoad %125 
					                                    sampler %128 = OpLoad %127 
					                 read_only Texture2DSampled %129 = OpSampledImage %126 %128 
					                                      f32_2 %131 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %132 = OpImageSampleImplicitLod %129 %131 
					                                                     OpStore %9 %132 
					                                      f32_4 %133 = OpLoad %85 
					                                      f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
					                               Uniform f32* %136 = OpAccessChain %36 %135 
					                                        f32 %137 = OpLoad %136 
					                               Uniform f32* %138 = OpAccessChain %36 %135 
					                                        f32 %139 = OpLoad %138 
					                               Uniform f32* %140 = OpAccessChain %36 %135 
					                                        f32 %141 = OpLoad %140 
					                                      f32_3 %142 = OpCompositeConstruct %137 %139 %141 
					                                        f32 %143 = OpCompositeExtract %142 0 
					                                        f32 %144 = OpCompositeExtract %142 1 
					                                        f32 %145 = OpCompositeExtract %142 2 
					                                      f32_3 %146 = OpCompositeConstruct %143 %144 %145 
					                                      f32_3 %147 = OpFMul %134 %146 
					                                      f32_4 %148 = OpLoad %9 
					                                      f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
					                                      f32_3 %150 = OpFAdd %147 %149 
					                                      f32_4 %151 = OpLoad %85 
					                                      f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
					                                                     OpStore %85 %152 
					                               Private f32* %155 = OpAccessChain %9 %115 
					                                        f32 %156 = OpLoad %155 
					                                Output f32* %158 = OpAccessChain %154 %115 
					                                                     OpStore %158 %156 
					                        read_only Texture2D %160 = OpLoad %159 
					                                    sampler %162 = OpLoad %161 
					                 read_only Texture2DSampled %163 = OpSampledImage %160 %162 
					                                      f32_2 %164 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %165 = OpImageSampleImplicitLod %163 %164 
					                                        f32 %166 = OpCompositeExtract %165 0 
					                               Private f32* %167 = OpAccessChain %9 %26 
					                                                     OpStore %167 %166 
					                        read_only Texture2D %169 = OpLoad %168 
					                                    sampler %171 = OpLoad %170 
					                 read_only Texture2DSampled %172 = OpSampledImage %169 %171 
					                                      f32_4 %173 = OpLoad %53 
					                                      f32_2 %174 = OpVectorShuffle %173 %173 2 3 
					                                      f32_4 %175 = OpImageSampleImplicitLod %172 %174 
					                                        f32 %176 = OpCompositeExtract %175 0 
					                                                     OpStore %71 %176 
					                                        f32 %177 = OpLoad %71 
					                                        f32 %178 = OpFAdd %177 %83 
					                                                     OpStore %81 %178 
					                                        f32 %180 = OpLoad %81 
					                                      f32_2 %181 = OpCompositeConstruct %180 %180 
					                                      f32_2 %182 = OpFMul %181 %90 
					                                      f32_4 %183 = OpLoad %179 
					                                      f32_4 %184 = OpVectorShuffle %183 %182 4 5 2 3 
					                                                     OpStore %179 %184 
					                        read_only Texture2D %185 = OpLoad %168 
					                                    sampler %186 = OpLoad %170 
					                 read_only Texture2DSampled %187 = OpSampledImage %185 %186 
					                                      f32_4 %188 = OpLoad %53 
					                                      f32_2 %189 = OpVectorShuffle %188 %188 0 1 
					                                      f32_4 %190 = OpImageSampleImplicitLod %187 %189 
					                                        f32 %191 = OpCompositeExtract %190 0 
					                                                     OpStore %71 %191 
					                                        f32 %192 = OpLoad %71 
					                                        f32 %193 = OpFAdd %192 %83 
					                                                     OpStore %81 %193 
					                                        f32 %194 = OpLoad %81 
					                                        f32 %195 = OpFMul %194 %104 
					                               Private f32* %196 = OpAccessChain %179 %106 
					                                        f32 %197 = OpLoad %196 
					                                        f32 %198 = OpFNegate %197 
					                                        f32 %199 = OpFAdd %195 %198 
					                               Private f32* %200 = OpAccessChain %179 %39 
					                                                     OpStore %200 %199 
					                                        f32 %201 = OpLoad %81 
					                                        f32 %202 = OpFMul %201 %113 
					                               Private f32* %203 = OpAccessChain %179 %115 
					                                                     OpStore %203 %202 
					                                      f32_4 %204 = OpLoad %9 
					                                      f32_3 %205 = OpVectorShuffle %204 %204 0 0 0 
					                                      f32_4 %206 = OpLoad %179 
					                                      f32_3 %207 = OpVectorShuffle %206 %206 0 2 3 
					                                      f32_3 %208 = OpFAdd %205 %207 
					                                      f32_4 %209 = OpLoad %179 
					                                      f32_4 %210 = OpVectorShuffle %209 %208 4 5 6 3 
					                                                     OpStore %179 %210 
					                                      f32_4 %211 = OpLoad %179 
					                                      f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
					                               Uniform f32* %214 = OpAccessChain %36 %213 
					                                        f32 %215 = OpLoad %214 
					                               Uniform f32* %216 = OpAccessChain %36 %213 
					                                        f32 %217 = OpLoad %216 
					                               Uniform f32* %218 = OpAccessChain %36 %213 
					                                        f32 %219 = OpLoad %218 
					                                      f32_3 %220 = OpCompositeConstruct %215 %217 %219 
					                                        f32 %221 = OpCompositeExtract %220 0 
					                                        f32 %222 = OpCompositeExtract %220 1 
					                                        f32 %223 = OpCompositeExtract %220 2 
					                                      f32_3 %224 = OpCompositeConstruct %221 %222 %223 
					                                      f32_3 %225 = OpFMul %212 %224 
					                                      f32_4 %226 = OpLoad %85 
					                                      f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
					                                      f32_3 %228 = OpFAdd %225 %227 
					                                      f32_4 %229 = OpLoad %85 
					                                      f32_4 %230 = OpVectorShuffle %229 %228 4 5 6 3 
					                                                     OpStore %85 %230 
					                        read_only Texture2D %234 = OpLoad %233 
					                                    sampler %236 = OpLoad %235 
					                 read_only Texture2DSampled %237 = OpSampledImage %234 %236 
					                                      f32_4 %238 = OpLoad %53 
					                                      f32_2 %239 = OpVectorShuffle %238 %238 2 3 
					                                      f32_4 %240 = OpImageSampleImplicitLod %237 %239 
					                                        f32 %241 = OpCompositeExtract %240 0 
					                               Private f32* %242 = OpAccessChain %232 %26 
					                                                     OpStore %242 %241 
					                        read_only Texture2D %244 = OpLoad %243 
					                                    sampler %246 = OpLoad %245 
					                 read_only Texture2DSampled %247 = OpSampledImage %244 %246 
					                                      f32_4 %248 = OpLoad %53 
					                                      f32_2 %249 = OpVectorShuffle %248 %248 2 3 
					                                      f32_4 %250 = OpImageSampleImplicitLod %247 %249 
					                                        f32 %251 = OpCompositeExtract %250 0 
					                               Private f32* %252 = OpAccessChain %232 %106 
					                                                     OpStore %252 %251 
					                                      f32_2 %253 = OpLoad %232 
					                                      f32_2 %255 = OpFAdd %253 %254 
					                                                     OpStore %232 %255 
					                                      f32_2 %256 = OpLoad %232 
					                                      f32_2 %257 = OpVectorShuffle %256 %256 1 1 
					                                      f32_2 %258 = OpFMul %257 %90 
					                                      f32_4 %259 = OpLoad %179 
					                                      f32_4 %260 = OpVectorShuffle %259 %258 4 5 2 3 
					                                                     OpStore %179 %260 
					                                      f32_2 %262 = OpLoad %232 
					                                      f32_2 %263 = OpVectorShuffle %262 %262 0 0 
					                                      f32_2 %264 = OpFMul %263 %90 
					                                      f32_4 %265 = OpLoad %261 
					                                      f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
					                                                     OpStore %261 %266 
					                        read_only Texture2D %267 = OpLoad %233 
					                                    sampler %268 = OpLoad %235 
					                 read_only Texture2DSampled %269 = OpSampledImage %267 %268 
					                                      f32_4 %270 = OpLoad %53 
					                                      f32_2 %271 = OpVectorShuffle %270 %270 0 1 
					                                      f32_4 %272 = OpImageSampleImplicitLod %269 %271 
					                                        f32 %273 = OpCompositeExtract %272 0 
					                               Private f32* %274 = OpAccessChain %53 %39 
					                                                     OpStore %274 %273 
					                        read_only Texture2D %275 = OpLoad %243 
					                                    sampler %276 = OpLoad %245 
					                 read_only Texture2DSampled %277 = OpSampledImage %275 %276 
					                                      f32_4 %278 = OpLoad %53 
					                                      f32_2 %279 = OpVectorShuffle %278 %278 0 1 
					                                      f32_4 %280 = OpImageSampleImplicitLod %277 %279 
					                                        f32 %281 = OpCompositeExtract %280 0 
					                               Private f32* %282 = OpAccessChain %53 %26 
					                                                     OpStore %282 %281 
					                                      f32_4 %283 = OpLoad %53 
					                                      f32_2 %284 = OpVectorShuffle %283 %283 0 2 
					                                      f32_2 %285 = OpFAdd %284 %254 
					                                      f32_4 %286 = OpLoad %53 
					                                      f32_4 %287 = OpVectorShuffle %286 %285 4 5 2 3 
					                                                     OpStore %53 %287 
					                               Private f32* %288 = OpAccessChain %53 %106 
					                                        f32 %289 = OpLoad %288 
					                                        f32 %290 = OpFMul %289 %104 
					                               Private f32* %291 = OpAccessChain %261 %106 
					                                        f32 %292 = OpLoad %291 
					                                        f32 %293 = OpFNegate %292 
					                                        f32 %294 = OpFAdd %290 %293 
					                               Private f32* %295 = OpAccessChain %261 %39 
					                                                     OpStore %295 %294 
					                               Private f32* %296 = OpAccessChain %53 %106 
					                                        f32 %297 = OpLoad %296 
					                                        f32 %298 = OpFMul %297 %113 
					                               Private f32* %299 = OpAccessChain %261 %115 
					                                                     OpStore %299 %298 
					                        read_only Texture2D %302 = OpLoad %301 
					                                    sampler %304 = OpLoad %303 
					                 read_only Texture2DSampled %305 = OpSampledImage %302 %304 
					                                      f32_2 %306 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %307 = OpImageSampleImplicitLod %305 %306 
					                                        f32 %308 = OpCompositeExtract %307 0 
					                                                     OpStore %300 %308 
					                                      f32_4 %311 = OpLoad %261 
					                                      f32_3 %312 = OpVectorShuffle %311 %311 0 2 3 
					                                        f32 %313 = OpLoad %300 
					                                      f32_3 %314 = OpCompositeConstruct %313 %313 %313 
					                                      f32_3 %315 = OpFAdd %312 %314 
					                                                     OpStore %310 %315 
					                                      f32_3 %316 = OpLoad %310 
					                               Uniform f32* %318 = OpAccessChain %36 %317 
					                                        f32 %319 = OpLoad %318 
					                               Uniform f32* %320 = OpAccessChain %36 %317 
					                                        f32 %321 = OpLoad %320 
					                               Uniform f32* %322 = OpAccessChain %36 %317 
					                                        f32 %323 = OpLoad %322 
					                                      f32_3 %324 = OpCompositeConstruct %319 %321 %323 
					                                        f32 %325 = OpCompositeExtract %324 0 
					                                        f32 %326 = OpCompositeExtract %324 1 
					                                        f32 %327 = OpCompositeExtract %324 2 
					                                      f32_3 %328 = OpCompositeConstruct %325 %326 %327 
					                                      f32_3 %329 = OpFMul %316 %328 
					                                      f32_4 %330 = OpLoad %85 
					                                      f32_3 %331 = OpVectorShuffle %330 %330 0 1 2 
					                                      f32_3 %332 = OpFAdd %329 %331 
					                                      f32_4 %333 = OpLoad %85 
					                                      f32_4 %334 = OpVectorShuffle %333 %332 4 5 6 3 
					                                                     OpStore %85 %334 
					                               Private f32* %335 = OpAccessChain %53 %26 
					                                        f32 %336 = OpLoad %335 
					                                        f32 %337 = OpFMul %336 %104 
					                               Private f32* %338 = OpAccessChain %179 %106 
					                                        f32 %339 = OpLoad %338 
					                                        f32 %340 = OpFNegate %339 
					                                        f32 %341 = OpFAdd %337 %340 
					                               Private f32* %342 = OpAccessChain %179 %39 
					                                                     OpStore %342 %341 
					                               Private f32* %343 = OpAccessChain %53 %26 
					                                        f32 %344 = OpLoad %343 
					                                        f32 %345 = OpFMul %344 %113 
					                               Private f32* %346 = OpAccessChain %179 %115 
					                                                     OpStore %346 %345 
					                        read_only Texture2D %349 = OpLoad %348 
					                                    sampler %351 = OpLoad %350 
					                 read_only Texture2DSampled %352 = OpSampledImage %349 %351 
					                                      f32_2 %353 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %354 = OpImageSampleImplicitLod %352 %353 
					                                        f32 %355 = OpCompositeExtract %354 0 
					                                                     OpStore %347 %355 
					                                      f32_4 %356 = OpLoad %179 
					                                      f32_3 %357 = OpVectorShuffle %356 %356 0 2 3 
					                                        f32 %358 = OpLoad %347 
					                                      f32_3 %359 = OpCompositeConstruct %358 %358 %358 
					                                      f32_3 %360 = OpFAdd %357 %359 
					                                      f32_4 %361 = OpLoad %179 
					                                      f32_4 %362 = OpVectorShuffle %361 %360 4 5 6 3 
					                                                     OpStore %179 %362 
					                                      f32_4 %363 = OpLoad %179 
					                                      f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
					                               Uniform f32* %366 = OpAccessChain %36 %365 
					                                        f32 %367 = OpLoad %366 
					                                      f32_3 %368 = OpCompositeConstruct %367 %367 %367 
					                                      f32_3 %369 = OpFMul %364 %368 
					                                      f32_4 %370 = OpLoad %85 
					                                      f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
					                                      f32_3 %372 = OpFAdd %369 %371 
					                                      f32_4 %373 = OpLoad %85 
					                                      f32_4 %374 = OpVectorShuffle %373 %372 4 5 6 3 
					                                                     OpStore %85 %374 
					                               Uniform f32* %376 = OpAccessChain %36 %135 
					                                        f32 %377 = OpLoad %376 
					                               Uniform f32* %378 = OpAccessChain %36 %213 
					                                        f32 %379 = OpLoad %378 
					                                        f32 %380 = OpFAdd %377 %379 
					                                                     OpStore %375 %380 
					                                        f32 %381 = OpLoad %375 
					                               Uniform f32* %382 = OpAccessChain %36 %317 
					                                        f32 %383 = OpLoad %382 
					                                        f32 %384 = OpFAdd %381 %383 
					                                                     OpStore %375 %384 
					                                        f32 %385 = OpLoad %375 
					                               Uniform f32* %386 = OpAccessChain %36 %365 
					                                        f32 %387 = OpLoad %386 
					                                        f32 %388 = OpFAdd %385 %387 
					                                                     OpStore %375 %388 
					                                        f32 %389 = OpLoad %375 
					                                        f32 %391 = OpFAdd %389 %390 
					                                                     OpStore %375 %391 
					                                      f32_4 %392 = OpLoad %85 
					                                      f32_3 %393 = OpVectorShuffle %392 %392 0 1 2 
					                                        f32 %394 = OpLoad %375 
					                                      f32_3 %395 = OpCompositeConstruct %394 %394 %394 
					                                      f32_3 %396 = OpFDiv %393 %395 
					                                      f32_4 %397 = OpLoad %154 
					                                      f32_4 %398 = OpVectorShuffle %397 %396 4 5 6 3 
					                                                     OpStore %154 %398 
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
						vec4 unused_0_2[4];
						float _History1Weight;
						float _History2Weight;
						float _History3Weight;
						float _History4Weight;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _History1LumaTex;
					uniform  sampler2D _History1ChromaTex;
					uniform  sampler2D _History2LumaTex;
					uniform  sampler2D _History2ChromaTex;
					uniform  sampler2D _History3LumaTex;
					uniform  sampler2D _History3ChromaTex;
					uniform  sampler2D _History4LumaTex;
					uniform  sampler2D _History4ChromaTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat15;
					float u_xlat16_15;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = u_xlat10_0.w;
					    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat10_1 = texture(_History1LumaTex, vs_TEXCOORD1.xy);
					    u_xlat15 = vs_TEXCOORD1.x * _MainTex_TexelSize.z;
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat15 = floor(u_xlat15);
					    u_xlat15 = u_xlat15 * 2.0 + 0.5;
					    u_xlat2.z = u_xlat15 * _MainTex_TexelSize.x + _MainTex_TexelSize.x;
					    u_xlat2.x = u_xlat15 * _MainTex_TexelSize.x;
					    u_xlat2.yw = vs_TEXCOORD1.yy;
					    u_xlat10_3 = texture(_History1ChromaTex, u_xlat2.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History1ChromaTex, u_xlat2.xy);
					    u_xlat16_15 = u_xlat10_4.x + -0.5;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat1.xyz = u_xlat10_1.xxx + u_xlat3.xzw;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History1Weight, _History1Weight, _History1Weight)) + u_xlat16_0.xyz;
					    u_xlat10_1 = texture(_History2LumaTex, vs_TEXCOORD1.xy);
					    u_xlat10_3 = texture(_History2ChromaTex, u_xlat2.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History2ChromaTex, u_xlat2.xy);
					    u_xlat16_15 = u_xlat10_4.x + -0.5;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat1.xyz = u_xlat10_1.xxx + u_xlat3.xzw;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(_History2Weight) + u_xlat0.xyz;
					    u_xlat10_1 = texture(_History3ChromaTex, u_xlat2.zw);
					    u_xlat10_3 = texture(_History4ChromaTex, u_xlat2.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat16_15 = u_xlat10_1.x + -0.5;
					    u_xlat1.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History3ChromaTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_History4ChromaTex, u_xlat2.xy);
					    u_xlat16_15 = u_xlat10_2.x + -0.5;
					    u_xlat16_2 = u_xlat10_4.x + -0.5;
					    u_xlat1.z = u_xlat16_2 * -0.344139993 + (-u_xlat1.y);
					    u_xlat1.w = u_xlat16_2 * 1.77199996;
					    u_xlat10_2 = texture(_History3LumaTex, vs_TEXCOORD1.xy);
					    u_xlat1.xyz = u_xlat1.xzw + u_xlat10_2.xxx;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History3Weight, _History3Weight, _History3Weight)) + u_xlat0.xyz;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat10_1 = texture(_History4LumaTex, vs_TEXCOORD1.xy);
					    u_xlat1.xyz = u_xlat3.xzw + u_xlat10_1.xxx;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History4Weight, _History4Weight, _History4Weight)) + u_xlat0.xyz;
					    u_xlat15 = _History1Weight + _History2Weight;
					    u_xlat15 = u_xlat15 + _History3Weight;
					    u_xlat15 = u_xlat15 + _History4Weight;
					    u_xlat15 = u_xlat15 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat15);
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
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[4];
						float _History1Weight;
						float _History2Weight;
						float _History3Weight;
						float _History4Weight;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _History1LumaTex;
					uniform  sampler2D _History1ChromaTex;
					uniform  sampler2D _History2LumaTex;
					uniform  sampler2D _History2ChromaTex;
					uniform  sampler2D _History3LumaTex;
					uniform  sampler2D _History3ChromaTex;
					uniform  sampler2D _History4LumaTex;
					uniform  sampler2D _History4ChromaTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat16_5;
					float u_xlat15;
					float u_xlat16_15;
					void main()
					{
					    u_xlat10_0 = texture(_History1LumaTex, vs_TEXCOORD1.xy);
					    u_xlat5 = vs_TEXCOORD1.x * _MainTex_TexelSize.z;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = floor(u_xlat5);
					    u_xlat5 = u_xlat5 * 2.0 + 0.5;
					    u_xlat1.z = u_xlat5 * _MainTex_TexelSize.x + _MainTex_TexelSize.x;
					    u_xlat1.x = u_xlat5 * _MainTex_TexelSize.x;
					    u_xlat1.yw = vs_TEXCOORD1.yy;
					    u_xlat10_2 = texture(_History1ChromaTex, u_xlat1.zw);
					    u_xlat16_5 = u_xlat10_2.x + -0.5;
					    u_xlat2.xy = vec2(u_xlat16_5) * vec2(1.40199995, 0.714139998);
					    u_xlat10_3 = texture(_History1ChromaTex, u_xlat1.xy);
					    u_xlat16_5 = u_xlat10_3.x + -0.5;
					    u_xlat2.z = u_xlat16_5 * -0.344139993 + (-u_xlat2.y);
					    u_xlat2.w = u_xlat16_5 * 1.77199996;
					    u_xlat0.xyz = u_xlat10_0.xxx + u_xlat2.xzw;
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_History1Weight, _History1Weight, _History1Weight)) + u_xlat10_2.xyz;
					    SV_Target0.w = u_xlat10_2.w;
					    u_xlat10_2 = texture(_History2LumaTex, vs_TEXCOORD1.xy);
					    u_xlat10_3 = texture(_History2ChromaTex, u_xlat1.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History2ChromaTex, u_xlat1.xy);
					    u_xlat16_15 = u_xlat10_4.x + -0.5;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat2.xyz = u_xlat10_2.xxx + u_xlat3.xzw;
					    u_xlat0.xyz = u_xlat2.xyz * vec3(_History2Weight) + u_xlat0.xyz;
					    u_xlat10_2 = texture(_History3ChromaTex, u_xlat1.zw);
					    u_xlat10_3 = texture(_History4ChromaTex, u_xlat1.zw);
					    u_xlat16_15 = u_xlat10_3.x + -0.5;
					    u_xlat3.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat16_15 = u_xlat10_2.x + -0.5;
					    u_xlat2.xy = vec2(u_xlat16_15) * vec2(1.40199995, 0.714139998);
					    u_xlat10_4 = texture(_History3ChromaTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_History4ChromaTex, u_xlat1.xy);
					    u_xlat16_15 = u_xlat10_1.x + -0.5;
					    u_xlat16_1 = u_xlat10_4.x + -0.5;
					    u_xlat2.z = u_xlat16_1 * -0.344139993 + (-u_xlat2.y);
					    u_xlat2.w = u_xlat16_1 * 1.77199996;
					    u_xlat10_1 = texture(_History3LumaTex, vs_TEXCOORD1.xy);
					    u_xlat1.xyz = u_xlat2.xzw + u_xlat10_1.xxx;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History3Weight, _History3Weight, _History3Weight)) + u_xlat0.xyz;
					    u_xlat3.z = u_xlat16_15 * -0.344139993 + (-u_xlat3.y);
					    u_xlat3.w = u_xlat16_15 * 1.77199996;
					    u_xlat10_1 = texture(_History4LumaTex, vs_TEXCOORD1.xy);
					    u_xlat1.xyz = u_xlat3.xzw + u_xlat10_1.xxx;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_History4Weight, _History4Weight, _History4Weight)) + u_xlat0.xyz;
					    u_xlat15 = _History1Weight + _History2Weight;
					    u_xlat15 = u_xlat15 + _History3Weight;
					    u_xlat15 = u_xlat15 + _History4Weight;
					    u_xlat15 = u_xlat15 + 1.0;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat15);
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
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 549493
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
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
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
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
					uniform 	float _History1Weight;
					uniform 	float _History2Weight;
					uniform 	float _History3Weight;
					uniform 	float _History4Weight;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _History1LumaTex;
					UNITY_LOCATION(2) uniform  sampler2D _History2LumaTex;
					UNITY_LOCATION(3) uniform  sampler2D _History3LumaTex;
					UNITY_LOCATION(4) uniform  sampler2D _History4LumaTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					float u_xlat6;
					void main()
					{
					    u_xlat10_0 = texture(_History1LumaTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(vec3(_History1Weight, _History1Weight, _History1Weight)) + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat10_1 = texture(_History2LumaTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat10_1.xyz * vec3(_History2Weight) + u_xlat0.xyz;
					    u_xlat10_1 = texture(_History3LumaTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat10_1.xyz * vec3(vec3(_History3Weight, _History3Weight, _History3Weight)) + u_xlat0.xyz;
					    u_xlat10_1 = texture(_History4LumaTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat10_1.xyz * vec3(vec3(_History4Weight, _History4Weight, _History4Weight)) + u_xlat0.xyz;
					    u_xlat6 = _History1Weight + _History2Weight;
					    u_xlat6 = u_xlat6 + _History3Weight;
					    u_xlat6 = u_xlat6 + _History4Weight;
					    u_xlat6 = u_xlat6 + 1.0;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat6);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 131
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %119 %122 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate vs_TEXCOORD0 Location 119 
					                                                     OpDecorate vs_TEXCOORD1 Location 122 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                              Private f32_4* %99 = OpVariable Private 
					                                            %101 = OpTypePointer Function %6 
					                                        u32 %110 = OpConstant 3 
					                                            %112 = OpTypeVector %6 3 
					                                            %117 = OpTypeVector %6 2 
					                                            %118 = OpTypePointer Output %117 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %125 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %102 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                       bool %100 = OpLoad %84 
					                                                     OpSelectionMerge %104 None 
					                                                     OpBranchConditional %100 %103 %106 
					                                            %103 = OpLabel 
					                                        f32 %105 = OpLoad %91 
					                                                     OpStore %102 %105 
					                                                     OpBranch %104 
					                                            %106 = OpLabel 
					                                 Input f32* %107 = OpAccessChain %92 %68 
					                                        f32 %108 = OpLoad %107 
					                                                     OpStore %102 %108 
					                                                     OpBranch %104 
					                                            %104 = OpLabel 
					                                        f32 %109 = OpLoad %102 
					                               Private f32* %111 = OpAccessChain %99 %110 
					                                                     OpStore %111 %109 
					                                      f32_4 %113 = OpLoad %92 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 1 0 
					                                      f32_4 %115 = OpLoad %99 
					                                      f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
					                                                     OpStore %99 %116 
					                                      f32_4 %120 = OpLoad %99 
					                                      f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                                     OpStore vs_TEXCOORD0 %121 
					                                      f32_4 %123 = OpLoad %99 
					                                      f32_2 %124 = OpVectorShuffle %123 %123 2 3 
					                                                     OpStore vs_TEXCOORD1 %124 
					                                Output f32* %126 = OpAccessChain %72 %22 %68 
					                                        f32 %127 = OpLoad %126 
					                                        f32 %128 = OpFNegate %127 
					                                Output f32* %129 = OpAccessChain %72 %22 %68 
					                                                     OpStore %129 %128 
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
					                                              OpEntryPoint Fragment %4 "main" %22 %60 
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
					                                              OpDecorate %26 RelaxedPrecision 
					                                              OpDecorate %28 RelaxedPrecision 
					                                              OpDecorate %29 RelaxedPrecision 
					                                              OpDecorate %29 DescriptorSet 29 
					                                              OpDecorate %29 Binding 29 
					                                              OpDecorate %30 RelaxedPrecision 
					                                              OpDecorate %31 RelaxedPrecision 
					                                              OpDecorate %31 DescriptorSet 31 
					                                              OpDecorate %31 Binding 31 
					                                              OpDecorate %32 RelaxedPrecision 
					                                              OpDecorate %36 RelaxedPrecision 
					                                              OpDecorate %37 RelaxedPrecision 
					                                              OpMemberDecorate %38 0 RelaxedPrecision 
					                                              OpMemberDecorate %38 0 Offset 38 
					                                              OpMemberDecorate %38 1 RelaxedPrecision 
					                                              OpMemberDecorate %38 1 Offset 38 
					                                              OpMemberDecorate %38 2 RelaxedPrecision 
					                                              OpMemberDecorate %38 2 Offset 38 
					                                              OpMemberDecorate %38 3 RelaxedPrecision 
					                                              OpMemberDecorate %38 3 Offset 38 
					                                              OpDecorate %38 Block 
					                                              OpDecorate %40 DescriptorSet 40 
					                                              OpDecorate %40 Binding 40 
					                                              OpDecorate %45 RelaxedPrecision 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %49 RelaxedPrecision 
					                                              OpDecorate %50 RelaxedPrecision 
					                                              OpDecorate %51 RelaxedPrecision 
					                                              OpDecorate %52 RelaxedPrecision 
					                                              OpDecorate %53 RelaxedPrecision 
					                                              OpDecorate %54 RelaxedPrecision 
					                                              OpDecorate %55 RelaxedPrecision 
					                                              OpDecorate %56 RelaxedPrecision 
					                                              OpDecorate %57 RelaxedPrecision 
					                                              OpDecorate %58 RelaxedPrecision 
					                                              OpDecorate %60 RelaxedPrecision 
					                                              OpDecorate %60 Location 60 
					                                              OpDecorate %65 RelaxedPrecision 
					                                              OpDecorate %68 RelaxedPrecision 
					                                              OpDecorate %68 DescriptorSet 68 
					                                              OpDecorate %68 Binding 68 
					                                              OpDecorate %69 RelaxedPrecision 
					                                              OpDecorate %70 RelaxedPrecision 
					                                              OpDecorate %70 DescriptorSet 70 
					                                              OpDecorate %70 Binding 70 
					                                              OpDecorate %71 RelaxedPrecision 
					                                              OpDecorate %75 RelaxedPrecision 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %79 RelaxedPrecision 
					                                              OpDecorate %82 RelaxedPrecision 
					                                              OpDecorate %84 RelaxedPrecision 
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
					                                              OpDecorate %95 DescriptorSet 95 
					                                              OpDecorate %95 Binding 95 
					                                              OpDecorate %96 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %97 DescriptorSet 97 
					                                              OpDecorate %97 Binding 97 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %102 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 RelaxedPrecision 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %117 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %120 RelaxedPrecision 
					                                              OpDecorate %121 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %122 DescriptorSet 122 
					                                              OpDecorate %122 Binding 122 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %124 RelaxedPrecision 
					                                              OpDecorate %124 DescriptorSet 124 
					                                              OpDecorate %124 Binding 124 
					                                              OpDecorate %125 RelaxedPrecision 
					                                              OpDecorate %129 RelaxedPrecision 
					                                              OpDecorate %132 RelaxedPrecision 
					                                              OpDecorate %133 RelaxedPrecision 
					                                              OpDecorate %136 RelaxedPrecision 
					                                              OpDecorate %137 RelaxedPrecision 
					                                              OpDecorate %138 RelaxedPrecision 
					                                              OpDecorate %139 RelaxedPrecision 
					                                              OpDecorate %140 RelaxedPrecision 
					                                              OpDecorate %141 RelaxedPrecision 
					                                              OpDecorate %143 RelaxedPrecision 
					                                              OpDecorate %145 RelaxedPrecision 
					                                              OpDecorate %146 RelaxedPrecision 
					                                              OpDecorate %147 RelaxedPrecision 
					                                              OpDecorate %149 RelaxedPrecision 
					                                              OpDecorate %150 RelaxedPrecision 
					                                              OpDecorate %151 RelaxedPrecision 
					                                              OpDecorate %153 RelaxedPrecision 
					                                              OpDecorate %154 RelaxedPrecision 
					                                              OpDecorate %155 RelaxedPrecision 
					                                              OpDecorate %157 RelaxedPrecision 
					                                              OpDecorate %158 RelaxedPrecision 
					                                              OpDecorate %159 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %161 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 3 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_3* %9 = OpVariable Private 
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
					                                      %24 = OpTypeVector %6 4 
					                                      %27 = OpTypePointer Private %24 
					                       Private f32_4* %28 = OpVariable Private 
					 UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
					             UniformConstant sampler* %31 = OpVariable UniformConstant 
					                       Private f32_3* %36 = OpVariable Private 
					                                      %38 = OpTypeStruct %6 %6 %6 %6 
					                                      %39 = OpTypePointer Uniform %38 
					Uniform struct {f32; f32; f32; f32;}* %40 = OpVariable Uniform 
					                                      %41 = OpTypeInt 32 1 
					                                  i32 %42 = OpConstant 0 
					                                      %43 = OpTypePointer Uniform %6 
					                                      %59 = OpTypePointer Output %24 
					                        Output f32_4* %60 = OpVariable Output 
					                                      %61 = OpTypeInt 32 0 
					                                  u32 %62 = OpConstant 3 
					                                      %63 = OpTypePointer Private %6 
					                                      %66 = OpTypePointer Output %6 
					 UniformConstant read_only Texture2D* %68 = OpVariable UniformConstant 
					             UniformConstant sampler* %70 = OpVariable UniformConstant 
					                                  i32 %80 = OpConstant 1 
					 UniformConstant read_only Texture2D* %95 = OpVariable UniformConstant 
					             UniformConstant sampler* %97 = OpVariable UniformConstant 
					                                 i32 %107 = OpConstant 2 
					UniformConstant read_only Texture2D* %122 = OpVariable UniformConstant 
					            UniformConstant sampler* %124 = OpVariable UniformConstant 
					                                 i32 %134 = OpConstant 3 
					                        Private f32* %141 = OpVariable Private 
					                                 f32 %156 = OpConstant 3,674022E-40 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                  read_only Texture2D %13 = OpLoad %12 
					                              sampler %17 = OpLoad %16 
					           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                                f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                              OpStore %9 %26 
					                  read_only Texture2D %30 = OpLoad %29 
					                              sampler %32 = OpLoad %31 
					           read_only Texture2DSampled %33 = OpSampledImage %30 %32 
					                                f32_2 %34 = OpLoad vs_TEXCOORD0 
					                                f32_4 %35 = OpImageSampleImplicitLod %33 %34 
					                                              OpStore %28 %35 
					                                f32_3 %37 = OpLoad %9 
					                         Uniform f32* %44 = OpAccessChain %40 %42 
					                                  f32 %45 = OpLoad %44 
					                         Uniform f32* %46 = OpAccessChain %40 %42 
					                                  f32 %47 = OpLoad %46 
					                         Uniform f32* %48 = OpAccessChain %40 %42 
					                                  f32 %49 = OpLoad %48 
					                                f32_3 %50 = OpCompositeConstruct %45 %47 %49 
					                                  f32 %51 = OpCompositeExtract %50 0 
					                                  f32 %52 = OpCompositeExtract %50 1 
					                                  f32 %53 = OpCompositeExtract %50 2 
					                                f32_3 %54 = OpCompositeConstruct %51 %52 %53 
					                                f32_3 %55 = OpFMul %37 %54 
					                                f32_4 %56 = OpLoad %28 
					                                f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
					                                f32_3 %58 = OpFAdd %55 %57 
					                                              OpStore %36 %58 
					                         Private f32* %64 = OpAccessChain %28 %62 
					                                  f32 %65 = OpLoad %64 
					                          Output f32* %67 = OpAccessChain %60 %62 
					                                              OpStore %67 %65 
					                  read_only Texture2D %69 = OpLoad %68 
					                              sampler %71 = OpLoad %70 
					           read_only Texture2DSampled %72 = OpSampledImage %69 %71 
					                                f32_2 %73 = OpLoad vs_TEXCOORD0 
					                                f32_4 %74 = OpImageSampleImplicitLod %72 %73 
					                                f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
					                                f32_4 %76 = OpLoad %28 
					                                f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
					                                              OpStore %28 %77 
					                                f32_4 %78 = OpLoad %28 
					                                f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
					                         Uniform f32* %81 = OpAccessChain %40 %80 
					                                  f32 %82 = OpLoad %81 
					                         Uniform f32* %83 = OpAccessChain %40 %80 
					                                  f32 %84 = OpLoad %83 
					                         Uniform f32* %85 = OpAccessChain %40 %80 
					                                  f32 %86 = OpLoad %85 
					                                f32_3 %87 = OpCompositeConstruct %82 %84 %86 
					                                  f32 %88 = OpCompositeExtract %87 0 
					                                  f32 %89 = OpCompositeExtract %87 1 
					                                  f32 %90 = OpCompositeExtract %87 2 
					                                f32_3 %91 = OpCompositeConstruct %88 %89 %90 
					                                f32_3 %92 = OpFMul %79 %91 
					                                f32_3 %93 = OpLoad %36 
					                                f32_3 %94 = OpFAdd %92 %93 
					                                              OpStore %36 %94 
					                  read_only Texture2D %96 = OpLoad %95 
					                              sampler %98 = OpLoad %97 
					           read_only Texture2DSampled %99 = OpSampledImage %96 %98 
					                               f32_2 %100 = OpLoad vs_TEXCOORD0 
					                               f32_4 %101 = OpImageSampleImplicitLod %99 %100 
					                               f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
					                               f32_4 %103 = OpLoad %28 
					                               f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
					                                              OpStore %28 %104 
					                               f32_4 %105 = OpLoad %28 
					                               f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
					                        Uniform f32* %108 = OpAccessChain %40 %107 
					                                 f32 %109 = OpLoad %108 
					                        Uniform f32* %110 = OpAccessChain %40 %107 
					                                 f32 %111 = OpLoad %110 
					                        Uniform f32* %112 = OpAccessChain %40 %107 
					                                 f32 %113 = OpLoad %112 
					                               f32_3 %114 = OpCompositeConstruct %109 %111 %113 
					                                 f32 %115 = OpCompositeExtract %114 0 
					                                 f32 %116 = OpCompositeExtract %114 1 
					                                 f32 %117 = OpCompositeExtract %114 2 
					                               f32_3 %118 = OpCompositeConstruct %115 %116 %117 
					                               f32_3 %119 = OpFMul %106 %118 
					                               f32_3 %120 = OpLoad %36 
					                               f32_3 %121 = OpFAdd %119 %120 
					                                              OpStore %36 %121 
					                 read_only Texture2D %123 = OpLoad %122 
					                             sampler %125 = OpLoad %124 
					          read_only Texture2DSampled %126 = OpSampledImage %123 %125 
					                               f32_2 %127 = OpLoad vs_TEXCOORD0 
					                               f32_4 %128 = OpImageSampleImplicitLod %126 %127 
					                               f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
					                               f32_4 %130 = OpLoad %28 
					                               f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
					                                              OpStore %28 %131 
					                               f32_4 %132 = OpLoad %28 
					                               f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
					                        Uniform f32* %135 = OpAccessChain %40 %134 
					                                 f32 %136 = OpLoad %135 
					                               f32_3 %137 = OpCompositeConstruct %136 %136 %136 
					                               f32_3 %138 = OpFMul %133 %137 
					                               f32_3 %139 = OpLoad %36 
					                               f32_3 %140 = OpFAdd %138 %139 
					                                              OpStore %36 %140 
					                        Uniform f32* %142 = OpAccessChain %40 %42 
					                                 f32 %143 = OpLoad %142 
					                        Uniform f32* %144 = OpAccessChain %40 %80 
					                                 f32 %145 = OpLoad %144 
					                                 f32 %146 = OpFAdd %143 %145 
					                                              OpStore %141 %146 
					                                 f32 %147 = OpLoad %141 
					                        Uniform f32* %148 = OpAccessChain %40 %107 
					                                 f32 %149 = OpLoad %148 
					                                 f32 %150 = OpFAdd %147 %149 
					                                              OpStore %141 %150 
					                                 f32 %151 = OpLoad %141 
					                        Uniform f32* %152 = OpAccessChain %40 %134 
					                                 f32 %153 = OpLoad %152 
					                                 f32 %154 = OpFAdd %151 %153 
					                                              OpStore %141 %154 
					                                 f32 %155 = OpLoad %141 
					                                 f32 %157 = OpFAdd %155 %156 
					                                              OpStore %141 %157 
					                               f32_3 %158 = OpLoad %36 
					                                 f32 %159 = OpLoad %141 
					                               f32_3 %160 = OpCompositeConstruct %159 %159 %159 
					                               f32_3 %161 = OpFDiv %158 %160 
					                               f32_4 %162 = OpLoad %60 
					                               f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
					                                              OpStore %60 %163 
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
						float _History1Weight;
						float _History2Weight;
						float _History3Weight;
						float _History4Weight;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _History1LumaTex;
					uniform  sampler2D _History2LumaTex;
					uniform  sampler2D _History3LumaTex;
					uniform  sampler2D _History4LumaTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					float u_xlat6;
					void main()
					{
					    u_xlat10_0 = texture(_History1LumaTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(vec3(_History1Weight, _History1Weight, _History1Weight)) + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat10_1 = texture(_History2LumaTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat10_1.xyz * vec3(_History2Weight) + u_xlat0.xyz;
					    u_xlat10_1 = texture(_History3LumaTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat10_1.xyz * vec3(vec3(_History3Weight, _History3Weight, _History3Weight)) + u_xlat0.xyz;
					    u_xlat10_1 = texture(_History4LumaTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat10_1.xyz * vec3(vec3(_History4Weight, _History4Weight, _History4Weight)) + u_xlat0.xyz;
					    u_xlat6 = _History1Weight + _History2Weight;
					    u_xlat6 = u_xlat6 + _History3Weight;
					    u_xlat6 = u_xlat6 + _History4Weight;
					    u_xlat6 = u_xlat6 + 1.0;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat6);
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