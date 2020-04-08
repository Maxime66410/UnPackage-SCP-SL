Shader "CameraFilterPack/TV_Vcr" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 51294
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec3 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat6;
					float u_xlat16_6;
					float u_xlat10;
					vec2 u_xlat11;
					bvec2 u_xlatb11;
					vec2 u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.25, 4.0, 80.0, 3.0);
					    u_xlat5.xyz = cos(u_xlat0.yzw);
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = _TimeX * 0.25 + (-u_xlat0.x);
					    u_xlat5.x = u_xlat5.x * 4.0 + _TimeX;
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlatb5 = u_xlat5.x>=0.300000012;
					    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.yx * vec2(1.20000005, 1.20000005);
					    u_xlat11.x = dot(u_xlat11.yy, u_xlat11.xx);
					    u_xlat11.x = u_xlat11.x + 0.833333313;
					    u_xlat2.xy = u_xlat1.yx * u_xlat11.xx + vec2(0.5, 0.5);
					    u_xlat1.xy = u_xlat11.xx * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat11.x = u_xlat2.y * 10.0 + _TimeX;
					    u_xlat11.x = sin(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 0.0199999996;
					    u_xlat0.y = u_xlat5.x * u_xlat11.x;
					    u_xlat0.z = u_xlat5.y + 1.0;
					    u_xlat15 = u_xlat5.z * 2.0 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					    u_xlatb15 = u_xlat15>=0.899999976;
					    u_xlat15 = u_xlatb15 ? 0.400000006 : float(0.0);
					    u_xlat0.x = (-u_xlat0.x) + u_xlat2.y;
					    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * 20.0 + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat2.x;
					    u_xlat3 = vec4(_TimeX) * vec4(20.0, 200.0, 5.0, 0.5);
					    u_xlat11.xy = sin(u_xlat3.xy);
					    u_xlat10 = u_xlat11.y * 0.100000001;
					    u_xlat3.x = sin(_TimeX);
					    u_xlat4 = cos(_TimeX);
					    u_xlat10 = u_xlat10 * u_xlat4;
					    u_xlat10 = u_xlat3.x * u_xlat11.x + u_xlat10;
					    u_xlat3.y = u_xlat4 * _TimeX;
					    u_xlat10 = u_xlat10 + 0.5;
					    u_xlat10 = u_xlat15 * u_xlat10 + u_xlat2.y;
					    u_xlat15 = floor(u_xlat10);
					    u_xlat0.y = (-u_xlat15) + u_xlat10;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat15 = _TimeX * 0.629999995;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat11.x = u_xlat2.y * 4.0 + u_xlat3.w;
					    u_xlat16 = cos(u_xlat3.z);
					    u_xlat16 = u_xlat16 * 5.0 + _TimeX;
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 0.300000012 + 3.0;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(u_xlat16) + vec2(1.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = floor(u_xlat15);
					    u_xlat15 = u_xlat15 + (-u_xlat6.x);
					    u_xlat6.x = u_xlat15 + -0.5;
					    u_xlatb11.xy = greaterThanEqual(vec4(u_xlat15), vec4(0.5, 0.600000024, 0.5, 0.600000024)).xy;
					    u_xlat15 = u_xlatb11.x ? 1.0 : float(0.0);
					    u_xlat11.x = (u_xlatb11.y) ? -1.0 : -0.0;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = u_xlat15 * u_xlat6.x;
					    u_xlat6.x = (-u_xlat6.x) * 9.99999809 + 1.0;
					    u_xlat15 = u_xlat15 * u_xlat6.x;
					    u_xlat6.xy = u_xlat2.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat3.x = _TimeX;
					    u_xlat6.xy = u_xlat3.xy * vec2(8.0, 16.0) + u_xlat6.xy;
					    u_xlat12.xy = u_xlat3.xy * vec2(8.0, 16.0);
					    u_xlat2.xz = u_xlat2.xy * vec2(2.0, 2.0) + u_xlat12.xy;
					    u_xlat16 = u_xlat2.y * 30.0 + _TimeX;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xz);
					    u_xlat16_2 = u_xlat10_2.x * u_xlat10_2.x;
					    u_xlat10_3 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_6 = u_xlat10_3.x * u_xlat10_3.x;
					    u_xlat0.xyz = vec3(u_xlat15) * vec3(u_xlat16_6) + u_xlat10_0.xyz;
					    u_xlat0.xyz = vec3(u_xlat16_2) * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat15 = floor(u_xlat16);
					    u_xlat15 = (-u_xlat15) + u_xlat16;
					    u_xlat15 = u_xlat15 + 12.0;
					    u_xlat15 = u_xlat15 * 0.0769230798;
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					; Bound: 485
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %73 %474 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %10 0 Offset 10 
					                                              OpMemberDecorate %10 1 RelaxedPrecision 
					                                              OpMemberDecorate %10 1 Offset 10 
					                                              OpDecorate %10 Block 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate vs_TEXCOORD0 Location 73 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %79 RelaxedPrecision 
					                                              OpDecorate %82 RelaxedPrecision 
					                                              OpDecorate %83 RelaxedPrecision 
					                                              OpDecorate %260 RelaxedPrecision 
					                                              OpDecorate %263 RelaxedPrecision 
					                                              OpDecorate %263 DescriptorSet 263 
					                                              OpDecorate %263 Binding 263 
					                                              OpDecorate %264 RelaxedPrecision 
					                                              OpDecorate %267 RelaxedPrecision 
					                                              OpDecorate %267 DescriptorSet 267 
					                                              OpDecorate %267 Binding 267 
					                                              OpDecorate %268 RelaxedPrecision 
					                                              OpDecorate %274 RelaxedPrecision 
					                                              OpDecorate %413 RelaxedPrecision 
					                                              OpDecorate %414 RelaxedPrecision 
					                                              OpDecorate %415 RelaxedPrecision 
					                                              OpDecorate %420 RelaxedPrecision 
					                                              OpDecorate %421 RelaxedPrecision 
					                                              OpDecorate %422 RelaxedPrecision 
					                                              OpDecorate %423 RelaxedPrecision 
					                                              OpDecorate %424 RelaxedPrecision 
					                                              OpDecorate %425 RelaxedPrecision 
					                                              OpDecorate %426 RelaxedPrecision 
					                                              OpDecorate %427 RelaxedPrecision 
					                                              OpDecorate %431 RelaxedPrecision 
					                                              OpDecorate %432 RelaxedPrecision 
					                                              OpDecorate %433 RelaxedPrecision 
					                                              OpDecorate %434 RelaxedPrecision 
					                                              OpDecorate %435 RelaxedPrecision 
					                                              OpDecorate %437 RelaxedPrecision 
					                                              OpDecorate %438 RelaxedPrecision 
					                                              OpDecorate %439 RelaxedPrecision 
					                                              OpDecorate %440 RelaxedPrecision 
					                                              OpDecorate %441 RelaxedPrecision 
					                                              OpDecorate %442 RelaxedPrecision 
					                                              OpDecorate %445 RelaxedPrecision 
					                                              OpDecorate %474 Location 474 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeStruct %6 %7 
					                                      %11 = OpTypePointer Uniform %10 
					        Uniform struct {f32; f32_4;}* %12 = OpVariable Uniform 
					                                      %13 = OpTypeInt 32 1 
					                                  i32 %14 = OpConstant 0 
					                                      %15 = OpTypePointer Uniform %6 
					                                  f32 %19 = OpConstant 3,674022E-40 
					                                  f32 %20 = OpConstant 3,674022E-40 
					                                  f32 %21 = OpConstant 3,674022E-40 
					                                  f32 %22 = OpConstant 3,674022E-40 
					                                f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
					                                      %25 = OpTypeVector %6 3 
					                                      %26 = OpTypePointer Private %25 
					                       Private f32_3* %27 = OpVariable Private 
					                                      %31 = OpTypeInt 32 0 
					                                  u32 %32 = OpConstant 0 
					                                      %33 = OpTypePointer Private %6 
					                                      %57 = OpTypeBool 
					                                      %58 = OpTypePointer Private %57 
					                        Private bool* %59 = OpVariable Private 
					                                  f32 %62 = OpConstant 3,674022E-40 
					                                  f32 %65 = OpConstant 3,674022E-40 
					                                  f32 %66 = OpConstant 3,674022E-40 
					                                      %69 = OpTypeVector %6 2 
					                                      %70 = OpTypePointer Private %69 
					                       Private f32_2* %71 = OpVariable Private 
					                                      %72 = OpTypePointer Input %69 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                  i32 %75 = OpConstant 1 
					                                      %76 = OpTypePointer Uniform %7 
					                                  f32 %86 = OpConstant 3,674022E-40 
					                                f32_2 %87 = OpConstantComposite %86 %86 
					                       Private f32_2* %89 = OpVariable Private 
					                                  f32 %95 = OpConstant 3,674022E-40 
					                                f32_2 %96 = OpConstantComposite %95 %95 
					                                 f32 %106 = OpConstant 3,674022E-40 
					                      Private f32_3* %109 = OpVariable Private 
					                                 f32 %115 = OpConstant 3,674022E-40 
					                               f32_2 %116 = OpConstantComposite %115 %115 
					                                 u32 %127 = OpConstant 1 
					                                 f32 %130 = OpConstant 3,674022E-40 
					                                 f32 %142 = OpConstant 3,674022E-40 
					                                 u32 %154 = OpConstant 2 
					                        Private f32* %156 = OpVariable Private 
					                                 f32 %159 = OpConstant 3,674022E-40 
					                       Private bool* %166 = OpVariable Private 
					                                 f32 %168 = OpConstant 3,674022E-40 
					                                 f32 %171 = OpConstant 3,674022E-40 
					                                 f32 %189 = OpConstant 3,674022E-40 
					                      Private f32_4* %206 = OpVariable Private 
					                                 f32 %210 = OpConstant 3,674022E-40 
					                                 f32 %211 = OpConstant 3,674022E-40 
					                               f32_4 %212 = OpConstantComposite %189 %210 %211 %115 
					                        Private f32* %217 = OpVariable Private 
					                                 f32 %220 = OpConstant 3,674022E-40 
					                        Private f32* %226 = OpVariable Private 
					                      Private f32_3* %260 = OpVariable Private 
					                                     %261 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %262 = OpTypePointer UniformConstant %261 
					UniformConstant read_only Texture2D* %263 = OpVariable UniformConstant 
					                                     %265 = OpTypeSampler 
					                                     %266 = OpTypePointer UniformConstant %265 
					            UniformConstant sampler* %267 = OpVariable UniformConstant 
					                                     %269 = OpTypeSampledImage %261 
					                                 f32 %277 = OpConstant 3,674022E-40 
					                                 u32 %290 = OpConstant 3 
					                        Private f32* %295 = OpVariable Private 
					                               f32_2 %314 = OpConstantComposite %65 %65 
					                      Private f32_2* %326 = OpVariable Private 
					                                     %338 = OpTypeVector %57 2 
					                                     %339 = OpTypePointer Private %338 
					                     Private bool_2* %340 = OpVariable Private 
					                                 f32 %343 = OpConstant 3,674022E-40 
					                               f32_4 %344 = OpConstantComposite %115 %343 %115 %343 
					                                     %345 = OpTypeVector %57 4 
					                                 f32 %353 = OpConstant 3,674022E-40 
					                                 f32 %354 = OpConstant 3,674022E-40 
					                                 f32 %369 = OpConstant 3,674022E-40 
					                               f32_2 %379 = OpConstantComposite %115 %65 
					                               f32_2 %381 = OpConstantComposite %65 %22 
					                                 f32 %388 = OpConstant 3,674022E-40 
					                                 f32 %389 = OpConstant 3,674022E-40 
					                               f32_2 %390 = OpConstantComposite %388 %389 
					                      Private f32_2* %394 = OpVariable Private 
					                               f32_2 %400 = OpConstantComposite %159 %159 
					                                 f32 %408 = OpConstant 3,674022E-40 
					                        Private f32* %413 = OpVariable Private 
					                        Private f32* %421 = OpVariable Private 
					                        Private f32* %425 = OpVariable Private 
					                        Private f32* %432 = OpVariable Private 
					                               f32_3 %447 = OpConstantComposite %115 %115 %115 
					                                 f32 %468 = OpConstant 3,674022E-40 
					                                 f32 %471 = OpConstant 3,674022E-40 
					                                     %473 = OpTypePointer Output %7 
					                       Output f32_4* %474 = OpVariable Output 
					                                     %482 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                         Uniform f32* %16 = OpAccessChain %12 %14 
					                                  f32 %17 = OpLoad %16 
					                                f32_4 %18 = OpCompositeConstruct %17 %17 %17 %17 
					                                f32_4 %24 = OpFMul %18 %23 
					                                              OpStore %9 %24 
					                                f32_4 %28 = OpLoad %9 
					                                f32_3 %29 = OpVectorShuffle %28 %28 1 2 3 
					                                f32_3 %30 = OpExtInst %1 14 %29 
					                                              OpStore %27 %30 
					                         Private f32* %34 = OpAccessChain %9 %32 
					                                  f32 %35 = OpLoad %34 
					                                  f32 %36 = OpExtInst %1 8 %35 
					                         Private f32* %37 = OpAccessChain %9 %32 
					                                              OpStore %37 %36 
					                         Uniform f32* %38 = OpAccessChain %12 %14 
					                                  f32 %39 = OpLoad %38 
					                                  f32 %40 = OpFMul %39 %19 
					                         Private f32* %41 = OpAccessChain %9 %32 
					                                  f32 %42 = OpLoad %41 
					                                  f32 %43 = OpFNegate %42 
					                                  f32 %44 = OpFAdd %40 %43 
					                         Private f32* %45 = OpAccessChain %9 %32 
					                                              OpStore %45 %44 
					                         Private f32* %46 = OpAccessChain %27 %32 
					                                  f32 %47 = OpLoad %46 
					                                  f32 %48 = OpFMul %47 %20 
					                         Uniform f32* %49 = OpAccessChain %12 %14 
					                                  f32 %50 = OpLoad %49 
					                                  f32 %51 = OpFAdd %48 %50 
					                         Private f32* %52 = OpAccessChain %27 %32 
					                                              OpStore %52 %51 
					                         Private f32* %53 = OpAccessChain %27 %32 
					                                  f32 %54 = OpLoad %53 
					                                  f32 %55 = OpExtInst %1 13 %54 
					                         Private f32* %56 = OpAccessChain %27 %32 
					                                              OpStore %56 %55 
					                         Private f32* %60 = OpAccessChain %27 %32 
					                                  f32 %61 = OpLoad %60 
					                                 bool %63 = OpFOrdGreaterThanEqual %61 %62 
					                                              OpStore %59 %63 
					                                 bool %64 = OpLoad %59 
					                                  f32 %67 = OpSelect %64 %65 %66 
					                         Private f32* %68 = OpAccessChain %27 %32 
					                                              OpStore %68 %67 
					                                f32_2 %74 = OpLoad vs_TEXCOORD0 
					                       Uniform f32_4* %77 = OpAccessChain %12 %75 
					                                f32_4 %78 = OpLoad %77 
					                                f32_2 %79 = OpVectorShuffle %78 %78 0 1 
					                                f32_2 %80 = OpFMul %74 %79 
					                       Uniform f32_4* %81 = OpAccessChain %12 %75 
					                                f32_4 %82 = OpLoad %81 
					                                f32_2 %83 = OpVectorShuffle %82 %82 2 3 
					                                f32_2 %84 = OpFAdd %80 %83 
					                                              OpStore %71 %84 
					                                f32_2 %85 = OpLoad %71 
					                                f32_2 %88 = OpFAdd %85 %87 
					                                              OpStore %71 %88 
					                                f32_2 %90 = OpLoad %71 
					                                f32_2 %91 = OpLoad %71 
					                                f32_2 %92 = OpFMul %90 %91 
					                                              OpStore %89 %92 
					                                f32_2 %93 = OpLoad %71 
					                                f32_2 %94 = OpVectorShuffle %93 %93 1 0 
					                                f32_2 %97 = OpFMul %94 %96 
					                                              OpStore %71 %97 
					                                f32_2 %98 = OpLoad %89 
					                                f32_2 %99 = OpVectorShuffle %98 %98 1 1 
					                               f32_2 %100 = OpLoad %89 
					                               f32_2 %101 = OpVectorShuffle %100 %100 0 0 
					                                 f32 %102 = OpDot %99 %101 
					                        Private f32* %103 = OpAccessChain %89 %32 
					                                              OpStore %103 %102 
					                        Private f32* %104 = OpAccessChain %89 %32 
					                                 f32 %105 = OpLoad %104 
					                                 f32 %107 = OpFAdd %105 %106 
					                        Private f32* %108 = OpAccessChain %89 %32 
					                                              OpStore %108 %107 
					                               f32_2 %110 = OpLoad %71 
					                               f32_2 %111 = OpVectorShuffle %110 %110 1 0 
					                               f32_2 %112 = OpLoad %89 
					                               f32_2 %113 = OpVectorShuffle %112 %112 0 0 
					                               f32_2 %114 = OpFMul %111 %113 
					                               f32_2 %117 = OpFAdd %114 %116 
					                               f32_3 %118 = OpLoad %109 
					                               f32_3 %119 = OpVectorShuffle %118 %117 3 4 2 
					                                              OpStore %109 %119 
					                               f32_2 %120 = OpLoad %89 
					                               f32_2 %121 = OpVectorShuffle %120 %120 0 0 
					                               f32_2 %122 = OpLoad %71 
					                               f32_2 %123 = OpFMul %121 %122 
					                                              OpStore %71 %123 
					                               f32_2 %124 = OpLoad %71 
					                               f32_2 %125 = OpLoad %71 
					                               f32_2 %126 = OpFMul %124 %125 
					                                              OpStore %71 %126 
					                        Private f32* %128 = OpAccessChain %109 %127 
					                                 f32 %129 = OpLoad %128 
					                                 f32 %131 = OpFMul %129 %130 
					                        Uniform f32* %132 = OpAccessChain %12 %14 
					                                 f32 %133 = OpLoad %132 
					                                 f32 %134 = OpFAdd %131 %133 
					                        Private f32* %135 = OpAccessChain %89 %32 
					                                              OpStore %135 %134 
					                        Private f32* %136 = OpAccessChain %89 %32 
					                                 f32 %137 = OpLoad %136 
					                                 f32 %138 = OpExtInst %1 13 %137 
					                        Private f32* %139 = OpAccessChain %89 %32 
					                                              OpStore %139 %138 
					                        Private f32* %140 = OpAccessChain %89 %32 
					                                 f32 %141 = OpLoad %140 
					                                 f32 %143 = OpFMul %141 %142 
					                        Private f32* %144 = OpAccessChain %89 %32 
					                                              OpStore %144 %143 
					                        Private f32* %145 = OpAccessChain %27 %32 
					                                 f32 %146 = OpLoad %145 
					                        Private f32* %147 = OpAccessChain %89 %32 
					                                 f32 %148 = OpLoad %147 
					                                 f32 %149 = OpFMul %146 %148 
					                        Private f32* %150 = OpAccessChain %9 %127 
					                                              OpStore %150 %149 
					                        Private f32* %151 = OpAccessChain %27 %127 
					                                 f32 %152 = OpLoad %151 
					                                 f32 %153 = OpFAdd %152 %65 
					                        Private f32* %155 = OpAccessChain %9 %154 
					                                              OpStore %155 %153 
					                        Private f32* %157 = OpAccessChain %27 %154 
					                                 f32 %158 = OpLoad %157 
					                                 f32 %160 = OpFMul %158 %159 
					                        Uniform f32* %161 = OpAccessChain %12 %14 
					                                 f32 %162 = OpLoad %161 
					                                 f32 %163 = OpFAdd %160 %162 
					                                              OpStore %156 %163 
					                                 f32 %164 = OpLoad %156 
					                                 f32 %165 = OpExtInst %1 13 %164 
					                                              OpStore %156 %165 
					                                 f32 %167 = OpLoad %156 
					                                bool %169 = OpFOrdGreaterThanEqual %167 %168 
					                                              OpStore %166 %169 
					                                bool %170 = OpLoad %166 
					                                 f32 %172 = OpSelect %170 %171 %66 
					                                              OpStore %156 %172 
					                        Private f32* %173 = OpAccessChain %9 %32 
					                                 f32 %174 = OpLoad %173 
					                                 f32 %175 = OpFNegate %174 
					                        Private f32* %176 = OpAccessChain %109 %127 
					                                 f32 %177 = OpLoad %176 
					                                 f32 %178 = OpFAdd %175 %177 
					                        Private f32* %179 = OpAccessChain %9 %32 
					                                              OpStore %179 %178 
					                               f32_4 %180 = OpLoad %9 
					                               f32_2 %181 = OpVectorShuffle %180 %180 0 2 
					                               f32_4 %182 = OpLoad %9 
					                               f32_2 %183 = OpVectorShuffle %182 %182 0 1 
					                               f32_2 %184 = OpFMul %181 %183 
					                               f32_4 %185 = OpLoad %9 
					                               f32_4 %186 = OpVectorShuffle %185 %184 4 5 2 3 
					                                              OpStore %9 %186 
					                        Private f32* %187 = OpAccessChain %9 %32 
					                                 f32 %188 = OpLoad %187 
					                                 f32 %190 = OpFMul %188 %189 
					                                 f32 %191 = OpFAdd %190 %65 
					                        Private f32* %192 = OpAccessChain %9 %32 
					                                              OpStore %192 %191 
					                        Private f32* %193 = OpAccessChain %9 %32 
					                                 f32 %194 = OpLoad %193 
					                                 f32 %195 = OpFDiv %65 %194 
					                        Private f32* %196 = OpAccessChain %9 %32 
					                                              OpStore %196 %195 
					                        Private f32* %197 = OpAccessChain %9 %127 
					                                 f32 %198 = OpLoad %197 
					                        Private f32* %199 = OpAccessChain %9 %32 
					                                 f32 %200 = OpLoad %199 
					                                 f32 %201 = OpFMul %198 %200 
					                        Private f32* %202 = OpAccessChain %109 %32 
					                                 f32 %203 = OpLoad %202 
					                                 f32 %204 = OpFAdd %201 %203 
					                        Private f32* %205 = OpAccessChain %9 %32 
					                                              OpStore %205 %204 
					                        Uniform f32* %207 = OpAccessChain %12 %14 
					                                 f32 %208 = OpLoad %207 
					                               f32_4 %209 = OpCompositeConstruct %208 %208 %208 %208 
					                               f32_4 %213 = OpFMul %209 %212 
					                                              OpStore %206 %213 
					                               f32_4 %214 = OpLoad %206 
					                               f32_2 %215 = OpVectorShuffle %214 %214 0 1 
					                               f32_2 %216 = OpExtInst %1 13 %215 
					                                              OpStore %89 %216 
					                        Private f32* %218 = OpAccessChain %89 %127 
					                                 f32 %219 = OpLoad %218 
					                                 f32 %221 = OpFMul %219 %220 
					                                              OpStore %217 %221 
					                        Uniform f32* %222 = OpAccessChain %12 %14 
					                                 f32 %223 = OpLoad %222 
					                                 f32 %224 = OpExtInst %1 13 %223 
					                        Private f32* %225 = OpAccessChain %206 %32 
					                                              OpStore %225 %224 
					                        Uniform f32* %227 = OpAccessChain %12 %14 
					                                 f32 %228 = OpLoad %227 
					                                 f32 %229 = OpExtInst %1 14 %228 
					                                              OpStore %226 %229 
					                                 f32 %230 = OpLoad %217 
					                                 f32 %231 = OpLoad %226 
					                                 f32 %232 = OpFMul %230 %231 
					                                              OpStore %217 %232 
					                        Private f32* %233 = OpAccessChain %206 %32 
					                                 f32 %234 = OpLoad %233 
					                        Private f32* %235 = OpAccessChain %89 %32 
					                                 f32 %236 = OpLoad %235 
					                                 f32 %237 = OpFMul %234 %236 
					                                 f32 %238 = OpLoad %217 
					                                 f32 %239 = OpFAdd %237 %238 
					                                              OpStore %217 %239 
					                                 f32 %240 = OpLoad %226 
					                        Uniform f32* %241 = OpAccessChain %12 %14 
					                                 f32 %242 = OpLoad %241 
					                                 f32 %243 = OpFMul %240 %242 
					                        Private f32* %244 = OpAccessChain %206 %127 
					                                              OpStore %244 %243 
					                                 f32 %245 = OpLoad %217 
					                                 f32 %246 = OpFAdd %245 %115 
					                                              OpStore %217 %246 
					                                 f32 %247 = OpLoad %156 
					                                 f32 %248 = OpLoad %217 
					                                 f32 %249 = OpFMul %247 %248 
					                        Private f32* %250 = OpAccessChain %109 %127 
					                                 f32 %251 = OpLoad %250 
					                                 f32 %252 = OpFAdd %249 %251 
					                                              OpStore %217 %252 
					                                 f32 %253 = OpLoad %217 
					                                 f32 %254 = OpExtInst %1 8 %253 
					                                              OpStore %156 %254 
					                                 f32 %255 = OpLoad %156 
					                                 f32 %256 = OpFNegate %255 
					                                 f32 %257 = OpLoad %217 
					                                 f32 %258 = OpFAdd %256 %257 
					                        Private f32* %259 = OpAccessChain %9 %127 
					                                              OpStore %259 %258 
					                 read_only Texture2D %264 = OpLoad %263 
					                             sampler %268 = OpLoad %267 
					          read_only Texture2DSampled %270 = OpSampledImage %264 %268 
					                               f32_4 %271 = OpLoad %9 
					                               f32_2 %272 = OpVectorShuffle %271 %271 0 1 
					                               f32_4 %273 = OpImageSampleImplicitLod %270 %272 
					                               f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
					                                              OpStore %260 %274 
					                        Uniform f32* %275 = OpAccessChain %12 %14 
					                                 f32 %276 = OpLoad %275 
					                                 f32 %278 = OpFMul %276 %277 
					                                              OpStore %156 %278 
					                                 f32 %279 = OpLoad %156 
					                                 f32 %280 = OpExtInst %1 13 %279 
					                                              OpStore %156 %280 
					                                 f32 %281 = OpLoad %156 
					                        Uniform f32* %282 = OpAccessChain %12 %14 
					                                 f32 %283 = OpLoad %282 
					                                 f32 %284 = OpFAdd %281 %283 
					                                              OpStore %156 %284 
					                                 f32 %285 = OpLoad %156 
					                                 f32 %286 = OpExtInst %1 13 %285 
					                                              OpStore %156 %286 
					                        Private f32* %287 = OpAccessChain %109 %127 
					                                 f32 %288 = OpLoad %287 
					                                 f32 %289 = OpFMul %288 %20 
					                        Private f32* %291 = OpAccessChain %206 %290 
					                                 f32 %292 = OpLoad %291 
					                                 f32 %293 = OpFAdd %289 %292 
					                        Private f32* %294 = OpAccessChain %89 %32 
					                                              OpStore %294 %293 
					                        Private f32* %296 = OpAccessChain %206 %154 
					                                 f32 %297 = OpLoad %296 
					                                 f32 %298 = OpExtInst %1 14 %297 
					                                              OpStore %295 %298 
					                                 f32 %299 = OpLoad %295 
					                                 f32 %300 = OpFMul %299 %211 
					                        Uniform f32* %301 = OpAccessChain %12 %14 
					                                 f32 %302 = OpLoad %301 
					                                 f32 %303 = OpFAdd %300 %302 
					                                              OpStore %295 %303 
					                                 f32 %304 = OpLoad %295 
					                                 f32 %305 = OpExtInst %1 13 %304 
					                                              OpStore %295 %305 
					                                 f32 %306 = OpLoad %295 
					                                 f32 %307 = OpFMul %306 %62 
					                                 f32 %308 = OpFAdd %307 %22 
					                                              OpStore %295 %308 
					                               f32_2 %309 = OpLoad %71 
					                               f32_2 %310 = OpFNegate %309 
					                                 f32 %311 = OpLoad %295 
					                               f32_2 %312 = OpCompositeConstruct %311 %311 
					                               f32_2 %313 = OpFMul %310 %312 
					                               f32_2 %315 = OpFAdd %313 %314 
					                                              OpStore %71 %315 
					                        Private f32* %316 = OpAccessChain %71 %127 
					                                 f32 %317 = OpLoad %316 
					                        Private f32* %318 = OpAccessChain %71 %32 
					                                 f32 %319 = OpLoad %318 
					                                 f32 %320 = OpFMul %317 %319 
					                        Private f32* %321 = OpAccessChain %71 %32 
					                                              OpStore %321 %320 
					                                 f32 %322 = OpLoad %156 
					                        Private f32* %323 = OpAccessChain %89 %32 
					                                 f32 %324 = OpLoad %323 
					                                 f32 %325 = OpFAdd %322 %324 
					                                              OpStore %156 %325 
					                                 f32 %327 = OpLoad %156 
					                                 f32 %328 = OpExtInst %1 8 %327 
					                        Private f32* %329 = OpAccessChain %326 %32 
					                                              OpStore %329 %328 
					                                 f32 %330 = OpLoad %156 
					                        Private f32* %331 = OpAccessChain %326 %32 
					                                 f32 %332 = OpLoad %331 
					                                 f32 %333 = OpFNegate %332 
					                                 f32 %334 = OpFAdd %330 %333 
					                                              OpStore %156 %334 
					                                 f32 %335 = OpLoad %156 
					                                 f32 %336 = OpFAdd %335 %86 
					                        Private f32* %337 = OpAccessChain %326 %32 
					                                              OpStore %337 %336 
					                                 f32 %341 = OpLoad %156 
					                               f32_4 %342 = OpCompositeConstruct %341 %341 %341 %341 
					                              bool_4 %346 = OpFOrdGreaterThanEqual %342 %344 
					                              bool_2 %347 = OpVectorShuffle %346 %346 0 1 
					                                              OpStore %340 %347 
					                       Private bool* %348 = OpAccessChain %340 %32 
					                                bool %349 = OpLoad %348 
					                                 f32 %350 = OpSelect %349 %65 %66 
					                                              OpStore %156 %350 
					                       Private bool* %351 = OpAccessChain %340 %127 
					                                bool %352 = OpLoad %351 
					                                 f32 %355 = OpSelect %352 %353 %354 
					                        Private f32* %356 = OpAccessChain %89 %32 
					                                              OpStore %356 %355 
					                                 f32 %357 = OpLoad %156 
					                        Private f32* %358 = OpAccessChain %89 %32 
					                                 f32 %359 = OpLoad %358 
					                                 f32 %360 = OpFAdd %357 %359 
					                                              OpStore %156 %360 
					                                 f32 %361 = OpLoad %156 
					                        Private f32* %362 = OpAccessChain %326 %32 
					                                 f32 %363 = OpLoad %362 
					                                 f32 %364 = OpFMul %361 %363 
					                        Private f32* %365 = OpAccessChain %326 %32 
					                                              OpStore %365 %364 
					                        Private f32* %366 = OpAccessChain %326 %32 
					                                 f32 %367 = OpLoad %366 
					                                 f32 %368 = OpFNegate %367 
					                                 f32 %370 = OpFMul %368 %369 
					                                 f32 %371 = OpFAdd %370 %65 
					                        Private f32* %372 = OpAccessChain %326 %32 
					                                              OpStore %372 %371 
					                                 f32 %373 = OpLoad %156 
					                        Private f32* %374 = OpAccessChain %326 %32 
					                                 f32 %375 = OpLoad %374 
					                                 f32 %376 = OpFMul %373 %375 
					                                              OpStore %156 %376 
					                               f32_3 %377 = OpLoad %109 
					                               f32_2 %378 = OpVectorShuffle %377 %377 0 1 
					                               f32_2 %380 = OpFMul %378 %379 
					                               f32_2 %382 = OpFAdd %380 %381 
					                                              OpStore %326 %382 
					                        Uniform f32* %383 = OpAccessChain %12 %14 
					                                 f32 %384 = OpLoad %383 
					                        Private f32* %385 = OpAccessChain %206 %32 
					                                              OpStore %385 %384 
					                               f32_4 %386 = OpLoad %206 
					                               f32_2 %387 = OpVectorShuffle %386 %386 0 1 
					                               f32_2 %391 = OpFMul %387 %390 
					                               f32_2 %392 = OpLoad %326 
					                               f32_2 %393 = OpFAdd %391 %392 
					                                              OpStore %326 %393 
					                               f32_4 %395 = OpLoad %206 
					                               f32_2 %396 = OpVectorShuffle %395 %395 0 1 
					                               f32_2 %397 = OpFMul %396 %390 
					                                              OpStore %394 %397 
					                               f32_3 %398 = OpLoad %109 
					                               f32_2 %399 = OpVectorShuffle %398 %398 0 1 
					                               f32_2 %401 = OpFMul %399 %400 
					                               f32_2 %402 = OpLoad %394 
					                               f32_2 %403 = OpFAdd %401 %402 
					                               f32_3 %404 = OpLoad %109 
					                               f32_3 %405 = OpVectorShuffle %404 %403 3 1 4 
					                                              OpStore %109 %405 
					                        Private f32* %406 = OpAccessChain %109 %127 
					                                 f32 %407 = OpLoad %406 
					                                 f32 %409 = OpFMul %407 %408 
					                        Uniform f32* %410 = OpAccessChain %12 %14 
					                                 f32 %411 = OpLoad %410 
					                                 f32 %412 = OpFAdd %409 %411 
					                                              OpStore %295 %412 
					                 read_only Texture2D %414 = OpLoad %263 
					                             sampler %415 = OpLoad %267 
					          read_only Texture2DSampled %416 = OpSampledImage %414 %415 
					                               f32_3 %417 = OpLoad %109 
					                               f32_2 %418 = OpVectorShuffle %417 %417 0 2 
					                               f32_4 %419 = OpImageSampleImplicitLod %416 %418 
					                                 f32 %420 = OpCompositeExtract %419 0 
					                                              OpStore %413 %420 
					                                 f32 %422 = OpLoad %413 
					                                 f32 %423 = OpLoad %413 
					                                 f32 %424 = OpFMul %422 %423 
					                                              OpStore %421 %424 
					                 read_only Texture2D %426 = OpLoad %263 
					                             sampler %427 = OpLoad %267 
					          read_only Texture2DSampled %428 = OpSampledImage %426 %427 
					                               f32_2 %429 = OpLoad %326 
					                               f32_4 %430 = OpImageSampleImplicitLod %428 %429 
					                                 f32 %431 = OpCompositeExtract %430 0 
					                                              OpStore %425 %431 
					                                 f32 %433 = OpLoad %425 
					                                 f32 %434 = OpLoad %425 
					                                 f32 %435 = OpFMul %433 %434 
					                                              OpStore %432 %435 
					                                 f32 %436 = OpLoad %156 
					                               f32_3 %437 = OpCompositeConstruct %436 %436 %436 
					                                 f32 %438 = OpLoad %432 
					                               f32_3 %439 = OpCompositeConstruct %438 %438 %438 
					                               f32_3 %440 = OpFMul %437 %439 
					                               f32_3 %441 = OpLoad %260 
					                               f32_3 %442 = OpFAdd %440 %441 
					                               f32_4 %443 = OpLoad %9 
					                               f32_4 %444 = OpVectorShuffle %443 %442 4 5 6 3 
					                                              OpStore %9 %444 
					                                 f32 %445 = OpLoad %421 
					                               f32_3 %446 = OpCompositeConstruct %445 %445 %445 
					                               f32_3 %448 = OpFMul %446 %447 
					                               f32_4 %449 = OpLoad %9 
					                               f32_3 %450 = OpVectorShuffle %449 %449 0 1 2 
					                               f32_3 %451 = OpFAdd %448 %450 
					                               f32_4 %452 = OpLoad %9 
					                               f32_4 %453 = OpVectorShuffle %452 %451 4 5 6 3 
					                                              OpStore %9 %453 
					                               f32_2 %454 = OpLoad %71 
					                               f32_3 %455 = OpVectorShuffle %454 %454 0 0 0 
					                               f32_4 %456 = OpLoad %9 
					                               f32_3 %457 = OpVectorShuffle %456 %456 0 1 2 
					                               f32_3 %458 = OpFMul %455 %457 
					                               f32_4 %459 = OpLoad %9 
					                               f32_4 %460 = OpVectorShuffle %459 %458 4 5 6 3 
					                                              OpStore %9 %460 
					                                 f32 %461 = OpLoad %295 
					                                 f32 %462 = OpExtInst %1 8 %461 
					                                              OpStore %156 %462 
					                                 f32 %463 = OpLoad %156 
					                                 f32 %464 = OpFNegate %463 
					                                 f32 %465 = OpLoad %295 
					                                 f32 %466 = OpFAdd %464 %465 
					                                              OpStore %156 %466 
					                                 f32 %467 = OpLoad %156 
					                                 f32 %469 = OpFAdd %467 %468 
					                                              OpStore %156 %469 
					                                 f32 %470 = OpLoad %156 
					                                 f32 %472 = OpFMul %470 %471 
					                                              OpStore %156 %472 
					                                 f32 %475 = OpLoad %156 
					                               f32_3 %476 = OpCompositeConstruct %475 %475 %475 
					                               f32_4 %477 = OpLoad %9 
					                               f32_3 %478 = OpVectorShuffle %477 %477 0 1 2 
					                               f32_3 %479 = OpFMul %476 %478 
					                               f32_4 %480 = OpLoad %474 
					                               f32_4 %481 = OpVectorShuffle %480 %479 4 5 6 3 
					                                              OpStore %474 %481 
					                         Output f32* %483 = OpAccessChain %474 %290 
					                                              OpStore %483 %65 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec3 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					float u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat6;
					float u_xlat16_6;
					float u_xlat10;
					vec2 u_xlat11;
					bvec2 u_xlatb11;
					vec2 u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.25, 4.0, 80.0, 3.0);
					    u_xlat5.xyz = cos(u_xlat0.yzw);
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = _TimeX * 0.25 + (-u_xlat0.x);
					    u_xlat5.x = u_xlat5.x * 4.0 + _TimeX;
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlatb5 = u_xlat5.x>=0.300000012;
					    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.yx * vec2(1.20000005, 1.20000005);
					    u_xlat11.x = dot(u_xlat11.yy, u_xlat11.xx);
					    u_xlat11.x = u_xlat11.x + 0.833333313;
					    u_xlat2.xy = u_xlat1.yx * u_xlat11.xx + vec2(0.5, 0.5);
					    u_xlat1.xy = u_xlat11.xx * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat11.x = u_xlat2.y * 10.0 + _TimeX;
					    u_xlat11.x = sin(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 0.0199999996;
					    u_xlat0.y = u_xlat5.x * u_xlat11.x;
					    u_xlat0.z = u_xlat5.y + 1.0;
					    u_xlat15 = u_xlat5.z * 2.0 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					    u_xlatb15 = u_xlat15>=0.899999976;
					    u_xlat15 = u_xlatb15 ? 0.400000006 : float(0.0);
					    u_xlat0.x = (-u_xlat0.x) + u_xlat2.y;
					    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * 20.0 + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat2.x;
					    u_xlat3 = vec4(_TimeX) * vec4(20.0, 200.0, 5.0, 0.5);
					    u_xlat11.xy = sin(u_xlat3.xy);
					    u_xlat10 = u_xlat11.y * 0.100000001;
					    u_xlat3.x = sin(_TimeX);
					    u_xlat4 = cos(_TimeX);
					    u_xlat10 = u_xlat10 * u_xlat4;
					    u_xlat10 = u_xlat3.x * u_xlat11.x + u_xlat10;
					    u_xlat3.y = u_xlat4 * _TimeX;
					    u_xlat10 = u_xlat10 + 0.5;
					    u_xlat10 = u_xlat15 * u_xlat10 + u_xlat2.y;
					    u_xlat15 = floor(u_xlat10);
					    u_xlat0.y = (-u_xlat15) + u_xlat10;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat15 = _TimeX * 0.629999995;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat11.x = u_xlat2.y * 4.0 + u_xlat3.w;
					    u_xlat16 = cos(u_xlat3.z);
					    u_xlat16 = u_xlat16 * 5.0 + _TimeX;
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 0.300000012 + 3.0;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(u_xlat16) + vec2(1.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = floor(u_xlat15);
					    u_xlat15 = u_xlat15 + (-u_xlat6.x);
					    u_xlat6.x = u_xlat15 + -0.5;
					    u_xlatb11.xy = greaterThanEqual(vec4(u_xlat15), vec4(0.5, 0.600000024, 0.5, 0.600000024)).xy;
					    u_xlat15 = u_xlatb11.x ? 1.0 : float(0.0);
					    u_xlat11.x = (u_xlatb11.y) ? -1.0 : -0.0;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = u_xlat15 * u_xlat6.x;
					    u_xlat6.x = (-u_xlat6.x) * 9.99999809 + 1.0;
					    u_xlat15 = u_xlat15 * u_xlat6.x;
					    u_xlat6.xy = u_xlat2.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat3.x = _TimeX;
					    u_xlat6.xy = u_xlat3.xy * vec2(8.0, 16.0) + u_xlat6.xy;
					    u_xlat12.xy = u_xlat3.xy * vec2(8.0, 16.0);
					    u_xlat2.xz = u_xlat2.xy * vec2(2.0, 2.0) + u_xlat12.xy;
					    u_xlat16 = u_xlat2.y * 30.0 + _TimeX;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xz);
					    u_xlat16_2 = u_xlat10_2.x * u_xlat10_2.x;
					    u_xlat10_3 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_6 = u_xlat10_3.x * u_xlat10_3.x;
					    u_xlat0.xyz = vec3(u_xlat15) * vec3(u_xlat16_6) + u_xlat10_0.xyz;
					    u_xlat0.xyz = vec3(u_xlat16_2) * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat15 = floor(u_xlat16);
					    u_xlat15 = (-u_xlat15) + u_xlat16;
					    u_xlat15 = u_xlat15 + 12.0;
					    u_xlat15 = u_xlat15 * 0.0769230798;
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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