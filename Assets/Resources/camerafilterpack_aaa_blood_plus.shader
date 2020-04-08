Shader "CameraFilterPack/AAA_Blood_Plus" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 40480
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
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform 	float _Value7;
					uniform 	float _Value8;
					uniform 	float _Value9;
					uniform 	float _Value10;
					uniform 	float _Value11;
					uniform 	float _Value12;
					uniform 	float _Value13;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					void main()
					{
					    u_xlat0.x = _Value2 + _Value3;
					    u_xlat0.x = u_xlat0.x + _Value4;
					    u_xlat0.x = u_xlat0.x + _Value5;
					    u_xlat0.x = u_xlat0.x * 0.00100000005 + 2.0;
					    u_xlat5.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat5.xy + vec2(-0.5, -0.5);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + vec2(0.5, 0.5);
					    u_xlat0.xw = u_xlat1.xy / u_xlat0.xx;
					    u_xlat1.xy = u_xlat0.xw + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat10_2 = texture(_MainTex2, u_xlat0.xw);
					    u_xlat3 = u_xlat0.xwxw + vec4(0.5, 0.0, 0.0, 0.5);
					    u_xlat10_4 = texture(_MainTex2, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex2, u_xlat3.zw);
					    u_xlat0.x = u_xlat10_4.x * _Value3;
					    u_xlat0.x = u_xlat10_2.x * _Value2 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.x * _Value4 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_1.x * _Value5 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.y * _Value6 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_4.y * _Value7 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.y * _Value8 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_1.y * _Value9 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.z * _Value10 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_4.z * _Value11 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.z * _Value12 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_1.z * _Value13 + u_xlat0.x;
					    u_xlat1.x = u_xlat0.x * _Value;
					    u_xlat0.xy = u_xlat1.xx * vec2(0.0625, 0.0625) + u_xlat5.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.yz = u_xlat10_0.yz;
					    u_xlat5.xyz = u_xlat1.xxx * vec3(0.00390625, 0.00390625, 0.00390625) + u_xlat1.xyz;
					    SV_Target0.x = u_xlat10_0.x + u_xlat5.x;
					    SV_Target0.yz = u_xlat5.yz;
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
					; Bound: 311
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %52 %295 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %10 0 Offset 10 
					                                                      OpMemberDecorate %10 1 Offset 10 
					                                                      OpMemberDecorate %10 2 Offset 10 
					                                                      OpMemberDecorate %10 3 Offset 10 
					                                                      OpMemberDecorate %10 4 Offset 10 
					                                                      OpMemberDecorate %10 5 Offset 10 
					                                                      OpMemberDecorate %10 6 Offset 10 
					                                                      OpMemberDecorate %10 7 Offset 10 
					                                                      OpMemberDecorate %10 8 Offset 10 
					                                                      OpMemberDecorate %10 9 Offset 10 
					                                                      OpMemberDecorate %10 10 Offset 10 
					                                                      OpMemberDecorate %10 11 Offset 10 
					                                                      OpMemberDecorate %10 12 Offset 10 
					                                                      OpMemberDecorate %10 13 RelaxedPrecision 
					                                                      OpMemberDecorate %10 13 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 52 
					                                                      OpDecorate %57 RelaxedPrecision 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %99 DescriptorSet 99 
					                                                      OpDecorate %99 Binding 99 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %103 DescriptorSet 103 
					                                                      OpDecorate %103 Binding 103 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %166 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %247 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %274 DescriptorSet 274 
					                                                      OpDecorate %274 Binding 274 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %276 DescriptorSet 276 
					                                                      OpDecorate %276 Binding 276 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %295 Location 295 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 1 
					                                              %15 = OpTypePointer Uniform %6 
					                                          i32 %18 = OpConstant 2 
					                                              %22 = OpTypeInt 32 0 
					                                          u32 %23 = OpConstant 0 
					                                              %24 = OpTypePointer Private %6 
					                                          i32 %28 = OpConstant 3 
					                                          i32 %35 = OpConstant 4 
					                                          f32 %42 = OpConstant 3,674022E-40 
					                                          f32 %44 = OpConstant 3,674022E-40 
					                                              %47 = OpTypeVector %6 3 
					                                              %48 = OpTypePointer Private %47 
					                               Private f32_3* %49 = OpVariable Private 
					                                              %50 = OpTypeVector %6 2 
					                                              %51 = OpTypePointer Input %50 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %54 = OpConstant 13 
					                                              %55 = OpTypePointer Uniform %7 
					                               Private f32_3* %66 = OpVariable Private 
					                                          f32 %69 = OpConstant 3,674022E-40 
					                                        f32_2 %70 = OpConstantComposite %69 %69 
					                                          f32 %76 = OpConstant 3,674022E-40 
					                                        f32_2 %77 = OpConstantComposite %76 %76 
					                                          f32 %79 = OpConstant 3,674022E-40 
					                                        f32_2 %80 = OpConstantComposite %79 %79 
					                               Private f32_3* %96 = OpVariable Private 
					                                              %97 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %98 = OpTypePointer UniformConstant %97 
					         UniformConstant read_only Texture2D* %99 = OpVariable UniformConstant 
					                                             %101 = OpTypeSampler 
					                                             %102 = OpTypePointer UniformConstant %101 
					                    UniformConstant sampler* %103 = OpVariable UniformConstant 
					                                             %105 = OpTypeSampledImage %97 
					                              Private f32_3* %111 = OpVariable Private 
					                              Private f32_4* %119 = OpVariable Private 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                       f32_4 %123 = OpConstantComposite %79 %122 %122 %79 
					                              Private f32_3* %125 = OpVariable Private 
					                              Private f32_3* %133 = OpVariable Private 
					                                         u32 %174 = OpConstant 1 
					                                         i32 %177 = OpConstant 5 
					                                         i32 %187 = OpConstant 6 
					                                         i32 %197 = OpConstant 7 
					                                         i32 %207 = OpConstant 8 
					                                         u32 %215 = OpConstant 2 
					                                         i32 %218 = OpConstant 9 
					                                         i32 %228 = OpConstant 10 
					                                         i32 %238 = OpConstant 11 
					                                         i32 %248 = OpConstant 12 
					                                         i32 %258 = OpConstant 0 
					                                         f32 %265 = OpConstant 3,674022E-40 
					                                       f32_2 %266 = OpConstantComposite %265 %265 
					                              Private f32_3* %273 = OpVariable Private 
					        UniformConstant read_only Texture2D* %274 = OpVariable UniformConstant 
					                    UniformConstant sampler* %276 = OpVariable UniformConstant 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                       f32_3 %290 = OpConstantComposite %289 %289 %289 
					                                             %294 = OpTypePointer Output %7 
					                               Output f32_4* %295 = OpVariable Output 
					                                             %301 = OpTypePointer Output %6 
					                                         f32 %307 = OpConstant 3,674022E-40 
					                                         u32 %308 = OpConstant 3 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                 Uniform f32* %19 = OpAccessChain %12 %18 
					                                          f32 %20 = OpLoad %19 
					                                          f32 %21 = OpFAdd %17 %20 
					                                 Private f32* %25 = OpAccessChain %9 %23 
					                                                      OpStore %25 %21 
					                                 Private f32* %26 = OpAccessChain %9 %23 
					                                          f32 %27 = OpLoad %26 
					                                 Uniform f32* %29 = OpAccessChain %12 %28 
					                                          f32 %30 = OpLoad %29 
					                                          f32 %31 = OpFAdd %27 %30 
					                                 Private f32* %32 = OpAccessChain %9 %23 
					                                                      OpStore %32 %31 
					                                 Private f32* %33 = OpAccessChain %9 %23 
					                                          f32 %34 = OpLoad %33 
					                                 Uniform f32* %36 = OpAccessChain %12 %35 
					                                          f32 %37 = OpLoad %36 
					                                          f32 %38 = OpFAdd %34 %37 
					                                 Private f32* %39 = OpAccessChain %9 %23 
					                                                      OpStore %39 %38 
					                                 Private f32* %40 = OpAccessChain %9 %23 
					                                          f32 %41 = OpLoad %40 
					                                          f32 %43 = OpFMul %41 %42 
					                                          f32 %45 = OpFAdd %43 %44 
					                                 Private f32* %46 = OpAccessChain %9 %23 
					                                                      OpStore %46 %45 
					                                        f32_2 %53 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %56 = OpAccessChain %12 %54 
					                                        f32_4 %57 = OpLoad %56 
					                                        f32_2 %58 = OpVectorShuffle %57 %57 0 1 
					                                        f32_2 %59 = OpFMul %53 %58 
					                               Uniform f32_4* %60 = OpAccessChain %12 %54 
					                                        f32_4 %61 = OpLoad %60 
					                                        f32_2 %62 = OpVectorShuffle %61 %61 2 3 
					                                        f32_2 %63 = OpFAdd %59 %62 
					                                        f32_3 %64 = OpLoad %49 
					                                        f32_3 %65 = OpVectorShuffle %64 %63 3 4 2 
					                                                      OpStore %49 %65 
					                                        f32_3 %67 = OpLoad %49 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                        f32_2 %71 = OpFAdd %68 %70 
					                                        f32_3 %72 = OpLoad %66 
					                                        f32_3 %73 = OpVectorShuffle %72 %71 3 4 2 
					                                                      OpStore %66 %73 
					                                        f32_3 %74 = OpLoad %66 
					                                        f32_2 %75 = OpVectorShuffle %74 %74 0 1 
					                                        f32_2 %78 = OpFMul %75 %77 
					                                        f32_2 %81 = OpFAdd %78 %80 
					                                        f32_3 %82 = OpLoad %66 
					                                        f32_3 %83 = OpVectorShuffle %82 %81 3 4 2 
					                                                      OpStore %66 %83 
					                                        f32_3 %84 = OpLoad %66 
					                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                                        f32_4 %86 = OpLoad %9 
					                                        f32_2 %87 = OpVectorShuffle %86 %86 0 0 
					                                        f32_2 %88 = OpFDiv %85 %87 
					                                        f32_4 %89 = OpLoad %9 
					                                        f32_4 %90 = OpVectorShuffle %89 %88 4 1 2 5 
					                                                      OpStore %9 %90 
					                                        f32_4 %91 = OpLoad %9 
					                                        f32_2 %92 = OpVectorShuffle %91 %91 0 3 
					                                        f32_2 %93 = OpFAdd %92 %80 
					                                        f32_3 %94 = OpLoad %66 
					                                        f32_3 %95 = OpVectorShuffle %94 %93 3 4 2 
					                                                      OpStore %66 %95 
					                         read_only Texture2D %100 = OpLoad %99 
					                                     sampler %104 = OpLoad %103 
					                  read_only Texture2DSampled %106 = OpSampledImage %100 %104 
					                                       f32_3 %107 = OpLoad %66 
					                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
					                                       f32_4 %109 = OpImageSampleImplicitLod %106 %108 
					                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
					                                                      OpStore %96 %110 
					                         read_only Texture2D %112 = OpLoad %99 
					                                     sampler %113 = OpLoad %103 
					                  read_only Texture2DSampled %114 = OpSampledImage %112 %113 
					                                       f32_4 %115 = OpLoad %9 
					                                       f32_2 %116 = OpVectorShuffle %115 %115 0 3 
					                                       f32_4 %117 = OpImageSampleImplicitLod %114 %116 
					                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
					                                                      OpStore %111 %118 
					                                       f32_4 %120 = OpLoad %9 
					                                       f32_4 %121 = OpVectorShuffle %120 %120 0 3 0 3 
					                                       f32_4 %124 = OpFAdd %121 %123 
					                                                      OpStore %119 %124 
					                         read_only Texture2D %126 = OpLoad %99 
					                                     sampler %127 = OpLoad %103 
					                  read_only Texture2DSampled %128 = OpSampledImage %126 %127 
					                                       f32_4 %129 = OpLoad %119 
					                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                       f32_4 %131 = OpImageSampleImplicitLod %128 %130 
					                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                                      OpStore %125 %132 
					                         read_only Texture2D %134 = OpLoad %99 
					                                     sampler %135 = OpLoad %103 
					                  read_only Texture2DSampled %136 = OpSampledImage %134 %135 
					                                       f32_4 %137 = OpLoad %119 
					                                       f32_2 %138 = OpVectorShuffle %137 %137 2 3 
					                                       f32_4 %139 = OpImageSampleImplicitLod %136 %138 
					                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
					                                                      OpStore %133 %140 
					                                Private f32* %141 = OpAccessChain %125 %23 
					                                         f32 %142 = OpLoad %141 
					                                Uniform f32* %143 = OpAccessChain %12 %18 
					                                         f32 %144 = OpLoad %143 
					                                         f32 %145 = OpFMul %142 %144 
					                                Private f32* %146 = OpAccessChain %9 %23 
					                                                      OpStore %146 %145 
					                                Private f32* %147 = OpAccessChain %111 %23 
					                                         f32 %148 = OpLoad %147 
					                                Uniform f32* %149 = OpAccessChain %12 %14 
					                                         f32 %150 = OpLoad %149 
					                                         f32 %151 = OpFMul %148 %150 
					                                Private f32* %152 = OpAccessChain %9 %23 
					                                         f32 %153 = OpLoad %152 
					                                         f32 %154 = OpFAdd %151 %153 
					                                Private f32* %155 = OpAccessChain %9 %23 
					                                                      OpStore %155 %154 
					                                Private f32* %156 = OpAccessChain %133 %23 
					                                         f32 %157 = OpLoad %156 
					                                Uniform f32* %158 = OpAccessChain %12 %28 
					                                         f32 %159 = OpLoad %158 
					                                         f32 %160 = OpFMul %157 %159 
					                                Private f32* %161 = OpAccessChain %9 %23 
					                                         f32 %162 = OpLoad %161 
					                                         f32 %163 = OpFAdd %160 %162 
					                                Private f32* %164 = OpAccessChain %9 %23 
					                                                      OpStore %164 %163 
					                                Private f32* %165 = OpAccessChain %96 %23 
					                                         f32 %166 = OpLoad %165 
					                                Uniform f32* %167 = OpAccessChain %12 %35 
					                                         f32 %168 = OpLoad %167 
					                                         f32 %169 = OpFMul %166 %168 
					                                Private f32* %170 = OpAccessChain %9 %23 
					                                         f32 %171 = OpLoad %170 
					                                         f32 %172 = OpFAdd %169 %171 
					                                Private f32* %173 = OpAccessChain %9 %23 
					                                                      OpStore %173 %172 
					                                Private f32* %175 = OpAccessChain %111 %174 
					                                         f32 %176 = OpLoad %175 
					                                Uniform f32* %178 = OpAccessChain %12 %177 
					                                         f32 %179 = OpLoad %178 
					                                         f32 %180 = OpFMul %176 %179 
					                                Private f32* %181 = OpAccessChain %9 %23 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpFAdd %180 %182 
					                                Private f32* %184 = OpAccessChain %9 %23 
					                                                      OpStore %184 %183 
					                                Private f32* %185 = OpAccessChain %125 %174 
					                                         f32 %186 = OpLoad %185 
					                                Uniform f32* %188 = OpAccessChain %12 %187 
					                                         f32 %189 = OpLoad %188 
					                                         f32 %190 = OpFMul %186 %189 
					                                Private f32* %191 = OpAccessChain %9 %23 
					                                         f32 %192 = OpLoad %191 
					                                         f32 %193 = OpFAdd %190 %192 
					                                Private f32* %194 = OpAccessChain %9 %23 
					                                                      OpStore %194 %193 
					                                Private f32* %195 = OpAccessChain %133 %174 
					                                         f32 %196 = OpLoad %195 
					                                Uniform f32* %198 = OpAccessChain %12 %197 
					                                         f32 %199 = OpLoad %198 
					                                         f32 %200 = OpFMul %196 %199 
					                                Private f32* %201 = OpAccessChain %9 %23 
					                                         f32 %202 = OpLoad %201 
					                                         f32 %203 = OpFAdd %200 %202 
					                                Private f32* %204 = OpAccessChain %9 %23 
					                                                      OpStore %204 %203 
					                                Private f32* %205 = OpAccessChain %96 %174 
					                                         f32 %206 = OpLoad %205 
					                                Uniform f32* %208 = OpAccessChain %12 %207 
					                                         f32 %209 = OpLoad %208 
					                                         f32 %210 = OpFMul %206 %209 
					                                Private f32* %211 = OpAccessChain %9 %23 
					                                         f32 %212 = OpLoad %211 
					                                         f32 %213 = OpFAdd %210 %212 
					                                Private f32* %214 = OpAccessChain %9 %23 
					                                                      OpStore %214 %213 
					                                Private f32* %216 = OpAccessChain %111 %215 
					                                         f32 %217 = OpLoad %216 
					                                Uniform f32* %219 = OpAccessChain %12 %218 
					                                         f32 %220 = OpLoad %219 
					                                         f32 %221 = OpFMul %217 %220 
					                                Private f32* %222 = OpAccessChain %9 %23 
					                                         f32 %223 = OpLoad %222 
					                                         f32 %224 = OpFAdd %221 %223 
					                                Private f32* %225 = OpAccessChain %9 %23 
					                                                      OpStore %225 %224 
					                                Private f32* %226 = OpAccessChain %125 %215 
					                                         f32 %227 = OpLoad %226 
					                                Uniform f32* %229 = OpAccessChain %12 %228 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFMul %227 %230 
					                                Private f32* %232 = OpAccessChain %9 %23 
					                                         f32 %233 = OpLoad %232 
					                                         f32 %234 = OpFAdd %231 %233 
					                                Private f32* %235 = OpAccessChain %9 %23 
					                                                      OpStore %235 %234 
					                                Private f32* %236 = OpAccessChain %133 %215 
					                                         f32 %237 = OpLoad %236 
					                                Uniform f32* %239 = OpAccessChain %12 %238 
					                                         f32 %240 = OpLoad %239 
					                                         f32 %241 = OpFMul %237 %240 
					                                Private f32* %242 = OpAccessChain %9 %23 
					                                         f32 %243 = OpLoad %242 
					                                         f32 %244 = OpFAdd %241 %243 
					                                Private f32* %245 = OpAccessChain %9 %23 
					                                                      OpStore %245 %244 
					                                Private f32* %246 = OpAccessChain %96 %215 
					                                         f32 %247 = OpLoad %246 
					                                Uniform f32* %249 = OpAccessChain %12 %248 
					                                         f32 %250 = OpLoad %249 
					                                         f32 %251 = OpFMul %247 %250 
					                                Private f32* %252 = OpAccessChain %9 %23 
					                                         f32 %253 = OpLoad %252 
					                                         f32 %254 = OpFAdd %251 %253 
					                                Private f32* %255 = OpAccessChain %9 %23 
					                                                      OpStore %255 %254 
					                                Private f32* %256 = OpAccessChain %9 %23 
					                                         f32 %257 = OpLoad %256 
					                                Uniform f32* %259 = OpAccessChain %12 %258 
					                                         f32 %260 = OpLoad %259 
					                                         f32 %261 = OpFMul %257 %260 
					                                Private f32* %262 = OpAccessChain %66 %23 
					                                                      OpStore %262 %261 
					                                       f32_3 %263 = OpLoad %66 
					                                       f32_2 %264 = OpVectorShuffle %263 %263 0 0 
					                                       f32_2 %267 = OpFMul %264 %266 
					                                       f32_3 %268 = OpLoad %49 
					                                       f32_2 %269 = OpVectorShuffle %268 %268 0 1 
					                                       f32_2 %270 = OpFAdd %267 %269 
					                                       f32_4 %271 = OpLoad %9 
					                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 2 3 
					                                                      OpStore %9 %272 
					                         read_only Texture2D %275 = OpLoad %274 
					                                     sampler %277 = OpLoad %276 
					                  read_only Texture2DSampled %278 = OpSampledImage %275 %277 
					                                       f32_4 %279 = OpLoad %9 
					                                       f32_2 %280 = OpVectorShuffle %279 %279 0 1 
					                                       f32_4 %281 = OpImageSampleImplicitLod %278 %280 
					                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
					                                                      OpStore %273 %282 
					                                       f32_3 %283 = OpLoad %273 
					                                       f32_2 %284 = OpVectorShuffle %283 %283 1 2 
					                                       f32_3 %285 = OpLoad %66 
					                                       f32_3 %286 = OpVectorShuffle %285 %284 0 3 4 
					                                                      OpStore %66 %286 
					                                       f32_3 %287 = OpLoad %66 
					                                       f32_3 %288 = OpVectorShuffle %287 %287 0 0 0 
					                                       f32_3 %291 = OpFMul %288 %290 
					                                       f32_3 %292 = OpLoad %66 
					                                       f32_3 %293 = OpFAdd %291 %292 
					                                                      OpStore %49 %293 
					                                Private f32* %296 = OpAccessChain %273 %23 
					                                         f32 %297 = OpLoad %296 
					                                Private f32* %298 = OpAccessChain %49 %23 
					                                         f32 %299 = OpLoad %298 
					                                         f32 %300 = OpFAdd %297 %299 
					                                 Output f32* %302 = OpAccessChain %295 %23 
					                                                      OpStore %302 %300 
					                                       f32_3 %303 = OpLoad %49 
					                                       f32_2 %304 = OpVectorShuffle %303 %303 1 2 
					                                       f32_4 %305 = OpLoad %295 
					                                       f32_4 %306 = OpVectorShuffle %305 %304 0 4 5 3 
					                                                      OpStore %295 %306 
					                                 Output f32* %309 = OpAccessChain %295 %308 
					                                                      OpStore %309 %307 
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
						float _Value3;
						float _Value4;
						float _Value5;
						float _Value6;
						float _Value7;
						float _Value8;
						float _Value9;
						float _Value10;
						float _Value11;
						float _Value12;
						float _Value13;
						vec4 unused_0_14[2];
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					void main()
					{
					    u_xlat0.x = _Value2 + _Value3;
					    u_xlat0.x = u_xlat0.x + _Value4;
					    u_xlat0.x = u_xlat0.x + _Value5;
					    u_xlat0.x = u_xlat0.x * 0.00100000005 + 2.0;
					    u_xlat5.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat5.xy + vec2(-0.5, -0.5);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + vec2(0.5, 0.5);
					    u_xlat0.xw = u_xlat1.xy / u_xlat0.xx;
					    u_xlat1.xy = u_xlat0.xw + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat10_2 = texture(_MainTex2, u_xlat0.xw);
					    u_xlat3 = u_xlat0.xwxw + vec4(0.5, 0.0, 0.0, 0.5);
					    u_xlat10_4 = texture(_MainTex2, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex2, u_xlat3.zw);
					    u_xlat0.x = u_xlat10_4.x * _Value3;
					    u_xlat0.x = u_xlat10_2.x * _Value2 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.x * _Value4 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_1.x * _Value5 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.y * _Value6 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_4.y * _Value7 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.y * _Value8 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_1.y * _Value9 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.z * _Value10 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_4.z * _Value11 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.z * _Value12 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_1.z * _Value13 + u_xlat0.x;
					    u_xlat1.x = u_xlat0.x * _Value;
					    u_xlat0.xy = u_xlat1.xx * vec2(0.0625, 0.0625) + u_xlat5.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.yz = u_xlat10_0.yz;
					    u_xlat5.xyz = u_xlat1.xxx * vec3(0.00390625, 0.00390625, 0.00390625) + u_xlat1.xyz;
					    SV_Target0.x = u_xlat10_0.x + u_xlat5.x;
					    SV_Target0.yz = u_xlat5.yz;
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