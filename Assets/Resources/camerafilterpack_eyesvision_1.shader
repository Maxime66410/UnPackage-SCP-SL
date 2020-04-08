Shader "CameraFilterPack/EyesVision_1" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 3267
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec2 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					float u_xlat6;
					vec2 u_xlat7;
					float u_xlat9;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = _TimeX * _Value3;
					    u_xlat0 = trunc(u_xlat0);
					    u_xlat3.x = u_xlat0 * 2.0 + 23.0;
					    u_xlat0 = u_xlat0 + u_xlat0;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat3.x);
					    u_xlat3.x = dot(vec2(u_xlat0), vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat3.x);
					    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat1.xy * vec2(-0.0240000002, 0.0160000008) + u_xlat3.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + vec2(0.075000003, 0.0500000007);
					    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_Value, _Value));
					    u_xlat7.xy = vec2(vec2(_Value2, _Value2)) * vec2(_TimeX) + u_xlat7.xy;
					    u_xlat9 = cos(u_xlat7.y);
					    u_xlat7.x = sin(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 0.5 + 1.0;
					    u_xlat9 = u_xlat9 * 0.5 + 1.0;
					    u_xlat10 = sin(u_xlat9);
					    u_xlat2.x = u_xlat10 + u_xlat7.x;
					    u_xlat7.x = cos(u_xlat7.x);
					    u_xlat2.y = u_xlat9 + u_xlat7.x;
					    u_xlat1.xy = u_xlat2.xy * vec2(0.0199999996, 0.0199999996) + u_xlat1.xy;
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat3.xy = u_xlat10_1.xy * vec2(0.125, 0.125) + u_xlat3.xy;
					    u_xlat9 = (-u_xlat3.y) + 0.5;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(0.0799999982, 0.0799999982, -0.0299999993);
					    u_xlat3.x = dot(vec2(u_xlat9), vec2(u_xlat9));
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat6 = _TimeX * 0.5;
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat0 = (-u_xlat6) * u_xlat0 + u_xlat0;
					    u_xlat0 = (-u_xlat0) + u_xlat3.x;
					    u_xlat0 = u_xlat0 * -1.66666663;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = (-u_xlat3.x) * u_xlat0 + 1.0;
					    u_xlat0 = u_xlat0 * _Value4;
					    SV_Target0.xyz = vec3(u_xlat0) * (-u_xlat16_1.xyz) + u_xlat16_1.xyz;
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
					; Bound: 309
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %77 %295 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpMemberDecorate %11 5 Offset 11 
					                                                      OpMemberDecorate %11 6 RelaxedPrecision 
					                                                      OpMemberDecorate %11 6 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 77 
					                                                      OpDecorate %82 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %199 DescriptorSet 199 
					                                                      OpDecorate %199 Binding 199 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %203 DescriptorSet 203 
					                                                      OpDecorate %203 Binding 203 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %222 DescriptorSet 222 
					                                                      OpDecorate %222 Binding 222 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %224 RelaxedPrecision 
					                                                      OpDecorate %224 DescriptorSet 224 
					                                                      OpDecorate %224 Binding 224 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %232 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %295 Location 295 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypePointer Private %6 
					                                  Private f32* %8 = OpVariable Private 
					                                               %9 = OpTypeVector %6 2 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %9 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 0 
					                                              %16 = OpTypePointer Uniform %6 
					                                          i32 %19 = OpConstant 3 
					                                              %25 = OpTypePointer Private %9 
					                               Private f32_2* %26 = OpVariable Private 
					                                          f32 %28 = OpConstant 3,674022E-40 
					                                          f32 %30 = OpConstant 3,674022E-40 
					                                              %32 = OpTypeInt 32 0 
					                                          u32 %33 = OpConstant 0 
					                                          f32 %40 = OpConstant 3,674022E-40 
					                                          f32 %41 = OpConstant 3,674022E-40 
					                                        f32_2 %42 = OpConstantComposite %40 %41 
					                                          f32 %51 = OpConstant 3,674022E-40 
					                               Private f32_2* %54 = OpVariable Private 
					                                          u32 %58 = OpConstant 1 
					                                              %76 = OpTypePointer Input %9 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %79 = OpConstant 6 
					                                              %80 = OpTypePointer Uniform %10 
					                                          f32 %90 = OpConstant 3,674022E-40 
					                                          f32 %91 = OpConstant 3,674022E-40 
					                                        f32_2 %92 = OpConstantComposite %90 %91 
					                                          f32 %97 = OpConstant 3,674022E-40 
					                                        f32_2 %98 = OpConstantComposite %97 %97 
					                                         f32 %100 = OpConstant 3,674022E-40 
					                                         f32 %101 = OpConstant 3,674022E-40 
					                                       f32_2 %102 = OpConstantComposite %100 %101 
					                                             %104 = OpTypeBool 
					                                             %105 = OpTypePointer Private %104 
					                               Private bool* %106 = OpVariable Private 
					                                         i32 %107 = OpConstant 5 
					                                         f32 %110 = OpConstant 3,674022E-40 
					                              Private f32_2* %112 = OpVariable Private 
					                                         f32 %115 = OpConstant 3,674022E-40 
					                                       f32_2 %116 = OpConstantComposite %115 %115 
					                                             %119 = OpTypePointer Function %9 
					                                         i32 %128 = OpConstant 1 
					                                         i32 %138 = OpConstant 2 
					                                Private f32* %153 = OpVariable Private 
					                                         f32 %163 = OpConstant 3,674022E-40 
					                                Private f32* %170 = OpVariable Private 
					                              Private f32_2* %173 = OpVariable Private 
					                                         f32 %189 = OpConstant 3,674022E-40 
					                                       f32_2 %190 = OpConstantComposite %189 %189 
					                                             %194 = OpTypeVector %6 3 
					                                             %195 = OpTypePointer Private %194 
					                              Private f32_3* %196 = OpVariable Private 
					                                             %197 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %198 = OpTypePointer UniformConstant %197 
					        UniformConstant read_only Texture2D* %199 = OpVariable UniformConstant 
					                                             %201 = OpTypeSampler 
					                                             %202 = OpTypePointer UniformConstant %201 
					                    UniformConstant sampler* %203 = OpVariable UniformConstant 
					                                             %205 = OpTypeSampledImage %197 
					                                         f32 %212 = OpConstant 3,674022E-40 
					                                       f32_2 %213 = OpConstantComposite %212 %212 
					                              Private f32_3* %221 = OpVariable Private 
					        UniformConstant read_only Texture2D* %222 = OpVariable UniformConstant 
					                    UniformConstant sampler* %224 = OpVariable UniformConstant 
					                              Private f32_3* %230 = OpVariable Private 
					                                         f32 %235 = OpConstant 3,674022E-40 
					                                         f32 %236 = OpConstant 3,674022E-40 
					                                       f32_3 %237 = OpConstantComposite %235 %235 %236 
					                                Private f32* %249 = OpVariable Private 
					                                         f32 %270 = OpConstant 3,674022E-40 
					                                         f32 %275 = OpConstant 3,674022E-40 
					                                         f32 %277 = OpConstant 3,674022E-40 
					                                         i32 %290 = OpConstant 4 
					                                             %294 = OpTypePointer Output %10 
					                               Output f32_4* %295 = OpVariable Output 
					                                         u32 %305 = OpConstant 3 
					                                             %306 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                             Function f32_2* %120 = OpVariable Function 
					                                 Uniform f32* %17 = OpAccessChain %13 %15 
					                                          f32 %18 = OpLoad %17 
					                                 Uniform f32* %20 = OpAccessChain %13 %19 
					                                          f32 %21 = OpLoad %20 
					                                          f32 %22 = OpFMul %18 %21 
					                                                      OpStore %8 %22 
					                                          f32 %23 = OpLoad %8 
					                                          f32 %24 = OpExtInst %1 3 %23 
					                                                      OpStore %8 %24 
					                                          f32 %27 = OpLoad %8 
					                                          f32 %29 = OpFMul %27 %28 
					                                          f32 %31 = OpFAdd %29 %30 
					                                 Private f32* %34 = OpAccessChain %26 %33 
					                                                      OpStore %34 %31 
					                                          f32 %35 = OpLoad %8 
					                                          f32 %36 = OpLoad %8 
					                                          f32 %37 = OpFAdd %35 %36 
					                                                      OpStore %8 %37 
					                                        f32_2 %38 = OpLoad %26 
					                                        f32_2 %39 = OpVectorShuffle %38 %38 0 0 
					                                          f32 %43 = OpDot %39 %42 
					                                 Private f32* %44 = OpAccessChain %26 %33 
					                                                      OpStore %44 %43 
					                                 Private f32* %45 = OpAccessChain %26 %33 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %47 = OpExtInst %1 13 %46 
					                                 Private f32* %48 = OpAccessChain %26 %33 
					                                                      OpStore %48 %47 
					                                 Private f32* %49 = OpAccessChain %26 %33 
					                                          f32 %50 = OpLoad %49 
					                                          f32 %52 = OpFMul %50 %51 
					                                 Private f32* %53 = OpAccessChain %26 %33 
					                                                      OpStore %53 %52 
					                                 Private f32* %55 = OpAccessChain %26 %33 
					                                          f32 %56 = OpLoad %55 
					                                          f32 %57 = OpExtInst %1 10 %56 
					                                 Private f32* %59 = OpAccessChain %54 %58 
					                                                      OpStore %59 %57 
					                                          f32 %60 = OpLoad %8 
					                                        f32_2 %61 = OpCompositeConstruct %60 %60 
					                                          f32 %62 = OpDot %61 %42 
					                                 Private f32* %63 = OpAccessChain %26 %33 
					                                                      OpStore %63 %62 
					                                 Private f32* %64 = OpAccessChain %26 %33 
					                                          f32 %65 = OpLoad %64 
					                                          f32 %66 = OpExtInst %1 13 %65 
					                                 Private f32* %67 = OpAccessChain %26 %33 
					                                                      OpStore %67 %66 
					                                 Private f32* %68 = OpAccessChain %26 %33 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpFMul %69 %51 
					                                 Private f32* %71 = OpAccessChain %26 %33 
					                                                      OpStore %71 %70 
					                                 Private f32* %72 = OpAccessChain %26 %33 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpExtInst %1 10 %73 
					                                 Private f32* %75 = OpAccessChain %54 %33 
					                                                      OpStore %75 %74 
					                                        f32_2 %78 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %81 = OpAccessChain %13 %79 
					                                        f32_4 %82 = OpLoad %81 
					                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
					                                        f32_2 %84 = OpFMul %78 %83 
					                               Uniform f32_4* %85 = OpAccessChain %13 %79 
					                                        f32_4 %86 = OpLoad %85 
					                                        f32_2 %87 = OpVectorShuffle %86 %86 2 3 
					                                        f32_2 %88 = OpFAdd %84 %87 
					                                                      OpStore %26 %88 
					                                        f32_2 %89 = OpLoad %54 
					                                        f32_2 %93 = OpFMul %89 %92 
					                                        f32_2 %94 = OpLoad %26 
					                                        f32_2 %95 = OpFAdd %93 %94 
					                                                      OpStore %54 %95 
					                                        f32_2 %96 = OpLoad %54 
					                                        f32_2 %99 = OpFMul %96 %98 
					                                       f32_2 %103 = OpFAdd %99 %102 
					                                                      OpStore %54 %103 
					                                Uniform f32* %108 = OpAccessChain %13 %107 %58 
					                                         f32 %109 = OpLoad %108 
					                                        bool %111 = OpFOrdLessThan %109 %110 
					                                                      OpStore %106 %111 
					                                       f32_2 %113 = OpLoad %26 
					                                       f32_2 %114 = OpFNegate %113 
					                                       f32_2 %117 = OpFAdd %114 %116 
					                                                      OpStore %112 %117 
					                                        bool %118 = OpLoad %106 
					                                                      OpSelectionMerge %122 None 
					                                                      OpBranchConditional %118 %121 %124 
					                                             %121 = OpLabel 
					                                       f32_2 %123 = OpLoad %112 
					                                                      OpStore %120 %123 
					                                                      OpBranch %122 
					                                             %124 = OpLabel 
					                                       f32_2 %125 = OpLoad %26 
					                                                      OpStore %120 %125 
					                                                      OpBranch %122 
					                                             %122 = OpLabel 
					                                       f32_2 %126 = OpLoad %120 
					                                                      OpStore %112 %126 
					                                       f32_2 %127 = OpLoad %112 
					                                Uniform f32* %129 = OpAccessChain %13 %128 
					                                         f32 %130 = OpLoad %129 
					                                Uniform f32* %131 = OpAccessChain %13 %128 
					                                         f32 %132 = OpLoad %131 
					                                       f32_2 %133 = OpCompositeConstruct %130 %132 
					                                         f32 %134 = OpCompositeExtract %133 0 
					                                         f32 %135 = OpCompositeExtract %133 1 
					                                       f32_2 %136 = OpCompositeConstruct %134 %135 
					                                       f32_2 %137 = OpFMul %127 %136 
					                                                      OpStore %112 %137 
					                                Uniform f32* %139 = OpAccessChain %13 %138 
					                                         f32 %140 = OpLoad %139 
					                                Uniform f32* %141 = OpAccessChain %13 %138 
					                                         f32 %142 = OpLoad %141 
					                                       f32_2 %143 = OpCompositeConstruct %140 %142 
					                                         f32 %144 = OpCompositeExtract %143 0 
					                                         f32 %145 = OpCompositeExtract %143 1 
					                                       f32_2 %146 = OpCompositeConstruct %144 %145 
					                                Uniform f32* %147 = OpAccessChain %13 %15 
					                                         f32 %148 = OpLoad %147 
					                                       f32_2 %149 = OpCompositeConstruct %148 %148 
					                                       f32_2 %150 = OpFMul %146 %149 
					                                       f32_2 %151 = OpLoad %112 
					                                       f32_2 %152 = OpFAdd %150 %151 
					                                                      OpStore %112 %152 
					                                Private f32* %154 = OpAccessChain %112 %58 
					                                         f32 %155 = OpLoad %154 
					                                         f32 %156 = OpExtInst %1 14 %155 
					                                                      OpStore %153 %156 
					                                Private f32* %157 = OpAccessChain %112 %33 
					                                         f32 %158 = OpLoad %157 
					                                         f32 %159 = OpExtInst %1 13 %158 
					                                Private f32* %160 = OpAccessChain %112 %33 
					                                                      OpStore %160 %159 
					                                Private f32* %161 = OpAccessChain %112 %33 
					                                         f32 %162 = OpLoad %161 
					                                         f32 %164 = OpFMul %162 %163 
					                                         f32 %165 = OpFAdd %164 %115 
					                                Private f32* %166 = OpAccessChain %112 %33 
					                                                      OpStore %166 %165 
					                                         f32 %167 = OpLoad %153 
					                                         f32 %168 = OpFMul %167 %163 
					                                         f32 %169 = OpFAdd %168 %115 
					                                                      OpStore %153 %169 
					                                         f32 %171 = OpLoad %153 
					                                         f32 %172 = OpExtInst %1 13 %171 
					                                                      OpStore %170 %172 
					                                         f32 %174 = OpLoad %170 
					                                Private f32* %175 = OpAccessChain %112 %33 
					                                         f32 %176 = OpLoad %175 
					                                         f32 %177 = OpFAdd %174 %176 
					                                Private f32* %178 = OpAccessChain %173 %33 
					                                                      OpStore %178 %177 
					                                Private f32* %179 = OpAccessChain %112 %33 
					                                         f32 %180 = OpLoad %179 
					                                         f32 %181 = OpExtInst %1 14 %180 
					                                Private f32* %182 = OpAccessChain %112 %33 
					                                                      OpStore %182 %181 
					                                         f32 %183 = OpLoad %153 
					                                Private f32* %184 = OpAccessChain %112 %33 
					                                         f32 %185 = OpLoad %184 
					                                         f32 %186 = OpFAdd %183 %185 
					                                Private f32* %187 = OpAccessChain %173 %58 
					                                                      OpStore %187 %186 
					                                       f32_2 %188 = OpLoad %173 
					                                       f32_2 %191 = OpFMul %188 %190 
					                                       f32_2 %192 = OpLoad %54 
					                                       f32_2 %193 = OpFAdd %191 %192 
					                                                      OpStore %54 %193 
					                         read_only Texture2D %200 = OpLoad %199 
					                                     sampler %204 = OpLoad %203 
					                  read_only Texture2DSampled %206 = OpSampledImage %200 %204 
					                                       f32_2 %207 = OpLoad %54 
					                                       f32_4 %208 = OpImageSampleImplicitLod %206 %207 
					                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
					                                                      OpStore %196 %209 
					                                       f32_3 %210 = OpLoad %196 
					                                       f32_2 %211 = OpVectorShuffle %210 %210 0 1 
					                                       f32_2 %214 = OpFMul %211 %213 
					                                       f32_2 %215 = OpLoad %26 
					                                       f32_2 %216 = OpFAdd %214 %215 
					                                                      OpStore %26 %216 
					                                Private f32* %217 = OpAccessChain %26 %58 
					                                         f32 %218 = OpLoad %217 
					                                         f32 %219 = OpFNegate %218 
					                                         f32 %220 = OpFAdd %219 %163 
					                                                      OpStore %153 %220 
					                         read_only Texture2D %223 = OpLoad %222 
					                                     sampler %225 = OpLoad %224 
					                  read_only Texture2DSampled %226 = OpSampledImage %223 %225 
					                                       f32_2 %227 = OpLoad %26 
					                                       f32_4 %228 = OpImageSampleImplicitLod %226 %227 
					                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
					                                                      OpStore %221 %229 
					                                       f32_3 %231 = OpLoad %196 
					                                       f32_3 %232 = OpLoad %221 
					                                       f32_3 %233 = OpFAdd %231 %232 
					                                                      OpStore %230 %233 
					                                       f32_3 %234 = OpLoad %230 
					                                       f32_3 %238 = OpFAdd %234 %237 
					                                                      OpStore %230 %238 
					                                         f32 %239 = OpLoad %153 
					                                       f32_2 %240 = OpCompositeConstruct %239 %239 
					                                         f32 %241 = OpLoad %153 
					                                       f32_2 %242 = OpCompositeConstruct %241 %241 
					                                         f32 %243 = OpDot %240 %242 
					                                Private f32* %244 = OpAccessChain %26 %33 
					                                                      OpStore %244 %243 
					                                Private f32* %245 = OpAccessChain %26 %33 
					                                         f32 %246 = OpLoad %245 
					                                         f32 %247 = OpExtInst %1 31 %246 
					                                Private f32* %248 = OpAccessChain %26 %33 
					                                                      OpStore %248 %247 
					                                Uniform f32* %250 = OpAccessChain %13 %15 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpFMul %251 %163 
					                                                      OpStore %249 %252 
					                                         f32 %253 = OpLoad %249 
					                                         f32 %254 = OpExtInst %1 13 %253 
					                                                      OpStore %249 %254 
					                                         f32 %255 = OpLoad %249 
					                                         f32 %256 = OpLoad %249 
					                                         f32 %257 = OpFMul %255 %256 
					                                                      OpStore %249 %257 
					                                         f32 %258 = OpLoad %249 
					                                         f32 %259 = OpFNegate %258 
					                                         f32 %260 = OpLoad %8 
					                                         f32 %261 = OpFMul %259 %260 
					                                         f32 %262 = OpLoad %8 
					                                         f32 %263 = OpFAdd %261 %262 
					                                                      OpStore %8 %263 
					                                         f32 %264 = OpLoad %8 
					                                         f32 %265 = OpFNegate %264 
					                                Private f32* %266 = OpAccessChain %26 %33 
					                                         f32 %267 = OpLoad %266 
					                                         f32 %268 = OpFAdd %265 %267 
					                                                      OpStore %8 %268 
					                                         f32 %269 = OpLoad %8 
					                                         f32 %271 = OpFMul %269 %270 
					                                                      OpStore %8 %271 
					                                         f32 %272 = OpLoad %8 
					                                         f32 %273 = OpExtInst %1 43 %272 %110 %115 
					                                                      OpStore %8 %273 
					                                         f32 %274 = OpLoad %8 
					                                         f32 %276 = OpFMul %274 %275 
					                                         f32 %278 = OpFAdd %276 %277 
					                                Private f32* %279 = OpAccessChain %26 %33 
					                                                      OpStore %279 %278 
					                                         f32 %280 = OpLoad %8 
					                                         f32 %281 = OpLoad %8 
					                                         f32 %282 = OpFMul %280 %281 
					                                                      OpStore %8 %282 
					                                Private f32* %283 = OpAccessChain %26 %33 
					                                         f32 %284 = OpLoad %283 
					                                         f32 %285 = OpFNegate %284 
					                                         f32 %286 = OpLoad %8 
					                                         f32 %287 = OpFMul %285 %286 
					                                         f32 %288 = OpFAdd %287 %115 
					                                                      OpStore %8 %288 
					                                         f32 %289 = OpLoad %8 
					                                Uniform f32* %291 = OpAccessChain %13 %290 
					                                         f32 %292 = OpLoad %291 
					                                         f32 %293 = OpFMul %289 %292 
					                                                      OpStore %8 %293 
					                                         f32 %296 = OpLoad %8 
					                                       f32_3 %297 = OpCompositeConstruct %296 %296 %296 
					                                       f32_3 %298 = OpLoad %230 
					                                       f32_3 %299 = OpFNegate %298 
					                                       f32_3 %300 = OpFMul %297 %299 
					                                       f32_3 %301 = OpLoad %230 
					                                       f32_3 %302 = OpFAdd %300 %301 
					                                       f32_4 %303 = OpLoad %295 
					                                       f32_4 %304 = OpVectorShuffle %303 %302 4 5 6 3 
					                                                      OpStore %295 %304 
					                                 Output f32* %307 = OpAccessChain %295 %305 
					                                                      OpStore %307 %115 
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
						float _TimeX;
						float _Value;
						float _Value2;
						float _Value3;
						float _Value4;
						vec4 unused_0_6;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec2 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					float u_xlat6;
					vec2 u_xlat7;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = _TimeX * _Value3;
					    u_xlat0 = trunc(u_xlat0);
					    u_xlat3.x = u_xlat0 * 2.0 + 23.0;
					    u_xlat0 = u_xlat0 + u_xlat0;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat3.x);
					    u_xlat3.x = dot(vec2(u_xlat0), vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat3.x);
					    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat1.xy * vec2(-0.0240000002, 0.0160000008) + u_xlat3.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + vec2(0.075000003, 0.0500000007);
					    u_xlatb9 = _MainTex_TexelSize.y<0.0;
					    u_xlat7.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
					    u_xlat7.xy = (bool(u_xlatb9)) ? u_xlat7.xy : u_xlat3.xy;
					    u_xlat7.xy = u_xlat7.xy * vec2(vec2(_Value, _Value));
					    u_xlat7.xy = vec2(vec2(_Value2, _Value2)) * vec2(_TimeX) + u_xlat7.xy;
					    u_xlat9 = cos(u_xlat7.y);
					    u_xlat7.x = sin(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 0.5 + 1.0;
					    u_xlat9 = u_xlat9 * 0.5 + 1.0;
					    u_xlat10 = sin(u_xlat9);
					    u_xlat2.x = u_xlat10 + u_xlat7.x;
					    u_xlat7.x = cos(u_xlat7.x);
					    u_xlat2.y = u_xlat9 + u_xlat7.x;
					    u_xlat1.xy = u_xlat2.xy * vec2(0.0199999996, 0.0199999996) + u_xlat1.xy;
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat3.xy = u_xlat10_1.xy * vec2(0.125, 0.125) + u_xlat3.xy;
					    u_xlat9 = (-u_xlat3.y) + 0.5;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(0.0799999982, 0.0799999982, -0.0299999993);
					    u_xlat3.x = dot(vec2(u_xlat9), vec2(u_xlat9));
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat6 = _TimeX * 0.5;
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat0 = (-u_xlat6) * u_xlat0 + u_xlat0;
					    u_xlat0 = (-u_xlat0) + u_xlat3.x;
					    u_xlat0 = u_xlat0 * -1.66666663;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = (-u_xlat3.x) * u_xlat0 + 1.0;
					    u_xlat0 = u_xlat0 * _Value4;
					    SV_Target0.xyz = vec3(u_xlat0) * (-u_xlat16_1.xyz) + u_xlat16_1.xyz;
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