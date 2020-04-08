Shader "Hidden/Image Effects/Cinematic/Bloom" {
	Properties {
		_MainTex ("", 2D) = "" {}
		_BaseTex ("", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 57031
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[4];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					uniform 	float _PrefilterOffs;
					uniform 	float _Threshold;
					uniform 	vec3 _Curve;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_6 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_6 = max(u_xlat16_0.z, u_xlat16_6);
					    u_xlat1 = u_xlat16_6 + (-_Curve.x);
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat1 = min(u_xlat1, _Curve.y);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * _Curve.z;
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
					; Bound: 106
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %97 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 97 
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
					                                             %83 = OpTypePointer Input %82 
					                                Input f32_2* %84 = OpVariable Input 
					                                             %96 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                            %100 = OpTypePointer Output %6 
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
					                                       f32_2 %85 = OpLoad %84 
					                              Uniform f32_4* %86 = OpAccessChain %20 %35 
					                                       f32_4 %87 = OpLoad %86 
					                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                       f32_2 %89 = OpFMul %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                       f32_2 %93 = OpFAdd %89 %92 
					                                       f32_4 %94 = OpLoad %9 
					                                       f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
					                                                     OpStore %9 %95 
					                                       f32_4 %98 = OpLoad %9 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore vs_TEXCOORD0 %99 
					                                Output f32* %101 = OpAccessChain %72 %22 %68 
					                                        f32 %102 = OpLoad %101 
					                                        f32 %103 = OpFNegate %102 
					                                Output f32* %104 = OpAccessChain %72 %22 %68 
					                                                     OpStore %104 %103 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 123
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %26 %112 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpMemberDecorate %11 0 Offset 11 
					                                                  OpMemberDecorate %11 1 Offset 11 
					                                                  OpMemberDecorate %11 2 RelaxedPrecision 
					                                                  OpMemberDecorate %11 2 Offset 11 
					                                                  OpMemberDecorate %11 3 RelaxedPrecision 
					                                                  OpMemberDecorate %11 3 Offset 11 
					                                                  OpDecorate %11 Block 
					                                                  OpDecorate %13 DescriptorSet 13 
					                                                  OpDecorate %13 Binding 13 
					                                                  OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                  OpDecorate vs_TEXCOORD0 Location 26 
					                                                  OpDecorate %27 RelaxedPrecision 
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
					                                                  OpDecorate %49 RelaxedPrecision 
					                                                  OpDecorate %51 RelaxedPrecision 
					                                                  OpDecorate %55 RelaxedPrecision 
					                                                  OpDecorate %58 RelaxedPrecision 
					                                                  OpDecorate %59 RelaxedPrecision 
					                                                  OpDecorate %62 RelaxedPrecision 
					                                                  OpDecorate %63 RelaxedPrecision 
					                                                  OpDecorate %64 RelaxedPrecision 
					                                                  OpDecorate %65 RelaxedPrecision 
					                                                  OpDecorate %66 RelaxedPrecision 
					                                                  OpDecorate %67 RelaxedPrecision 
					                                                  OpDecorate %71 RelaxedPrecision 
					                                                  OpDecorate %72 RelaxedPrecision 
					                                                  OpDecorate %73 RelaxedPrecision 
					                                                  OpDecorate %74 RelaxedPrecision 
					                                                  OpDecorate %75 RelaxedPrecision 
					                                                  OpDecorate %77 RelaxedPrecision 
					                                                  OpDecorate %79 RelaxedPrecision 
					                                                  OpDecorate %81 RelaxedPrecision 
					                                                  OpDecorate %84 RelaxedPrecision 
					                                                  OpDecorate %86 RelaxedPrecision 
					                                                  OpDecorate %87 RelaxedPrecision 
					                                                  OpDecorate %90 RelaxedPrecision 
					                                                  OpDecorate %92 RelaxedPrecision 
					                                                  OpDecorate %93 RelaxedPrecision 
					                                                  OpDecorate %96 RelaxedPrecision 
					                                                  OpDecorate %98 RelaxedPrecision 
					                                                  OpDecorate %99 RelaxedPrecision 
					                                                  OpDecorate %102 RelaxedPrecision 
					                                                  OpDecorate %104 RelaxedPrecision 
					                                                  OpDecorate %105 RelaxedPrecision 
					                                                  OpDecorate %108 RelaxedPrecision 
					                                                  OpDecorate %109 RelaxedPrecision 
					                                                  OpDecorate %110 RelaxedPrecision 
					                                                  OpDecorate %112 RelaxedPrecision 
					                                                  OpDecorate %112 Location 112 
					                                                  OpDecorate %113 RelaxedPrecision 
					                                                  OpDecorate %114 RelaxedPrecision 
					                                                  OpDecorate %115 RelaxedPrecision 
					                                                  OpDecorate %116 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 2 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_2* %9 = OpVariable Private 
					                                          %10 = OpTypeVector %6 3 
					                                          %11 = OpTypeStruct %7 %6 %6 %10 
					                                          %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_2; f32; f32; f32_3;}* %13 = OpVariable Uniform 
					                                          %14 = OpTypeInt 32 1 
					                                      i32 %15 = OpConstant 0 
					                                          %16 = OpTypePointer Uniform %7 
					                                      i32 %19 = OpConstant 1 
					                                          %20 = OpTypePointer Uniform %6 
					                                          %25 = OpTypePointer Input %7 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          %29 = OpTypePointer Private %10 
					                           Private f32_3* %30 = OpVariable Private 
					                                          %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %32 = OpTypePointer UniformConstant %31 
					     UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
					                                          %35 = OpTypeSampler 
					                                          %36 = OpTypePointer UniformConstant %35 
					                 UniformConstant sampler* %37 = OpVariable UniformConstant 
					                                          %39 = OpTypeSampledImage %31 
					                                          %42 = OpTypeVector %6 4 
					                           Private f32_3* %45 = OpVariable Private 
					                                      f32 %47 = OpConstant 3,674022E-40 
					                                    f32_3 %48 = OpConstantComposite %47 %47 %47 
					                                          %50 = OpTypePointer Private %6 
					                             Private f32* %51 = OpVariable Private 
					                                          %52 = OpTypeInt 32 0 
					                                      u32 %53 = OpConstant 1 
					                                      u32 %56 = OpConstant 0 
					                                      u32 %60 = OpConstant 2 
					                           Private f32_2* %65 = OpVariable Private 
					                                      i32 %68 = OpConstant 3 
					                                          %69 = OpTypePointer Uniform %10 
					                                      f32 %76 = OpConstant 3,674022E-40 
					                                      f32 %80 = OpConstant 3,674022E-40 
					                                         %111 = OpTypePointer Output %42 
					                           Output f32_4* %112 = OpVariable Output 
					                                     u32 %119 = OpConstant 3 
					                                         %120 = OpTypePointer Output %6 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                           Uniform f32_2* %17 = OpAccessChain %13 %15 
					                                    f32_2 %18 = OpLoad %17 
					                             Uniform f32* %21 = OpAccessChain %13 %19 
					                                      f32 %22 = OpLoad %21 
					                                    f32_2 %23 = OpCompositeConstruct %22 %22 
					                                    f32_2 %24 = OpFMul %18 %23 
					                                    f32_2 %27 = OpLoad vs_TEXCOORD0 
					                                    f32_2 %28 = OpFAdd %24 %27 
					                                                  OpStore %9 %28 
					                      read_only Texture2D %34 = OpLoad %33 
					                                  sampler %38 = OpLoad %37 
					               read_only Texture2DSampled %40 = OpSampledImage %34 %38 
					                                    f32_2 %41 = OpLoad %9 
					                                    f32_4 %43 = OpImageSampleImplicitLod %40 %41 
					                                    f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
					                                                  OpStore %30 %44 
					                                    f32_3 %46 = OpLoad %30 
					                                    f32_3 %49 = OpExtInst %1 37 %46 %48 
					                                                  OpStore %45 %49 
					                             Private f32* %54 = OpAccessChain %45 %53 
					                                      f32 %55 = OpLoad %54 
					                             Private f32* %57 = OpAccessChain %45 %56 
					                                      f32 %58 = OpLoad %57 
					                                      f32 %59 = OpExtInst %1 40 %55 %58 
					                                                  OpStore %51 %59 
					                             Private f32* %61 = OpAccessChain %45 %60 
					                                      f32 %62 = OpLoad %61 
					                                      f32 %63 = OpLoad %51 
					                                      f32 %64 = OpExtInst %1 40 %62 %63 
					                                                  OpStore %51 %64 
					                                      f32 %66 = OpLoad %51 
					                                    f32_2 %67 = OpCompositeConstruct %66 %66 
					                           Uniform f32_3* %70 = OpAccessChain %13 %68 
					                                    f32_3 %71 = OpLoad %70 
					                                    f32_2 %72 = OpVectorShuffle %71 %71 0 0 
					                                    f32_2 %73 = OpFNegate %72 
					                                    f32_2 %74 = OpFAdd %67 %73 
					                                                  OpStore %65 %74 
					                                      f32 %75 = OpLoad %51 
					                                      f32 %77 = OpExtInst %1 40 %75 %76 
					                                                  OpStore %51 %77 
					                             Private f32* %78 = OpAccessChain %65 %56 
					                                      f32 %79 = OpLoad %78 
					                                      f32 %81 = OpExtInst %1 40 %79 %80 
					                             Private f32* %82 = OpAccessChain %65 %56 
					                                                  OpStore %82 %81 
					                             Private f32* %83 = OpAccessChain %65 %56 
					                                      f32 %84 = OpLoad %83 
					                             Uniform f32* %85 = OpAccessChain %13 %68 %53 
					                                      f32 %86 = OpLoad %85 
					                                      f32 %87 = OpExtInst %1 37 %84 %86 
					                             Private f32* %88 = OpAccessChain %65 %56 
					                                                  OpStore %88 %87 
					                             Private f32* %89 = OpAccessChain %65 %56 
					                                      f32 %90 = OpLoad %89 
					                             Private f32* %91 = OpAccessChain %65 %56 
					                                      f32 %92 = OpLoad %91 
					                                      f32 %93 = OpFMul %90 %92 
					                             Private f32* %94 = OpAccessChain %65 %56 
					                                                  OpStore %94 %93 
					                             Private f32* %95 = OpAccessChain %65 %56 
					                                      f32 %96 = OpLoad %95 
					                             Uniform f32* %97 = OpAccessChain %13 %68 %60 
					                                      f32 %98 = OpLoad %97 
					                                      f32 %99 = OpFMul %96 %98 
					                            Private f32* %100 = OpAccessChain %65 %56 
					                                                  OpStore %100 %99 
					                            Private f32* %101 = OpAccessChain %65 %53 
					                                     f32 %102 = OpLoad %101 
					                            Private f32* %103 = OpAccessChain %65 %56 
					                                     f32 %104 = OpLoad %103 
					                                     f32 %105 = OpExtInst %1 40 %102 %104 
					                            Private f32* %106 = OpAccessChain %65 %56 
					                                                  OpStore %106 %105 
					                            Private f32* %107 = OpAccessChain %65 %56 
					                                     f32 %108 = OpLoad %107 
					                                     f32 %109 = OpLoad %51 
					                                     f32 %110 = OpFDiv %108 %109 
					                                                  OpStore %51 %110 
					                                     f32 %113 = OpLoad %51 
					                                   f32_3 %114 = OpCompositeConstruct %113 %113 %113 
					                                   f32_3 %115 = OpLoad %45 
					                                   f32_3 %116 = OpFMul %114 %115 
					                                   f32_4 %117 = OpLoad %112 
					                                   f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                  OpStore %112 %118 
					                             Output f32* %121 = OpAccessChain %112 %119 
					                                                  OpStore %121 %80 
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
						vec4 unused_0_2[4];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					uniform 	float _PrefilterOffs;
					uniform 	float _Threshold;
					uniform 	vec3 _Curve;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
					    u_xlat16_6 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_6 = max(u_xlat16_0.z, u_xlat16_6);
					    u_xlat1 = u_xlat16_6 + (-_Curve.x);
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat1 = min(u_xlat1, _Curve.y);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * _Curve.z;
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
					; Bound: 106
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %97 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 97 
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
					                                             %83 = OpTypePointer Input %82 
					                                Input f32_2* %84 = OpVariable Input 
					                                             %96 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                            %100 = OpTypePointer Output %6 
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
					                                       f32_2 %85 = OpLoad %84 
					                              Uniform f32_4* %86 = OpAccessChain %20 %35 
					                                       f32_4 %87 = OpLoad %86 
					                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                       f32_2 %89 = OpFMul %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                       f32_2 %93 = OpFAdd %89 %92 
					                                       f32_4 %94 = OpLoad %9 
					                                       f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
					                                                     OpStore %9 %95 
					                                       f32_4 %98 = OpLoad %9 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore vs_TEXCOORD0 %99 
					                                Output f32* %101 = OpAccessChain %72 %22 %68 
					                                        f32 %102 = OpLoad %101 
					                                        f32 %103 = OpFNegate %102 
					                                Output f32* %104 = OpAccessChain %72 %22 %68 
					                                                     OpStore %104 %103 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 137
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %26 %126 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpMemberDecorate %11 0 Offset 11 
					                                                  OpMemberDecorate %11 1 Offset 11 
					                                                  OpMemberDecorate %11 2 RelaxedPrecision 
					                                                  OpMemberDecorate %11 2 Offset 11 
					                                                  OpMemberDecorate %11 3 RelaxedPrecision 
					                                                  OpMemberDecorate %11 3 Offset 11 
					                                                  OpDecorate %11 Block 
					                                                  OpDecorate %13 DescriptorSet 13 
					                                                  OpDecorate %13 Binding 13 
					                                                  OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                  OpDecorate vs_TEXCOORD0 Location 26 
					                                                  OpDecorate %27 RelaxedPrecision 
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
					                                                  OpDecorate %49 RelaxedPrecision 
					                                                  OpDecorate %50 RelaxedPrecision 
					                                                  OpDecorate %51 RelaxedPrecision 
					                                                  OpDecorate %54 RelaxedPrecision 
					                                                  OpDecorate %57 RelaxedPrecision 
					                                                  OpDecorate %58 RelaxedPrecision 
					                                                  OpDecorate %59 RelaxedPrecision 
					                                                  OpDecorate %60 RelaxedPrecision 
					                                                  OpDecorate %63 RelaxedPrecision 
					                                                  OpDecorate %64 RelaxedPrecision 
					                                                  OpDecorate %65 RelaxedPrecision 
					                                                  OpDecorate %66 RelaxedPrecision 
					                                                  OpDecorate %71 RelaxedPrecision 
					                                                  OpDecorate %74 RelaxedPrecision 
					                                                  OpDecorate %75 RelaxedPrecision 
					                                                  OpDecorate %79 RelaxedPrecision 
					                                                  OpDecorate %81 RelaxedPrecision 
					                                                  OpDecorate %82 RelaxedPrecision 
					                                                  OpDecorate %84 RelaxedPrecision 
					                                                  OpDecorate %85 RelaxedPrecision 
					                                                  OpDecorate %89 RelaxedPrecision 
					                                                  OpDecorate %90 RelaxedPrecision 
					                                                  OpDecorate %91 RelaxedPrecision 
					                                                  OpDecorate %92 RelaxedPrecision 
					                                                  OpDecorate %95 RelaxedPrecision 
					                                                  OpDecorate %96 RelaxedPrecision 
					                                                  OpDecorate %100 RelaxedPrecision 
					                                                  OpDecorate %103 RelaxedPrecision 
					                                                  OpDecorate %105 RelaxedPrecision 
					                                                  OpDecorate %107 RelaxedPrecision 
					                                                  OpDecorate %108 RelaxedPrecision 
					                                                  OpDecorate %109 RelaxedPrecision 
					                                                  OpDecorate %110 RelaxedPrecision 
					                                                  OpDecorate %111 RelaxedPrecision 
					                                                  OpDecorate %112 RelaxedPrecision 
					                                                  OpDecorate %114 RelaxedPrecision 
					                                                  OpDecorate %115 RelaxedPrecision 
					                                                  OpDecorate %117 RelaxedPrecision 
					                                                  OpDecorate %118 RelaxedPrecision 
					                                                  OpDecorate %119 RelaxedPrecision 
					                                                  OpDecorate %120 RelaxedPrecision 
					                                                  OpDecorate %122 RelaxedPrecision 
					                                                  OpDecorate %123 RelaxedPrecision 
					                                                  OpDecorate %126 RelaxedPrecision 
					                                                  OpDecorate %126 Location 126 
					                                                  OpDecorate %127 RelaxedPrecision 
					                                                  OpDecorate %128 RelaxedPrecision 
					                                                  OpDecorate %129 RelaxedPrecision 
					                                                  OpDecorate %130 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 2 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_2* %9 = OpVariable Private 
					                                          %10 = OpTypeVector %6 3 
					                                          %11 = OpTypeStruct %7 %6 %6 %10 
					                                          %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_2; f32; f32; f32_3;}* %13 = OpVariable Uniform 
					                                          %14 = OpTypeInt 32 1 
					                                      i32 %15 = OpConstant 0 
					                                          %16 = OpTypePointer Uniform %7 
					                                      i32 %19 = OpConstant 1 
					                                          %20 = OpTypePointer Uniform %6 
					                                          %25 = OpTypePointer Input %7 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          %29 = OpTypePointer Private %10 
					                           Private f32_3* %30 = OpVariable Private 
					                                          %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %32 = OpTypePointer UniformConstant %31 
					     UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
					                                          %35 = OpTypeSampler 
					                                          %36 = OpTypePointer UniformConstant %35 
					                 UniformConstant sampler* %37 = OpVariable UniformConstant 
					                                          %39 = OpTypeSampledImage %31 
					                                          %42 = OpTypeVector %6 4 
					                           Private f32_3* %45 = OpVariable Private 
					                                      f32 %47 = OpConstant 3,674022E-40 
					                                    f32_3 %48 = OpConstantComposite %47 %47 %47 
					                           Private f32_3* %50 = OpVariable Private 
					                                      f32 %52 = OpConstant 3,674022E-40 
					                                    f32_3 %53 = OpConstantComposite %52 %52 %52 
					                                      f32 %55 = OpConstant 3,674022E-40 
					                                    f32_3 %56 = OpConstantComposite %55 %55 %55 
					                                      f32 %61 = OpConstant 3,674022E-40 
					                                    f32_3 %62 = OpConstantComposite %61 %61 %61 
					                                          %67 = OpTypeInt 32 0 
					                                      u32 %68 = OpConstant 1 
					                                          %69 = OpTypePointer Private %6 
					                                      u32 %72 = OpConstant 0 
					                                      u32 %77 = OpConstant 2 
					                                      i32 %86 = OpConstant 3 
					                                          %87 = OpTypePointer Uniform %10 
					                                      f32 %97 = OpConstant 3,674022E-40 
					                                      f32 %98 = OpConstant 3,674022E-40 
					                                    f32_2 %99 = OpConstantComposite %97 %98 
					                            Private f32* %103 = OpVariable Private 
					                                         %125 = OpTypePointer Output %42 
					                           Output f32_4* %126 = OpVariable Output 
					                                     u32 %133 = OpConstant 3 
					                                         %134 = OpTypePointer Output %6 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                           Uniform f32_2* %17 = OpAccessChain %13 %15 
					                                    f32_2 %18 = OpLoad %17 
					                             Uniform f32* %21 = OpAccessChain %13 %19 
					                                      f32 %22 = OpLoad %21 
					                                    f32_2 %23 = OpCompositeConstruct %22 %22 
					                                    f32_2 %24 = OpFMul %18 %23 
					                                    f32_2 %27 = OpLoad vs_TEXCOORD0 
					                                    f32_2 %28 = OpFAdd %24 %27 
					                                                  OpStore %9 %28 
					                      read_only Texture2D %34 = OpLoad %33 
					                                  sampler %38 = OpLoad %37 
					               read_only Texture2DSampled %40 = OpSampledImage %34 %38 
					                                    f32_2 %41 = OpLoad %9 
					                                    f32_4 %43 = OpImageSampleImplicitLod %40 %41 
					                                    f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
					                                                  OpStore %30 %44 
					                                    f32_3 %46 = OpLoad %30 
					                                    f32_3 %49 = OpExtInst %1 37 %46 %48 
					                                                  OpStore %45 %49 
					                                    f32_3 %51 = OpLoad %45 
					                                    f32_3 %54 = OpFMul %51 %53 
					                                    f32_3 %57 = OpFAdd %54 %56 
					                                                  OpStore %50 %57 
					                                    f32_3 %58 = OpLoad %45 
					                                    f32_3 %59 = OpLoad %50 
					                                    f32_3 %60 = OpFMul %58 %59 
					                                    f32_3 %63 = OpFAdd %60 %62 
					                                                  OpStore %50 %63 
					                                    f32_3 %64 = OpLoad %50 
					                                    f32_3 %65 = OpLoad %45 
					                                    f32_3 %66 = OpFMul %64 %65 
					                                                  OpStore %50 %66 
					                             Private f32* %70 = OpAccessChain %50 %68 
					                                      f32 %71 = OpLoad %70 
					                             Private f32* %73 = OpAccessChain %50 %72 
					                                      f32 %74 = OpLoad %73 
					                                      f32 %75 = OpExtInst %1 40 %71 %74 
					                             Private f32* %76 = OpAccessChain %45 %72 
					                                                  OpStore %76 %75 
					                             Private f32* %78 = OpAccessChain %50 %77 
					                                      f32 %79 = OpLoad %78 
					                             Private f32* %80 = OpAccessChain %45 %72 
					                                      f32 %81 = OpLoad %80 
					                                      f32 %82 = OpExtInst %1 40 %79 %81 
					                             Private f32* %83 = OpAccessChain %45 %72 
					                                                  OpStore %83 %82 
					                                    f32_3 %84 = OpLoad %45 
					                                    f32_2 %85 = OpVectorShuffle %84 %84 0 0 
					                           Uniform f32_3* %88 = OpAccessChain %13 %86 
					                                    f32_3 %89 = OpLoad %88 
					                                    f32_2 %90 = OpVectorShuffle %89 %89 0 0 
					                                    f32_2 %91 = OpFNegate %90 
					                                    f32_2 %92 = OpFAdd %85 %91 
					                                    f32_3 %93 = OpLoad %45 
					                                    f32_3 %94 = OpVectorShuffle %93 %92 0 3 4 
					                                                  OpStore %45 %94 
					                                    f32_3 %95 = OpLoad %45 
					                                    f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                   f32_2 %100 = OpExtInst %1 40 %96 %99 
					                                   f32_3 %101 = OpLoad %45 
					                                   f32_3 %102 = OpVectorShuffle %101 %100 3 4 2 
					                                                  OpStore %45 %102 
					                            Private f32* %104 = OpAccessChain %45 %68 
					                                     f32 %105 = OpLoad %104 
					                            Uniform f32* %106 = OpAccessChain %13 %86 %68 
					                                     f32 %107 = OpLoad %106 
					                                     f32 %108 = OpExtInst %1 37 %105 %107 
					                                                  OpStore %103 %108 
					                                     f32 %109 = OpLoad %103 
					                                     f32 %110 = OpLoad %103 
					                                     f32 %111 = OpFMul %109 %110 
					                                                  OpStore %103 %111 
					                                     f32 %112 = OpLoad %103 
					                            Uniform f32* %113 = OpAccessChain %13 %86 %77 
					                                     f32 %114 = OpLoad %113 
					                                     f32 %115 = OpFMul %112 %114 
					                                                  OpStore %103 %115 
					                            Private f32* %116 = OpAccessChain %45 %77 
					                                     f32 %117 = OpLoad %116 
					                                     f32 %118 = OpLoad %103 
					                                     f32 %119 = OpExtInst %1 40 %117 %118 
					                                                  OpStore %103 %119 
					                                     f32 %120 = OpLoad %103 
					                            Private f32* %121 = OpAccessChain %45 %72 
					                                     f32 %122 = OpLoad %121 
					                                     f32 %123 = OpFDiv %120 %122 
					                            Private f32* %124 = OpAccessChain %45 %72 
					                                                  OpStore %124 %123 
					                                   f32_3 %127 = OpLoad %50 
					                                   f32_3 %128 = OpLoad %45 
					                                   f32_3 %129 = OpVectorShuffle %128 %128 0 0 0 
					                                   f32_3 %130 = OpFMul %127 %129 
					                                   f32_4 %131 = OpLoad %126 
					                                   f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
					                                                  OpStore %126 %132 
					                             Output f32* %135 = OpAccessChain %126 %133 
					                                                  OpStore %135 %98 
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[2];
						float _PrefilterOffs;
						float _Threshold;
						vec3 _Curve;
						vec4 unused_0_6;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_6 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_6 = max(u_xlat16_0.z, u_xlat16_6);
					    u_xlat1 = u_xlat16_6 + (-_Curve.x);
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat1 = min(u_xlat1, _Curve.y);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * _Curve.z;
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[2];
						float _PrefilterOffs;
						float _Threshold;
						vec3 _Curve;
						vec4 unused_0_6;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
					    u_xlat16_6 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_6 = max(u_xlat16_0.z, u_xlat16_6);
					    u_xlat1 = u_xlat16_6 + (-_Curve.x);
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat1 = min(u_xlat1, _Curve.y);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * _Curve.z;
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
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 89054
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[4];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					uniform 	float _PrefilterOffs;
					uniform 	float _Threshold;
					uniform 	vec3 _Curve;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat16_6;
					float u_xlat8;
					float u_xlat21;
					float u_xlat16_21;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_2.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat10_3 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
					    u_xlat16_3.xyz = min(u_xlat10_3.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_4.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat10_5 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_5.xyz = min(u_xlat10_5.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
					    u_xlat16_6.xyz = min(u_xlat16_2.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_5.xyz, u_xlat16_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_2.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_4.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_4.xyz);
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_21 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_21 = max(u_xlat16_0.z, u_xlat16_21);
					    u_xlat1.x = u_xlat16_21 + (-_Curve.x);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _Curve.y);
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * _Curve.z;
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
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 106
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %97 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 97 
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
					                                             %83 = OpTypePointer Input %82 
					                                Input f32_2* %84 = OpVariable Input 
					                                             %96 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                            %100 = OpTypePointer Output %6 
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
					                                       f32_2 %85 = OpLoad %84 
					                              Uniform f32_4* %86 = OpAccessChain %20 %35 
					                                       f32_4 %87 = OpLoad %86 
					                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                       f32_2 %89 = OpFMul %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                       f32_2 %93 = OpFAdd %89 %92 
					                                       f32_4 %94 = OpLoad %9 
					                                       f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
					                                                     OpStore %9 %95 
					                                       f32_4 %98 = OpLoad %9 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore vs_TEXCOORD0 %99 
					                                Output f32* %101 = OpAccessChain %72 %22 %68 
					                                        f32 %102 = OpLoad %101 
					                                        f32 %103 = OpFNegate %102 
					                                Output f32* %104 = OpAccessChain %72 %22 %68 
					                                                     OpStore %104 %103 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 240
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %28 %229 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpMemberDecorate %12 0 Offset 12 
					                                                  OpMemberDecorate %12 1 Offset 12 
					                                                  OpMemberDecorate %12 2 RelaxedPrecision 
					                                                  OpMemberDecorate %12 2 Offset 12 
					                                                  OpMemberDecorate %12 3 RelaxedPrecision 
					                                                  OpMemberDecorate %12 3 Offset 12 
					                                                  OpDecorate %12 Block 
					                                                  OpDecorate %14 DescriptorSet 14 
					                                                  OpDecorate %14 Binding 14 
					                                                  OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                  OpDecorate vs_TEXCOORD0 Location 28 
					                                                  OpDecorate %29 RelaxedPrecision 
					                                                  OpDecorate %30 RelaxedPrecision 
					                                                  OpDecorate %45 RelaxedPrecision 
					                                                  OpDecorate %48 RelaxedPrecision 
					                                                  OpDecorate %48 DescriptorSet 48 
					                                                  OpDecorate %48 Binding 48 
					                                                  OpDecorate %49 RelaxedPrecision 
					                                                  OpDecorate %52 RelaxedPrecision 
					                                                  OpDecorate %52 DescriptorSet 52 
					                                                  OpDecorate %52 Binding 52 
					                                                  OpDecorate %53 RelaxedPrecision 
					                                                  OpDecorate %59 RelaxedPrecision 
					                                                  OpDecorate %60 RelaxedPrecision 
					                                                  OpDecorate %61 RelaxedPrecision 
					                                                  OpDecorate %62 RelaxedPrecision 
					                                                  OpDecorate %67 RelaxedPrecision 
					                                                  OpDecorate %68 RelaxedPrecision 
					                                                  OpDecorate %69 RelaxedPrecision 
					                                                  OpDecorate %72 RelaxedPrecision 
					                                                  OpDecorate %73 RelaxedPrecision 
					                                                  OpDecorate %74 RelaxedPrecision 
					                                                  OpDecorate %75 RelaxedPrecision 
					                                                  OpDecorate %76 RelaxedPrecision 
					                                                  OpDecorate %77 RelaxedPrecision 
					                                                  OpDecorate %82 RelaxedPrecision 
					                                                  OpDecorate %89 RelaxedPrecision 
					                                                  OpDecorate %90 RelaxedPrecision 
					                                                  OpDecorate %91 RelaxedPrecision 
					                                                  OpDecorate %92 RelaxedPrecision 
					                                                  OpDecorate %93 RelaxedPrecision 
					                                                  OpDecorate %94 RelaxedPrecision 
					                                                  OpDecorate %95 RelaxedPrecision 
					                                                  OpDecorate %96 RelaxedPrecision 
					                                                  OpDecorate %97 RelaxedPrecision 
					                                                  OpDecorate %102 RelaxedPrecision 
					                                                  OpDecorate %103 RelaxedPrecision 
					                                                  OpDecorate %104 RelaxedPrecision 
					                                                  OpDecorate %105 RelaxedPrecision 
					                                                  OpDecorate %110 RelaxedPrecision 
					                                                  OpDecorate %111 RelaxedPrecision 
					                                                  OpDecorate %112 RelaxedPrecision 
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
					                                                  OpDecorate %123 RelaxedPrecision 
					                                                  OpDecorate %124 RelaxedPrecision 
					                                                  OpDecorate %125 RelaxedPrecision 
					                                                  OpDecorate %126 RelaxedPrecision 
					                                                  OpDecorate %127 RelaxedPrecision 
					                                                  OpDecorate %128 RelaxedPrecision 
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
					                                                  OpDecorate %145 RelaxedPrecision 
					                                                  OpDecorate %146 RelaxedPrecision 
					                                                  OpDecorate %147 RelaxedPrecision 
					                                                  OpDecorate %148 RelaxedPrecision 
					                                                  OpDecorate %149 RelaxedPrecision 
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
					                                                  OpDecorate %165 RelaxedPrecision 
					                                                  OpDecorate %166 RelaxedPrecision 
					                                                  OpDecorate %168 RelaxedPrecision 
					                                                  OpDecorate %172 RelaxedPrecision 
					                                                  OpDecorate %175 RelaxedPrecision 
					                                                  OpDecorate %176 RelaxedPrecision 
					                                                  OpDecorate %179 RelaxedPrecision 
					                                                  OpDecorate %180 RelaxedPrecision 
					                                                  OpDecorate %181 RelaxedPrecision 
					                                                  OpDecorate %182 RelaxedPrecision 
					                                                  OpDecorate %183 RelaxedPrecision 
					                                                  OpDecorate %187 RelaxedPrecision 
					                                                  OpDecorate %188 RelaxedPrecision 
					                                                  OpDecorate %189 RelaxedPrecision 
					                                                  OpDecorate %190 RelaxedPrecision 
					                                                  OpDecorate %193 RelaxedPrecision 
					                                                  OpDecorate %195 RelaxedPrecision 
					                                                  OpDecorate %197 RelaxedPrecision 
					                                                  OpDecorate %198 RelaxedPrecision 
					                                                  OpDecorate %201 RelaxedPrecision 
					                                                  OpDecorate %203 RelaxedPrecision 
					                                                  OpDecorate %204 RelaxedPrecision 
					                                                  OpDecorate %207 RelaxedPrecision 
					                                                  OpDecorate %209 RelaxedPrecision 
					                                                  OpDecorate %210 RelaxedPrecision 
					                                                  OpDecorate %213 RelaxedPrecision 
					                                                  OpDecorate %215 RelaxedPrecision 
					                                                  OpDecorate %216 RelaxedPrecision 
					                                                  OpDecorate %219 RelaxedPrecision 
					                                                  OpDecorate %221 RelaxedPrecision 
					                                                  OpDecorate %222 RelaxedPrecision 
					                                                  OpDecorate %225 RelaxedPrecision 
					                                                  OpDecorate %226 RelaxedPrecision 
					                                                  OpDecorate %227 RelaxedPrecision 
					                                                  OpDecorate %229 RelaxedPrecision 
					                                                  OpDecorate %229 Location 229 
					                                                  OpDecorate %230 RelaxedPrecision 
					                                                  OpDecorate %231 RelaxedPrecision 
					                                                  OpDecorate %232 RelaxedPrecision 
					                                                  OpDecorate %233 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 4 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_4* %9 = OpVariable Private 
					                                          %10 = OpTypeVector %6 2 
					                                          %11 = OpTypeVector %6 3 
					                                          %12 = OpTypeStruct %10 %6 %6 %11 
					                                          %13 = OpTypePointer Uniform %12 
					Uniform struct {f32_2; f32; f32; f32_3;}* %14 = OpVariable Uniform 
					                                          %15 = OpTypeInt 32 1 
					                                      i32 %16 = OpConstant 0 
					                                          %17 = OpTypePointer Uniform %10 
					                                      i32 %21 = OpConstant 1 
					                                          %22 = OpTypePointer Uniform %6 
					                                          %27 = OpTypePointer Input %10 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                           Private f32_4* %32 = OpVariable Private 
					                                      f32 %37 = OpConstant 3,674022E-40 
					                                      f32 %38 = OpConstant 3,674022E-40 
					                                    f32_4 %39 = OpConstantComposite %37 %38 %38 %37 
					                                          %44 = OpTypePointer Private %11 
					                           Private f32_3* %45 = OpVariable Private 
					                                          %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %47 = OpTypePointer UniformConstant %46 
					     UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
					                                          %50 = OpTypeSampler 
					                                          %51 = OpTypePointer UniformConstant %50 
					                 UniformConstant sampler* %52 = OpVariable UniformConstant 
					                                          %54 = OpTypeSampledImage %46 
					                           Private f32_3* %60 = OpVariable Private 
					                           Private f32_3* %68 = OpVariable Private 
					                                      f32 %70 = OpConstant 3,674022E-40 
					                                    f32_3 %71 = OpConstantComposite %70 %70 %70 
					                           Private f32_3* %73 = OpVariable Private 
					                           Private f32_3* %89 = OpVariable Private 
					                           Private f32_3* %92 = OpVariable Private 
					                          Private f32_3* %103 = OpVariable Private 
					                          Private f32_3* %111 = OpVariable Private 
					                          Private f32_3* %114 = OpVariable Private 
					                          Private f32_3* %120 = OpVariable Private 
					                                         %167 = OpTypePointer Private %6 
					                            Private f32* %168 = OpVariable Private 
					                                         %169 = OpTypeInt 32 0 
					                                     u32 %170 = OpConstant 1 
					                                     u32 %173 = OpConstant 0 
					                                     u32 %177 = OpConstant 2 
					                                     i32 %184 = OpConstant 3 
					                                         %185 = OpTypePointer Uniform %11 
					                                     f32 %194 = OpConstant 3,674022E-40 
					                                         %228 = OpTypePointer Output %7 
					                           Output f32_4* %229 = OpVariable Output 
					                                     u32 %236 = OpConstant 3 
					                                         %237 = OpTypePointer Output %6 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                           Uniform f32_2* %18 = OpAccessChain %14 %16 
					                                    f32_2 %19 = OpLoad %18 
					                                    f32_4 %20 = OpVectorShuffle %19 %19 0 1 0 1 
					                             Uniform f32* %23 = OpAccessChain %14 %21 
					                                      f32 %24 = OpLoad %23 
					                                    f32_4 %25 = OpCompositeConstruct %24 %24 %24 %24 
					                                    f32_4 %26 = OpFMul %20 %25 
					                                    f32_2 %29 = OpLoad vs_TEXCOORD0 
					                                    f32_4 %30 = OpVectorShuffle %29 %29 0 1 0 1 
					                                    f32_4 %31 = OpFAdd %26 %30 
					                                                  OpStore %9 %31 
					                           Uniform f32_2* %33 = OpAccessChain %14 %16 
					                                    f32_2 %34 = OpLoad %33 
					                                    f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 1 
					                                    f32_4 %36 = OpFNegate %35 
					                                    f32_4 %40 = OpFMul %36 %39 
					                                    f32_4 %41 = OpLoad %9 
					                                    f32_4 %42 = OpVectorShuffle %41 %41 2 3 2 3 
					                                    f32_4 %43 = OpFAdd %40 %42 
					                                                  OpStore %32 %43 
					                      read_only Texture2D %49 = OpLoad %48 
					                                  sampler %53 = OpLoad %52 
					               read_only Texture2DSampled %55 = OpSampledImage %49 %53 
					                                    f32_4 %56 = OpLoad %32 
					                                    f32_2 %57 = OpVectorShuffle %56 %56 0 1 
					                                    f32_4 %58 = OpImageSampleImplicitLod %55 %57 
					                                    f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
					                                                  OpStore %45 %59 
					                      read_only Texture2D %61 = OpLoad %48 
					                                  sampler %62 = OpLoad %52 
					               read_only Texture2DSampled %63 = OpSampledImage %61 %62 
					                                    f32_4 %64 = OpLoad %32 
					                                    f32_2 %65 = OpVectorShuffle %64 %64 2 3 
					                                    f32_4 %66 = OpImageSampleImplicitLod %63 %65 
					                                    f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
					                                                  OpStore %60 %67 
					                                    f32_3 %69 = OpLoad %60 
					                                    f32_3 %72 = OpExtInst %1 37 %69 %71 
					                                                  OpStore %68 %72 
					                                    f32_3 %74 = OpLoad %45 
					                                    f32_3 %75 = OpExtInst %1 37 %74 %71 
					                                                  OpStore %73 %75 
					                      read_only Texture2D %76 = OpLoad %48 
					                                  sampler %77 = OpLoad %52 
					               read_only Texture2DSampled %78 = OpSampledImage %76 %77 
					                                    f32_4 %79 = OpLoad %9 
					                                    f32_2 %80 = OpVectorShuffle %79 %79 2 3 
					                                    f32_4 %81 = OpImageSampleImplicitLod %78 %80 
					                                    f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
					                                                  OpStore %60 %82 
					                           Uniform f32_2* %83 = OpAccessChain %14 %16 
					                                    f32_2 %84 = OpLoad %83 
					                                    f32_4 %85 = OpVectorShuffle %84 %84 0 0 0 1 
					                                    f32_4 %86 = OpFMul %85 %39 
					                                    f32_4 %87 = OpLoad %9 
					                                    f32_4 %88 = OpFAdd %86 %87 
					                                                  OpStore %9 %88 
					                                    f32_3 %90 = OpLoad %60 
					                                    f32_3 %91 = OpExtInst %1 37 %90 %71 
					                                                  OpStore %89 %91 
					                                    f32_3 %93 = OpLoad %73 
					                                    f32_3 %94 = OpLoad %89 
					                                    f32_3 %95 = OpFAdd %93 %94 
					                                                  OpStore %92 %95 
					                      read_only Texture2D %96 = OpLoad %48 
					                                  sampler %97 = OpLoad %52 
					               read_only Texture2DSampled %98 = OpSampledImage %96 %97 
					                                    f32_4 %99 = OpLoad %9 
					                                   f32_2 %100 = OpVectorShuffle %99 %99 0 1 
					                                   f32_4 %101 = OpImageSampleImplicitLod %98 %100 
					                                   f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
					                                                  OpStore %60 %102 
					                     read_only Texture2D %104 = OpLoad %48 
					                                 sampler %105 = OpLoad %52 
					              read_only Texture2DSampled %106 = OpSampledImage %104 %105 
					                                   f32_4 %107 = OpLoad %9 
					                                   f32_2 %108 = OpVectorShuffle %107 %107 2 3 
					                                   f32_4 %109 = OpImageSampleImplicitLod %106 %108 
					                                   f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
					                                                  OpStore %103 %110 
					                                   f32_3 %112 = OpLoad %103 
					                                   f32_3 %113 = OpExtInst %1 37 %112 %71 
					                                                  OpStore %111 %113 
					                                   f32_3 %115 = OpLoad %60 
					                                   f32_3 %116 = OpExtInst %1 37 %115 %71 
					                                                  OpStore %114 %116 
					                                   f32_3 %117 = OpLoad %92 
					                                   f32_3 %118 = OpLoad %114 
					                                   f32_3 %119 = OpFAdd %117 %118 
					                                                  OpStore %92 %119 
					                                   f32_3 %121 = OpLoad %73 
					                                   f32_3 %122 = OpLoad %89 
					                                   f32_3 %123 = OpExtInst %1 37 %121 %122 
					                                                  OpStore %120 %123 
					                                   f32_3 %124 = OpLoad %73 
					                                   f32_3 %125 = OpLoad %89 
					                                   f32_3 %126 = OpExtInst %1 40 %124 %125 
					                                                  OpStore %73 %126 
					                                   f32_3 %127 = OpLoad %114 
					                                   f32_3 %128 = OpLoad %73 
					                                   f32_3 %129 = OpExtInst %1 40 %127 %128 
					                                                  OpStore %73 %129 
					                                   f32_3 %130 = OpLoad %114 
					                                   f32_3 %131 = OpLoad %120 
					                                   f32_3 %132 = OpExtInst %1 37 %130 %131 
					                                                  OpStore %89 %132 
					                                   f32_3 %133 = OpLoad %89 
					                                   f32_3 %134 = OpFNegate %133 
					                                   f32_3 %135 = OpLoad %92 
					                                   f32_3 %136 = OpFAdd %134 %135 
					                                                  OpStore %89 %136 
					                                   f32_3 %137 = OpLoad %73 
					                                   f32_3 %138 = OpFNegate %137 
					                                   f32_3 %139 = OpLoad %89 
					                                   f32_3 %140 = OpFAdd %138 %139 
					                                                  OpStore %73 %140 
					                                   f32_3 %141 = OpLoad %68 
					                                   f32_3 %142 = OpLoad %73 
					                                   f32_3 %143 = OpFAdd %141 %142 
					                                                  OpStore %89 %143 
					                                   f32_3 %144 = OpLoad %111 
					                                   f32_3 %145 = OpLoad %89 
					                                   f32_3 %146 = OpFAdd %144 %145 
					                                                  OpStore %89 %146 
					                                   f32_3 %147 = OpLoad %68 
					                                   f32_3 %148 = OpLoad %73 
					                                   f32_3 %149 = OpExtInst %1 37 %147 %148 
					                                                  OpStore %92 %149 
					                                   f32_3 %150 = OpLoad %68 
					                                   f32_3 %151 = OpLoad %73 
					                                   f32_3 %152 = OpExtInst %1 40 %150 %151 
					                                                  OpStore %68 %152 
					                                   f32_3 %153 = OpLoad %111 
					                                   f32_3 %154 = OpLoad %68 
					                                   f32_3 %155 = OpExtInst %1 40 %153 %154 
					                                                  OpStore %68 %155 
					                                   f32_3 %156 = OpLoad %111 
					                                   f32_3 %157 = OpLoad %92 
					                                   f32_3 %158 = OpExtInst %1 37 %156 %157 
					                                                  OpStore %73 %158 
					                                   f32_3 %159 = OpLoad %73 
					                                   f32_3 %160 = OpFNegate %159 
					                                   f32_3 %161 = OpLoad %89 
					                                   f32_3 %162 = OpFAdd %160 %161 
					                                                  OpStore %73 %162 
					                                   f32_3 %163 = OpLoad %68 
					                                   f32_3 %164 = OpFNegate %163 
					                                   f32_3 %165 = OpLoad %73 
					                                   f32_3 %166 = OpFAdd %164 %165 
					                                                  OpStore %68 %166 
					                            Private f32* %171 = OpAccessChain %68 %170 
					                                     f32 %172 = OpLoad %171 
					                            Private f32* %174 = OpAccessChain %68 %173 
					                                     f32 %175 = OpLoad %174 
					                                     f32 %176 = OpExtInst %1 40 %172 %175 
					                                                  OpStore %168 %176 
					                            Private f32* %178 = OpAccessChain %68 %177 
					                                     f32 %179 = OpLoad %178 
					                                     f32 %180 = OpLoad %168 
					                                     f32 %181 = OpExtInst %1 40 %179 %180 
					                                                  OpStore %168 %181 
					                                     f32 %182 = OpLoad %168 
					                                   f32_2 %183 = OpCompositeConstruct %182 %182 
					                          Uniform f32_3* %186 = OpAccessChain %14 %184 
					                                   f32_3 %187 = OpLoad %186 
					                                   f32_2 %188 = OpVectorShuffle %187 %187 0 0 
					                                   f32_2 %189 = OpFNegate %188 
					                                   f32_2 %190 = OpFAdd %183 %189 
					                                   f32_3 %191 = OpLoad %73 
					                                   f32_3 %192 = OpVectorShuffle %191 %190 3 4 2 
					                                                  OpStore %73 %192 
					                                     f32 %193 = OpLoad %168 
					                                     f32 %195 = OpExtInst %1 40 %193 %194 
					                                                  OpStore %168 %195 
					                            Private f32* %196 = OpAccessChain %73 %173 
					                                     f32 %197 = OpLoad %196 
					                                     f32 %198 = OpExtInst %1 40 %197 %38 
					                            Private f32* %199 = OpAccessChain %73 %173 
					                                                  OpStore %199 %198 
					                            Private f32* %200 = OpAccessChain %73 %173 
					                                     f32 %201 = OpLoad %200 
					                            Uniform f32* %202 = OpAccessChain %14 %184 %170 
					                                     f32 %203 = OpLoad %202 
					                                     f32 %204 = OpExtInst %1 37 %201 %203 
					                            Private f32* %205 = OpAccessChain %73 %173 
					                                                  OpStore %205 %204 
					                            Private f32* %206 = OpAccessChain %73 %173 
					                                     f32 %207 = OpLoad %206 
					                            Private f32* %208 = OpAccessChain %73 %173 
					                                     f32 %209 = OpLoad %208 
					                                     f32 %210 = OpFMul %207 %209 
					                            Private f32* %211 = OpAccessChain %73 %173 
					                                                  OpStore %211 %210 
					                            Private f32* %212 = OpAccessChain %73 %173 
					                                     f32 %213 = OpLoad %212 
					                            Uniform f32* %214 = OpAccessChain %14 %184 %177 
					                                     f32 %215 = OpLoad %214 
					                                     f32 %216 = OpFMul %213 %215 
					                            Private f32* %217 = OpAccessChain %73 %173 
					                                                  OpStore %217 %216 
					                            Private f32* %218 = OpAccessChain %73 %170 
					                                     f32 %219 = OpLoad %218 
					                            Private f32* %220 = OpAccessChain %73 %173 
					                                     f32 %221 = OpLoad %220 
					                                     f32 %222 = OpExtInst %1 40 %219 %221 
					                            Private f32* %223 = OpAccessChain %73 %173 
					                                                  OpStore %223 %222 
					                            Private f32* %224 = OpAccessChain %73 %173 
					                                     f32 %225 = OpLoad %224 
					                                     f32 %226 = OpLoad %168 
					                                     f32 %227 = OpFDiv %225 %226 
					                                                  OpStore %168 %227 
					                                     f32 %230 = OpLoad %168 
					                                   f32_3 %231 = OpCompositeConstruct %230 %230 %230 
					                                   f32_3 %232 = OpLoad %68 
					                                   f32_3 %233 = OpFMul %231 %232 
					                                   f32_4 %234 = OpLoad %229 
					                                   f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
					                                                  OpStore %229 %235 
					                             Output f32* %238 = OpAccessChain %229 %236 
					                                                  OpStore %238 %38 
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
						vec4 unused_0_2[4];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					uniform 	float _PrefilterOffs;
					uniform 	float _Threshold;
					uniform 	vec3 _Curve;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat16_6;
					float u_xlat8;
					float u_xlat21;
					float u_xlat16_21;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_2.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat10_3 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
					    u_xlat16_3.xyz = min(u_xlat10_3.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_4.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat10_5 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_5.xyz = min(u_xlat10_5.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
					    u_xlat16_6.xyz = min(u_xlat16_2.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_5.xyz, u_xlat16_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_2.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
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
					    u_xlat16_21 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_21 = max(u_xlat16_0.z, u_xlat16_21);
					    u_xlat1.x = u_xlat16_21 + (-_Curve.x);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _Curve.y);
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * _Curve.z;
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
					Keywords { "UNITY_COLORSPACE_GAMMA" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 106
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %97 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 97 
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
					                                             %83 = OpTypePointer Input %82 
					                                Input f32_2* %84 = OpVariable Input 
					                                             %96 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                            %100 = OpTypePointer Output %6 
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
					                                       f32_2 %85 = OpLoad %84 
					                              Uniform f32_4* %86 = OpAccessChain %20 %35 
					                                       f32_4 %87 = OpLoad %86 
					                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                       f32_2 %89 = OpFMul %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                       f32_2 %93 = OpFAdd %89 %92 
					                                       f32_4 %94 = OpLoad %9 
					                                       f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
					                                                     OpStore %9 %95 
					                                       f32_4 %98 = OpLoad %9 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore vs_TEXCOORD0 %99 
					                                Output f32* %101 = OpAccessChain %72 %22 %68 
					                                        f32 %102 = OpLoad %101 
					                                        f32 %103 = OpFNegate %102 
					                                Output f32* %104 = OpAccessChain %72 %22 %68 
					                                                     OpStore %104 %103 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 253
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %28 %242 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpMemberDecorate %12 0 Offset 12 
					                                                  OpMemberDecorate %12 1 Offset 12 
					                                                  OpMemberDecorate %12 2 RelaxedPrecision 
					                                                  OpMemberDecorate %12 2 Offset 12 
					                                                  OpMemberDecorate %12 3 RelaxedPrecision 
					                                                  OpMemberDecorate %12 3 Offset 12 
					                                                  OpDecorate %12 Block 
					                                                  OpDecorate %14 DescriptorSet 14 
					                                                  OpDecorate %14 Binding 14 
					                                                  OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                  OpDecorate vs_TEXCOORD0 Location 28 
					                                                  OpDecorate %29 RelaxedPrecision 
					                                                  OpDecorate %30 RelaxedPrecision 
					                                                  OpDecorate %45 RelaxedPrecision 
					                                                  OpDecorate %48 RelaxedPrecision 
					                                                  OpDecorate %48 DescriptorSet 48 
					                                                  OpDecorate %48 Binding 48 
					                                                  OpDecorate %49 RelaxedPrecision 
					                                                  OpDecorate %52 RelaxedPrecision 
					                                                  OpDecorate %52 DescriptorSet 52 
					                                                  OpDecorate %52 Binding 52 
					                                                  OpDecorate %53 RelaxedPrecision 
					                                                  OpDecorate %59 RelaxedPrecision 
					                                                  OpDecorate %60 RelaxedPrecision 
					                                                  OpDecorate %61 RelaxedPrecision 
					                                                  OpDecorate %62 RelaxedPrecision 
					                                                  OpDecorate %67 RelaxedPrecision 
					                                                  OpDecorate %68 RelaxedPrecision 
					                                                  OpDecorate %69 RelaxedPrecision 
					                                                  OpDecorate %72 RelaxedPrecision 
					                                                  OpDecorate %73 RelaxedPrecision 
					                                                  OpDecorate %74 RelaxedPrecision 
					                                                  OpDecorate %75 RelaxedPrecision 
					                                                  OpDecorate %76 RelaxedPrecision 
					                                                  OpDecorate %77 RelaxedPrecision 
					                                                  OpDecorate %82 RelaxedPrecision 
					                                                  OpDecorate %89 RelaxedPrecision 
					                                                  OpDecorate %90 RelaxedPrecision 
					                                                  OpDecorate %91 RelaxedPrecision 
					                                                  OpDecorate %92 RelaxedPrecision 
					                                                  OpDecorate %93 RelaxedPrecision 
					                                                  OpDecorate %94 RelaxedPrecision 
					                                                  OpDecorate %95 RelaxedPrecision 
					                                                  OpDecorate %96 RelaxedPrecision 
					                                                  OpDecorate %97 RelaxedPrecision 
					                                                  OpDecorate %102 RelaxedPrecision 
					                                                  OpDecorate %103 RelaxedPrecision 
					                                                  OpDecorate %104 RelaxedPrecision 
					                                                  OpDecorate %105 RelaxedPrecision 
					                                                  OpDecorate %110 RelaxedPrecision 
					                                                  OpDecorate %111 RelaxedPrecision 
					                                                  OpDecorate %112 RelaxedPrecision 
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
					                                                  OpDecorate %123 RelaxedPrecision 
					                                                  OpDecorate %124 RelaxedPrecision 
					                                                  OpDecorate %125 RelaxedPrecision 
					                                                  OpDecorate %126 RelaxedPrecision 
					                                                  OpDecorate %127 RelaxedPrecision 
					                                                  OpDecorate %128 RelaxedPrecision 
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
					                                                  OpDecorate %145 RelaxedPrecision 
					                                                  OpDecorate %146 RelaxedPrecision 
					                                                  OpDecorate %147 RelaxedPrecision 
					                                                  OpDecorate %148 RelaxedPrecision 
					                                                  OpDecorate %149 RelaxedPrecision 
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
					                                                  OpDecorate %165 RelaxedPrecision 
					                                                  OpDecorate %166 RelaxedPrecision 
					                                                  OpDecorate %167 RelaxedPrecision 
					                                                  OpDecorate %168 RelaxedPrecision 
					                                                  OpDecorate %171 RelaxedPrecision 
					                                                  OpDecorate %174 RelaxedPrecision 
					                                                  OpDecorate %175 RelaxedPrecision 
					                                                  OpDecorate %176 RelaxedPrecision 
					                                                  OpDecorate %177 RelaxedPrecision 
					                                                  OpDecorate %180 RelaxedPrecision 
					                                                  OpDecorate %181 RelaxedPrecision 
					                                                  OpDecorate %182 RelaxedPrecision 
					                                                  OpDecorate %183 RelaxedPrecision 
					                                                  OpDecorate %188 RelaxedPrecision 
					                                                  OpDecorate %191 RelaxedPrecision 
					                                                  OpDecorate %192 RelaxedPrecision 
					                                                  OpDecorate %196 RelaxedPrecision 
					                                                  OpDecorate %198 RelaxedPrecision 
					                                                  OpDecorate %199 RelaxedPrecision 
					                                                  OpDecorate %201 RelaxedPrecision 
					                                                  OpDecorate %202 RelaxedPrecision 
					                                                  OpDecorate %206 RelaxedPrecision 
					                                                  OpDecorate %207 RelaxedPrecision 
					                                                  OpDecorate %208 RelaxedPrecision 
					                                                  OpDecorate %209 RelaxedPrecision 
					                                                  OpDecorate %212 RelaxedPrecision 
					                                                  OpDecorate %213 RelaxedPrecision 
					                                                  OpDecorate %216 RelaxedPrecision 
					                                                  OpDecorate %219 RelaxedPrecision 
					                                                  OpDecorate %221 RelaxedPrecision 
					                                                  OpDecorate %223 RelaxedPrecision 
					                                                  OpDecorate %224 RelaxedPrecision 
					                                                  OpDecorate %225 RelaxedPrecision 
					                                                  OpDecorate %226 RelaxedPrecision 
					                                                  OpDecorate %227 RelaxedPrecision 
					                                                  OpDecorate %228 RelaxedPrecision 
					                                                  OpDecorate %230 RelaxedPrecision 
					                                                  OpDecorate %231 RelaxedPrecision 
					                                                  OpDecorate %233 RelaxedPrecision 
					                                                  OpDecorate %234 RelaxedPrecision 
					                                                  OpDecorate %235 RelaxedPrecision 
					                                                  OpDecorate %236 RelaxedPrecision 
					                                                  OpDecorate %238 RelaxedPrecision 
					                                                  OpDecorate %239 RelaxedPrecision 
					                                                  OpDecorate %242 RelaxedPrecision 
					                                                  OpDecorate %242 Location 242 
					                                                  OpDecorate %243 RelaxedPrecision 
					                                                  OpDecorate %244 RelaxedPrecision 
					                                                  OpDecorate %245 RelaxedPrecision 
					                                                  OpDecorate %246 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 4 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_4* %9 = OpVariable Private 
					                                          %10 = OpTypeVector %6 2 
					                                          %11 = OpTypeVector %6 3 
					                                          %12 = OpTypeStruct %10 %6 %6 %11 
					                                          %13 = OpTypePointer Uniform %12 
					Uniform struct {f32_2; f32; f32; f32_3;}* %14 = OpVariable Uniform 
					                                          %15 = OpTypeInt 32 1 
					                                      i32 %16 = OpConstant 0 
					                                          %17 = OpTypePointer Uniform %10 
					                                      i32 %21 = OpConstant 1 
					                                          %22 = OpTypePointer Uniform %6 
					                                          %27 = OpTypePointer Input %10 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                           Private f32_4* %32 = OpVariable Private 
					                                      f32 %37 = OpConstant 3,674022E-40 
					                                      f32 %38 = OpConstant 3,674022E-40 
					                                    f32_4 %39 = OpConstantComposite %37 %38 %38 %37 
					                                          %44 = OpTypePointer Private %11 
					                           Private f32_3* %45 = OpVariable Private 
					                                          %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %47 = OpTypePointer UniformConstant %46 
					     UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
					                                          %50 = OpTypeSampler 
					                                          %51 = OpTypePointer UniformConstant %50 
					                 UniformConstant sampler* %52 = OpVariable UniformConstant 
					                                          %54 = OpTypeSampledImage %46 
					                           Private f32_3* %60 = OpVariable Private 
					                           Private f32_3* %68 = OpVariable Private 
					                                      f32 %70 = OpConstant 3,674022E-40 
					                                    f32_3 %71 = OpConstantComposite %70 %70 %70 
					                           Private f32_3* %73 = OpVariable Private 
					                           Private f32_3* %89 = OpVariable Private 
					                           Private f32_3* %92 = OpVariable Private 
					                          Private f32_3* %103 = OpVariable Private 
					                          Private f32_3* %111 = OpVariable Private 
					                          Private f32_3* %114 = OpVariable Private 
					                          Private f32_3* %120 = OpVariable Private 
					                          Private f32_3* %167 = OpVariable Private 
					                                     f32 %169 = OpConstant 3,674022E-40 
					                                   f32_3 %170 = OpConstantComposite %169 %169 %169 
					                                     f32 %172 = OpConstant 3,674022E-40 
					                                   f32_3 %173 = OpConstantComposite %172 %172 %172 
					                                     f32 %178 = OpConstant 3,674022E-40 
					                                   f32_3 %179 = OpConstantComposite %178 %178 %178 
					                                         %184 = OpTypeInt 32 0 
					                                     u32 %185 = OpConstant 1 
					                                         %186 = OpTypePointer Private %6 
					                                     u32 %189 = OpConstant 0 
					                                     u32 %194 = OpConstant 2 
					                                     i32 %203 = OpConstant 3 
					                                         %204 = OpTypePointer Uniform %11 
					                                     f32 %214 = OpConstant 3,674022E-40 
					                                   f32_2 %215 = OpConstantComposite %214 %38 
					                            Private f32* %219 = OpVariable Private 
					                                         %241 = OpTypePointer Output %7 
					                           Output f32_4* %242 = OpVariable Output 
					                                     u32 %249 = OpConstant 3 
					                                         %250 = OpTypePointer Output %6 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                           Uniform f32_2* %18 = OpAccessChain %14 %16 
					                                    f32_2 %19 = OpLoad %18 
					                                    f32_4 %20 = OpVectorShuffle %19 %19 0 1 0 1 
					                             Uniform f32* %23 = OpAccessChain %14 %21 
					                                      f32 %24 = OpLoad %23 
					                                    f32_4 %25 = OpCompositeConstruct %24 %24 %24 %24 
					                                    f32_4 %26 = OpFMul %20 %25 
					                                    f32_2 %29 = OpLoad vs_TEXCOORD0 
					                                    f32_4 %30 = OpVectorShuffle %29 %29 0 1 0 1 
					                                    f32_4 %31 = OpFAdd %26 %30 
					                                                  OpStore %9 %31 
					                           Uniform f32_2* %33 = OpAccessChain %14 %16 
					                                    f32_2 %34 = OpLoad %33 
					                                    f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 1 
					                                    f32_4 %36 = OpFNegate %35 
					                                    f32_4 %40 = OpFMul %36 %39 
					                                    f32_4 %41 = OpLoad %9 
					                                    f32_4 %42 = OpVectorShuffle %41 %41 2 3 2 3 
					                                    f32_4 %43 = OpFAdd %40 %42 
					                                                  OpStore %32 %43 
					                      read_only Texture2D %49 = OpLoad %48 
					                                  sampler %53 = OpLoad %52 
					               read_only Texture2DSampled %55 = OpSampledImage %49 %53 
					                                    f32_4 %56 = OpLoad %32 
					                                    f32_2 %57 = OpVectorShuffle %56 %56 0 1 
					                                    f32_4 %58 = OpImageSampleImplicitLod %55 %57 
					                                    f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
					                                                  OpStore %45 %59 
					                      read_only Texture2D %61 = OpLoad %48 
					                                  sampler %62 = OpLoad %52 
					               read_only Texture2DSampled %63 = OpSampledImage %61 %62 
					                                    f32_4 %64 = OpLoad %32 
					                                    f32_2 %65 = OpVectorShuffle %64 %64 2 3 
					                                    f32_4 %66 = OpImageSampleImplicitLod %63 %65 
					                                    f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
					                                                  OpStore %60 %67 
					                                    f32_3 %69 = OpLoad %60 
					                                    f32_3 %72 = OpExtInst %1 37 %69 %71 
					                                                  OpStore %68 %72 
					                                    f32_3 %74 = OpLoad %45 
					                                    f32_3 %75 = OpExtInst %1 37 %74 %71 
					                                                  OpStore %73 %75 
					                      read_only Texture2D %76 = OpLoad %48 
					                                  sampler %77 = OpLoad %52 
					               read_only Texture2DSampled %78 = OpSampledImage %76 %77 
					                                    f32_4 %79 = OpLoad %9 
					                                    f32_2 %80 = OpVectorShuffle %79 %79 2 3 
					                                    f32_4 %81 = OpImageSampleImplicitLod %78 %80 
					                                    f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
					                                                  OpStore %60 %82 
					                           Uniform f32_2* %83 = OpAccessChain %14 %16 
					                                    f32_2 %84 = OpLoad %83 
					                                    f32_4 %85 = OpVectorShuffle %84 %84 0 0 0 1 
					                                    f32_4 %86 = OpFMul %85 %39 
					                                    f32_4 %87 = OpLoad %9 
					                                    f32_4 %88 = OpFAdd %86 %87 
					                                                  OpStore %9 %88 
					                                    f32_3 %90 = OpLoad %60 
					                                    f32_3 %91 = OpExtInst %1 37 %90 %71 
					                                                  OpStore %89 %91 
					                                    f32_3 %93 = OpLoad %73 
					                                    f32_3 %94 = OpLoad %89 
					                                    f32_3 %95 = OpFAdd %93 %94 
					                                                  OpStore %92 %95 
					                      read_only Texture2D %96 = OpLoad %48 
					                                  sampler %97 = OpLoad %52 
					               read_only Texture2DSampled %98 = OpSampledImage %96 %97 
					                                    f32_4 %99 = OpLoad %9 
					                                   f32_2 %100 = OpVectorShuffle %99 %99 0 1 
					                                   f32_4 %101 = OpImageSampleImplicitLod %98 %100 
					                                   f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
					                                                  OpStore %60 %102 
					                     read_only Texture2D %104 = OpLoad %48 
					                                 sampler %105 = OpLoad %52 
					              read_only Texture2DSampled %106 = OpSampledImage %104 %105 
					                                   f32_4 %107 = OpLoad %9 
					                                   f32_2 %108 = OpVectorShuffle %107 %107 2 3 
					                                   f32_4 %109 = OpImageSampleImplicitLod %106 %108 
					                                   f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
					                                                  OpStore %103 %110 
					                                   f32_3 %112 = OpLoad %103 
					                                   f32_3 %113 = OpExtInst %1 37 %112 %71 
					                                                  OpStore %111 %113 
					                                   f32_3 %115 = OpLoad %60 
					                                   f32_3 %116 = OpExtInst %1 37 %115 %71 
					                                                  OpStore %114 %116 
					                                   f32_3 %117 = OpLoad %92 
					                                   f32_3 %118 = OpLoad %114 
					                                   f32_3 %119 = OpFAdd %117 %118 
					                                                  OpStore %92 %119 
					                                   f32_3 %121 = OpLoad %73 
					                                   f32_3 %122 = OpLoad %89 
					                                   f32_3 %123 = OpExtInst %1 37 %121 %122 
					                                                  OpStore %120 %123 
					                                   f32_3 %124 = OpLoad %73 
					                                   f32_3 %125 = OpLoad %89 
					                                   f32_3 %126 = OpExtInst %1 40 %124 %125 
					                                                  OpStore %73 %126 
					                                   f32_3 %127 = OpLoad %114 
					                                   f32_3 %128 = OpLoad %73 
					                                   f32_3 %129 = OpExtInst %1 40 %127 %128 
					                                                  OpStore %73 %129 
					                                   f32_3 %130 = OpLoad %114 
					                                   f32_3 %131 = OpLoad %120 
					                                   f32_3 %132 = OpExtInst %1 37 %130 %131 
					                                                  OpStore %89 %132 
					                                   f32_3 %133 = OpLoad %89 
					                                   f32_3 %134 = OpFNegate %133 
					                                   f32_3 %135 = OpLoad %92 
					                                   f32_3 %136 = OpFAdd %134 %135 
					                                                  OpStore %89 %136 
					                                   f32_3 %137 = OpLoad %73 
					                                   f32_3 %138 = OpFNegate %137 
					                                   f32_3 %139 = OpLoad %89 
					                                   f32_3 %140 = OpFAdd %138 %139 
					                                                  OpStore %73 %140 
					                                   f32_3 %141 = OpLoad %68 
					                                   f32_3 %142 = OpLoad %73 
					                                   f32_3 %143 = OpFAdd %141 %142 
					                                                  OpStore %89 %143 
					                                   f32_3 %144 = OpLoad %111 
					                                   f32_3 %145 = OpLoad %89 
					                                   f32_3 %146 = OpFAdd %144 %145 
					                                                  OpStore %89 %146 
					                                   f32_3 %147 = OpLoad %68 
					                                   f32_3 %148 = OpLoad %73 
					                                   f32_3 %149 = OpExtInst %1 37 %147 %148 
					                                                  OpStore %92 %149 
					                                   f32_3 %150 = OpLoad %68 
					                                   f32_3 %151 = OpLoad %73 
					                                   f32_3 %152 = OpExtInst %1 40 %150 %151 
					                                                  OpStore %68 %152 
					                                   f32_3 %153 = OpLoad %111 
					                                   f32_3 %154 = OpLoad %68 
					                                   f32_3 %155 = OpExtInst %1 40 %153 %154 
					                                                  OpStore %68 %155 
					                                   f32_3 %156 = OpLoad %111 
					                                   f32_3 %157 = OpLoad %92 
					                                   f32_3 %158 = OpExtInst %1 37 %156 %157 
					                                                  OpStore %73 %158 
					                                   f32_3 %159 = OpLoad %73 
					                                   f32_3 %160 = OpFNegate %159 
					                                   f32_3 %161 = OpLoad %89 
					                                   f32_3 %162 = OpFAdd %160 %161 
					                                                  OpStore %73 %162 
					                                   f32_3 %163 = OpLoad %68 
					                                   f32_3 %164 = OpFNegate %163 
					                                   f32_3 %165 = OpLoad %73 
					                                   f32_3 %166 = OpFAdd %164 %165 
					                                                  OpStore %68 %166 
					                                   f32_3 %168 = OpLoad %68 
					                                   f32_3 %171 = OpFMul %168 %170 
					                                   f32_3 %174 = OpFAdd %171 %173 
					                                                  OpStore %167 %174 
					                                   f32_3 %175 = OpLoad %68 
					                                   f32_3 %176 = OpLoad %167 
					                                   f32_3 %177 = OpFMul %175 %176 
					                                   f32_3 %180 = OpFAdd %177 %179 
					                                                  OpStore %167 %180 
					                                   f32_3 %181 = OpLoad %167 
					                                   f32_3 %182 = OpLoad %68 
					                                   f32_3 %183 = OpFMul %181 %182 
					                                                  OpStore %167 %183 
					                            Private f32* %187 = OpAccessChain %167 %185 
					                                     f32 %188 = OpLoad %187 
					                            Private f32* %190 = OpAccessChain %167 %189 
					                                     f32 %191 = OpLoad %190 
					                                     f32 %192 = OpExtInst %1 40 %188 %191 
					                            Private f32* %193 = OpAccessChain %68 %189 
					                                                  OpStore %193 %192 
					                            Private f32* %195 = OpAccessChain %167 %194 
					                                     f32 %196 = OpLoad %195 
					                            Private f32* %197 = OpAccessChain %68 %189 
					                                     f32 %198 = OpLoad %197 
					                                     f32 %199 = OpExtInst %1 40 %196 %198 
					                            Private f32* %200 = OpAccessChain %68 %189 
					                                                  OpStore %200 %199 
					                                   f32_3 %201 = OpLoad %68 
					                                   f32_2 %202 = OpVectorShuffle %201 %201 0 0 
					                          Uniform f32_3* %205 = OpAccessChain %14 %203 
					                                   f32_3 %206 = OpLoad %205 
					                                   f32_2 %207 = OpVectorShuffle %206 %206 0 0 
					                                   f32_2 %208 = OpFNegate %207 
					                                   f32_2 %209 = OpFAdd %202 %208 
					                                   f32_3 %210 = OpLoad %68 
					                                   f32_3 %211 = OpVectorShuffle %210 %209 0 3 4 
					                                                  OpStore %68 %211 
					                                   f32_3 %212 = OpLoad %68 
					                                   f32_2 %213 = OpVectorShuffle %212 %212 0 1 
					                                   f32_2 %216 = OpExtInst %1 40 %213 %215 
					                                   f32_3 %217 = OpLoad %68 
					                                   f32_3 %218 = OpVectorShuffle %217 %216 3 4 2 
					                                                  OpStore %68 %218 
					                            Private f32* %220 = OpAccessChain %68 %185 
					                                     f32 %221 = OpLoad %220 
					                            Uniform f32* %222 = OpAccessChain %14 %203 %185 
					                                     f32 %223 = OpLoad %222 
					                                     f32 %224 = OpExtInst %1 37 %221 %223 
					                                                  OpStore %219 %224 
					                                     f32 %225 = OpLoad %219 
					                                     f32 %226 = OpLoad %219 
					                                     f32 %227 = OpFMul %225 %226 
					                                                  OpStore %219 %227 
					                                     f32 %228 = OpLoad %219 
					                            Uniform f32* %229 = OpAccessChain %14 %203 %194 
					                                     f32 %230 = OpLoad %229 
					                                     f32 %231 = OpFMul %228 %230 
					                                                  OpStore %219 %231 
					                            Private f32* %232 = OpAccessChain %68 %194 
					                                     f32 %233 = OpLoad %232 
					                                     f32 %234 = OpLoad %219 
					                                     f32 %235 = OpExtInst %1 40 %233 %234 
					                                                  OpStore %219 %235 
					                                     f32 %236 = OpLoad %219 
					                            Private f32* %237 = OpAccessChain %68 %189 
					                                     f32 %238 = OpLoad %237 
					                                     f32 %239 = OpFDiv %236 %238 
					                            Private f32* %240 = OpAccessChain %68 %189 
					                                                  OpStore %240 %239 
					                                   f32_3 %243 = OpLoad %167 
					                                   f32_3 %244 = OpLoad %68 
					                                   f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
					                                   f32_3 %246 = OpFMul %243 %245 
					                                   f32_4 %247 = OpLoad %242 
					                                   f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
					                                                  OpStore %242 %248 
					                             Output f32* %251 = OpAccessChain %242 %249 
					                                                  OpStore %251 %38 
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[2];
						float _PrefilterOffs;
						float _Threshold;
						vec3 _Curve;
						vec4 unused_0_6;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat16_6;
					float u_xlat8;
					float u_xlat21;
					float u_xlat16_21;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_2.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat10_3 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
					    u_xlat16_3.xyz = min(u_xlat10_3.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_4.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat10_5 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_5.xyz = min(u_xlat10_5.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
					    u_xlat16_6.xyz = min(u_xlat16_2.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_5.xyz, u_xlat16_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_2.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_4.xyz = min(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat16_0.xyz = min(u_xlat16_0.xyz, u_xlat16_4.xyz);
					    u_xlat16_0.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
					    u_xlat16_21 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_21 = max(u_xlat16_0.z, u_xlat16_21);
					    u_xlat1.x = u_xlat16_21 + (-_Curve.x);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _Curve.y);
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * _Curve.z;
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[2];
						float _PrefilterOffs;
						float _Threshold;
						vec3 _Curve;
						vec4 unused_0_6;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec3 u_xlat16_6;
					float u_xlat8;
					float u_xlat21;
					float u_xlat16_21;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_2.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat10_3 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
					    u_xlat16_3.xyz = min(u_xlat10_3.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_4.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat10_5 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_5.xyz = min(u_xlat10_5.xyz, vec3(65000.0, 65000.0, 65000.0));
					    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
					    u_xlat16_6.xyz = min(u_xlat16_2.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, u_xlat16_3.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_5.xyz, u_xlat16_2.xyz);
					    u_xlat16_3.xyz = min(u_xlat16_5.xyz, u_xlat16_6.xyz);
					    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
					    u_xlat16_2.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
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
					    u_xlat16_21 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_21 = max(u_xlat16_0.z, u_xlat16_21);
					    u_xlat1.x = u_xlat16_21 + (-_Curve.x);
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _Curve.y);
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * _Curve.z;
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
			GpuProgramID 143060
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[4];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
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
					; Bound: 106
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %97 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 97 
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
					                                             %83 = OpTypePointer Input %82 
					                                Input f32_2* %84 = OpVariable Input 
					                                             %96 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                            %100 = OpTypePointer Output %6 
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
					                                       f32_2 %85 = OpLoad %84 
					                              Uniform f32_4* %86 = OpAccessChain %20 %35 
					                                       f32_4 %87 = OpLoad %86 
					                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                       f32_2 %89 = OpFMul %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                       f32_2 %93 = OpFAdd %89 %92 
					                                       f32_4 %94 = OpLoad %9 
					                                       f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
					                                                     OpStore %9 %95 
					                                       f32_4 %98 = OpLoad %9 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore vs_TEXCOORD0 %99 
					                                Output f32* %101 = OpAccessChain %72 %22 %68 
					                                        f32 %102 = OpLoad %101 
					                                        f32 %103 = OpFNegate %102 
					                                Output f32* %104 = OpAccessChain %72 %22 %68 
					                                                     OpStore %104 %103 
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
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 25 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
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
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
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
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypeStruct %10 
					                                     %12 = OpTypePointer Uniform %11 
					            Uniform struct {f32_2;}* %13 = OpVariable Uniform 
					                                     %14 = OpTypeInt 32 1 
					                                 i32 %15 = OpConstant 0 
					                                     %16 = OpTypePointer Uniform %10 
					                                 f32 %20 = OpConstant 3,674022E-40 
					                                 f32 %21 = OpConstant 3,674022E-40 
					                               f32_4 %22 = OpConstantComposite %20 %20 %21 %20 
					                                     %24 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
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
					                               f32_4 %62 = OpConstantComposite %20 %21 %21 %21 
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
					                      Uniform f32_2* %17 = OpAccessChain %13 %15 
					                               f32_2 %18 = OpLoad %17 
					                               f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
					                               f32_4 %23 = OpFMul %19 %22 
					                               f32_2 %26 = OpLoad vs_TEXCOORD0 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                               f32_4 %28 = OpFAdd %23 %27 
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
					                      Uniform f32_2* %59 = OpAccessChain %13 %15 
					                               f32_2 %60 = OpLoad %59 
					                               f32_4 %61 = OpVectorShuffle %60 %60 0 1 0 1 
					                               f32_4 %63 = OpFMul %61 %62 
					                               f32_2 %64 = OpLoad vs_TEXCOORD0 
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[5];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
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
			GpuProgramID 237995
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[4];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
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
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_9 = max(u_xlat10_1.z, u_xlat16_9);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_1.xyz = vec3(u_xlat16_9) * u_xlat10_1.xyz;
					    u_xlat16_10 = max(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlat16_10 = max(u_xlat10_0.z, u_xlat16_10);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_10 = max(u_xlat10_2.y, u_xlat10_2.x);
					    u_xlat16_10 = max(u_xlat10_2.z, u_xlat16_10);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(u_xlat16_10) + u_xlat16_0.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat16_10 = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_10 = max(u_xlat10_1.z, u_xlat16_10);
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
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 106
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %97 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 97 
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
					                                             %83 = OpTypePointer Input %82 
					                                Input f32_2* %84 = OpVariable Input 
					                                             %96 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                            %100 = OpTypePointer Output %6 
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
					                                       f32_2 %85 = OpLoad %84 
					                              Uniform f32_4* %86 = OpAccessChain %20 %35 
					                                       f32_4 %87 = OpLoad %86 
					                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                       f32_2 %89 = OpFMul %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                       f32_2 %93 = OpFAdd %89 %92 
					                                       f32_4 %94 = OpLoad %9 
					                                       f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
					                                                     OpStore %9 %95 
					                                       f32_4 %98 = OpLoad %9 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore vs_TEXCOORD0 %99 
					                                Output f32* %101 = OpAccessChain %72 %22 %68 
					                                        f32 %102 = OpLoad %101 
					                                        f32 %103 = OpFNegate %102 
					                                Output f32* %104 = OpAccessChain %72 %22 %68 
					                                                     OpStore %104 %103 
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
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 25 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
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
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
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
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypeStruct %10 
					                                     %12 = OpTypePointer Uniform %11 
					            Uniform struct {f32_2;}* %13 = OpVariable Uniform 
					                                     %14 = OpTypeInt 32 1 
					                                 i32 %15 = OpConstant 0 
					                                     %16 = OpTypePointer Uniform %10 
					                                 f32 %20 = OpConstant 3,674022E-40 
					                                 f32 %21 = OpConstant 3,674022E-40 
					                               f32_4 %22 = OpConstantComposite %20 %20 %21 %20 
					                                     %24 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
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
					                                 u32 %57 = OpConstant 1 
					                                 u32 %60 = OpConstant 0 
					                                 u32 %64 = OpConstant 2 
					                      Private f32_3* %73 = OpVariable Private 
					                        Private f32* %78 = OpVariable Private 
					                              f32_4 %104 = OpConstantComposite %20 %21 %21 %21 
					                                    %169 = OpTypePointer Output %7 
					                      Output f32_4* %170 = OpVariable Output 
					                                f32 %177 = OpConstant 3,674022E-40 
					                                u32 %178 = OpConstant 3 
					                                    %179 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Uniform f32_2* %17 = OpAccessChain %13 %15 
					                               f32_2 %18 = OpLoad %17 
					                               f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
					                               f32_4 %23 = OpFMul %19 %22 
					                               f32_2 %26 = OpLoad vs_TEXCOORD0 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                               f32_4 %28 = OpFAdd %23 %27 
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
					                                 f32 %70 = OpFAdd %69 %21 
					                                             OpStore %55 %70 
					                                 f32 %71 = OpLoad %55 
					                                 f32 %72 = OpFDiv %21 %71 
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
					                                 f32 %89 = OpFAdd %88 %21 
					                                             OpStore %78 %89 
					                                 f32 %90 = OpLoad %78 
					                                 f32 %91 = OpFDiv %21 %90 
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
					                     Uniform f32_2* %101 = OpAccessChain %13 %15 
					                              f32_2 %102 = OpLoad %101 
					                              f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
					                              f32_4 %105 = OpFMul %103 %104 
					                              f32_2 %106 = OpLoad vs_TEXCOORD0 
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
					                                f32 %133 = OpFAdd %132 %21 
					                                             OpStore %78 %133 
					                                f32 %134 = OpLoad %78 
					                                f32 %135 = OpFDiv %21 %134 
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
					                                f32 %155 = OpFAdd %154 %21 
					                                             OpStore %78 %155 
					                                f32 %156 = OpLoad %78 
					                                f32 %157 = OpFDiv %21 %156 
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
					                                f32 %168 = OpFDiv %21 %167 
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[5];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
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
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.zw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_9 = max(u_xlat10_1.z, u_xlat16_9);
					    u_xlat16_9 = u_xlat16_9 + 1.0;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_1.xyz = vec3(u_xlat16_9) * u_xlat10_1.xyz;
					    u_xlat16_10 = max(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlat16_10 = max(u_xlat10_0.z, u_xlat16_10);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_10 = max(u_xlat10_2.y, u_xlat10_2.x);
					    u_xlat16_10 = max(u_xlat10_2.z, u_xlat16_10);
					    u_xlat16_10 = u_xlat16_10 + 1.0;
					    u_xlat16_10 = float(1.0) / u_xlat16_10;
					    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(u_xlat16_10) + u_xlat16_0.xyz;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_10;
					    u_xlat16_10 = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_10 = max(u_xlat10_1.z, u_xlat16_10);
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
			GpuProgramID 268037
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[4];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
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
					; Bound: 106
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %97 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 97 
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
					                                             %83 = OpTypePointer Input %82 
					                                Input f32_2* %84 = OpVariable Input 
					                                             %96 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                            %100 = OpTypePointer Output %6 
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
					                                       f32_2 %85 = OpLoad %84 
					                              Uniform f32_4* %86 = OpAccessChain %20 %35 
					                                       f32_4 %87 = OpLoad %86 
					                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                       f32_2 %89 = OpFMul %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                       f32_2 %93 = OpFAdd %89 %92 
					                                       f32_4 %94 = OpLoad %9 
					                                       f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
					                                                     OpStore %9 %95 
					                                       f32_4 %98 = OpLoad %9 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore vs_TEXCOORD0 %99 
					                                Output f32* %101 = OpAccessChain %72 %22 %68 
					                                        f32 %102 = OpLoad %101 
					                                        f32 %103 = OpFNegate %102 
					                                Output f32* %104 = OpAccessChain %72 %22 %68 
					                                                     OpStore %104 %103 
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
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 25 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
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
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
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
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypeStruct %10 
					                                     %12 = OpTypePointer Uniform %11 
					            Uniform struct {f32_2;}* %13 = OpVariable Uniform 
					                                     %14 = OpTypeInt 32 1 
					                                 i32 %15 = OpConstant 0 
					                                     %16 = OpTypePointer Uniform %10 
					                                 f32 %20 = OpConstant 3,674022E-40 
					                                 f32 %21 = OpConstant 3,674022E-40 
					                               f32_4 %22 = OpConstantComposite %20 %20 %21 %20 
					                                     %24 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
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
					                               f32_4 %62 = OpConstantComposite %20 %21 %21 %21 
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
					                      Uniform f32_2* %17 = OpAccessChain %13 %15 
					                               f32_2 %18 = OpLoad %17 
					                               f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
					                               f32_4 %23 = OpFMul %19 %22 
					                               f32_2 %26 = OpLoad vs_TEXCOORD0 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                               f32_4 %28 = OpFAdd %23 %27 
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
					                      Uniform f32_2* %59 = OpAccessChain %13 %15 
					                               f32_2 %60 = OpLoad %59 
					                               f32_4 %61 = OpVectorShuffle %60 %60 0 1 0 1 
					                               f32_4 %63 = OpFMul %61 %62 
					                               f32_2 %64 = OpLoad vs_TEXCOORD0 
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[5];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
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
			GpuProgramID 353098
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec2 _BaseTex_TexelSize;
						vec4 _MainTex_ST;
						vec4 _BaseTex_ST;
						vec4 unused_0_4[3];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
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
					    u_xlatb0 = _BaseTex_TexelSize.xxxy.w<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat4.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
					    vs_TEXCOORD1.y = (u_xlatb0) ? u_xlat2 : u_xlat4.y;
					    vs_TEXCOORD1.x = u_xlat4.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec4 _BaseTex_ST;
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					uniform 	float _SampleScale;
					UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat1 = _SampleScale * 0.5;
					    u_xlat2 = u_xlat0.xyzy * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0.xwzw * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat10_1.xyz;
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
					; Bound: 146
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %19 0 Offset 19 
					                                                      OpMemberDecorate %19 1 Offset 19 
					                                                      OpMemberDecorate %19 2 Offset 19 
					                                                      OpMemberDecorate %19 3 RelaxedPrecision 
					                                                      OpMemberDecorate %19 3 Offset 19 
					                                                      OpMemberDecorate %19 4 RelaxedPrecision 
					                                                      OpMemberDecorate %19 4 Offset 19 
					                                                      OpDecorate %19 Block 
					                                                      OpDecorate %21 DescriptorSet 21 
					                                                      OpDecorate %21 Binding 21 
					                                                      OpMemberDecorate %71 0 BuiltIn 71 
					                                                      OpMemberDecorate %71 1 BuiltIn 71 
					                                                      OpMemberDecorate %71 2 BuiltIn 71 
					                                                      OpDecorate %71 Block 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 114 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
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
					                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
					                                              %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
					                                              %91 = OpTypePointer Private %6 
					                                 Private f32* %92 = OpVariable Private 
					                                              %93 = OpTypePointer Input %18 
					                                 Input f32_2* %94 = OpVariable Input 
					                                              %95 = OpTypePointer Input %6 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                             %101 = OpTypePointer Private %18 
					                              Private f32_2* %102 = OpVariable Private 
					                                         i32 %104 = OpConstant 4 
					                                             %113 = OpTypePointer Output %18 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                             %116 = OpTypePointer Function %6 
					                                             %125 = OpTypePointer Output %6 
					                                         u32 %127 = OpConstant 0 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %117 = OpVariable Function 
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
					                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
					                                          f32 %88 = OpLoad %87 
					                                         bool %90 = OpFOrdLessThan %88 %89 
					                                                      OpStore %85 %90 
					                                   Input f32* %96 = OpAccessChain %94 %69 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFNegate %97 
					                                         f32 %100 = OpFAdd %98 %99 
					                                                      OpStore %92 %100 
					                                       f32_2 %103 = OpLoad %94 
					                              Uniform f32_4* %105 = OpAccessChain %21 %104 
					                                       f32_4 %106 = OpLoad %105 
					                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
					                                       f32_2 %108 = OpFMul %103 %107 
					                              Uniform f32_4* %109 = OpAccessChain %21 %104 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
					                                       f32_2 %112 = OpFAdd %108 %111 
					                                                      OpStore %102 %112 
					                                        bool %115 = OpLoad %85 
					                                                      OpSelectionMerge %119 None 
					                                                      OpBranchConditional %115 %118 %121 
					                                             %118 = OpLabel 
					                                         f32 %120 = OpLoad %92 
					                                                      OpStore %117 %120 
					                                                      OpBranch %119 
					                                             %121 = OpLabel 
					                                Private f32* %122 = OpAccessChain %102 %69 
					                                         f32 %123 = OpLoad %122 
					                                                      OpStore %117 %123 
					                                                      OpBranch %119 
					                                             %119 = OpLabel 
					                                         f32 %124 = OpLoad %117 
					                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
					                                                      OpStore %126 %124 
					                                Private f32* %128 = OpAccessChain %102 %127 
					                                         f32 %129 = OpLoad %128 
					                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
					                                                      OpStore %130 %129 
					                                       f32_2 %132 = OpLoad %94 
					                              Uniform f32_4* %133 = OpAccessChain %21 %45 
					                                       f32_4 %134 = OpLoad %133 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFMul %132 %135 
					                              Uniform f32_4* %137 = OpAccessChain %21 %45 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
					                                       f32_2 %140 = OpFAdd %136 %139 
					                                                      OpStore vs_TEXCOORD0 %140 
					                                 Output f32* %141 = OpAccessChain %73 %23 %69 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFNegate %142 
					                                 Output f32* %144 = OpAccessChain %73 %23 %69 
					                                                      OpStore %144 %143 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 127
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %39 %107 %112 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                              OpMemberDecorate %11 0 Offset 11 
					                                              OpMemberDecorate %11 1 Offset 11 
					                                              OpDecorate %11 Block 
					                                              OpDecorate %13 DescriptorSet 13 
					                                              OpDecorate %13 Binding 13 
					                                              OpDecorate vs_TEXCOORD0 Location 39 
					                                              OpDecorate %53 RelaxedPrecision 
					                                              OpDecorate %56 RelaxedPrecision 
					                                              OpDecorate %56 DescriptorSet 56 
					                                              OpDecorate %56 Binding 56 
					                                              OpDecorate %57 RelaxedPrecision 
					                                              OpDecorate %60 RelaxedPrecision 
					                                              OpDecorate %60 DescriptorSet 60 
					                                              OpDecorate %60 Binding 60 
					                                              OpDecorate %61 RelaxedPrecision 
					                                              OpDecorate %67 RelaxedPrecision 
					                                              OpDecorate %68 RelaxedPrecision 
					                                              OpDecorate %69 RelaxedPrecision 
					                                              OpDecorate %70 RelaxedPrecision 
					                                              OpDecorate %75 RelaxedPrecision 
					                                              OpDecorate %76 RelaxedPrecision 
					                                              OpDecorate %77 RelaxedPrecision 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %79 RelaxedPrecision 
					                                              OpDecorate %80 RelaxedPrecision 
					                                              OpDecorate %81 RelaxedPrecision 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %88 RelaxedPrecision 
					                                              OpDecorate %89 RelaxedPrecision 
					                                              OpDecorate %94 RelaxedPrecision 
					                                              OpDecorate %95 RelaxedPrecision 
					                                              OpDecorate %96 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %99 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %102 RelaxedPrecision 
					                                              OpDecorate %102 DescriptorSet 102 
					                                              OpDecorate %102 Binding 102 
					                                              OpDecorate %103 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %104 DescriptorSet 104 
					                                              OpDecorate %104 Binding 104 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD1 Location 107 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %112 Location 112 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %117 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 2 
					                                      %11 = OpTypeStruct %10 %6 
					                                      %12 = OpTypePointer Uniform %11 
					        Uniform struct {f32_2; f32;}* %13 = OpVariable Uniform 
					                                      %14 = OpTypeInt 32 1 
					                                  i32 %15 = OpConstant 0 
					                                      %16 = OpTypePointer Uniform %10 
					                                  f32 %20 = OpConstant 3,674022E-40 
					                                  f32 %21 = OpConstant 3,674022E-40 
					                                f32_4 %22 = OpConstantComposite %20 %20 %21 %21 
					                                      %24 = OpTypePointer Private %6 
					                         Private f32* %25 = OpVariable Private 
					                                  i32 %26 = OpConstant 1 
					                                      %27 = OpTypePointer Uniform %6 
					                                  f32 %30 = OpConstant 3,674022E-40 
					                       Private f32_4* %32 = OpVariable Private 
					                                      %38 = OpTypePointer Input %10 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %51 = OpTypeVector %6 3 
					                                      %52 = OpTypePointer Private %51 
					                       Private f32_3* %53 = OpVariable Private 
					                                      %54 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %55 = OpTypePointer UniformConstant %54 
					 UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
					                                      %58 = OpTypeSampler 
					                                      %59 = OpTypePointer UniformConstant %58 
					             UniformConstant sampler* %60 = OpVariable UniformConstant 
					                                      %62 = OpTypeSampledImage %54 
					                       Private f32_3* %68 = OpVariable Private 
					                       Private f32_3* %76 = OpVariable Private 
					                       Private f32_3* %87 = OpVariable Private 
					                       Private f32_3* %98 = OpVariable Private 
					UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
					            UniformConstant sampler* %104 = OpVariable UniformConstant 
					                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %111 = OpTypePointer Output %7 
					                       Output f32_4* %112 = OpVariable Output 
					                                 f32 %114 = OpConstant 3,674022E-40 
					                               f32_3 %115 = OpConstantComposite %114 %114 %114 
					                                 f32 %121 = OpConstant 3,674022E-40 
					                                     %122 = OpTypeInt 32 0 
					                                 u32 %123 = OpConstant 3 
					                                     %124 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Uniform f32_2* %17 = OpAccessChain %13 %15 
					                                f32_2 %18 = OpLoad %17 
					                                f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
					                                f32_4 %23 = OpFMul %19 %22 
					                                              OpStore %9 %23 
					                         Uniform f32* %28 = OpAccessChain %13 %26 
					                                  f32 %29 = OpLoad %28 
					                                  f32 %31 = OpFMul %29 %30 
					                                              OpStore %25 %31 
					                                f32_4 %33 = OpLoad %9 
					                                f32_4 %34 = OpVectorShuffle %33 %33 0 1 2 1 
					                                  f32 %35 = OpLoad %25 
					                                f32_4 %36 = OpCompositeConstruct %35 %35 %35 %35 
					                                f32_4 %37 = OpFMul %34 %36 
					                                f32_2 %40 = OpLoad vs_TEXCOORD0 
					                                f32_4 %41 = OpVectorShuffle %40 %40 0 1 0 1 
					                                f32_4 %42 = OpFAdd %37 %41 
					                                              OpStore %32 %42 
					                                f32_4 %43 = OpLoad %9 
					                                f32_4 %44 = OpVectorShuffle %43 %43 0 3 2 3 
					                                  f32 %45 = OpLoad %25 
					                                f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
					                                f32_4 %47 = OpFMul %44 %46 
					                                f32_2 %48 = OpLoad vs_TEXCOORD0 
					                                f32_4 %49 = OpVectorShuffle %48 %48 0 1 0 1 
					                                f32_4 %50 = OpFAdd %47 %49 
					                                              OpStore %9 %50 
					                  read_only Texture2D %57 = OpLoad %56 
					                              sampler %61 = OpLoad %60 
					           read_only Texture2DSampled %63 = OpSampledImage %57 %61 
					                                f32_4 %64 = OpLoad %32 
					                                f32_2 %65 = OpVectorShuffle %64 %64 0 1 
					                                f32_4 %66 = OpImageSampleImplicitLod %63 %65 
					                                f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
					                                              OpStore %53 %67 
					                  read_only Texture2D %69 = OpLoad %56 
					                              sampler %70 = OpLoad %60 
					           read_only Texture2DSampled %71 = OpSampledImage %69 %70 
					                                f32_4 %72 = OpLoad %32 
					                                f32_2 %73 = OpVectorShuffle %72 %72 2 3 
					                                f32_4 %74 = OpImageSampleImplicitLod %71 %73 
					                                f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
					                                              OpStore %68 %75 
					                                f32_3 %77 = OpLoad %53 
					                                f32_3 %78 = OpLoad %68 
					                                f32_3 %79 = OpFAdd %77 %78 
					                                              OpStore %76 %79 
					                  read_only Texture2D %80 = OpLoad %56 
					                              sampler %81 = OpLoad %60 
					           read_only Texture2DSampled %82 = OpSampledImage %80 %81 
					                                f32_4 %83 = OpLoad %9 
					                                f32_2 %84 = OpVectorShuffle %83 %83 0 1 
					                                f32_4 %85 = OpImageSampleImplicitLod %82 %84 
					                                f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
					                                              OpStore %68 %86 
					                  read_only Texture2D %88 = OpLoad %56 
					                              sampler %89 = OpLoad %60 
					           read_only Texture2DSampled %90 = OpSampledImage %88 %89 
					                                f32_4 %91 = OpLoad %9 
					                                f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                f32_4 %93 = OpImageSampleImplicitLod %90 %92 
					                                f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
					                                              OpStore %87 %94 
					                                f32_3 %95 = OpLoad %76 
					                                f32_3 %96 = OpLoad %68 
					                                f32_3 %97 = OpFAdd %95 %96 
					                                              OpStore %76 %97 
					                                f32_3 %99 = OpLoad %87 
					                               f32_3 %100 = OpLoad %76 
					                               f32_3 %101 = OpFAdd %99 %100 
					                                              OpStore %98 %101 
					                 read_only Texture2D %103 = OpLoad %102 
					                             sampler %105 = OpLoad %104 
					          read_only Texture2DSampled %106 = OpSampledImage %103 %105 
					                               f32_2 %108 = OpLoad vs_TEXCOORD1 
					                               f32_4 %109 = OpImageSampleImplicitLod %106 %108 
					                               f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
					                                              OpStore %53 %110 
					                               f32_3 %113 = OpLoad %98 
					                               f32_3 %116 = OpFMul %113 %115 
					                               f32_3 %117 = OpLoad %53 
					                               f32_3 %118 = OpFAdd %116 %117 
					                               f32_4 %119 = OpLoad %112 
					                               f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
					                                              OpStore %112 %120 
					                         Output f32* %125 = OpAccessChain %112 %123 
					                                              OpStore %125 %121 
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[3];
						float _SampleScale;
						vec4 unused_0_4;
					};
					uniform  sampler2D _BaseTex;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat1 = _SampleScale * 0.5;
					    u_xlat2 = u_xlat0.xyzy * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0.xwzw * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat10_1.xyz;
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
			GpuProgramID 397241
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec2 _BaseTex_TexelSize;
						vec4 _MainTex_ST;
						vec4 _BaseTex_ST;
						vec4 unused_0_4[3];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
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
					    u_xlatb0 = _BaseTex_TexelSize.xxxy.w<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat4.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
					    vs_TEXCOORD1.y = (u_xlatb0) ? u_xlat2 : u_xlat4.y;
					    vs_TEXCOORD1.x = u_xlat4.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec4 _BaseTex_ST;
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
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
					; Bound: 146
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %19 0 Offset 19 
					                                                      OpMemberDecorate %19 1 Offset 19 
					                                                      OpMemberDecorate %19 2 Offset 19 
					                                                      OpMemberDecorate %19 3 RelaxedPrecision 
					                                                      OpMemberDecorate %19 3 Offset 19 
					                                                      OpMemberDecorate %19 4 RelaxedPrecision 
					                                                      OpMemberDecorate %19 4 Offset 19 
					                                                      OpDecorate %19 Block 
					                                                      OpDecorate %21 DescriptorSet 21 
					                                                      OpDecorate %21 Binding 21 
					                                                      OpMemberDecorate %71 0 BuiltIn 71 
					                                                      OpMemberDecorate %71 1 BuiltIn 71 
					                                                      OpMemberDecorate %71 2 BuiltIn 71 
					                                                      OpDecorate %71 Block 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 114 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
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
					                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
					                                              %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
					                                              %91 = OpTypePointer Private %6 
					                                 Private f32* %92 = OpVariable Private 
					                                              %93 = OpTypePointer Input %18 
					                                 Input f32_2* %94 = OpVariable Input 
					                                              %95 = OpTypePointer Input %6 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                             %101 = OpTypePointer Private %18 
					                              Private f32_2* %102 = OpVariable Private 
					                                         i32 %104 = OpConstant 4 
					                                             %113 = OpTypePointer Output %18 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                             %116 = OpTypePointer Function %6 
					                                             %125 = OpTypePointer Output %6 
					                                         u32 %127 = OpConstant 0 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %117 = OpVariable Function 
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
					                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
					                                          f32 %88 = OpLoad %87 
					                                         bool %90 = OpFOrdLessThan %88 %89 
					                                                      OpStore %85 %90 
					                                   Input f32* %96 = OpAccessChain %94 %69 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFNegate %97 
					                                         f32 %100 = OpFAdd %98 %99 
					                                                      OpStore %92 %100 
					                                       f32_2 %103 = OpLoad %94 
					                              Uniform f32_4* %105 = OpAccessChain %21 %104 
					                                       f32_4 %106 = OpLoad %105 
					                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
					                                       f32_2 %108 = OpFMul %103 %107 
					                              Uniform f32_4* %109 = OpAccessChain %21 %104 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
					                                       f32_2 %112 = OpFAdd %108 %111 
					                                                      OpStore %102 %112 
					                                        bool %115 = OpLoad %85 
					                                                      OpSelectionMerge %119 None 
					                                                      OpBranchConditional %115 %118 %121 
					                                             %118 = OpLabel 
					                                         f32 %120 = OpLoad %92 
					                                                      OpStore %117 %120 
					                                                      OpBranch %119 
					                                             %121 = OpLabel 
					                                Private f32* %122 = OpAccessChain %102 %69 
					                                         f32 %123 = OpLoad %122 
					                                                      OpStore %117 %123 
					                                                      OpBranch %119 
					                                             %119 = OpLabel 
					                                         f32 %124 = OpLoad %117 
					                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
					                                                      OpStore %126 %124 
					                                Private f32* %128 = OpAccessChain %102 %127 
					                                         f32 %129 = OpLoad %128 
					                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
					                                                      OpStore %130 %129 
					                                       f32_2 %132 = OpLoad %94 
					                              Uniform f32_4* %133 = OpAccessChain %21 %45 
					                                       f32_4 %134 = OpLoad %133 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFMul %132 %135 
					                              Uniform f32_4* %137 = OpAccessChain %21 %45 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
					                                       f32_2 %140 = OpFAdd %136 %139 
					                                                      OpStore vs_TEXCOORD0 %140 
					                                 Output f32* %141 = OpAccessChain %73 %23 %69 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFNegate %142 
					                                 Output f32* %144 = OpAccessChain %73 %23 %69 
					                                                      OpStore %144 %143 
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
					                                              OpMemberDecorate %16 0 Offset 16 
					                                              OpMemberDecorate %16 1 Offset 16 
					                                              OpDecorate %16 Block 
					                                              OpDecorate %18 DescriptorSet 18 
					                                              OpDecorate %18 Binding 18 
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
					                                      %15 = OpTypeVector %6 2 
					                                      %16 = OpTypeStruct %15 %6 
					                                      %17 = OpTypePointer Uniform %16 
					        Uniform struct {f32_2; f32;}* %18 = OpVariable Uniform 
					                                      %19 = OpTypeInt 32 1 
					                                  i32 %20 = OpConstant 1 
					                                      %21 = OpTypePointer Uniform %6 
					                                  u32 %24 = OpConstant 2 
					                                  i32 %28 = OpConstant 0 
					                                      %29 = OpTypePointer Uniform %15 
					                       Private f32_4* %34 = OpVariable Private 
					                                  f32 %35 = OpConstant 3,674022E-40 
					                                  f32 %37 = OpConstant 3,674022E-40 
					                                  u32 %38 = OpConstant 3 
					                       Private f32_4* %43 = OpVariable Private 
					                                      %50 = OpTypePointer Input %15 
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
					                         Uniform f32* %22 = OpAccessChain %18 %20 
					                                  f32 %23 = OpLoad %22 
					                         Private f32* %25 = OpAccessChain %9 %24 
					                                              OpStore %25 %23 
					                                f32_4 %26 = OpLoad %9 
					                                f32_4 %27 = OpVectorShuffle %26 %26 0 0 2 2 
					                       Uniform f32_2* %30 = OpAccessChain %18 %28 
					                                f32_2 %31 = OpLoad %30 
					                                f32_4 %32 = OpVectorShuffle %31 %31 0 1 0 1 
					                                f32_4 %33 = OpFMul %27 %32 
					                                              OpStore %9 %33 
					                         Private f32* %36 = OpAccessChain %34 %24 
					                                              OpStore %36 %35 
					                         Private f32* %39 = OpAccessChain %34 %38 
					                                              OpStore %39 %37 
					                         Uniform f32* %40 = OpAccessChain %18 %20 
					                                  f32 %41 = OpLoad %40 
					                         Private f32* %42 = OpAccessChain %34 %12 
					                                              OpStore %42 %41 
					                                f32_4 %44 = OpLoad %9 
					                                f32_4 %45 = OpVectorShuffle %44 %44 0 1 3 1 
					                                f32_4 %46 = OpFNegate %45 
					                                f32_4 %47 = OpLoad %34 
					                                f32_4 %48 = OpVectorShuffle %47 %47 0 0 3 0 
					                                f32_4 %49 = OpFMul %46 %48 
					                                f32_2 %52 = OpLoad vs_TEXCOORD0 
					                                f32_4 %53 = OpVectorShuffle %52 %52 0 1 0 1 
					                                f32_4 %54 = OpFAdd %49 %53 
					                                              OpStore %43 %54 
					                  read_only Texture2D %61 = OpLoad %60 
					                              sampler %65 = OpLoad %64 
					           read_only Texture2DSampled %67 = OpSampledImage %61 %65 
					                                f32_4 %68 = OpLoad %43 
					                                f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                f32_4 %70 = OpImageSampleImplicitLod %67 %69 
					                                f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                              OpStore %57 %71 
					                  read_only Texture2D %73 = OpLoad %60 
					                              sampler %74 = OpLoad %64 
					           read_only Texture2DSampled %75 = OpSampledImage %73 %74 
					                                f32_4 %76 = OpLoad %43 
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
					                                f32_4 %91 = OpLoad %34 
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
					                               f32_4 %110 = OpLoad %34 
					                               f32_4 %111 = OpVectorShuffle %110 %110 2 3 0 3 
					                               f32_4 %112 = OpFMul %109 %111 
					                               f32_2 %113 = OpLoad vs_TEXCOORD0 
					                               f32_4 %114 = OpVectorShuffle %113 %113 0 1 0 1 
					                               f32_4 %115 = OpFAdd %112 %114 
					                                              OpStore %87 %115 
					                               f32_4 %117 = OpLoad %9 
					                               f32_4 %118 = OpVectorShuffle %117 %117 2 1 3 1 
					                               f32_4 %119 = OpLoad %34 
					                               f32_4 %120 = OpVectorShuffle %119 %119 2 0 3 0 
					                               f32_4 %121 = OpFMul %118 %120 
					                               f32_2 %122 = OpLoad vs_TEXCOORD0 
					                               f32_4 %123 = OpVectorShuffle %122 %122 0 1 0 1 
					                               f32_4 %124 = OpFAdd %121 %123 
					                                              OpStore %116 %124 
					                               f32_4 %125 = OpLoad %9 
					                               f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                               f32_4 %127 = OpLoad %34 
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
					                         Output f32* %223 = OpAccessChain %213 %38 
					                                              OpStore %223 %37 
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[3];
						float _SampleScale;
						vec4 unused_0_4;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 487298
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec2 _BaseTex_TexelSize;
						vec4 _MainTex_ST;
						vec4 _BaseTex_ST;
						vec4 unused_0_4[3];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
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
					    u_xlatb0 = _BaseTex_TexelSize.xxxy.w<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat4.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
					    vs_TEXCOORD1.y = (u_xlatb0) ? u_xlat2 : u_xlat4.y;
					    vs_TEXCOORD1.x = u_xlat4.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec4 _BaseTex_ST;
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					uniform 	float _SampleScale;
					uniform 	float _Intensity;
					UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat1 = _SampleScale * 0.5;
					    u_xlat2 = u_xlat0.xyzy * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0.xwzw * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 146
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %19 0 Offset 19 
					                                                      OpMemberDecorate %19 1 Offset 19 
					                                                      OpMemberDecorate %19 2 Offset 19 
					                                                      OpMemberDecorate %19 3 RelaxedPrecision 
					                                                      OpMemberDecorate %19 3 Offset 19 
					                                                      OpMemberDecorate %19 4 RelaxedPrecision 
					                                                      OpMemberDecorate %19 4 Offset 19 
					                                                      OpDecorate %19 Block 
					                                                      OpDecorate %21 DescriptorSet 21 
					                                                      OpDecorate %21 Binding 21 
					                                                      OpMemberDecorate %71 0 BuiltIn 71 
					                                                      OpMemberDecorate %71 1 BuiltIn 71 
					                                                      OpMemberDecorate %71 2 BuiltIn 71 
					                                                      OpDecorate %71 Block 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 114 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
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
					                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
					                                              %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
					                                              %91 = OpTypePointer Private %6 
					                                 Private f32* %92 = OpVariable Private 
					                                              %93 = OpTypePointer Input %18 
					                                 Input f32_2* %94 = OpVariable Input 
					                                              %95 = OpTypePointer Input %6 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                             %101 = OpTypePointer Private %18 
					                              Private f32_2* %102 = OpVariable Private 
					                                         i32 %104 = OpConstant 4 
					                                             %113 = OpTypePointer Output %18 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                             %116 = OpTypePointer Function %6 
					                                             %125 = OpTypePointer Output %6 
					                                         u32 %127 = OpConstant 0 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %117 = OpVariable Function 
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
					                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
					                                          f32 %88 = OpLoad %87 
					                                         bool %90 = OpFOrdLessThan %88 %89 
					                                                      OpStore %85 %90 
					                                   Input f32* %96 = OpAccessChain %94 %69 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFNegate %97 
					                                         f32 %100 = OpFAdd %98 %99 
					                                                      OpStore %92 %100 
					                                       f32_2 %103 = OpLoad %94 
					                              Uniform f32_4* %105 = OpAccessChain %21 %104 
					                                       f32_4 %106 = OpLoad %105 
					                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
					                                       f32_2 %108 = OpFMul %103 %107 
					                              Uniform f32_4* %109 = OpAccessChain %21 %104 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
					                                       f32_2 %112 = OpFAdd %108 %111 
					                                                      OpStore %102 %112 
					                                        bool %115 = OpLoad %85 
					                                                      OpSelectionMerge %119 None 
					                                                      OpBranchConditional %115 %118 %121 
					                                             %118 = OpLabel 
					                                         f32 %120 = OpLoad %92 
					                                                      OpStore %117 %120 
					                                                      OpBranch %119 
					                                             %121 = OpLabel 
					                                Private f32* %122 = OpAccessChain %102 %69 
					                                         f32 %123 = OpLoad %122 
					                                                      OpStore %117 %123 
					                                                      OpBranch %119 
					                                             %119 = OpLabel 
					                                         f32 %124 = OpLoad %117 
					                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
					                                                      OpStore %126 %124 
					                                Private f32* %128 = OpAccessChain %102 %127 
					                                         f32 %129 = OpLoad %128 
					                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
					                                                      OpStore %130 %129 
					                                       f32_2 %132 = OpLoad %94 
					                              Uniform f32_4* %133 = OpAccessChain %21 %45 
					                                       f32_4 %134 = OpLoad %133 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFMul %132 %135 
					                              Uniform f32_4* %137 = OpAccessChain %21 %45 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
					                                       f32_2 %140 = OpFAdd %136 %139 
					                                                      OpStore vs_TEXCOORD0 %140 
					                                 Output f32* %141 = OpAccessChain %73 %23 %69 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFNegate %142 
					                                 Output f32* %144 = OpAccessChain %73 %23 %69 
					                                                      OpStore %144 %143 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 138
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %39 %115 %119 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                              OpMemberDecorate %11 0 Offset 11 
					                                              OpMemberDecorate %11 1 Offset 11 
					                                              OpMemberDecorate %11 2 RelaxedPrecision 
					                                              OpMemberDecorate %11 2 Offset 11 
					                                              OpDecorate %11 Block 
					                                              OpDecorate %13 DescriptorSet 13 
					                                              OpDecorate %13 Binding 13 
					                                              OpDecorate vs_TEXCOORD0 Location 39 
					                                              OpDecorate %53 RelaxedPrecision 
					                                              OpDecorate %56 RelaxedPrecision 
					                                              OpDecorate %56 DescriptorSet 56 
					                                              OpDecorate %56 Binding 56 
					                                              OpDecorate %57 RelaxedPrecision 
					                                              OpDecorate %60 RelaxedPrecision 
					                                              OpDecorate %60 DescriptorSet 60 
					                                              OpDecorate %60 Binding 60 
					                                              OpDecorate %61 RelaxedPrecision 
					                                              OpDecorate %67 RelaxedPrecision 
					                                              OpDecorate %68 RelaxedPrecision 
					                                              OpDecorate %69 RelaxedPrecision 
					                                              OpDecorate %70 RelaxedPrecision 
					                                              OpDecorate %75 RelaxedPrecision 
					                                              OpDecorate %76 RelaxedPrecision 
					                                              OpDecorate %77 RelaxedPrecision 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %79 RelaxedPrecision 
					                                              OpDecorate %80 RelaxedPrecision 
					                                              OpDecorate %81 RelaxedPrecision 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %88 RelaxedPrecision 
					                                              OpDecorate %89 RelaxedPrecision 
					                                              OpDecorate %94 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %99 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %102 RelaxedPrecision 
					                                              OpDecorate %103 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %110 DescriptorSet 110 
					                                              OpDecorate %110 Binding 110 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %112 DescriptorSet 112 
					                                              OpDecorate %112 Binding 112 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD1 Location 115 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %119 Location 119 
					                                              OpDecorate %120 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %124 RelaxedPrecision 
					                                              OpDecorate %125 RelaxedPrecision 
					                                              OpDecorate %126 RelaxedPrecision 
					                                              OpDecorate %127 RelaxedPrecision 
					                                              OpDecorate %128 RelaxedPrecision 
					                                              OpDecorate %134 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 2 
					                                      %11 = OpTypeStruct %10 %6 %6 
					                                      %12 = OpTypePointer Uniform %11 
					   Uniform struct {f32_2; f32; f32;}* %13 = OpVariable Uniform 
					                                      %14 = OpTypeInt 32 1 
					                                  i32 %15 = OpConstant 0 
					                                      %16 = OpTypePointer Uniform %10 
					                                  f32 %20 = OpConstant 3,674022E-40 
					                                  f32 %21 = OpConstant 3,674022E-40 
					                                f32_4 %22 = OpConstantComposite %20 %20 %21 %21 
					                                      %24 = OpTypePointer Private %6 
					                         Private f32* %25 = OpVariable Private 
					                                  i32 %26 = OpConstant 1 
					                                      %27 = OpTypePointer Uniform %6 
					                                  f32 %30 = OpConstant 3,674022E-40 
					                       Private f32_4* %32 = OpVariable Private 
					                                      %38 = OpTypePointer Input %10 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %51 = OpTypeVector %6 3 
					                                      %52 = OpTypePointer Private %51 
					                       Private f32_3* %53 = OpVariable Private 
					                                      %54 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %55 = OpTypePointer UniformConstant %54 
					 UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
					                                      %58 = OpTypeSampler 
					                                      %59 = OpTypePointer UniformConstant %58 
					             UniformConstant sampler* %60 = OpVariable UniformConstant 
					                                      %62 = OpTypeSampledImage %54 
					                       Private f32_3* %68 = OpVariable Private 
					                       Private f32_3* %76 = OpVariable Private 
					                       Private f32_4* %87 = OpVariable Private 
					                      Private f32_3* %100 = OpVariable Private 
					                      Private f32_3* %105 = OpVariable Private 
					                                 f32 %107 = OpConstant 3,674022E-40 
					                               f32_3 %108 = OpConstantComposite %107 %107 %107 
					UniformConstant read_only Texture2D* %110 = OpVariable UniformConstant 
					            UniformConstant sampler* %112 = OpVariable UniformConstant 
					                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %118 = OpTypePointer Output %7 
					                       Output f32_4* %119 = OpVariable Output 
					                                 i32 %121 = OpConstant 2 
					                                     %131 = OpTypeInt 32 0 
					                                 u32 %132 = OpConstant 3 
					                                     %135 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Uniform f32_2* %17 = OpAccessChain %13 %15 
					                                f32_2 %18 = OpLoad %17 
					                                f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
					                                f32_4 %23 = OpFMul %19 %22 
					                                              OpStore %9 %23 
					                         Uniform f32* %28 = OpAccessChain %13 %26 
					                                  f32 %29 = OpLoad %28 
					                                  f32 %31 = OpFMul %29 %30 
					                                              OpStore %25 %31 
					                                f32_4 %33 = OpLoad %9 
					                                f32_4 %34 = OpVectorShuffle %33 %33 0 1 2 1 
					                                  f32 %35 = OpLoad %25 
					                                f32_4 %36 = OpCompositeConstruct %35 %35 %35 %35 
					                                f32_4 %37 = OpFMul %34 %36 
					                                f32_2 %40 = OpLoad vs_TEXCOORD0 
					                                f32_4 %41 = OpVectorShuffle %40 %40 0 1 0 1 
					                                f32_4 %42 = OpFAdd %37 %41 
					                                              OpStore %32 %42 
					                                f32_4 %43 = OpLoad %9 
					                                f32_4 %44 = OpVectorShuffle %43 %43 0 3 2 3 
					                                  f32 %45 = OpLoad %25 
					                                f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
					                                f32_4 %47 = OpFMul %44 %46 
					                                f32_2 %48 = OpLoad vs_TEXCOORD0 
					                                f32_4 %49 = OpVectorShuffle %48 %48 0 1 0 1 
					                                f32_4 %50 = OpFAdd %47 %49 
					                                              OpStore %9 %50 
					                  read_only Texture2D %57 = OpLoad %56 
					                              sampler %61 = OpLoad %60 
					           read_only Texture2DSampled %63 = OpSampledImage %57 %61 
					                                f32_4 %64 = OpLoad %32 
					                                f32_2 %65 = OpVectorShuffle %64 %64 0 1 
					                                f32_4 %66 = OpImageSampleImplicitLod %63 %65 
					                                f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
					                                              OpStore %53 %67 
					                  read_only Texture2D %69 = OpLoad %56 
					                              sampler %70 = OpLoad %60 
					           read_only Texture2DSampled %71 = OpSampledImage %69 %70 
					                                f32_4 %72 = OpLoad %32 
					                                f32_2 %73 = OpVectorShuffle %72 %72 2 3 
					                                f32_4 %74 = OpImageSampleImplicitLod %71 %73 
					                                f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
					                                              OpStore %68 %75 
					                                f32_3 %77 = OpLoad %53 
					                                f32_3 %78 = OpLoad %68 
					                                f32_3 %79 = OpFAdd %77 %78 
					                                              OpStore %76 %79 
					                  read_only Texture2D %80 = OpLoad %56 
					                              sampler %81 = OpLoad %60 
					           read_only Texture2DSampled %82 = OpSampledImage %80 %81 
					                                f32_4 %83 = OpLoad %9 
					                                f32_2 %84 = OpVectorShuffle %83 %83 0 1 
					                                f32_4 %85 = OpImageSampleImplicitLod %82 %84 
					                                f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
					                                              OpStore %68 %86 
					                  read_only Texture2D %88 = OpLoad %56 
					                              sampler %89 = OpLoad %60 
					           read_only Texture2DSampled %90 = OpSampledImage %88 %89 
					                                f32_4 %91 = OpLoad %9 
					                                f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                f32_4 %93 = OpImageSampleImplicitLod %90 %92 
					                                f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
					                                f32_4 %95 = OpLoad %87 
					                                f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
					                                              OpStore %87 %96 
					                                f32_3 %97 = OpLoad %76 
					                                f32_3 %98 = OpLoad %68 
					                                f32_3 %99 = OpFAdd %97 %98 
					                                              OpStore %76 %99 
					                               f32_4 %101 = OpLoad %87 
					                               f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
					                               f32_3 %103 = OpLoad %76 
					                               f32_3 %104 = OpFAdd %102 %103 
					                                              OpStore %100 %104 
					                               f32_3 %106 = OpLoad %100 
					                               f32_3 %109 = OpFMul %106 %108 
					                                              OpStore %105 %109 
					                 read_only Texture2D %111 = OpLoad %110 
					                             sampler %113 = OpLoad %112 
					          read_only Texture2DSampled %114 = OpSampledImage %111 %113 
					                               f32_2 %116 = OpLoad vs_TEXCOORD1 
					                               f32_4 %117 = OpImageSampleImplicitLod %114 %116 
					                                              OpStore %87 %117 
					                               f32_3 %120 = OpLoad %105 
					                        Uniform f32* %122 = OpAccessChain %13 %121 
					                                 f32 %123 = OpLoad %122 
					                               f32_3 %124 = OpCompositeConstruct %123 %123 %123 
					                               f32_3 %125 = OpFMul %120 %124 
					                               f32_4 %126 = OpLoad %87 
					                               f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
					                               f32_3 %128 = OpFAdd %125 %127 
					                               f32_4 %129 = OpLoad %119 
					                               f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
					                                              OpStore %119 %130 
					                        Private f32* %133 = OpAccessChain %87 %132 
					                                 f32 %134 = OpLoad %133 
					                         Output f32* %136 = OpAccessChain %119 %132 
					                                              OpStore %136 %134 
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
						vec2 _BaseTex_TexelSize;
						vec4 _MainTex_ST;
						vec4 _BaseTex_ST;
						vec4 unused_0_4[3];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
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
					    u_xlatb0 = _BaseTex_TexelSize.xxxy.w<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat4.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
					    vs_TEXCOORD1.y = (u_xlatb0) ? u_xlat2 : u_xlat4.y;
					    vs_TEXCOORD1.x = u_xlat4.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec4 _BaseTex_ST;
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					uniform 	float _SampleScale;
					uniform 	float _Intensity;
					UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat1 = _SampleScale * 0.5;
					    u_xlat2 = u_xlat0.xyzy * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0.xwzw * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
					; Bound: 146
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %19 0 Offset 19 
					                                                      OpMemberDecorate %19 1 Offset 19 
					                                                      OpMemberDecorate %19 2 Offset 19 
					                                                      OpMemberDecorate %19 3 RelaxedPrecision 
					                                                      OpMemberDecorate %19 3 Offset 19 
					                                                      OpMemberDecorate %19 4 RelaxedPrecision 
					                                                      OpMemberDecorate %19 4 Offset 19 
					                                                      OpDecorate %19 Block 
					                                                      OpDecorate %21 DescriptorSet 21 
					                                                      OpDecorate %21 Binding 21 
					                                                      OpMemberDecorate %71 0 BuiltIn 71 
					                                                      OpMemberDecorate %71 1 BuiltIn 71 
					                                                      OpMemberDecorate %71 2 BuiltIn 71 
					                                                      OpDecorate %71 Block 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 114 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
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
					                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
					                                              %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
					                                              %91 = OpTypePointer Private %6 
					                                 Private f32* %92 = OpVariable Private 
					                                              %93 = OpTypePointer Input %18 
					                                 Input f32_2* %94 = OpVariable Input 
					                                              %95 = OpTypePointer Input %6 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                             %101 = OpTypePointer Private %18 
					                              Private f32_2* %102 = OpVariable Private 
					                                         i32 %104 = OpConstant 4 
					                                             %113 = OpTypePointer Output %18 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                             %116 = OpTypePointer Function %6 
					                                             %125 = OpTypePointer Output %6 
					                                         u32 %127 = OpConstant 0 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %117 = OpVariable Function 
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
					                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
					                                          f32 %88 = OpLoad %87 
					                                         bool %90 = OpFOrdLessThan %88 %89 
					                                                      OpStore %85 %90 
					                                   Input f32* %96 = OpAccessChain %94 %69 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFNegate %97 
					                                         f32 %100 = OpFAdd %98 %99 
					                                                      OpStore %92 %100 
					                                       f32_2 %103 = OpLoad %94 
					                              Uniform f32_4* %105 = OpAccessChain %21 %104 
					                                       f32_4 %106 = OpLoad %105 
					                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
					                                       f32_2 %108 = OpFMul %103 %107 
					                              Uniform f32_4* %109 = OpAccessChain %21 %104 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
					                                       f32_2 %112 = OpFAdd %108 %111 
					                                                      OpStore %102 %112 
					                                        bool %115 = OpLoad %85 
					                                                      OpSelectionMerge %119 None 
					                                                      OpBranchConditional %115 %118 %121 
					                                             %118 = OpLabel 
					                                         f32 %120 = OpLoad %92 
					                                                      OpStore %117 %120 
					                                                      OpBranch %119 
					                                             %121 = OpLabel 
					                                Private f32* %122 = OpAccessChain %102 %69 
					                                         f32 %123 = OpLoad %122 
					                                                      OpStore %117 %123 
					                                                      OpBranch %119 
					                                             %119 = OpLabel 
					                                         f32 %124 = OpLoad %117 
					                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
					                                                      OpStore %126 %124 
					                                Private f32* %128 = OpAccessChain %102 %127 
					                                         f32 %129 = OpLoad %128 
					                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
					                                                      OpStore %130 %129 
					                                       f32_2 %132 = OpLoad %94 
					                              Uniform f32_4* %133 = OpAccessChain %21 %45 
					                                       f32_4 %134 = OpLoad %133 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFMul %132 %135 
					                              Uniform f32_4* %137 = OpAccessChain %21 %45 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
					                                       f32_2 %140 = OpFAdd %136 %139 
					                                                      OpStore vs_TEXCOORD0 %140 
					                                 Output f32* %141 = OpAccessChain %73 %23 %69 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFNegate %142 
					                                 Output f32* %144 = OpAccessChain %73 %23 %69 
					                                                      OpStore %144 %143 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 172
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %44 %121 %169 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                              OpMemberDecorate %11 0 Offset 11 
					                                              OpMemberDecorate %11 1 Offset 11 
					                                              OpMemberDecorate %11 2 RelaxedPrecision 
					                                              OpMemberDecorate %11 2 Offset 11 
					                                              OpDecorate %11 Block 
					                                              OpDecorate %13 DescriptorSet 13 
					                                              OpDecorate %13 Binding 13 
					                                              OpDecorate vs_TEXCOORD0 Location 44 
					                                              OpDecorate %56 RelaxedPrecision 
					                                              OpDecorate %59 RelaxedPrecision 
					                                              OpDecorate %59 DescriptorSet 59 
					                                              OpDecorate %59 Binding 59 
					                                              OpDecorate %60 RelaxedPrecision 
					                                              OpDecorate %63 RelaxedPrecision 
					                                              OpDecorate %63 DescriptorSet 63 
					                                              OpDecorate %63 Binding 63 
					                                              OpDecorate %64 RelaxedPrecision 
					                                              OpDecorate %70 RelaxedPrecision 
					                                              OpDecorate %71 RelaxedPrecision 
					                                              OpDecorate %72 RelaxedPrecision 
					                                              OpDecorate %73 RelaxedPrecision 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %79 RelaxedPrecision 
					                                              OpDecorate %80 RelaxedPrecision 
					                                              OpDecorate %81 RelaxedPrecision 
					                                              OpDecorate %82 RelaxedPrecision 
					                                              OpDecorate %83 RelaxedPrecision 
					                                              OpDecorate %84 RelaxedPrecision 
					                                              OpDecorate %89 RelaxedPrecision 
					                                              OpDecorate %90 RelaxedPrecision 
					                                              OpDecorate %91 RelaxedPrecision 
					                                              OpDecorate %92 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %99 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %102 RelaxedPrecision 
					                                              OpDecorate %103 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 RelaxedPrecision 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %116 DescriptorSet 116 
					                                              OpDecorate %116 Binding 116 
					                                              OpDecorate %117 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %118 DescriptorSet 118 
					                                              OpDecorate %118 Binding 118 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD1 Location 121 
					                                              OpDecorate %143 RelaxedPrecision 
					                                              OpDecorate %145 RelaxedPrecision 
					                                              OpDecorate %148 RelaxedPrecision 
					                                              OpDecorate %149 RelaxedPrecision 
					                                              OpDecorate %150 RelaxedPrecision 
					                                              OpDecorate %151 RelaxedPrecision 
					                                              OpDecorate %154 RelaxedPrecision 
					                                              OpDecorate %155 RelaxedPrecision 
					                                              OpDecorate %156 RelaxedPrecision 
					                                              OpDecorate %157 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %163 RelaxedPrecision 
					                                              OpDecorate %164 RelaxedPrecision 
					                                              OpDecorate %165 RelaxedPrecision 
					                                              OpDecorate %169 RelaxedPrecision 
					                                              OpDecorate %169 Location 169 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 2 
					                                      %11 = OpTypeStruct %10 %6 %6 
					                                      %12 = OpTypePointer Uniform %11 
					   Uniform struct {f32_2; f32; f32;}* %13 = OpVariable Uniform 
					                                      %14 = OpTypeInt 32 1 
					                                  i32 %15 = OpConstant 0 
					                                      %16 = OpTypePointer Uniform %10 
					                                  f32 %20 = OpConstant 3,674022E-40 
					                                  f32 %21 = OpConstant 3,674022E-40 
					                                f32_4 %22 = OpConstantComposite %20 %20 %21 %21 
					                                      %24 = OpTypeVector %6 3 
					                                      %25 = OpTypePointer Private %24 
					                       Private f32_3* %26 = OpVariable Private 
					                                  i32 %27 = OpConstant 1 
					                                      %28 = OpTypePointer Uniform %6 
					                                  f32 %31 = OpConstant 3,674022E-40 
					                                      %33 = OpTypeInt 32 0 
					                                  u32 %34 = OpConstant 0 
					                                      %35 = OpTypePointer Private %6 
					                       Private f32_4* %37 = OpVariable Private 
					                                      %43 = OpTypePointer Input %10 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                       Private f32_3* %56 = OpVariable Private 
					                                      %57 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %58 = OpTypePointer UniformConstant %57 
					 UniformConstant read_only Texture2D* %59 = OpVariable UniformConstant 
					                                      %61 = OpTypeSampler 
					                                      %62 = OpTypePointer UniformConstant %61 
					             UniformConstant sampler* %63 = OpVariable UniformConstant 
					                                      %65 = OpTypeSampledImage %57 
					                       Private f32_3* %71 = OpVariable Private 
					                       Private f32_3* %79 = OpVariable Private 
					                       Private f32_3* %90 = OpVariable Private 
					                      Private f32_3* %101 = OpVariable Private 
					                      Private f32_3* %105 = OpVariable Private 
					                                 f32 %107 = OpConstant 3,674022E-40 
					                               f32_3 %108 = OpConstantComposite %107 %107 %107 
					                                 i32 %111 = OpConstant 2 
					UniformConstant read_only Texture2D* %116 = OpVariable UniformConstant 
					            UniformConstant sampler* %118 = OpVariable UniformConstant 
					                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                 f32 %126 = OpConstant 3,674022E-40 
					                               f32_3 %127 = OpConstantComposite %126 %126 %126 
					                                 f32 %129 = OpConstant 3,674022E-40 
					                               f32_3 %130 = OpConstantComposite %129 %129 %129 
					                                 f32 %136 = OpConstant 3,674022E-40 
					                               f32_3 %137 = OpConstantComposite %136 %136 %136 
					                                 f32 %146 = OpConstant 3,674022E-40 
					                               f32_3 %147 = OpConstantComposite %146 %146 %146 
					                                 f32 %152 = OpConstant 3,674022E-40 
					                               f32_3 %153 = OpConstantComposite %152 %152 %152 
					                                 f32 %158 = OpConstant 3,674022E-40 
					                               f32_3 %159 = OpConstantComposite %158 %158 %158 
					                                 f32 %161 = OpConstant 3,674022E-40 
					                               f32_3 %162 = OpConstantComposite %161 %161 %161 
					                                     %168 = OpTypePointer Output %7 
					                       Output f32_4* %169 = OpVariable Output 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Uniform f32_2* %17 = OpAccessChain %13 %15 
					                                f32_2 %18 = OpLoad %17 
					                                f32_4 %19 = OpVectorShuffle %18 %18 0 1 0 1 
					                                f32_4 %23 = OpFMul %19 %22 
					                                              OpStore %9 %23 
					                         Uniform f32* %29 = OpAccessChain %13 %27 
					                                  f32 %30 = OpLoad %29 
					                                  f32 %32 = OpFMul %30 %31 
					                         Private f32* %36 = OpAccessChain %26 %34 
					                                              OpStore %36 %32 
					                                f32_4 %38 = OpLoad %9 
					                                f32_4 %39 = OpVectorShuffle %38 %38 0 1 2 1 
					                                f32_3 %40 = OpLoad %26 
					                                f32_4 %41 = OpVectorShuffle %40 %40 0 0 0 0 
					                                f32_4 %42 = OpFMul %39 %41 
					                                f32_2 %45 = OpLoad vs_TEXCOORD0 
					                                f32_4 %46 = OpVectorShuffle %45 %45 0 1 0 1 
					                                f32_4 %47 = OpFAdd %42 %46 
					                                              OpStore %37 %47 
					                                f32_4 %48 = OpLoad %9 
					                                f32_4 %49 = OpVectorShuffle %48 %48 0 3 2 3 
					                                f32_3 %50 = OpLoad %26 
					                                f32_4 %51 = OpVectorShuffle %50 %50 0 0 0 0 
					                                f32_4 %52 = OpFMul %49 %51 
					                                f32_2 %53 = OpLoad vs_TEXCOORD0 
					                                f32_4 %54 = OpVectorShuffle %53 %53 0 1 0 1 
					                                f32_4 %55 = OpFAdd %52 %54 
					                                              OpStore %9 %55 
					                  read_only Texture2D %60 = OpLoad %59 
					                              sampler %64 = OpLoad %63 
					           read_only Texture2DSampled %66 = OpSampledImage %60 %64 
					                                f32_4 %67 = OpLoad %37 
					                                f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                f32_4 %69 = OpImageSampleImplicitLod %66 %68 
					                                f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
					                                              OpStore %56 %70 
					                  read_only Texture2D %72 = OpLoad %59 
					                              sampler %73 = OpLoad %63 
					           read_only Texture2DSampled %74 = OpSampledImage %72 %73 
					                                f32_4 %75 = OpLoad %37 
					                                f32_2 %76 = OpVectorShuffle %75 %75 2 3 
					                                f32_4 %77 = OpImageSampleImplicitLod %74 %76 
					                                f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
					                                              OpStore %71 %78 
					                                f32_3 %80 = OpLoad %56 
					                                f32_3 %81 = OpLoad %71 
					                                f32_3 %82 = OpFAdd %80 %81 
					                                              OpStore %79 %82 
					                  read_only Texture2D %83 = OpLoad %59 
					                              sampler %84 = OpLoad %63 
					           read_only Texture2DSampled %85 = OpSampledImage %83 %84 
					                                f32_4 %86 = OpLoad %9 
					                                f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                                f32_4 %88 = OpImageSampleImplicitLod %85 %87 
					                                f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
					                                              OpStore %71 %89 
					                  read_only Texture2D %91 = OpLoad %59 
					                              sampler %92 = OpLoad %63 
					           read_only Texture2DSampled %93 = OpSampledImage %91 %92 
					                                f32_4 %94 = OpLoad %9 
					                                f32_2 %95 = OpVectorShuffle %94 %94 2 3 
					                                f32_4 %96 = OpImageSampleImplicitLod %93 %95 
					                                f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
					                                              OpStore %90 %97 
					                                f32_3 %98 = OpLoad %79 
					                                f32_3 %99 = OpLoad %71 
					                               f32_3 %100 = OpFAdd %98 %99 
					                                              OpStore %79 %100 
					                               f32_3 %102 = OpLoad %90 
					                               f32_3 %103 = OpLoad %79 
					                               f32_3 %104 = OpFAdd %102 %103 
					                                              OpStore %101 %104 
					                               f32_3 %106 = OpLoad %101 
					                               f32_3 %109 = OpFMul %106 %108 
					                                              OpStore %105 %109 
					                               f32_3 %110 = OpLoad %105 
					                        Uniform f32* %112 = OpAccessChain %13 %111 
					                                 f32 %113 = OpLoad %112 
					                               f32_3 %114 = OpCompositeConstruct %113 %113 %113 
					                               f32_3 %115 = OpFMul %110 %114 
					                                              OpStore %105 %115 
					                 read_only Texture2D %117 = OpLoad %116 
					                             sampler %119 = OpLoad %118 
					          read_only Texture2DSampled %120 = OpSampledImage %117 %119 
					                               f32_2 %122 = OpLoad vs_TEXCOORD1 
					                               f32_4 %123 = OpImageSampleImplicitLod %120 %122 
					                                              OpStore %9 %123 
					                               f32_4 %124 = OpLoad %9 
					                               f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
					                               f32_3 %128 = OpFMul %125 %127 
					                               f32_3 %131 = OpFAdd %128 %130 
					                                              OpStore %26 %131 
					                               f32_4 %132 = OpLoad %9 
					                               f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
					                               f32_3 %134 = OpLoad %26 
					                               f32_3 %135 = OpFMul %133 %134 
					                               f32_3 %138 = OpFAdd %135 %137 
					                                              OpStore %26 %138 
					                               f32_4 %139 = OpLoad %9 
					                               f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
					                               f32_3 %141 = OpLoad %26 
					                               f32_3 %142 = OpFMul %140 %141 
					                               f32_3 %143 = OpLoad %105 
					                               f32_3 %144 = OpFAdd %142 %143 
					                                              OpStore %105 %144 
					                               f32_3 %145 = OpLoad %105 
					                               f32_3 %148 = OpExtInst %1 40 %145 %147 
					                                              OpStore %105 %148 
					                               f32_3 %149 = OpLoad %105 
					                               f32_3 %150 = OpExtInst %1 30 %149 
					                                              OpStore %79 %150 
					                               f32_3 %151 = OpLoad %79 
					                               f32_3 %154 = OpFMul %151 %153 
					                                              OpStore %79 %154 
					                               f32_3 %155 = OpLoad %79 
					                               f32_3 %156 = OpExtInst %1 29 %155 
					                                              OpStore %79 %156 
					                               f32_3 %157 = OpLoad %79 
					                               f32_3 %160 = OpFMul %157 %159 
					                               f32_3 %163 = OpFAdd %160 %162 
					                                              OpStore %79 %163 
					                               f32_3 %164 = OpLoad %79 
					                               f32_3 %165 = OpExtInst %1 40 %164 %147 
					                               f32_4 %166 = OpLoad %9 
					                               f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
					                                              OpStore %9 %167 
					                               f32_4 %170 = OpLoad %9 
					                                              OpStore %169 %170 
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[3];
						float _SampleScale;
						float _Intensity;
					};
					uniform  sampler2D _BaseTex;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat1 = _SampleScale * 0.5;
					    u_xlat2 = u_xlat0.xyzy * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0.xwzw * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[3];
						float _SampleScale;
						float _Intensity;
					};
					uniform  sampler2D _BaseTex;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat1 = _SampleScale * 0.5;
					    u_xlat2 = u_xlat0.xyzy * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0.xwzw * vec4(u_xlat1) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
			GpuProgramID 560196
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec2 _BaseTex_TexelSize;
						vec4 _MainTex_ST;
						vec4 _BaseTex_ST;
						vec4 unused_0_4[3];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
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
					    u_xlatb0 = _BaseTex_TexelSize.xxxy.w<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat4.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
					    vs_TEXCOORD1.y = (u_xlatb0) ? u_xlat2 : u_xlat4.y;
					    vs_TEXCOORD1.x = u_xlat4.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec4 _BaseTex_ST;
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					uniform 	float _SampleScale;
					uniform 	float _Intensity;
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
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 146
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %19 0 Offset 19 
					                                                      OpMemberDecorate %19 1 Offset 19 
					                                                      OpMemberDecorate %19 2 Offset 19 
					                                                      OpMemberDecorate %19 3 RelaxedPrecision 
					                                                      OpMemberDecorate %19 3 Offset 19 
					                                                      OpMemberDecorate %19 4 RelaxedPrecision 
					                                                      OpMemberDecorate %19 4 Offset 19 
					                                                      OpDecorate %19 Block 
					                                                      OpDecorate %21 DescriptorSet 21 
					                                                      OpDecorate %21 Binding 21 
					                                                      OpMemberDecorate %71 0 BuiltIn 71 
					                                                      OpMemberDecorate %71 1 BuiltIn 71 
					                                                      OpMemberDecorate %71 2 BuiltIn 71 
					                                                      OpDecorate %71 Block 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 114 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
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
					                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
					                                              %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
					                                              %91 = OpTypePointer Private %6 
					                                 Private f32* %92 = OpVariable Private 
					                                              %93 = OpTypePointer Input %18 
					                                 Input f32_2* %94 = OpVariable Input 
					                                              %95 = OpTypePointer Input %6 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                             %101 = OpTypePointer Private %18 
					                              Private f32_2* %102 = OpVariable Private 
					                                         i32 %104 = OpConstant 4 
					                                             %113 = OpTypePointer Output %18 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                             %116 = OpTypePointer Function %6 
					                                             %125 = OpTypePointer Output %6 
					                                         u32 %127 = OpConstant 0 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %117 = OpVariable Function 
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
					                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
					                                          f32 %88 = OpLoad %87 
					                                         bool %90 = OpFOrdLessThan %88 %89 
					                                                      OpStore %85 %90 
					                                   Input f32* %96 = OpAccessChain %94 %69 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFNegate %97 
					                                         f32 %100 = OpFAdd %98 %99 
					                                                      OpStore %92 %100 
					                                       f32_2 %103 = OpLoad %94 
					                              Uniform f32_4* %105 = OpAccessChain %21 %104 
					                                       f32_4 %106 = OpLoad %105 
					                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
					                                       f32_2 %108 = OpFMul %103 %107 
					                              Uniform f32_4* %109 = OpAccessChain %21 %104 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
					                                       f32_2 %112 = OpFAdd %108 %111 
					                                                      OpStore %102 %112 
					                                        bool %115 = OpLoad %85 
					                                                      OpSelectionMerge %119 None 
					                                                      OpBranchConditional %115 %118 %121 
					                                             %118 = OpLabel 
					                                         f32 %120 = OpLoad %92 
					                                                      OpStore %117 %120 
					                                                      OpBranch %119 
					                                             %121 = OpLabel 
					                                Private f32* %122 = OpAccessChain %102 %69 
					                                         f32 %123 = OpLoad %122 
					                                                      OpStore %117 %123 
					                                                      OpBranch %119 
					                                             %119 = OpLabel 
					                                         f32 %124 = OpLoad %117 
					                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
					                                                      OpStore %126 %124 
					                                Private f32* %128 = OpAccessChain %102 %127 
					                                         f32 %129 = OpLoad %128 
					                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
					                                                      OpStore %130 %129 
					                                       f32_2 %132 = OpLoad %94 
					                              Uniform f32_4* %133 = OpAccessChain %21 %45 
					                                       f32_4 %134 = OpLoad %133 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFMul %132 %135 
					                              Uniform f32_4* %137 = OpAccessChain %21 %45 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
					                                       f32_2 %140 = OpFAdd %136 %139 
					                                                      OpStore vs_TEXCOORD0 %140 
					                                 Output f32* %141 = OpAccessChain %73 %23 %69 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFNegate %142 
					                                 Output f32* %144 = OpAccessChain %73 %23 %69 
					                                                      OpStore %144 %143 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 237
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %51 %216 %220 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                              OpMemberDecorate %16 0 Offset 16 
					                                              OpMemberDecorate %16 1 Offset 16 
					                                              OpMemberDecorate %16 2 RelaxedPrecision 
					                                              OpMemberDecorate %16 2 Offset 16 
					                                              OpDecorate %16 Block 
					                                              OpDecorate %18 DescriptorSet 18 
					                                              OpDecorate %18 Binding 18 
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
					                                              OpDecorate %144 RelaxedPrecision 
					                                              OpDecorate %145 RelaxedPrecision 
					                                              OpDecorate %146 RelaxedPrecision 
					                                              OpDecorate %151 RelaxedPrecision 
					                                              OpDecorate %152 RelaxedPrecision 
					                                              OpDecorate %153 RelaxedPrecision 
					                                              OpDecorate %158 RelaxedPrecision 
					                                              OpDecorate %159 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %161 RelaxedPrecision 
					                                              OpDecorate %162 RelaxedPrecision 
					                                              OpDecorate %163 RelaxedPrecision 
					                                              OpDecorate %164 RelaxedPrecision 
					                                              OpDecorate %165 RelaxedPrecision 
					                                              OpDecorate %169 RelaxedPrecision 
					                                              OpDecorate %170 RelaxedPrecision 
					                                              OpDecorate %173 RelaxedPrecision 
					                                              OpDecorate %174 RelaxedPrecision 
					                                              OpDecorate %175 RelaxedPrecision 
					                                              OpDecorate %176 RelaxedPrecision 
					                                              OpDecorate %177 RelaxedPrecision 
					                                              OpDecorate %178 RelaxedPrecision 
					                                              OpDecorate %179 RelaxedPrecision 
					                                              OpDecorate %180 RelaxedPrecision 
					                                              OpDecorate %181 RelaxedPrecision 
					                                              OpDecorate %186 RelaxedPrecision 
					                                              OpDecorate %187 RelaxedPrecision 
					                                              OpDecorate %188 RelaxedPrecision 
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
					                                              OpDecorate %210 RelaxedPrecision 
					                                              OpDecorate %211 RelaxedPrecision 
					                                              OpDecorate %211 DescriptorSet 211 
					                                              OpDecorate %211 Binding 211 
					                                              OpDecorate %212 RelaxedPrecision 
					                                              OpDecorate %213 RelaxedPrecision 
					                                              OpDecorate %213 DescriptorSet 213 
					                                              OpDecorate %213 Binding 213 
					                                              OpDecorate %214 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD1 Location 216 
					                                              OpDecorate %220 RelaxedPrecision 
					                                              OpDecorate %220 Location 220 
					                                              OpDecorate %221 RelaxedPrecision 
					                                              OpDecorate %224 RelaxedPrecision 
					                                              OpDecorate %225 RelaxedPrecision 
					                                              OpDecorate %226 RelaxedPrecision 
					                                              OpDecorate %227 RelaxedPrecision 
					                                              OpDecorate %228 RelaxedPrecision 
					                                              OpDecorate %229 RelaxedPrecision 
					                                              OpDecorate %233 RelaxedPrecision 
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
					                                      %15 = OpTypeVector %6 2 
					                                      %16 = OpTypeStruct %15 %6 %6 
					                                      %17 = OpTypePointer Uniform %16 
					   Uniform struct {f32_2; f32; f32;}* %18 = OpVariable Uniform 
					                                      %19 = OpTypeInt 32 1 
					                                  i32 %20 = OpConstant 1 
					                                      %21 = OpTypePointer Uniform %6 
					                                  u32 %24 = OpConstant 2 
					                                  i32 %28 = OpConstant 0 
					                                      %29 = OpTypePointer Uniform %15 
					                       Private f32_4* %34 = OpVariable Private 
					                                  f32 %35 = OpConstant 3,674022E-40 
					                                  f32 %37 = OpConstant 3,674022E-40 
					                                  u32 %38 = OpConstant 3 
					                       Private f32_4* %43 = OpVariable Private 
					                                      %50 = OpTypePointer Input %15 
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
					                      Private f32_4* %134 = OpVariable Private 
					                      Private f32_3* %144 = OpVariable Private 
					                      Private f32_3* %159 = OpVariable Private 
					                                 f32 %171 = OpConstant 3,674022E-40 
					                               f32_3 %172 = OpConstantComposite %171 %171 %171 
					                      Private f32_3* %201 = OpVariable Private 
					                      Private f32_3* %206 = OpVariable Private 
					                                 f32 %208 = OpConstant 3,674022E-40 
					                               f32_3 %209 = OpConstantComposite %208 %208 %208 
					UniformConstant read_only Texture2D* %211 = OpVariable UniformConstant 
					            UniformConstant sampler* %213 = OpVariable UniformConstant 
					                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %219 = OpTypePointer Output %7 
					                       Output f32_4* %220 = OpVariable Output 
					                                 i32 %222 = OpConstant 2 
					                                     %234 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                         Private f32* %14 = OpAccessChain %9 %12 
					                                              OpStore %14 %10 
					                         Uniform f32* %22 = OpAccessChain %18 %20 
					                                  f32 %23 = OpLoad %22 
					                         Private f32* %25 = OpAccessChain %9 %24 
					                                              OpStore %25 %23 
					                                f32_4 %26 = OpLoad %9 
					                                f32_4 %27 = OpVectorShuffle %26 %26 0 0 2 2 
					                       Uniform f32_2* %30 = OpAccessChain %18 %28 
					                                f32_2 %31 = OpLoad %30 
					                                f32_4 %32 = OpVectorShuffle %31 %31 0 1 0 1 
					                                f32_4 %33 = OpFMul %27 %32 
					                                              OpStore %9 %33 
					                         Private f32* %36 = OpAccessChain %34 %24 
					                                              OpStore %36 %35 
					                         Private f32* %39 = OpAccessChain %34 %38 
					                                              OpStore %39 %37 
					                         Uniform f32* %40 = OpAccessChain %18 %20 
					                                  f32 %41 = OpLoad %40 
					                         Private f32* %42 = OpAccessChain %34 %12 
					                                              OpStore %42 %41 
					                                f32_4 %44 = OpLoad %9 
					                                f32_4 %45 = OpVectorShuffle %44 %44 0 1 3 1 
					                                f32_4 %46 = OpFNegate %45 
					                                f32_4 %47 = OpLoad %34 
					                                f32_4 %48 = OpVectorShuffle %47 %47 0 0 3 0 
					                                f32_4 %49 = OpFMul %46 %48 
					                                f32_2 %52 = OpLoad vs_TEXCOORD0 
					                                f32_4 %53 = OpVectorShuffle %52 %52 0 1 0 1 
					                                f32_4 %54 = OpFAdd %49 %53 
					                                              OpStore %43 %54 
					                  read_only Texture2D %61 = OpLoad %60 
					                              sampler %65 = OpLoad %64 
					           read_only Texture2DSampled %67 = OpSampledImage %61 %65 
					                                f32_4 %68 = OpLoad %43 
					                                f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                f32_4 %70 = OpImageSampleImplicitLod %67 %69 
					                                f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                              OpStore %57 %71 
					                  read_only Texture2D %73 = OpLoad %60 
					                              sampler %74 = OpLoad %64 
					           read_only Texture2DSampled %75 = OpSampledImage %73 %74 
					                                f32_4 %76 = OpLoad %43 
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
					                                f32_4 %91 = OpLoad %34 
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
					                               f32_4 %110 = OpLoad %34 
					                               f32_4 %111 = OpVectorShuffle %110 %110 2 3 0 3 
					                               f32_4 %112 = OpFMul %109 %111 
					                               f32_2 %113 = OpLoad vs_TEXCOORD0 
					                               f32_4 %114 = OpVectorShuffle %113 %113 0 1 0 1 
					                               f32_4 %115 = OpFAdd %112 %114 
					                                              OpStore %87 %115 
					                               f32_4 %117 = OpLoad %9 
					                               f32_4 %118 = OpVectorShuffle %117 %117 2 1 3 1 
					                               f32_4 %119 = OpLoad %34 
					                               f32_4 %120 = OpVectorShuffle %119 %119 2 0 3 0 
					                               f32_4 %121 = OpFMul %118 %120 
					                               f32_2 %122 = OpLoad vs_TEXCOORD0 
					                               f32_4 %123 = OpVectorShuffle %122 %122 0 1 0 1 
					                               f32_4 %124 = OpFAdd %121 %123 
					                                              OpStore %116 %124 
					                               f32_4 %125 = OpLoad %9 
					                               f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                               f32_4 %127 = OpLoad %34 
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
					                               f32_4 %142 = OpLoad %134 
					                               f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
					                                              OpStore %134 %143 
					                 read_only Texture2D %145 = OpLoad %60 
					                             sampler %146 = OpLoad %64 
					          read_only Texture2DSampled %147 = OpSampledImage %145 %146 
					                               f32_4 %148 = OpLoad %87 
					                               f32_2 %149 = OpVectorShuffle %148 %148 0 1 
					                               f32_4 %150 = OpImageSampleImplicitLod %147 %149 
					                               f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
					                                              OpStore %144 %151 
					                 read_only Texture2D %152 = OpLoad %60 
					                             sampler %153 = OpLoad %64 
					          read_only Texture2DSampled %154 = OpSampledImage %152 %153 
					                               f32_4 %155 = OpLoad %87 
					                               f32_2 %156 = OpVectorShuffle %155 %155 2 3 
					                               f32_4 %157 = OpImageSampleImplicitLod %154 %156 
					                               f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
					                                              OpStore %57 %158 
					                               f32_3 %160 = OpLoad %144 
					                               f32_3 %161 = OpFMul %160 %83 
					                               f32_3 %162 = OpLoad %80 
					                               f32_3 %163 = OpFAdd %161 %162 
					                                              OpStore %159 %163 
					                 read_only Texture2D %164 = OpLoad %60 
					                             sampler %165 = OpLoad %64 
					          read_only Texture2DSampled %166 = OpSampledImage %164 %165 
					                               f32_2 %167 = OpLoad vs_TEXCOORD0 
					                               f32_4 %168 = OpImageSampleImplicitLod %166 %167 
					                               f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
					                                              OpStore %72 %169 
					                               f32_3 %170 = OpLoad %72 
					                               f32_3 %173 = OpFMul %170 %172 
					                               f32_3 %174 = OpLoad %159 
					                               f32_3 %175 = OpFAdd %173 %174 
					                                              OpStore %159 %175 
					                               f32_3 %176 = OpLoad %57 
					                               f32_3 %177 = OpFMul %176 %83 
					                               f32_3 %178 = OpLoad %159 
					                               f32_3 %179 = OpFAdd %177 %178 
					                                              OpStore %159 %179 
					                 read_only Texture2D %180 = OpLoad %60 
					                             sampler %181 = OpLoad %64 
					          read_only Texture2DSampled %182 = OpSampledImage %180 %181 
					                               f32_4 %183 = OpLoad %116 
					                               f32_2 %184 = OpVectorShuffle %183 %183 0 1 
					                               f32_4 %185 = OpImageSampleImplicitLod %182 %184 
					                               f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
					                                              OpStore %72 %186 
					                 read_only Texture2D %187 = OpLoad %60 
					                             sampler %188 = OpLoad %64 
					          read_only Texture2DSampled %189 = OpSampledImage %187 %188 
					                               f32_4 %190 = OpLoad %116 
					                               f32_2 %191 = OpVectorShuffle %190 %190 2 3 
					                               f32_4 %192 = OpImageSampleImplicitLod %189 %191 
					                               f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                              OpStore %57 %193 
					                               f32_3 %194 = OpLoad %159 
					                               f32_3 %195 = OpLoad %72 
					                               f32_3 %196 = OpFAdd %194 %195 
					                                              OpStore %159 %196 
					                               f32_3 %197 = OpLoad %57 
					                               f32_3 %198 = OpFMul %197 %83 
					                               f32_3 %199 = OpLoad %159 
					                               f32_3 %200 = OpFAdd %198 %199 
					                                              OpStore %159 %200 
					                               f32_4 %202 = OpLoad %134 
					                               f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
					                               f32_3 %204 = OpLoad %159 
					                               f32_3 %205 = OpFAdd %203 %204 
					                                              OpStore %201 %205 
					                               f32_3 %207 = OpLoad %201 
					                               f32_3 %210 = OpFMul %207 %209 
					                                              OpStore %206 %210 
					                 read_only Texture2D %212 = OpLoad %211 
					                             sampler %214 = OpLoad %213 
					          read_only Texture2DSampled %215 = OpSampledImage %212 %214 
					                               f32_2 %217 = OpLoad vs_TEXCOORD1 
					                               f32_4 %218 = OpImageSampleImplicitLod %215 %217 
					                                              OpStore %134 %218 
					                               f32_3 %221 = OpLoad %206 
					                        Uniform f32* %223 = OpAccessChain %18 %222 
					                                 f32 %224 = OpLoad %223 
					                               f32_3 %225 = OpCompositeConstruct %224 %224 %224 
					                               f32_3 %226 = OpFMul %221 %225 
					                               f32_4 %227 = OpLoad %134 
					                               f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
					                               f32_3 %229 = OpFAdd %226 %228 
					                               f32_4 %230 = OpLoad %220 
					                               f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
					                                              OpStore %220 %231 
					                        Private f32* %232 = OpAccessChain %134 %38 
					                                 f32 %233 = OpLoad %232 
					                         Output f32* %235 = OpAccessChain %220 %38 
					                                              OpStore %235 %233 
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
						vec2 _BaseTex_TexelSize;
						vec4 _MainTex_ST;
						vec4 _BaseTex_ST;
						vec4 unused_0_4[3];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
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
					    u_xlatb0 = _BaseTex_TexelSize.xxxy.w<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat4.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
					    vs_TEXCOORD1.y = (u_xlatb0) ? u_xlat2 : u_xlat4.y;
					    vs_TEXCOORD1.x = u_xlat4.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec4 _BaseTex_ST;
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
					uniform 	vec2 _MainTex_TexelSize;
					uniform 	float _SampleScale;
					uniform 	float _Intensity;
					UNITY_LOCATION(0) uniform  sampler2D _BaseTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat6;
					void main()
					{
					    u_xlat0.x = float(1.0);
					    u_xlat0.w = float(0.0);
					    u_xlat0.z = _SampleScale;
					    u_xlat0 = u_xlat0.xxzw * _MainTex_TexelSize.xyxy;
					    u_xlat1.x = _SampleScale;
					    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_3.xyz;
					    u_xlat1.z = -1.0;
					    u_xlat6.xz = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat6.xz);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlat3 = u_xlat0.zwxw * u_xlat1.zxxx + vs_TEXCOORD0.xyxy;
					    u_xlat4 = u_xlat0.zywy * u_xlat1.zxxx + vs_TEXCOORD0.xyxy;
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
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
					; Bound: 146
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %73 %94 %114 %131 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %19 0 Offset 19 
					                                                      OpMemberDecorate %19 1 Offset 19 
					                                                      OpMemberDecorate %19 2 Offset 19 
					                                                      OpMemberDecorate %19 3 RelaxedPrecision 
					                                                      OpMemberDecorate %19 3 Offset 19 
					                                                      OpMemberDecorate %19 4 RelaxedPrecision 
					                                                      OpMemberDecorate %19 4 Offset 19 
					                                                      OpDecorate %19 Block 
					                                                      OpDecorate %21 DescriptorSet 21 
					                                                      OpDecorate %21 Binding 21 
					                                                      OpMemberDecorate %71 0 BuiltIn 71 
					                                                      OpMemberDecorate %71 1 BuiltIn 71 
					                                                      OpMemberDecorate %71 2 BuiltIn 71 
					                                                      OpDecorate %71 Block 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 114 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
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
					                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
					                                              %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4[4]; f32_4[4]; f32_2; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
					                                              %91 = OpTypePointer Private %6 
					                                 Private f32* %92 = OpVariable Private 
					                                              %93 = OpTypePointer Input %18 
					                                 Input f32_2* %94 = OpVariable Input 
					                                              %95 = OpTypePointer Input %6 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                             %101 = OpTypePointer Private %18 
					                              Private f32_2* %102 = OpVariable Private 
					                                         i32 %104 = OpConstant 4 
					                                             %113 = OpTypePointer Output %18 
					                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                             %116 = OpTypePointer Function %6 
					                                             %125 = OpTypePointer Output %6 
					                                         u32 %127 = OpConstant 0 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %117 = OpVariable Function 
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
					                                 Uniform f32* %87 = OpAccessChain %21 %36 %69 
					                                          f32 %88 = OpLoad %87 
					                                         bool %90 = OpFOrdLessThan %88 %89 
					                                                      OpStore %85 %90 
					                                   Input f32* %96 = OpAccessChain %94 %69 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFNegate %97 
					                                         f32 %100 = OpFAdd %98 %99 
					                                                      OpStore %92 %100 
					                                       f32_2 %103 = OpLoad %94 
					                              Uniform f32_4* %105 = OpAccessChain %21 %104 
					                                       f32_4 %106 = OpLoad %105 
					                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
					                                       f32_2 %108 = OpFMul %103 %107 
					                              Uniform f32_4* %109 = OpAccessChain %21 %104 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
					                                       f32_2 %112 = OpFAdd %108 %111 
					                                                      OpStore %102 %112 
					                                        bool %115 = OpLoad %85 
					                                                      OpSelectionMerge %119 None 
					                                                      OpBranchConditional %115 %118 %121 
					                                             %118 = OpLabel 
					                                         f32 %120 = OpLoad %92 
					                                                      OpStore %117 %120 
					                                                      OpBranch %119 
					                                             %121 = OpLabel 
					                                Private f32* %122 = OpAccessChain %102 %69 
					                                         f32 %123 = OpLoad %122 
					                                                      OpStore %117 %123 
					                                                      OpBranch %119 
					                                             %119 = OpLabel 
					                                         f32 %124 = OpLoad %117 
					                                 Output f32* %126 = OpAccessChain vs_TEXCOORD1 %69 
					                                                      OpStore %126 %124 
					                                Private f32* %128 = OpAccessChain %102 %127 
					                                         f32 %129 = OpLoad %128 
					                                 Output f32* %130 = OpAccessChain vs_TEXCOORD1 %127 
					                                                      OpStore %130 %129 
					                                       f32_2 %132 = OpLoad %94 
					                              Uniform f32_4* %133 = OpAccessChain %21 %45 
					                                       f32_4 %134 = OpLoad %133 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFMul %132 %135 
					                              Uniform f32_4* %137 = OpAccessChain %21 %45 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
					                                       f32_2 %140 = OpFAdd %136 %139 
					                                                      OpStore vs_TEXCOORD0 %140 
					                                 Output f32* %141 = OpAccessChain %73 %23 %69 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFNegate %142 
					                                 Output f32* %144 = OpAccessChain %73 %23 %69 
					                                                      OpStore %144 %143 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 275
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %51 %219 %272 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                              OpMemberDecorate %16 0 Offset 16 
					                                              OpMemberDecorate %16 1 Offset 16 
					                                              OpMemberDecorate %16 2 RelaxedPrecision 
					                                              OpMemberDecorate %16 2 Offset 16 
					                                              OpDecorate %16 Block 
					                                              OpDecorate %18 DescriptorSet 18 
					                                              OpDecorate %18 Binding 18 
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
					                                              OpDecorate %204 RelaxedPrecision 
					                                              OpDecorate %207 RelaxedPrecision 
					                                              OpDecorate %208 RelaxedPrecision 
					                                              OpDecorate %211 RelaxedPrecision 
					                                              OpDecorate %212 RelaxedPrecision 
					                                              OpDecorate %213 RelaxedPrecision 
					                                              OpDecorate %214 RelaxedPrecision 
					                                              OpDecorate %214 DescriptorSet 214 
					                                              OpDecorate %214 Binding 214 
					                                              OpDecorate %215 RelaxedPrecision 
					                                              OpDecorate %216 RelaxedPrecision 
					                                              OpDecorate %216 DescriptorSet 216 
					                                              OpDecorate %216 Binding 216 
					                                              OpDecorate %217 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD1 Location 219 
					                                              OpDecorate %247 RelaxedPrecision 
					                                              OpDecorate %249 RelaxedPrecision 
					                                              OpDecorate %251 RelaxedPrecision 
					                                              OpDecorate %252 RelaxedPrecision 
					                                              OpDecorate %253 RelaxedPrecision 
					                                              OpDecorate %254 RelaxedPrecision 
					                                              OpDecorate %257 RelaxedPrecision 
					                                              OpDecorate %258 RelaxedPrecision 
					                                              OpDecorate %259 RelaxedPrecision 
					                                              OpDecorate %260 RelaxedPrecision 
					                                              OpDecorate %263 RelaxedPrecision 
					                                              OpDecorate %266 RelaxedPrecision 
					                                              OpDecorate %267 RelaxedPrecision 
					                                              OpDecorate %268 RelaxedPrecision 
					                                              OpDecorate %272 RelaxedPrecision 
					                                              OpDecorate %272 Location 272 
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
					                                      %15 = OpTypeVector %6 2 
					                                      %16 = OpTypeStruct %15 %6 %6 
					                                      %17 = OpTypePointer Uniform %16 
					   Uniform struct {f32_2; f32; f32;}* %18 = OpVariable Uniform 
					                                      %19 = OpTypeInt 32 1 
					                                  i32 %20 = OpConstant 1 
					                                      %21 = OpTypePointer Uniform %6 
					                                  u32 %24 = OpConstant 2 
					                                  i32 %28 = OpConstant 0 
					                                      %29 = OpTypePointer Uniform %15 
					                       Private f32_4* %34 = OpVariable Private 
					                                  f32 %35 = OpConstant 3,674022E-40 
					                                  f32 %37 = OpConstant 3,674022E-40 
					                                  u32 %38 = OpConstant 3 
					                       Private f32_4* %43 = OpVariable Private 
					                                      %50 = OpTypePointer Input %15 
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
					                      Private f32_3* %203 = OpVariable Private 
					                                 f32 %205 = OpConstant 3,674022E-40 
					                               f32_3 %206 = OpConstantComposite %205 %205 %205 
					                                 i32 %209 = OpConstant 2 
					UniformConstant read_only Texture2D* %214 = OpVariable UniformConstant 
					            UniformConstant sampler* %216 = OpVariable UniformConstant 
					                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                 f32 %224 = OpConstant 3,674022E-40 
					                               f32_3 %225 = OpConstantComposite %224 %224 %224 
					                                 f32 %227 = OpConstant 3,674022E-40 
					                               f32_3 %228 = OpConstantComposite %227 %227 %227 
					                                 f32 %237 = OpConstant 3,674022E-40 
					                               f32_3 %238 = OpConstantComposite %237 %237 %237 
					                               f32_3 %250 = OpConstantComposite %37 %37 %37 
					                                 f32 %255 = OpConstant 3,674022E-40 
					                               f32_3 %256 = OpConstantComposite %255 %255 %255 
					                                 f32 %261 = OpConstant 3,674022E-40 
					                               f32_3 %262 = OpConstantComposite %261 %261 %261 
					                                 f32 %264 = OpConstant 3,674022E-40 
					                               f32_3 %265 = OpConstantComposite %264 %264 %264 
					                                     %271 = OpTypePointer Output %7 
					                       Output f32_4* %272 = OpVariable Output 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                         Private f32* %14 = OpAccessChain %9 %12 
					                                              OpStore %14 %10 
					                         Uniform f32* %22 = OpAccessChain %18 %20 
					                                  f32 %23 = OpLoad %22 
					                         Private f32* %25 = OpAccessChain %9 %24 
					                                              OpStore %25 %23 
					                                f32_4 %26 = OpLoad %9 
					                                f32_4 %27 = OpVectorShuffle %26 %26 0 0 2 2 
					                       Uniform f32_2* %30 = OpAccessChain %18 %28 
					                                f32_2 %31 = OpLoad %30 
					                                f32_4 %32 = OpVectorShuffle %31 %31 0 1 0 1 
					                                f32_4 %33 = OpFMul %27 %32 
					                                              OpStore %9 %33 
					                         Private f32* %36 = OpAccessChain %34 %24 
					                                              OpStore %36 %35 
					                         Private f32* %39 = OpAccessChain %34 %38 
					                                              OpStore %39 %37 
					                         Uniform f32* %40 = OpAccessChain %18 %20 
					                                  f32 %41 = OpLoad %40 
					                         Private f32* %42 = OpAccessChain %34 %12 
					                                              OpStore %42 %41 
					                                f32_4 %44 = OpLoad %9 
					                                f32_4 %45 = OpVectorShuffle %44 %44 0 1 3 1 
					                                f32_4 %46 = OpFNegate %45 
					                                f32_4 %47 = OpLoad %34 
					                                f32_4 %48 = OpVectorShuffle %47 %47 0 0 3 0 
					                                f32_4 %49 = OpFMul %46 %48 
					                                f32_2 %52 = OpLoad vs_TEXCOORD0 
					                                f32_4 %53 = OpVectorShuffle %52 %52 0 1 0 1 
					                                f32_4 %54 = OpFAdd %49 %53 
					                                              OpStore %43 %54 
					                  read_only Texture2D %61 = OpLoad %60 
					                              sampler %65 = OpLoad %64 
					           read_only Texture2DSampled %67 = OpSampledImage %61 %65 
					                                f32_4 %68 = OpLoad %43 
					                                f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                f32_4 %70 = OpImageSampleImplicitLod %67 %69 
					                                f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                              OpStore %57 %71 
					                  read_only Texture2D %73 = OpLoad %60 
					                              sampler %74 = OpLoad %64 
					           read_only Texture2DSampled %75 = OpSampledImage %73 %74 
					                                f32_4 %76 = OpLoad %43 
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
					                                f32_4 %91 = OpLoad %34 
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
					                               f32_4 %110 = OpLoad %34 
					                               f32_4 %111 = OpVectorShuffle %110 %110 2 3 0 3 
					                               f32_4 %112 = OpFMul %109 %111 
					                               f32_2 %113 = OpLoad vs_TEXCOORD0 
					                               f32_4 %114 = OpVectorShuffle %113 %113 0 1 0 1 
					                               f32_4 %115 = OpFAdd %112 %114 
					                                              OpStore %87 %115 
					                               f32_4 %117 = OpLoad %9 
					                               f32_4 %118 = OpVectorShuffle %117 %117 2 1 3 1 
					                               f32_4 %119 = OpLoad %34 
					                               f32_4 %120 = OpVectorShuffle %119 %119 2 0 3 0 
					                               f32_4 %121 = OpFMul %118 %120 
					                               f32_2 %122 = OpLoad vs_TEXCOORD0 
					                               f32_4 %123 = OpVectorShuffle %122 %122 0 1 0 1 
					                               f32_4 %124 = OpFAdd %121 %123 
					                                              OpStore %116 %124 
					                               f32_4 %125 = OpLoad %9 
					                               f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                               f32_4 %127 = OpLoad %34 
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
					                               f32_3 %204 = OpLoad %199 
					                               f32_3 %207 = OpFMul %204 %206 
					                                              OpStore %203 %207 
					                               f32_3 %208 = OpLoad %203 
					                        Uniform f32* %210 = OpAccessChain %18 %209 
					                                 f32 %211 = OpLoad %210 
					                               f32_3 %212 = OpCompositeConstruct %211 %211 %211 
					                               f32_3 %213 = OpFMul %208 %212 
					                                              OpStore %203 %213 
					                 read_only Texture2D %215 = OpLoad %214 
					                             sampler %217 = OpLoad %216 
					          read_only Texture2DSampled %218 = OpSampledImage %215 %217 
					                               f32_2 %220 = OpLoad vs_TEXCOORD1 
					                               f32_4 %221 = OpImageSampleImplicitLod %218 %220 
					                                              OpStore %9 %221 
					                               f32_4 %222 = OpLoad %9 
					                               f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
					                               f32_3 %226 = OpFMul %223 %225 
					                               f32_3 %229 = OpFAdd %226 %228 
					                               f32_4 %230 = OpLoad %34 
					                               f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
					                                              OpStore %34 %231 
					                               f32_4 %232 = OpLoad %9 
					                               f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
					                               f32_4 %234 = OpLoad %34 
					                               f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
					                               f32_3 %236 = OpFMul %233 %235 
					                               f32_3 %239 = OpFAdd %236 %238 
					                               f32_4 %240 = OpLoad %34 
					                               f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
					                                              OpStore %34 %241 
					                               f32_4 %242 = OpLoad %9 
					                               f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
					                               f32_4 %244 = OpLoad %34 
					                               f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
					                               f32_3 %246 = OpFMul %243 %245 
					                               f32_3 %247 = OpLoad %203 
					                               f32_3 %248 = OpFAdd %246 %247 
					                                              OpStore %203 %248 
					                               f32_3 %249 = OpLoad %203 
					                               f32_3 %251 = OpExtInst %1 40 %249 %250 
					                                              OpStore %203 %251 
					                               f32_3 %252 = OpLoad %203 
					                               f32_3 %253 = OpExtInst %1 30 %252 
					                                              OpStore %157 %253 
					                               f32_3 %254 = OpLoad %157 
					                               f32_3 %257 = OpFMul %254 %256 
					                                              OpStore %157 %257 
					                               f32_3 %258 = OpLoad %157 
					                               f32_3 %259 = OpExtInst %1 29 %258 
					                                              OpStore %157 %259 
					                               f32_3 %260 = OpLoad %157 
					                               f32_3 %263 = OpFMul %260 %262 
					                               f32_3 %266 = OpFAdd %263 %265 
					                                              OpStore %157 %266 
					                               f32_3 %267 = OpLoad %157 
					                               f32_3 %268 = OpExtInst %1 40 %267 %250 
					                               f32_4 %269 = OpLoad %9 
					                               f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
					                                              OpStore %9 %270 
					                               f32_4 %273 = OpLoad %9 
					                                              OpStore %272 %273 
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[3];
						float _SampleScale;
						float _Intensity;
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
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[3];
						float _SampleScale;
						float _Intensity;
					};
					uniform  sampler2D _BaseTex;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat6;
					void main()
					{
					    u_xlat0.x = float(1.0);
					    u_xlat0.w = float(0.0);
					    u_xlat0.z = _SampleScale;
					    u_xlat0 = u_xlat0.xxzw * _MainTex_TexelSize.xyxy;
					    u_xlat1.x = _SampleScale;
					    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_3.xyz;
					    u_xlat1.z = -1.0;
					    u_xlat6.xz = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat6.xz);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlat3 = u_xlat0.zwxw * u_xlat1.zxxx + vs_TEXCOORD0.xyxy;
					    u_xlat4 = u_xlat0.zywy * u_xlat1.zxxx + vs_TEXCOORD0.xyxy;
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
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
					    u_xlat10_1 = texture(_BaseTex, vs_TEXCOORD1.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
	}
}