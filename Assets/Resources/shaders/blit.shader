Shader "Hidden/Post FX/Blit" {
	Properties {
		_MainTex ("Main Texture", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 9948
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
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
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#ifdef GL_ARB_shader_bit_encoding
					#extension GL_ARB_shader_bit_encoding : enable
					#endif
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 102
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %12 %35 %86 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate vs_TEXCOORD0 Location 9 
					                                                     OpDecorate %12 Location 12 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpDecorate %18 ArrayStride 18 
					                                                     OpMemberDecorate %19 0 Offset 19 
					                                                     OpMemberDecorate %19 1 Offset 19 
					                                                     OpMemberDecorate %19 2 Offset 19 
					                                                     OpDecorate %19 Block 
					                                                     OpDecorate %21 DescriptorSet 21 
					                                                     OpDecorate %21 Binding 21 
					                                                     OpDecorate %35 Location 35 
					                                                     OpMemberDecorate %84 0 BuiltIn 84 
					                                                     OpMemberDecorate %84 1 BuiltIn 84 
					                                                     OpMemberDecorate %84 2 BuiltIn 84 
					                                                     OpDecorate %84 Block 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 2 
					                                              %8 = OpTypePointer Output %7 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %10 = OpTypeVector %6 4 
					                                             %11 = OpTypePointer Input %10 
					                                Input f32_4* %12 = OpVariable Input 
					                                             %15 = OpTypeInt 32 0 
					                                         u32 %16 = OpConstant 4 
					                                             %17 = OpTypeArray %10 %16 
					                                             %18 = OpTypeArray %10 %16 
					                                             %19 = OpTypeStruct %17 %18 %10 
					                                             %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
					                                             %22 = OpTypeInt 32 1 
					                                         i32 %23 = OpConstant 2 
					                                             %24 = OpTypePointer Uniform %10 
					                                             %33 = OpTypePointer Private %10 
					                              Private f32_4* %34 = OpVariable Private 
					                                Input f32_4* %35 = OpVariable Input 
					                                         i32 %38 = OpConstant 0 
					                                         i32 %39 = OpConstant 1 
					                                         i32 %58 = OpConstant 3 
					                              Private f32_4* %62 = OpVariable Private 
					                                         u32 %82 = OpConstant 1 
					                                             %83 = OpTypeArray %6 %82 
					                                             %84 = OpTypeStruct %10 %6 %83 
					                                             %85 = OpTypePointer Output %84 
					        Output struct {f32_4; f32; f32[1];}* %86 = OpVariable Output 
					                                             %94 = OpTypePointer Output %10 
					                                             %96 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %13 = OpLoad %12 
					                                       f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                              Uniform f32_4* %25 = OpAccessChain %21 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_2 %27 = OpVectorShuffle %26 %26 0 1 
					                                       f32_2 %28 = OpFMul %14 %27 
					                              Uniform f32_4* %29 = OpAccessChain %21 %23 
					                                       f32_4 %30 = OpLoad %29 
					                                       f32_2 %31 = OpVectorShuffle %30 %30 2 3 
					                                       f32_2 %32 = OpFAdd %28 %31 
					                                                     OpStore vs_TEXCOORD0 %32 
					                                       f32_4 %36 = OpLoad %35 
					                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
					                              Uniform f32_4* %40 = OpAccessChain %21 %38 %39 
					                                       f32_4 %41 = OpLoad %40 
					                                       f32_4 %42 = OpFMul %37 %41 
					                                                     OpStore %34 %42 
					                              Uniform f32_4* %43 = OpAccessChain %21 %38 %38 
					                                       f32_4 %44 = OpLoad %43 
					                                       f32_4 %45 = OpLoad %35 
					                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
					                                       f32_4 %47 = OpFMul %44 %46 
					                                       f32_4 %48 = OpLoad %34 
					                                       f32_4 %49 = OpFAdd %47 %48 
					                                                     OpStore %34 %49 
					                              Uniform f32_4* %50 = OpAccessChain %21 %38 %23 
					                                       f32_4 %51 = OpLoad %50 
					                                       f32_4 %52 = OpLoad %35 
					                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
					                                       f32_4 %54 = OpFMul %51 %53 
					                                       f32_4 %55 = OpLoad %34 
					                                       f32_4 %56 = OpFAdd %54 %55 
					                                                     OpStore %34 %56 
					                                       f32_4 %57 = OpLoad %34 
					                              Uniform f32_4* %59 = OpAccessChain %21 %38 %58 
					                                       f32_4 %60 = OpLoad %59 
					                                       f32_4 %61 = OpFAdd %57 %60 
					                                                     OpStore %34 %61 
					                                       f32_4 %63 = OpLoad %34 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
					                              Uniform f32_4* %65 = OpAccessChain %21 %39 %39 
					                                       f32_4 %66 = OpLoad %65 
					                                       f32_4 %67 = OpFMul %64 %66 
					                                                     OpStore %62 %67 
					                              Uniform f32_4* %68 = OpAccessChain %21 %39 %38 
					                                       f32_4 %69 = OpLoad %68 
					                                       f32_4 %70 = OpLoad %34 
					                                       f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
					                                       f32_4 %72 = OpFMul %69 %71 
					                                       f32_4 %73 = OpLoad %62 
					                                       f32_4 %74 = OpFAdd %72 %73 
					                                                     OpStore %62 %74 
					                              Uniform f32_4* %75 = OpAccessChain %21 %39 %23 
					                                       f32_4 %76 = OpLoad %75 
					                                       f32_4 %77 = OpLoad %34 
					                                       f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
					                                       f32_4 %79 = OpFMul %76 %78 
					                                       f32_4 %80 = OpLoad %62 
					                                       f32_4 %81 = OpFAdd %79 %80 
					                                                     OpStore %62 %81 
					                              Uniform f32_4* %87 = OpAccessChain %21 %39 %58 
					                                       f32_4 %88 = OpLoad %87 
					                                       f32_4 %89 = OpLoad %34 
					                                       f32_4 %90 = OpVectorShuffle %89 %89 3 3 3 3 
					                                       f32_4 %91 = OpFMul %88 %90 
					                                       f32_4 %92 = OpLoad %62 
					                                       f32_4 %93 = OpFAdd %91 %92 
					                               Output f32_4* %95 = OpAccessChain %86 %38 
					                                                     OpStore %95 %93 
					                                 Output f32* %97 = OpAccessChain %86 %38 %82 
					                                         f32 %98 = OpLoad %97 
					                                         f32 %99 = OpFNegate %98 
					                                Output f32* %100 = OpAccessChain %86 %38 %82 
					                                                     OpStore %100 %99 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 29
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
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %26 Location 26 
					                                             OpDecorate %27 RelaxedPrecision 
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
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD0 
					                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                             OpStore %9 %24 
					                               f32_4 %27 = OpLoad %9 
					                                             OpStore %26 %27 
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
					
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = texture(_MainTex, vs_TEXCOORD0.xy);
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