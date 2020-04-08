Shader "CameraFilterPack/Blend2Camera_Color" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 26698
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat17;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.z = float(-1.0);
					    u_xlat0.w = float(0.666666687);
					    u_xlat1.z = float(1.0);
					    u_xlat1.w = float(-1.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_3.xyz = (-u_xlat10_2.xyz) + u_xlat10_3.xyz;
					    u_xlat4.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    u_xlatb17 = u_xlat4.y>=u_xlat4.z;
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.xy = u_xlat4.zy;
					    u_xlat1.xy = (-u_xlat0.xy) + u_xlat4.yz;
					    u_xlat0 = vec4(u_xlat17) * u_xlat1.xywz + u_xlat0.xywz;
					    u_xlat1.z = u_xlat0.w;
					    u_xlatb17 = u_xlat4.x>=u_xlat0.x;
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.w = u_xlat4.x;
					    u_xlat1.xyw = u_xlat0.wyx;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat0 = vec4(u_xlat17) * u_xlat1 + u_xlat0;
					    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
					    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 6.0 + 1.00000001e-10;
					    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
					    u_xlat5.x = u_xlat5.x / u_xlat6;
					    u_xlat5.x = u_xlat5.x + u_xlat0.z;
					    u_xlat0.x = u_xlat0.x + 1.00000001e-10;
					    u_xlat0.x = u_xlat1.x / u_xlat0.x;
					    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
					    u_xlat5.xyz = fract(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
					    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
					    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat15 = (-_Value2) + 1.0;
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + u_xlat10_2.xyz;
					    u_xlatb15 = u_xlat1.y>=u_xlat1.z;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat6 = (-u_xlat1.z) + u_xlat1.y;
					    u_xlat15 = u_xlat15 * u_xlat6 + u_xlat1.z;
					    u_xlatb6 = u_xlat1.x>=u_xlat15;
					    u_xlat1.x = (-u_xlat15) + u_xlat1.x;
					    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat15 = u_xlat6 * u_xlat1.x + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + (-u_xlat4.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat4.xyz;
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
					; Bound: 342
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %41 %319 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpMemberDecorate %26 0 Offset 26 
					                                                  OpMemberDecorate %26 1 Offset 26 
					                                                  OpMemberDecorate %26 2 Offset 26 
					                                                  OpMemberDecorate %26 3 RelaxedPrecision 
					                                                  OpMemberDecorate %26 3 Offset 26 
					                                                  OpDecorate %26 Block 
					                                                  OpDecorate %28 DescriptorSet 28 
					                                                  OpDecorate %28 Binding 28 
					                                                  OpDecorate vs_TEXCOORD0 Location 41 
					                                                  OpDecorate %46 RelaxedPrecision 
					                                                  OpDecorate %47 RelaxedPrecision 
					                                                  OpDecorate %50 RelaxedPrecision 
					                                                  OpDecorate %51 RelaxedPrecision 
					                                                  OpDecorate %71 RelaxedPrecision 
					                                                  OpDecorate %74 RelaxedPrecision 
					                                                  OpDecorate %74 DescriptorSet 74 
					                                                  OpDecorate %74 Binding 74 
					                                                  OpDecorate %75 RelaxedPrecision 
					                                                  OpDecorate %78 RelaxedPrecision 
					                                                  OpDecorate %78 DescriptorSet 78 
					                                                  OpDecorate %78 Binding 78 
					                                                  OpDecorate %79 RelaxedPrecision 
					                                                  OpDecorate %85 RelaxedPrecision 
					                                                  OpDecorate %86 RelaxedPrecision 
					                                                  OpDecorate %87 RelaxedPrecision 
					                                                  OpDecorate %87 DescriptorSet 87 
					                                                  OpDecorate %87 Binding 87 
					                                                  OpDecorate %88 RelaxedPrecision 
					                                                  OpDecorate %89 RelaxedPrecision 
					                                                  OpDecorate %89 DescriptorSet 89 
					                                                  OpDecorate %89 Binding 89 
					                                                  OpDecorate %90 RelaxedPrecision 
					                                                  OpDecorate %95 RelaxedPrecision 
					                                                  OpDecorate %96 RelaxedPrecision 
					                                                  OpDecorate %97 RelaxedPrecision 
					                                                  OpDecorate %98 RelaxedPrecision 
					                                                  OpDecorate %99 RelaxedPrecision 
					                                                  OpDecorate %100 RelaxedPrecision 
					                                                  OpDecorate %109 RelaxedPrecision 
					                                                  OpDecorate %110 RelaxedPrecision 
					                                                  OpDecorate %111 RelaxedPrecision 
					                                                  OpDecorate %112 RelaxedPrecision 
					                                                  OpDecorate %113 RelaxedPrecision 
					                                                  OpDecorate %114 RelaxedPrecision 
					                                                  OpDecorate %115 RelaxedPrecision 
					                                                  OpDecorate %116 RelaxedPrecision 
					                                                  OpDecorate %117 RelaxedPrecision 
					                                                  OpDecorate %262 RelaxedPrecision 
					                                                  OpDecorate %263 RelaxedPrecision 
					                                                  OpDecorate %264 RelaxedPrecision 
					                                                  OpDecorate %265 RelaxedPrecision 
					                                                  OpDecorate %266 RelaxedPrecision 
					                                                  OpDecorate %319 Location 319 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 4 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_4* %9 = OpVariable Private 
					                                      f32 %10 = OpConstant 3,674022E-40 
					                                          %11 = OpTypeInt 32 0 
					                                      u32 %12 = OpConstant 2 
					                                          %13 = OpTypePointer Private %6 
					                                      f32 %15 = OpConstant 3,674022E-40 
					                                      u32 %16 = OpConstant 3 
					                           Private f32_4* %18 = OpVariable Private 
					                                      f32 %19 = OpConstant 3,674022E-40 
					                                          %22 = OpTypeBool 
					                                          %23 = OpTypePointer Private %22 
					                            Private bool* %24 = OpVariable Private 
					                                          %25 = OpTypeVector %6 2 
					                                          %26 = OpTypeStruct %6 %6 %25 %7 
					                                          %27 = OpTypePointer Uniform %26 
					Uniform struct {f32; f32; f32_2; f32_4;}* %28 = OpVariable Uniform 
					                                          %29 = OpTypeInt 32 1 
					                                      i32 %30 = OpConstant 2 
					                                      u32 %31 = OpConstant 1 
					                                          %32 = OpTypePointer Uniform %6 
					                                      f32 %35 = OpConstant 3,674022E-40 
					                                          %37 = OpTypeVector %6 3 
					                                          %38 = OpTypePointer Private %37 
					                           Private f32_3* %39 = OpVariable Private 
					                                          %40 = OpTypePointer Input %25 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      i32 %43 = OpConstant 3 
					                                          %44 = OpTypePointer Uniform %7 
					                             Private f32* %55 = OpVariable Private 
					                                          %61 = OpTypePointer Function %6 
					                           Private f32_3* %71 = OpVariable Private 
					                                          %72 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %73 = OpTypePointer UniformConstant %72 
					     UniformConstant read_only Texture2D* %74 = OpVariable UniformConstant 
					                                          %76 = OpTypeSampler 
					                                          %77 = OpTypePointer UniformConstant %76 
					                 UniformConstant sampler* %78 = OpVariable UniformConstant 
					                                          %80 = OpTypeSampledImage %72 
					                           Private f32_3* %86 = OpVariable Private 
					     UniformConstant read_only Texture2D* %87 = OpVariable UniformConstant 
					                 UniformConstant sampler* %89 = OpVariable UniformConstant 
					                           Private f32_3* %96 = OpVariable Private 
					                          Private f32_3* %101 = OpVariable Private 
					                                     i32 %102 = OpConstant 1 
					                           Private bool* %118 = OpVariable Private 
					                            Private f32* %124 = OpVariable Private 
					                                     u32 %150 = OpConstant 0 
					                            Private f32* %188 = OpVariable Private 
					                                     f32 %191 = OpConstant 3,674022E-40 
					                                     f32 %193 = OpConstant 3,674022E-40 
					                          Private f32_3* %195 = OpVariable Private 
					                                     f32 %227 = OpConstant 3,674022E-40 
					                                   f32_3 %228 = OpConstantComposite %19 %15 %227 
					                                   f32_3 %233 = OpConstantComposite %191 %191 %191 
					                                     f32 %235 = OpConstant 3,674022E-40 
					                                   f32_3 %236 = OpConstantComposite %235 %235 %235 
					                                   f32_3 %240 = OpConstantComposite %10 %10 %10 
					                                   f32_3 %252 = OpConstantComposite %19 %19 %19 
					                            Private f32* %256 = OpVariable Private 
					                           Private bool* %269 = OpVariable Private 
					                           Private bool* %289 = OpVariable Private 
					                                         %318 = OpTypePointer Output %7 
					                           Output f32_4* %319 = OpVariable Output 
					                                     i32 %320 = OpConstant 0 
					                                         %339 = OpTypePointer Output %6 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                            Function f32* %62 = OpVariable Function 
					                             Private f32* %14 = OpAccessChain %9 %12 
					                                                  OpStore %14 %10 
					                             Private f32* %17 = OpAccessChain %9 %16 
					                                                  OpStore %17 %15 
					                             Private f32* %20 = OpAccessChain %18 %12 
					                                                  OpStore %20 %19 
					                             Private f32* %21 = OpAccessChain %18 %16 
					                                                  OpStore %21 %10 
					                             Uniform f32* %33 = OpAccessChain %28 %30 %31 
					                                      f32 %34 = OpLoad %33 
					                                     bool %36 = OpFOrdLessThan %34 %35 
					                                                  OpStore %24 %36 
					                                    f32_2 %42 = OpLoad vs_TEXCOORD0 
					                           Uniform f32_4* %45 = OpAccessChain %28 %43 
					                                    f32_4 %46 = OpLoad %45 
					                                    f32_2 %47 = OpVectorShuffle %46 %46 0 1 
					                                    f32_2 %48 = OpFMul %42 %47 
					                           Uniform f32_4* %49 = OpAccessChain %28 %43 
					                                    f32_4 %50 = OpLoad %49 
					                                    f32_2 %51 = OpVectorShuffle %50 %50 2 3 
					                                    f32_2 %52 = OpFAdd %48 %51 
					                                    f32_3 %53 = OpLoad %39 
					                                    f32_3 %54 = OpVectorShuffle %53 %52 3 4 2 
					                                                  OpStore %39 %54 
					                             Private f32* %56 = OpAccessChain %39 %31 
					                                      f32 %57 = OpLoad %56 
					                                      f32 %58 = OpFNegate %57 
					                                      f32 %59 = OpFAdd %58 %19 
					                                                  OpStore %55 %59 
					                                     bool %60 = OpLoad %24 
					                                                  OpSelectionMerge %64 None 
					                                                  OpBranchConditional %60 %63 %66 
					                                          %63 = OpLabel 
					                                      f32 %65 = OpLoad %55 
					                                                  OpStore %62 %65 
					                                                  OpBranch %64 
					                                          %66 = OpLabel 
					                             Private f32* %67 = OpAccessChain %39 %31 
					                                      f32 %68 = OpLoad %67 
					                                                  OpStore %62 %68 
					                                                  OpBranch %64 
					                                          %64 = OpLabel 
					                                      f32 %69 = OpLoad %62 
					                             Private f32* %70 = OpAccessChain %39 %12 
					                                                  OpStore %70 %69 
					                      read_only Texture2D %75 = OpLoad %74 
					                                  sampler %79 = OpLoad %78 
					               read_only Texture2DSampled %81 = OpSampledImage %75 %79 
					                                    f32_3 %82 = OpLoad %39 
					                                    f32_2 %83 = OpVectorShuffle %82 %82 0 2 
					                                    f32_4 %84 = OpImageSampleImplicitLod %81 %83 
					                                    f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                                  OpStore %71 %85 
					                      read_only Texture2D %88 = OpLoad %87 
					                                  sampler %90 = OpLoad %89 
					               read_only Texture2DSampled %91 = OpSampledImage %88 %90 
					                                    f32_3 %92 = OpLoad %39 
					                                    f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                                    f32_4 %94 = OpImageSampleImplicitLod %91 %93 
					                                    f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
					                                                  OpStore %86 %95 
					                                    f32_3 %97 = OpLoad %71 
					                                    f32_3 %98 = OpLoad %86 
					                                    f32_3 %99 = OpFNegate %98 
					                                   f32_3 %100 = OpFAdd %97 %99 
					                                                  OpStore %96 %100 
					                            Uniform f32* %103 = OpAccessChain %28 %102 
					                                     f32 %104 = OpLoad %103 
					                            Uniform f32* %105 = OpAccessChain %28 %102 
					                                     f32 %106 = OpLoad %105 
					                            Uniform f32* %107 = OpAccessChain %28 %102 
					                                     f32 %108 = OpLoad %107 
					                                   f32_3 %109 = OpCompositeConstruct %104 %106 %108 
					                                     f32 %110 = OpCompositeExtract %109 0 
					                                     f32 %111 = OpCompositeExtract %109 1 
					                                     f32 %112 = OpCompositeExtract %109 2 
					                                   f32_3 %113 = OpCompositeConstruct %110 %111 %112 
					                                   f32_3 %114 = OpLoad %96 
					                                   f32_3 %115 = OpFMul %113 %114 
					                                   f32_3 %116 = OpLoad %86 
					                                   f32_3 %117 = OpFAdd %115 %116 
					                                                  OpStore %101 %117 
					                            Private f32* %119 = OpAccessChain %101 %31 
					                                     f32 %120 = OpLoad %119 
					                            Private f32* %121 = OpAccessChain %101 %12 
					                                     f32 %122 = OpLoad %121 
					                                    bool %123 = OpFOrdGreaterThanEqual %120 %122 
					                                                  OpStore %118 %123 
					                                    bool %125 = OpLoad %118 
					                                     f32 %126 = OpSelect %125 %19 %35 
					                                                  OpStore %124 %126 
					                                   f32_3 %127 = OpLoad %101 
					                                   f32_2 %128 = OpVectorShuffle %127 %127 2 1 
					                                   f32_4 %129 = OpLoad %9 
					                                   f32_4 %130 = OpVectorShuffle %129 %128 4 5 2 3 
					                                                  OpStore %9 %130 
					                                   f32_4 %131 = OpLoad %9 
					                                   f32_2 %132 = OpVectorShuffle %131 %131 0 1 
					                                   f32_2 %133 = OpFNegate %132 
					                                   f32_3 %134 = OpLoad %101 
					                                   f32_2 %135 = OpVectorShuffle %134 %134 1 2 
					                                   f32_2 %136 = OpFAdd %133 %135 
					                                   f32_4 %137 = OpLoad %18 
					                                   f32_4 %138 = OpVectorShuffle %137 %136 4 5 2 3 
					                                                  OpStore %18 %138 
					                                     f32 %139 = OpLoad %124 
					                                   f32_4 %140 = OpCompositeConstruct %139 %139 %139 %139 
					                                   f32_4 %141 = OpLoad %18 
					                                   f32_4 %142 = OpVectorShuffle %141 %141 0 1 3 2 
					                                   f32_4 %143 = OpFMul %140 %142 
					                                   f32_4 %144 = OpLoad %9 
					                                   f32_4 %145 = OpVectorShuffle %144 %144 0 1 3 2 
					                                   f32_4 %146 = OpFAdd %143 %145 
					                                                  OpStore %9 %146 
					                            Private f32* %147 = OpAccessChain %9 %16 
					                                     f32 %148 = OpLoad %147 
					                            Private f32* %149 = OpAccessChain %18 %12 
					                                                  OpStore %149 %148 
					                            Private f32* %151 = OpAccessChain %101 %150 
					                                     f32 %152 = OpLoad %151 
					                            Private f32* %153 = OpAccessChain %9 %150 
					                                     f32 %154 = OpLoad %153 
					                                    bool %155 = OpFOrdGreaterThanEqual %152 %154 
					                                                  OpStore %118 %155 
					                                    bool %156 = OpLoad %118 
					                                     f32 %157 = OpSelect %156 %19 %35 
					                                                  OpStore %124 %157 
					                            Private f32* %158 = OpAccessChain %101 %150 
					                                     f32 %159 = OpLoad %158 
					                            Private f32* %160 = OpAccessChain %9 %16 
					                                                  OpStore %160 %159 
					                                   f32_4 %161 = OpLoad %9 
					                                   f32_3 %162 = OpVectorShuffle %161 %161 3 1 0 
					                                   f32_4 %163 = OpLoad %18 
					                                   f32_4 %164 = OpVectorShuffle %163 %162 4 5 2 6 
					                                                  OpStore %18 %164 
					                                   f32_4 %165 = OpLoad %9 
					                                   f32_4 %166 = OpFNegate %165 
					                                   f32_4 %167 = OpLoad %18 
					                                   f32_4 %168 = OpFAdd %166 %167 
					                                                  OpStore %18 %168 
					                                     f32 %169 = OpLoad %124 
					                                   f32_4 %170 = OpCompositeConstruct %169 %169 %169 %169 
					                                   f32_4 %171 = OpLoad %18 
					                                   f32_4 %172 = OpFMul %170 %171 
					                                   f32_4 %173 = OpLoad %9 
					                                   f32_4 %174 = OpFAdd %172 %173 
					                                                  OpStore %9 %174 
					                            Private f32* %175 = OpAccessChain %9 %31 
					                                     f32 %176 = OpLoad %175 
					                            Private f32* %177 = OpAccessChain %9 %16 
					                                     f32 %178 = OpLoad %177 
					                                     f32 %179 = OpExtInst %1 37 %176 %178 
					                            Private f32* %180 = OpAccessChain %18 %150 
					                                                  OpStore %180 %179 
					                            Private f32* %181 = OpAccessChain %9 %150 
					                                     f32 %182 = OpLoad %181 
					                            Private f32* %183 = OpAccessChain %18 %150 
					                                     f32 %184 = OpLoad %183 
					                                     f32 %185 = OpFNegate %184 
					                                     f32 %186 = OpFAdd %182 %185 
					                            Private f32* %187 = OpAccessChain %18 %150 
					                                                  OpStore %187 %186 
					                            Private f32* %189 = OpAccessChain %18 %150 
					                                     f32 %190 = OpLoad %189 
					                                     f32 %192 = OpFMul %190 %191 
					                                     f32 %194 = OpFAdd %192 %193 
					                                                  OpStore %188 %194 
					                            Private f32* %196 = OpAccessChain %9 %31 
					                                     f32 %197 = OpLoad %196 
					                                     f32 %198 = OpFNegate %197 
					                            Private f32* %199 = OpAccessChain %9 %16 
					                                     f32 %200 = OpLoad %199 
					                                     f32 %201 = OpFAdd %198 %200 
					                            Private f32* %202 = OpAccessChain %195 %150 
					                                                  OpStore %202 %201 
					                            Private f32* %203 = OpAccessChain %195 %150 
					                                     f32 %204 = OpLoad %203 
					                                     f32 %205 = OpLoad %188 
					                                     f32 %206 = OpFDiv %204 %205 
					                            Private f32* %207 = OpAccessChain %195 %150 
					                                                  OpStore %207 %206 
					                            Private f32* %208 = OpAccessChain %195 %150 
					                                     f32 %209 = OpLoad %208 
					                            Private f32* %210 = OpAccessChain %9 %12 
					                                     f32 %211 = OpLoad %210 
					                                     f32 %212 = OpFAdd %209 %211 
					                            Private f32* %213 = OpAccessChain %195 %150 
					                                                  OpStore %213 %212 
					                            Private f32* %214 = OpAccessChain %9 %150 
					                                     f32 %215 = OpLoad %214 
					                                     f32 %216 = OpFAdd %215 %193 
					                            Private f32* %217 = OpAccessChain %9 %150 
					                                                  OpStore %217 %216 
					                            Private f32* %218 = OpAccessChain %18 %150 
					                                     f32 %219 = OpLoad %218 
					                            Private f32* %220 = OpAccessChain %9 %150 
					                                     f32 %221 = OpLoad %220 
					                                     f32 %222 = OpFDiv %219 %221 
					                            Private f32* %223 = OpAccessChain %9 %150 
					                                                  OpStore %223 %222 
					                                   f32_3 %224 = OpLoad %195 
					                                   f32_3 %225 = OpVectorShuffle %224 %224 0 0 0 
					                                   f32_3 %226 = OpExtInst %1 4 %225 
					                                   f32_3 %229 = OpFAdd %226 %228 
					                                                  OpStore %195 %229 
					                                   f32_3 %230 = OpLoad %195 
					                                   f32_3 %231 = OpExtInst %1 10 %230 
					                                                  OpStore %195 %231 
					                                   f32_3 %232 = OpLoad %195 
					                                   f32_3 %234 = OpFMul %232 %233 
					                                   f32_3 %237 = OpFAdd %234 %236 
					                                                  OpStore %195 %237 
					                                   f32_3 %238 = OpLoad %195 
					                                   f32_3 %239 = OpExtInst %1 4 %238 
					                                   f32_3 %241 = OpFAdd %239 %240 
					                                                  OpStore %195 %241 
					                                   f32_3 %242 = OpLoad %195 
					                                   f32_3 %243 = OpCompositeConstruct %35 %35 %35 
					                                   f32_3 %244 = OpCompositeConstruct %19 %19 %19 
					                                   f32_3 %245 = OpExtInst %1 43 %242 %243 %244 
					                                                  OpStore %195 %245 
					                                   f32_3 %246 = OpLoad %195 
					                                   f32_3 %247 = OpFAdd %246 %240 
					                                                  OpStore %195 %247 
					                                   f32_4 %248 = OpLoad %9 
					                                   f32_3 %249 = OpVectorShuffle %248 %248 0 0 0 
					                                   f32_3 %250 = OpLoad %195 
					                                   f32_3 %251 = OpFMul %249 %250 
					                                   f32_3 %253 = OpFAdd %251 %252 
					                                   f32_4 %254 = OpLoad %9 
					                                   f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
					                                                  OpStore %9 %255 
					                            Uniform f32* %257 = OpAccessChain %28 %102 
					                                     f32 %258 = OpLoad %257 
					                                     f32 %259 = OpFNegate %258 
					                                     f32 %260 = OpFAdd %259 %19 
					                                                  OpStore %256 %260 
					                                     f32 %261 = OpLoad %256 
					                                   f32_3 %262 = OpCompositeConstruct %261 %261 %261 
					                                   f32_3 %263 = OpLoad %96 
					                                   f32_3 %264 = OpFMul %262 %263 
					                                   f32_3 %265 = OpLoad %86 
					                                   f32_3 %266 = OpFAdd %264 %265 
					                                   f32_4 %267 = OpLoad %18 
					                                   f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
					                                                  OpStore %18 %268 
					                            Private f32* %270 = OpAccessChain %18 %31 
					                                     f32 %271 = OpLoad %270 
					                            Private f32* %272 = OpAccessChain %18 %12 
					                                     f32 %273 = OpLoad %272 
					                                    bool %274 = OpFOrdGreaterThanEqual %271 %273 
					                                                  OpStore %269 %274 
					                                    bool %275 = OpLoad %269 
					                                     f32 %276 = OpSelect %275 %19 %35 
					                                                  OpStore %256 %276 
					                            Private f32* %277 = OpAccessChain %18 %12 
					                                     f32 %278 = OpLoad %277 
					                                     f32 %279 = OpFNegate %278 
					                            Private f32* %280 = OpAccessChain %18 %31 
					                                     f32 %281 = OpLoad %280 
					                                     f32 %282 = OpFAdd %279 %281 
					                                                  OpStore %188 %282 
					                                     f32 %283 = OpLoad %256 
					                                     f32 %284 = OpLoad %188 
					                                     f32 %285 = OpFMul %283 %284 
					                            Private f32* %286 = OpAccessChain %18 %12 
					                                     f32 %287 = OpLoad %286 
					                                     f32 %288 = OpFAdd %285 %287 
					                                                  OpStore %256 %288 
					                            Private f32* %290 = OpAccessChain %18 %150 
					                                     f32 %291 = OpLoad %290 
					                                     f32 %292 = OpLoad %256 
					                                    bool %293 = OpFOrdGreaterThanEqual %291 %292 
					                                                  OpStore %289 %293 
					                                     f32 %294 = OpLoad %256 
					                                     f32 %295 = OpFNegate %294 
					                            Private f32* %296 = OpAccessChain %18 %150 
					                                     f32 %297 = OpLoad %296 
					                                     f32 %298 = OpFAdd %295 %297 
					                            Private f32* %299 = OpAccessChain %18 %150 
					                                                  OpStore %299 %298 
					                                    bool %300 = OpLoad %289 
					                                     f32 %301 = OpSelect %300 %19 %35 
					                                                  OpStore %188 %301 
					                                     f32 %302 = OpLoad %188 
					                            Private f32* %303 = OpAccessChain %18 %150 
					                                     f32 %304 = OpLoad %303 
					                                     f32 %305 = OpFMul %302 %304 
					                                     f32 %306 = OpLoad %256 
					                                     f32 %307 = OpFAdd %305 %306 
					                                                  OpStore %256 %307 
					                                     f32 %308 = OpLoad %256 
					                                   f32_3 %309 = OpCompositeConstruct %308 %308 %308 
					                                   f32_4 %310 = OpLoad %9 
					                                   f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
					                                   f32_3 %312 = OpFMul %309 %311 
					                                   f32_3 %313 = OpLoad %101 
					                                   f32_3 %314 = OpFNegate %313 
					                                   f32_3 %315 = OpFAdd %312 %314 
					                                   f32_4 %316 = OpLoad %9 
					                                   f32_4 %317 = OpVectorShuffle %316 %315 4 5 6 3 
					                                                  OpStore %9 %317 
					                            Uniform f32* %321 = OpAccessChain %28 %320 
					                                     f32 %322 = OpLoad %321 
					                            Uniform f32* %323 = OpAccessChain %28 %320 
					                                     f32 %324 = OpLoad %323 
					                            Uniform f32* %325 = OpAccessChain %28 %320 
					                                     f32 %326 = OpLoad %325 
					                                   f32_3 %327 = OpCompositeConstruct %322 %324 %326 
					                                     f32 %328 = OpCompositeExtract %327 0 
					                                     f32 %329 = OpCompositeExtract %327 1 
					                                     f32 %330 = OpCompositeExtract %327 2 
					                                   f32_3 %331 = OpCompositeConstruct %328 %329 %330 
					                                   f32_4 %332 = OpLoad %9 
					                                   f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
					                                   f32_3 %334 = OpFMul %331 %333 
					                                   f32_3 %335 = OpLoad %101 
					                                   f32_3 %336 = OpFAdd %334 %335 
					                                   f32_4 %337 = OpLoad %319 
					                                   f32_4 %338 = OpVectorShuffle %337 %336 4 5 6 3 
					                                                  OpStore %319 %338 
					                             Output f32* %340 = OpAccessChain %319 %16 
					                                                  OpStore %340 %19 
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
						vec4 unused_0_3;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					bool u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat17;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.z = float(-1.0);
					    u_xlat0.w = float(0.666666687);
					    u_xlat1.z = float(1.0);
					    u_xlat1.w = float(-1.0);
					    u_xlatb2 = _MainTex_TexelSize.y<0.0;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat7 = (-u_xlat3.y) + 1.0;
					    u_xlat3.z = (u_xlatb2) ? u_xlat7 : u_xlat3.y;
					    u_xlat10_2 = texture(_MainTex2, u_xlat3.xz);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
					    u_xlat4.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlatb17 = u_xlat4.y>=u_xlat4.z;
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.xy = u_xlat4.zy;
					    u_xlat1.xy = (-u_xlat0.xy) + u_xlat4.yz;
					    u_xlat0 = vec4(u_xlat17) * u_xlat1.xywz + u_xlat0.xywz;
					    u_xlat1.z = u_xlat0.w;
					    u_xlatb17 = u_xlat4.x>=u_xlat0.x;
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.w = u_xlat4.x;
					    u_xlat1.xyw = u_xlat0.wyx;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat0 = vec4(u_xlat17) * u_xlat1 + u_xlat0;
					    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
					    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 6.0 + 1.00000001e-10;
					    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
					    u_xlat5.x = u_xlat5.x / u_xlat6;
					    u_xlat5.x = u_xlat5.x + u_xlat0.z;
					    u_xlat0.x = u_xlat0.x + 1.00000001e-10;
					    u_xlat0.x = u_xlat1.x / u_xlat0.x;
					    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
					    u_xlat5.xyz = fract(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
					    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
					    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat15 = (-_Value2) + 1.0;
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlatb15 = u_xlat1.y>=u_xlat1.z;
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat6 = (-u_xlat1.z) + u_xlat1.y;
					    u_xlat15 = u_xlat15 * u_xlat6 + u_xlat1.z;
					    u_xlatb6 = u_xlat1.x>=u_xlat15;
					    u_xlat1.x = (-u_xlat15) + u_xlat1.x;
					    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat15 = u_xlat6 * u_xlat1.x + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + (-u_xlat4.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat4.xyz;
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