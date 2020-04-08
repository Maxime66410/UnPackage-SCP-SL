Shader "CameraFilterPack/Oculus_NightVision3" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_BinocularSize ("_BinocularSize", Range(0, 1)) = 0.5
		_BinocularDistance ("_BinocularDistance", Range(0, 1)) = 0.5
		_Greenness ("_Greenness", Range(0, 1)) = 0.4
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 2973
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
					uniform 	float _Greenness;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					bvec2 u_xlatb2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(80.0, 0.25, 0.230000004, 10.0);
					    u_xlat10 = sin(u_xlat0.z);
					    u_xlat10 = u_xlat10 + _TimeX;
					    u_xlat10 = sin(u_xlat10);
					    u_xlat1.yz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5 = u_xlat1.z * 2.0 + u_xlat0.y;
					    u_xlat5 = u_xlat10 + u_xlat5;
					    u_xlat10 = floor(u_xlat5);
					    u_xlat5 = (-u_xlat10) + u_xlat5;
					    u_xlatb2.xy = greaterThanEqual(vec4(u_xlat5), vec4(0.400000006, 0.600000024, 0.0, 0.0)).xy;
					    u_xlat5 = u_xlat5 + -0.400000006;
					    u_xlat10 = u_xlatb2.x ? 1.0 : float(0.0);
					    u_xlat16 = (u_xlatb2.y) ? -1.0 : -0.0;
					    u_xlat10 = u_xlat10 + u_xlat16;
					    u_xlat5 = u_xlat10 * u_xlat5;
					    u_xlat5 = (-u_xlat5) * 4.99999952 + 1.0;
					    u_xlat5 = u_xlat10 * u_xlat5;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat10 = u_xlat1.z * 300.0 + u_xlat0.w;
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 0.100000001 + 0.899999976;
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat15 = _TimeX + _TimeX;
					    u_xlat15 = cos(u_xlat15);
					    u_xlat15 = u_xlat15 * 2.0 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					    u_xlatb15 = u_xlat15>=0.899999976;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat2.xy = u_xlat1.zz * vec2(20.0, 30.0) + vec2(_TimeX);
					    u_xlat16 = sin(u_xlat2.x);
					    u_xlat16 = u_xlat16 * 0.00400000019;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat1.x = u_xlat15 * u_xlat0.x + u_xlat1.y;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xz);
					    u_xlat0.x = cos(_TimeX);
					    u_xlat4.y = u_xlat0.x * _TimeX;
					    u_xlat4.x = _TimeX;
					    u_xlat0.xw = u_xlat1.yz * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat0.xw = u_xlat4.xy * vec2(8.0, 16.0) + u_xlat0.xw;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xw);
					    u_xlat16_0 = u_xlat10_4.x * u_xlat10_4.x;
					    u_xlat0.x = u_xlat5 * u_xlat16_0 + u_xlat10_3.x;
					    u_xlat5 = floor(u_xlat2.y);
					    u_xlat5 = (-u_xlat5) + u_xlat2.y;
					    u_xlat5 = u_xlat5 + 12.0;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat0.y = u_xlat1.y * u_xlat1.z;
					    u_xlat1.xy = (-u_xlat1.yz) + vec2(1.5, 1.5);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.0769230798, 6.0);
					    u_xlat5 = u_xlat1.x * u_xlat0.y;
					    u_xlat5 = u_xlat1.y * u_xlat5;
					    u_xlat5 = u_xlat5 * _Greenness + 0.5;
					    u_xlat1.x = u_xlat5 * u_xlat0.x;
					    u_xlat1.y = _Greenness * 0.25 + 1.54999995;
					    u_xlat0.xyw = u_xlat1.xyx * vec3(_Greenness);
					    u_xlat1.z = 0.550000012;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.zxz;
					    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyw;
					    u_xlat15 = _TimeX * 110.0;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.00999999978 + 0.790000021;
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
					; Bound: 364
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %41 %353 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %10 0 Offset 10 
					                                              OpMemberDecorate %10 1 Offset 10 
					                                              OpMemberDecorate %10 2 RelaxedPrecision 
					                                              OpMemberDecorate %10 2 Offset 10 
					                                              OpDecorate %10 Block 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate vs_TEXCOORD0 Location 41 
					                                              OpDecorate %46 RelaxedPrecision 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %50 RelaxedPrecision 
					                                              OpDecorate %51 RelaxedPrecision 
					                                              OpDecorate %187 RelaxedPrecision 
					                                              OpDecorate %190 RelaxedPrecision 
					                                              OpDecorate %190 DescriptorSet 190 
					                                              OpDecorate %190 Binding 190 
					                                              OpDecorate %191 RelaxedPrecision 
					                                              OpDecorate %194 RelaxedPrecision 
					                                              OpDecorate %194 DescriptorSet 194 
					                                              OpDecorate %194 Binding 194 
					                                              OpDecorate %195 RelaxedPrecision 
					                                              OpDecorate %201 RelaxedPrecision 
					                                              OpDecorate %234 RelaxedPrecision 
					                                              OpDecorate %235 RelaxedPrecision 
					                                              OpDecorate %236 RelaxedPrecision 
					                                              OpDecorate %241 RelaxedPrecision 
					                                              OpDecorate %242 RelaxedPrecision 
					                                              OpDecorate %243 RelaxedPrecision 
					                                              OpDecorate %244 RelaxedPrecision 
					                                              OpDecorate %245 RelaxedPrecision 
					                                              OpDecorate %247 RelaxedPrecision 
					                                              OpDecorate %249 RelaxedPrecision 
					                                              OpDecorate %353 Location 353 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeStruct %6 %6 %7 
					                                      %11 = OpTypePointer Uniform %10 
					   Uniform struct {f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                      %13 = OpTypeInt 32 1 
					                                  i32 %14 = OpConstant 0 
					                                      %15 = OpTypePointer Uniform %6 
					                                  f32 %19 = OpConstant 3,674022E-40 
					                                  f32 %20 = OpConstant 3,674022E-40 
					                                  f32 %21 = OpConstant 3,674022E-40 
					                                  f32 %22 = OpConstant 3,674022E-40 
					                                f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
					                                      %25 = OpTypePointer Private %6 
					                         Private f32* %26 = OpVariable Private 
					                                      %27 = OpTypeInt 32 0 
					                                  u32 %28 = OpConstant 2 
					                       Private f32_4* %38 = OpVariable Private 
					                                      %39 = OpTypeVector %6 2 
					                                      %40 = OpTypePointer Input %39 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                  i32 %43 = OpConstant 2 
					                                      %44 = OpTypePointer Uniform %7 
					                         Private f32* %55 = OpVariable Private 
					                                  f32 %58 = OpConstant 3,674022E-40 
					                                  u32 %60 = OpConstant 1 
					                                      %73 = OpTypeBool 
					                                      %74 = OpTypeVector %73 2 
					                                      %75 = OpTypePointer Private %74 
					                      Private bool_2* %76 = OpVariable Private 
					                                  f32 %79 = OpConstant 3,674022E-40 
					                                  f32 %80 = OpConstant 3,674022E-40 
					                                  f32 %81 = OpConstant 3,674022E-40 
					                                f32_4 %82 = OpConstantComposite %79 %80 %81 %81 
					                                      %83 = OpTypeVector %73 4 
					                                  f32 %87 = OpConstant 3,674022E-40 
					                                  u32 %89 = OpConstant 0 
					                                      %90 = OpTypePointer Private %73 
					                                  f32 %93 = OpConstant 3,674022E-40 
					                         Private f32* %95 = OpVariable Private 
					                                  f32 %98 = OpConstant 3,674022E-40 
					                                  f32 %99 = OpConstant 3,674022E-40 
					                                 f32 %109 = OpConstant 3,674022E-40 
					                                 f32 %121 = OpConstant 3,674022E-40 
					                                 u32 %123 = OpConstant 3 
					                                 f32 %130 = OpConstant 3,674022E-40 
					                                 f32 %132 = OpConstant 3,674022E-40 
					                        Private f32* %138 = OpVariable Private 
					                       Private bool* %153 = OpVariable Private 
					                                     %158 = OpTypePointer Private %39 
					                      Private f32_2* %159 = OpVariable Private 
					                                 f32 %162 = OpConstant 3,674022E-40 
					                                 f32 %163 = OpConstant 3,674022E-40 
					                               f32_2 %164 = OpConstantComposite %162 %163 
					                                 f32 %174 = OpConstant 3,674022E-40 
					                        Private f32* %187 = OpVariable Private 
					                                     %188 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %189 = OpTypePointer UniformConstant %188 
					UniformConstant read_only Texture2D* %190 = OpVariable UniformConstant 
					                                     %192 = OpTypeSampler 
					                                     %193 = OpTypePointer UniformConstant %192 
					            UniformConstant sampler* %194 = OpVariable UniformConstant 
					                                     %196 = OpTypeSampledImage %188 
					                      Private f32_2* %205 = OpVariable Private 
					                                 f32 %216 = OpConstant 3,674022E-40 
					                               f32_2 %217 = OpConstantComposite %216 %93 
					                                 f32 %219 = OpConstant 3,674022E-40 
					                               f32_2 %220 = OpConstantComposite %93 %219 
					                                 f32 %225 = OpConstant 3,674022E-40 
					                                 f32 %226 = OpConstant 3,674022E-40 
					                               f32_2 %227 = OpConstantComposite %225 %226 
					                        Private f32* %234 = OpVariable Private 
					                        Private f32* %242 = OpVariable Private 
					                                 f32 %261 = OpConstant 3,674022E-40 
					                                 f32 %277 = OpConstant 3,674022E-40 
					                               f32_2 %278 = OpConstantComposite %277 %277 
					                                 f32 %284 = OpConstant 3,674022E-40 
					                                 f32 %285 = OpConstant 3,674022E-40 
					                               f32_2 %286 = OpConstantComposite %284 %285 
					                                 i32 %300 = OpConstant 1 
					                                 f32 %313 = OpConstant 3,674022E-40 
					                                     %316 = OpTypeVector %6 3 
					                                 f32 %325 = OpConstant 3,674022E-40 
					                                 f32 %343 = OpConstant 3,674022E-40 
					                                 f32 %348 = OpConstant 3,674022E-40 
					                                 f32 %350 = OpConstant 3,674022E-40 
					                                     %352 = OpTypePointer Output %7 
					                       Output f32_4* %353 = OpVariable Output 
					                                     %361 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                         Uniform f32* %16 = OpAccessChain %12 %14 
					                                  f32 %17 = OpLoad %16 
					                                f32_4 %18 = OpCompositeConstruct %17 %17 %17 %17 
					                                f32_4 %24 = OpFMul %18 %23 
					                                              OpStore %9 %24 
					                         Private f32* %29 = OpAccessChain %9 %28 
					                                  f32 %30 = OpLoad %29 
					                                  f32 %31 = OpExtInst %1 13 %30 
					                                              OpStore %26 %31 
					                                  f32 %32 = OpLoad %26 
					                         Uniform f32* %33 = OpAccessChain %12 %14 
					                                  f32 %34 = OpLoad %33 
					                                  f32 %35 = OpFAdd %32 %34 
					                                              OpStore %26 %35 
					                                  f32 %36 = OpLoad %26 
					                                  f32 %37 = OpExtInst %1 13 %36 
					                                              OpStore %26 %37 
					                                f32_2 %42 = OpLoad vs_TEXCOORD0 
					                       Uniform f32_4* %45 = OpAccessChain %12 %43 
					                                f32_4 %46 = OpLoad %45 
					                                f32_2 %47 = OpVectorShuffle %46 %46 0 1 
					                                f32_2 %48 = OpFMul %42 %47 
					                       Uniform f32_4* %49 = OpAccessChain %12 %43 
					                                f32_4 %50 = OpLoad %49 
					                                f32_2 %51 = OpVectorShuffle %50 %50 2 3 
					                                f32_2 %52 = OpFAdd %48 %51 
					                                f32_4 %53 = OpLoad %38 
					                                f32_4 %54 = OpVectorShuffle %53 %52 0 4 5 3 
					                                              OpStore %38 %54 
					                         Private f32* %56 = OpAccessChain %38 %28 
					                                  f32 %57 = OpLoad %56 
					                                  f32 %59 = OpFMul %57 %58 
					                         Private f32* %61 = OpAccessChain %9 %60 
					                                  f32 %62 = OpLoad %61 
					                                  f32 %63 = OpFAdd %59 %62 
					                                              OpStore %55 %63 
					                                  f32 %64 = OpLoad %26 
					                                  f32 %65 = OpLoad %55 
					                                  f32 %66 = OpFAdd %64 %65 
					                                              OpStore %55 %66 
					                                  f32 %67 = OpLoad %55 
					                                  f32 %68 = OpExtInst %1 8 %67 
					                                              OpStore %26 %68 
					                                  f32 %69 = OpLoad %26 
					                                  f32 %70 = OpFNegate %69 
					                                  f32 %71 = OpLoad %55 
					                                  f32 %72 = OpFAdd %70 %71 
					                                              OpStore %55 %72 
					                                  f32 %77 = OpLoad %55 
					                                f32_4 %78 = OpCompositeConstruct %77 %77 %77 %77 
					                               bool_4 %84 = OpFOrdGreaterThanEqual %78 %82 
					                               bool_2 %85 = OpVectorShuffle %84 %84 0 1 
					                                              OpStore %76 %85 
					                                  f32 %86 = OpLoad %55 
					                                  f32 %88 = OpFAdd %86 %87 
					                                              OpStore %55 %88 
					                        Private bool* %91 = OpAccessChain %76 %89 
					                                 bool %92 = OpLoad %91 
					                                  f32 %94 = OpSelect %92 %93 %81 
					                                              OpStore %26 %94 
					                        Private bool* %96 = OpAccessChain %76 %60 
					                                 bool %97 = OpLoad %96 
					                                 f32 %100 = OpSelect %97 %98 %99 
					                                              OpStore %95 %100 
					                                 f32 %101 = OpLoad %26 
					                                 f32 %102 = OpLoad %95 
					                                 f32 %103 = OpFAdd %101 %102 
					                                              OpStore %26 %103 
					                                 f32 %104 = OpLoad %26 
					                                 f32 %105 = OpLoad %55 
					                                 f32 %106 = OpFMul %104 %105 
					                                              OpStore %55 %106 
					                                 f32 %107 = OpLoad %55 
					                                 f32 %108 = OpFNegate %107 
					                                 f32 %110 = OpFMul %108 %109 
					                                 f32 %111 = OpFAdd %110 %93 
					                                              OpStore %55 %111 
					                                 f32 %112 = OpLoad %26 
					                                 f32 %113 = OpLoad %55 
					                                 f32 %114 = OpFMul %112 %113 
					                                              OpStore %55 %114 
					                        Private f32* %115 = OpAccessChain %9 %89 
					                                 f32 %116 = OpLoad %115 
					                                 f32 %117 = OpExtInst %1 14 %116 
					                        Private f32* %118 = OpAccessChain %9 %89 
					                                              OpStore %118 %117 
					                        Private f32* %119 = OpAccessChain %38 %28 
					                                 f32 %120 = OpLoad %119 
					                                 f32 %122 = OpFMul %120 %121 
					                        Private f32* %124 = OpAccessChain %9 %123 
					                                 f32 %125 = OpLoad %124 
					                                 f32 %126 = OpFAdd %122 %125 
					                                              OpStore %26 %126 
					                                 f32 %127 = OpLoad %26 
					                                 f32 %128 = OpExtInst %1 13 %127 
					                                              OpStore %26 %128 
					                                 f32 %129 = OpLoad %26 
					                                 f32 %131 = OpFMul %129 %130 
					                                 f32 %133 = OpFAdd %131 %132 
					                                              OpStore %26 %133 
					                        Private f32* %134 = OpAccessChain %9 %89 
					                                 f32 %135 = OpLoad %134 
					                                 f32 %136 = OpFAdd %135 %93 
					                        Private f32* %137 = OpAccessChain %9 %89 
					                                              OpStore %137 %136 
					                        Uniform f32* %139 = OpAccessChain %12 %14 
					                                 f32 %140 = OpLoad %139 
					                        Uniform f32* %141 = OpAccessChain %12 %14 
					                                 f32 %142 = OpLoad %141 
					                                 f32 %143 = OpFAdd %140 %142 
					                                              OpStore %138 %143 
					                                 f32 %144 = OpLoad %138 
					                                 f32 %145 = OpExtInst %1 14 %144 
					                                              OpStore %138 %145 
					                                 f32 %146 = OpLoad %138 
					                                 f32 %147 = OpFMul %146 %58 
					                        Uniform f32* %148 = OpAccessChain %12 %14 
					                                 f32 %149 = OpLoad %148 
					                                 f32 %150 = OpFAdd %147 %149 
					                                              OpStore %138 %150 
					                                 f32 %151 = OpLoad %138 
					                                 f32 %152 = OpExtInst %1 13 %151 
					                                              OpStore %138 %152 
					                                 f32 %154 = OpLoad %138 
					                                bool %155 = OpFOrdGreaterThanEqual %154 %132 
					                                              OpStore %153 %155 
					                                bool %156 = OpLoad %153 
					                                 f32 %157 = OpSelect %156 %93 %81 
					                                              OpStore %138 %157 
					                               f32_4 %160 = OpLoad %38 
					                               f32_2 %161 = OpVectorShuffle %160 %160 2 2 
					                               f32_2 %165 = OpFMul %161 %164 
					                        Uniform f32* %166 = OpAccessChain %12 %14 
					                                 f32 %167 = OpLoad %166 
					                               f32_2 %168 = OpCompositeConstruct %167 %167 
					                               f32_2 %169 = OpFAdd %165 %168 
					                                              OpStore %159 %169 
					                        Private f32* %170 = OpAccessChain %159 %89 
					                                 f32 %171 = OpLoad %170 
					                                 f32 %172 = OpExtInst %1 13 %171 
					                                              OpStore %95 %172 
					                                 f32 %173 = OpLoad %95 
					                                 f32 %175 = OpFMul %173 %174 
					                                              OpStore %95 %175 
					                                 f32 %176 = OpLoad %138 
					                                 f32 %177 = OpLoad %95 
					                                 f32 %178 = OpFMul %176 %177 
					                                              OpStore %138 %178 
					                                 f32 %179 = OpLoad %138 
					                        Private f32* %180 = OpAccessChain %9 %89 
					                                 f32 %181 = OpLoad %180 
					                                 f32 %182 = OpFMul %179 %181 
					                        Private f32* %183 = OpAccessChain %38 %60 
					                                 f32 %184 = OpLoad %183 
					                                 f32 %185 = OpFAdd %182 %184 
					                        Private f32* %186 = OpAccessChain %38 %89 
					                                              OpStore %186 %185 
					                 read_only Texture2D %191 = OpLoad %190 
					                             sampler %195 = OpLoad %194 
					          read_only Texture2DSampled %197 = OpSampledImage %191 %195 
					                               f32_4 %198 = OpLoad %38 
					                               f32_2 %199 = OpVectorShuffle %198 %198 0 2 
					                               f32_4 %200 = OpImageSampleImplicitLod %197 %199 
					                                 f32 %201 = OpCompositeExtract %200 0 
					                                              OpStore %187 %201 
					                        Uniform f32* %202 = OpAccessChain %12 %14 
					                                 f32 %203 = OpLoad %202 
					                                 f32 %204 = OpExtInst %1 14 %203 
					                                              OpStore %138 %204 
					                                 f32 %206 = OpLoad %138 
					                        Uniform f32* %207 = OpAccessChain %12 %14 
					                                 f32 %208 = OpLoad %207 
					                                 f32 %209 = OpFMul %206 %208 
					                        Private f32* %210 = OpAccessChain %205 %60 
					                                              OpStore %210 %209 
					                        Uniform f32* %211 = OpAccessChain %12 %14 
					                                 f32 %212 = OpLoad %211 
					                        Private f32* %213 = OpAccessChain %205 %89 
					                                              OpStore %213 %212 
					                               f32_4 %214 = OpLoad %38 
					                               f32_2 %215 = OpVectorShuffle %214 %214 1 2 
					                               f32_2 %218 = OpFMul %215 %217 
					                               f32_2 %221 = OpFAdd %218 %220 
					                               f32_4 %222 = OpLoad %38 
					                               f32_4 %223 = OpVectorShuffle %222 %221 4 1 2 5 
					                                              OpStore %38 %223 
					                               f32_2 %224 = OpLoad %205 
					                               f32_2 %228 = OpFMul %224 %227 
					                               f32_4 %229 = OpLoad %38 
					                               f32_2 %230 = OpVectorShuffle %229 %229 0 3 
					                               f32_2 %231 = OpFAdd %228 %230 
					                               f32_4 %232 = OpLoad %38 
					                               f32_4 %233 = OpVectorShuffle %232 %231 4 1 2 5 
					                                              OpStore %38 %233 
					                 read_only Texture2D %235 = OpLoad %190 
					                             sampler %236 = OpLoad %194 
					          read_only Texture2DSampled %237 = OpSampledImage %235 %236 
					                               f32_4 %238 = OpLoad %38 
					                               f32_2 %239 = OpVectorShuffle %238 %238 0 3 
					                               f32_4 %240 = OpImageSampleImplicitLod %237 %239 
					                                 f32 %241 = OpCompositeExtract %240 0 
					                                              OpStore %234 %241 
					                                 f32 %243 = OpLoad %234 
					                                 f32 %244 = OpLoad %234 
					                                 f32 %245 = OpFMul %243 %244 
					                                              OpStore %242 %245 
					                                 f32 %246 = OpLoad %55 
					                                 f32 %247 = OpLoad %242 
					                                 f32 %248 = OpFMul %246 %247 
					                                 f32 %249 = OpLoad %187 
					                                 f32 %250 = OpFAdd %248 %249 
					                        Private f32* %251 = OpAccessChain %9 %89 
					                                              OpStore %251 %250 
					                        Private f32* %252 = OpAccessChain %159 %60 
					                                 f32 %253 = OpLoad %252 
					                                 f32 %254 = OpExtInst %1 8 %253 
					                                              OpStore %55 %254 
					                                 f32 %255 = OpLoad %55 
					                                 f32 %256 = OpFNegate %255 
					                        Private f32* %257 = OpAccessChain %159 %60 
					                                 f32 %258 = OpLoad %257 
					                                 f32 %259 = OpFAdd %256 %258 
					                                              OpStore %55 %259 
					                                 f32 %260 = OpLoad %55 
					                                 f32 %262 = OpFAdd %260 %261 
					                                              OpStore %55 %262 
					                        Private f32* %263 = OpAccessChain %9 %89 
					                                 f32 %264 = OpLoad %263 
					                                 f32 %265 = OpLoad %55 
					                                 f32 %266 = OpFMul %264 %265 
					                        Private f32* %267 = OpAccessChain %9 %89 
					                                              OpStore %267 %266 
					                        Private f32* %268 = OpAccessChain %38 %60 
					                                 f32 %269 = OpLoad %268 
					                        Private f32* %270 = OpAccessChain %38 %28 
					                                 f32 %271 = OpLoad %270 
					                                 f32 %272 = OpFMul %269 %271 
					                        Private f32* %273 = OpAccessChain %9 %60 
					                                              OpStore %273 %272 
					                               f32_4 %274 = OpLoad %38 
					                               f32_2 %275 = OpVectorShuffle %274 %274 1 2 
					                               f32_2 %276 = OpFNegate %275 
					                               f32_2 %279 = OpFAdd %276 %278 
					                               f32_4 %280 = OpLoad %38 
					                               f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
					                                              OpStore %38 %281 
					                               f32_4 %282 = OpLoad %9 
					                               f32_2 %283 = OpVectorShuffle %282 %282 0 1 
					                               f32_2 %287 = OpFMul %283 %286 
					                               f32_4 %288 = OpLoad %9 
					                               f32_4 %289 = OpVectorShuffle %288 %287 4 5 2 3 
					                                              OpStore %9 %289 
					                        Private f32* %290 = OpAccessChain %38 %89 
					                                 f32 %291 = OpLoad %290 
					                        Private f32* %292 = OpAccessChain %9 %60 
					                                 f32 %293 = OpLoad %292 
					                                 f32 %294 = OpFMul %291 %293 
					                                              OpStore %55 %294 
					                        Private f32* %295 = OpAccessChain %38 %60 
					                                 f32 %296 = OpLoad %295 
					                                 f32 %297 = OpLoad %55 
					                                 f32 %298 = OpFMul %296 %297 
					                                              OpStore %55 %298 
					                                 f32 %299 = OpLoad %55 
					                        Uniform f32* %301 = OpAccessChain %12 %300 
					                                 f32 %302 = OpLoad %301 
					                                 f32 %303 = OpFMul %299 %302 
					                                 f32 %304 = OpFAdd %303 %216 
					                                              OpStore %55 %304 
					                                 f32 %305 = OpLoad %55 
					                        Private f32* %306 = OpAccessChain %9 %89 
					                                 f32 %307 = OpLoad %306 
					                                 f32 %308 = OpFMul %305 %307 
					                        Private f32* %309 = OpAccessChain %38 %89 
					                                              OpStore %309 %308 
					                        Uniform f32* %310 = OpAccessChain %12 %300 
					                                 f32 %311 = OpLoad %310 
					                                 f32 %312 = OpFMul %311 %20 
					                                 f32 %314 = OpFAdd %312 %313 
					                        Private f32* %315 = OpAccessChain %38 %60 
					                                              OpStore %315 %314 
					                               f32_4 %317 = OpLoad %38 
					                               f32_3 %318 = OpVectorShuffle %317 %317 0 1 0 
					                        Uniform f32* %319 = OpAccessChain %12 %300 
					                                 f32 %320 = OpLoad %319 
					                               f32_3 %321 = OpCompositeConstruct %320 %320 %320 
					                               f32_3 %322 = OpFMul %318 %321 
					                               f32_4 %323 = OpLoad %9 
					                               f32_4 %324 = OpVectorShuffle %323 %322 4 5 2 6 
					                                              OpStore %9 %324 
					                        Private f32* %326 = OpAccessChain %38 %28 
					                                              OpStore %326 %325 
					                               f32_4 %327 = OpLoad %9 
					                               f32_3 %328 = OpVectorShuffle %327 %327 0 1 3 
					                               f32_4 %329 = OpLoad %38 
					                               f32_3 %330 = OpVectorShuffle %329 %329 2 0 2 
					                               f32_3 %331 = OpFMul %328 %330 
					                               f32_4 %332 = OpLoad %9 
					                               f32_4 %333 = OpVectorShuffle %332 %331 4 5 2 6 
					                                              OpStore %9 %333 
					                                 f32 %334 = OpLoad %26 
					                               f32_3 %335 = OpCompositeConstruct %334 %334 %334 
					                               f32_4 %336 = OpLoad %9 
					                               f32_3 %337 = OpVectorShuffle %336 %336 0 1 3 
					                               f32_3 %338 = OpFMul %335 %337 
					                               f32_4 %339 = OpLoad %9 
					                               f32_4 %340 = OpVectorShuffle %339 %338 4 5 6 3 
					                                              OpStore %9 %340 
					                        Uniform f32* %341 = OpAccessChain %12 %14 
					                                 f32 %342 = OpLoad %341 
					                                 f32 %344 = OpFMul %342 %343 
					                                              OpStore %138 %344 
					                                 f32 %345 = OpLoad %138 
					                                 f32 %346 = OpExtInst %1 13 %345 
					                                              OpStore %138 %346 
					                                 f32 %347 = OpLoad %138 
					                                 f32 %349 = OpFMul %347 %348 
					                                 f32 %351 = OpFAdd %349 %350 
					                                              OpStore %138 %351 
					                                 f32 %354 = OpLoad %138 
					                               f32_3 %355 = OpCompositeConstruct %354 %354 %354 
					                               f32_4 %356 = OpLoad %9 
					                               f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
					                               f32_3 %358 = OpFMul %355 %357 
					                               f32_4 %359 = OpLoad %353 
					                               f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
					                                              OpStore %353 %360 
					                         Output f32* %362 = OpAccessChain %353 %123 
					                                              OpStore %362 %93 
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
						vec4 unused_0_2;
						float _Greenness;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					bvec2 u_xlatb2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(80.0, 0.25, 0.230000004, 10.0);
					    u_xlat10 = sin(u_xlat0.z);
					    u_xlat10 = u_xlat10 + _TimeX;
					    u_xlat10 = sin(u_xlat10);
					    u_xlat1.yz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5 = u_xlat1.z * 2.0 + u_xlat0.y;
					    u_xlat5 = u_xlat10 + u_xlat5;
					    u_xlat10 = floor(u_xlat5);
					    u_xlat5 = (-u_xlat10) + u_xlat5;
					    u_xlatb2.xy = greaterThanEqual(vec4(u_xlat5), vec4(0.400000006, 0.600000024, 0.0, 0.0)).xy;
					    u_xlat5 = u_xlat5 + -0.400000006;
					    u_xlat10 = u_xlatb2.x ? 1.0 : float(0.0);
					    u_xlat16 = (u_xlatb2.y) ? -1.0 : -0.0;
					    u_xlat10 = u_xlat10 + u_xlat16;
					    u_xlat5 = u_xlat10 * u_xlat5;
					    u_xlat5 = (-u_xlat5) * 4.99999952 + 1.0;
					    u_xlat5 = u_xlat10 * u_xlat5;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat10 = u_xlat1.z * 300.0 + u_xlat0.w;
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 0.100000001 + 0.899999976;
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat15 = _TimeX + _TimeX;
					    u_xlat15 = cos(u_xlat15);
					    u_xlat15 = u_xlat15 * 2.0 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					    u_xlatb15 = u_xlat15>=0.899999976;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat2.xy = u_xlat1.zz * vec2(20.0, 30.0) + vec2(_TimeX);
					    u_xlat16 = sin(u_xlat2.x);
					    u_xlat16 = u_xlat16 * 0.00400000019;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat1.x = u_xlat15 * u_xlat0.x + u_xlat1.y;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xz);
					    u_xlat0.x = cos(_TimeX);
					    u_xlat4.y = u_xlat0.x * _TimeX;
					    u_xlat4.x = _TimeX;
					    u_xlat0.xw = u_xlat1.yz * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat0.xw = u_xlat4.xy * vec2(8.0, 16.0) + u_xlat0.xw;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xw);
					    u_xlat16_0 = u_xlat10_4.x * u_xlat10_4.x;
					    u_xlat0.x = u_xlat5 * u_xlat16_0 + u_xlat10_3.x;
					    u_xlat5 = floor(u_xlat2.y);
					    u_xlat5 = (-u_xlat5) + u_xlat2.y;
					    u_xlat5 = u_xlat5 + 12.0;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat0.y = u_xlat1.y * u_xlat1.z;
					    u_xlat1.xy = (-u_xlat1.yz) + vec2(1.5, 1.5);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.0769230798, 6.0);
					    u_xlat5 = u_xlat1.x * u_xlat0.y;
					    u_xlat5 = u_xlat1.y * u_xlat5;
					    u_xlat5 = u_xlat5 * _Greenness + 0.5;
					    u_xlat1.x = u_xlat5 * u_xlat0.x;
					    u_xlat1.y = _Greenness * 0.25 + 1.54999995;
					    u_xlat0.xyw = u_xlat1.xyx * vec3(_Greenness);
					    u_xlat1.z = 0.550000012;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.zxz;
					    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyw;
					    u_xlat15 = _TimeX * 110.0;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.00999999978 + 0.790000021;
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