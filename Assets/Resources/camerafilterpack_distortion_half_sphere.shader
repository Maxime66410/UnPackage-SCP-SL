Shader "CameraFilterPack/Distortion_float_Sphere" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_SphereSize ("_SphereSize", Range(1, 10)) = 1
		_SpherePositionX ("_SpherePositionX", Range(-1, 1)) = 0
		_SpherePositionY ("_SpherePositionY", Range(-1, 1)) = 0
		_Strength ("_Strength", Range(1, 10)) = 5
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 26217
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _SphereSize;
					uniform 	float _SpherePositionX;
					uniform 	float _SpherePositionY;
					uniform 	float _Strength;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					bool u_xlatb3;
					float u_xlat4;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat11;
					float u_xlat12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat17;
					bool u_xlatb17;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.y = _ScreenResolution.y / _ScreenResolution.x;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = 1.0;
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat10.xy = vec2(_SphereSize, _Strength) * vec2(0.100000001, 1.07500005);
					    u_xlat11.x = _SpherePositionX * 0.5 + 0.5;
					    u_xlat11.y = (-_SpherePositionY) * 0.5 + 0.5;
					    u_xlat2.xy = (-u_xlat11.xy);
					    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat17 = u_xlat2.x / u_xlat2.y;
					    u_xlat3.x = min(abs(u_xlat17), 1.0);
					    u_xlat8 = max(abs(u_xlat17), 1.0);
					    u_xlat8 = float(1.0) / u_xlat8;
					    u_xlat3.x = u_xlat8 * u_xlat3.x;
					    u_xlat8 = u_xlat3.x * u_xlat3.x;
					    u_xlat13 = u_xlat8 * 0.0208350997 + -0.0851330012;
					    u_xlat13 = u_xlat8 * u_xlat13 + 0.180141002;
					    u_xlat13 = u_xlat8 * u_xlat13 + -0.330299497;
					    u_xlat8 = u_xlat8 * u_xlat13 + 0.999866009;
					    u_xlat13 = u_xlat8 * u_xlat3.x;
					    u_xlatb18 = 1.0<abs(u_xlat17);
					    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
					    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
					    u_xlat3.x = u_xlat3.x * u_xlat8 + u_xlat13;
					    u_xlat17 = min(u_xlat17, 1.0);
					    u_xlatb17 = u_xlat17<(-u_xlat17);
					    u_xlat17 = (u_xlatb17) ? (-u_xlat3.x) : u_xlat3.x;
					    u_xlatb3 = 0.0>=u_xlat2.y;
					    if(u_xlatb3){
					        u_xlatb3 = u_xlat2.x>=0.0;
					        u_xlatb8 = u_xlat2.y<0.0;
					        u_xlatb3 = u_xlatb8 && u_xlatb3;
					        if(!u_xlatb3){
					            u_xlatb13 = u_xlat2.x<0.0;
					            u_xlatb8 = u_xlatb8 && u_xlatb13;
					            u_xlat18 = u_xlat17 + -3.1400001;
					            u_xlatb2 = 0.0<u_xlat2.x;
					            u_xlatb7 = u_xlat2.y==0.0;
					            u_xlatb2 = u_xlatb7 && u_xlatb2;
					            u_xlatb7 = u_xlatb7 && u_xlatb13;
					            u_xlat7 = (u_xlatb7) ? -1.57000005 : 1.57000005;
					            u_xlat2.x = (u_xlatb2) ? 1.57000005 : u_xlat7;
					            u_xlat17 = (u_xlatb8) ? u_xlat18 : u_xlat2.x;
					        } else {
					            u_xlat2.x = u_xlat17 + 3.1400001;
					            u_xlat17 = (u_xlatb3) ? u_xlat2.x : u_xlat17;
					        }
					    }
					    u_xlat2.x = u_xlat12 / u_xlat10.x;
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = u_xlat2.x + -1.0;
					    u_xlat7 = (-u_xlat7) * u_xlat7 + 1.0;
					    u_xlat7 = sqrt(u_xlat7);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat3.x = u_xlat2.x / u_xlat7;
					    u_xlat8 = min(u_xlat3.x, 1.0);
					    u_xlat13 = max(u_xlat3.x, 1.0);
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat8 = u_xlat13 * u_xlat8;
					    u_xlat13 = u_xlat8 * u_xlat8;
					    u_xlat18 = u_xlat13 * 0.0208350997 + -0.0851330012;
					    u_xlat18 = u_xlat13 * u_xlat18 + 0.180141002;
					    u_xlat18 = u_xlat13 * u_xlat18 + -0.330299497;
					    u_xlat13 = u_xlat13 * u_xlat18 + 0.999866009;
					    u_xlat18 = u_xlat13 * u_xlat8;
					    u_xlatb3 = 1.0<u_xlat3.x;
					    u_xlat18 = u_xlat18 * -2.0 + 1.57079637;
					    u_xlat3.x = u_xlatb3 ? u_xlat18 : float(0.0);
					    u_xlat3.x = u_xlat8 * u_xlat13 + u_xlat3.x;
					    u_xlatb8 = 0.0>=u_xlat7;
					    u_xlat3.x = (u_xlatb8) ? 1.57000005 : u_xlat3.x;
					    u_xlat8 = sin(u_xlat3.x);
					    u_xlat15 = u_xlat8 / u_xlat10.y;
					    u_xlat8 = -abs(u_xlat15) + 1.0;
					    u_xlat8 = sqrt(u_xlat8);
					    u_xlat13 = abs(u_xlat15) * -0.0187292993 + 0.0742610022;
					    u_xlat13 = u_xlat13 * abs(u_xlat15) + -0.212114394;
					    u_xlat13 = u_xlat13 * abs(u_xlat15) + 1.57072878;
					    u_xlat18 = u_xlat8 * u_xlat13;
					    u_xlat18 = u_xlat18 * -2.0 + 3.14159274;
					    u_xlatb15 = u_xlat15<(-u_xlat15);
					    u_xlat15 = u_xlatb15 ? u_xlat18 : float(0.0);
					    u_xlat15 = u_xlat13 * u_xlat8 + u_xlat15;
					    u_xlat15 = (-u_xlat15) + 1.57079637;
					    u_xlat15 = (-u_xlat15) + u_xlat3.x;
					    u_xlat3.x = sin(u_xlat15);
					    u_xlat4 = cos(u_xlat15);
					    u_xlat15 = u_xlat7 * u_xlat3.x;
					    u_xlat15 = u_xlat15 / u_xlat4;
					    u_xlat15 = (-u_xlat15) + u_xlat2.x;
					    u_xlat2.x = sin(u_xlat17);
					    u_xlat3.x = cos(u_xlat17);
					    u_xlat2.y = u_xlat3.x;
					    u_xlat2.xy = vec2(u_xlat15) * u_xlat2.xy;
					    u_xlat3.x = u_xlat2.x * u_xlat10.x + u_xlat11.x;
					    u_xlat3.y = u_xlat2.y * u_xlat10.x + u_xlat11.y;
					    u_xlatb10 = u_xlat12<u_xlat10.x;
					    u_xlat15 = u_xlatb10 ? 1.0 : float(0.0);
					    u_xlat10.x = (u_xlatb10) ? 0.0 : 1.0;
					    u_xlat11.xy = vec2(u_xlat15) * u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * u_xlat10.xx + u_xlat11.xy;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
					; Bound: 508
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %494 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %14 0 Offset 14 
					                                                      OpMemberDecorate %14 1 Offset 14 
					                                                      OpMemberDecorate %14 2 Offset 14 
					                                                      OpMemberDecorate %14 3 Offset 14 
					                                                      OpMemberDecorate %14 4 Offset 14 
					                                                      OpMemberDecorate %14 5 RelaxedPrecision 
					                                                      OpMemberDecorate %14 5 Offset 14 
					                                                      OpDecorate %14 Block 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %494 Location 494 
					                                                      OpDecorate %497 RelaxedPrecision 
					                                                      OpDecorate %497 DescriptorSet 497 
					                                                      OpDecorate %497 Binding 497 
					                                                      OpDecorate %498 RelaxedPrecision 
					                                                      OpDecorate %501 RelaxedPrecision 
					                                                      OpDecorate %501 DescriptorSet 501 
					                                                      OpDecorate %501 Binding 501 
					                                                      OpDecorate %502 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeVector %6 4 
					                                              %14 = OpTypeStruct %13 %6 %6 %6 %6 %13 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32_4; f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 5 
					                                              %19 = OpTypePointer Uniform %13 
					                               Private f32_2* %28 = OpVariable Private 
					                                          i32 %29 = OpConstant 0 
					                                              %30 = OpTypeInt 32 0 
					                                          u32 %31 = OpConstant 1 
					                                              %32 = OpTypePointer Uniform %6 
					                                          u32 %35 = OpConstant 0 
					                                              %39 = OpTypePointer Private %6 
					                                          f32 %42 = OpConstant 3,674022E-40 
					                                        f32_2 %43 = OpConstantComposite %42 %42 
					                                          f32 %45 = OpConstant 3,674022E-40 
					                                          f32 %50 = OpConstant 3,674022E-40 
					                                        f32_2 %51 = OpConstantComposite %50 %50 
					                               Private f32_2* %53 = OpVariable Private 
					                                          i32 %54 = OpConstant 1 
					                                          i32 %57 = OpConstant 4 
					                                          f32 %61 = OpConstant 3,674022E-40 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                        f32_2 %63 = OpConstantComposite %61 %62 
					                               Private f32_2* %65 = OpVariable Private 
					                                          i32 %66 = OpConstant 2 
					                                          i32 %72 = OpConstant 3 
					                               Private f32_2* %79 = OpVariable Private 
					                                 Private f32* %85 = OpVariable Private 
					                                 Private f32* %91 = OpVariable Private 
					                               Private f32_2* %97 = OpVariable Private 
					                                Private f32* %102 = OpVariable Private 
					                                Private f32* %118 = OpVariable Private 
					                                         f32 %120 = OpConstant 3,674022E-40 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                         f32 %127 = OpConstant 3,674022E-40 
					                                         f32 %132 = OpConstant 3,674022E-40 
					                                         f32 %137 = OpConstant 3,674022E-40 
					                                             %143 = OpTypeBool 
					                                             %144 = OpTypePointer Private %143 
					                               Private bool* %145 = OpVariable Private 
					                                         f32 %150 = OpConstant 3,674022E-40 
					                                         f32 %152 = OpConstant 3,674022E-40 
					                                         f32 %156 = OpConstant 3,674022E-40 
					                               Private bool* %167 = OpVariable Private 
					                                             %173 = OpTypePointer Function %6 
					                               Private bool* %184 = OpVariable Private 
					                               Private bool* %194 = OpVariable Private 
					                               Private bool* %205 = OpVariable Private 
					                                Private f32* %212 = OpVariable Private 
					                                         f32 %214 = OpConstant 3,674022E-40 
					                               Private bool* %216 = OpVariable Private 
					                               Private bool* %220 = OpVariable Private 
					                                Private f32* %230 = OpVariable Private 
					                                         f32 %232 = OpConstant 3,674022E-40 
					                                         f32 %233 = OpConstant 3,674022E-40 
					                                         f32 %250 = OpConstant 3,674022E-40 
					                                         f32 %278 = OpConstant 3,674022E-40 
					                                Private f32* %360 = OpVariable Private 
					                                         f32 %373 = OpConstant 3,674022E-40 
					                                         f32 %375 = OpConstant 3,674022E-40 
					                                         f32 %381 = OpConstant 3,674022E-40 
					                                         f32 %387 = OpConstant 3,674022E-40 
					                                         f32 %394 = OpConstant 3,674022E-40 
					                               Private bool* %396 = OpVariable Private 
					                                Private f32* %420 = OpVariable Private 
					                               Private bool* %466 = OpVariable Private 
					                                             %493 = OpTypePointer Output %13 
					                               Output f32_4* %494 = OpVariable Output 
					                                             %495 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %496 = OpTypePointer UniformConstant %495 
					        UniformConstant read_only Texture2D* %497 = OpVariable UniformConstant 
					                                             %499 = OpTypeSampler 
					                                             %500 = OpTypePointer UniformConstant %499 
					                    UniformConstant sampler* %501 = OpVariable UniformConstant 
					                                             %503 = OpTypeSampledImage %495 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %174 = OpVariable Function 
					                               Function f32* %240 = OpVariable Function 
					                               Function f32* %254 = OpVariable Function 
					                               Function f32* %349 = OpVariable Function 
					                                        f32_2 %12 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %20 = OpAccessChain %16 %18 
					                                        f32_4 %21 = OpLoad %20 
					                                        f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                                        f32_2 %23 = OpFMul %12 %22 
					                               Uniform f32_4* %24 = OpAccessChain %16 %18 
					                                        f32_4 %25 = OpLoad %24 
					                                        f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                                        f32_2 %27 = OpFAdd %23 %26 
					                                                      OpStore %9 %27 
					                                 Uniform f32* %33 = OpAccessChain %16 %29 %31 
					                                          f32 %34 = OpLoad %33 
					                                 Uniform f32* %36 = OpAccessChain %16 %29 %35 
					                                          f32 %37 = OpLoad %36 
					                                          f32 %38 = OpFDiv %34 %37 
					                                 Private f32* %40 = OpAccessChain %28 %31 
					                                                      OpStore %40 %38 
					                                        f32_2 %41 = OpLoad %9 
					                                        f32_2 %44 = OpFAdd %41 %43 
					                                                      OpStore %9 %44 
					                                 Private f32* %46 = OpAccessChain %28 %35 
					                                                      OpStore %46 %45 
					                                        f32_2 %47 = OpLoad %9 
					                                        f32_2 %48 = OpLoad %28 
					                                        f32_2 %49 = OpFMul %47 %48 
					                                        f32_2 %52 = OpFAdd %49 %51 
					                                                      OpStore %9 %52 
					                                 Uniform f32* %55 = OpAccessChain %16 %54 
					                                          f32 %56 = OpLoad %55 
					                                 Uniform f32* %58 = OpAccessChain %16 %57 
					                                          f32 %59 = OpLoad %58 
					                                        f32_2 %60 = OpCompositeConstruct %56 %59 
					                                        f32_2 %64 = OpFMul %60 %63 
					                                                      OpStore %53 %64 
					                                 Uniform f32* %67 = OpAccessChain %16 %66 
					                                          f32 %68 = OpLoad %67 
					                                          f32 %69 = OpFMul %68 %50 
					                                          f32 %70 = OpFAdd %69 %50 
					                                 Private f32* %71 = OpAccessChain %65 %35 
					                                                      OpStore %71 %70 
					                                 Uniform f32* %73 = OpAccessChain %16 %72 
					                                          f32 %74 = OpLoad %73 
					                                          f32 %75 = OpFNegate %74 
					                                          f32 %76 = OpFMul %75 %50 
					                                          f32 %77 = OpFAdd %76 %50 
					                                 Private f32* %78 = OpAccessChain %65 %31 
					                                                      OpStore %78 %77 
					                                        f32_2 %80 = OpLoad %65 
					                                        f32_2 %81 = OpFNegate %80 
					                                                      OpStore %79 %81 
					                                        f32_2 %82 = OpLoad %9 
					                                        f32_2 %83 = OpLoad %79 
					                                        f32_2 %84 = OpFAdd %82 %83 
					                                                      OpStore %79 %84 
					                                        f32_2 %86 = OpLoad %79 
					                                        f32_2 %87 = OpLoad %79 
					                                          f32 %88 = OpDot %86 %87 
					                                                      OpStore %85 %88 
					                                          f32 %89 = OpLoad %85 
					                                          f32 %90 = OpExtInst %1 31 %89 
					                                                      OpStore %85 %90 
					                                 Private f32* %92 = OpAccessChain %79 %35 
					                                          f32 %93 = OpLoad %92 
					                                 Private f32* %94 = OpAccessChain %79 %31 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFDiv %93 %95 
					                                                      OpStore %91 %96 
					                                          f32 %98 = OpLoad %91 
					                                          f32 %99 = OpExtInst %1 4 %98 
					                                         f32 %100 = OpExtInst %1 37 %99 %45 
					                                Private f32* %101 = OpAccessChain %97 %35 
					                                                      OpStore %101 %100 
					                                         f32 %103 = OpLoad %91 
					                                         f32 %104 = OpExtInst %1 4 %103 
					                                         f32 %105 = OpExtInst %1 40 %104 %45 
					                                                      OpStore %102 %105 
					                                         f32 %106 = OpLoad %102 
					                                         f32 %107 = OpFDiv %45 %106 
					                                                      OpStore %102 %107 
					                                         f32 %108 = OpLoad %102 
					                                Private f32* %109 = OpAccessChain %97 %35 
					                                         f32 %110 = OpLoad %109 
					                                         f32 %111 = OpFMul %108 %110 
					                                Private f32* %112 = OpAccessChain %97 %35 
					                                                      OpStore %112 %111 
					                                Private f32* %113 = OpAccessChain %97 %35 
					                                         f32 %114 = OpLoad %113 
					                                Private f32* %115 = OpAccessChain %97 %35 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFMul %114 %116 
					                                                      OpStore %102 %117 
					                                         f32 %119 = OpLoad %102 
					                                         f32 %121 = OpFMul %119 %120 
					                                         f32 %123 = OpFAdd %121 %122 
					                                                      OpStore %118 %123 
					                                         f32 %124 = OpLoad %102 
					                                         f32 %125 = OpLoad %118 
					                                         f32 %126 = OpFMul %124 %125 
					                                         f32 %128 = OpFAdd %126 %127 
					                                                      OpStore %118 %128 
					                                         f32 %129 = OpLoad %102 
					                                         f32 %130 = OpLoad %118 
					                                         f32 %131 = OpFMul %129 %130 
					                                         f32 %133 = OpFAdd %131 %132 
					                                                      OpStore %118 %133 
					                                         f32 %134 = OpLoad %102 
					                                         f32 %135 = OpLoad %118 
					                                         f32 %136 = OpFMul %134 %135 
					                                         f32 %138 = OpFAdd %136 %137 
					                                                      OpStore %102 %138 
					                                         f32 %139 = OpLoad %102 
					                                Private f32* %140 = OpAccessChain %97 %35 
					                                         f32 %141 = OpLoad %140 
					                                         f32 %142 = OpFMul %139 %141 
					                                                      OpStore %118 %142 
					                                         f32 %146 = OpLoad %91 
					                                         f32 %147 = OpExtInst %1 4 %146 
					                                        bool %148 = OpFOrdLessThan %45 %147 
					                                                      OpStore %145 %148 
					                                         f32 %149 = OpLoad %118 
					                                         f32 %151 = OpFMul %149 %150 
					                                         f32 %153 = OpFAdd %151 %152 
					                                                      OpStore %118 %153 
					                                        bool %154 = OpLoad %145 
					                                         f32 %155 = OpLoad %118 
					                                         f32 %157 = OpSelect %154 %155 %156 
					                                                      OpStore %118 %157 
					                                Private f32* %158 = OpAccessChain %97 %35 
					                                         f32 %159 = OpLoad %158 
					                                         f32 %160 = OpLoad %102 
					                                         f32 %161 = OpFMul %159 %160 
					                                         f32 %162 = OpLoad %118 
					                                         f32 %163 = OpFAdd %161 %162 
					                                Private f32* %164 = OpAccessChain %97 %35 
					                                                      OpStore %164 %163 
					                                         f32 %165 = OpLoad %91 
					                                         f32 %166 = OpExtInst %1 37 %165 %45 
					                                                      OpStore %91 %166 
					                                         f32 %168 = OpLoad %91 
					                                         f32 %169 = OpLoad %91 
					                                         f32 %170 = OpFNegate %169 
					                                        bool %171 = OpFOrdLessThan %168 %170 
					                                                      OpStore %167 %171 
					                                        bool %172 = OpLoad %167 
					                                                      OpSelectionMerge %176 None 
					                                                      OpBranchConditional %172 %175 %180 
					                                             %175 = OpLabel 
					                                Private f32* %177 = OpAccessChain %97 %35 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpFNegate %178 
					                                                      OpStore %174 %179 
					                                                      OpBranch %176 
					                                             %180 = OpLabel 
					                                Private f32* %181 = OpAccessChain %97 %35 
					                                         f32 %182 = OpLoad %181 
					                                                      OpStore %174 %182 
					                                                      OpBranch %176 
					                                             %176 = OpLabel 
					                                         f32 %183 = OpLoad %174 
					                                                      OpStore %91 %183 
					                                Private f32* %185 = OpAccessChain %79 %31 
					                                         f32 %186 = OpLoad %185 
					                                        bool %187 = OpFOrdGreaterThanEqual %156 %186 
					                                                      OpStore %184 %187 
					                                        bool %188 = OpLoad %184 
					                                                      OpSelectionMerge %190 None 
					                                                      OpBranchConditional %188 %189 %190 
					                                             %189 = OpLabel 
					                                Private f32* %191 = OpAccessChain %79 %35 
					                                         f32 %192 = OpLoad %191 
					                                        bool %193 = OpFOrdGreaterThanEqual %192 %156 
					                                                      OpStore %184 %193 
					                                Private f32* %195 = OpAccessChain %79 %31 
					                                         f32 %196 = OpLoad %195 
					                                        bool %197 = OpFOrdLessThan %196 %156 
					                                                      OpStore %194 %197 
					                                        bool %198 = OpLoad %194 
					                                        bool %199 = OpLoad %184 
					                                        bool %200 = OpLogicalAnd %198 %199 
					                                                      OpStore %184 %200 
					                                        bool %201 = OpLoad %184 
					                                        bool %202 = OpLogicalNot %201 
					                                                      OpSelectionMerge %204 None 
					                                                      OpBranchConditional %202 %203 %248 
					                                             %203 = OpLabel 
					                                Private f32* %206 = OpAccessChain %79 %35 
					                                         f32 %207 = OpLoad %206 
					                                        bool %208 = OpFOrdLessThan %207 %156 
					                                                      OpStore %205 %208 
					                                        bool %209 = OpLoad %194 
					                                        bool %210 = OpLoad %205 
					                                        bool %211 = OpLogicalAnd %209 %210 
					                                                      OpStore %194 %211 
					                                         f32 %213 = OpLoad %91 
					                                         f32 %215 = OpFAdd %213 %214 
					                                                      OpStore %212 %215 
					                                Private f32* %217 = OpAccessChain %79 %35 
					                                         f32 %218 = OpLoad %217 
					                                        bool %219 = OpFOrdLessThan %156 %218 
					                                                      OpStore %216 %219 
					                                Private f32* %221 = OpAccessChain %79 %31 
					                                         f32 %222 = OpLoad %221 
					                                        bool %223 = OpFOrdEqual %222 %156 
					                                                      OpStore %220 %223 
					                                        bool %224 = OpLoad %220 
					                                        bool %225 = OpLoad %216 
					                                        bool %226 = OpLogicalAnd %224 %225 
					                                                      OpStore %216 %226 
					                                        bool %227 = OpLoad %220 
					                                        bool %228 = OpLoad %205 
					                                        bool %229 = OpLogicalAnd %227 %228 
					                                                      OpStore %220 %229 
					                                        bool %231 = OpLoad %220 
					                                         f32 %234 = OpSelect %231 %232 %233 
					                                                      OpStore %230 %234 
					                                        bool %235 = OpLoad %216 
					                                         f32 %236 = OpLoad %230 
					                                         f32 %237 = OpSelect %235 %233 %236 
					                                Private f32* %238 = OpAccessChain %79 %35 
					                                                      OpStore %238 %237 
					                                        bool %239 = OpLoad %194 
					                                                      OpSelectionMerge %242 None 
					                                                      OpBranchConditional %239 %241 %244 
					                                             %241 = OpLabel 
					                                         f32 %243 = OpLoad %212 
					                                                      OpStore %240 %243 
					                                                      OpBranch %242 
					                                             %244 = OpLabel 
					                                Private f32* %245 = OpAccessChain %79 %35 
					                                         f32 %246 = OpLoad %245 
					                                                      OpStore %240 %246 
					                                                      OpBranch %242 
					                                             %242 = OpLabel 
					                                         f32 %247 = OpLoad %240 
					                                                      OpStore %91 %247 
					                                                      OpBranch %204 
					                                             %248 = OpLabel 
					                                         f32 %249 = OpLoad %91 
					                                         f32 %251 = OpFAdd %249 %250 
					                                Private f32* %252 = OpAccessChain %79 %35 
					                                                      OpStore %252 %251 
					                                        bool %253 = OpLoad %184 
					                                                      OpSelectionMerge %256 None 
					                                                      OpBranchConditional %253 %255 %259 
					                                             %255 = OpLabel 
					                                Private f32* %257 = OpAccessChain %79 %35 
					                                         f32 %258 = OpLoad %257 
					                                                      OpStore %254 %258 
					                                                      OpBranch %256 
					                                             %259 = OpLabel 
					                                         f32 %260 = OpLoad %91 
					                                                      OpStore %254 %260 
					                                                      OpBranch %256 
					                                             %256 = OpLabel 
					                                         f32 %261 = OpLoad %254 
					                                                      OpStore %91 %261 
					                                                      OpBranch %204 
					                                             %204 = OpLabel 
					                                                      OpBranch %190 
					                                             %190 = OpLabel 
					                                         f32 %262 = OpLoad %85 
					                                Private f32* %263 = OpAccessChain %53 %35 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %265 = OpFDiv %262 %264 
					                                Private f32* %266 = OpAccessChain %79 %35 
					                                                      OpStore %266 %265 
					                                Private f32* %267 = OpAccessChain %79 %35 
					                                         f32 %268 = OpLoad %267 
					                                         f32 %269 = OpFNegate %268 
					                                         f32 %270 = OpFAdd %269 %45 
					                                Private f32* %271 = OpAccessChain %79 %35 
					                                                      OpStore %271 %270 
					                                Private f32* %272 = OpAccessChain %79 %35 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpExtInst %1 43 %273 %156 %45 
					                                Private f32* %275 = OpAccessChain %79 %35 
					                                                      OpStore %275 %274 
					                                Private f32* %276 = OpAccessChain %79 %35 
					                                         f32 %277 = OpLoad %276 
					                                         f32 %279 = OpFAdd %277 %278 
					                                                      OpStore %230 %279 
					                                         f32 %280 = OpLoad %230 
					                                         f32 %281 = OpFNegate %280 
					                                         f32 %282 = OpLoad %230 
					                                         f32 %283 = OpFMul %281 %282 
					                                         f32 %284 = OpFAdd %283 %45 
					                                                      OpStore %230 %284 
					                                         f32 %285 = OpLoad %230 
					                                         f32 %286 = OpExtInst %1 31 %285 
					                                                      OpStore %230 %286 
					                                Private f32* %287 = OpAccessChain %79 %35 
					                                         f32 %288 = OpLoad %287 
					                                         f32 %289 = OpFNegate %288 
					                                         f32 %290 = OpFAdd %289 %45 
					                                Private f32* %291 = OpAccessChain %79 %35 
					                                                      OpStore %291 %290 
					                                Private f32* %292 = OpAccessChain %79 %35 
					                                         f32 %293 = OpLoad %292 
					                                         f32 %294 = OpLoad %230 
					                                         f32 %295 = OpFDiv %293 %294 
					                                Private f32* %296 = OpAccessChain %97 %35 
					                                                      OpStore %296 %295 
					                                Private f32* %297 = OpAccessChain %97 %35 
					                                         f32 %298 = OpLoad %297 
					                                         f32 %299 = OpExtInst %1 37 %298 %45 
					                                                      OpStore %102 %299 
					                                Private f32* %300 = OpAccessChain %97 %35 
					                                         f32 %301 = OpLoad %300 
					                                         f32 %302 = OpExtInst %1 40 %301 %45 
					                                                      OpStore %118 %302 
					                                         f32 %303 = OpLoad %118 
					                                         f32 %304 = OpFDiv %45 %303 
					                                                      OpStore %118 %304 
					                                         f32 %305 = OpLoad %118 
					                                         f32 %306 = OpLoad %102 
					                                         f32 %307 = OpFMul %305 %306 
					                                                      OpStore %102 %307 
					                                         f32 %308 = OpLoad %102 
					                                         f32 %309 = OpLoad %102 
					                                         f32 %310 = OpFMul %308 %309 
					                                                      OpStore %118 %310 
					                                         f32 %311 = OpLoad %118 
					                                         f32 %312 = OpFMul %311 %120 
					                                         f32 %313 = OpFAdd %312 %122 
					                                                      OpStore %212 %313 
					                                         f32 %314 = OpLoad %118 
					                                         f32 %315 = OpLoad %212 
					                                         f32 %316 = OpFMul %314 %315 
					                                         f32 %317 = OpFAdd %316 %127 
					                                                      OpStore %212 %317 
					                                         f32 %318 = OpLoad %118 
					                                         f32 %319 = OpLoad %212 
					                                         f32 %320 = OpFMul %318 %319 
					                                         f32 %321 = OpFAdd %320 %132 
					                                                      OpStore %212 %321 
					                                         f32 %322 = OpLoad %118 
					                                         f32 %323 = OpLoad %212 
					                                         f32 %324 = OpFMul %322 %323 
					                                         f32 %325 = OpFAdd %324 %137 
					                                                      OpStore %118 %325 
					                                         f32 %326 = OpLoad %118 
					                                         f32 %327 = OpLoad %102 
					                                         f32 %328 = OpFMul %326 %327 
					                                                      OpStore %212 %328 
					                                Private f32* %329 = OpAccessChain %97 %35 
					                                         f32 %330 = OpLoad %329 
					                                        bool %331 = OpFOrdLessThan %45 %330 
					                                                      OpStore %184 %331 
					                                         f32 %332 = OpLoad %212 
					                                         f32 %333 = OpFMul %332 %150 
					                                         f32 %334 = OpFAdd %333 %152 
					                                                      OpStore %212 %334 
					                                        bool %335 = OpLoad %184 
					                                         f32 %336 = OpLoad %212 
					                                         f32 %337 = OpSelect %335 %336 %156 
					                                Private f32* %338 = OpAccessChain %97 %35 
					                                                      OpStore %338 %337 
					                                         f32 %339 = OpLoad %102 
					                                         f32 %340 = OpLoad %118 
					                                         f32 %341 = OpFMul %339 %340 
					                                Private f32* %342 = OpAccessChain %97 %35 
					                                         f32 %343 = OpLoad %342 
					                                         f32 %344 = OpFAdd %341 %343 
					                                Private f32* %345 = OpAccessChain %97 %35 
					                                                      OpStore %345 %344 
					                                         f32 %346 = OpLoad %230 
					                                        bool %347 = OpFOrdGreaterThanEqual %156 %346 
					                                                      OpStore %194 %347 
					                                        bool %348 = OpLoad %194 
					                                                      OpSelectionMerge %351 None 
					                                                      OpBranchConditional %348 %350 %352 
					                                             %350 = OpLabel 
					                                                      OpStore %349 %233 
					                                                      OpBranch %351 
					                                             %352 = OpLabel 
					                                Private f32* %353 = OpAccessChain %97 %35 
					                                         f32 %354 = OpLoad %353 
					                                                      OpStore %349 %354 
					                                                      OpBranch %351 
					                                             %351 = OpLabel 
					                                         f32 %355 = OpLoad %349 
					                                Private f32* %356 = OpAccessChain %97 %35 
					                                                      OpStore %356 %355 
					                                Private f32* %357 = OpAccessChain %97 %35 
					                                         f32 %358 = OpLoad %357 
					                                         f32 %359 = OpExtInst %1 13 %358 
					                                                      OpStore %102 %359 
					                                         f32 %361 = OpLoad %102 
					                                Private f32* %362 = OpAccessChain %53 %31 
					                                         f32 %363 = OpLoad %362 
					                                         f32 %364 = OpFDiv %361 %363 
					                                                      OpStore %360 %364 
					                                         f32 %365 = OpLoad %360 
					                                         f32 %366 = OpExtInst %1 4 %365 
					                                         f32 %367 = OpFNegate %366 
					                                         f32 %368 = OpFAdd %367 %45 
					                                                      OpStore %102 %368 
					                                         f32 %369 = OpLoad %102 
					                                         f32 %370 = OpExtInst %1 31 %369 
					                                                      OpStore %102 %370 
					                                         f32 %371 = OpLoad %360 
					                                         f32 %372 = OpExtInst %1 4 %371 
					                                         f32 %374 = OpFMul %372 %373 
					                                         f32 %376 = OpFAdd %374 %375 
					                                                      OpStore %118 %376 
					                                         f32 %377 = OpLoad %118 
					                                         f32 %378 = OpLoad %360 
					                                         f32 %379 = OpExtInst %1 4 %378 
					                                         f32 %380 = OpFMul %377 %379 
					                                         f32 %382 = OpFAdd %380 %381 
					                                                      OpStore %118 %382 
					                                         f32 %383 = OpLoad %118 
					                                         f32 %384 = OpLoad %360 
					                                         f32 %385 = OpExtInst %1 4 %384 
					                                         f32 %386 = OpFMul %383 %385 
					                                         f32 %388 = OpFAdd %386 %387 
					                                                      OpStore %118 %388 
					                                         f32 %389 = OpLoad %102 
					                                         f32 %390 = OpLoad %118 
					                                         f32 %391 = OpFMul %389 %390 
					                                                      OpStore %212 %391 
					                                         f32 %392 = OpLoad %212 
					                                         f32 %393 = OpFMul %392 %150 
					                                         f32 %395 = OpFAdd %393 %394 
					                                                      OpStore %212 %395 
					                                         f32 %397 = OpLoad %360 
					                                         f32 %398 = OpLoad %360 
					                                         f32 %399 = OpFNegate %398 
					                                        bool %400 = OpFOrdLessThan %397 %399 
					                                                      OpStore %396 %400 
					                                        bool %401 = OpLoad %396 
					                                         f32 %402 = OpLoad %212 
					                                         f32 %403 = OpSelect %401 %402 %156 
					                                                      OpStore %360 %403 
					                                         f32 %404 = OpLoad %118 
					                                         f32 %405 = OpLoad %102 
					                                         f32 %406 = OpFMul %404 %405 
					                                         f32 %407 = OpLoad %360 
					                                         f32 %408 = OpFAdd %406 %407 
					                                                      OpStore %360 %408 
					                                         f32 %409 = OpLoad %360 
					                                         f32 %410 = OpFNegate %409 
					                                         f32 %411 = OpFAdd %410 %152 
					                                                      OpStore %360 %411 
					                                         f32 %412 = OpLoad %360 
					                                         f32 %413 = OpFNegate %412 
					                                Private f32* %414 = OpAccessChain %97 %35 
					                                         f32 %415 = OpLoad %414 
					                                         f32 %416 = OpFAdd %413 %415 
					                                                      OpStore %360 %416 
					                                         f32 %417 = OpLoad %360 
					                                         f32 %418 = OpExtInst %1 13 %417 
					                                Private f32* %419 = OpAccessChain %97 %35 
					                                                      OpStore %419 %418 
					                                         f32 %421 = OpLoad %360 
					                                         f32 %422 = OpExtInst %1 14 %421 
					                                                      OpStore %420 %422 
					                                         f32 %423 = OpLoad %230 
					                                Private f32* %424 = OpAccessChain %97 %35 
					                                         f32 %425 = OpLoad %424 
					                                         f32 %426 = OpFMul %423 %425 
					                                                      OpStore %360 %426 
					                                         f32 %427 = OpLoad %360 
					                                         f32 %428 = OpLoad %420 
					                                         f32 %429 = OpFDiv %427 %428 
					                                                      OpStore %360 %429 
					                                         f32 %430 = OpLoad %360 
					                                         f32 %431 = OpFNegate %430 
					                                Private f32* %432 = OpAccessChain %79 %35 
					                                         f32 %433 = OpLoad %432 
					                                         f32 %434 = OpFAdd %431 %433 
					                                                      OpStore %360 %434 
					                                         f32 %435 = OpLoad %91 
					                                         f32 %436 = OpExtInst %1 13 %435 
					                                Private f32* %437 = OpAccessChain %79 %35 
					                                                      OpStore %437 %436 
					                                         f32 %438 = OpLoad %91 
					                                         f32 %439 = OpExtInst %1 14 %438 
					                                Private f32* %440 = OpAccessChain %97 %35 
					                                                      OpStore %440 %439 
					                                Private f32* %441 = OpAccessChain %97 %35 
					                                         f32 %442 = OpLoad %441 
					                                Private f32* %443 = OpAccessChain %79 %31 
					                                                      OpStore %443 %442 
					                                         f32 %444 = OpLoad %360 
					                                       f32_2 %445 = OpCompositeConstruct %444 %444 
					                                       f32_2 %446 = OpLoad %79 
					                                       f32_2 %447 = OpFMul %445 %446 
					                                                      OpStore %79 %447 
					                                Private f32* %448 = OpAccessChain %79 %35 
					                                         f32 %449 = OpLoad %448 
					                                Private f32* %450 = OpAccessChain %53 %35 
					                                         f32 %451 = OpLoad %450 
					                                         f32 %452 = OpFMul %449 %451 
					                                Private f32* %453 = OpAccessChain %65 %35 
					                                         f32 %454 = OpLoad %453 
					                                         f32 %455 = OpFAdd %452 %454 
					                                Private f32* %456 = OpAccessChain %97 %35 
					                                                      OpStore %456 %455 
					                                Private f32* %457 = OpAccessChain %79 %31 
					                                         f32 %458 = OpLoad %457 
					                                Private f32* %459 = OpAccessChain %53 %35 
					                                         f32 %460 = OpLoad %459 
					                                         f32 %461 = OpFMul %458 %460 
					                                Private f32* %462 = OpAccessChain %65 %31 
					                                         f32 %463 = OpLoad %462 
					                                         f32 %464 = OpFAdd %461 %463 
					                                Private f32* %465 = OpAccessChain %97 %31 
					                                                      OpStore %465 %464 
					                                         f32 %467 = OpLoad %85 
					                                Private f32* %468 = OpAccessChain %53 %35 
					                                         f32 %469 = OpLoad %468 
					                                        bool %470 = OpFOrdLessThan %467 %469 
					                                                      OpStore %466 %470 
					                                        bool %471 = OpLoad %466 
					                                         f32 %472 = OpSelect %471 %45 %156 
					                                                      OpStore %360 %472 
					                                        bool %473 = OpLoad %466 
					                                         f32 %474 = OpSelect %473 %156 %45 
					                                Private f32* %475 = OpAccessChain %53 %35 
					                                                      OpStore %475 %474 
					                                         f32 %476 = OpLoad %360 
					                                       f32_2 %477 = OpCompositeConstruct %476 %476 
					                                       f32_2 %478 = OpLoad %97 
					                                       f32_2 %479 = OpFMul %477 %478 
					                                                      OpStore %65 %479 
					                                       f32_2 %480 = OpLoad %9 
					                                       f32_2 %481 = OpLoad %53 
					                                       f32_2 %482 = OpVectorShuffle %481 %481 0 0 
					                                       f32_2 %483 = OpFMul %480 %482 
					                                       f32_2 %484 = OpLoad %65 
					                                       f32_2 %485 = OpFAdd %483 %484 
					                                                      OpStore %9 %485 
					                                       f32_2 %486 = OpLoad %9 
					                                       f32_2 %487 = OpFAdd %486 %43 
					                                                      OpStore %9 %487 
					                                       f32_2 %488 = OpLoad %9 
					                                       f32_2 %489 = OpLoad %28 
					                                       f32_2 %490 = OpFDiv %488 %489 
					                                                      OpStore %9 %490 
					                                       f32_2 %491 = OpLoad %9 
					                                       f32_2 %492 = OpFAdd %491 %51 
					                                                      OpStore %9 %492 
					                         read_only Texture2D %498 = OpLoad %497 
					                                     sampler %502 = OpLoad %501 
					                  read_only Texture2DSampled %504 = OpSampledImage %498 %502 
					                                       f32_2 %505 = OpLoad %9 
					                                       f32_4 %506 = OpImageSampleImplicitLod %504 %505 
					                                                      OpStore %494 %506 
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
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
						float _SphereSize;
						float _SpherePositionX;
						float _SpherePositionY;
						float _Strength;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					bool u_xlatb3;
					float u_xlat4;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat11;
					float u_xlat12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat17;
					bool u_xlatb17;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.y = _ScreenResolution.y / _ScreenResolution.x;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = 1.0;
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat10.xy = vec2(_SphereSize, _Strength) * vec2(0.100000001, 1.07500005);
					    u_xlat11.x = _SpherePositionX * 0.5 + 0.5;
					    u_xlat11.y = (-_SpherePositionY) * 0.5 + 0.5;
					    u_xlat2.xy = (-u_xlat11.xy);
					    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
					    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat17 = u_xlat2.x / u_xlat2.y;
					    u_xlat3.x = min(abs(u_xlat17), 1.0);
					    u_xlat8 = max(abs(u_xlat17), 1.0);
					    u_xlat8 = float(1.0) / u_xlat8;
					    u_xlat3.x = u_xlat8 * u_xlat3.x;
					    u_xlat8 = u_xlat3.x * u_xlat3.x;
					    u_xlat13 = u_xlat8 * 0.0208350997 + -0.0851330012;
					    u_xlat13 = u_xlat8 * u_xlat13 + 0.180141002;
					    u_xlat13 = u_xlat8 * u_xlat13 + -0.330299497;
					    u_xlat8 = u_xlat8 * u_xlat13 + 0.999866009;
					    u_xlat13 = u_xlat8 * u_xlat3.x;
					    u_xlatb18 = 1.0<abs(u_xlat17);
					    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
					    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
					    u_xlat3.x = u_xlat3.x * u_xlat8 + u_xlat13;
					    u_xlat17 = min(u_xlat17, 1.0);
					    u_xlatb17 = u_xlat17<(-u_xlat17);
					    u_xlat17 = (u_xlatb17) ? (-u_xlat3.x) : u_xlat3.x;
					    u_xlatb3 = 0.0>=u_xlat2.y;
					    if(u_xlatb3){
					        u_xlatb3 = u_xlat2.x>=0.0;
					        u_xlatb8 = u_xlat2.y<0.0;
					        u_xlatb3 = u_xlatb8 && u_xlatb3;
					        if(!u_xlatb3){
					            u_xlatb13 = u_xlat2.x<0.0;
					            u_xlatb8 = u_xlatb8 && u_xlatb13;
					            u_xlat18 = u_xlat17 + -3.1400001;
					            u_xlatb2 = 0.0<u_xlat2.x;
					            u_xlatb7 = u_xlat2.y==0.0;
					            u_xlatb2 = u_xlatb7 && u_xlatb2;
					            u_xlatb7 = u_xlatb7 && u_xlatb13;
					            u_xlat7 = (u_xlatb7) ? -1.57000005 : 1.57000005;
					            u_xlat2.x = (u_xlatb2) ? 1.57000005 : u_xlat7;
					            u_xlat17 = (u_xlatb8) ? u_xlat18 : u_xlat2.x;
					        } else {
					            u_xlat2.x = u_xlat17 + 3.1400001;
					            u_xlat17 = (u_xlatb3) ? u_xlat2.x : u_xlat17;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    u_xlat2.x = u_xlat12 / u_xlat10.x;
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = u_xlat2.x + -1.0;
					    u_xlat7 = (-u_xlat7) * u_xlat7 + 1.0;
					    u_xlat7 = sqrt(u_xlat7);
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat3.x = u_xlat2.x / u_xlat7;
					    u_xlat8 = min(u_xlat3.x, 1.0);
					    u_xlat13 = max(u_xlat3.x, 1.0);
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat8 = u_xlat13 * u_xlat8;
					    u_xlat13 = u_xlat8 * u_xlat8;
					    u_xlat18 = u_xlat13 * 0.0208350997 + -0.0851330012;
					    u_xlat18 = u_xlat13 * u_xlat18 + 0.180141002;
					    u_xlat18 = u_xlat13 * u_xlat18 + -0.330299497;
					    u_xlat13 = u_xlat13 * u_xlat18 + 0.999866009;
					    u_xlat18 = u_xlat13 * u_xlat8;
					    u_xlatb3 = 1.0<u_xlat3.x;
					    u_xlat18 = u_xlat18 * -2.0 + 1.57079637;
					    u_xlat3.x = u_xlatb3 ? u_xlat18 : float(0.0);
					    u_xlat3.x = u_xlat8 * u_xlat13 + u_xlat3.x;
					    u_xlatb8 = 0.0>=u_xlat7;
					    u_xlat3.x = (u_xlatb8) ? 1.57000005 : u_xlat3.x;
					    u_xlat8 = sin(u_xlat3.x);
					    u_xlat15 = u_xlat8 / u_xlat10.y;
					    u_xlat8 = -abs(u_xlat15) + 1.0;
					    u_xlat8 = sqrt(u_xlat8);
					    u_xlat13 = abs(u_xlat15) * -0.0187292993 + 0.0742610022;
					    u_xlat13 = u_xlat13 * abs(u_xlat15) + -0.212114394;
					    u_xlat13 = u_xlat13 * abs(u_xlat15) + 1.57072878;
					    u_xlat18 = u_xlat8 * u_xlat13;
					    u_xlat18 = u_xlat18 * -2.0 + 3.14159274;
					    u_xlatb15 = u_xlat15<(-u_xlat15);
					    u_xlat15 = u_xlatb15 ? u_xlat18 : float(0.0);
					    u_xlat15 = u_xlat13 * u_xlat8 + u_xlat15;
					    u_xlat15 = (-u_xlat15) + 1.57079637;
					    u_xlat15 = (-u_xlat15) + u_xlat3.x;
					    u_xlat3.x = sin(u_xlat15);
					    u_xlat4 = cos(u_xlat15);
					    u_xlat15 = u_xlat7 * u_xlat3.x;
					    u_xlat15 = u_xlat15 / u_xlat4;
					    u_xlat15 = (-u_xlat15) + u_xlat2.x;
					    u_xlat2.x = sin(u_xlat17);
					    u_xlat3.x = cos(u_xlat17);
					    u_xlat2.y = u_xlat3.x;
					    u_xlat2.xy = vec2(u_xlat15) * u_xlat2.xy;
					    u_xlat3.x = u_xlat2.x * u_xlat10.x + u_xlat11.x;
					    u_xlat3.y = u_xlat2.y * u_xlat10.x + u_xlat11.y;
					    u_xlatb10 = u_xlat12<u_xlat10.x;
					    u_xlat15 = u_xlatb10 ? 1.0 : float(0.0);
					    u_xlat10.x = (u_xlatb10) ? 0.0 : 1.0;
					    u_xlat11.xy = vec2(u_xlat15) * u_xlat3.xy;
					    u_xlat0.xy = u_xlat0.xy * u_xlat10.xx + u_xlat11.xy;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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