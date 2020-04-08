Shader "CameraFilterPack/CameraFilterPack_NewGlitch2" {
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
			GpuProgramID 20457
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
					uniform 	float _Speed;
					uniform 	float RedFade;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bvec2 u_xlatb1;
					float u_xlat2;
					bvec2 u_xlatb2;
					vec2 u_xlat3;
					bvec3 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat10_6;
					vec3 u_xlat9;
					vec2 u_xlat14;
					bvec2 u_xlatb14;
					vec2 u_xlat15;
					void main()
					{
					    u_xlat0.x = _Speed * _TimeX;
					    u_xlat0.xy = u_xlat0.xx * vec2(1234.0, 3543.0);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat1.xyz = vs_TEXCOORD0.xyy * vec3(50.0, 50.0, 0.333333343);
					    u_xlat14.xy = floor(u_xlat1.xy);
					    u_xlat1.x = fract(u_xlat1.z);
					    u_xlatb1.xy = lessThan(vec4(0.333000004, 0.666000009, 0.0, 0.0), u_xlat1.xxxx).xy;
					    u_xlat0.zw = u_xlat0.xy * vec2(0.015625, 0.015625) + u_xlat14.xy;
					    u_xlat0 = u_xlat0 * vec4(0.015625, 0.015625, 128.0, 128.0);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat15.xy = floor(u_xlat0.zw);
					    u_xlat14.xy = fract(u_xlat0.zw);
					    u_xlat15.x = u_xlat15.y * 59.0 + u_xlat15.x;
					    u_xlat2 = sin(u_xlat15.x);
					    u_xlat9.xyz = u_xlat15.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat9.xyz = sin(u_xlat9.xyz);
					    u_xlat9.xyz = u_xlat9.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat9.xyz = fract(u_xlat9.xyz);
					    u_xlat15.x = u_xlat2 * 43812.1758;
					    u_xlat15.x = fract(u_xlat15.x);
					    u_xlat2 = (-u_xlat15.x) + u_xlat9.x;
					    u_xlat3.xy = u_xlat14.xy * u_xlat14.xy;
					    u_xlat14.xy = (-u_xlat14.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat14.xy = u_xlat14.xy * u_xlat3.xy;
					    u_xlat15.x = u_xlat14.x * u_xlat2 + u_xlat15.x;
					    u_xlat2 = (-u_xlat9.y) + u_xlat9.z;
					    u_xlat14.x = u_xlat14.x * u_xlat2 + u_xlat9.y;
					    u_xlat14.x = (-u_xlat15.x) + u_xlat14.x;
					    u_xlat14.x = u_xlat14.y * u_xlat14.x + u_xlat15.x;
					    u_xlatb2.xy = lessThan(u_xlat14.xxxx, vec4(0.000410417997, 0.000273612008, 0.0, 0.0)).xy;
					    u_xlat14.x = u_xlat15.y + 1.0;
					    u_xlat15.x = sin(u_xlat15.y);
					    u_xlat15.x = u_xlat15.x * 43812.1758;
					    u_xlat15.x = fract(u_xlat15.x);
					    u_xlat14.x = sin(u_xlat14.x);
					    u_xlat14.x = u_xlat14.x * 43812.1758;
					    u_xlat14.x = fract(u_xlat14.x);
					    u_xlat14.x = (-u_xlat15.x) + u_xlat14.x;
					    u_xlat14.x = u_xlat14.y * u_xlat14.x + u_xlat15.x;
					    u_xlatb3.xyz = lessThan(u_xlat14.xxxx, vec4(6.50717775e-05, 1.85919362e-05, 2.60287106e-05, 0.0)).xyz;
					    u_xlatb14.x = u_xlatb2.x || u_xlatb3.x;
					    u_xlatb14.y = u_xlatb2.y || u_xlatb3.z;
					    u_xlat4.zw = u_xlat0.xy * vec2(0.0375000015, 0.0375000015) + vs_TEXCOORD0.xy;
					    u_xlat5 = u_xlat0.xyxy * vec4(0.0300000012, 0.0300000012, 0.0600000024, 0.0600000024) + vs_TEXCOORD0.xyxy;
					    u_xlat4.xy = u_xlat5.zw;
					    u_xlat0.xy = (u_xlatb14.x) ? u_xlat5.xy : vs_TEXCOORD0.xy;
					    u_xlat5 = texture(_MainTex, u_xlat0.xy);
					    u_xlat4 = (u_xlatb14.x) ? u_xlat4 : vs_TEXCOORD0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat4.zw);
					    u_xlat4 = texture(_MainTex, u_xlat4.xy);
					    u_xlat5.z = u_xlat10_6.z;
					    u_xlat4.xz = (u_xlatb2.x) ? u_xlat4.yy : u_xlat5.xz;
					    u_xlat0.y = dot(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.x = float(0.0);
					    u_xlat0.z = float(0.0);
					    u_xlat0.xyz = (u_xlatb3.y) ? u_xlat0.xyz : u_xlat4.xyz;
					    u_xlat1.xzw = (u_xlatb1.x) ? vec3(-1.0, 2.0, -1.0) : vec3(2.0, -1.0, -1.0);
					    u_xlat1.xyz = (u_xlatb1.y) ? vec3(-1.0, -1.0, 2.0) : u_xlat1.xzw;
					    u_xlat1.xyz = vec3(vec3(RedFade, RedFade, RedFade)) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = (u_xlatb14.y) ? u_xlat1.xyz : u_xlat0.xyz;
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
					; Bound: 455
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %42 %437 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %10 0 Offset 10 
					                                              OpMemberDecorate %10 1 Offset 10 
					                                              OpMemberDecorate %10 2 Offset 10 
					                                              OpDecorate %10 Block 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate vs_TEXCOORD0 Location 42 
					                                              OpDecorate %318 RelaxedPrecision 
					                                              OpDecorate %318 DescriptorSet 318 
					                                              OpDecorate %318 Binding 318 
					                                              OpDecorate %319 RelaxedPrecision 
					                                              OpDecorate %322 RelaxedPrecision 
					                                              OpDecorate %322 DescriptorSet 322 
					                                              OpDecorate %322 Binding 322 
					                                              OpDecorate %323 RelaxedPrecision 
					                                              OpDecorate %342 RelaxedPrecision 
					                                              OpDecorate %343 RelaxedPrecision 
					                                              OpDecorate %350 RelaxedPrecision 
					                                              OpDecorate %351 RelaxedPrecision 
					                                              OpDecorate %437 Location 437 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeStruct %6 %6 %6 
					                                      %11 = OpTypePointer Uniform %10 
					     Uniform struct {f32; f32; f32;}* %12 = OpVariable Uniform 
					                                      %13 = OpTypeInt 32 1 
					                                  i32 %14 = OpConstant 1 
					                                      %15 = OpTypePointer Uniform %6 
					                                  i32 %18 = OpConstant 0 
					                                      %22 = OpTypeInt 32 0 
					                                  u32 %23 = OpConstant 0 
					                                      %24 = OpTypePointer Private %6 
					                                      %26 = OpTypeVector %6 2 
					                                  f32 %29 = OpConstant 3,674022E-40 
					                                  f32 %30 = OpConstant 3,674022E-40 
					                                f32_2 %31 = OpConstantComposite %29 %30 
					                       Private f32_4* %40 = OpVariable Private 
					                                      %41 = OpTypePointer Input %26 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %43 = OpTypeVector %6 3 
					                                  f32 %46 = OpConstant 3,674022E-40 
					                                  f32 %47 = OpConstant 3,674022E-40 
					                                f32_3 %48 = OpConstantComposite %46 %46 %47 
					                                      %52 = OpTypePointer Private %26 
					                       Private f32_2* %53 = OpVariable Private 
					                                  u32 %57 = OpConstant 2 
					                                      %62 = OpTypeBool 
					                                      %63 = OpTypeVector %62 2 
					                                      %64 = OpTypePointer Private %63 
					                      Private bool_2* %65 = OpVariable Private 
					                                  f32 %66 = OpConstant 3,674022E-40 
					                                  f32 %67 = OpConstant 3,674022E-40 
					                                  f32 %68 = OpConstant 3,674022E-40 
					                                f32_4 %69 = OpConstantComposite %66 %67 %68 %68 
					                                      %72 = OpTypeVector %62 4 
					                                  f32 %77 = OpConstant 3,674022E-40 
					                                f32_2 %78 = OpConstantComposite %77 %77 
					                                  f32 %85 = OpConstant 3,674022E-40 
					                                f32_4 %86 = OpConstantComposite %77 %77 %85 %85 
					                                  f32 %95 = OpConstant 3,674022E-40 
					                                f32_2 %96 = OpConstantComposite %95 %95 
					                      Private f32_2* %100 = OpVariable Private 
					                                 u32 %107 = OpConstant 1 
					                                 f32 %110 = OpConstant 3,674022E-40 
					                        Private f32* %116 = OpVariable Private 
					                                     %120 = OpTypePointer Private %43 
					                      Private f32_3* %121 = OpVariable Private 
					                                 f32 %124 = OpConstant 3,674022E-40 
					                                 f32 %125 = OpConstant 3,674022E-40 
					                               f32_3 %126 = OpConstantComposite %124 %110 %125 
					                                 f32 %131 = OpConstant 3,674022E-40 
					                               f32_3 %132 = OpConstantComposite %131 %131 %131 
					                      Private f32_2* %149 = OpVariable Private 
					                                 f32 %155 = OpConstant 3,674022E-40 
					                               f32_2 %156 = OpConstantComposite %155 %155 
					                                 f32 %158 = OpConstant 3,674022E-40 
					                               f32_2 %159 = OpConstantComposite %158 %158 
					                     Private bool_2* %202 = OpVariable Private 
					                                 f32 %205 = OpConstant 3,674022E-40 
					                                 f32 %206 = OpConstant 3,674022E-40 
					                               f32_4 %207 = OpConstantComposite %205 %206 %68 %68 
					                                     %254 = OpTypeVector %62 3 
					                                     %255 = OpTypePointer Private %254 
					                     Private bool_3* %256 = OpVariable Private 
					                                 f32 %259 = OpConstant 3,674022E-40 
					                                 f32 %260 = OpConstant 3,674022E-40 
					                                 f32 %261 = OpConstant 3,674022E-40 
					                               f32_4 %262 = OpConstantComposite %259 %260 %261 %68 
					                     Private bool_2* %265 = OpVariable Private 
					                                     %266 = OpTypePointer Private %62 
					                      Private f32_4* %279 = OpVariable Private 
					                                 f32 %282 = OpConstant 3,674022E-40 
					                               f32_2 %283 = OpConstantComposite %282 %282 
					                      Private f32_4* %289 = OpVariable Private 
					                                 f32 %292 = OpConstant 3,674022E-40 
					                                 f32 %293 = OpConstant 3,674022E-40 
					                               f32_4 %294 = OpConstantComposite %292 %292 %293 %293 
					                                     %305 = OpTypePointer Function %26 
					                                     %316 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %317 = OpTypePointer UniformConstant %316 
					UniformConstant read_only Texture2D* %318 = OpVariable UniformConstant 
					                                     %320 = OpTypeSampler 
					                                     %321 = OpTypePointer UniformConstant %320 
					            UniformConstant sampler* %322 = OpVariable UniformConstant 
					                                     %324 = OpTypeSampledImage %316 
					                                     %333 = OpTypePointer Function %7 
					                               f32_3 %372 = OpConstantComposite %124 %124 %124 
					                                     %379 = OpTypePointer Function %43 
					                                 f32 %392 = OpConstant 3,674022E-40 
					                               f32_3 %393 = OpConstantComposite %392 %155 %392 
					                               f32_3 %394 = OpConstantComposite %155 %392 %392 
					                               f32_3 %404 = OpConstantComposite %392 %392 %155 
					                                 i32 %411 = OpConstant 2 
					                                     %436 = OpTypePointer Output %7 
					                       Output f32_4* %437 = OpVariable Output 
					                                 u32 %451 = OpConstant 3 
					                                     %452 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                     Function f32_2* %306 = OpVariable Function 
					                     Function f32_4* %334 = OpVariable Function 
					                     Function f32_2* %360 = OpVariable Function 
					                     Function f32_3* %380 = OpVariable Function 
					                     Function f32_3* %401 = OpVariable Function 
					                     Function f32_3* %440 = OpVariable Function 
					                         Uniform f32* %16 = OpAccessChain %12 %14 
					                                  f32 %17 = OpLoad %16 
					                         Uniform f32* %19 = OpAccessChain %12 %18 
					                                  f32 %20 = OpLoad %19 
					                                  f32 %21 = OpFMul %17 %20 
					                         Private f32* %25 = OpAccessChain %9 %23 
					                                              OpStore %25 %21 
					                                f32_4 %27 = OpLoad %9 
					                                f32_2 %28 = OpVectorShuffle %27 %27 0 0 
					                                f32_2 %32 = OpFMul %28 %31 
					                                f32_4 %33 = OpLoad %9 
					                                f32_4 %34 = OpVectorShuffle %33 %32 4 5 2 3 
					                                              OpStore %9 %34 
					                                f32_4 %35 = OpLoad %9 
					                                f32_2 %36 = OpVectorShuffle %35 %35 0 1 
					                                f32_2 %37 = OpExtInst %1 8 %36 
					                                f32_4 %38 = OpLoad %9 
					                                f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
					                                              OpStore %9 %39 
					                                f32_2 %44 = OpLoad vs_TEXCOORD0 
					                                f32_3 %45 = OpVectorShuffle %44 %44 0 1 1 
					                                f32_3 %49 = OpFMul %45 %48 
					                                f32_4 %50 = OpLoad %40 
					                                f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
					                                              OpStore %40 %51 
					                                f32_4 %54 = OpLoad %40 
					                                f32_2 %55 = OpVectorShuffle %54 %54 0 1 
					                                f32_2 %56 = OpExtInst %1 8 %55 
					                                              OpStore %53 %56 
					                         Private f32* %58 = OpAccessChain %40 %57 
					                                  f32 %59 = OpLoad %58 
					                                  f32 %60 = OpExtInst %1 10 %59 
					                         Private f32* %61 = OpAccessChain %40 %23 
					                                              OpStore %61 %60 
					                                f32_4 %70 = OpLoad %40 
					                                f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
					                               bool_4 %73 = OpFOrdLessThan %69 %71 
					                               bool_2 %74 = OpVectorShuffle %73 %73 0 1 
					                                              OpStore %65 %74 
					                                f32_4 %75 = OpLoad %9 
					                                f32_2 %76 = OpVectorShuffle %75 %75 0 1 
					                                f32_2 %79 = OpFMul %76 %78 
					                                f32_2 %80 = OpLoad %53 
					                                f32_2 %81 = OpFAdd %79 %80 
					                                f32_4 %82 = OpLoad %9 
					                                f32_4 %83 = OpVectorShuffle %82 %81 0 1 4 5 
					                                              OpStore %9 %83 
					                                f32_4 %84 = OpLoad %9 
					                                f32_4 %87 = OpFMul %84 %86 
					                                              OpStore %9 %87 
					                                f32_4 %88 = OpLoad %9 
					                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
					                                f32_2 %90 = OpExtInst %1 10 %89 
					                                f32_4 %91 = OpLoad %9 
					                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
					                                              OpStore %9 %92 
					                                f32_4 %93 = OpLoad %9 
					                                f32_2 %94 = OpVectorShuffle %93 %93 0 1 
					                                f32_2 %97 = OpFAdd %94 %96 
					                                f32_4 %98 = OpLoad %9 
					                                f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
					                                              OpStore %9 %99 
					                               f32_4 %101 = OpLoad %9 
					                               f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                               f32_2 %103 = OpExtInst %1 8 %102 
					                                              OpStore %100 %103 
					                               f32_4 %104 = OpLoad %9 
					                               f32_2 %105 = OpVectorShuffle %104 %104 2 3 
					                               f32_2 %106 = OpExtInst %1 10 %105 
					                                              OpStore %53 %106 
					                        Private f32* %108 = OpAccessChain %100 %107 
					                                 f32 %109 = OpLoad %108 
					                                 f32 %111 = OpFMul %109 %110 
					                        Private f32* %112 = OpAccessChain %100 %23 
					                                 f32 %113 = OpLoad %112 
					                                 f32 %114 = OpFAdd %111 %113 
					                        Private f32* %115 = OpAccessChain %100 %23 
					                                              OpStore %115 %114 
					                        Private f32* %117 = OpAccessChain %100 %23 
					                                 f32 %118 = OpLoad %117 
					                                 f32 %119 = OpExtInst %1 13 %118 
					                                              OpStore %116 %119 
					                               f32_2 %122 = OpLoad %100 
					                               f32_3 %123 = OpVectorShuffle %122 %122 0 0 0 
					                               f32_3 %127 = OpFAdd %123 %126 
					                                              OpStore %121 %127 
					                               f32_3 %128 = OpLoad %121 
					                               f32_3 %129 = OpExtInst %1 13 %128 
					                                              OpStore %121 %129 
					                               f32_3 %130 = OpLoad %121 
					                               f32_3 %133 = OpFMul %130 %132 
					                                              OpStore %121 %133 
					                               f32_3 %134 = OpLoad %121 
					                               f32_3 %135 = OpExtInst %1 10 %134 
					                                              OpStore %121 %135 
					                                 f32 %136 = OpLoad %116 
					                                 f32 %137 = OpFMul %136 %131 
					                        Private f32* %138 = OpAccessChain %100 %23 
					                                              OpStore %138 %137 
					                        Private f32* %139 = OpAccessChain %100 %23 
					                                 f32 %140 = OpLoad %139 
					                                 f32 %141 = OpExtInst %1 10 %140 
					                        Private f32* %142 = OpAccessChain %100 %23 
					                                              OpStore %142 %141 
					                        Private f32* %143 = OpAccessChain %100 %23 
					                                 f32 %144 = OpLoad %143 
					                                 f32 %145 = OpFNegate %144 
					                        Private f32* %146 = OpAccessChain %121 %23 
					                                 f32 %147 = OpLoad %146 
					                                 f32 %148 = OpFAdd %145 %147 
					                                              OpStore %116 %148 
					                               f32_2 %150 = OpLoad %53 
					                               f32_2 %151 = OpLoad %53 
					                               f32_2 %152 = OpFMul %150 %151 
					                                              OpStore %149 %152 
					                               f32_2 %153 = OpLoad %53 
					                               f32_2 %154 = OpFNegate %153 
					                               f32_2 %157 = OpFMul %154 %156 
					                               f32_2 %160 = OpFAdd %157 %159 
					                                              OpStore %53 %160 
					                               f32_2 %161 = OpLoad %53 
					                               f32_2 %162 = OpLoad %149 
					                               f32_2 %163 = OpFMul %161 %162 
					                                              OpStore %53 %163 
					                        Private f32* %164 = OpAccessChain %53 %23 
					                                 f32 %165 = OpLoad %164 
					                                 f32 %166 = OpLoad %116 
					                                 f32 %167 = OpFMul %165 %166 
					                        Private f32* %168 = OpAccessChain %100 %23 
					                                 f32 %169 = OpLoad %168 
					                                 f32 %170 = OpFAdd %167 %169 
					                        Private f32* %171 = OpAccessChain %100 %23 
					                                              OpStore %171 %170 
					                        Private f32* %172 = OpAccessChain %121 %107 
					                                 f32 %173 = OpLoad %172 
					                                 f32 %174 = OpFNegate %173 
					                        Private f32* %175 = OpAccessChain %121 %57 
					                                 f32 %176 = OpLoad %175 
					                                 f32 %177 = OpFAdd %174 %176 
					                                              OpStore %116 %177 
					                        Private f32* %178 = OpAccessChain %53 %23 
					                                 f32 %179 = OpLoad %178 
					                                 f32 %180 = OpLoad %116 
					                                 f32 %181 = OpFMul %179 %180 
					                        Private f32* %182 = OpAccessChain %121 %107 
					                                 f32 %183 = OpLoad %182 
					                                 f32 %184 = OpFAdd %181 %183 
					                        Private f32* %185 = OpAccessChain %53 %23 
					                                              OpStore %185 %184 
					                        Private f32* %186 = OpAccessChain %100 %23 
					                                 f32 %187 = OpLoad %186 
					                                 f32 %188 = OpFNegate %187 
					                        Private f32* %189 = OpAccessChain %53 %23 
					                                 f32 %190 = OpLoad %189 
					                                 f32 %191 = OpFAdd %188 %190 
					                        Private f32* %192 = OpAccessChain %53 %23 
					                                              OpStore %192 %191 
					                        Private f32* %193 = OpAccessChain %53 %107 
					                                 f32 %194 = OpLoad %193 
					                        Private f32* %195 = OpAccessChain %53 %23 
					                                 f32 %196 = OpLoad %195 
					                                 f32 %197 = OpFMul %194 %196 
					                        Private f32* %198 = OpAccessChain %100 %23 
					                                 f32 %199 = OpLoad %198 
					                                 f32 %200 = OpFAdd %197 %199 
					                        Private f32* %201 = OpAccessChain %53 %23 
					                                              OpStore %201 %200 
					                               f32_2 %203 = OpLoad %53 
					                               f32_4 %204 = OpVectorShuffle %203 %203 0 0 0 0 
					                              bool_4 %208 = OpFOrdLessThan %204 %207 
					                              bool_2 %209 = OpVectorShuffle %208 %208 0 1 
					                                              OpStore %202 %209 
					                        Private f32* %210 = OpAccessChain %100 %107 
					                                 f32 %211 = OpLoad %210 
					                                 f32 %212 = OpFAdd %211 %124 
					                        Private f32* %213 = OpAccessChain %53 %23 
					                                              OpStore %213 %212 
					                        Private f32* %214 = OpAccessChain %100 %107 
					                                 f32 %215 = OpLoad %214 
					                                 f32 %216 = OpExtInst %1 13 %215 
					                        Private f32* %217 = OpAccessChain %100 %23 
					                                              OpStore %217 %216 
					                        Private f32* %218 = OpAccessChain %100 %23 
					                                 f32 %219 = OpLoad %218 
					                                 f32 %220 = OpFMul %219 %131 
					                        Private f32* %221 = OpAccessChain %100 %23 
					                                              OpStore %221 %220 
					                        Private f32* %222 = OpAccessChain %100 %23 
					                                 f32 %223 = OpLoad %222 
					                                 f32 %224 = OpExtInst %1 10 %223 
					                        Private f32* %225 = OpAccessChain %100 %23 
					                                              OpStore %225 %224 
					                        Private f32* %226 = OpAccessChain %53 %23 
					                                 f32 %227 = OpLoad %226 
					                                 f32 %228 = OpExtInst %1 13 %227 
					                        Private f32* %229 = OpAccessChain %53 %23 
					                                              OpStore %229 %228 
					                        Private f32* %230 = OpAccessChain %53 %23 
					                                 f32 %231 = OpLoad %230 
					                                 f32 %232 = OpFMul %231 %131 
					                        Private f32* %233 = OpAccessChain %53 %23 
					                                              OpStore %233 %232 
					                        Private f32* %234 = OpAccessChain %53 %23 
					                                 f32 %235 = OpLoad %234 
					                                 f32 %236 = OpExtInst %1 10 %235 
					                        Private f32* %237 = OpAccessChain %53 %23 
					                                              OpStore %237 %236 
					                        Private f32* %238 = OpAccessChain %100 %23 
					                                 f32 %239 = OpLoad %238 
					                                 f32 %240 = OpFNegate %239 
					                        Private f32* %241 = OpAccessChain %53 %23 
					                                 f32 %242 = OpLoad %241 
					                                 f32 %243 = OpFAdd %240 %242 
					                        Private f32* %244 = OpAccessChain %53 %23 
					                                              OpStore %244 %243 
					                        Private f32* %245 = OpAccessChain %53 %107 
					                                 f32 %246 = OpLoad %245 
					                        Private f32* %247 = OpAccessChain %53 %23 
					                                 f32 %248 = OpLoad %247 
					                                 f32 %249 = OpFMul %246 %248 
					                        Private f32* %250 = OpAccessChain %100 %23 
					                                 f32 %251 = OpLoad %250 
					                                 f32 %252 = OpFAdd %249 %251 
					                        Private f32* %253 = OpAccessChain %53 %23 
					                                              OpStore %253 %252 
					                               f32_2 %257 = OpLoad %53 
					                               f32_4 %258 = OpVectorShuffle %257 %257 0 0 0 0 
					                              bool_4 %263 = OpFOrdLessThan %258 %262 
					                              bool_3 %264 = OpVectorShuffle %263 %263 0 1 2 
					                                              OpStore %256 %264 
					                       Private bool* %267 = OpAccessChain %202 %23 
					                                bool %268 = OpLoad %267 
					                       Private bool* %269 = OpAccessChain %256 %23 
					                                bool %270 = OpLoad %269 
					                                bool %271 = OpLogicalOr %268 %270 
					                       Private bool* %272 = OpAccessChain %265 %23 
					                                              OpStore %272 %271 
					                       Private bool* %273 = OpAccessChain %202 %107 
					                                bool %274 = OpLoad %273 
					                       Private bool* %275 = OpAccessChain %256 %57 
					                                bool %276 = OpLoad %275 
					                                bool %277 = OpLogicalOr %274 %276 
					                       Private bool* %278 = OpAccessChain %265 %107 
					                                              OpStore %278 %277 
					                               f32_4 %280 = OpLoad %9 
					                               f32_2 %281 = OpVectorShuffle %280 %280 0 1 
					                               f32_2 %284 = OpFMul %281 %283 
					                               f32_2 %285 = OpLoad vs_TEXCOORD0 
					                               f32_2 %286 = OpFAdd %284 %285 
					                               f32_4 %287 = OpLoad %279 
					                               f32_4 %288 = OpVectorShuffle %287 %286 0 1 4 5 
					                                              OpStore %279 %288 
					                               f32_4 %290 = OpLoad %9 
					                               f32_4 %291 = OpVectorShuffle %290 %290 0 1 0 1 
					                               f32_4 %295 = OpFMul %291 %294 
					                               f32_2 %296 = OpLoad vs_TEXCOORD0 
					                               f32_4 %297 = OpVectorShuffle %296 %296 0 1 0 1 
					                               f32_4 %298 = OpFAdd %295 %297 
					                                              OpStore %289 %298 
					                               f32_4 %299 = OpLoad %289 
					                               f32_2 %300 = OpVectorShuffle %299 %299 2 3 
					                               f32_4 %301 = OpLoad %279 
					                               f32_4 %302 = OpVectorShuffle %301 %300 4 5 2 3 
					                                              OpStore %279 %302 
					                       Private bool* %303 = OpAccessChain %265 %23 
					                                bool %304 = OpLoad %303 
					                                              OpSelectionMerge %308 None 
					                                              OpBranchConditional %304 %307 %311 
					                                     %307 = OpLabel 
					                               f32_4 %309 = OpLoad %289 
					                               f32_2 %310 = OpVectorShuffle %309 %309 0 1 
					                                              OpStore %306 %310 
					                                              OpBranch %308 
					                                     %311 = OpLabel 
					                               f32_2 %312 = OpLoad vs_TEXCOORD0 
					                                              OpStore %306 %312 
					                                              OpBranch %308 
					                                     %308 = OpLabel 
					                               f32_2 %313 = OpLoad %306 
					                               f32_4 %314 = OpLoad %9 
					                               f32_4 %315 = OpVectorShuffle %314 %313 4 5 2 3 
					                                              OpStore %9 %315 
					                 read_only Texture2D %319 = OpLoad %318 
					                             sampler %323 = OpLoad %322 
					          read_only Texture2DSampled %325 = OpSampledImage %319 %323 
					                               f32_4 %326 = OpLoad %9 
					                               f32_2 %327 = OpVectorShuffle %326 %326 0 1 
					                               f32_4 %328 = OpImageSampleImplicitLod %325 %327 
					                                 f32 %329 = OpCompositeExtract %328 0 
					                        Private f32* %330 = OpAccessChain %9 %23 
					                                              OpStore %330 %329 
					                       Private bool* %331 = OpAccessChain %265 %23 
					                                bool %332 = OpLoad %331 
					                                              OpSelectionMerge %336 None 
					                                              OpBranchConditional %332 %335 %338 
					                                     %335 = OpLabel 
					                               f32_4 %337 = OpLoad %279 
					                                              OpStore %334 %337 
					                                              OpBranch %336 
					                                     %338 = OpLabel 
					                               f32_2 %339 = OpLoad vs_TEXCOORD0 
					                               f32_4 %340 = OpVectorShuffle %339 %339 0 1 0 1 
					                                              OpStore %334 %340 
					                                              OpBranch %336 
					                                     %336 = OpLabel 
					                               f32_4 %341 = OpLoad %334 
					                                              OpStore %279 %341 
					                 read_only Texture2D %342 = OpLoad %318 
					                             sampler %343 = OpLoad %322 
					          read_only Texture2DSampled %344 = OpSampledImage %342 %343 
					                               f32_4 %345 = OpLoad %279 
					                               f32_2 %346 = OpVectorShuffle %345 %345 2 3 
					                               f32_4 %347 = OpImageSampleImplicitLod %344 %346 
					                                 f32 %348 = OpCompositeExtract %347 2 
					                        Private f32* %349 = OpAccessChain %9 %107 
					                                              OpStore %349 %348 
					                 read_only Texture2D %350 = OpLoad %318 
					                             sampler %351 = OpLoad %322 
					          read_only Texture2DSampled %352 = OpSampledImage %350 %351 
					                               f32_4 %353 = OpLoad %279 
					                               f32_2 %354 = OpVectorShuffle %353 %353 0 1 
					                               f32_4 %355 = OpImageSampleImplicitLod %352 %354 
					                                 f32 %356 = OpCompositeExtract %355 1 
					                        Private f32* %357 = OpAccessChain %121 %107 
					                                              OpStore %357 %356 
					                       Private bool* %358 = OpAccessChain %202 %23 
					                                bool %359 = OpLoad %358 
					                                              OpSelectionMerge %362 None 
					                                              OpBranchConditional %359 %361 %365 
					                                     %361 = OpLabel 
					                               f32_3 %363 = OpLoad %121 
					                               f32_2 %364 = OpVectorShuffle %363 %363 1 1 
					                                              OpStore %360 %364 
					                                              OpBranch %362 
					                                     %365 = OpLabel 
					                               f32_4 %366 = OpLoad %9 
					                               f32_2 %367 = OpVectorShuffle %366 %366 0 1 
					                                              OpStore %360 %367 
					                                              OpBranch %362 
					                                     %362 = OpLabel 
					                               f32_2 %368 = OpLoad %360 
					                               f32_3 %369 = OpLoad %121 
					                               f32_3 %370 = OpVectorShuffle %369 %368 3 1 4 
					                                              OpStore %121 %370 
					                               f32_3 %371 = OpLoad %121 
					                                 f32 %373 = OpDot %371 %372 
					                        Private f32* %374 = OpAccessChain %9 %107 
					                                              OpStore %374 %373 
					                        Private f32* %375 = OpAccessChain %9 %23 
					                                              OpStore %375 %68 
					                        Private f32* %376 = OpAccessChain %9 %57 
					                                              OpStore %376 %68 
					                       Private bool* %377 = OpAccessChain %256 %107 
					                                bool %378 = OpLoad %377 
					                                              OpSelectionMerge %382 None 
					                                              OpBranchConditional %378 %381 %385 
					                                     %381 = OpLabel 
					                               f32_4 %383 = OpLoad %9 
					                               f32_3 %384 = OpVectorShuffle %383 %383 0 1 2 
					                                              OpStore %380 %384 
					                                              OpBranch %382 
					                                     %385 = OpLabel 
					                               f32_3 %386 = OpLoad %121 
					                                              OpStore %380 %386 
					                                              OpBranch %382 
					                                     %382 = OpLabel 
					                               f32_3 %387 = OpLoad %380 
					                               f32_4 %388 = OpLoad %9 
					                               f32_4 %389 = OpVectorShuffle %388 %387 4 5 6 3 
					                                              OpStore %9 %389 
					                       Private bool* %390 = OpAccessChain %65 %23 
					                                bool %391 = OpLoad %390 
					                              bool_3 %395 = OpCompositeConstruct %391 %391 %391 
					                               f32_3 %396 = OpSelect %395 %393 %394 
					                               f32_4 %397 = OpLoad %40 
					                               f32_4 %398 = OpVectorShuffle %397 %396 4 1 5 6 
					                                              OpStore %40 %398 
					                       Private bool* %399 = OpAccessChain %65 %107 
					                                bool %400 = OpLoad %399 
					                                              OpSelectionMerge %403 None 
					                                              OpBranchConditional %400 %402 %405 
					                                     %402 = OpLabel 
					                                              OpStore %401 %404 
					                                              OpBranch %403 
					                                     %405 = OpLabel 
					                               f32_4 %406 = OpLoad %40 
					                               f32_3 %407 = OpVectorShuffle %406 %406 0 2 3 
					                                              OpStore %401 %407 
					                                              OpBranch %403 
					                                     %403 = OpLabel 
					                               f32_3 %408 = OpLoad %401 
					                               f32_4 %409 = OpLoad %40 
					                               f32_4 %410 = OpVectorShuffle %409 %408 4 5 6 3 
					                                              OpStore %40 %410 
					                        Uniform f32* %412 = OpAccessChain %12 %411 
					                                 f32 %413 = OpLoad %412 
					                        Uniform f32* %414 = OpAccessChain %12 %411 
					                                 f32 %415 = OpLoad %414 
					                        Uniform f32* %416 = OpAccessChain %12 %411 
					                                 f32 %417 = OpLoad %416 
					                               f32_3 %418 = OpCompositeConstruct %413 %415 %417 
					                                 f32 %419 = OpCompositeExtract %418 0 
					                                 f32 %420 = OpCompositeExtract %418 1 
					                                 f32 %421 = OpCompositeExtract %418 2 
					                               f32_3 %422 = OpCompositeConstruct %419 %420 %421 
					                               f32_4 %423 = OpLoad %40 
					                               f32_3 %424 = OpVectorShuffle %423 %423 0 1 2 
					                               f32_3 %425 = OpFMul %422 %424 
					                               f32_3 %426 = OpFAdd %425 %372 
					                               f32_4 %427 = OpLoad %40 
					                               f32_4 %428 = OpVectorShuffle %427 %426 4 5 6 3 
					                                              OpStore %40 %428 
					                               f32_4 %429 = OpLoad %9 
					                               f32_3 %430 = OpVectorShuffle %429 %429 0 1 2 
					                               f32_4 %431 = OpLoad %40 
					                               f32_3 %432 = OpVectorShuffle %431 %431 0 1 2 
					                               f32_3 %433 = OpFMul %430 %432 
					                               f32_4 %434 = OpLoad %40 
					                               f32_4 %435 = OpVectorShuffle %434 %433 4 5 6 3 
					                                              OpStore %40 %435 
					                       Private bool* %438 = OpAccessChain %265 %107 
					                                bool %439 = OpLoad %438 
					                                              OpSelectionMerge %442 None 
					                                              OpBranchConditional %439 %441 %445 
					                                     %441 = OpLabel 
					                               f32_4 %443 = OpLoad %40 
					                               f32_3 %444 = OpVectorShuffle %443 %443 0 1 2 
					                                              OpStore %440 %444 
					                                              OpBranch %442 
					                                     %445 = OpLabel 
					                               f32_4 %446 = OpLoad %9 
					                               f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
					                                              OpStore %440 %447 
					                                              OpBranch %442 
					                                     %442 = OpLabel 
					                               f32_3 %448 = OpLoad %440 
					                               f32_4 %449 = OpLoad %437 
					                               f32_4 %450 = OpVectorShuffle %449 %448 4 5 6 3 
					                                              OpStore %437 %450 
					                         Output f32* %453 = OpAccessChain %437 %451 
					                                              OpStore %453 %68 
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
						float _Speed;
						float RedFade;
						vec4 unused_0_4[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bvec2 u_xlatb1;
					float u_xlat2;
					bvec2 u_xlatb2;
					vec2 u_xlat3;
					bvec3 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat10_6;
					vec3 u_xlat9;
					vec2 u_xlat14;
					bvec2 u_xlatb14;
					vec2 u_xlat15;
					void main()
					{
					    u_xlat0.x = _Speed * _TimeX;
					    u_xlat0.xy = u_xlat0.xx * vec2(1234.0, 3543.0);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat1.xyz = vs_TEXCOORD0.xyy * vec3(50.0, 50.0, 0.333333343);
					    u_xlat14.xy = floor(u_xlat1.xy);
					    u_xlat1.x = fract(u_xlat1.z);
					    u_xlatb1.xy = lessThan(vec4(0.333000004, 0.666000009, 0.0, 0.0), u_xlat1.xxxx).xy;
					    u_xlat0.zw = u_xlat0.xy * vec2(0.015625, 0.015625) + u_xlat14.xy;
					    u_xlat0 = u_xlat0 * vec4(0.015625, 0.015625, 128.0, 128.0);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat15.xy = floor(u_xlat0.zw);
					    u_xlat14.xy = fract(u_xlat0.zw);
					    u_xlat15.x = u_xlat15.y * 59.0 + u_xlat15.x;
					    u_xlat2 = sin(u_xlat15.x);
					    u_xlat9.xyz = u_xlat15.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat9.xyz = sin(u_xlat9.xyz);
					    u_xlat9.xyz = u_xlat9.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat9.xyz = fract(u_xlat9.xyz);
					    u_xlat15.x = u_xlat2 * 43812.1758;
					    u_xlat15.x = fract(u_xlat15.x);
					    u_xlat2 = (-u_xlat15.x) + u_xlat9.x;
					    u_xlat3.xy = u_xlat14.xy * u_xlat14.xy;
					    u_xlat14.xy = (-u_xlat14.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat14.xy = u_xlat14.xy * u_xlat3.xy;
					    u_xlat15.x = u_xlat14.x * u_xlat2 + u_xlat15.x;
					    u_xlat2 = (-u_xlat9.y) + u_xlat9.z;
					    u_xlat14.x = u_xlat14.x * u_xlat2 + u_xlat9.y;
					    u_xlat14.x = (-u_xlat15.x) + u_xlat14.x;
					    u_xlat14.x = u_xlat14.y * u_xlat14.x + u_xlat15.x;
					    u_xlatb2.xy = lessThan(u_xlat14.xxxx, vec4(0.000410417997, 0.000273612008, 0.0, 0.0)).xy;
					    u_xlat14.x = u_xlat15.y + 1.0;
					    u_xlat15.x = sin(u_xlat15.y);
					    u_xlat15.x = u_xlat15.x * 43812.1758;
					    u_xlat15.x = fract(u_xlat15.x);
					    u_xlat14.x = sin(u_xlat14.x);
					    u_xlat14.x = u_xlat14.x * 43812.1758;
					    u_xlat14.x = fract(u_xlat14.x);
					    u_xlat14.x = (-u_xlat15.x) + u_xlat14.x;
					    u_xlat14.x = u_xlat14.y * u_xlat14.x + u_xlat15.x;
					    u_xlatb3.xyz = lessThan(u_xlat14.xxxx, vec4(6.50717775e-05, 1.85919362e-05, 2.60287106e-05, 0.0)).xyz;
					    u_xlatb14.x = u_xlatb2.x || u_xlatb3.x;
					    u_xlatb14.y = u_xlatb2.y || u_xlatb3.z;
					    u_xlat4.zw = u_xlat0.xy * vec2(0.0375000015, 0.0375000015) + vs_TEXCOORD0.xy;
					    u_xlat5 = u_xlat0.xyxy * vec4(0.0300000012, 0.0300000012, 0.0600000024, 0.0600000024) + vs_TEXCOORD0.xyxy;
					    u_xlat4.xy = u_xlat5.zw;
					    u_xlat0.xy = (u_xlatb14.x) ? u_xlat5.xy : vs_TEXCOORD0.xy;
					    u_xlat5 = texture(_MainTex, u_xlat0.xy);
					    u_xlat4 = (u_xlatb14.x) ? u_xlat4 : vs_TEXCOORD0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat4.zw);
					    u_xlat4 = texture(_MainTex, u_xlat4.xy);
					    u_xlat5.z = u_xlat10_6.z;
					    u_xlat4.xz = (u_xlatb2.x) ? u_xlat4.yy : u_xlat5.xz;
					    u_xlat0.y = dot(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.x = float(0.0);
					    u_xlat0.z = float(0.0);
					    u_xlat0.xyz = (u_xlatb3.y) ? u_xlat0.xyz : u_xlat4.xyz;
					    u_xlat1.xzw = (u_xlatb1.x) ? vec3(-1.0, 2.0, -1.0) : vec3(2.0, -1.0, -1.0);
					    u_xlat1.xyz = (u_xlatb1.y) ? vec3(-1.0, -1.0, 2.0) : u_xlat1.xzw;
					    u_xlat1.xyz = vec3(vec3(RedFade, RedFade, RedFade)) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = (u_xlatb14.y) ? u_xlat1.xyz : u_xlat0.xyz;
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
	}
}