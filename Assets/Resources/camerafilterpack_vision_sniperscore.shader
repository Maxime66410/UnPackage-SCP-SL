Shader "CameraFilterPack/Vision_SniperScore" {
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
			GpuProgramID 40253
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
					uniform 	float _Fade;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Cible;
					uniform 	float _Distortion;
					uniform 	float _ExtraColor;
					uniform 	float _PosX;
					uniform 	float _PosY;
					uniform 	vec4 _Tint;
					uniform 	float _ExtraLight;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					vec2 u_xlat9;
					vec2 u_xlat11;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vec2(vec2(_PosX, _PosX));
					    u_xlat0.zw = vec2(_PosY);
					    u_xlat1 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat1 = (-u_xlat1) + vec4(0.996999979, 1.00300002, 0.996999979, 1.00300002);
					    u_xlat0.xz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = (-u_xlat1) + u_xlat0.xxzz;
					    u_xlat1 = u_xlat1 * vec4(166.666672, -166.666672, 166.666672, -166.666672);
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat2 = u_xlat1 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat1.xy = u_xlat1.yw * u_xlat1.xz;
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat5 = _Fade * _Cible;
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xx * vec2(4.0, 0.400000006);
					    u_xlat2.yz = u_xlat0.yw + u_xlat0.xz;
					    u_xlat2.x = u_xlat2.y / _ScreenResolution.z;
					    u_xlat3.x = 0.5 / _ScreenResolution.z;
					    u_xlat3.y = float(0.5);
					    u_xlat11.y = float(0.0);
					    u_xlat4.xz = (-u_xlat2.xz) + u_xlat3.xy;
					    u_xlat4.x = dot(u_xlat4.xz, u_xlat4.xz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat12 = _Value + -2.5;
					    u_xlat12 = _Fade * u_xlat12 + 2.5;
					    u_xlat4.x = (-u_xlat12) + u_xlat4.x;
					    u_xlat12 = float(1.0) / (-_Value2);
					    u_xlat12 = u_xlat12 * u_xlat4.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat9.x) * u_xlat12 + 1.0;
					    u_xlat9.xy = (-vec2(vec2(_Value2, _Value2))) + vec2(-0.100000001, -0.200000003);
					    u_xlat9.xy = vec2(1.0, 1.0) / u_xlat9.xy;
					    u_xlat9.xy = u_xlat4.xx * u_xlat9.xy;
					    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
					    u_xlat2.xy = u_xlat9.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat9.xy = u_xlat9.xy * u_xlat9.xy;
					    u_xlat4.x = u_xlat2.x * u_xlat9.x + u_xlat12;
					    u_xlat11.x = u_xlat12 * 0.25;
					    u_xlat2.xz = u_xlat4.xx * vec2(0.125, 0.125) + u_xlat11.xy;
					    u_xlat4.x = (-u_xlat2.y) * u_xlat9.y + u_xlat4.x;
					    u_xlat9.xy = u_xlat4.xx * u_xlat2.xz;
					    u_xlat2.xy = u_xlat9.xy * vec2(vec2(_ExtraColor, _ExtraColor));
					    u_xlat12 = (-u_xlat4.x) + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat4.x + u_xlat1.y;
					    u_xlat4.x = u_xlat12 + u_xlat4.x;
					    u_xlat1.x = u_xlat4.x * _Distortion;
					    u_xlat0.xz = u_xlat1.xx * vec2(0.0500000007, 0.0500000007) + u_xlat0.xz;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xz);
					    u_xlat3.xyz = u_xlat10_1.xyz * _Tint.xyz + (-u_xlat10_1.xyz);
					    u_xlat0.x = _Fade * _Tint.w;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
					    u_xlat2.z = 0.0;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat0.xzw = vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = _ExtraLight * _Fade + 1.0;
					    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
					    SV_Target0.xyz = u_xlat4.xxx * (-u_xlat0.xzw) + u_xlat0.xzw;
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
					; Bound: 420
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %45 %405 
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
					                                                      OpMemberDecorate %10 11 RelaxedPrecision 
					                                                      OpMemberDecorate %10 11 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 45 
					                                                      OpDecorate %50 RelaxedPrecision 
					                                                      OpDecorate %51 RelaxedPrecision 
					                                                      OpDecorate %54 RelaxedPrecision 
					                                                      OpDecorate %55 RelaxedPrecision 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                                      OpDecorate %338 RelaxedPrecision 
					                                                      OpDecorate %338 DescriptorSet 338 
					                                                      OpDecorate %338 Binding 338 
					                                                      OpDecorate %339 RelaxedPrecision 
					                                                      OpDecorate %342 RelaxedPrecision 
					                                                      OpDecorate %342 DescriptorSet 342 
					                                                      OpDecorate %342 Binding 342 
					                                                      OpDecorate %343 RelaxedPrecision 
					                                                      OpDecorate %349 RelaxedPrecision 
					                                                      OpDecorate %350 RelaxedPrecision 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %357 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %405 Location 405 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %6 %6 %6 %7 %6 %6 %6 %6 %6 %7 %6 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32_4; f32; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 7 
					                                              %15 = OpTypePointer Uniform %6 
					                                              %20 = OpTypeVector %6 2 
					                                          i32 %27 = OpConstant 8 
					                               Private f32_4* %33 = OpVariable Private 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                        f32_4 %36 = OpConstantComposite %35 %35 %35 %35 
					                                          f32 %40 = OpConstant 3,674022E-40 
					                                          f32 %41 = OpConstant 3,674022E-40 
					                                        f32_4 %42 = OpConstantComposite %40 %41 %40 %41 
					                                              %44 = OpTypePointer Input %20 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %47 = OpConstant 11 
					                                              %48 = OpTypePointer Uniform %7 
					                                          f32 %65 = OpConstant 3,674022E-40 
					                                          f32 %66 = OpConstant 3,674022E-40 
					                                        f32_4 %67 = OpConstantComposite %65 %66 %65 %66 
					                                          f32 %70 = OpConstant 3,674022E-40 
					                                          f32 %71 = OpConstant 3,674022E-40 
					                               Private f32_4* %75 = OpVariable Private 
					                                          f32 %77 = OpConstant 3,674022E-40 
					                                        f32_4 %78 = OpConstantComposite %77 %77 %77 %77 
					                                          f32 %80 = OpConstant 3,674022E-40 
					                                        f32_4 %81 = OpConstantComposite %80 %80 %80 %80 
					                                              %96 = OpTypeInt 32 0 
					                                          u32 %97 = OpConstant 1 
					                                              %98 = OpTypePointer Private %6 
					                                         u32 %101 = OpConstant 0 
					                                Private f32* %106 = OpVariable Private 
					                                         i32 %107 = OpConstant 0 
					                                         i32 %110 = OpConstant 4 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                       f32_2 %123 = OpConstantComposite %121 %122 
					                                         i32 %136 = OpConstant 3 
					                                         u32 %137 = OpConstant 2 
					                                             %142 = OpTypeVector %6 3 
					                                             %143 = OpTypePointer Private %142 
					                              Private f32_3* %144 = OpVariable Private 
					                                             %150 = OpTypePointer Private %20 
					                              Private f32_2* %151 = OpVariable Private 
					                              Private f32_3* %153 = OpVariable Private 
					                                Private f32* %172 = OpVariable Private 
					                                         i32 %173 = OpConstant 1 
					                                         f32 %176 = OpConstant 3,674022E-40 
					                                         f32 %182 = OpConstant 3,674022E-40 
					                                         i32 %190 = OpConstant 2 
					                              Private f32_2* %201 = OpVariable Private 
					                                         f32 %224 = OpConstant 3,674022E-40 
					                                         f32 %225 = OpConstant 3,674022E-40 
					                                       f32_2 %226 = OpConstantComposite %224 %225 
					                                       f32_2 %228 = OpConstantComposite %71 %71 
					                                       f32_2 %240 = OpConstantComposite %77 %77 
					                                       f32_2 %242 = OpConstantComposite %80 %80 
					                                         f32 %258 = OpConstant 3,674022E-40 
					                                         f32 %263 = OpConstant 3,674022E-40 
					                                       f32_2 %264 = OpConstantComposite %263 %263 
					                                         i32 %286 = OpConstant 6 
					                                         i32 %320 = OpConstant 5 
					                                         f32 %327 = OpConstant 3,674022E-40 
					                                       f32_2 %328 = OpConstantComposite %327 %327 
					                              Private f32_3* %335 = OpVariable Private 
					                                             %336 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %337 = OpTypePointer UniformConstant %336 
					        UniformConstant read_only Texture2D* %338 = OpVariable UniformConstant 
					                                             %340 = OpTypeSampler 
					                                             %341 = OpTypePointer UniformConstant %340 
					                    UniformConstant sampler* %342 = OpVariable UniformConstant 
					                                             %344 = OpTypeSampledImage %336 
					                                         i32 %351 = OpConstant 9 
					                                         u32 %361 = OpConstant 3 
					                                         i32 %389 = OpConstant 10 
					                                             %404 = OpTypePointer Output %7 
					                               Output f32_4* %405 = OpVariable Output 
					                                             %417 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                 Uniform f32* %18 = OpAccessChain %12 %14 
					                                          f32 %19 = OpLoad %18 
					                                        f32_2 %21 = OpCompositeConstruct %17 %19 
					                                          f32 %22 = OpCompositeExtract %21 0 
					                                          f32 %23 = OpCompositeExtract %21 1 
					                                        f32_2 %24 = OpCompositeConstruct %22 %23 
					                                        f32_4 %25 = OpLoad %9 
					                                        f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
					                                                      OpStore %9 %26 
					                                 Uniform f32* %28 = OpAccessChain %12 %27 
					                                          f32 %29 = OpLoad %28 
					                                        f32_2 %30 = OpCompositeConstruct %29 %29 
					                                        f32_4 %31 = OpLoad %9 
					                                        f32_4 %32 = OpVectorShuffle %31 %30 0 1 4 5 
					                                                      OpStore %9 %32 
					                                        f32_4 %34 = OpLoad %9 
					                                        f32_4 %37 = OpFAdd %34 %36 
					                                                      OpStore %33 %37 
					                                        f32_4 %38 = OpLoad %33 
					                                        f32_4 %39 = OpFNegate %38 
					                                        f32_4 %43 = OpFAdd %39 %42 
					                                                      OpStore %33 %43 
					                                        f32_2 %46 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %49 = OpAccessChain %12 %47 
					                                        f32_4 %50 = OpLoad %49 
					                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
					                                        f32_2 %52 = OpFMul %46 %51 
					                               Uniform f32_4* %53 = OpAccessChain %12 %47 
					                                        f32_4 %54 = OpLoad %53 
					                                        f32_2 %55 = OpVectorShuffle %54 %54 2 3 
					                                        f32_2 %56 = OpFAdd %52 %55 
					                                        f32_4 %57 = OpLoad %9 
					                                        f32_4 %58 = OpVectorShuffle %57 %56 4 1 5 3 
					                                                      OpStore %9 %58 
					                                        f32_4 %59 = OpLoad %33 
					                                        f32_4 %60 = OpFNegate %59 
					                                        f32_4 %61 = OpLoad %9 
					                                        f32_4 %62 = OpVectorShuffle %61 %61 0 0 2 2 
					                                        f32_4 %63 = OpFAdd %60 %62 
					                                                      OpStore %33 %63 
					                                        f32_4 %64 = OpLoad %33 
					                                        f32_4 %68 = OpFMul %64 %67 
					                                                      OpStore %33 %68 
					                                        f32_4 %69 = OpLoad %33 
					                                        f32_4 %72 = OpCompositeConstruct %70 %70 %70 %70 
					                                        f32_4 %73 = OpCompositeConstruct %71 %71 %71 %71 
					                                        f32_4 %74 = OpExtInst %1 43 %69 %72 %73 
					                                                      OpStore %33 %74 
					                                        f32_4 %76 = OpLoad %33 
					                                        f32_4 %79 = OpFMul %76 %78 
					                                        f32_4 %82 = OpFAdd %79 %81 
					                                                      OpStore %75 %82 
					                                        f32_4 %83 = OpLoad %33 
					                                        f32_4 %84 = OpLoad %33 
					                                        f32_4 %85 = OpFMul %83 %84 
					                                                      OpStore %33 %85 
					                                        f32_4 %86 = OpLoad %33 
					                                        f32_4 %87 = OpLoad %75 
					                                        f32_4 %88 = OpFMul %86 %87 
					                                                      OpStore %33 %88 
					                                        f32_4 %89 = OpLoad %33 
					                                        f32_2 %90 = OpVectorShuffle %89 %89 1 3 
					                                        f32_4 %91 = OpLoad %33 
					                                        f32_2 %92 = OpVectorShuffle %91 %91 0 2 
					                                        f32_2 %93 = OpFMul %90 %92 
					                                        f32_4 %94 = OpLoad %33 
					                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
					                                                      OpStore %33 %95 
					                                 Private f32* %99 = OpAccessChain %33 %97 
					                                         f32 %100 = OpLoad %99 
					                                Private f32* %102 = OpAccessChain %33 %101 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpFAdd %100 %103 
					                                Private f32* %105 = OpAccessChain %33 %101 
					                                                      OpStore %105 %104 
					                                Uniform f32* %108 = OpAccessChain %12 %107 
					                                         f32 %109 = OpLoad %108 
					                                Uniform f32* %111 = OpAccessChain %12 %110 
					                                         f32 %112 = OpLoad %111 
					                                         f32 %113 = OpFMul %109 %112 
					                                                      OpStore %106 %113 
					                                         f32 %114 = OpLoad %106 
					                                Private f32* %115 = OpAccessChain %33 %101 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFMul %114 %116 
					                                Private f32* %118 = OpAccessChain %33 %101 
					                                                      OpStore %118 %117 
					                                       f32_4 %119 = OpLoad %33 
					                                       f32_2 %120 = OpVectorShuffle %119 %119 0 0 
					                                       f32_2 %124 = OpFMul %120 %123 
					                                       f32_4 %125 = OpLoad %33 
					                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 2 3 
					                                                      OpStore %33 %126 
					                                       f32_4 %127 = OpLoad %9 
					                                       f32_2 %128 = OpVectorShuffle %127 %127 1 3 
					                                       f32_4 %129 = OpLoad %9 
					                                       f32_2 %130 = OpVectorShuffle %129 %129 0 2 
					                                       f32_2 %131 = OpFAdd %128 %130 
					                                       f32_4 %132 = OpLoad %75 
					                                       f32_4 %133 = OpVectorShuffle %132 %131 0 4 5 3 
					                                                      OpStore %75 %133 
					                                Private f32* %134 = OpAccessChain %75 %97 
					                                         f32 %135 = OpLoad %134 
					                                Uniform f32* %138 = OpAccessChain %12 %136 %137 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFDiv %135 %139 
					                                Private f32* %141 = OpAccessChain %75 %101 
					                                                      OpStore %141 %140 
					                                Uniform f32* %145 = OpAccessChain %12 %136 %137 
					                                         f32 %146 = OpLoad %145 
					                                         f32 %147 = OpFDiv %35 %146 
					                                Private f32* %148 = OpAccessChain %144 %101 
					                                                      OpStore %148 %147 
					                                Private f32* %149 = OpAccessChain %144 %97 
					                                                      OpStore %149 %35 
					                                Private f32* %152 = OpAccessChain %151 %97 
					                                                      OpStore %152 %70 
					                                       f32_4 %154 = OpLoad %75 
					                                       f32_2 %155 = OpVectorShuffle %154 %154 0 2 
					                                       f32_2 %156 = OpFNegate %155 
					                                       f32_3 %157 = OpLoad %144 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
					                                       f32_2 %159 = OpFAdd %156 %158 
					                                       f32_3 %160 = OpLoad %153 
					                                       f32_3 %161 = OpVectorShuffle %160 %159 3 1 4 
					                                                      OpStore %153 %161 
					                                       f32_3 %162 = OpLoad %153 
					                                       f32_2 %163 = OpVectorShuffle %162 %162 0 2 
					                                       f32_3 %164 = OpLoad %153 
					                                       f32_2 %165 = OpVectorShuffle %164 %164 0 2 
					                                         f32 %166 = OpDot %163 %165 
					                                Private f32* %167 = OpAccessChain %153 %101 
					                                                      OpStore %167 %166 
					                                Private f32* %168 = OpAccessChain %153 %101 
					                                         f32 %169 = OpLoad %168 
					                                         f32 %170 = OpExtInst %1 31 %169 
					                                Private f32* %171 = OpAccessChain %153 %101 
					                                                      OpStore %171 %170 
					                                Uniform f32* %174 = OpAccessChain %12 %173 
					                                         f32 %175 = OpLoad %174 
					                                         f32 %177 = OpFAdd %175 %176 
					                                                      OpStore %172 %177 
					                                Uniform f32* %178 = OpAccessChain %12 %107 
					                                         f32 %179 = OpLoad %178 
					                                         f32 %180 = OpLoad %172 
					                                         f32 %181 = OpFMul %179 %180 
					                                         f32 %183 = OpFAdd %181 %182 
					                                                      OpStore %172 %183 
					                                         f32 %184 = OpLoad %172 
					                                         f32 %185 = OpFNegate %184 
					                                Private f32* %186 = OpAccessChain %153 %101 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFAdd %185 %187 
					                                Private f32* %189 = OpAccessChain %153 %101 
					                                                      OpStore %189 %188 
					                                Uniform f32* %191 = OpAccessChain %12 %190 
					                                         f32 %192 = OpLoad %191 
					                                         f32 %193 = OpFNegate %192 
					                                         f32 %194 = OpFDiv %71 %193 
					                                                      OpStore %172 %194 
					                                         f32 %195 = OpLoad %172 
					                                Private f32* %196 = OpAccessChain %153 %101 
					                                         f32 %197 = OpLoad %196 
					                                         f32 %198 = OpFMul %195 %197 
					                                                      OpStore %172 %198 
					                                         f32 %199 = OpLoad %172 
					                                         f32 %200 = OpExtInst %1 43 %199 %70 %71 
					                                                      OpStore %172 %200 
					                                         f32 %202 = OpLoad %172 
					                                         f32 %203 = OpFMul %202 %77 
					                                         f32 %204 = OpFAdd %203 %80 
					                                Private f32* %205 = OpAccessChain %201 %101 
					                                                      OpStore %205 %204 
					                                         f32 %206 = OpLoad %172 
					                                         f32 %207 = OpLoad %172 
					                                         f32 %208 = OpFMul %206 %207 
					                                                      OpStore %172 %208 
					                                Private f32* %209 = OpAccessChain %201 %101 
					                                         f32 %210 = OpLoad %209 
					                                         f32 %211 = OpFNegate %210 
					                                         f32 %212 = OpLoad %172 
					                                         f32 %213 = OpFMul %211 %212 
					                                         f32 %214 = OpFAdd %213 %71 
					                                                      OpStore %172 %214 
					                                Uniform f32* %215 = OpAccessChain %12 %190 
					                                         f32 %216 = OpLoad %215 
					                                Uniform f32* %217 = OpAccessChain %12 %190 
					                                         f32 %218 = OpLoad %217 
					                                       f32_2 %219 = OpCompositeConstruct %216 %218 
					                                         f32 %220 = OpCompositeExtract %219 0 
					                                         f32 %221 = OpCompositeExtract %219 1 
					                                       f32_2 %222 = OpCompositeConstruct %220 %221 
					                                       f32_2 %223 = OpFNegate %222 
					                                       f32_2 %227 = OpFAdd %223 %226 
					                                                      OpStore %201 %227 
					                                       f32_2 %229 = OpLoad %201 
					                                       f32_2 %230 = OpFDiv %228 %229 
					                                                      OpStore %201 %230 
					                                       f32_3 %231 = OpLoad %153 
					                                       f32_2 %232 = OpVectorShuffle %231 %231 0 0 
					                                       f32_2 %233 = OpLoad %201 
					                                       f32_2 %234 = OpFMul %232 %233 
					                                                      OpStore %201 %234 
					                                       f32_2 %235 = OpLoad %201 
					                                       f32_2 %236 = OpCompositeConstruct %70 %70 
					                                       f32_2 %237 = OpCompositeConstruct %71 %71 
					                                       f32_2 %238 = OpExtInst %1 43 %235 %236 %237 
					                                                      OpStore %201 %238 
					                                       f32_2 %239 = OpLoad %201 
					                                       f32_2 %241 = OpFMul %239 %240 
					                                       f32_2 %243 = OpFAdd %241 %242 
					                                       f32_4 %244 = OpLoad %75 
					                                       f32_4 %245 = OpVectorShuffle %244 %243 4 5 2 3 
					                                                      OpStore %75 %245 
					                                       f32_2 %246 = OpLoad %201 
					                                       f32_2 %247 = OpLoad %201 
					                                       f32_2 %248 = OpFMul %246 %247 
					                                                      OpStore %201 %248 
					                                Private f32* %249 = OpAccessChain %75 %101 
					                                         f32 %250 = OpLoad %249 
					                                Private f32* %251 = OpAccessChain %201 %101 
					                                         f32 %252 = OpLoad %251 
					                                         f32 %253 = OpFMul %250 %252 
					                                         f32 %254 = OpLoad %172 
					                                         f32 %255 = OpFAdd %253 %254 
					                                Private f32* %256 = OpAccessChain %153 %101 
					                                                      OpStore %256 %255 
					                                         f32 %257 = OpLoad %172 
					                                         f32 %259 = OpFMul %257 %258 
					                                Private f32* %260 = OpAccessChain %151 %101 
					                                                      OpStore %260 %259 
					                                       f32_3 %261 = OpLoad %153 
					                                       f32_2 %262 = OpVectorShuffle %261 %261 0 0 
					                                       f32_2 %265 = OpFMul %262 %264 
					                                       f32_2 %266 = OpLoad %151 
					                                       f32_2 %267 = OpFAdd %265 %266 
					                                       f32_4 %268 = OpLoad %75 
					                                       f32_4 %269 = OpVectorShuffle %268 %267 4 1 5 3 
					                                                      OpStore %75 %269 
					                                Private f32* %270 = OpAccessChain %75 %97 
					                                         f32 %271 = OpLoad %270 
					                                         f32 %272 = OpFNegate %271 
					                                Private f32* %273 = OpAccessChain %201 %97 
					                                         f32 %274 = OpLoad %273 
					                                         f32 %275 = OpFMul %272 %274 
					                                Private f32* %276 = OpAccessChain %153 %101 
					                                         f32 %277 = OpLoad %276 
					                                         f32 %278 = OpFAdd %275 %277 
					                                Private f32* %279 = OpAccessChain %153 %101 
					                                                      OpStore %279 %278 
					                                       f32_3 %280 = OpLoad %153 
					                                       f32_2 %281 = OpVectorShuffle %280 %280 0 0 
					                                       f32_4 %282 = OpLoad %75 
					                                       f32_2 %283 = OpVectorShuffle %282 %282 0 2 
					                                       f32_2 %284 = OpFMul %281 %283 
					                                                      OpStore %201 %284 
					                                       f32_2 %285 = OpLoad %201 
					                                Uniform f32* %287 = OpAccessChain %12 %286 
					                                         f32 %288 = OpLoad %287 
					                                Uniform f32* %289 = OpAccessChain %12 %286 
					                                         f32 %290 = OpLoad %289 
					                                       f32_2 %291 = OpCompositeConstruct %288 %290 
					                                         f32 %292 = OpCompositeExtract %291 0 
					                                         f32 %293 = OpCompositeExtract %291 1 
					                                       f32_2 %294 = OpCompositeConstruct %292 %293 
					                                       f32_2 %295 = OpFMul %285 %294 
					                                       f32_4 %296 = OpLoad %75 
					                                       f32_4 %297 = OpVectorShuffle %296 %295 4 5 2 3 
					                                                      OpStore %75 %297 
					                                Private f32* %298 = OpAccessChain %153 %101 
					                                         f32 %299 = OpLoad %298 
					                                         f32 %300 = OpFNegate %299 
					                                         f32 %301 = OpFAdd %300 %71 
					                                                      OpStore %172 %301 
					                                         f32 %302 = OpLoad %172 
					                                Private f32* %303 = OpAccessChain %33 %101 
					                                         f32 %304 = OpLoad %303 
					                                         f32 %305 = OpFMul %302 %304 
					                                                      OpStore %172 %305 
					                                         f32 %306 = OpLoad %172 
					                                Private f32* %307 = OpAccessChain %153 %101 
					                                         f32 %308 = OpLoad %307 
					                                         f32 %309 = OpFMul %306 %308 
					                                Private f32* %310 = OpAccessChain %33 %97 
					                                         f32 %311 = OpLoad %310 
					                                         f32 %312 = OpFAdd %309 %311 
					                                                      OpStore %172 %312 
					                                         f32 %313 = OpLoad %172 
					                                Private f32* %314 = OpAccessChain %153 %101 
					                                         f32 %315 = OpLoad %314 
					                                         f32 %316 = OpFAdd %313 %315 
					                                Private f32* %317 = OpAccessChain %153 %101 
					                                                      OpStore %317 %316 
					                                Private f32* %318 = OpAccessChain %153 %101 
					                                         f32 %319 = OpLoad %318 
					                                Uniform f32* %321 = OpAccessChain %12 %320 
					                                         f32 %322 = OpLoad %321 
					                                         f32 %323 = OpFMul %319 %322 
					                                Private f32* %324 = OpAccessChain %33 %101 
					                                                      OpStore %324 %323 
					                                       f32_4 %325 = OpLoad %33 
					                                       f32_2 %326 = OpVectorShuffle %325 %325 0 0 
					                                       f32_2 %329 = OpFMul %326 %328 
					                                       f32_4 %330 = OpLoad %9 
					                                       f32_2 %331 = OpVectorShuffle %330 %330 0 2 
					                                       f32_2 %332 = OpFAdd %329 %331 
					                                       f32_4 %333 = OpLoad %9 
					                                       f32_4 %334 = OpVectorShuffle %333 %332 4 1 5 3 
					                                                      OpStore %9 %334 
					                         read_only Texture2D %339 = OpLoad %338 
					                                     sampler %343 = OpLoad %342 
					                  read_only Texture2DSampled %345 = OpSampledImage %339 %343 
					                                       f32_4 %346 = OpLoad %9 
					                                       f32_2 %347 = OpVectorShuffle %346 %346 0 2 
					                                       f32_4 %348 = OpImageSampleImplicitLod %345 %347 
					                                       f32_3 %349 = OpVectorShuffle %348 %348 0 1 2 
					                                                      OpStore %335 %349 
					                                       f32_3 %350 = OpLoad %335 
					                              Uniform f32_4* %352 = OpAccessChain %12 %351 
					                                       f32_4 %353 = OpLoad %352 
					                                       f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
					                                       f32_3 %355 = OpFMul %350 %354 
					                                       f32_3 %356 = OpLoad %335 
					                                       f32_3 %357 = OpFNegate %356 
					                                       f32_3 %358 = OpFAdd %355 %357 
					                                                      OpStore %144 %358 
					                                Uniform f32* %359 = OpAccessChain %12 %107 
					                                         f32 %360 = OpLoad %359 
					                                Uniform f32* %362 = OpAccessChain %12 %351 %361 
					                                         f32 %363 = OpLoad %362 
					                                         f32 %364 = OpFMul %360 %363 
					                                Private f32* %365 = OpAccessChain %9 %101 
					                                                      OpStore %365 %364 
					                                       f32_4 %366 = OpLoad %9 
					                                       f32_3 %367 = OpVectorShuffle %366 %366 0 0 0 
					                                       f32_3 %368 = OpLoad %144 
					                                       f32_3 %369 = OpFMul %367 %368 
					                                       f32_3 %370 = OpLoad %335 
					                                       f32_3 %371 = OpFAdd %369 %370 
					                                       f32_4 %372 = OpLoad %33 
					                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
					                                                      OpStore %33 %373 
					                                Private f32* %374 = OpAccessChain %75 %137 
					                                                      OpStore %374 %70 
					                                       f32_4 %375 = OpLoad %33 
					                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
					                                       f32_4 %377 = OpLoad %75 
					                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
					                                       f32_3 %379 = OpFAdd %376 %378 
					                                       f32_4 %380 = OpLoad %33 
					                                       f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
					                                                      OpStore %33 %381 
					                                         f32 %382 = OpLoad %172 
					                                       f32_3 %383 = OpCompositeConstruct %382 %382 %382 
					                                       f32_4 %384 = OpLoad %33 
					                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
					                                       f32_3 %386 = OpFAdd %383 %385 
					                                       f32_4 %387 = OpLoad %9 
					                                       f32_4 %388 = OpVectorShuffle %387 %386 4 1 5 6 
					                                                      OpStore %9 %388 
					                                Uniform f32* %390 = OpAccessChain %12 %389 
					                                         f32 %391 = OpLoad %390 
					                                Uniform f32* %392 = OpAccessChain %12 %107 
					                                         f32 %393 = OpLoad %392 
					                                         f32 %394 = OpFMul %391 %393 
					                                         f32 %395 = OpFAdd %394 %71 
					                                Private f32* %396 = OpAccessChain %33 %101 
					                                                      OpStore %396 %395 
					                                       f32_4 %397 = OpLoad %9 
					                                       f32_3 %398 = OpVectorShuffle %397 %397 0 2 3 
					                                       f32_4 %399 = OpLoad %33 
					                                       f32_3 %400 = OpVectorShuffle %399 %399 0 0 0 
					                                       f32_3 %401 = OpFMul %398 %400 
					                                       f32_4 %402 = OpLoad %9 
					                                       f32_4 %403 = OpVectorShuffle %402 %401 4 1 5 6 
					                                                      OpStore %9 %403 
					                                       f32_3 %406 = OpLoad %153 
					                                       f32_3 %407 = OpVectorShuffle %406 %406 0 0 0 
					                                       f32_4 %408 = OpLoad %9 
					                                       f32_3 %409 = OpVectorShuffle %408 %408 0 2 3 
					                                       f32_3 %410 = OpFNegate %409 
					                                       f32_3 %411 = OpFMul %407 %410 
					                                       f32_4 %412 = OpLoad %9 
					                                       f32_3 %413 = OpVectorShuffle %412 %412 0 2 3 
					                                       f32_3 %414 = OpFAdd %411 %413 
					                                       f32_4 %415 = OpLoad %405 
					                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 6 3 
					                                                      OpStore %405 %416 
					                                 Output f32* %418 = OpAccessChain %405 %361 
					                                                      OpStore %418 %71 
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
						float _Fade;
						float _Value;
						float _Value2;
						vec4 _ScreenResolution;
						float _Cible;
						float _Distortion;
						float _ExtraColor;
						float _PosX;
						float _PosY;
						vec4 _Tint;
						float _ExtraLight;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					vec2 u_xlat9;
					vec2 u_xlat11;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vec2(vec2(_PosX, _PosX));
					    u_xlat0.zw = vec2(_PosY);
					    u_xlat1 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat1 = (-u_xlat1) + vec4(0.996999979, 1.00300002, 0.996999979, 1.00300002);
					    u_xlat0.xz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = (-u_xlat1) + u_xlat0.xxzz;
					    u_xlat1 = u_xlat1 * vec4(166.666672, -166.666672, 166.666672, -166.666672);
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat2 = u_xlat1 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat1.xy = u_xlat1.yw * u_xlat1.xz;
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat5 = _Fade * _Cible;
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xx * vec2(4.0, 0.400000006);
					    u_xlat2.yz = u_xlat0.yw + u_xlat0.xz;
					    u_xlat2.x = u_xlat2.y / _ScreenResolution.z;
					    u_xlat3.x = 0.5 / _ScreenResolution.z;
					    u_xlat3.y = float(0.5);
					    u_xlat11.y = float(0.0);
					    u_xlat4.xz = (-u_xlat2.xz) + u_xlat3.xy;
					    u_xlat4.x = dot(u_xlat4.xz, u_xlat4.xz);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat12 = _Value + -2.5;
					    u_xlat12 = _Fade * u_xlat12 + 2.5;
					    u_xlat4.x = (-u_xlat12) + u_xlat4.x;
					    u_xlat12 = float(1.0) / (-_Value2);
					    u_xlat12 = u_xlat12 * u_xlat4.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat9.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat9.x) * u_xlat12 + 1.0;
					    u_xlat9.xy = (-vec2(vec2(_Value2, _Value2))) + vec2(-0.100000001, -0.200000003);
					    u_xlat9.xy = vec2(1.0, 1.0) / u_xlat9.xy;
					    u_xlat9.xy = u_xlat4.xx * u_xlat9.xy;
					    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
					    u_xlat2.xy = u_xlat9.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat9.xy = u_xlat9.xy * u_xlat9.xy;
					    u_xlat4.x = u_xlat2.x * u_xlat9.x + u_xlat12;
					    u_xlat11.x = u_xlat12 * 0.25;
					    u_xlat2.xz = u_xlat4.xx * vec2(0.125, 0.125) + u_xlat11.xy;
					    u_xlat4.x = (-u_xlat2.y) * u_xlat9.y + u_xlat4.x;
					    u_xlat9.xy = u_xlat4.xx * u_xlat2.xz;
					    u_xlat2.xy = u_xlat9.xy * vec2(vec2(_ExtraColor, _ExtraColor));
					    u_xlat12 = (-u_xlat4.x) + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat4.x + u_xlat1.y;
					    u_xlat4.x = u_xlat12 + u_xlat4.x;
					    u_xlat1.x = u_xlat4.x * _Distortion;
					    u_xlat0.xz = u_xlat1.xx * vec2(0.0500000007, 0.0500000007) + u_xlat0.xz;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xz);
					    u_xlat3.xyz = u_xlat10_1.xyz * _Tint.xyz + (-u_xlat10_1.xyz);
					    u_xlat0.x = _Fade * _Tint.w;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
					    u_xlat2.z = 0.0;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat0.xzw = vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat1.x = _ExtraLight * _Fade + 1.0;
					    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
					    SV_Target0.xyz = u_xlat4.xxx * (-u_xlat0.xzw) + u_xlat0.xzw;
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