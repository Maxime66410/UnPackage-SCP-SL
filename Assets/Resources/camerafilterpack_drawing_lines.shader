Shader "CameraFilterPack/Drawing_Lines" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 12666
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat16_2;
					bool u_xlatb2;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = _Value2 + 345.678009;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6 = u_xlat2.y + u_xlat2.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2.x = u_xlat6 + 500.0;
					    u_xlat0 = u_xlat0 * u_xlat2.x;
					    u_xlatb2 = u_xlat0>=(-u_xlat0);
					    u_xlat0 = fract(abs(u_xlat0));
					    u_xlat0 = (u_xlatb2) ? u_xlat0 : (-u_xlat0);
					    u_xlat16_2 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_2 = max(u_xlat16_2, u_xlat10_1.x);
					    u_xlat2.x = u_xlat16_2 * _Value;
					    u_xlatb4 = u_xlat2.x>=(-u_xlat2.x);
					    u_xlat6 = fract(abs(u_xlat2.x));
					    u_xlat4 = (u_xlatb4) ? u_xlat6 : (-u_xlat6);
					    u_xlatb0 = u_xlat0<u_xlat4;
					    u_xlat4 = ceil(u_xlat2.x);
					    u_xlat2.x = floor(u_xlat2.x);
					    u_xlat0 = (u_xlatb0) ? u_xlat4 : u_xlat2.x;
					    SV_Target0.xyz = vec3(u_xlat0) / vec3(vec3(_Value, _Value, _Value));
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
					; Bound: 170
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %24 %148 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpMemberDecorate %10 1 Offset 10 
					                                             OpMemberDecorate %10 2 RelaxedPrecision 
					                                             OpMemberDecorate %10 2 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD0 Location 24 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %50 DescriptorSet 50 
					                                             OpDecorate %50 Binding 50 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %54 DescriptorSet 54 
					                                             OpDecorate %54 Binding 54 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %148 Location 148 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypePointer Private %6 
					                         Private f32* %8 = OpVariable Private 
					                                      %9 = OpTypeVector %6 4 
					                                     %10 = OpTypeStruct %6 %6 %9 
					                                     %11 = OpTypePointer Uniform %10 
					  Uniform struct {f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 1 
					                                     %15 = OpTypePointer Uniform %6 
					                                 f32 %18 = OpConstant 3,674022E-40 
					                                     %20 = OpTypeVector %6 2 
					                                     %21 = OpTypePointer Private %20 
					                      Private f32_2* %22 = OpVariable Private 
					                                     %23 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %26 = OpConstant 2 
					                                     %27 = OpTypePointer Uniform %9 
					                        Private f32* %36 = OpVariable Private 
					                                     %37 = OpTypeInt 32 0 
					                                 u32 %38 = OpConstant 1 
					                                 u32 %41 = OpConstant 0 
					                                     %45 = OpTypeVector %6 3 
					                                     %46 = OpTypePointer Private %45 
					                      Private f32_3* %47 = OpVariable Private 
					                                     %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %49 = OpTypePointer UniformConstant %48 
					UniformConstant read_only Texture2D* %50 = OpVariable UniformConstant 
					                                     %52 = OpTypeSampler 
					                                     %53 = OpTypePointer UniformConstant %52 
					            UniformConstant sampler* %54 = OpVariable UniformConstant 
					                                     %56 = OpTypeSampledImage %48 
					                                 f32 %62 = OpConstant 3,674022E-40 
					                                     %69 = OpTypeBool 
					                                     %70 = OpTypePointer Private %69 
					                       Private bool* %71 = OpVariable Private 
					                                     %80 = OpTypePointer Function %6 
					                        Private f32* %89 = OpVariable Private 
					                                 u32 %90 = OpConstant 2 
					                                i32 %101 = OpConstant 0 
					                      Private bool* %106 = OpVariable Private 
					                       Private f32* %117 = OpVariable Private 
					                      Private bool* %127 = OpVariable Private 
					                                    %147 = OpTypePointer Output %9 
					                      Output f32_4* %148 = OpVariable Output 
					                                f32 %165 = OpConstant 3,674022E-40 
					                                u32 %166 = OpConstant 3 
					                                    %167 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                       Function f32* %81 = OpVariable Function 
					                      Function f32* %119 = OpVariable Function 
					                      Function f32* %139 = OpVariable Function 
					                        Uniform f32* %16 = OpAccessChain %12 %14 
					                                 f32 %17 = OpLoad %16 
					                                 f32 %19 = OpFAdd %17 %18 
					                                             OpStore %8 %19 
					                               f32_2 %25 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %28 = OpAccessChain %12 %26 
					                               f32_4 %29 = OpLoad %28 
					                               f32_2 %30 = OpVectorShuffle %29 %29 0 1 
					                               f32_2 %31 = OpFMul %25 %30 
					                      Uniform f32_4* %32 = OpAccessChain %12 %26 
					                               f32_4 %33 = OpLoad %32 
					                               f32_2 %34 = OpVectorShuffle %33 %33 2 3 
					                               f32_2 %35 = OpFAdd %31 %34 
					                                             OpStore %22 %35 
					                        Private f32* %39 = OpAccessChain %22 %38 
					                                 f32 %40 = OpLoad %39 
					                        Private f32* %42 = OpAccessChain %22 %41 
					                                 f32 %43 = OpLoad %42 
					                                 f32 %44 = OpFAdd %40 %43 
					                                             OpStore %36 %44 
					                 read_only Texture2D %51 = OpLoad %50 
					                             sampler %55 = OpLoad %54 
					          read_only Texture2DSampled %57 = OpSampledImage %51 %55 
					                               f32_2 %58 = OpLoad %22 
					                               f32_4 %59 = OpImageSampleImplicitLod %57 %58 
					                               f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
					                                             OpStore %47 %60 
					                                 f32 %61 = OpLoad %36 
					                                 f32 %63 = OpFAdd %61 %62 
					                        Private f32* %64 = OpAccessChain %22 %41 
					                                             OpStore %64 %63 
					                                 f32 %65 = OpLoad %8 
					                        Private f32* %66 = OpAccessChain %22 %41 
					                                 f32 %67 = OpLoad %66 
					                                 f32 %68 = OpFMul %65 %67 
					                                             OpStore %8 %68 
					                                 f32 %72 = OpLoad %8 
					                                 f32 %73 = OpLoad %8 
					                                 f32 %74 = OpFNegate %73 
					                                bool %75 = OpFOrdGreaterThanEqual %72 %74 
					                                             OpStore %71 %75 
					                                 f32 %76 = OpLoad %8 
					                                 f32 %77 = OpExtInst %1 4 %76 
					                                 f32 %78 = OpExtInst %1 10 %77 
					                                             OpStore %8 %78 
					                                bool %79 = OpLoad %71 
					                                             OpSelectionMerge %83 None 
					                                             OpBranchConditional %79 %82 %85 
					                                     %82 = OpLabel 
					                                 f32 %84 = OpLoad %8 
					                                             OpStore %81 %84 
					                                             OpBranch %83 
					                                     %85 = OpLabel 
					                                 f32 %86 = OpLoad %8 
					                                 f32 %87 = OpFNegate %86 
					                                             OpStore %81 %87 
					                                             OpBranch %83 
					                                     %83 = OpLabel 
					                                 f32 %88 = OpLoad %81 
					                                             OpStore %8 %88 
					                        Private f32* %91 = OpAccessChain %47 %90 
					                                 f32 %92 = OpLoad %91 
					                        Private f32* %93 = OpAccessChain %47 %38 
					                                 f32 %94 = OpLoad %93 
					                                 f32 %95 = OpExtInst %1 40 %92 %94 
					                                             OpStore %89 %95 
					                                 f32 %96 = OpLoad %89 
					                        Private f32* %97 = OpAccessChain %47 %41 
					                                 f32 %98 = OpLoad %97 
					                                 f32 %99 = OpExtInst %1 40 %96 %98 
					                                             OpStore %89 %99 
					                                f32 %100 = OpLoad %89 
					                       Uniform f32* %102 = OpAccessChain %12 %101 
					                                f32 %103 = OpLoad %102 
					                                f32 %104 = OpFMul %100 %103 
					                       Private f32* %105 = OpAccessChain %22 %41 
					                                             OpStore %105 %104 
					                       Private f32* %107 = OpAccessChain %22 %41 
					                                f32 %108 = OpLoad %107 
					                       Private f32* %109 = OpAccessChain %22 %41 
					                                f32 %110 = OpLoad %109 
					                                f32 %111 = OpFNegate %110 
					                               bool %112 = OpFOrdGreaterThanEqual %108 %111 
					                                             OpStore %106 %112 
					                       Private f32* %113 = OpAccessChain %22 %41 
					                                f32 %114 = OpLoad %113 
					                                f32 %115 = OpExtInst %1 4 %114 
					                                f32 %116 = OpExtInst %1 10 %115 
					                                             OpStore %36 %116 
					                               bool %118 = OpLoad %106 
					                                             OpSelectionMerge %121 None 
					                                             OpBranchConditional %118 %120 %123 
					                                    %120 = OpLabel 
					                                f32 %122 = OpLoad %36 
					                                             OpStore %119 %122 
					                                             OpBranch %121 
					                                    %123 = OpLabel 
					                                f32 %124 = OpLoad %36 
					                                f32 %125 = OpFNegate %124 
					                                             OpStore %119 %125 
					                                             OpBranch %121 
					                                    %121 = OpLabel 
					                                f32 %126 = OpLoad %119 
					                                             OpStore %117 %126 
					                                f32 %128 = OpLoad %8 
					                                f32 %129 = OpLoad %117 
					                               bool %130 = OpFOrdLessThan %128 %129 
					                                             OpStore %127 %130 
					                       Private f32* %131 = OpAccessChain %22 %41 
					                                f32 %132 = OpLoad %131 
					                                f32 %133 = OpExtInst %1 9 %132 
					                                             OpStore %117 %133 
					                       Private f32* %134 = OpAccessChain %22 %41 
					                                f32 %135 = OpLoad %134 
					                                f32 %136 = OpExtInst %1 8 %135 
					                       Private f32* %137 = OpAccessChain %22 %41 
					                                             OpStore %137 %136 
					                               bool %138 = OpLoad %127 
					                                             OpSelectionMerge %141 None 
					                                             OpBranchConditional %138 %140 %143 
					                                    %140 = OpLabel 
					                                f32 %142 = OpLoad %117 
					                                             OpStore %139 %142 
					                                             OpBranch %141 
					                                    %143 = OpLabel 
					                       Private f32* %144 = OpAccessChain %22 %41 
					                                f32 %145 = OpLoad %144 
					                                             OpStore %139 %145 
					                                             OpBranch %141 
					                                    %141 = OpLabel 
					                                f32 %146 = OpLoad %139 
					                                             OpStore %8 %146 
					                                f32 %149 = OpLoad %8 
					                              f32_3 %150 = OpCompositeConstruct %149 %149 %149 
					                       Uniform f32* %151 = OpAccessChain %12 %101 
					                                f32 %152 = OpLoad %151 
					                       Uniform f32* %153 = OpAccessChain %12 %101 
					                                f32 %154 = OpLoad %153 
					                       Uniform f32* %155 = OpAccessChain %12 %101 
					                                f32 %156 = OpLoad %155 
					                              f32_3 %157 = OpCompositeConstruct %152 %154 %156 
					                                f32 %158 = OpCompositeExtract %157 0 
					                                f32 %159 = OpCompositeExtract %157 1 
					                                f32 %160 = OpCompositeExtract %157 2 
					                              f32_3 %161 = OpCompositeConstruct %158 %159 %160 
					                              f32_3 %162 = OpFDiv %150 %161 
					                              f32_4 %163 = OpLoad %148 
					                              f32_4 %164 = OpVectorShuffle %163 %162 4 5 6 3 
					                                             OpStore %148 %164 
					                        Output f32* %168 = OpAccessChain %148 %166 
					                                             OpStore %168 %165 
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
						float _Value;
						float _Value2;
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat16_2;
					bool u_xlatb2;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = _Value2 + 345.678009;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6 = u_xlat2.y + u_xlat2.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2.x = u_xlat6 + 500.0;
					    u_xlat0 = u_xlat0 * u_xlat2.x;
					    u_xlatb2 = u_xlat0>=(-u_xlat0);
					    u_xlat0 = fract(abs(u_xlat0));
					    u_xlat0 = (u_xlatb2) ? u_xlat0 : (-u_xlat0);
					    u_xlat16_2 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_2 = max(u_xlat16_2, u_xlat10_1.x);
					    u_xlat2.x = u_xlat16_2 * _Value;
					    u_xlatb4 = u_xlat2.x>=(-u_xlat2.x);
					    u_xlat6 = fract(abs(u_xlat2.x));
					    u_xlat4 = (u_xlatb4) ? u_xlat6 : (-u_xlat6);
					    u_xlatb0 = u_xlat0<u_xlat4;
					    u_xlat4 = ceil(u_xlat2.x);
					    u_xlat2.x = floor(u_xlat2.x);
					    u_xlat0 = (u_xlatb0) ? u_xlat4 : u_xlat2.x;
					    SV_Target0.xyz = vec3(u_xlat0) / vec3(vec3(_Value, _Value, _Value));
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