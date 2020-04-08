Shader "CameraFilterPack/CameraFilterPack_NewGlitch6" {
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
			GpuProgramID 44753
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
					uniform 	float FadeLight;
					uniform 	float FadeDark;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec2 u_xlat7;
					vec3 u_xlat9;
					int u_xlati9;
					vec2 u_xlat14;
					float u_xlat15;
					float u_xlat21;
					int u_xlati21;
					float u_xlat22;
					int u_xlati22;
					float u_xlat23;
					void main()
					{
					    u_xlat0.x = _Speed * _TimeX;
					    u_xlat1.xyw = u_xlat0.xxx * vec3(9.99999975e-05, 4.0, 3.0);
					    u_xlat7.xy = (-vs_TEXCOORD0.xy) * vec2(20.0, 20.0) + u_xlat1.yy;
					    u_xlat7.xy = floor(u_xlat7.xy);
					    u_xlat7.xy = u_xlat7.xy * vec2(0.0500000007, 0.0500000007);
					    u_xlat7.x = dot(u_xlat7.xy, vec2(127.099998, 311.700012));
					    u_xlat7.x = sin(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 43758.5469;
					    u_xlat7.x = fract(u_xlat7.x);
					    u_xlat7.x = u_xlat0.x * 0.100000001 + u_xlat7.x;
					    u_xlat7.x = fract(u_xlat7.x);
					    u_xlat7.x = log2(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 30.0;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.xy = u_xlat7.xx + vs_TEXCOORD0.yx;
					    u_xlat21 = dot(u_xlat7.xy, vec2(10.0, 14.5));
					    u_xlat21 = u_xlat0.x * 20.0 + u_xlat21;
					    u_xlat21 = sin(u_xlat21);
					    u_xlati2 = int((0.0<u_xlat21) ? 0xFFFFFFFFu : uint(0));
					    u_xlati21 = int((u_xlat21<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati21 = (-u_xlati2) + u_xlati21;
					    u_xlat21 = float(u_xlati21);
					    u_xlat21 = u_xlat21 * 0.100000001;
					    u_xlat22 = u_xlat7.y * 6.0 + u_xlat1.w;
					    u_xlat22 = sin(u_xlat22);
					    u_xlati2 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
					    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati22 = (-u_xlati2) + u_xlati22;
					    u_xlat22 = float(u_xlati22);
					    u_xlat21 = u_xlat22 * 0.100000001 + u_xlat21;
					    u_xlat22 = sin(u_xlat0.x);
					    u_xlat22 = u_xlat7.x * u_xlat22;
					    u_xlat2.xyz = u_xlat7.xyx * vec3(250.0, 22.0, 15.0);
					    u_xlat22 = u_xlat22 * 12.0 + (-u_xlat2.y);
					    u_xlat22 = (-u_xlat0.x) * 40.0 + u_xlat22;
					    u_xlat22 = sin(u_xlat22);
					    u_xlati9 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
					    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati22 = (-u_xlati9) + u_xlati22;
					    u_xlat22 = float(u_xlati22);
					    u_xlat21 = u_xlat22 * 0.200000003 + u_xlat21;
					    u_xlat21 = u_xlat21 + -0.5;
					    u_xlat21 = u_xlat21 * u_xlat21;
					    u_xlat21 = u_xlat21 * u_xlat21 + (-u_xlat7.x);
					    u_xlat3 = u_xlat7.yxyx * vec4(150.0, 150.0, 350.0, 350.0);
					    u_xlat7.x = u_xlat21 + 1.5;
					    u_xlat7.x = u_xlat7.x * 3.0;
					    u_xlat7.x = floor(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 0.333333343;
					    u_xlat7.x = min(u_xlat7.x, 1.0);
					    u_xlat4 = floor(u_xlat3);
					    u_xlat3 = fract(u_xlat3);
					    u_xlat5 = u_xlat0.xxxx * vec4(9.99999975e-05, 9.99999975e-05, 9.99999975e-05, 9.99999975e-05) + u_xlat4;
					    u_xlat6 = u_xlat5 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat14.x = dot(u_xlat6.xy, vec2(127.099998, 311.700012));
					    u_xlat14.y = dot(u_xlat6.zw, vec2(127.099998, 311.700012));
					    u_xlat14.xy = sin(u_xlat14.xy);
					    u_xlat14.xy = u_xlat14.xy * vec2(43331.5469, 43331.5469);
					    u_xlat14.xy = fract(u_xlat14.xy);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(1.0);
					    u_xlat6 = u_xlat1.xyyx + u_xlat4.xyxy;
					    u_xlat4 = u_xlat1.xyyx + u_xlat4.zwzw;
					    u_xlat4 = u_xlat1.zxxz + u_xlat4;
					    u_xlat6 = u_xlat1.zxxz + u_xlat6;
					    u_xlat22 = dot(u_xlat6.zw, vec2(127.099998, 311.700012));
					    u_xlat9.x = dot(u_xlat6.xy, vec2(127.099998, 311.700012));
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat9.x = u_xlat9.x * 43331.5469;
					    u_xlat22 = sin(u_xlat22);
					    u_xlat22 = u_xlat22 * 43331.5469;
					    u_xlat22 = fract(u_xlat22);
					    u_xlat14.x = u_xlat14.x + (-u_xlat22);
					    u_xlat6 = u_xlat3 * u_xlat3;
					    u_xlat3 = (-u_xlat3) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat3 = u_xlat3 * u_xlat6;
					    u_xlat14.x = u_xlat3.x * u_xlat14.x + u_xlat22;
					    u_xlat22 = dot(u_xlat5.xy, vec2(127.099998, 311.700012));
					    u_xlat23 = dot(u_xlat5.zw, vec2(127.099998, 311.700012));
					    u_xlat23 = sin(u_xlat23);
					    u_xlat9.z = u_xlat23 * 43331.5469;
					    u_xlat9.xz = fract(u_xlat9.xz);
					    u_xlat22 = sin(u_xlat22);
					    u_xlat22 = u_xlat22 * 43331.5469;
					    u_xlat22 = fract(u_xlat22);
					    u_xlat9.x = (-u_xlat22) + u_xlat9.x;
					    u_xlat22 = u_xlat3.x * u_xlat9.x + u_xlat22;
					    u_xlat14.x = u_xlat14.x + (-u_xlat22);
					    u_xlat14.x = u_xlat3.y * u_xlat14.x + u_xlat22;
					    u_xlat22 = dot(u_xlat4.zw, vec2(127.099998, 311.700012));
					    u_xlat9.x = dot(u_xlat4.xy, vec2(127.099998, 311.700012));
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat9.x = u_xlat9.x * 43331.5469;
					    u_xlat9.x = fract(u_xlat9.x);
					    u_xlat9.x = (-u_xlat9.z) + u_xlat9.x;
					    u_xlat9.x = u_xlat3.z * u_xlat9.x + u_xlat9.z;
					    u_xlat22 = sin(u_xlat22);
					    u_xlat22 = u_xlat22 * 43331.5469;
					    u_xlat22 = fract(u_xlat22);
					    u_xlat21 = u_xlat14.y + (-u_xlat22);
					    u_xlat21 = u_xlat3.z * u_xlat21 + u_xlat22;
					    u_xlat21 = (-u_xlat9.x) + u_xlat21;
					    u_xlat21 = u_xlat3.w * u_xlat21 + u_xlat9.x;
					    u_xlat14.x = u_xlat21 + u_xlat14.x;
					    u_xlat14.x = u_xlat14.x * 0.5;
					    u_xlat21 = u_xlat14.x * u_xlat14.x;
					    u_xlat14.x = u_xlat21 * u_xlat14.x;
					    u_xlat21 = u_xlat0.x * 2.0 + u_xlat2.x;
					    u_xlat22 = floor(u_xlat2.z);
					    u_xlat21 = sin(u_xlat21);
					    u_xlat14.x = abs(u_xlat21) * u_xlat14.x;
					    u_xlat7.x = u_xlat7.x * u_xlat14.x;
					    u_xlat14.x = floor(u_xlat0.x);
					    u_xlat2.xy = u_xlat1.yx + u_xlat14.xx;
					    u_xlat1.xy = u_xlat1.xz + u_xlat2.xy;
					    u_xlat14.x = u_xlat0.x * 9.99999975e-05 + u_xlat14.x;
					    u_xlat14.x = dot(u_xlat14.xx, vec2(127.099998, 311.700012));
					    u_xlat14.x = sin(u_xlat14.x);
					    u_xlat14.x = u_xlat14.x * 43331.5469;
					    u_xlat21 = dot(u_xlat1.yx, vec2(127.099998, 311.700012));
					    u_xlat21 = sin(u_xlat21);
					    u_xlat14.y = u_xlat21 * 43331.5469;
					    u_xlat14.xy = fract(u_xlat14.xy);
					    u_xlat21 = (-u_xlat14.x) + u_xlat14.y;
					    u_xlat15 = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.300000012;
					    u_xlat0.x = u_xlat22 * 0.0666666701 + u_xlat0.x;
					    u_xlat22 = u_xlat15 * u_xlat15;
					    u_xlat15 = (-u_xlat15) * 2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat22;
					    u_xlat14.x = u_xlat15 * u_xlat21 + u_xlat14.x;
					    u_xlat21 = dot(u_xlat1.yy, vec2(127.099998, 311.700012));
					    u_xlat1.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43331.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat21 = sin(u_xlat21);
					    u_xlat0.w = u_xlat21 * 43331.5469;
					    u_xlat0.xw = fract(u_xlat0.xw);
					    u_xlat21 = (-u_xlat1.x) + u_xlat0.w;
					    u_xlat21 = u_xlat15 * u_xlat21 + u_xlat1.x;
					    u_xlat21 = (-u_xlat14.x) + u_xlat21;
					    u_xlat14.x = u_xlat15 * u_xlat21 + u_xlat14.x;
					    u_xlat14.x = u_xlat14.x + u_xlat14.x;
					    u_xlat0.x = abs(u_xlat14.x) * u_xlat0.x;
					    u_xlat14.x = abs(u_xlat14.x) * 0.125 + 0.75;
					    u_xlat0.x = u_xlat0.x * 0.400000006 + 0.400000006;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.649999976;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat7.x;
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = vec4(vec4(FadeLight, FadeLight, FadeLight, FadeLight)) * u_xlat0.xxxx + u_xlat10_1;
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    SV_Target0 = vec4(vec4(FadeDark, FadeDark, FadeDark, FadeDark)) * (-u_xlat0.xxxx) + u_xlat1;
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
					; Bound: 783
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %41 %760 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %10 0 Offset 10 
					                                              OpMemberDecorate %10 1 Offset 10 
					                                              OpMemberDecorate %10 2 Offset 10 
					                                              OpMemberDecorate %10 3 Offset 10 
					                                              OpDecorate %10 Block 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate vs_TEXCOORD0 Location 41 
					                                              OpDecorate %720 RelaxedPrecision 
					                                              OpDecorate %723 RelaxedPrecision 
					                                              OpDecorate %723 DescriptorSet 723 
					                                              OpDecorate %723 Binding 723 
					                                              OpDecorate %724 RelaxedPrecision 
					                                              OpDecorate %727 RelaxedPrecision 
					                                              OpDecorate %727 DescriptorSet 727 
					                                              OpDecorate %727 Binding 727 
					                                              OpDecorate %728 RelaxedPrecision 
					                                              OpDecorate %751 RelaxedPrecision 
					                                              OpDecorate %760 Location 760 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeStruct %6 %6 %6 %6 
					                                      %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32;}* %12 = OpVariable Uniform 
					                                      %13 = OpTypeInt 32 1 
					                                  i32 %14 = OpConstant 1 
					                                      %15 = OpTypePointer Uniform %6 
					                                  i32 %18 = OpConstant 0 
					                                      %22 = OpTypeInt 32 0 
					                                  u32 %23 = OpConstant 0 
					                                      %24 = OpTypePointer Private %6 
					                       Private f32_4* %26 = OpVariable Private 
					                                      %27 = OpTypeVector %6 3 
					                                  f32 %30 = OpConstant 3,674022E-40 
					                                  f32 %31 = OpConstant 3,674022E-40 
					                                  f32 %32 = OpConstant 3,674022E-40 
					                                f32_3 %33 = OpConstantComposite %30 %31 %32 
					                                      %37 = OpTypeVector %6 2 
					                                      %38 = OpTypePointer Private %37 
					                       Private f32_2* %39 = OpVariable Private 
					                                      %40 = OpTypePointer Input %37 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                  f32 %44 = OpConstant 3,674022E-40 
					                                f32_2 %45 = OpConstantComposite %44 %44 
					                                  f32 %53 = OpConstant 3,674022E-40 
					                                f32_2 %54 = OpConstantComposite %53 %53 
					                                  f32 %57 = OpConstant 3,674022E-40 
					                                  f32 %58 = OpConstant 3,674022E-40 
					                                f32_2 %59 = OpConstantComposite %57 %58 
					                                  f32 %68 = OpConstant 3,674022E-40 
					                                  f32 %77 = OpConstant 3,674022E-40 
					                                  f32 %93 = OpConstant 3,674022E-40 
					                        Private f32* %105 = OpVariable Private 
					                                 f32 %107 = OpConstant 3,674022E-40 
					                                 f32 %108 = OpConstant 3,674022E-40 
					                               f32_2 %109 = OpConstantComposite %107 %108 
					                                     %118 = OpTypePointer Private %13 
					                        Private i32* %119 = OpVariable Private 
					                                 f32 %120 = OpConstant 3,674022E-40 
					                                     %122 = OpTypeBool 
					                                 u32 %124 = OpConstant 4294967295 
					                        Private i32* %127 = OpVariable Private 
					                        Private f32* %140 = OpVariable Private 
					                                 u32 %141 = OpConstant 1 
					                                 f32 %144 = OpConstant 3,674022E-40 
					                                 u32 %146 = OpConstant 3 
					                        Private i32* %156 = OpVariable Private 
					                                     %178 = OpTypePointer Private %27 
					                      Private f32_3* %179 = OpVariable Private 
					                                 f32 %182 = OpConstant 3,674022E-40 
					                                 f32 %183 = OpConstant 3,674022E-40 
					                                 f32 %184 = OpConstant 3,674022E-40 
					                               f32_3 %185 = OpConstantComposite %182 %183 %184 
					                                 f32 %188 = OpConstant 3,674022E-40 
					                                 f32 %197 = OpConstant 3,674022E-40 
					                        Private i32* %203 = OpVariable Private 
					                                 f32 %219 = OpConstant 3,674022E-40 
					                                 f32 %224 = OpConstant 3,674022E-40 
					                      Private f32_4* %236 = OpVariable Private 
					                                 f32 %239 = OpConstant 3,674022E-40 
					                                 f32 %240 = OpConstant 3,674022E-40 
					                               f32_4 %241 = OpConstantComposite %239 %239 %240 %240 
					                                 f32 %244 = OpConstant 3,674022E-40 
					                                 f32 %257 = OpConstant 3,674022E-40 
					                                 f32 %262 = OpConstant 3,674022E-40 
					                      Private f32_4* %265 = OpVariable Private 
					                      Private f32_4* %270 = OpVariable Private 
					                               f32_4 %273 = OpConstantComposite %30 %30 %30 %30 
					                      Private f32_4* %277 = OpVariable Private 
					                               f32_4 %279 = OpConstantComposite %262 %262 %262 %262 
					                      Private f32_2* %281 = OpVariable Private 
					                                 f32 %293 = OpConstant 3,674022E-40 
					                               f32_2 %294 = OpConstantComposite %293 %293 
					                                 u32 %299 = OpConstant 2 
					                      Private f32_3* %322 = OpVariable Private 
					                                 f32 %352 = OpConstant 3,674022E-40 
					                               f32_4 %353 = OpConstantComposite %352 %352 %352 %352 
					                               f32_4 %355 = OpConstantComposite %32 %32 %32 %32 
					                        Private f32* %371 = OpVariable Private 
					                                 f32 %489 = OpConstant 3,674022E-40 
					                        Private f32* %578 = OpVariable Private 
					                                 f32 %584 = OpConstant 3,674022E-40 
					                                 f32 %588 = OpConstant 3,674022E-40 
					                                 f32 %680 = OpConstant 3,674022E-40 
					                                 f32 %682 = OpConstant 3,674022E-40 
					                                 f32 %687 = OpConstant 3,674022E-40 
					                                 f32 %697 = OpConstant 3,674022E-40 
					                      Private f32_4* %720 = OpVariable Private 
					                                     %721 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %722 = OpTypePointer UniformConstant %721 
					UniformConstant read_only Texture2D* %723 = OpVariable UniformConstant 
					                                     %725 = OpTypeSampler 
					                                     %726 = OpTypePointer UniformConstant %725 
					            UniformConstant sampler* %727 = OpVariable UniformConstant 
					                                     %729 = OpTypeSampledImage %721 
					                                 i32 %733 = OpConstant 2 
					                                     %759 = OpTypePointer Output %7 
					                       Output f32_4* %760 = OpVariable Output 
					                                 i32 %761 = OpConstant 3 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                         Uniform f32* %16 = OpAccessChain %12 %14 
					                                  f32 %17 = OpLoad %16 
					                         Uniform f32* %19 = OpAccessChain %12 %18 
					                                  f32 %20 = OpLoad %19 
					                                  f32 %21 = OpFMul %17 %20 
					                         Private f32* %25 = OpAccessChain %9 %23 
					                                              OpStore %25 %21 
					                                f32_4 %28 = OpLoad %9 
					                                f32_3 %29 = OpVectorShuffle %28 %28 0 0 0 
					                                f32_3 %34 = OpFMul %29 %33 
					                                f32_4 %35 = OpLoad %26 
					                                f32_4 %36 = OpVectorShuffle %35 %34 4 5 2 6 
					                                              OpStore %26 %36 
					                                f32_2 %42 = OpLoad vs_TEXCOORD0 
					                                f32_2 %43 = OpFNegate %42 
					                                f32_2 %46 = OpFMul %43 %45 
					                                f32_4 %47 = OpLoad %26 
					                                f32_2 %48 = OpVectorShuffle %47 %47 1 1 
					                                f32_2 %49 = OpFAdd %46 %48 
					                                              OpStore %39 %49 
					                                f32_2 %50 = OpLoad %39 
					                                f32_2 %51 = OpExtInst %1 8 %50 
					                                              OpStore %39 %51 
					                                f32_2 %52 = OpLoad %39 
					                                f32_2 %55 = OpFMul %52 %54 
					                                              OpStore %39 %55 
					                                f32_2 %56 = OpLoad %39 
					                                  f32 %60 = OpDot %56 %59 
					                         Private f32* %61 = OpAccessChain %39 %23 
					                                              OpStore %61 %60 
					                         Private f32* %62 = OpAccessChain %39 %23 
					                                  f32 %63 = OpLoad %62 
					                                  f32 %64 = OpExtInst %1 13 %63 
					                         Private f32* %65 = OpAccessChain %39 %23 
					                                              OpStore %65 %64 
					                         Private f32* %66 = OpAccessChain %39 %23 
					                                  f32 %67 = OpLoad %66 
					                                  f32 %69 = OpFMul %67 %68 
					                         Private f32* %70 = OpAccessChain %39 %23 
					                                              OpStore %70 %69 
					                         Private f32* %71 = OpAccessChain %39 %23 
					                                  f32 %72 = OpLoad %71 
					                                  f32 %73 = OpExtInst %1 10 %72 
					                         Private f32* %74 = OpAccessChain %39 %23 
					                                              OpStore %74 %73 
					                         Private f32* %75 = OpAccessChain %9 %23 
					                                  f32 %76 = OpLoad %75 
					                                  f32 %78 = OpFMul %76 %77 
					                         Private f32* %79 = OpAccessChain %39 %23 
					                                  f32 %80 = OpLoad %79 
					                                  f32 %81 = OpFAdd %78 %80 
					                         Private f32* %82 = OpAccessChain %39 %23 
					                                              OpStore %82 %81 
					                         Private f32* %83 = OpAccessChain %39 %23 
					                                  f32 %84 = OpLoad %83 
					                                  f32 %85 = OpExtInst %1 10 %84 
					                         Private f32* %86 = OpAccessChain %39 %23 
					                                              OpStore %86 %85 
					                         Private f32* %87 = OpAccessChain %39 %23 
					                                  f32 %88 = OpLoad %87 
					                                  f32 %89 = OpExtInst %1 30 %88 
					                         Private f32* %90 = OpAccessChain %39 %23 
					                                              OpStore %90 %89 
					                         Private f32* %91 = OpAccessChain %39 %23 
					                                  f32 %92 = OpLoad %91 
					                                  f32 %94 = OpFMul %92 %93 
					                         Private f32* %95 = OpAccessChain %39 %23 
					                                              OpStore %95 %94 
					                         Private f32* %96 = OpAccessChain %39 %23 
					                                  f32 %97 = OpLoad %96 
					                                  f32 %98 = OpExtInst %1 29 %97 
					                         Private f32* %99 = OpAccessChain %39 %23 
					                                              OpStore %99 %98 
					                               f32_2 %100 = OpLoad %39 
					                               f32_2 %101 = OpVectorShuffle %100 %100 0 0 
					                               f32_2 %102 = OpLoad vs_TEXCOORD0 
					                               f32_2 %103 = OpVectorShuffle %102 %102 1 0 
					                               f32_2 %104 = OpFAdd %101 %103 
					                                              OpStore %39 %104 
					                               f32_2 %106 = OpLoad %39 
					                                 f32 %110 = OpDot %106 %109 
					                                              OpStore %105 %110 
					                        Private f32* %111 = OpAccessChain %9 %23 
					                                 f32 %112 = OpLoad %111 
					                                 f32 %113 = OpFMul %112 %44 
					                                 f32 %114 = OpLoad %105 
					                                 f32 %115 = OpFAdd %113 %114 
					                                              OpStore %105 %115 
					                                 f32 %116 = OpLoad %105 
					                                 f32 %117 = OpExtInst %1 13 %116 
					                                              OpStore %105 %117 
					                                 f32 %121 = OpLoad %105 
					                                bool %123 = OpFOrdLessThan %120 %121 
					                                 u32 %125 = OpSelect %123 %124 %23 
					                                 i32 %126 = OpBitcast %125 
					                                              OpStore %119 %126 
					                                 f32 %128 = OpLoad %105 
					                                bool %129 = OpFOrdLessThan %128 %120 
					                                 u32 %130 = OpSelect %129 %124 %23 
					                                 i32 %131 = OpBitcast %130 
					                                              OpStore %127 %131 
					                                 i32 %132 = OpLoad %119 
					                                 i32 %133 = OpSNegate %132 
					                                 i32 %134 = OpLoad %127 
					                                 i32 %135 = OpIAdd %133 %134 
					                                              OpStore %127 %135 
					                                 i32 %136 = OpLoad %127 
					                                 f32 %137 = OpConvertSToF %136 
					                                              OpStore %105 %137 
					                                 f32 %138 = OpLoad %105 
					                                 f32 %139 = OpFMul %138 %77 
					                                              OpStore %105 %139 
					                        Private f32* %142 = OpAccessChain %39 %141 
					                                 f32 %143 = OpLoad %142 
					                                 f32 %145 = OpFMul %143 %144 
					                        Private f32* %147 = OpAccessChain %26 %146 
					                                 f32 %148 = OpLoad %147 
					                                 f32 %149 = OpFAdd %145 %148 
					                                              OpStore %140 %149 
					                                 f32 %150 = OpLoad %140 
					                                 f32 %151 = OpExtInst %1 13 %150 
					                                              OpStore %140 %151 
					                                 f32 %152 = OpLoad %140 
					                                bool %153 = OpFOrdLessThan %120 %152 
					                                 u32 %154 = OpSelect %153 %124 %23 
					                                 i32 %155 = OpBitcast %154 
					                                              OpStore %119 %155 
					                                 f32 %157 = OpLoad %140 
					                                bool %158 = OpFOrdLessThan %157 %120 
					                                 u32 %159 = OpSelect %158 %124 %23 
					                                 i32 %160 = OpBitcast %159 
					                                              OpStore %156 %160 
					                                 i32 %161 = OpLoad %119 
					                                 i32 %162 = OpSNegate %161 
					                                 i32 %163 = OpLoad %156 
					                                 i32 %164 = OpIAdd %162 %163 
					                                              OpStore %156 %164 
					                                 i32 %165 = OpLoad %156 
					                                 f32 %166 = OpConvertSToF %165 
					                                              OpStore %140 %166 
					                                 f32 %167 = OpLoad %140 
					                                 f32 %168 = OpFMul %167 %77 
					                                 f32 %169 = OpLoad %105 
					                                 f32 %170 = OpFAdd %168 %169 
					                                              OpStore %105 %170 
					                        Private f32* %171 = OpAccessChain %9 %23 
					                                 f32 %172 = OpLoad %171 
					                                 f32 %173 = OpExtInst %1 13 %172 
					                                              OpStore %140 %173 
					                        Private f32* %174 = OpAccessChain %39 %23 
					                                 f32 %175 = OpLoad %174 
					                                 f32 %176 = OpLoad %140 
					                                 f32 %177 = OpFMul %175 %176 
					                                              OpStore %140 %177 
					                               f32_2 %180 = OpLoad %39 
					                               f32_3 %181 = OpVectorShuffle %180 %180 0 1 0 
					                               f32_3 %186 = OpFMul %181 %185 
					                                              OpStore %179 %186 
					                                 f32 %187 = OpLoad %140 
					                                 f32 %189 = OpFMul %187 %188 
					                        Private f32* %190 = OpAccessChain %179 %141 
					                                 f32 %191 = OpLoad %190 
					                                 f32 %192 = OpFNegate %191 
					                                 f32 %193 = OpFAdd %189 %192 
					                                              OpStore %140 %193 
					                        Private f32* %194 = OpAccessChain %9 %23 
					                                 f32 %195 = OpLoad %194 
					                                 f32 %196 = OpFNegate %195 
					                                 f32 %198 = OpFMul %196 %197 
					                                 f32 %199 = OpLoad %140 
					                                 f32 %200 = OpFAdd %198 %199 
					                                              OpStore %140 %200 
					                                 f32 %201 = OpLoad %140 
					                                 f32 %202 = OpExtInst %1 13 %201 
					                                              OpStore %140 %202 
					                                 f32 %204 = OpLoad %140 
					                                bool %205 = OpFOrdLessThan %120 %204 
					                                 u32 %206 = OpSelect %205 %124 %23 
					                                 i32 %207 = OpBitcast %206 
					                                              OpStore %203 %207 
					                                 f32 %208 = OpLoad %140 
					                                bool %209 = OpFOrdLessThan %208 %120 
					                                 u32 %210 = OpSelect %209 %124 %23 
					                                 i32 %211 = OpBitcast %210 
					                                              OpStore %156 %211 
					                                 i32 %212 = OpLoad %203 
					                                 i32 %213 = OpSNegate %212 
					                                 i32 %214 = OpLoad %156 
					                                 i32 %215 = OpIAdd %213 %214 
					                                              OpStore %156 %215 
					                                 i32 %216 = OpLoad %156 
					                                 f32 %217 = OpConvertSToF %216 
					                                              OpStore %140 %217 
					                                 f32 %218 = OpLoad %140 
					                                 f32 %220 = OpFMul %218 %219 
					                                 f32 %221 = OpLoad %105 
					                                 f32 %222 = OpFAdd %220 %221 
					                                              OpStore %105 %222 
					                                 f32 %223 = OpLoad %105 
					                                 f32 %225 = OpFAdd %223 %224 
					                                              OpStore %105 %225 
					                                 f32 %226 = OpLoad %105 
					                                 f32 %227 = OpLoad %105 
					                                 f32 %228 = OpFMul %226 %227 
					                                              OpStore %105 %228 
					                                 f32 %229 = OpLoad %105 
					                                 f32 %230 = OpLoad %105 
					                                 f32 %231 = OpFMul %229 %230 
					                        Private f32* %232 = OpAccessChain %39 %23 
					                                 f32 %233 = OpLoad %232 
					                                 f32 %234 = OpFNegate %233 
					                                 f32 %235 = OpFAdd %231 %234 
					                                              OpStore %105 %235 
					                               f32_2 %237 = OpLoad %39 
					                               f32_4 %238 = OpVectorShuffle %237 %237 1 0 1 0 
					                               f32_4 %242 = OpFMul %238 %241 
					                                              OpStore %236 %242 
					                                 f32 %243 = OpLoad %105 
					                                 f32 %245 = OpFAdd %243 %244 
					                        Private f32* %246 = OpAccessChain %39 %23 
					                                              OpStore %246 %245 
					                        Private f32* %247 = OpAccessChain %39 %23 
					                                 f32 %248 = OpLoad %247 
					                                 f32 %249 = OpFMul %248 %32 
					                        Private f32* %250 = OpAccessChain %39 %23 
					                                              OpStore %250 %249 
					                        Private f32* %251 = OpAccessChain %39 %23 
					                                 f32 %252 = OpLoad %251 
					                                 f32 %253 = OpExtInst %1 8 %252 
					                        Private f32* %254 = OpAccessChain %39 %23 
					                                              OpStore %254 %253 
					                        Private f32* %255 = OpAccessChain %39 %23 
					                                 f32 %256 = OpLoad %255 
					                                 f32 %258 = OpFMul %256 %257 
					                        Private f32* %259 = OpAccessChain %39 %23 
					                                              OpStore %259 %258 
					                        Private f32* %260 = OpAccessChain %39 %23 
					                                 f32 %261 = OpLoad %260 
					                                 f32 %263 = OpExtInst %1 37 %261 %262 
					                        Private f32* %264 = OpAccessChain %39 %23 
					                                              OpStore %264 %263 
					                               f32_4 %266 = OpLoad %236 
					                               f32_4 %267 = OpExtInst %1 8 %266 
					                                              OpStore %265 %267 
					                               f32_4 %268 = OpLoad %236 
					                               f32_4 %269 = OpExtInst %1 10 %268 
					                                              OpStore %236 %269 
					                               f32_4 %271 = OpLoad %9 
					                               f32_4 %272 = OpVectorShuffle %271 %271 0 0 0 0 
					                               f32_4 %274 = OpFMul %272 %273 
					                               f32_4 %275 = OpLoad %265 
					                               f32_4 %276 = OpFAdd %274 %275 
					                                              OpStore %270 %276 
					                               f32_4 %278 = OpLoad %270 
					                               f32_4 %280 = OpFAdd %278 %279 
					                                              OpStore %277 %280 
					                               f32_4 %282 = OpLoad %277 
					                               f32_2 %283 = OpVectorShuffle %282 %282 0 1 
					                                 f32 %284 = OpDot %283 %59 
					                        Private f32* %285 = OpAccessChain %281 %23 
					                                              OpStore %285 %284 
					                               f32_4 %286 = OpLoad %277 
					                               f32_2 %287 = OpVectorShuffle %286 %286 2 3 
					                                 f32 %288 = OpDot %287 %59 
					                        Private f32* %289 = OpAccessChain %281 %141 
					                                              OpStore %289 %288 
					                               f32_2 %290 = OpLoad %281 
					                               f32_2 %291 = OpExtInst %1 13 %290 
					                                              OpStore %281 %291 
					                               f32_2 %292 = OpLoad %281 
					                               f32_2 %295 = OpFMul %292 %294 
					                                              OpStore %281 %295 
					                               f32_2 %296 = OpLoad %281 
					                               f32_2 %297 = OpExtInst %1 10 %296 
					                                              OpStore %281 %297 
					                        Private f32* %298 = OpAccessChain %26 %141 
					                                              OpStore %298 %120 
					                        Private f32* %300 = OpAccessChain %26 %299 
					                                              OpStore %300 %262 
					                               f32_4 %301 = OpLoad %26 
					                               f32_4 %302 = OpVectorShuffle %301 %301 0 1 1 0 
					                               f32_4 %303 = OpLoad %265 
					                               f32_4 %304 = OpVectorShuffle %303 %303 0 1 0 1 
					                               f32_4 %305 = OpFAdd %302 %304 
					                                              OpStore %277 %305 
					                               f32_4 %306 = OpLoad %26 
					                               f32_4 %307 = OpVectorShuffle %306 %306 0 1 1 0 
					                               f32_4 %308 = OpLoad %265 
					                               f32_4 %309 = OpVectorShuffle %308 %308 2 3 2 3 
					                               f32_4 %310 = OpFAdd %307 %309 
					                                              OpStore %265 %310 
					                               f32_4 %311 = OpLoad %26 
					                               f32_4 %312 = OpVectorShuffle %311 %311 2 0 0 2 
					                               f32_4 %313 = OpLoad %265 
					                               f32_4 %314 = OpFAdd %312 %313 
					                                              OpStore %265 %314 
					                               f32_4 %315 = OpLoad %26 
					                               f32_4 %316 = OpVectorShuffle %315 %315 2 0 0 2 
					                               f32_4 %317 = OpLoad %277 
					                               f32_4 %318 = OpFAdd %316 %317 
					                                              OpStore %277 %318 
					                               f32_4 %319 = OpLoad %277 
					                               f32_2 %320 = OpVectorShuffle %319 %319 2 3 
					                                 f32 %321 = OpDot %320 %59 
					                                              OpStore %140 %321 
					                               f32_4 %323 = OpLoad %277 
					                               f32_2 %324 = OpVectorShuffle %323 %323 0 1 
					                                 f32 %325 = OpDot %324 %59 
					                        Private f32* %326 = OpAccessChain %322 %23 
					                                              OpStore %326 %325 
					                        Private f32* %327 = OpAccessChain %322 %23 
					                                 f32 %328 = OpLoad %327 
					                                 f32 %329 = OpExtInst %1 13 %328 
					                        Private f32* %330 = OpAccessChain %322 %23 
					                                              OpStore %330 %329 
					                        Private f32* %331 = OpAccessChain %322 %23 
					                                 f32 %332 = OpLoad %331 
					                                 f32 %333 = OpFMul %332 %293 
					                        Private f32* %334 = OpAccessChain %322 %23 
					                                              OpStore %334 %333 
					                                 f32 %335 = OpLoad %140 
					                                 f32 %336 = OpExtInst %1 13 %335 
					                                              OpStore %140 %336 
					                                 f32 %337 = OpLoad %140 
					                                 f32 %338 = OpFMul %337 %293 
					                                              OpStore %140 %338 
					                                 f32 %339 = OpLoad %140 
					                                 f32 %340 = OpExtInst %1 10 %339 
					                                              OpStore %140 %340 
					                        Private f32* %341 = OpAccessChain %281 %23 
					                                 f32 %342 = OpLoad %341 
					                                 f32 %343 = OpLoad %140 
					                                 f32 %344 = OpFNegate %343 
					                                 f32 %345 = OpFAdd %342 %344 
					                        Private f32* %346 = OpAccessChain %281 %23 
					                                              OpStore %346 %345 
					                               f32_4 %347 = OpLoad %236 
					                               f32_4 %348 = OpLoad %236 
					                               f32_4 %349 = OpFMul %347 %348 
					                                              OpStore %277 %349 
					                               f32_4 %350 = OpLoad %236 
					                               f32_4 %351 = OpFNegate %350 
					                               f32_4 %354 = OpFMul %351 %353 
					                               f32_4 %356 = OpFAdd %354 %355 
					                                              OpStore %236 %356 
					                               f32_4 %357 = OpLoad %236 
					                               f32_4 %358 = OpLoad %277 
					                               f32_4 %359 = OpFMul %357 %358 
					                                              OpStore %236 %359 
					                        Private f32* %360 = OpAccessChain %236 %23 
					                                 f32 %361 = OpLoad %360 
					                        Private f32* %362 = OpAccessChain %281 %23 
					                                 f32 %363 = OpLoad %362 
					                                 f32 %364 = OpFMul %361 %363 
					                                 f32 %365 = OpLoad %140 
					                                 f32 %366 = OpFAdd %364 %365 
					                        Private f32* %367 = OpAccessChain %281 %23 
					                                              OpStore %367 %366 
					                               f32_4 %368 = OpLoad %270 
					                               f32_2 %369 = OpVectorShuffle %368 %368 0 1 
					                                 f32 %370 = OpDot %369 %59 
					                                              OpStore %140 %370 
					                               f32_4 %372 = OpLoad %270 
					                               f32_2 %373 = OpVectorShuffle %372 %372 2 3 
					                                 f32 %374 = OpDot %373 %59 
					                                              OpStore %371 %374 
					                                 f32 %375 = OpLoad %371 
					                                 f32 %376 = OpExtInst %1 13 %375 
					                                              OpStore %371 %376 
					                                 f32 %377 = OpLoad %371 
					                                 f32 %378 = OpFMul %377 %293 
					                        Private f32* %379 = OpAccessChain %322 %299 
					                                              OpStore %379 %378 
					                               f32_3 %380 = OpLoad %322 
					                               f32_2 %381 = OpVectorShuffle %380 %380 0 2 
					                               f32_2 %382 = OpExtInst %1 10 %381 
					                               f32_3 %383 = OpLoad %322 
					                               f32_3 %384 = OpVectorShuffle %383 %382 3 1 4 
					                                              OpStore %322 %384 
					                                 f32 %385 = OpLoad %140 
					                                 f32 %386 = OpExtInst %1 13 %385 
					                                              OpStore %140 %386 
					                                 f32 %387 = OpLoad %140 
					                                 f32 %388 = OpFMul %387 %293 
					                                              OpStore %140 %388 
					                                 f32 %389 = OpLoad %140 
					                                 f32 %390 = OpExtInst %1 10 %389 
					                                              OpStore %140 %390 
					                                 f32 %391 = OpLoad %140 
					                                 f32 %392 = OpFNegate %391 
					                        Private f32* %393 = OpAccessChain %322 %23 
					                                 f32 %394 = OpLoad %393 
					                                 f32 %395 = OpFAdd %392 %394 
					                        Private f32* %396 = OpAccessChain %322 %23 
					                                              OpStore %396 %395 
					                        Private f32* %397 = OpAccessChain %236 %23 
					                                 f32 %398 = OpLoad %397 
					                        Private f32* %399 = OpAccessChain %322 %23 
					                                 f32 %400 = OpLoad %399 
					                                 f32 %401 = OpFMul %398 %400 
					                                 f32 %402 = OpLoad %140 
					                                 f32 %403 = OpFAdd %401 %402 
					                                              OpStore %140 %403 
					                        Private f32* %404 = OpAccessChain %281 %23 
					                                 f32 %405 = OpLoad %404 
					                                 f32 %406 = OpLoad %140 
					                                 f32 %407 = OpFNegate %406 
					                                 f32 %408 = OpFAdd %405 %407 
					                        Private f32* %409 = OpAccessChain %281 %23 
					                                              OpStore %409 %408 
					                        Private f32* %410 = OpAccessChain %236 %141 
					                                 f32 %411 = OpLoad %410 
					                        Private f32* %412 = OpAccessChain %281 %23 
					                                 f32 %413 = OpLoad %412 
					                                 f32 %414 = OpFMul %411 %413 
					                                 f32 %415 = OpLoad %140 
					                                 f32 %416 = OpFAdd %414 %415 
					                        Private f32* %417 = OpAccessChain %281 %23 
					                                              OpStore %417 %416 
					                               f32_4 %418 = OpLoad %265 
					                               f32_2 %419 = OpVectorShuffle %418 %418 2 3 
					                                 f32 %420 = OpDot %419 %59 
					                                              OpStore %140 %420 
					                               f32_4 %421 = OpLoad %265 
					                               f32_2 %422 = OpVectorShuffle %421 %421 0 1 
					                                 f32 %423 = OpDot %422 %59 
					                        Private f32* %424 = OpAccessChain %322 %23 
					                                              OpStore %424 %423 
					                        Private f32* %425 = OpAccessChain %322 %23 
					                                 f32 %426 = OpLoad %425 
					                                 f32 %427 = OpExtInst %1 13 %426 
					                        Private f32* %428 = OpAccessChain %322 %23 
					                                              OpStore %428 %427 
					                        Private f32* %429 = OpAccessChain %322 %23 
					                                 f32 %430 = OpLoad %429 
					                                 f32 %431 = OpFMul %430 %293 
					                        Private f32* %432 = OpAccessChain %322 %23 
					                                              OpStore %432 %431 
					                        Private f32* %433 = OpAccessChain %322 %23 
					                                 f32 %434 = OpLoad %433 
					                                 f32 %435 = OpExtInst %1 10 %434 
					                        Private f32* %436 = OpAccessChain %322 %23 
					                                              OpStore %436 %435 
					                        Private f32* %437 = OpAccessChain %322 %299 
					                                 f32 %438 = OpLoad %437 
					                                 f32 %439 = OpFNegate %438 
					                        Private f32* %440 = OpAccessChain %322 %23 
					                                 f32 %441 = OpLoad %440 
					                                 f32 %442 = OpFAdd %439 %441 
					                        Private f32* %443 = OpAccessChain %322 %23 
					                                              OpStore %443 %442 
					                        Private f32* %444 = OpAccessChain %236 %299 
					                                 f32 %445 = OpLoad %444 
					                        Private f32* %446 = OpAccessChain %322 %23 
					                                 f32 %447 = OpLoad %446 
					                                 f32 %448 = OpFMul %445 %447 
					                        Private f32* %449 = OpAccessChain %322 %299 
					                                 f32 %450 = OpLoad %449 
					                                 f32 %451 = OpFAdd %448 %450 
					                        Private f32* %452 = OpAccessChain %322 %23 
					                                              OpStore %452 %451 
					                                 f32 %453 = OpLoad %140 
					                                 f32 %454 = OpExtInst %1 13 %453 
					                                              OpStore %140 %454 
					                                 f32 %455 = OpLoad %140 
					                                 f32 %456 = OpFMul %455 %293 
					                                              OpStore %140 %456 
					                                 f32 %457 = OpLoad %140 
					                                 f32 %458 = OpExtInst %1 10 %457 
					                                              OpStore %140 %458 
					                        Private f32* %459 = OpAccessChain %281 %141 
					                                 f32 %460 = OpLoad %459 
					                                 f32 %461 = OpLoad %140 
					                                 f32 %462 = OpFNegate %461 
					                                 f32 %463 = OpFAdd %460 %462 
					                                              OpStore %105 %463 
					                        Private f32* %464 = OpAccessChain %236 %299 
					                                 f32 %465 = OpLoad %464 
					                                 f32 %466 = OpLoad %105 
					                                 f32 %467 = OpFMul %465 %466 
					                                 f32 %468 = OpLoad %140 
					                                 f32 %469 = OpFAdd %467 %468 
					                                              OpStore %105 %469 
					                        Private f32* %470 = OpAccessChain %322 %23 
					                                 f32 %471 = OpLoad %470 
					                                 f32 %472 = OpFNegate %471 
					                                 f32 %473 = OpLoad %105 
					                                 f32 %474 = OpFAdd %472 %473 
					                                              OpStore %105 %474 
					                        Private f32* %475 = OpAccessChain %236 %146 
					                                 f32 %476 = OpLoad %475 
					                                 f32 %477 = OpLoad %105 
					                                 f32 %478 = OpFMul %476 %477 
					                        Private f32* %479 = OpAccessChain %322 %23 
					                                 f32 %480 = OpLoad %479 
					                                 f32 %481 = OpFAdd %478 %480 
					                                              OpStore %105 %481 
					                                 f32 %482 = OpLoad %105 
					                        Private f32* %483 = OpAccessChain %281 %23 
					                                 f32 %484 = OpLoad %483 
					                                 f32 %485 = OpFAdd %482 %484 
					                        Private f32* %486 = OpAccessChain %281 %23 
					                                              OpStore %486 %485 
					                        Private f32* %487 = OpAccessChain %281 %23 
					                                 f32 %488 = OpLoad %487 
					                                 f32 %490 = OpFMul %488 %489 
					                        Private f32* %491 = OpAccessChain %281 %23 
					                                              OpStore %491 %490 
					                        Private f32* %492 = OpAccessChain %281 %23 
					                                 f32 %493 = OpLoad %492 
					                        Private f32* %494 = OpAccessChain %281 %23 
					                                 f32 %495 = OpLoad %494 
					                                 f32 %496 = OpFMul %493 %495 
					                                              OpStore %105 %496 
					                                 f32 %497 = OpLoad %105 
					                        Private f32* %498 = OpAccessChain %281 %23 
					                                 f32 %499 = OpLoad %498 
					                                 f32 %500 = OpFMul %497 %499 
					                        Private f32* %501 = OpAccessChain %281 %23 
					                                              OpStore %501 %500 
					                        Private f32* %502 = OpAccessChain %9 %23 
					                                 f32 %503 = OpLoad %502 
					                                 f32 %504 = OpFMul %503 %352 
					                        Private f32* %505 = OpAccessChain %179 %23 
					                                 f32 %506 = OpLoad %505 
					                                 f32 %507 = OpFAdd %504 %506 
					                                              OpStore %105 %507 
					                        Private f32* %508 = OpAccessChain %179 %299 
					                                 f32 %509 = OpLoad %508 
					                                 f32 %510 = OpExtInst %1 8 %509 
					                                              OpStore %140 %510 
					                                 f32 %511 = OpLoad %105 
					                                 f32 %512 = OpExtInst %1 13 %511 
					                                              OpStore %105 %512 
					                                 f32 %513 = OpLoad %105 
					                                 f32 %514 = OpExtInst %1 4 %513 
					                        Private f32* %515 = OpAccessChain %281 %23 
					                                 f32 %516 = OpLoad %515 
					                                 f32 %517 = OpFMul %514 %516 
					                        Private f32* %518 = OpAccessChain %281 %23 
					                                              OpStore %518 %517 
					                        Private f32* %519 = OpAccessChain %39 %23 
					                                 f32 %520 = OpLoad %519 
					                        Private f32* %521 = OpAccessChain %281 %23 
					                                 f32 %522 = OpLoad %521 
					                                 f32 %523 = OpFMul %520 %522 
					                        Private f32* %524 = OpAccessChain %39 %23 
					                                              OpStore %524 %523 
					                        Private f32* %525 = OpAccessChain %9 %23 
					                                 f32 %526 = OpLoad %525 
					                                 f32 %527 = OpExtInst %1 8 %526 
					                        Private f32* %528 = OpAccessChain %281 %23 
					                                              OpStore %528 %527 
					                               f32_4 %529 = OpLoad %26 
					                               f32_2 %530 = OpVectorShuffle %529 %529 1 0 
					                               f32_2 %531 = OpLoad %281 
					                               f32_2 %532 = OpVectorShuffle %531 %531 0 0 
					                               f32_2 %533 = OpFAdd %530 %532 
					                               f32_3 %534 = OpLoad %179 
					                               f32_3 %535 = OpVectorShuffle %534 %533 3 4 2 
					                                              OpStore %179 %535 
					                               f32_4 %536 = OpLoad %26 
					                               f32_2 %537 = OpVectorShuffle %536 %536 0 2 
					                               f32_3 %538 = OpLoad %179 
					                               f32_2 %539 = OpVectorShuffle %538 %538 0 1 
					                               f32_2 %540 = OpFAdd %537 %539 
					                               f32_4 %541 = OpLoad %26 
					                               f32_4 %542 = OpVectorShuffle %541 %540 4 5 2 3 
					                                              OpStore %26 %542 
					                        Private f32* %543 = OpAccessChain %9 %23 
					                                 f32 %544 = OpLoad %543 
					                                 f32 %545 = OpFMul %544 %30 
					                        Private f32* %546 = OpAccessChain %281 %23 
					                                 f32 %547 = OpLoad %546 
					                                 f32 %548 = OpFAdd %545 %547 
					                        Private f32* %549 = OpAccessChain %281 %23 
					                                              OpStore %549 %548 
					                               f32_2 %550 = OpLoad %281 
					                               f32_2 %551 = OpVectorShuffle %550 %550 0 0 
					                                 f32 %552 = OpDot %551 %59 
					                        Private f32* %553 = OpAccessChain %281 %23 
					                                              OpStore %553 %552 
					                        Private f32* %554 = OpAccessChain %281 %23 
					                                 f32 %555 = OpLoad %554 
					                                 f32 %556 = OpExtInst %1 13 %555 
					                        Private f32* %557 = OpAccessChain %281 %23 
					                                              OpStore %557 %556 
					                        Private f32* %558 = OpAccessChain %281 %23 
					                                 f32 %559 = OpLoad %558 
					                                 f32 %560 = OpFMul %559 %293 
					                        Private f32* %561 = OpAccessChain %281 %23 
					                                              OpStore %561 %560 
					                               f32_4 %562 = OpLoad %26 
					                               f32_2 %563 = OpVectorShuffle %562 %562 1 0 
					                                 f32 %564 = OpDot %563 %59 
					                                              OpStore %105 %564 
					                                 f32 %565 = OpLoad %105 
					                                 f32 %566 = OpExtInst %1 13 %565 
					                                              OpStore %105 %566 
					                                 f32 %567 = OpLoad %105 
					                                 f32 %568 = OpFMul %567 %293 
					                        Private f32* %569 = OpAccessChain %281 %141 
					                                              OpStore %569 %568 
					                               f32_2 %570 = OpLoad %281 
					                               f32_2 %571 = OpExtInst %1 10 %570 
					                                              OpStore %281 %571 
					                        Private f32* %572 = OpAccessChain %281 %23 
					                                 f32 %573 = OpLoad %572 
					                                 f32 %574 = OpFNegate %573 
					                        Private f32* %575 = OpAccessChain %281 %141 
					                                 f32 %576 = OpLoad %575 
					                                 f32 %577 = OpFAdd %574 %576 
					                                              OpStore %105 %577 
					                        Private f32* %579 = OpAccessChain %9 %23 
					                                 f32 %580 = OpLoad %579 
					                                 f32 %581 = OpExtInst %1 10 %580 
					                                              OpStore %578 %581 
					                        Private f32* %582 = OpAccessChain %9 %23 
					                                 f32 %583 = OpLoad %582 
					                                 f32 %585 = OpFMul %583 %584 
					                        Private f32* %586 = OpAccessChain %9 %23 
					                                              OpStore %586 %585 
					                                 f32 %587 = OpLoad %140 
					                                 f32 %589 = OpFMul %587 %588 
					                        Private f32* %590 = OpAccessChain %9 %23 
					                                 f32 %591 = OpLoad %590 
					                                 f32 %592 = OpFAdd %589 %591 
					                        Private f32* %593 = OpAccessChain %9 %23 
					                                              OpStore %593 %592 
					                                 f32 %594 = OpLoad %578 
					                                 f32 %595 = OpLoad %578 
					                                 f32 %596 = OpFMul %594 %595 
					                                              OpStore %140 %596 
					                                 f32 %597 = OpLoad %578 
					                                 f32 %598 = OpFNegate %597 
					                                 f32 %599 = OpFMul %598 %352 
					                                 f32 %600 = OpFAdd %599 %32 
					                                              OpStore %578 %600 
					                                 f32 %601 = OpLoad %578 
					                                 f32 %602 = OpLoad %140 
					                                 f32 %603 = OpFMul %601 %602 
					                                              OpStore %578 %603 
					                                 f32 %604 = OpLoad %578 
					                                 f32 %605 = OpLoad %105 
					                                 f32 %606 = OpFMul %604 %605 
					                        Private f32* %607 = OpAccessChain %281 %23 
					                                 f32 %608 = OpLoad %607 
					                                 f32 %609 = OpFAdd %606 %608 
					                        Private f32* %610 = OpAccessChain %281 %23 
					                                              OpStore %610 %609 
					                               f32_4 %611 = OpLoad %26 
					                               f32_2 %612 = OpVectorShuffle %611 %611 1 1 
					                                 f32 %613 = OpDot %612 %59 
					                                              OpStore %105 %613 
					                               f32_4 %614 = OpLoad %26 
					                               f32_2 %615 = OpVectorShuffle %614 %614 0 1 
					                                 f32 %616 = OpDot %615 %59 
					                        Private f32* %617 = OpAccessChain %26 %23 
					                                              OpStore %617 %616 
					                        Private f32* %618 = OpAccessChain %26 %23 
					                                 f32 %619 = OpLoad %618 
					                                 f32 %620 = OpExtInst %1 13 %619 
					                        Private f32* %621 = OpAccessChain %26 %23 
					                                              OpStore %621 %620 
					                        Private f32* %622 = OpAccessChain %26 %23 
					                                 f32 %623 = OpLoad %622 
					                                 f32 %624 = OpFMul %623 %293 
					                        Private f32* %625 = OpAccessChain %26 %23 
					                                              OpStore %625 %624 
					                        Private f32* %626 = OpAccessChain %26 %23 
					                                 f32 %627 = OpLoad %626 
					                                 f32 %628 = OpExtInst %1 10 %627 
					                        Private f32* %629 = OpAccessChain %26 %23 
					                                              OpStore %629 %628 
					                                 f32 %630 = OpLoad %105 
					                                 f32 %631 = OpExtInst %1 13 %630 
					                                              OpStore %105 %631 
					                                 f32 %632 = OpLoad %105 
					                                 f32 %633 = OpFMul %632 %293 
					                        Private f32* %634 = OpAccessChain %9 %146 
					                                              OpStore %634 %633 
					                               f32_4 %635 = OpLoad %9 
					                               f32_2 %636 = OpVectorShuffle %635 %635 0 3 
					                               f32_2 %637 = OpExtInst %1 10 %636 
					                               f32_4 %638 = OpLoad %9 
					                               f32_4 %639 = OpVectorShuffle %638 %637 4 1 2 5 
					                                              OpStore %9 %639 
					                        Private f32* %640 = OpAccessChain %26 %23 
					                                 f32 %641 = OpLoad %640 
					                                 f32 %642 = OpFNegate %641 
					                        Private f32* %643 = OpAccessChain %9 %146 
					                                 f32 %644 = OpLoad %643 
					                                 f32 %645 = OpFAdd %642 %644 
					                                              OpStore %105 %645 
					                                 f32 %646 = OpLoad %578 
					                                 f32 %647 = OpLoad %105 
					                                 f32 %648 = OpFMul %646 %647 
					                        Private f32* %649 = OpAccessChain %26 %23 
					                                 f32 %650 = OpLoad %649 
					                                 f32 %651 = OpFAdd %648 %650 
					                                              OpStore %105 %651 
					                        Private f32* %652 = OpAccessChain %281 %23 
					                                 f32 %653 = OpLoad %652 
					                                 f32 %654 = OpFNegate %653 
					                                 f32 %655 = OpLoad %105 
					                                 f32 %656 = OpFAdd %654 %655 
					                                              OpStore %105 %656 
					                                 f32 %657 = OpLoad %578 
					                                 f32 %658 = OpLoad %105 
					                                 f32 %659 = OpFMul %657 %658 
					                        Private f32* %660 = OpAccessChain %281 %23 
					                                 f32 %661 = OpLoad %660 
					                                 f32 %662 = OpFAdd %659 %661 
					                        Private f32* %663 = OpAccessChain %281 %23 
					                                              OpStore %663 %662 
					                        Private f32* %664 = OpAccessChain %281 %23 
					                                 f32 %665 = OpLoad %664 
					                        Private f32* %666 = OpAccessChain %281 %23 
					                                 f32 %667 = OpLoad %666 
					                                 f32 %668 = OpFAdd %665 %667 
					                        Private f32* %669 = OpAccessChain %281 %23 
					                                              OpStore %669 %668 
					                        Private f32* %670 = OpAccessChain %281 %23 
					                                 f32 %671 = OpLoad %670 
					                                 f32 %672 = OpExtInst %1 4 %671 
					                        Private f32* %673 = OpAccessChain %9 %23 
					                                 f32 %674 = OpLoad %673 
					                                 f32 %675 = OpFMul %672 %674 
					                        Private f32* %676 = OpAccessChain %9 %23 
					                                              OpStore %676 %675 
					                        Private f32* %677 = OpAccessChain %281 %23 
					                                 f32 %678 = OpLoad %677 
					                                 f32 %679 = OpExtInst %1 4 %678 
					                                 f32 %681 = OpFMul %679 %680 
					                                 f32 %683 = OpFAdd %681 %682 
					                        Private f32* %684 = OpAccessChain %281 %23 
					                                              OpStore %684 %683 
					                        Private f32* %685 = OpAccessChain %9 %23 
					                                 f32 %686 = OpLoad %685 
					                                 f32 %688 = OpFMul %686 %687 
					                                 f32 %689 = OpFAdd %688 %687 
					                        Private f32* %690 = OpAccessChain %9 %23 
					                                              OpStore %690 %689 
					                        Private f32* %691 = OpAccessChain %9 %23 
					                                 f32 %692 = OpLoad %691 
					                                 f32 %693 = OpExtInst %1 30 %692 
					                        Private f32* %694 = OpAccessChain %9 %23 
					                                              OpStore %694 %693 
					                        Private f32* %695 = OpAccessChain %9 %23 
					                                 f32 %696 = OpLoad %695 
					                                 f32 %698 = OpFMul %696 %697 
					                        Private f32* %699 = OpAccessChain %9 %23 
					                                              OpStore %699 %698 
					                        Private f32* %700 = OpAccessChain %9 %23 
					                                 f32 %701 = OpLoad %700 
					                                 f32 %702 = OpExtInst %1 29 %701 
					                        Private f32* %703 = OpAccessChain %9 %23 
					                                              OpStore %703 %702 
					                        Private f32* %704 = OpAccessChain %9 %23 
					                                 f32 %705 = OpLoad %704 
					                        Private f32* %706 = OpAccessChain %39 %23 
					                                 f32 %707 = OpLoad %706 
					                                 f32 %708 = OpFMul %705 %707 
					                        Private f32* %709 = OpAccessChain %9 %23 
					                                              OpStore %709 %708 
					                        Private f32* %710 = OpAccessChain %281 %23 
					                                 f32 %711 = OpLoad %710 
					                        Private f32* %712 = OpAccessChain %9 %23 
					                                 f32 %713 = OpLoad %712 
					                                 f32 %714 = OpFMul %711 %713 
					                        Private f32* %715 = OpAccessChain %9 %23 
					                                              OpStore %715 %714 
					                        Private f32* %716 = OpAccessChain %9 %23 
					                                 f32 %717 = OpLoad %716 
					                                 f32 %718 = OpExtInst %1 43 %717 %120 %262 
					                        Private f32* %719 = OpAccessChain %9 %23 
					                                              OpStore %719 %718 
					                 read_only Texture2D %724 = OpLoad %723 
					                             sampler %728 = OpLoad %727 
					          read_only Texture2DSampled %730 = OpSampledImage %724 %728 
					                               f32_2 %731 = OpLoad vs_TEXCOORD0 
					                               f32_4 %732 = OpImageSampleImplicitLod %730 %731 
					                                              OpStore %720 %732 
					                        Uniform f32* %734 = OpAccessChain %12 %733 
					                                 f32 %735 = OpLoad %734 
					                        Uniform f32* %736 = OpAccessChain %12 %733 
					                                 f32 %737 = OpLoad %736 
					                        Uniform f32* %738 = OpAccessChain %12 %733 
					                                 f32 %739 = OpLoad %738 
					                        Uniform f32* %740 = OpAccessChain %12 %733 
					                                 f32 %741 = OpLoad %740 
					                               f32_4 %742 = OpCompositeConstruct %735 %737 %739 %741 
					                                 f32 %743 = OpCompositeExtract %742 0 
					                                 f32 %744 = OpCompositeExtract %742 1 
					                                 f32 %745 = OpCompositeExtract %742 2 
					                                 f32 %746 = OpCompositeExtract %742 3 
					                               f32_4 %747 = OpCompositeConstruct %743 %744 %745 %746 
					                               f32_4 %748 = OpLoad %9 
					                               f32_4 %749 = OpVectorShuffle %748 %748 0 0 0 0 
					                               f32_4 %750 = OpFMul %747 %749 
					                               f32_4 %751 = OpLoad %720 
					                               f32_4 %752 = OpFAdd %750 %751 
					                                              OpStore %26 %752 
					                        Private f32* %753 = OpAccessChain %9 %23 
					                                 f32 %754 = OpLoad %753 
					                        Private f32* %755 = OpAccessChain %9 %23 
					                                 f32 %756 = OpLoad %755 
					                                 f32 %757 = OpFAdd %754 %756 
					                        Private f32* %758 = OpAccessChain %9 %23 
					                                              OpStore %758 %757 
					                        Uniform f32* %762 = OpAccessChain %12 %761 
					                                 f32 %763 = OpLoad %762 
					                        Uniform f32* %764 = OpAccessChain %12 %761 
					                                 f32 %765 = OpLoad %764 
					                        Uniform f32* %766 = OpAccessChain %12 %761 
					                                 f32 %767 = OpLoad %766 
					                        Uniform f32* %768 = OpAccessChain %12 %761 
					                                 f32 %769 = OpLoad %768 
					                               f32_4 %770 = OpCompositeConstruct %763 %765 %767 %769 
					                                 f32 %771 = OpCompositeExtract %770 0 
					                                 f32 %772 = OpCompositeExtract %770 1 
					                                 f32 %773 = OpCompositeExtract %770 2 
					                                 f32 %774 = OpCompositeExtract %770 3 
					                               f32_4 %775 = OpCompositeConstruct %771 %772 %773 %774 
					                               f32_4 %776 = OpLoad %9 
					                               f32_4 %777 = OpVectorShuffle %776 %776 0 0 0 0 
					                               f32_4 %778 = OpFNegate %777 
					                               f32_4 %779 = OpFMul %775 %778 
					                               f32_4 %780 = OpLoad %26 
					                               f32_4 %781 = OpFAdd %779 %780 
					                                              OpStore %760 %781 
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
						float FadeLight;
						float FadeDark;
						vec4 unused_0_5[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec2 u_xlat7;
					vec3 u_xlat9;
					int u_xlati9;
					vec2 u_xlat14;
					float u_xlat15;
					float u_xlat21;
					int u_xlati21;
					float u_xlat22;
					int u_xlati22;
					float u_xlat23;
					void main()
					{
					    u_xlat0.x = _Speed * _TimeX;
					    u_xlat1.xyw = u_xlat0.xxx * vec3(9.99999975e-05, 4.0, 3.0);
					    u_xlat7.xy = (-vs_TEXCOORD0.xy) * vec2(20.0, 20.0) + u_xlat1.yy;
					    u_xlat7.xy = floor(u_xlat7.xy);
					    u_xlat7.xy = u_xlat7.xy * vec2(0.0500000007, 0.0500000007);
					    u_xlat7.x = dot(u_xlat7.xy, vec2(127.099998, 311.700012));
					    u_xlat7.x = sin(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 43758.5469;
					    u_xlat7.x = fract(u_xlat7.x);
					    u_xlat7.x = u_xlat0.x * 0.100000001 + u_xlat7.x;
					    u_xlat7.x = fract(u_xlat7.x);
					    u_xlat7.x = log2(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 30.0;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.xy = u_xlat7.xx + vs_TEXCOORD0.yx;
					    u_xlat21 = dot(u_xlat7.xy, vec2(10.0, 14.5));
					    u_xlat21 = u_xlat0.x * 20.0 + u_xlat21;
					    u_xlat21 = sin(u_xlat21);
					    u_xlati2 = int((0.0<u_xlat21) ? 0xFFFFFFFFu : uint(0));
					    u_xlati21 = int((u_xlat21<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati21 = (-u_xlati2) + u_xlati21;
					    u_xlat21 = float(u_xlati21);
					    u_xlat21 = u_xlat21 * 0.100000001;
					    u_xlat22 = u_xlat7.y * 6.0 + u_xlat1.w;
					    u_xlat22 = sin(u_xlat22);
					    u_xlati2 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
					    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati22 = (-u_xlati2) + u_xlati22;
					    u_xlat22 = float(u_xlati22);
					    u_xlat21 = u_xlat22 * 0.100000001 + u_xlat21;
					    u_xlat22 = sin(u_xlat0.x);
					    u_xlat22 = u_xlat7.x * u_xlat22;
					    u_xlat2.xyz = u_xlat7.xyx * vec3(250.0, 22.0, 15.0);
					    u_xlat22 = u_xlat22 * 12.0 + (-u_xlat2.y);
					    u_xlat22 = (-u_xlat0.x) * 40.0 + u_xlat22;
					    u_xlat22 = sin(u_xlat22);
					    u_xlati9 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
					    u_xlati22 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati22 = (-u_xlati9) + u_xlati22;
					    u_xlat22 = float(u_xlati22);
					    u_xlat21 = u_xlat22 * 0.200000003 + u_xlat21;
					    u_xlat21 = u_xlat21 + -0.5;
					    u_xlat21 = u_xlat21 * u_xlat21;
					    u_xlat21 = u_xlat21 * u_xlat21 + (-u_xlat7.x);
					    u_xlat3 = u_xlat7.yxyx * vec4(150.0, 150.0, 350.0, 350.0);
					    u_xlat7.x = u_xlat21 + 1.5;
					    u_xlat7.x = u_xlat7.x * 3.0;
					    u_xlat7.x = floor(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 0.333333343;
					    u_xlat7.x = min(u_xlat7.x, 1.0);
					    u_xlat4 = floor(u_xlat3);
					    u_xlat3 = fract(u_xlat3);
					    u_xlat5 = u_xlat0.xxxx * vec4(9.99999975e-05, 9.99999975e-05, 9.99999975e-05, 9.99999975e-05) + u_xlat4;
					    u_xlat6 = u_xlat5 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat14.x = dot(u_xlat6.xy, vec2(127.099998, 311.700012));
					    u_xlat14.y = dot(u_xlat6.zw, vec2(127.099998, 311.700012));
					    u_xlat14.xy = sin(u_xlat14.xy);
					    u_xlat14.xy = u_xlat14.xy * vec2(43331.5469, 43331.5469);
					    u_xlat14.xy = fract(u_xlat14.xy);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(1.0);
					    u_xlat6 = u_xlat1.xyyx + u_xlat4.xyxy;
					    u_xlat4 = u_xlat1.xyyx + u_xlat4.zwzw;
					    u_xlat4 = u_xlat1.zxxz + u_xlat4;
					    u_xlat6 = u_xlat1.zxxz + u_xlat6;
					    u_xlat22 = dot(u_xlat6.zw, vec2(127.099998, 311.700012));
					    u_xlat9.x = dot(u_xlat6.xy, vec2(127.099998, 311.700012));
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat9.x = u_xlat9.x * 43331.5469;
					    u_xlat22 = sin(u_xlat22);
					    u_xlat22 = u_xlat22 * 43331.5469;
					    u_xlat22 = fract(u_xlat22);
					    u_xlat14.x = u_xlat14.x + (-u_xlat22);
					    u_xlat6 = u_xlat3 * u_xlat3;
					    u_xlat3 = (-u_xlat3) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat3 = u_xlat3 * u_xlat6;
					    u_xlat14.x = u_xlat3.x * u_xlat14.x + u_xlat22;
					    u_xlat22 = dot(u_xlat5.xy, vec2(127.099998, 311.700012));
					    u_xlat23 = dot(u_xlat5.zw, vec2(127.099998, 311.700012));
					    u_xlat23 = sin(u_xlat23);
					    u_xlat9.z = u_xlat23 * 43331.5469;
					    u_xlat9.xz = fract(u_xlat9.xz);
					    u_xlat22 = sin(u_xlat22);
					    u_xlat22 = u_xlat22 * 43331.5469;
					    u_xlat22 = fract(u_xlat22);
					    u_xlat9.x = (-u_xlat22) + u_xlat9.x;
					    u_xlat22 = u_xlat3.x * u_xlat9.x + u_xlat22;
					    u_xlat14.x = u_xlat14.x + (-u_xlat22);
					    u_xlat14.x = u_xlat3.y * u_xlat14.x + u_xlat22;
					    u_xlat22 = dot(u_xlat4.zw, vec2(127.099998, 311.700012));
					    u_xlat9.x = dot(u_xlat4.xy, vec2(127.099998, 311.700012));
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat9.x = u_xlat9.x * 43331.5469;
					    u_xlat9.x = fract(u_xlat9.x);
					    u_xlat9.x = (-u_xlat9.z) + u_xlat9.x;
					    u_xlat9.x = u_xlat3.z * u_xlat9.x + u_xlat9.z;
					    u_xlat22 = sin(u_xlat22);
					    u_xlat22 = u_xlat22 * 43331.5469;
					    u_xlat22 = fract(u_xlat22);
					    u_xlat21 = u_xlat14.y + (-u_xlat22);
					    u_xlat21 = u_xlat3.z * u_xlat21 + u_xlat22;
					    u_xlat21 = (-u_xlat9.x) + u_xlat21;
					    u_xlat21 = u_xlat3.w * u_xlat21 + u_xlat9.x;
					    u_xlat14.x = u_xlat21 + u_xlat14.x;
					    u_xlat14.x = u_xlat14.x * 0.5;
					    u_xlat21 = u_xlat14.x * u_xlat14.x;
					    u_xlat14.x = u_xlat21 * u_xlat14.x;
					    u_xlat21 = u_xlat0.x * 2.0 + u_xlat2.x;
					    u_xlat22 = floor(u_xlat2.z);
					    u_xlat21 = sin(u_xlat21);
					    u_xlat14.x = abs(u_xlat21) * u_xlat14.x;
					    u_xlat7.x = u_xlat7.x * u_xlat14.x;
					    u_xlat14.x = floor(u_xlat0.x);
					    u_xlat2.xy = u_xlat1.yx + u_xlat14.xx;
					    u_xlat1.xy = u_xlat1.xz + u_xlat2.xy;
					    u_xlat14.x = u_xlat0.x * 9.99999975e-05 + u_xlat14.x;
					    u_xlat14.x = dot(u_xlat14.xx, vec2(127.099998, 311.700012));
					    u_xlat14.x = sin(u_xlat14.x);
					    u_xlat14.x = u_xlat14.x * 43331.5469;
					    u_xlat21 = dot(u_xlat1.yx, vec2(127.099998, 311.700012));
					    u_xlat21 = sin(u_xlat21);
					    u_xlat14.y = u_xlat21 * 43331.5469;
					    u_xlat14.xy = fract(u_xlat14.xy);
					    u_xlat21 = (-u_xlat14.x) + u_xlat14.y;
					    u_xlat15 = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.300000012;
					    u_xlat0.x = u_xlat22 * 0.0666666701 + u_xlat0.x;
					    u_xlat22 = u_xlat15 * u_xlat15;
					    u_xlat15 = (-u_xlat15) * 2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat22;
					    u_xlat14.x = u_xlat15 * u_xlat21 + u_xlat14.x;
					    u_xlat21 = dot(u_xlat1.yy, vec2(127.099998, 311.700012));
					    u_xlat1.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43331.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat21 = sin(u_xlat21);
					    u_xlat0.w = u_xlat21 * 43331.5469;
					    u_xlat0.xw = fract(u_xlat0.xw);
					    u_xlat21 = (-u_xlat1.x) + u_xlat0.w;
					    u_xlat21 = u_xlat15 * u_xlat21 + u_xlat1.x;
					    u_xlat21 = (-u_xlat14.x) + u_xlat21;
					    u_xlat14.x = u_xlat15 * u_xlat21 + u_xlat14.x;
					    u_xlat14.x = u_xlat14.x + u_xlat14.x;
					    u_xlat0.x = abs(u_xlat14.x) * u_xlat0.x;
					    u_xlat14.x = abs(u_xlat14.x) * 0.125 + 0.75;
					    u_xlat0.x = u_xlat0.x * 0.400000006 + 0.400000006;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.649999976;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat7.x;
					    u_xlat0.x = u_xlat14.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = vec4(vec4(FadeLight, FadeLight, FadeLight, FadeLight)) * u_xlat0.xxxx + u_xlat10_1;
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    SV_Target0 = vec4(vec4(FadeDark, FadeDark, FadeDark, FadeDark)) * (-u_xlat0.xxxx) + u_xlat1;
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