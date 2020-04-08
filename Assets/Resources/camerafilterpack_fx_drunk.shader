Shader "CameraFilterPack/FX_Drunk" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0, 20)) = 6
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 14545
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Speed;
					uniform 	float _Wavy;
					uniform 	float _Distortion;
					uniform 	float _DistortionWave;
					uniform 	float _Fade;
					uniform 	float _Colored;
					uniform 	float _ColoredChange;
					uniform 	float _ChangeRed;
					uniform 	float _ChangeGreen;
					uniform 	float _ChangeBlue;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					bvec4 u_xlatb3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec2 u_xlat6;
					vec2 u_xlat10;
					float u_xlat16_15;
					void main()
					{
					    u_xlat0.x = _TimeX * _Speed;
					    u_xlat1 = u_xlat0.xxxx * vec4(1.20000005, 1.79999995, 1.79999995, 1.20000005);
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlat0.yz = sin(u_xlat0.xx);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1 * vec4(-0.199999988, 0.199999988, 0.0750000179, -0.0750000179) + vec4(1.25, 0.850000024, 0.949999988, 1.10000002);
					    u_xlat0.x = float(0.0);
					    u_xlat0.w = float(0.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xxxx;
					    u_xlat1.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat0 = u_xlat0 + u_xlat1.yxyx;
					    u_xlatb3 = greaterThanEqual(u_xlat0, (-u_xlat0));
					    u_xlat0 = fract(abs(u_xlat0));
					    {
					        vec4 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat0.y : (-u_xlat0.y);
					        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat0.z : (-u_xlat0.z);
					        hlslcc_movcTemp.w = (u_xlatb3.w) ? u_xlat0.w : (-u_xlat0.w);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat1.yxyx) + u_xlat0;
					    u_xlat0 = vec4(vec4(_Wavy, _Wavy, _Wavy, _Wavy)) * u_xlat0 + u_xlat1.yxyx;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_2.x;
					    u_xlat5.x = _Distortion * _Fade;
					    u_xlat0.x = u_xlat5.x * u_xlat0.x;
					    u_xlat3.xy = u_xlat0.xx * vec2(0.5, 0.5) + u_xlat0.zw;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_15 = u_xlat10_2.x * u_xlat10_3.y;
					    u_xlat16_3 = (-u_xlat10_2) + u_xlat10_3;
					    u_xlat10.x = u_xlat0.z * u_xlat16_15;
					    u_xlat5.x = u_xlat5.x * u_xlat10.x;
					    u_xlat0.x = u_xlat5.x * 0.5 + u_xlat0.x;
					    u_xlat5.xy = u_xlat1.xy + vec2(_TimeX);
					    u_xlat10.xy = u_xlat5.yy * vec2(10.0, 30.0);
					    u_xlat4 = u_xlat5.xxxx * vec4(4.0, 8.0, 40.0, 5.0);
					    u_xlat4 = sin(u_xlat4);
					    u_xlat5.xy = sin(u_xlat10.xy);
					    u_xlat5.x = u_xlat5.x * 0.0100000007;
					    u_xlat5.x = u_xlat4.w * 0.0500000007 + u_xlat5.x;
					    u_xlat5.x = u_xlat5.y * 0.00400000019 + u_xlat5.x;
					    u_xlat10.x = _Fade * _DistortionWave;
					    u_xlat6.x = u_xlat10.x * u_xlat5.x + u_xlat1.y;
					    u_xlat5.xz = u_xlat4.xy * vec2(0.0265999995, 0.00300000003);
					    u_xlat5.x = u_xlat5.z + u_xlat5.x;
					    u_xlat5.x = u_xlat4.z * 0.00250000018 + u_xlat5.x;
					    u_xlat6.y = u_xlat10.x * u_xlat5.x + u_xlat1.x;
					    u_xlat0.xy = u_xlat0.xx + u_xlat6.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.x = _Colored + -0.200000003;
					    u_xlat1.x = u_xlat1.w * 0.200000003 + u_xlat1.x;
					    u_xlat2 = u_xlat1.xxxx * u_xlat16_3 + u_xlat10_2;
					    u_xlat3 = u_xlat10_0 + (-u_xlat2);
					    u_xlat2 = u_xlat3 * vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024) + u_xlat2;
					    u_xlat1.xw = u_xlat2.yz + (-vec2(vec2(_ColoredChange, _ColoredChange)));
					    u_xlat6.xy = (-u_xlat1.xw) + u_xlat6.xy;
					    u_xlat2.yz = u_xlat6.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xw;
					    u_xlat1 = (-u_xlat10_0) + u_xlat2;
					    u_xlat0 = vec4(vec4(_Fade, _Fade, _Fade, _Fade)) * u_xlat1 + u_xlat10_0;
					    SV_Target0.xyz = u_xlat0.xyz + vec3(_ChangeRed, _ChangeGreen, _ChangeBlue);
					    SV_Target0.w = u_xlat0.w;
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
					; Bound: 502
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %77 %481 
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
					                                                      OpMemberDecorate %10 12 RelaxedPrecision 
					                                                      OpMemberDecorate %10 12 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 77 
					                                                      OpDecorate %82 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %201 DescriptorSet 201 
					                                                      OpDecorate %201 Binding 201 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %205 DescriptorSet 205 
					                                                      OpDecorate %205 Binding 205 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %252 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %392 RelaxedPrecision 
					                                                      OpDecorate %393 RelaxedPrecision 
					                                                      OpDecorate %394 RelaxedPrecision 
					                                                      OpDecorate %415 RelaxedPrecision 
					                                                      OpDecorate %417 RelaxedPrecision 
					                                                      OpDecorate %419 RelaxedPrecision 
					                                                      OpDecorate %458 RelaxedPrecision 
					                                                      OpDecorate %459 RelaxedPrecision 
					                                                      OpDecorate %478 RelaxedPrecision 
					                                                      OpDecorate %481 Location 481 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %6 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 0 
					                                              %15 = OpTypePointer Uniform %6 
					                                          i32 %18 = OpConstant 2 
					                                              %22 = OpTypeInt 32 0 
					                                          u32 %23 = OpConstant 0 
					                                              %24 = OpTypePointer Private %6 
					                               Private f32_4* %26 = OpVariable Private 
					                                          f32 %29 = OpConstant 3,674022E-40 
					                                          f32 %30 = OpConstant 3,674022E-40 
					                                        f32_4 %31 = OpConstantComposite %29 %30 %30 %29 
					                                              %39 = OpTypeVector %6 2 
					                                          f32 %48 = OpConstant 3,674022E-40 
					                                        f32_4 %49 = OpConstantComposite %48 %48 %48 %48 
					                               Private f32_4* %51 = OpVariable Private 
					                                          f32 %53 = OpConstant 3,674022E-40 
					                                          f32 %54 = OpConstant 3,674022E-40 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                          f32 %56 = OpConstant 3,674022E-40 
					                                        f32_4 %57 = OpConstantComposite %53 %54 %55 %56 
					                                          f32 %59 = OpConstant 3,674022E-40 
					                                          f32 %60 = OpConstant 3,674022E-40 
					                                          f32 %61 = OpConstant 3,674022E-40 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                        f32_4 %63 = OpConstantComposite %59 %60 %61 %62 
					                                          f32 %65 = OpConstant 3,674022E-40 
					                                          u32 %67 = OpConstant 3 
					                                          i32 %70 = OpConstant 1 
					                                              %71 = OpTypePointer Uniform %7 
					                                              %76 = OpTypePointer Input %39 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %80 = OpConstant 12 
					                                              %95 = OpTypeBool 
					                                              %96 = OpTypeVector %95 4 
					                                              %97 = OpTypePointer Private %96 
					                              Private bool_4* %98 = OpVariable Private 
					                                             %106 = OpTypePointer Function %7 
					                                             %109 = OpTypePointer Private %95 
					                                             %112 = OpTypePointer Function %6 
					                                         u32 %124 = OpConstant 1 
					                                         u32 %138 = OpConstant 2 
					                                         i32 %178 = OpConstant 3 
					                              Private f32_4* %198 = OpVariable Private 
					                                             %199 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %200 = OpTypePointer UniformConstant %199 
					        UniformConstant read_only Texture2D* %201 = OpVariable UniformConstant 
					                                             %203 = OpTypeSampler 
					                                             %204 = OpTypePointer UniformConstant %203 
					                    UniformConstant sampler* %205 = OpVariable UniformConstant 
					                                             %207 = OpTypeSampledImage %199 
					                                             %218 = OpTypeVector %6 3 
					                                             %219 = OpTypePointer Private %218 
					                              Private f32_3* %220 = OpVariable Private 
					                                         i32 %221 = OpConstant 4 
					                                         i32 %224 = OpConstant 6 
					                              Private f32_4* %235 = OpVariable Private 
					                                         f32 %238 = OpConstant 3,674022E-40 
					                                       f32_2 %239 = OpConstantComposite %238 %238 
					                              Private f32_4* %250 = OpVariable Private 
					                                Private f32* %257 = OpVariable Private 
					                              Private f32_4* %263 = OpVariable Private 
					                                             %268 = OpTypePointer Private %39 
					                              Private f32_2* %269 = OpVariable Private 
					                                         f32 %298 = OpConstant 3,674022E-40 
					                                         f32 %299 = OpConstant 3,674022E-40 
					                                       f32_2 %300 = OpConstantComposite %298 %299 
					                              Private f32_4* %302 = OpVariable Private 
					                                         f32 %305 = OpConstant 3,674022E-40 
					                                         f32 %306 = OpConstant 3,674022E-40 
					                                         f32 %307 = OpConstant 3,674022E-40 
					                                         f32 %308 = OpConstant 3,674022E-40 
					                                       f32_4 %309 = OpConstantComposite %305 %306 %307 %308 
					                                         f32 %319 = OpConstant 3,674022E-40 
					                                         f32 %324 = OpConstant 3,674022E-40 
					                                         f32 %332 = OpConstant 3,674022E-40 
					                                         i32 %340 = OpConstant 5 
					                              Private f32_2* %345 = OpVariable Private 
					                                         f32 %357 = OpConstant 3,674022E-40 
					                                         f32 %358 = OpConstant 3,674022E-40 
					                                       f32_2 %359 = OpConstantComposite %357 %358 
					                                         f32 %371 = OpConstant 3,674022E-40 
					                              Private f32_4* %392 = OpVariable Private 
					                                         i32 %399 = OpConstant 7 
					                                         f32 %402 = OpConstant 3,674022E-40 
					                                         f32 %407 = OpConstant 3,674022E-40 
					                                         f32 %424 = OpConstant 3,674022E-40 
					                                       f32_4 %425 = OpConstantComposite %424 %424 %424 %424 
					                                         i32 %431 = OpConstant 8 
					                                         f32 %450 = OpConstant 3,674022E-40 
					                                       f32_2 %451 = OpConstantComposite %450 %450 
					                                             %480 = OpTypePointer Output %7 
					                               Output f32_4* %481 = OpVariable Output 
					                                         i32 %484 = OpConstant 9 
					                                         i32 %487 = OpConstant 10 
					                                         i32 %490 = OpConstant 11 
					                                             %499 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                             Function f32_4* %107 = OpVariable Function 
					                               Function f32* %113 = OpVariable Function 
					                               Function f32* %127 = OpVariable Function 
					                               Function f32* %141 = OpVariable Function 
					                               Function f32* %154 = OpVariable Function 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                 Uniform f32* %19 = OpAccessChain %12 %18 
					                                          f32 %20 = OpLoad %19 
					                                          f32 %21 = OpFMul %17 %20 
					                                 Private f32* %25 = OpAccessChain %9 %23 
					                                                      OpStore %25 %21 
					                                        f32_4 %27 = OpLoad %9 
					                                        f32_4 %28 = OpVectorShuffle %27 %27 0 0 0 0 
					                                        f32_4 %32 = OpFMul %28 %31 
					                                                      OpStore %26 %32 
					                                 Private f32* %33 = OpAccessChain %9 %23 
					                                          f32 %34 = OpLoad %33 
					                                 Private f32* %35 = OpAccessChain %9 %23 
					                                          f32 %36 = OpLoad %35 
					                                          f32 %37 = OpFAdd %34 %36 
					                                 Private f32* %38 = OpAccessChain %9 %23 
					                                                      OpStore %38 %37 
					                                        f32_4 %40 = OpLoad %9 
					                                        f32_2 %41 = OpVectorShuffle %40 %40 0 0 
					                                        f32_2 %42 = OpExtInst %1 13 %41 
					                                        f32_4 %43 = OpLoad %9 
					                                        f32_4 %44 = OpVectorShuffle %43 %42 0 4 5 3 
					                                                      OpStore %9 %44 
					                                        f32_4 %45 = OpLoad %26 
					                                        f32_4 %46 = OpExtInst %1 13 %45 
					                                                      OpStore %26 %46 
					                                        f32_4 %47 = OpLoad %26 
					                                        f32_4 %50 = OpFAdd %47 %49 
					                                                      OpStore %26 %50 
					                                        f32_4 %52 = OpLoad %26 
					                                        f32_4 %58 = OpFMul %52 %57 
					                                        f32_4 %64 = OpFAdd %58 %63 
					                                                      OpStore %51 %64 
					                                 Private f32* %66 = OpAccessChain %9 %23 
					                                                      OpStore %66 %65 
					                                 Private f32* %68 = OpAccessChain %9 %67 
					                                                      OpStore %68 %65 
					                                        f32_4 %69 = OpLoad %9 
					                               Uniform f32_4* %72 = OpAccessChain %12 %70 
					                                        f32_4 %73 = OpLoad %72 
					                                        f32_4 %74 = OpVectorShuffle %73 %73 0 0 0 0 
					                                        f32_4 %75 = OpFDiv %69 %74 
					                                                      OpStore %9 %75 
					                                        f32_2 %78 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %79 = OpVectorShuffle %78 %78 1 0 
					                               Uniform f32_4* %81 = OpAccessChain %12 %80 
					                                        f32_4 %82 = OpLoad %81 
					                                        f32_2 %83 = OpVectorShuffle %82 %82 1 0 
					                                        f32_2 %84 = OpFMul %79 %83 
					                               Uniform f32_4* %85 = OpAccessChain %12 %80 
					                                        f32_4 %86 = OpLoad %85 
					                                        f32_2 %87 = OpVectorShuffle %86 %86 3 2 
					                                        f32_2 %88 = OpFAdd %84 %87 
					                                        f32_4 %89 = OpLoad %26 
					                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
					                                                      OpStore %26 %90 
					                                        f32_4 %91 = OpLoad %9 
					                                        f32_4 %92 = OpLoad %26 
					                                        f32_4 %93 = OpVectorShuffle %92 %92 1 0 1 0 
					                                        f32_4 %94 = OpFAdd %91 %93 
					                                                      OpStore %9 %94 
					                                        f32_4 %99 = OpLoad %9 
					                                       f32_4 %100 = OpLoad %9 
					                                       f32_4 %101 = OpFNegate %100 
					                                      bool_4 %102 = OpFOrdGreaterThanEqual %99 %101 
					                                                      OpStore %98 %102 
					                                       f32_4 %103 = OpLoad %9 
					                                       f32_4 %104 = OpExtInst %1 4 %103 
					                                       f32_4 %105 = OpExtInst %1 10 %104 
					                                                      OpStore %9 %105 
					                                       f32_4 %108 = OpLoad %9 
					                                                      OpStore %107 %108 
					                               Private bool* %110 = OpAccessChain %98 %23 
					                                        bool %111 = OpLoad %110 
					                                                      OpSelectionMerge %115 None 
					                                                      OpBranchConditional %111 %114 %118 
					                                             %114 = OpLabel 
					                                Private f32* %116 = OpAccessChain %9 %23 
					                                         f32 %117 = OpLoad %116 
					                                                      OpStore %113 %117 
					                                                      OpBranch %115 
					                                             %118 = OpLabel 
					                                Private f32* %119 = OpAccessChain %9 %23 
					                                         f32 %120 = OpLoad %119 
					                                         f32 %121 = OpFNegate %120 
					                                                      OpStore %113 %121 
					                                                      OpBranch %115 
					                                             %115 = OpLabel 
					                                         f32 %122 = OpLoad %113 
					                               Function f32* %123 = OpAccessChain %107 %23 
					                                                      OpStore %123 %122 
					                               Private bool* %125 = OpAccessChain %98 %124 
					                                        bool %126 = OpLoad %125 
					                                                      OpSelectionMerge %129 None 
					                                                      OpBranchConditional %126 %128 %132 
					                                             %128 = OpLabel 
					                                Private f32* %130 = OpAccessChain %9 %124 
					                                         f32 %131 = OpLoad %130 
					                                                      OpStore %127 %131 
					                                                      OpBranch %129 
					                                             %132 = OpLabel 
					                                Private f32* %133 = OpAccessChain %9 %124 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpFNegate %134 
					                                                      OpStore %127 %135 
					                                                      OpBranch %129 
					                                             %129 = OpLabel 
					                                         f32 %136 = OpLoad %127 
					                               Function f32* %137 = OpAccessChain %107 %124 
					                                                      OpStore %137 %136 
					                               Private bool* %139 = OpAccessChain %98 %138 
					                                        bool %140 = OpLoad %139 
					                                                      OpSelectionMerge %143 None 
					                                                      OpBranchConditional %140 %142 %146 
					                                             %142 = OpLabel 
					                                Private f32* %144 = OpAccessChain %9 %138 
					                                         f32 %145 = OpLoad %144 
					                                                      OpStore %141 %145 
					                                                      OpBranch %143 
					                                             %146 = OpLabel 
					                                Private f32* %147 = OpAccessChain %9 %138 
					                                         f32 %148 = OpLoad %147 
					                                         f32 %149 = OpFNegate %148 
					                                                      OpStore %141 %149 
					                                                      OpBranch %143 
					                                             %143 = OpLabel 
					                                         f32 %150 = OpLoad %141 
					                               Function f32* %151 = OpAccessChain %107 %138 
					                                                      OpStore %151 %150 
					                               Private bool* %152 = OpAccessChain %98 %67 
					                                        bool %153 = OpLoad %152 
					                                                      OpSelectionMerge %156 None 
					                                                      OpBranchConditional %153 %155 %159 
					                                             %155 = OpLabel 
					                                Private f32* %157 = OpAccessChain %9 %67 
					                                         f32 %158 = OpLoad %157 
					                                                      OpStore %154 %158 
					                                                      OpBranch %156 
					                                             %159 = OpLabel 
					                                Private f32* %160 = OpAccessChain %9 %67 
					                                         f32 %161 = OpLoad %160 
					                                         f32 %162 = OpFNegate %161 
					                                                      OpStore %154 %162 
					                                                      OpBranch %156 
					                                             %156 = OpLabel 
					                                         f32 %163 = OpLoad %154 
					                               Function f32* %164 = OpAccessChain %107 %67 
					                                                      OpStore %164 %163 
					                                       f32_4 %165 = OpLoad %107 
					                                                      OpStore %9 %165 
					                                       f32_4 %166 = OpLoad %9 
					                                       f32_4 %167 = OpExtInst %1 30 %166 
					                                                      OpStore %9 %167 
					                                       f32_4 %168 = OpLoad %9 
					                                       f32_4 %169 = OpLoad %51 
					                                       f32_4 %170 = OpFMul %168 %169 
					                                                      OpStore %9 %170 
					                                       f32_4 %171 = OpLoad %9 
					                                       f32_4 %172 = OpExtInst %1 29 %171 
					                                                      OpStore %9 %172 
					                                       f32_4 %173 = OpLoad %26 
					                                       f32_4 %174 = OpVectorShuffle %173 %173 1 0 1 0 
					                                       f32_4 %175 = OpFNegate %174 
					                                       f32_4 %176 = OpLoad %9 
					                                       f32_4 %177 = OpFAdd %175 %176 
					                                                      OpStore %9 %177 
					                                Uniform f32* %179 = OpAccessChain %12 %178 
					                                         f32 %180 = OpLoad %179 
					                                Uniform f32* %181 = OpAccessChain %12 %178 
					                                         f32 %182 = OpLoad %181 
					                                Uniform f32* %183 = OpAccessChain %12 %178 
					                                         f32 %184 = OpLoad %183 
					                                Uniform f32* %185 = OpAccessChain %12 %178 
					                                         f32 %186 = OpLoad %185 
					                                       f32_4 %187 = OpCompositeConstruct %180 %182 %184 %186 
					                                         f32 %188 = OpCompositeExtract %187 0 
					                                         f32 %189 = OpCompositeExtract %187 1 
					                                         f32 %190 = OpCompositeExtract %187 2 
					                                         f32 %191 = OpCompositeExtract %187 3 
					                                       f32_4 %192 = OpCompositeConstruct %188 %189 %190 %191 
					                                       f32_4 %193 = OpLoad %9 
					                                       f32_4 %194 = OpFMul %192 %193 
					                                       f32_4 %195 = OpLoad %26 
					                                       f32_4 %196 = OpVectorShuffle %195 %195 1 0 1 0 
					                                       f32_4 %197 = OpFAdd %194 %196 
					                                                      OpStore %9 %197 
					                         read_only Texture2D %202 = OpLoad %201 
					                                     sampler %206 = OpLoad %205 
					                  read_only Texture2DSampled %208 = OpSampledImage %202 %206 
					                                       f32_4 %209 = OpLoad %9 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
					                                       f32_4 %211 = OpImageSampleImplicitLod %208 %210 
					                                                      OpStore %198 %211 
					                                Private f32* %212 = OpAccessChain %9 %23 
					                                         f32 %213 = OpLoad %212 
					                                Private f32* %214 = OpAccessChain %198 %23 
					                                         f32 %215 = OpLoad %214 
					                                         f32 %216 = OpFMul %213 %215 
					                                Private f32* %217 = OpAccessChain %9 %23 
					                                                      OpStore %217 %216 
					                                Uniform f32* %222 = OpAccessChain %12 %221 
					                                         f32 %223 = OpLoad %222 
					                                Uniform f32* %225 = OpAccessChain %12 %224 
					                                         f32 %226 = OpLoad %225 
					                                         f32 %227 = OpFMul %223 %226 
					                                Private f32* %228 = OpAccessChain %220 %23 
					                                                      OpStore %228 %227 
					                                Private f32* %229 = OpAccessChain %220 %23 
					                                         f32 %230 = OpLoad %229 
					                                Private f32* %231 = OpAccessChain %9 %23 
					                                         f32 %232 = OpLoad %231 
					                                         f32 %233 = OpFMul %230 %232 
					                                Private f32* %234 = OpAccessChain %9 %23 
					                                                      OpStore %234 %233 
					                                       f32_4 %236 = OpLoad %9 
					                                       f32_2 %237 = OpVectorShuffle %236 %236 0 0 
					                                       f32_2 %240 = OpFMul %237 %239 
					                                       f32_4 %241 = OpLoad %9 
					                                       f32_2 %242 = OpVectorShuffle %241 %241 2 3 
					                                       f32_2 %243 = OpFAdd %240 %242 
					                                       f32_4 %244 = OpLoad %235 
					                                       f32_4 %245 = OpVectorShuffle %244 %243 4 5 2 3 
					                                                      OpStore %235 %245 
					                                Private f32* %246 = OpAccessChain %9 %23 
					                                         f32 %247 = OpLoad %246 
					                                         f32 %248 = OpFMul %247 %238 
					                                Private f32* %249 = OpAccessChain %9 %23 
					                                                      OpStore %249 %248 
					                         read_only Texture2D %251 = OpLoad %201 
					                                     sampler %252 = OpLoad %205 
					                  read_only Texture2DSampled %253 = OpSampledImage %251 %252 
					                                       f32_4 %254 = OpLoad %235 
					                                       f32_2 %255 = OpVectorShuffle %254 %254 0 1 
					                                       f32_4 %256 = OpImageSampleImplicitLod %253 %255 
					                                                      OpStore %250 %256 
					                                Private f32* %258 = OpAccessChain %198 %23 
					                                         f32 %259 = OpLoad %258 
					                                Private f32* %260 = OpAccessChain %250 %124 
					                                         f32 %261 = OpLoad %260 
					                                         f32 %262 = OpFMul %259 %261 
					                                                      OpStore %257 %262 
					                                       f32_4 %264 = OpLoad %198 
					                                       f32_4 %265 = OpFNegate %264 
					                                       f32_4 %266 = OpLoad %250 
					                                       f32_4 %267 = OpFAdd %265 %266 
					                                                      OpStore %263 %267 
					                                Private f32* %270 = OpAccessChain %9 %138 
					                                         f32 %271 = OpLoad %270 
					                                         f32 %272 = OpLoad %257 
					                                         f32 %273 = OpFMul %271 %272 
					                                Private f32* %274 = OpAccessChain %269 %23 
					                                                      OpStore %274 %273 
					                                Private f32* %275 = OpAccessChain %220 %23 
					                                         f32 %276 = OpLoad %275 
					                                Private f32* %277 = OpAccessChain %269 %23 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFMul %276 %278 
					                                Private f32* %280 = OpAccessChain %220 %23 
					                                                      OpStore %280 %279 
					                                Private f32* %281 = OpAccessChain %220 %23 
					                                         f32 %282 = OpLoad %281 
					                                         f32 %283 = OpFMul %282 %238 
					                                Private f32* %284 = OpAccessChain %9 %23 
					                                         f32 %285 = OpLoad %284 
					                                         f32 %286 = OpFAdd %283 %285 
					                                Private f32* %287 = OpAccessChain %9 %23 
					                                                      OpStore %287 %286 
					                                       f32_4 %288 = OpLoad %26 
					                                       f32_2 %289 = OpVectorShuffle %288 %288 0 1 
					                                Uniform f32* %290 = OpAccessChain %12 %14 
					                                         f32 %291 = OpLoad %290 
					                                       f32_2 %292 = OpCompositeConstruct %291 %291 
					                                       f32_2 %293 = OpFAdd %289 %292 
					                                       f32_3 %294 = OpLoad %220 
					                                       f32_3 %295 = OpVectorShuffle %294 %293 3 4 2 
					                                                      OpStore %220 %295 
					                                       f32_3 %296 = OpLoad %220 
					                                       f32_2 %297 = OpVectorShuffle %296 %296 1 1 
					                                       f32_2 %301 = OpFMul %297 %300 
					                                                      OpStore %269 %301 
					                                       f32_3 %303 = OpLoad %220 
					                                       f32_4 %304 = OpVectorShuffle %303 %303 0 0 0 0 
					                                       f32_4 %310 = OpFMul %304 %309 
					                                                      OpStore %302 %310 
					                                       f32_4 %311 = OpLoad %302 
					                                       f32_4 %312 = OpExtInst %1 13 %311 
					                                                      OpStore %302 %312 
					                                       f32_2 %313 = OpLoad %269 
					                                       f32_2 %314 = OpExtInst %1 13 %313 
					                                       f32_3 %315 = OpLoad %220 
					                                       f32_3 %316 = OpVectorShuffle %315 %314 3 4 2 
					                                                      OpStore %220 %316 
					                                Private f32* %317 = OpAccessChain %220 %23 
					                                         f32 %318 = OpLoad %317 
					                                         f32 %320 = OpFMul %318 %319 
					                                Private f32* %321 = OpAccessChain %220 %23 
					                                                      OpStore %321 %320 
					                                Private f32* %322 = OpAccessChain %302 %67 
					                                         f32 %323 = OpLoad %322 
					                                         f32 %325 = OpFMul %323 %324 
					                                Private f32* %326 = OpAccessChain %220 %23 
					                                         f32 %327 = OpLoad %326 
					                                         f32 %328 = OpFAdd %325 %327 
					                                Private f32* %329 = OpAccessChain %220 %23 
					                                                      OpStore %329 %328 
					                                Private f32* %330 = OpAccessChain %220 %124 
					                                         f32 %331 = OpLoad %330 
					                                         f32 %333 = OpFMul %331 %332 
					                                Private f32* %334 = OpAccessChain %220 %23 
					                                         f32 %335 = OpLoad %334 
					                                         f32 %336 = OpFAdd %333 %335 
					                                Private f32* %337 = OpAccessChain %220 %23 
					                                                      OpStore %337 %336 
					                                Uniform f32* %338 = OpAccessChain %12 %224 
					                                         f32 %339 = OpLoad %338 
					                                Uniform f32* %341 = OpAccessChain %12 %340 
					                                         f32 %342 = OpLoad %341 
					                                         f32 %343 = OpFMul %339 %342 
					                                Private f32* %344 = OpAccessChain %269 %23 
					                                                      OpStore %344 %343 
					                                Private f32* %346 = OpAccessChain %269 %23 
					                                         f32 %347 = OpLoad %346 
					                                Private f32* %348 = OpAccessChain %220 %23 
					                                         f32 %349 = OpLoad %348 
					                                         f32 %350 = OpFMul %347 %349 
					                                Private f32* %351 = OpAccessChain %26 %124 
					                                         f32 %352 = OpLoad %351 
					                                         f32 %353 = OpFAdd %350 %352 
					                                Private f32* %354 = OpAccessChain %345 %23 
					                                                      OpStore %354 %353 
					                                       f32_4 %355 = OpLoad %302 
					                                       f32_2 %356 = OpVectorShuffle %355 %355 0 1 
					                                       f32_2 %360 = OpFMul %356 %359 
					                                       f32_3 %361 = OpLoad %220 
					                                       f32_3 %362 = OpVectorShuffle %361 %360 3 1 4 
					                                                      OpStore %220 %362 
					                                Private f32* %363 = OpAccessChain %220 %138 
					                                         f32 %364 = OpLoad %363 
					                                Private f32* %365 = OpAccessChain %220 %23 
					                                         f32 %366 = OpLoad %365 
					                                         f32 %367 = OpFAdd %364 %366 
					                                Private f32* %368 = OpAccessChain %220 %23 
					                                                      OpStore %368 %367 
					                                Private f32* %369 = OpAccessChain %302 %138 
					                                         f32 %370 = OpLoad %369 
					                                         f32 %372 = OpFMul %370 %371 
					                                Private f32* %373 = OpAccessChain %220 %23 
					                                         f32 %374 = OpLoad %373 
					                                         f32 %375 = OpFAdd %372 %374 
					                                Private f32* %376 = OpAccessChain %220 %23 
					                                                      OpStore %376 %375 
					                                Private f32* %377 = OpAccessChain %269 %23 
					                                         f32 %378 = OpLoad %377 
					                                Private f32* %379 = OpAccessChain %220 %23 
					                                         f32 %380 = OpLoad %379 
					                                         f32 %381 = OpFMul %378 %380 
					                                Private f32* %382 = OpAccessChain %26 %23 
					                                         f32 %383 = OpLoad %382 
					                                         f32 %384 = OpFAdd %381 %383 
					                                Private f32* %385 = OpAccessChain %345 %124 
					                                                      OpStore %385 %384 
					                                       f32_4 %386 = OpLoad %9 
					                                       f32_2 %387 = OpVectorShuffle %386 %386 0 0 
					                                       f32_2 %388 = OpLoad %345 
					                                       f32_2 %389 = OpFAdd %387 %388 
					                                       f32_4 %390 = OpLoad %9 
					                                       f32_4 %391 = OpVectorShuffle %390 %389 4 5 2 3 
					                                                      OpStore %9 %391 
					                         read_only Texture2D %393 = OpLoad %201 
					                                     sampler %394 = OpLoad %205 
					                  read_only Texture2DSampled %395 = OpSampledImage %393 %394 
					                                       f32_4 %396 = OpLoad %9 
					                                       f32_2 %397 = OpVectorShuffle %396 %396 0 1 
					                                       f32_4 %398 = OpImageSampleImplicitLod %395 %397 
					                                                      OpStore %392 %398 
					                                Uniform f32* %400 = OpAccessChain %12 %399 
					                                         f32 %401 = OpLoad %400 
					                                         f32 %403 = OpFAdd %401 %402 
					                                Private f32* %404 = OpAccessChain %26 %23 
					                                                      OpStore %404 %403 
					                                Private f32* %405 = OpAccessChain %26 %67 
					                                         f32 %406 = OpLoad %405 
					                                         f32 %408 = OpFMul %406 %407 
					                                Private f32* %409 = OpAccessChain %26 %23 
					                                         f32 %410 = OpLoad %409 
					                                         f32 %411 = OpFAdd %408 %410 
					                                Private f32* %412 = OpAccessChain %26 %23 
					                                                      OpStore %412 %411 
					                                       f32_4 %413 = OpLoad %26 
					                                       f32_4 %414 = OpVectorShuffle %413 %413 0 0 0 0 
					                                       f32_4 %415 = OpLoad %263 
					                                       f32_4 %416 = OpFMul %414 %415 
					                                       f32_4 %417 = OpLoad %198 
					                                       f32_4 %418 = OpFAdd %416 %417 
					                                                      OpStore %51 %418 
					                                       f32_4 %419 = OpLoad %392 
					                                       f32_4 %420 = OpLoad %51 
					                                       f32_4 %421 = OpFNegate %420 
					                                       f32_4 %422 = OpFAdd %419 %421 
					                                                      OpStore %235 %422 
					                                       f32_4 %423 = OpLoad %235 
					                                       f32_4 %426 = OpFMul %423 %425 
					                                       f32_4 %427 = OpLoad %51 
					                                       f32_4 %428 = OpFAdd %426 %427 
					                                                      OpStore %51 %428 
					                                       f32_4 %429 = OpLoad %51 
					                                       f32_2 %430 = OpVectorShuffle %429 %429 1 2 
					                                Uniform f32* %432 = OpAccessChain %12 %431 
					                                         f32 %433 = OpLoad %432 
					                                Uniform f32* %434 = OpAccessChain %12 %431 
					                                         f32 %435 = OpLoad %434 
					                                       f32_2 %436 = OpCompositeConstruct %433 %435 
					                                         f32 %437 = OpCompositeExtract %436 0 
					                                         f32 %438 = OpCompositeExtract %436 1 
					                                       f32_2 %439 = OpCompositeConstruct %437 %438 
					                                       f32_2 %440 = OpFNegate %439 
					                                       f32_2 %441 = OpFAdd %430 %440 
					                                       f32_4 %442 = OpLoad %26 
					                                       f32_4 %443 = OpVectorShuffle %442 %441 4 1 2 5 
					                                                      OpStore %26 %443 
					                                       f32_4 %444 = OpLoad %26 
					                                       f32_2 %445 = OpVectorShuffle %444 %444 0 3 
					                                       f32_2 %446 = OpFNegate %445 
					                                       f32_2 %447 = OpLoad %345 
					                                       f32_2 %448 = OpFAdd %446 %447 
					                                                      OpStore %345 %448 
					                                       f32_2 %449 = OpLoad %345 
					                                       f32_2 %452 = OpFMul %449 %451 
					                                       f32_4 %453 = OpLoad %26 
					                                       f32_2 %454 = OpVectorShuffle %453 %453 0 3 
					                                       f32_2 %455 = OpFAdd %452 %454 
					                                       f32_4 %456 = OpLoad %51 
					                                       f32_4 %457 = OpVectorShuffle %456 %455 0 4 5 3 
					                                                      OpStore %51 %457 
					                                       f32_4 %458 = OpLoad %392 
					                                       f32_4 %459 = OpFNegate %458 
					                                       f32_4 %460 = OpLoad %51 
					                                       f32_4 %461 = OpFAdd %459 %460 
					                                                      OpStore %26 %461 
					                                Uniform f32* %462 = OpAccessChain %12 %224 
					                                         f32 %463 = OpLoad %462 
					                                Uniform f32* %464 = OpAccessChain %12 %224 
					                                         f32 %465 = OpLoad %464 
					                                Uniform f32* %466 = OpAccessChain %12 %224 
					                                         f32 %467 = OpLoad %466 
					                                Uniform f32* %468 = OpAccessChain %12 %224 
					                                         f32 %469 = OpLoad %468 
					                                       f32_4 %470 = OpCompositeConstruct %463 %465 %467 %469 
					                                         f32 %471 = OpCompositeExtract %470 0 
					                                         f32 %472 = OpCompositeExtract %470 1 
					                                         f32 %473 = OpCompositeExtract %470 2 
					                                         f32 %474 = OpCompositeExtract %470 3 
					                                       f32_4 %475 = OpCompositeConstruct %471 %472 %473 %474 
					                                       f32_4 %476 = OpLoad %26 
					                                       f32_4 %477 = OpFMul %475 %476 
					                                       f32_4 %478 = OpLoad %392 
					                                       f32_4 %479 = OpFAdd %477 %478 
					                                                      OpStore %9 %479 
					                                       f32_4 %482 = OpLoad %9 
					                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
					                                Uniform f32* %485 = OpAccessChain %12 %484 
					                                         f32 %486 = OpLoad %485 
					                                Uniform f32* %488 = OpAccessChain %12 %487 
					                                         f32 %489 = OpLoad %488 
					                                Uniform f32* %491 = OpAccessChain %12 %490 
					                                         f32 %492 = OpLoad %491 
					                                       f32_3 %493 = OpCompositeConstruct %486 %489 %492 
					                                       f32_3 %494 = OpFAdd %483 %493 
					                                       f32_4 %495 = OpLoad %481 
					                                       f32_4 %496 = OpVectorShuffle %495 %494 4 5 6 3 
					                                                      OpStore %481 %496 
					                                Private f32* %497 = OpAccessChain %9 %67 
					                                         f32 %498 = OpLoad %497 
					                                 Output f32* %500 = OpAccessChain %481 %67 
					                                                      OpStore %500 %498 
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
						vec4 _ScreenResolution;
						float _Speed;
						float _Wavy;
						float _Distortion;
						float _DistortionWave;
						float _Fade;
						float _Colored;
						float _ColoredChange;
						float _ChangeRed;
						float _ChangeGreen;
						float _ChangeBlue;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					bvec4 u_xlatb3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec2 u_xlat6;
					vec2 u_xlat10;
					float u_xlat16_15;
					void main()
					{
					    u_xlat0.x = _TimeX * _Speed;
					    u_xlat1 = u_xlat0.xxxx * vec4(1.20000005, 1.79999995, 1.79999995, 1.20000005);
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlat0.yz = sin(u_xlat0.xx);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1 * vec4(-0.199999988, 0.199999988, 0.0750000179, -0.0750000179) + vec4(1.25, 0.850000024, 0.949999988, 1.10000002);
					    u_xlat0.x = float(0.0);
					    u_xlat0.w = float(0.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xxxx;
					    u_xlat1.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat0 = u_xlat0 + u_xlat1.yxyx;
					    u_xlatb3 = greaterThanEqual(u_xlat0, (-u_xlat0));
					    u_xlat0 = fract(abs(u_xlat0));
					    {
					        vec4 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat0.y : (-u_xlat0.y);
					        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat0.z : (-u_xlat0.z);
					        hlslcc_movcTemp.w = (u_xlatb3.w) ? u_xlat0.w : (-u_xlat0.w);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat0 = log2(u_xlat0);
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (-u_xlat1.yxyx) + u_xlat0;
					    u_xlat0 = vec4(vec4(_Wavy, _Wavy, _Wavy, _Wavy)) * u_xlat0 + u_xlat1.yxyx;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat10_2.x;
					    u_xlat5.x = _Distortion * _Fade;
					    u_xlat0.x = u_xlat5.x * u_xlat0.x;
					    u_xlat3.xy = u_xlat0.xx * vec2(0.5, 0.5) + u_xlat0.zw;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_15 = u_xlat10_2.x * u_xlat10_3.y;
					    u_xlat16_3 = (-u_xlat10_2) + u_xlat10_3;
					    u_xlat10.x = u_xlat0.z * u_xlat16_15;
					    u_xlat5.x = u_xlat5.x * u_xlat10.x;
					    u_xlat0.x = u_xlat5.x * 0.5 + u_xlat0.x;
					    u_xlat5.xy = u_xlat1.xy + vec2(_TimeX);
					    u_xlat10.xy = u_xlat5.yy * vec2(10.0, 30.0);
					    u_xlat4 = u_xlat5.xxxx * vec4(4.0, 8.0, 40.0, 5.0);
					    u_xlat4 = sin(u_xlat4);
					    u_xlat5.xy = sin(u_xlat10.xy);
					    u_xlat5.x = u_xlat5.x * 0.0100000007;
					    u_xlat5.x = u_xlat4.w * 0.0500000007 + u_xlat5.x;
					    u_xlat5.x = u_xlat5.y * 0.00400000019 + u_xlat5.x;
					    u_xlat10.x = _Fade * _DistortionWave;
					    u_xlat6.x = u_xlat10.x * u_xlat5.x + u_xlat1.y;
					    u_xlat5.xz = u_xlat4.xy * vec2(0.0265999995, 0.00300000003);
					    u_xlat5.x = u_xlat5.z + u_xlat5.x;
					    u_xlat5.x = u_xlat4.z * 0.00250000018 + u_xlat5.x;
					    u_xlat6.y = u_xlat10.x * u_xlat5.x + u_xlat1.x;
					    u_xlat0.xy = u_xlat0.xx + u_xlat6.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.x = _Colored + -0.200000003;
					    u_xlat1.x = u_xlat1.w * 0.200000003 + u_xlat1.x;
					    u_xlat2 = u_xlat1.xxxx * u_xlat16_3 + u_xlat10_2;
					    u_xlat3 = u_xlat10_0 + (-u_xlat2);
					    u_xlat2 = u_xlat3 * vec4(0.600000024, 0.600000024, 0.600000024, 0.600000024) + u_xlat2;
					    u_xlat1.xw = u_xlat2.yz + (-vec2(vec2(_ColoredChange, _ColoredChange)));
					    u_xlat6.xy = (-u_xlat1.xw) + u_xlat6.xy;
					    u_xlat2.yz = u_xlat6.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xw;
					    u_xlat1 = (-u_xlat10_0) + u_xlat2;
					    u_xlat0 = vec4(vec4(_Fade, _Fade, _Fade, _Fade)) * u_xlat1 + u_xlat10_0;
					    SV_Target0.xyz = u_xlat0.xyz + vec3(_ChangeRed, _ChangeGreen, _ChangeBlue);
					    SV_Target0.w = u_xlat0.w;
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