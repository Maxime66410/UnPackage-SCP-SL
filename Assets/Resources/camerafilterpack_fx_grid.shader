Shader "CameraFilterPack/FX_Grid" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 5)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 51320
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
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					bvec4 u_xlatb0;
					vec2 u_xlat1;
					vec4 u_xlat10_2;
					float u_xlat16_3;
					float u_xlat6;
					vec2 u_xlat7;
					void main()
					{
					    u_xlat0.zw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.zw * vec2(60.0, 35.2999992);
					    u_xlat7.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = fract(u_xlat1.yx);
					    u_xlat1.xy = (-vec2(vec2(_Distortion, _Distortion))) * vec2(0.150000006, 0.150000006) + u_xlat1.xy;
					    u_xlat0.xy = u_xlat7.xy * vec2(0.0166666675, 0.0283286124);
					    u_xlat10_2 = texture(_MainTex, u_xlat0.zy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xw);
					    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat16_3 = dot(u_xlat10_2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat6 = (-_Distortion) * 0.300000012 + 1.0;
					    u_xlat0.w = (-u_xlat6) * u_xlat16_3 + u_xlat1.x;
					    u_xlat16_3 = u_xlat16_0 + u_xlat16_3;
					    u_xlat0.x = (-u_xlat6) * u_xlat16_0 + u_xlat1.y;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat6 = _Distortion * 0.150000006;
					    u_xlatb0.xw = lessThan(abs(u_xlat0.xxxw), vec4(u_xlat6)).xw;
					    u_xlatb0.x = u_xlatb0.x || u_xlatb0.w;
					    u_xlat6 = (u_xlatb0.x) ? 0.0 : 1.0;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    u_xlat6 = u_xlat16_3 * u_xlat6;
					    u_xlat6 = u_xlat6 * 0.300000012;
					    SV_Target0.y = u_xlat0.x * u_xlat16_3 + u_xlat6;
					    SV_Target0.xzw = vec3(0.0, 0.0, 1.0);
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
					; Bound: 186
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %173 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
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
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %72 DescriptorSet 72 
					                                             OpDecorate %72 Binding 72 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %76 DescriptorSet 76 
					                                             OpDecorate %76 Binding 76 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %121 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %167 RelaxedPrecision 
					                                             OpDecorate %173 Location 173 
					                                             OpDecorate %176 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %14 = OpTypeStruct %6 %7 
					                                     %15 = OpTypePointer Uniform %14 
					       Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 1 
					                                     %19 = OpTypePointer Uniform %7 
					                                     %30 = OpTypePointer Private %10 
					                      Private f32_2* %31 = OpVariable Private 
					                                 f32 %34 = OpConstant 3,674022E-40 
					                                 f32 %35 = OpConstant 3,674022E-40 
					                               f32_2 %36 = OpConstantComposite %34 %35 
					                      Private f32_2* %38 = OpVariable Private 
					                                 i32 %44 = OpConstant 0 
					                                     %45 = OpTypePointer Uniform %6 
					                                 f32 %55 = OpConstant 3,674022E-40 
					                               f32_2 %56 = OpConstantComposite %55 %55 
					                                 f32 %61 = OpConstant 3,674022E-40 
					                                 f32 %62 = OpConstant 3,674022E-40 
					                               f32_2 %63 = OpConstantComposite %61 %62 
					                                     %67 = OpTypeVector %6 3 
					                                     %68 = OpTypePointer Private %67 
					                      Private f32_3* %69 = OpVariable Private 
					                                     %70 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %71 = OpTypePointer UniformConstant %70 
					UniformConstant read_only Texture2D* %72 = OpVariable UniformConstant 
					                                     %74 = OpTypeSampler 
					                                     %75 = OpTypePointer UniformConstant %74 
					            UniformConstant sampler* %76 = OpVariable UniformConstant 
					                                     %78 = OpTypeSampledImage %70 
					                      Private f32_3* %84 = OpVariable Private 
					                                     %92 = OpTypePointer Private %6 
					                        Private f32* %93 = OpVariable Private 
					                                 f32 %95 = OpConstant 3,674022E-40 
					                               f32_3 %96 = OpConstantComposite %95 %95 %95 
					                        Private f32* %98 = OpVariable Private 
					                       Private f32* %101 = OpVariable Private 
					                                f32 %105 = OpConstant 3,674022E-40 
					                                f32 %107 = OpConstant 3,674022E-40 
					                                    %113 = OpTypeInt 32 0 
					                                u32 %114 = OpConstant 0 
					                                u32 %118 = OpConstant 3 
					                                u32 %127 = OpConstant 1 
					                                f32 %133 = OpConstant 3,674022E-40 
					                                    %138 = OpTypeBool 
					                                    %139 = OpTypeVector %138 4 
					                                    %140 = OpTypePointer Private %139 
					                    Private bool_4* %141 = OpVariable Private 
					                                    %148 = OpTypeVector %138 2 
					                                    %152 = OpTypePointer Private %138 
					                                f32 %161 = OpConstant 3,674022E-40 
					                                    %172 = OpTypePointer Output %7 
					                      Output f32_4* %173 = OpVariable Output 
					                                    %180 = OpTypePointer Output %6 
					                              f32_3 %182 = OpConstantComposite %161 %161 %107 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_2 %13 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %20 = OpAccessChain %16 %18 
					                               f32_4 %21 = OpLoad %20 
					                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                               f32_2 %23 = OpFMul %13 %22 
					                      Uniform f32_4* %24 = OpAccessChain %16 %18 
					                               f32_4 %25 = OpLoad %24 
					                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                               f32_2 %27 = OpFAdd %23 %26 
					                               f32_4 %28 = OpLoad %9 
					                               f32_4 %29 = OpVectorShuffle %28 %27 0 1 4 5 
					                                             OpStore %9 %29 
					                               f32_4 %32 = OpLoad %9 
					                               f32_2 %33 = OpVectorShuffle %32 %32 2 3 
					                               f32_2 %37 = OpFMul %33 %36 
					                                             OpStore %31 %37 
					                               f32_2 %39 = OpLoad %31 
					                               f32_2 %40 = OpExtInst %1 8 %39 
					                                             OpStore %38 %40 
					                               f32_2 %41 = OpLoad %31 
					                               f32_2 %42 = OpVectorShuffle %41 %41 1 0 
					                               f32_2 %43 = OpExtInst %1 10 %42 
					                                             OpStore %31 %43 
					                        Uniform f32* %46 = OpAccessChain %16 %44 
					                                 f32 %47 = OpLoad %46 
					                        Uniform f32* %48 = OpAccessChain %16 %44 
					                                 f32 %49 = OpLoad %48 
					                               f32_2 %50 = OpCompositeConstruct %47 %49 
					                                 f32 %51 = OpCompositeExtract %50 0 
					                                 f32 %52 = OpCompositeExtract %50 1 
					                               f32_2 %53 = OpCompositeConstruct %51 %52 
					                               f32_2 %54 = OpFNegate %53 
					                               f32_2 %57 = OpFMul %54 %56 
					                               f32_2 %58 = OpLoad %31 
					                               f32_2 %59 = OpFAdd %57 %58 
					                                             OpStore %31 %59 
					                               f32_2 %60 = OpLoad %38 
					                               f32_2 %64 = OpFMul %60 %63 
					                               f32_4 %65 = OpLoad %9 
					                               f32_4 %66 = OpVectorShuffle %65 %64 4 5 2 3 
					                                             OpStore %9 %66 
					                 read_only Texture2D %73 = OpLoad %72 
					                             sampler %77 = OpLoad %76 
					          read_only Texture2DSampled %79 = OpSampledImage %73 %77 
					                               f32_4 %80 = OpLoad %9 
					                               f32_2 %81 = OpVectorShuffle %80 %80 2 1 
					                               f32_4 %82 = OpImageSampleImplicitLod %79 %81 
					                               f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
					                                             OpStore %69 %83 
					                 read_only Texture2D %85 = OpLoad %72 
					                             sampler %86 = OpLoad %76 
					          read_only Texture2DSampled %87 = OpSampledImage %85 %86 
					                               f32_4 %88 = OpLoad %9 
					                               f32_2 %89 = OpVectorShuffle %88 %88 0 3 
					                               f32_4 %90 = OpImageSampleImplicitLod %87 %89 
					                               f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
					                                             OpStore %84 %91 
					                               f32_3 %94 = OpLoad %84 
					                                 f32 %97 = OpDot %94 %96 
					                                             OpStore %93 %97 
					                               f32_3 %99 = OpLoad %69 
					                                f32 %100 = OpDot %99 %96 
					                                             OpStore %98 %100 
					                       Uniform f32* %102 = OpAccessChain %16 %44 
					                                f32 %103 = OpLoad %102 
					                                f32 %104 = OpFNegate %103 
					                                f32 %106 = OpFMul %104 %105 
					                                f32 %108 = OpFAdd %106 %107 
					                                             OpStore %101 %108 
					                                f32 %109 = OpLoad %101 
					                                f32 %110 = OpFNegate %109 
					                                f32 %111 = OpLoad %98 
					                                f32 %112 = OpFMul %110 %111 
					                       Private f32* %115 = OpAccessChain %31 %114 
					                                f32 %116 = OpLoad %115 
					                                f32 %117 = OpFAdd %112 %116 
					                       Private f32* %119 = OpAccessChain %9 %118 
					                                             OpStore %119 %117 
					                                f32 %120 = OpLoad %93 
					                                f32 %121 = OpLoad %98 
					                                f32 %122 = OpFAdd %120 %121 
					                                             OpStore %98 %122 
					                                f32 %123 = OpLoad %101 
					                                f32 %124 = OpFNegate %123 
					                                f32 %125 = OpLoad %93 
					                                f32 %126 = OpFMul %124 %125 
					                       Private f32* %128 = OpAccessChain %31 %127 
					                                f32 %129 = OpLoad %128 
					                                f32 %130 = OpFAdd %126 %129 
					                       Private f32* %131 = OpAccessChain %9 %114 
					                                             OpStore %131 %130 
					                                f32 %132 = OpLoad %98 
					                                f32 %134 = OpFMul %132 %133 
					                                             OpStore %98 %134 
					                       Uniform f32* %135 = OpAccessChain %16 %44 
					                                f32 %136 = OpLoad %135 
					                                f32 %137 = OpFMul %136 %55 
					                                             OpStore %101 %137 
					                              f32_4 %142 = OpLoad %9 
					                              f32_4 %143 = OpVectorShuffle %142 %142 0 0 0 3 
					                              f32_4 %144 = OpExtInst %1 4 %143 
					                                f32 %145 = OpLoad %101 
					                              f32_4 %146 = OpCompositeConstruct %145 %145 %145 %145 
					                             bool_4 %147 = OpFOrdLessThan %144 %146 
					                             bool_2 %149 = OpVectorShuffle %147 %147 0 3 
					                             bool_4 %150 = OpLoad %141 
					                             bool_4 %151 = OpVectorShuffle %150 %149 4 1 2 5 
					                                             OpStore %141 %151 
					                      Private bool* %153 = OpAccessChain %141 %114 
					                               bool %154 = OpLoad %153 
					                      Private bool* %155 = OpAccessChain %141 %118 
					                               bool %156 = OpLoad %155 
					                               bool %157 = OpLogicalOr %154 %156 
					                      Private bool* %158 = OpAccessChain %141 %114 
					                                             OpStore %158 %157 
					                      Private bool* %159 = OpAccessChain %141 %114 
					                               bool %160 = OpLoad %159 
					                                f32 %162 = OpSelect %160 %161 %107 
					                                             OpStore %101 %162 
					                      Private bool* %163 = OpAccessChain %141 %114 
					                               bool %164 = OpLoad %163 
					                                f32 %165 = OpSelect %164 %107 %161 
					                       Private f32* %166 = OpAccessChain %9 %114 
					                                             OpStore %166 %165 
					                                f32 %167 = OpLoad %98 
					                                f32 %168 = OpLoad %101 
					                                f32 %169 = OpFMul %167 %168 
					                                             OpStore %101 %169 
					                                f32 %170 = OpLoad %101 
					                                f32 %171 = OpFMul %170 %105 
					                                             OpStore %101 %171 
					                       Private f32* %174 = OpAccessChain %9 %114 
					                                f32 %175 = OpLoad %174 
					                                f32 %176 = OpLoad %98 
					                                f32 %177 = OpFMul %175 %176 
					                                f32 %178 = OpLoad %101 
					                                f32 %179 = OpFAdd %177 %178 
					                        Output f32* %181 = OpAccessChain %173 %127 
					                                             OpStore %181 %179 
					                              f32_4 %183 = OpLoad %173 
					                              f32_4 %184 = OpVectorShuffle %183 %182 4 1 5 6 
					                                             OpStore %173 %184 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					bvec4 u_xlatb0;
					vec2 u_xlat1;
					vec4 u_xlat10_2;
					float u_xlat16_3;
					float u_xlat6;
					vec2 u_xlat7;
					void main()
					{
					    u_xlat0.zw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.zw * vec2(60.0, 35.2999992);
					    u_xlat7.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = fract(u_xlat1.yx);
					    u_xlat1.xy = (-vec2(vec2(_Distortion, _Distortion))) * vec2(0.150000006, 0.150000006) + u_xlat1.xy;
					    u_xlat0.xy = u_xlat7.xy * vec2(0.0166666675, 0.0283286124);
					    u_xlat10_2 = texture(_MainTex, u_xlat0.zy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xw);
					    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat16_3 = dot(u_xlat10_2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat6 = (-_Distortion) * 0.300000012 + 1.0;
					    u_xlat0.w = (-u_xlat6) * u_xlat16_3 + u_xlat1.x;
					    u_xlat16_3 = u_xlat16_0 + u_xlat16_3;
					    u_xlat0.x = (-u_xlat6) * u_xlat16_0 + u_xlat1.y;
					    u_xlat16_3 = u_xlat16_3 * 0.5;
					    u_xlat6 = _Distortion * 0.150000006;
					    u_xlatb0.xw = lessThan(abs(u_xlat0.xxxw), vec4(u_xlat6)).xw;
					    u_xlatb0.x = u_xlatb0.x || u_xlatb0.w;
					    u_xlat6 = (u_xlatb0.x) ? 0.0 : 1.0;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    u_xlat6 = u_xlat16_3 * u_xlat6;
					    u_xlat6 = u_xlat6 * 0.300000012;
					    SV_Target0.y = u_xlat0.x * u_xlat16_3 + u_xlat6;
					    SV_Target0.xzw = vec3(0.0, 0.0, 1.0);
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