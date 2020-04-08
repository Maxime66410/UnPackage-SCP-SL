Shader "CameraFilterPack/Blend2Camera_Saturation" {
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
			GpuProgramID 59006
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
					bool u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec2 u_xlat6;
					vec2 u_xlat7;
					vec3 u_xlat16_7;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.z = float(-1.0);
					    u_xlat0.w = float(0.666666687);
					    u_xlat1.z = float(1.0);
					    u_xlat1.w = float(-1.0);
					    u_xlat2.x = (-_Value2) + 1.0;
					    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_3 = texture(_MainTex2, u_xlat7.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat7.xy);
					    u_xlat16_7.xyz = u_xlat10_3.xyz + (-u_xlat10_4.xyz);
					    u_xlat3.xyw = u_xlat2.xxx * u_xlat16_7.yzx + u_xlat10_4.yzx;
					    u_xlat2.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_7.xyz + u_xlat10_4.xyz;
					    u_xlatb17 = u_xlat3.x>=u_xlat3.y;
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.xy = u_xlat3.yx;
					    u_xlat1.xy = (-u_xlat0.xy) + u_xlat3.xy;
					    u_xlat0 = vec4(u_xlat17) * u_xlat1 + u_xlat0;
					    u_xlat3.xyz = u_xlat0.xyw;
					    u_xlatb1 = u_xlat3.w>=u_xlat3.x;
					    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat0.xyw = u_xlat3.wyx;
					    u_xlat0 = u_xlat0 + (-u_xlat3);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat3;
					    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
					    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 6.0 + 1.00000001e-10;
					    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
					    u_xlat5.x = u_xlat5.x / u_xlat1.x;
					    u_xlat5.x = u_xlat5.x + u_xlat0.z;
					    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
					    u_xlat5.xyz = fract(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
					    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
					    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlatb1 = u_xlat2.y>=u_xlat2.z;
					    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat6.xy = (-u_xlat2.zy) + u_xlat2.yz;
					    u_xlat1.xy = u_xlat1.xx * u_xlat6.xy + u_xlat2.zy;
					    u_xlatb16 = u_xlat2.x>=u_xlat1.x;
					    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
					    u_xlat1.z = u_xlat2.x;
					    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat1.zyx;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat3.xyz + u_xlat1.xyz;
					    u_xlat6.x = min(u_xlat1.y, u_xlat1.z);
					    u_xlat6.x = (-u_xlat6.x) + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x + 1.00000001e-10;
					    u_xlat1.x = u_xlat6.x / u_xlat1.x;
					    u_xlat5.xyz = u_xlat1.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + (-u_xlat2.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat2.xyz;
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
					; Bound: 366
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %41 %343 
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
					                                                  OpDecorate %125 RelaxedPrecision 
					                                                  OpDecorate %126 RelaxedPrecision 
					                                                  OpDecorate %127 RelaxedPrecision 
					                                                  OpDecorate %128 RelaxedPrecision 
					                                                  OpDecorate %129 RelaxedPrecision 
					                                                  OpDecorate %130 RelaxedPrecision 
					                                                  OpDecorate %131 RelaxedPrecision 
					                                                  OpDecorate %132 RelaxedPrecision 
					                                                  OpDecorate %133 RelaxedPrecision 
					                                                  OpDecorate %343 Location 343 
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
					                            Private f32* %101 = OpVariable Private 
					                                     i32 %102 = OpConstant 1 
					                          Private f32_4* %107 = OpVariable Private 
					                          Private f32_3* %118 = OpVariable Private 
					                           Private bool* %134 = OpVariable Private 
					                                     u32 %135 = OpConstant 0 
					                           Private bool* %161 = OpVariable Private 
					                                     f32 %203 = OpConstant 3,674022E-40 
					                                     f32 %205 = OpConstant 3,674022E-40 
					                          Private f32_3* %208 = OpVariable Private 
					                                     f32 %231 = OpConstant 3,674022E-40 
					                                   f32_3 %232 = OpConstantComposite %19 %15 %231 
					                                   f32_3 %237 = OpConstantComposite %203 %203 %203 
					                                     f32 %239 = OpConstant 3,674022E-40 
					                                   f32_3 %240 = OpConstantComposite %239 %239 %239 
					                                   f32_3 %244 = OpConstantComposite %10 %10 %10 
					                                         %260 = OpTypePointer Private %25 
					                          Private f32_2* %261 = OpVariable Private 
					                           Private bool* %277 = OpVariable Private 
					                            Private f32* %283 = OpVariable Private 
					                                   f32_3 %331 = OpConstantComposite %19 %19 %19 
					                                         %342 = OpTypePointer Output %7 
					                           Output f32_4* %343 = OpVariable Output 
					                                     i32 %344 = OpConstant 0 
					                                         %363 = OpTypePointer Output %6 
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
					                                     f32 %105 = OpFNegate %104 
					                                     f32 %106 = OpFAdd %105 %19 
					                                                  OpStore %101 %106 
					                                     f32 %108 = OpLoad %101 
					                                   f32_3 %109 = OpCompositeConstruct %108 %108 %108 
					                                   f32_3 %110 = OpLoad %96 
					                                   f32_3 %111 = OpVectorShuffle %110 %110 1 2 0 
					                                   f32_3 %112 = OpFMul %109 %111 
					                                   f32_3 %113 = OpLoad %86 
					                                   f32_3 %114 = OpVectorShuffle %113 %113 1 2 0 
					                                   f32_3 %115 = OpFAdd %112 %114 
					                                   f32_4 %116 = OpLoad %107 
					                                   f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 6 
					                                                  OpStore %107 %117 
					                            Uniform f32* %119 = OpAccessChain %28 %102 
					                                     f32 %120 = OpLoad %119 
					                            Uniform f32* %121 = OpAccessChain %28 %102 
					                                     f32 %122 = OpLoad %121 
					                            Uniform f32* %123 = OpAccessChain %28 %102 
					                                     f32 %124 = OpLoad %123 
					                                   f32_3 %125 = OpCompositeConstruct %120 %122 %124 
					                                     f32 %126 = OpCompositeExtract %125 0 
					                                     f32 %127 = OpCompositeExtract %125 1 
					                                     f32 %128 = OpCompositeExtract %125 2 
					                                   f32_3 %129 = OpCompositeConstruct %126 %127 %128 
					                                   f32_3 %130 = OpLoad %96 
					                                   f32_3 %131 = OpFMul %129 %130 
					                                   f32_3 %132 = OpLoad %86 
					                                   f32_3 %133 = OpFAdd %131 %132 
					                                                  OpStore %118 %133 
					                            Private f32* %136 = OpAccessChain %107 %135 
					                                     f32 %137 = OpLoad %136 
					                            Private f32* %138 = OpAccessChain %107 %31 
					                                     f32 %139 = OpLoad %138 
					                                    bool %140 = OpFOrdGreaterThanEqual %137 %139 
					                                                  OpStore %134 %140 
					                                    bool %141 = OpLoad %134 
					                                     f32 %142 = OpSelect %141 %19 %35 
					                                                  OpStore %101 %142 
					                                   f32_4 %143 = OpLoad %107 
					                                   f32_2 %144 = OpVectorShuffle %143 %143 1 0 
					                                   f32_4 %145 = OpLoad %9 
					                                   f32_4 %146 = OpVectorShuffle %145 %144 4 5 2 3 
					                                                  OpStore %9 %146 
					                                   f32_4 %147 = OpLoad %9 
					                                   f32_2 %148 = OpVectorShuffle %147 %147 0 1 
					                                   f32_2 %149 = OpFNegate %148 
					                                   f32_4 %150 = OpLoad %107 
					                                   f32_2 %151 = OpVectorShuffle %150 %150 0 1 
					                                   f32_2 %152 = OpFAdd %149 %151 
					                                   f32_4 %153 = OpLoad %18 
					                                   f32_4 %154 = OpVectorShuffle %153 %152 4 5 2 3 
					                                                  OpStore %18 %154 
					                                     f32 %155 = OpLoad %101 
					                                   f32_4 %156 = OpCompositeConstruct %155 %155 %155 %155 
					                                   f32_4 %157 = OpLoad %18 
					                                   f32_4 %158 = OpFMul %156 %157 
					                                   f32_4 %159 = OpLoad %9 
					                                   f32_4 %160 = OpFAdd %158 %159 
					                                                  OpStore %9 %160 
					                            Private f32* %162 = OpAccessChain %107 %16 
					                                     f32 %163 = OpLoad %162 
					                            Private f32* %164 = OpAccessChain %9 %135 
					                                     f32 %165 = OpLoad %164 
					                                    bool %166 = OpFOrdGreaterThanEqual %163 %165 
					                                                  OpStore %161 %166 
					                                    bool %167 = OpLoad %161 
					                                     f32 %168 = OpSelect %167 %19 %35 
					                            Private f32* %169 = OpAccessChain %18 %135 
					                                                  OpStore %169 %168 
					                                   f32_4 %170 = OpLoad %9 
					                                   f32_3 %171 = OpVectorShuffle %170 %170 0 1 3 
					                                   f32_4 %172 = OpLoad %107 
					                                   f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
					                                                  OpStore %107 %173 
					                                   f32_4 %174 = OpLoad %107 
					                                   f32_3 %175 = OpVectorShuffle %174 %174 3 1 0 
					                                   f32_4 %176 = OpLoad %9 
					                                   f32_4 %177 = OpVectorShuffle %176 %175 4 5 2 6 
					                                                  OpStore %9 %177 
					                                   f32_4 %178 = OpLoad %107 
					                                   f32_4 %179 = OpFNegate %178 
					                                   f32_4 %180 = OpLoad %9 
					                                   f32_4 %181 = OpFAdd %179 %180 
					                                                  OpStore %9 %181 
					                                   f32_4 %182 = OpLoad %18 
					                                   f32_4 %183 = OpVectorShuffle %182 %182 0 0 0 0 
					                                   f32_4 %184 = OpLoad %9 
					                                   f32_4 %185 = OpFMul %183 %184 
					                                   f32_4 %186 = OpLoad %107 
					                                   f32_4 %187 = OpFAdd %185 %186 
					                                                  OpStore %9 %187 
					                            Private f32* %188 = OpAccessChain %9 %31 
					                                     f32 %189 = OpLoad %188 
					                            Private f32* %190 = OpAccessChain %9 %16 
					                                     f32 %191 = OpLoad %190 
					                                     f32 %192 = OpExtInst %1 37 %189 %191 
					                            Private f32* %193 = OpAccessChain %18 %135 
					                                                  OpStore %193 %192 
					                            Private f32* %194 = OpAccessChain %9 %135 
					                                     f32 %195 = OpLoad %194 
					                            Private f32* %196 = OpAccessChain %18 %135 
					                                     f32 %197 = OpLoad %196 
					                                     f32 %198 = OpFNegate %197 
					                                     f32 %199 = OpFAdd %195 %198 
					                            Private f32* %200 = OpAccessChain %18 %135 
					                                                  OpStore %200 %199 
					                            Private f32* %201 = OpAccessChain %18 %135 
					                                     f32 %202 = OpLoad %201 
					                                     f32 %204 = OpFMul %202 %203 
					                                     f32 %206 = OpFAdd %204 %205 
					                            Private f32* %207 = OpAccessChain %18 %135 
					                                                  OpStore %207 %206 
					                            Private f32* %209 = OpAccessChain %9 %31 
					                                     f32 %210 = OpLoad %209 
					                                     f32 %211 = OpFNegate %210 
					                            Private f32* %212 = OpAccessChain %9 %16 
					                                     f32 %213 = OpLoad %212 
					                                     f32 %214 = OpFAdd %211 %213 
					                            Private f32* %215 = OpAccessChain %208 %135 
					                                                  OpStore %215 %214 
					                            Private f32* %216 = OpAccessChain %208 %135 
					                                     f32 %217 = OpLoad %216 
					                            Private f32* %218 = OpAccessChain %18 %135 
					                                     f32 %219 = OpLoad %218 
					                                     f32 %220 = OpFDiv %217 %219 
					                            Private f32* %221 = OpAccessChain %208 %135 
					                                                  OpStore %221 %220 
					                            Private f32* %222 = OpAccessChain %208 %135 
					                                     f32 %223 = OpLoad %222 
					                            Private f32* %224 = OpAccessChain %9 %12 
					                                     f32 %225 = OpLoad %224 
					                                     f32 %226 = OpFAdd %223 %225 
					                            Private f32* %227 = OpAccessChain %208 %135 
					                                                  OpStore %227 %226 
					                                   f32_3 %228 = OpLoad %208 
					                                   f32_3 %229 = OpVectorShuffle %228 %228 0 0 0 
					                                   f32_3 %230 = OpExtInst %1 4 %229 
					                                   f32_3 %233 = OpFAdd %230 %232 
					                                                  OpStore %208 %233 
					                                   f32_3 %234 = OpLoad %208 
					                                   f32_3 %235 = OpExtInst %1 10 %234 
					                                                  OpStore %208 %235 
					                                   f32_3 %236 = OpLoad %208 
					                                   f32_3 %238 = OpFMul %236 %237 
					                                   f32_3 %241 = OpFAdd %238 %240 
					                                                  OpStore %208 %241 
					                                   f32_3 %242 = OpLoad %208 
					                                   f32_3 %243 = OpExtInst %1 4 %242 
					                                   f32_3 %245 = OpFAdd %243 %244 
					                                                  OpStore %208 %245 
					                                   f32_3 %246 = OpLoad %208 
					                                   f32_3 %247 = OpCompositeConstruct %35 %35 %35 
					                                   f32_3 %248 = OpCompositeConstruct %19 %19 %19 
					                                   f32_3 %249 = OpExtInst %1 43 %246 %247 %248 
					                                                  OpStore %208 %249 
					                                   f32_3 %250 = OpLoad %208 
					                                   f32_3 %251 = OpFAdd %250 %244 
					                                                  OpStore %208 %251 
					                            Private f32* %252 = OpAccessChain %118 %31 
					                                     f32 %253 = OpLoad %252 
					                            Private f32* %254 = OpAccessChain %118 %12 
					                                     f32 %255 = OpLoad %254 
					                                    bool %256 = OpFOrdGreaterThanEqual %253 %255 
					                                                  OpStore %161 %256 
					                                    bool %257 = OpLoad %161 
					                                     f32 %258 = OpSelect %257 %19 %35 
					                            Private f32* %259 = OpAccessChain %18 %135 
					                                                  OpStore %259 %258 
					                                   f32_3 %262 = OpLoad %118 
					                                   f32_2 %263 = OpVectorShuffle %262 %262 2 1 
					                                   f32_2 %264 = OpFNegate %263 
					                                   f32_3 %265 = OpLoad %118 
					                                   f32_2 %266 = OpVectorShuffle %265 %265 1 2 
					                                   f32_2 %267 = OpFAdd %264 %266 
					                                                  OpStore %261 %267 
					                                   f32_4 %268 = OpLoad %18 
					                                   f32_2 %269 = OpVectorShuffle %268 %268 0 0 
					                                   f32_2 %270 = OpLoad %261 
					                                   f32_2 %271 = OpFMul %269 %270 
					                                   f32_3 %272 = OpLoad %118 
					                                   f32_2 %273 = OpVectorShuffle %272 %272 2 1 
					                                   f32_2 %274 = OpFAdd %271 %273 
					                                   f32_4 %275 = OpLoad %18 
					                                   f32_4 %276 = OpVectorShuffle %275 %274 4 5 2 3 
					                                                  OpStore %18 %276 
					                            Private f32* %278 = OpAccessChain %118 %135 
					                                     f32 %279 = OpLoad %278 
					                            Private f32* %280 = OpAccessChain %18 %135 
					                                     f32 %281 = OpLoad %280 
					                                    bool %282 = OpFOrdGreaterThanEqual %279 %281 
					                                                  OpStore %277 %282 
					                                    bool %284 = OpLoad %277 
					                                     f32 %285 = OpSelect %284 %19 %35 
					                                                  OpStore %283 %285 
					                            Private f32* %286 = OpAccessChain %118 %135 
					                                     f32 %287 = OpLoad %286 
					                            Private f32* %288 = OpAccessChain %18 %12 
					                                                  OpStore %288 %287 
					                                   f32_4 %289 = OpLoad %18 
					                                   f32_3 %290 = OpVectorShuffle %289 %289 0 1 2 
					                                   f32_3 %291 = OpFNegate %290 
					                                   f32_4 %292 = OpLoad %18 
					                                   f32_3 %293 = OpVectorShuffle %292 %292 2 1 0 
					                                   f32_3 %294 = OpFAdd %291 %293 
					                                                  OpStore %39 %294 
					                                     f32 %295 = OpLoad %283 
					                                   f32_3 %296 = OpCompositeConstruct %295 %295 %295 
					                                   f32_3 %297 = OpLoad %39 
					                                   f32_3 %298 = OpFMul %296 %297 
					                                   f32_4 %299 = OpLoad %18 
					                                   f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
					                                   f32_3 %301 = OpFAdd %298 %300 
					                                   f32_4 %302 = OpLoad %18 
					                                   f32_4 %303 = OpVectorShuffle %302 %301 4 5 6 3 
					                                                  OpStore %18 %303 
					                            Private f32* %304 = OpAccessChain %18 %31 
					                                     f32 %305 = OpLoad %304 
					                            Private f32* %306 = OpAccessChain %18 %12 
					                                     f32 %307 = OpLoad %306 
					                                     f32 %308 = OpExtInst %1 37 %305 %307 
					                            Private f32* %309 = OpAccessChain %261 %135 
					                                                  OpStore %309 %308 
					                            Private f32* %310 = OpAccessChain %261 %135 
					                                     f32 %311 = OpLoad %310 
					                                     f32 %312 = OpFNegate %311 
					                            Private f32* %313 = OpAccessChain %18 %135 
					                                     f32 %314 = OpLoad %313 
					                                     f32 %315 = OpFAdd %312 %314 
					                            Private f32* %316 = OpAccessChain %261 %135 
					                                                  OpStore %316 %315 
					                            Private f32* %317 = OpAccessChain %18 %135 
					                                     f32 %318 = OpLoad %317 
					                                     f32 %319 = OpFAdd %318 %205 
					                            Private f32* %320 = OpAccessChain %18 %135 
					                                                  OpStore %320 %319 
					                            Private f32* %321 = OpAccessChain %261 %135 
					                                     f32 %322 = OpLoad %321 
					                            Private f32* %323 = OpAccessChain %18 %135 
					                                     f32 %324 = OpLoad %323 
					                                     f32 %325 = OpFDiv %322 %324 
					                            Private f32* %326 = OpAccessChain %18 %135 
					                                                  OpStore %326 %325 
					                                   f32_4 %327 = OpLoad %18 
					                                   f32_3 %328 = OpVectorShuffle %327 %327 0 0 0 
					                                   f32_3 %329 = OpLoad %208 
					                                   f32_3 %330 = OpFMul %328 %329 
					                                   f32_3 %332 = OpFAdd %330 %331 
					                                                  OpStore %208 %332 
					                                   f32_4 %333 = OpLoad %9 
					                                   f32_3 %334 = OpVectorShuffle %333 %333 0 0 0 
					                                   f32_3 %335 = OpLoad %208 
					                                   f32_3 %336 = OpFMul %334 %335 
					                                   f32_3 %337 = OpLoad %118 
					                                   f32_3 %338 = OpFNegate %337 
					                                   f32_3 %339 = OpFAdd %336 %338 
					                                   f32_4 %340 = OpLoad %9 
					                                   f32_4 %341 = OpVectorShuffle %340 %339 4 5 6 3 
					                                                  OpStore %9 %341 
					                            Uniform f32* %345 = OpAccessChain %28 %344 
					                                     f32 %346 = OpLoad %345 
					                            Uniform f32* %347 = OpAccessChain %28 %344 
					                                     f32 %348 = OpLoad %347 
					                            Uniform f32* %349 = OpAccessChain %28 %344 
					                                     f32 %350 = OpLoad %349 
					                                   f32_3 %351 = OpCompositeConstruct %346 %348 %350 
					                                     f32 %352 = OpCompositeExtract %351 0 
					                                     f32 %353 = OpCompositeExtract %351 1 
					                                     f32 %354 = OpCompositeExtract %351 2 
					                                   f32_3 %355 = OpCompositeConstruct %352 %353 %354 
					                                   f32_4 %356 = OpLoad %9 
					                                   f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
					                                   f32_3 %358 = OpFMul %355 %357 
					                                   f32_3 %359 = OpLoad %118 
					                                   f32_3 %360 = OpFAdd %358 %359 
					                                   f32_4 %361 = OpLoad %343 
					                                   f32_4 %362 = OpVectorShuffle %361 %360 4 5 6 3 
					                                                  OpStore %343 %362 
					                             Output f32* %364 = OpAccessChain %343 %16 
					                                                  OpStore %364 %19 
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
					bool u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					bool u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec2 u_xlat6;
					float u_xlat7;
					float u_xlat16;
					bool u_xlatb16;
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
					    u_xlat17 = (-_Value2) + 1.0;
					    u_xlat4.xyw = vec3(u_xlat17) * u_xlat16_2.yzx + u_xlat10_3.yzx;
					    u_xlat2.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlatb17 = u_xlat4.x>=u_xlat4.y;
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.xy = u_xlat4.yx;
					    u_xlat1.xy = (-u_xlat0.xy) + u_xlat4.xy;
					    u_xlat0 = vec4(u_xlat17) * u_xlat1 + u_xlat0;
					    u_xlatb1 = u_xlat4.w>=u_xlat0.x;
					    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat4.xyz = u_xlat0.xyw;
					    u_xlat0.xyw = u_xlat4.wyx;
					    u_xlat0 = (-u_xlat4) + u_xlat0;
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat4;
					    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
					    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 6.0 + 1.00000001e-10;
					    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
					    u_xlat5.x = u_xlat5.x / u_xlat1.x;
					    u_xlat5.x = u_xlat5.x + u_xlat0.z;
					    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
					    u_xlat5.xyz = fract(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
					    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
					    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlatb1 = u_xlat2.y>=u_xlat2.z;
					    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat6.xy = (-u_xlat2.zy) + u_xlat2.yz;
					    u_xlat1.xy = u_xlat1.xx * u_xlat6.xy + u_xlat2.zy;
					    u_xlatb16 = u_xlat2.x>=u_xlat1.x;
					    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
					    u_xlat1.z = u_xlat2.x;
					    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat1.zyx;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat3.xyz + u_xlat1.xyz;
					    u_xlat6.x = min(u_xlat1.y, u_xlat1.z);
					    u_xlat6.x = (-u_xlat6.x) + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x + 1.00000001e-10;
					    u_xlat1.x = u_xlat6.x / u_xlat1.x;
					    u_xlat5.xyz = u_xlat1.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + (-u_xlat2.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat2.xyz;
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