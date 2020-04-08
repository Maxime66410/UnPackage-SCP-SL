Shader "CameraFilterPack/Atmosphere_Rain" {
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
			GpuProgramID 22162
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
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform 	float _Value7;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D Texture2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec2 u_xlat10;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10.xy = u_xlat0.xy * vec2(vec2(_Value5, _Value5));
					    u_xlat10.x = _Value3 * u_xlat10.y + u_xlat10.x;
					    u_xlat1.x = u_xlat10.x * 3.0 + 0.100000001;
					    u_xlat2.x = u_xlat1.x * 0.649999976 + 0.100000001;
					    u_xlat10.x = _TimeX * _Value4;
					    u_xlat3.xyz = u_xlat10.xxx * vec3(0.800000012, 1.20000005, 0.400000006);
					    u_xlat1.y = u_xlat10.y * 3.0 + u_xlat3.x;
					    u_xlat2.y = u_xlat1.y * 0.649999976 + u_xlat10.x;
					    u_xlat10_1 = texture(Texture2, u_xlat1.xy);
					    u_xlat10.x = u_xlat10_1.x * _Value2;
					    u_xlat10_1 = texture(Texture2, u_xlat2.xy);
					    u_xlat4.x = u_xlat2.x * 0.649999976 + 0.100000001;
					    u_xlat4.y = u_xlat2.y * 0.649999976 + u_xlat3.y;
					    u_xlat15 = u_xlat10_1.x * _Value2;
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat10.x = u_xlat10.x * 0.300000012 + u_xlat15;
					    u_xlat10_1 = texture(Texture2, u_xlat4.xy);
					    u_xlat2.x = u_xlat4.x * 0.5 + 0.100000001;
					    u_xlat2.y = u_xlat4.y * 0.5 + u_xlat3.y;
					    u_xlat15 = u_xlat10_1.x * _Value2;
					    u_xlat10.x = u_xlat15 * 0.699999988 + u_xlat10.x;
					    u_xlat10_1 = texture(Texture2, u_xlat2.xy);
					    u_xlat4.x = u_xlat2.x * 0.400000006 + 0.100000001;
					    u_xlat4.y = u_xlat2.y * 0.400000006 + u_xlat3.y;
					    u_xlat2.x = u_xlat0.x * 0.00100000005 + u_xlat3.z;
					    u_xlat10_3 = texture(Texture2, u_xlat4.xy);
					    u_xlat15 = u_xlat10_3.x * _Value2;
					    u_xlat1.x = u_xlat10_1.x * _Value2;
					    u_xlat10.x = u_xlat1.x * 0.899999976 + u_xlat10.x;
					    u_xlat10.x = u_xlat15 * 0.899999976 + u_xlat10.x;
					    u_xlat1.xy = u_xlat10.xx * vec2(vec2(_Value6, _Value6)) + u_xlat0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0 = u_xlat10.xxxx + u_xlat10_1;
					    u_xlat0 = (-u_xlat10_3) + u_xlat0;
					    u_xlat0 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat0 + u_xlat10_3;
					    u_xlat2.y = 0.0;
					    u_xlat10_1 = texture(Texture2, u_xlat2.xy);
					    u_xlat1.x = u_xlat10_1.y * _Value2;
					    u_xlat1.x = u_xlat1.x * _Value7;
					    u_xlat0 = u_xlat1.xxxx * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + u_xlat0;
					    u_xlat0 = (-u_xlat10_3) + u_xlat0;
					    SV_Target0 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat0 + u_xlat10_3;
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
					; Bound: 392
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %28 %372 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpMemberDecorate %12 4 Offset 12 
					                                                      OpMemberDecorate %12 5 Offset 12 
					                                                      OpMemberDecorate %12 6 Offset 12 
					                                                      OpMemberDecorate %12 7 Offset 12 
					                                                      OpMemberDecorate %12 8 Offset 12 
					                                                      OpMemberDecorate %12 9 RelaxedPrecision 
					                                                      OpMemberDecorate %12 9 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 28 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %139 DescriptorSet 139 
					                                                      OpDecorate %139 Binding 139 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %143 DescriptorSet 143 
					                                                      OpDecorate %143 Binding 143 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %224 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %252 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %299 DescriptorSet 299 
					                                                      OpDecorate %299 Binding 299 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %301 DescriptorSet 301 
					                                                      OpDecorate %301 Binding 301 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %307 RelaxedPrecision 
					                                                      OpDecorate %308 RelaxedPrecision 
					                                                      OpDecorate %309 RelaxedPrecision 
					                                                      OpDecorate %315 RelaxedPrecision 
					                                                      OpDecorate %317 RelaxedPrecision 
					                                                      OpDecorate %318 RelaxedPrecision 
					                                                      OpDecorate %338 RelaxedPrecision 
					                                                      OpDecorate %341 RelaxedPrecision 
					                                                      OpDecorate %342 RelaxedPrecision 
					                                                      OpDecorate %346 RelaxedPrecision 
					                                                      OpDecorate %349 RelaxedPrecision 
					                                                      OpDecorate %367 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %372 Location 372 
					                                                      OpDecorate %389 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 2 
					                                              %11 = OpTypeVector %9 4 
					                                              %12 = OpTypeStruct %9 %9 %9 %9 %9 %9 %9 %9 %10 %11 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 8 
					                                              %17 = OpTypeInt 32 0 
					                                          u32 %18 = OpConstant 1 
					                                              %19 = OpTypePointer Uniform %9 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                              %24 = OpTypeVector %9 3 
					                                              %25 = OpTypePointer Private %24 
					                               Private f32_3* %26 = OpVariable Private 
					                                              %27 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %30 = OpConstant 9 
					                                              %31 = OpTypePointer Uniform %11 
					                                              %42 = OpTypePointer Private %10 
					                               Private f32_2* %43 = OpVariable Private 
					                                              %44 = OpTypePointer Private %9 
					                                          f32 %48 = OpConstant 3,674022E-40 
					                                          u32 %50 = OpConstant 0 
					                                              %53 = OpTypePointer Function %9 
					                                          u32 %63 = OpConstant 2 
					                                              %65 = OpTypePointer Private %11 
					                               Private f32_4* %66 = OpVariable Private 
					                                          i32 %69 = OpConstant 5 
					                                          i32 %81 = OpConstant 3 
					                               Private f32_2* %91 = OpVariable Private 
					                                          f32 %94 = OpConstant 3,674022E-40 
					                                          f32 %96 = OpConstant 3,674022E-40 
					                               Private f32_2* %99 = OpVariable Private 
					                                         f32 %102 = OpConstant 3,674022E-40 
					                                         i32 %106 = OpConstant 0 
					                                         i32 %109 = OpConstant 4 
					                              Private f32_3* %114 = OpVariable Private 
					                                         f32 %117 = OpConstant 3,674022E-40 
					                                         f32 %118 = OpConstant 3,674022E-40 
					                                         f32 %119 = OpConstant 3,674022E-40 
					                                       f32_3 %120 = OpConstantComposite %117 %118 %119 
					                                Private f32* %136 = OpVariable Private 
					                                             %137 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                             %138 = OpTypePointer UniformConstant %137 
					        UniformConstant read_only Texture2D* %139 = OpVariable UniformConstant 
					                                             %141 = OpTypeSampler 
					                                             %142 = OpTypePointer UniformConstant %141 
					                    UniformConstant sampler* %143 = OpVariable UniformConstant 
					                                             %145 = OpTypeSampledImage %137 
					                                         i32 %151 = OpConstant 2 
					                                Private f32* %156 = OpVariable Private 
					                                         f32 %182 = OpConstant 3,674022E-40 
					                                         f32 %187 = OpConstant 3,674022E-40 
					                                         f32 %218 = OpConstant 3,674022E-40 
					                                         f32 %245 = OpConstant 3,674022E-40 
					                                         f32 %270 = OpConstant 3,674022E-40 
					                                         i32 %285 = OpConstant 6 
					                              Private f32_4* %298 = OpVariable Private 
					        UniformConstant read_only Texture2D* %299 = OpVariable UniformConstant 
					                    UniformConstant sampler* %301 = OpVariable UniformConstant 
					                              Private f32_4* %307 = OpVariable Private 
					                                         i32 %321 = OpConstant 1 
					                                         i32 %356 = OpConstant 7 
					                                       f32_4 %363 = OpConstantComposite %270 %270 %270 %270 
					                                             %371 = OpTypePointer Output %11 
					                               Output f32_4* %372 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %54 = OpVariable Function 
					                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
					                                          f32 %21 = OpLoad %20 
					                                         bool %23 = OpFOrdLessThan %21 %22 
					                                                      OpStore %8 %23 
					                                        f32_2 %29 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %32 = OpAccessChain %14 %30 
					                                        f32_4 %33 = OpLoad %32 
					                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                        f32_2 %35 = OpFMul %29 %34 
					                               Uniform f32_4* %36 = OpAccessChain %14 %30 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
					                                        f32_2 %39 = OpFAdd %35 %38 
					                                        f32_3 %40 = OpLoad %26 
					                                        f32_3 %41 = OpVectorShuffle %40 %39 3 4 2 
					                                                      OpStore %26 %41 
					                                 Private f32* %45 = OpAccessChain %26 %18 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %47 = OpFNegate %46 
					                                          f32 %49 = OpFAdd %47 %48 
					                                 Private f32* %51 = OpAccessChain %43 %50 
					                                                      OpStore %51 %49 
					                                         bool %52 = OpLoad %8 
					                                                      OpSelectionMerge %56 None 
					                                                      OpBranchConditional %52 %55 %59 
					                                              %55 = OpLabel 
					                                 Private f32* %57 = OpAccessChain %43 %50 
					                                          f32 %58 = OpLoad %57 
					                                                      OpStore %54 %58 
					                                                      OpBranch %56 
					                                              %59 = OpLabel 
					                                 Private f32* %60 = OpAccessChain %26 %18 
					                                          f32 %61 = OpLoad %60 
					                                                      OpStore %54 %61 
					                                                      OpBranch %56 
					                                              %56 = OpLabel 
					                                          f32 %62 = OpLoad %54 
					                                 Private f32* %64 = OpAccessChain %26 %63 
					                                                      OpStore %64 %62 
					                                        f32_3 %67 = OpLoad %26 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 2 
					                                 Uniform f32* %70 = OpAccessChain %14 %69 
					                                          f32 %71 = OpLoad %70 
					                                 Uniform f32* %72 = OpAccessChain %14 %69 
					                                          f32 %73 = OpLoad %72 
					                                        f32_2 %74 = OpCompositeConstruct %71 %73 
					                                          f32 %75 = OpCompositeExtract %74 0 
					                                          f32 %76 = OpCompositeExtract %74 1 
					                                        f32_2 %77 = OpCompositeConstruct %75 %76 
					                                        f32_2 %78 = OpFMul %68 %77 
					                                        f32_4 %79 = OpLoad %66 
					                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 2 3 
					                                                      OpStore %66 %80 
					                                 Uniform f32* %82 = OpAccessChain %14 %81 
					                                          f32 %83 = OpLoad %82 
					                                 Private f32* %84 = OpAccessChain %66 %18 
					                                          f32 %85 = OpLoad %84 
					                                          f32 %86 = OpFMul %83 %85 
					                                 Private f32* %87 = OpAccessChain %66 %50 
					                                          f32 %88 = OpLoad %87 
					                                          f32 %89 = OpFAdd %86 %88 
					                                 Private f32* %90 = OpAccessChain %66 %50 
					                                                      OpStore %90 %89 
					                                 Private f32* %92 = OpAccessChain %66 %50 
					                                          f32 %93 = OpLoad %92 
					                                          f32 %95 = OpFMul %93 %94 
					                                          f32 %97 = OpFAdd %95 %96 
					                                 Private f32* %98 = OpAccessChain %91 %50 
					                                                      OpStore %98 %97 
					                                Private f32* %100 = OpAccessChain %91 %50 
					                                         f32 %101 = OpLoad %100 
					                                         f32 %103 = OpFMul %101 %102 
					                                         f32 %104 = OpFAdd %103 %96 
					                                Private f32* %105 = OpAccessChain %99 %50 
					                                                      OpStore %105 %104 
					                                Uniform f32* %107 = OpAccessChain %14 %106 
					                                         f32 %108 = OpLoad %107 
					                                Uniform f32* %110 = OpAccessChain %14 %109 
					                                         f32 %111 = OpLoad %110 
					                                         f32 %112 = OpFMul %108 %111 
					                                Private f32* %113 = OpAccessChain %66 %50 
					                                                      OpStore %113 %112 
					                                       f32_4 %115 = OpLoad %66 
					                                       f32_3 %116 = OpVectorShuffle %115 %115 0 0 0 
					                                       f32_3 %121 = OpFMul %116 %120 
					                                                      OpStore %114 %121 
					                                Private f32* %122 = OpAccessChain %66 %18 
					                                         f32 %123 = OpLoad %122 
					                                         f32 %124 = OpFMul %123 %94 
					                                Private f32* %125 = OpAccessChain %114 %50 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpFAdd %124 %126 
					                                Private f32* %128 = OpAccessChain %91 %18 
					                                                      OpStore %128 %127 
					                                Private f32* %129 = OpAccessChain %91 %18 
					                                         f32 %130 = OpLoad %129 
					                                         f32 %131 = OpFMul %130 %102 
					                                Private f32* %132 = OpAccessChain %66 %50 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFAdd %131 %133 
					                                Private f32* %135 = OpAccessChain %99 %18 
					                                                      OpStore %135 %134 
					                         read_only Texture2D %140 = OpLoad %139 
					                                     sampler %144 = OpLoad %143 
					                  read_only Texture2DSampled %146 = OpSampledImage %140 %144 
					                                       f32_2 %147 = OpLoad %91 
					                                       f32_4 %148 = OpImageSampleImplicitLod %146 %147 
					                                         f32 %149 = OpCompositeExtract %148 0 
					                                                      OpStore %136 %149 
					                                         f32 %150 = OpLoad %136 
					                                Uniform f32* %152 = OpAccessChain %14 %151 
					                                         f32 %153 = OpLoad %152 
					                                         f32 %154 = OpFMul %150 %153 
					                                Private f32* %155 = OpAccessChain %66 %50 
					                                                      OpStore %155 %154 
					                         read_only Texture2D %157 = OpLoad %139 
					                                     sampler %158 = OpLoad %143 
					                  read_only Texture2DSampled %159 = OpSampledImage %157 %158 
					                                       f32_2 %160 = OpLoad %99 
					                                       f32_4 %161 = OpImageSampleImplicitLod %159 %160 
					                                         f32 %162 = OpCompositeExtract %161 0 
					                                                      OpStore %156 %162 
					                                Private f32* %163 = OpAccessChain %99 %50 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpFMul %164 %102 
					                                         f32 %166 = OpFAdd %165 %96 
					                                Private f32* %167 = OpAccessChain %91 %50 
					                                                      OpStore %167 %166 
					                                Private f32* %168 = OpAccessChain %99 %18 
					                                         f32 %169 = OpLoad %168 
					                                         f32 %170 = OpFMul %169 %102 
					                                Private f32* %171 = OpAccessChain %114 %18 
					                                         f32 %172 = OpLoad %171 
					                                         f32 %173 = OpFAdd %170 %172 
					                                Private f32* %174 = OpAccessChain %91 %18 
					                                                      OpStore %174 %173 
					                                         f32 %175 = OpLoad %156 
					                                Uniform f32* %176 = OpAccessChain %14 %151 
					                                         f32 %177 = OpLoad %176 
					                                         f32 %178 = OpFMul %175 %177 
					                                Private f32* %179 = OpAccessChain %43 %50 
					                                                      OpStore %179 %178 
					                                Private f32* %180 = OpAccessChain %43 %50 
					                                         f32 %181 = OpLoad %180 
					                                         f32 %183 = OpFMul %181 %182 
					                                Private f32* %184 = OpAccessChain %43 %50 
					                                                      OpStore %184 %183 
					                                Private f32* %185 = OpAccessChain %66 %50 
					                                         f32 %186 = OpLoad %185 
					                                         f32 %188 = OpFMul %186 %187 
					                                Private f32* %189 = OpAccessChain %43 %50 
					                                         f32 %190 = OpLoad %189 
					                                         f32 %191 = OpFAdd %188 %190 
					                                Private f32* %192 = OpAccessChain %66 %50 
					                                                      OpStore %192 %191 
					                         read_only Texture2D %193 = OpLoad %139 
					                                     sampler %194 = OpLoad %143 
					                  read_only Texture2DSampled %195 = OpSampledImage %193 %194 
					                                       f32_2 %196 = OpLoad %91 
					                                       f32_4 %197 = OpImageSampleImplicitLod %195 %196 
					                                         f32 %198 = OpCompositeExtract %197 0 
					                                                      OpStore %156 %198 
					                                Private f32* %199 = OpAccessChain %91 %50 
					                                         f32 %200 = OpLoad %199 
					                                         f32 %201 = OpFMul %200 %182 
					                                         f32 %202 = OpFAdd %201 %96 
					                                Private f32* %203 = OpAccessChain %99 %50 
					                                                      OpStore %203 %202 
					                                Private f32* %204 = OpAccessChain %91 %18 
					                                         f32 %205 = OpLoad %204 
					                                         f32 %206 = OpFMul %205 %182 
					                                Private f32* %207 = OpAccessChain %114 %18 
					                                         f32 %208 = OpLoad %207 
					                                         f32 %209 = OpFAdd %206 %208 
					                                Private f32* %210 = OpAccessChain %99 %18 
					                                                      OpStore %210 %209 
					                                         f32 %211 = OpLoad %156 
					                                Uniform f32* %212 = OpAccessChain %14 %151 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpFMul %211 %213 
					                                Private f32* %215 = OpAccessChain %43 %50 
					                                                      OpStore %215 %214 
					                                Private f32* %216 = OpAccessChain %43 %50 
					                                         f32 %217 = OpLoad %216 
					                                         f32 %219 = OpFMul %217 %218 
					                                Private f32* %220 = OpAccessChain %66 %50 
					                                         f32 %221 = OpLoad %220 
					                                         f32 %222 = OpFAdd %219 %221 
					                                Private f32* %223 = OpAccessChain %66 %50 
					                                                      OpStore %223 %222 
					                         read_only Texture2D %224 = OpLoad %139 
					                                     sampler %225 = OpLoad %143 
					                  read_only Texture2DSampled %226 = OpSampledImage %224 %225 
					                                       f32_2 %227 = OpLoad %99 
					                                       f32_4 %228 = OpImageSampleImplicitLod %226 %227 
					                                         f32 %229 = OpCompositeExtract %228 0 
					                                Private f32* %230 = OpAccessChain %43 %50 
					                                                      OpStore %230 %229 
					                                Private f32* %231 = OpAccessChain %99 %50 
					                                         f32 %232 = OpLoad %231 
					                                         f32 %233 = OpFMul %232 %119 
					                                         f32 %234 = OpFAdd %233 %96 
					                                Private f32* %235 = OpAccessChain %91 %50 
					                                                      OpStore %235 %234 
					                                Private f32* %236 = OpAccessChain %99 %18 
					                                         f32 %237 = OpLoad %236 
					                                         f32 %238 = OpFMul %237 %119 
					                                Private f32* %239 = OpAccessChain %114 %18 
					                                         f32 %240 = OpLoad %239 
					                                         f32 %241 = OpFAdd %238 %240 
					                                Private f32* %242 = OpAccessChain %91 %18 
					                                                      OpStore %242 %241 
					                                Private f32* %243 = OpAccessChain %26 %50 
					                                         f32 %244 = OpLoad %243 
					                                         f32 %246 = OpFMul %244 %245 
					                                Private f32* %247 = OpAccessChain %114 %63 
					                                         f32 %248 = OpLoad %247 
					                                         f32 %249 = OpFAdd %246 %248 
					                                Private f32* %250 = OpAccessChain %99 %50 
					                                                      OpStore %250 %249 
					                         read_only Texture2D %251 = OpLoad %139 
					                                     sampler %252 = OpLoad %143 
					                  read_only Texture2DSampled %253 = OpSampledImage %251 %252 
					                                       f32_2 %254 = OpLoad %91 
					                                       f32_4 %255 = OpImageSampleImplicitLod %253 %254 
					                                         f32 %256 = OpCompositeExtract %255 0 
					                                Private f32* %257 = OpAccessChain %43 %18 
					                                                      OpStore %257 %256 
					                                       f32_2 %258 = OpLoad %43 
					                                Uniform f32* %259 = OpAccessChain %14 %151 
					                                         f32 %260 = OpLoad %259 
					                                Uniform f32* %261 = OpAccessChain %14 %151 
					                                         f32 %262 = OpLoad %261 
					                                       f32_2 %263 = OpCompositeConstruct %260 %262 
					                                         f32 %264 = OpCompositeExtract %263 0 
					                                         f32 %265 = OpCompositeExtract %263 1 
					                                       f32_2 %266 = OpCompositeConstruct %264 %265 
					                                       f32_2 %267 = OpFMul %258 %266 
					                                                      OpStore %43 %267 
					                                Private f32* %268 = OpAccessChain %43 %50 
					                                         f32 %269 = OpLoad %268 
					                                         f32 %271 = OpFMul %269 %270 
					                                Private f32* %272 = OpAccessChain %66 %50 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpFAdd %271 %273 
					                                Private f32* %275 = OpAccessChain %66 %50 
					                                                      OpStore %275 %274 
					                                Private f32* %276 = OpAccessChain %43 %18 
					                                         f32 %277 = OpLoad %276 
					                                         f32 %278 = OpFMul %277 %270 
					                                Private f32* %279 = OpAccessChain %66 %50 
					                                         f32 %280 = OpLoad %279 
					                                         f32 %281 = OpFAdd %278 %280 
					                                Private f32* %282 = OpAccessChain %66 %50 
					                                                      OpStore %282 %281 
					                                       f32_4 %283 = OpLoad %66 
					                                       f32_2 %284 = OpVectorShuffle %283 %283 0 0 
					                                Uniform f32* %286 = OpAccessChain %14 %285 
					                                         f32 %287 = OpLoad %286 
					                                Uniform f32* %288 = OpAccessChain %14 %285 
					                                         f32 %289 = OpLoad %288 
					                                       f32_2 %290 = OpCompositeConstruct %287 %289 
					                                         f32 %291 = OpCompositeExtract %290 0 
					                                         f32 %292 = OpCompositeExtract %290 1 
					                                       f32_2 %293 = OpCompositeConstruct %291 %292 
					                                       f32_2 %294 = OpFMul %284 %293 
					                                       f32_3 %295 = OpLoad %26 
					                                       f32_2 %296 = OpVectorShuffle %295 %295 0 1 
					                                       f32_2 %297 = OpFAdd %294 %296 
					                                                      OpStore %43 %297 
					                         read_only Texture2D %300 = OpLoad %299 
					                                     sampler %302 = OpLoad %301 
					                  read_only Texture2DSampled %303 = OpSampledImage %300 %302 
					                                       f32_3 %304 = OpLoad %26 
					                                       f32_2 %305 = OpVectorShuffle %304 %304 0 1 
					                                       f32_4 %306 = OpImageSampleImplicitLod %303 %305 
					                                                      OpStore %298 %306 
					                         read_only Texture2D %308 = OpLoad %299 
					                                     sampler %309 = OpLoad %301 
					                  read_only Texture2DSampled %310 = OpSampledImage %308 %309 
					                                       f32_2 %311 = OpLoad %43 
					                                       f32_4 %312 = OpImageSampleImplicitLod %310 %311 
					                                                      OpStore %307 %312 
					                                       f32_4 %313 = OpLoad %66 
					                                       f32_4 %314 = OpVectorShuffle %313 %313 0 0 0 0 
					                                       f32_4 %315 = OpLoad %307 
					                                       f32_4 %316 = OpFAdd %314 %315 
					                                                      OpStore %66 %316 
					                                       f32_4 %317 = OpLoad %298 
					                                       f32_4 %318 = OpFNegate %317 
					                                       f32_4 %319 = OpLoad %66 
					                                       f32_4 %320 = OpFAdd %318 %319 
					                                                      OpStore %66 %320 
					                                Uniform f32* %322 = OpAccessChain %14 %321 
					                                         f32 %323 = OpLoad %322 
					                                Uniform f32* %324 = OpAccessChain %14 %321 
					                                         f32 %325 = OpLoad %324 
					                                Uniform f32* %326 = OpAccessChain %14 %321 
					                                         f32 %327 = OpLoad %326 
					                                Uniform f32* %328 = OpAccessChain %14 %321 
					                                         f32 %329 = OpLoad %328 
					                                       f32_4 %330 = OpCompositeConstruct %323 %325 %327 %329 
					                                         f32 %331 = OpCompositeExtract %330 0 
					                                         f32 %332 = OpCompositeExtract %330 1 
					                                         f32 %333 = OpCompositeExtract %330 2 
					                                         f32 %334 = OpCompositeExtract %330 3 
					                                       f32_4 %335 = OpCompositeConstruct %331 %332 %333 %334 
					                                       f32_4 %336 = OpLoad %66 
					                                       f32_4 %337 = OpFMul %335 %336 
					                                       f32_4 %338 = OpLoad %298 
					                                       f32_4 %339 = OpFAdd %337 %338 
					                                                      OpStore %66 %339 
					                                Private f32* %340 = OpAccessChain %99 %18 
					                                                      OpStore %340 %22 
					                         read_only Texture2D %341 = OpLoad %139 
					                                     sampler %342 = OpLoad %143 
					                  read_only Texture2DSampled %343 = OpSampledImage %341 %342 
					                                       f32_2 %344 = OpLoad %99 
					                                       f32_4 %345 = OpImageSampleImplicitLod %343 %344 
					                                         f32 %346 = OpCompositeExtract %345 1 
					                                Private f32* %347 = OpAccessChain %307 %50 
					                                                      OpStore %347 %346 
					                                Private f32* %348 = OpAccessChain %307 %50 
					                                         f32 %349 = OpLoad %348 
					                                Uniform f32* %350 = OpAccessChain %14 %151 
					                                         f32 %351 = OpLoad %350 
					                                         f32 %352 = OpFMul %349 %351 
					                                Private f32* %353 = OpAccessChain %91 %50 
					                                                      OpStore %353 %352 
					                                Private f32* %354 = OpAccessChain %91 %50 
					                                         f32 %355 = OpLoad %354 
					                                Uniform f32* %357 = OpAccessChain %14 %356 
					                                         f32 %358 = OpLoad %357 
					                                         f32 %359 = OpFMul %355 %358 
					                                Private f32* %360 = OpAccessChain %91 %50 
					                                                      OpStore %360 %359 
					                                       f32_2 %361 = OpLoad %91 
					                                       f32_4 %362 = OpVectorShuffle %361 %361 0 0 0 0 
					                                       f32_4 %364 = OpFMul %362 %363 
					                                       f32_4 %365 = OpLoad %66 
					                                       f32_4 %366 = OpFAdd %364 %365 
					                                                      OpStore %66 %366 
					                                       f32_4 %367 = OpLoad %298 
					                                       f32_4 %368 = OpFNegate %367 
					                                       f32_4 %369 = OpLoad %66 
					                                       f32_4 %370 = OpFAdd %368 %369 
					                                                      OpStore %66 %370 
					                                Uniform f32* %373 = OpAccessChain %14 %321 
					                                         f32 %374 = OpLoad %373 
					                                Uniform f32* %375 = OpAccessChain %14 %321 
					                                         f32 %376 = OpLoad %375 
					                                Uniform f32* %377 = OpAccessChain %14 %321 
					                                         f32 %378 = OpLoad %377 
					                                Uniform f32* %379 = OpAccessChain %14 %321 
					                                         f32 %380 = OpLoad %379 
					                                       f32_4 %381 = OpCompositeConstruct %374 %376 %378 %380 
					                                         f32 %382 = OpCompositeExtract %381 0 
					                                         f32 %383 = OpCompositeExtract %381 1 
					                                         f32 %384 = OpCompositeExtract %381 2 
					                                         f32 %385 = OpCompositeExtract %381 3 
					                                       f32_4 %386 = OpCompositeConstruct %382 %383 %384 %385 
					                                       f32_4 %387 = OpLoad %66 
					                                       f32_4 %388 = OpFMul %386 %387 
					                                       f32_4 %389 = OpLoad %298 
					                                       f32_4 %390 = OpFAdd %388 %389 
					                                                      OpStore %372 %390 
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
						float _Value5;
						float _Value6;
						float _Value7;
						vec4 unused_0_9;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D Texture2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					vec2 u_xlat6;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.x = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb0) ? u_xlat6.x : u_xlat1.y;
					    u_xlat0.xy = u_xlat1.xz * vec2(vec2(_Value5, _Value5));
					    u_xlat0.x = _Value3 * u_xlat0.y + u_xlat0.x;
					    u_xlat2.x = u_xlat0.x * 3.0 + 0.100000001;
					    u_xlat3.x = u_xlat2.x * 0.649999976 + 0.100000001;
					    u_xlat0.x = _TimeX * _Value4;
					    u_xlat4.xyz = u_xlat0.xxx * vec3(0.800000012, 1.20000005, 0.400000006);
					    u_xlat2.y = u_xlat0.y * 3.0 + u_xlat4.x;
					    u_xlat3.y = u_xlat2.y * 0.649999976 + u_xlat0.x;
					    u_xlat10_0 = texture(Texture2, u_xlat2.xy);
					    u_xlat0.x = u_xlat10_0.x * _Value2;
					    u_xlat10_2 = texture(Texture2, u_xlat3.xy);
					    u_xlat5.x = u_xlat3.x * 0.649999976 + 0.100000001;
					    u_xlat5.y = u_xlat3.y * 0.649999976 + u_xlat4.y;
					    u_xlat6.x = u_xlat10_2.x * _Value2;
					    u_xlat6.x = u_xlat6.x * 0.5;
					    u_xlat0.x = u_xlat0.x * 0.300000012 + u_xlat6.x;
					    u_xlat10_2 = texture(Texture2, u_xlat5.xy);
					    u_xlat3.x = u_xlat5.x * 0.5 + 0.100000001;
					    u_xlat3.y = u_xlat5.y * 0.5 + u_xlat4.y;
					    u_xlat6.x = u_xlat10_2.x * _Value2;
					    u_xlat0.x = u_xlat6.x * 0.699999988 + u_xlat0.x;
					    u_xlat10_2 = texture(Texture2, u_xlat3.xy);
					    u_xlat5.x = u_xlat3.x * 0.400000006 + 0.100000001;
					    u_xlat5.y = u_xlat3.y * 0.400000006 + u_xlat4.y;
					    u_xlat3.x = u_xlat1.x * 0.00100000005 + u_xlat4.z;
					    u_xlat10_4 = texture(Texture2, u_xlat5.xy);
					    u_xlat6.x = u_xlat10_4.x * _Value2;
					    u_xlat12 = u_xlat10_2.x * _Value2;
					    u_xlat0.x = u_xlat12 * 0.899999976 + u_xlat0.x;
					    u_xlat0.x = u_xlat6.x * 0.899999976 + u_xlat0.x;
					    u_xlat6.xy = u_xlat0.xx * vec2(vec2(_Value6, _Value6)) + u_xlat1.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat6.xy);
					    u_xlat0 = u_xlat0.xxxx + u_xlat10_2;
					    u_xlat0 = (-u_xlat10_1) + u_xlat0;
					    u_xlat0 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat0 + u_xlat10_1;
					    u_xlat3.y = 0.0;
					    u_xlat10_2 = texture(Texture2, u_xlat3.xy);
					    u_xlat2.x = u_xlat10_2.y * _Value2;
					    u_xlat2.x = u_xlat2.x * _Value7;
					    u_xlat0 = u_xlat2.xxxx * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + u_xlat0;
					    u_xlat0 = (-u_xlat10_1) + u_xlat0;
					    SV_Target0 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat0 + u_xlat10_1;
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