Shader "CameraFilterPack/Drawing_Manga3" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_DotSize ("_DotSize", Range(0, 1)) = 0
		_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 30485
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
					uniform 	float _DotSize;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 1.66666663;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat2.xy * vec2(0.707106411, 0.707106411);
					    u_xlat6 = u_xlat2.x * 0.707106411 + (-u_xlat1.y);
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat1.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat6 = cos(u_xlat1.x);
					    u_xlat6 = u_xlat6 * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.x * 0.25 + u_xlat6;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat0.xyz = (-u_xlat0.xxx) * vec3(0.5, 0.5, 0.5) + u_xlat10_1.xyz;
					    u_xlat6 = _DotSize * 0.125 + -0.200000018;
					    u_xlat6 = u_xlat6 * -3.33333349;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat5 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat1.xyz = vec3(u_xlat5) * vec3(u_xlat6) + u_xlat10_1.xyy;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xzz;
					    u_xlatb6 = 0.300000012<u_xlat1.x;
					    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : u_xlat1.xyz;
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
					; Bound: 184
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %34 %168 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %12 0 Offset 12 
					                                              OpMemberDecorate %12 1 RelaxedPrecision 
					                                              OpMemberDecorate %12 1 Offset 12 
					                                              OpDecorate %12 Block 
					                                              OpDecorate %14 DescriptorSet 14 
					                                              OpDecorate %14 Binding 14 
					                                              OpDecorate vs_TEXCOORD0 Location 34 
					                                              OpDecorate %39 RelaxedPrecision 
					                                              OpDecorate %40 RelaxedPrecision 
					                                              OpDecorate %43 RelaxedPrecision 
					                                              OpDecorate %44 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %100 DescriptorSet 100 
					                                              OpDecorate %100 Binding 100 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %104 DescriptorSet 104 
					                                              OpDecorate %104 Binding 104 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %153 RelaxedPrecision 
					                                              OpDecorate %154 RelaxedPrecision 
					                                              OpDecorate %168 Location 168 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 3 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_3* %9 = OpVariable Private 
					                                  f32 %10 = OpConstant 3,674022E-40 
					                                      %11 = OpTypeVector %6 4 
					                                      %12 = OpTypeStruct %6 %11 
					                                      %13 = OpTypePointer Uniform %12 
					        Uniform struct {f32; f32_4;}* %14 = OpVariable Uniform 
					                                      %15 = OpTypeInt 32 1 
					                                  i32 %16 = OpConstant 0 
					                                      %17 = OpTypePointer Uniform %6 
					                                      %21 = OpTypeInt 32 0 
					                                  u32 %22 = OpConstant 0 
					                                      %23 = OpTypePointer Private %6 
					                                  f32 %27 = OpConstant 3,674022E-40 
					                                      %30 = OpTypeVector %6 2 
					                                      %31 = OpTypePointer Private %30 
					                       Private f32_2* %32 = OpVariable Private 
					                                      %33 = OpTypePointer Input %30 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                  i32 %36 = OpConstant 1 
					                                      %37 = OpTypePointer Uniform %11 
					                       Private f32_3* %46 = OpVariable Private 
					                                  f32 %48 = OpConstant 3,674022E-40 
					                                f32_2 %49 = OpConstantComposite %48 %48 
					                         Private f32* %53 = OpVariable Private 
					                                  u32 %57 = OpConstant 1 
					                                  f32 %87 = OpConstant 3,674022E-40 
					                                  f32 %89 = OpConstant 3,674022E-40 
					                       Private f32_3* %97 = OpVariable Private 
					                                      %98 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %99 = OpTypePointer UniformConstant %98 
					UniformConstant read_only Texture2D* %100 = OpVariable UniformConstant 
					                                     %102 = OpTypeSampler 
					                                     %103 = OpTypePointer UniformConstant %102 
					            UniformConstant sampler* %104 = OpVariable UniformConstant 
					                                     %106 = OpTypeSampledImage %98 
					                               f32_3 %114 = OpConstantComposite %89 %89 %89 
					                                 f32 %120 = OpConstant 3,674022E-40 
					                                 f32 %122 = OpConstant 3,674022E-40 
					                                 f32 %127 = OpConstant 3,674022E-40 
					                                 f32 %132 = OpConstant 3,674022E-40 
					                                 f32 %133 = OpConstant 3,674022E-40 
					                                 f32 %138 = OpConstant 3,674022E-40 
					                                 f32 %140 = OpConstant 3,674022E-40 
					                                     %160 = OpTypeBool 
					                                     %161 = OpTypePointer Private %160 
					                       Private bool* %162 = OpVariable Private 
					                                 f32 %163 = OpConstant 3,674022E-40 
					                                     %167 = OpTypePointer Output %11 
					                       Output f32_4* %168 = OpVariable Output 
					                                     %170 = OpTypePointer Function %7 
					                                 u32 %180 = OpConstant 3 
					                                     %181 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                     Function f32_3* %171 = OpVariable Function 
					                         Uniform f32* %18 = OpAccessChain %14 %16 
					                                  f32 %19 = OpLoad %18 
					                                  f32 %20 = OpFDiv %10 %19 
					                         Private f32* %24 = OpAccessChain %9 %22 
					                                              OpStore %24 %20 
					                         Private f32* %25 = OpAccessChain %9 %22 
					                                  f32 %26 = OpLoad %25 
					                                  f32 %28 = OpFMul %26 %27 
					                         Private f32* %29 = OpAccessChain %9 %22 
					                                              OpStore %29 %28 
					                                f32_2 %35 = OpLoad vs_TEXCOORD0 
					                       Uniform f32_4* %38 = OpAccessChain %14 %36 
					                                f32_4 %39 = OpLoad %38 
					                                f32_2 %40 = OpVectorShuffle %39 %39 0 1 
					                                f32_2 %41 = OpFMul %35 %40 
					                       Uniform f32_4* %42 = OpAccessChain %14 %36 
					                                f32_4 %43 = OpLoad %42 
					                                f32_2 %44 = OpVectorShuffle %43 %43 2 3 
					                                f32_2 %45 = OpFAdd %41 %44 
					                                              OpStore %32 %45 
					                                f32_2 %47 = OpLoad %32 
					                                f32_2 %50 = OpFMul %47 %49 
					                                f32_3 %51 = OpLoad %46 
					                                f32_3 %52 = OpVectorShuffle %51 %50 3 4 2 
					                                              OpStore %46 %52 
					                         Private f32* %54 = OpAccessChain %32 %22 
					                                  f32 %55 = OpLoad %54 
					                                  f32 %56 = OpFMul %55 %48 
					                         Private f32* %58 = OpAccessChain %46 %57 
					                                  f32 %59 = OpLoad %58 
					                                  f32 %60 = OpFNegate %59 
					                                  f32 %61 = OpFAdd %56 %60 
					                                              OpStore %53 %61 
					                         Private f32* %62 = OpAccessChain %46 %57 
					                                  f32 %63 = OpLoad %62 
					                         Private f32* %64 = OpAccessChain %46 %22 
					                                  f32 %65 = OpLoad %64 
					                                  f32 %66 = OpFAdd %63 %65 
					                         Private f32* %67 = OpAccessChain %46 %22 
					                                              OpStore %67 %66 
					                         Private f32* %68 = OpAccessChain %9 %22 
					                                  f32 %69 = OpLoad %68 
					                         Private f32* %70 = OpAccessChain %46 %22 
					                                  f32 %71 = OpLoad %70 
					                                  f32 %72 = OpFMul %69 %71 
					                         Private f32* %73 = OpAccessChain %46 %22 
					                                              OpStore %73 %72 
					                         Private f32* %74 = OpAccessChain %9 %22 
					                                  f32 %75 = OpLoad %74 
					                                  f32 %76 = OpLoad %53 
					                                  f32 %77 = OpFMul %75 %76 
					                         Private f32* %78 = OpAccessChain %9 %22 
					                                              OpStore %78 %77 
					                         Private f32* %79 = OpAccessChain %9 %22 
					                                  f32 %80 = OpLoad %79 
					                                  f32 %81 = OpExtInst %1 14 %80 
					                         Private f32* %82 = OpAccessChain %9 %22 
					                                              OpStore %82 %81 
					                         Private f32* %83 = OpAccessChain %46 %22 
					                                  f32 %84 = OpLoad %83 
					                                  f32 %85 = OpExtInst %1 14 %84 
					                                              OpStore %53 %85 
					                                  f32 %86 = OpLoad %53 
					                                  f32 %88 = OpFMul %86 %87 
					                                  f32 %90 = OpFAdd %88 %89 
					                                              OpStore %53 %90 
					                         Private f32* %91 = OpAccessChain %9 %22 
					                                  f32 %92 = OpLoad %91 
					                                  f32 %93 = OpFMul %92 %87 
					                                  f32 %94 = OpLoad %53 
					                                  f32 %95 = OpFAdd %93 %94 
					                         Private f32* %96 = OpAccessChain %9 %22 
					                                              OpStore %96 %95 
					                 read_only Texture2D %101 = OpLoad %100 
					                             sampler %105 = OpLoad %104 
					          read_only Texture2DSampled %107 = OpSampledImage %101 %105 
					                               f32_2 %108 = OpLoad %32 
					                               f32_4 %109 = OpImageSampleImplicitLod %107 %108 
					                               f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
					                                              OpStore %97 %110 
					                               f32_3 %111 = OpLoad %9 
					                               f32_3 %112 = OpVectorShuffle %111 %111 0 0 0 
					                               f32_3 %113 = OpFNegate %112 
					                               f32_3 %115 = OpFMul %113 %114 
					                               f32_3 %116 = OpLoad %97 
					                               f32_3 %117 = OpFAdd %115 %116 
					                                              OpStore %46 %117 
					                        Uniform f32* %118 = OpAccessChain %14 %16 
					                                 f32 %119 = OpLoad %118 
					                                 f32 %121 = OpFMul %119 %120 
					                                 f32 %123 = OpFAdd %121 %122 
					                        Private f32* %124 = OpAccessChain %9 %22 
					                                              OpStore %124 %123 
					                        Private f32* %125 = OpAccessChain %9 %22 
					                                 f32 %126 = OpLoad %125 
					                                 f32 %128 = OpFMul %126 %127 
					                        Private f32* %129 = OpAccessChain %9 %22 
					                                              OpStore %129 %128 
					                        Private f32* %130 = OpAccessChain %9 %22 
					                                 f32 %131 = OpLoad %130 
					                                 f32 %134 = OpExtInst %1 43 %131 %132 %133 
					                        Private f32* %135 = OpAccessChain %9 %22 
					                                              OpStore %135 %134 
					                        Private f32* %136 = OpAccessChain %9 %22 
					                                 f32 %137 = OpLoad %136 
					                                 f32 %139 = OpFMul %137 %138 
					                                 f32 %141 = OpFAdd %139 %140 
					                                              OpStore %53 %141 
					                        Private f32* %142 = OpAccessChain %9 %22 
					                                 f32 %143 = OpLoad %142 
					                        Private f32* %144 = OpAccessChain %9 %22 
					                                 f32 %145 = OpLoad %144 
					                                 f32 %146 = OpFMul %143 %145 
					                        Private f32* %147 = OpAccessChain %9 %22 
					                                              OpStore %147 %146 
					                                 f32 %148 = OpLoad %53 
					                               f32_3 %149 = OpCompositeConstruct %148 %148 %148 
					                               f32_3 %150 = OpLoad %9 
					                               f32_3 %151 = OpVectorShuffle %150 %150 0 0 0 
					                               f32_3 %152 = OpFMul %149 %151 
					                               f32_3 %153 = OpLoad %97 
					                               f32_3 %154 = OpVectorShuffle %153 %153 0 1 1 
					                               f32_3 %155 = OpFAdd %152 %154 
					                                              OpStore %9 %155 
					                               f32_3 %156 = OpLoad %46 
					                               f32_3 %157 = OpLoad %9 
					                               f32_3 %158 = OpVectorShuffle %157 %157 0 2 2 
					                               f32_3 %159 = OpFAdd %156 %158 
					                                              OpStore %46 %159 
					                        Private f32* %164 = OpAccessChain %9 %22 
					                                 f32 %165 = OpLoad %164 
					                                bool %166 = OpFOrdLessThan %163 %165 
					                                              OpStore %162 %166 
					                                bool %169 = OpLoad %162 
					                                              OpSelectionMerge %173 None 
					                                              OpBranchConditional %169 %172 %175 
					                                     %172 = OpLabel 
					                               f32_3 %174 = OpLoad %46 
					                                              OpStore %171 %174 
					                                              OpBranch %173 
					                                     %175 = OpLabel 
					                               f32_3 %176 = OpLoad %9 
					                                              OpStore %171 %176 
					                                              OpBranch %173 
					                                     %173 = OpLabel 
					                               f32_3 %177 = OpLoad %171 
					                               f32_4 %178 = OpLoad %168 
					                               f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
					                                              OpStore %168 %179 
					                         Output f32* %182 = OpAccessChain %168 %180 
					                                              OpStore %182 %133 
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
						vec4 unused_0_0[4];
						float _DotSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 1.66666663;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat2.xy * vec2(0.707106411, 0.707106411);
					    u_xlat6 = u_xlat2.x * 0.707106411 + (-u_xlat1.y);
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat1.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat6 = cos(u_xlat1.x);
					    u_xlat6 = u_xlat6 * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.x * 0.25 + u_xlat6;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat0.xyz = (-u_xlat0.xxx) * vec3(0.5, 0.5, 0.5) + u_xlat10_1.xyz;
					    u_xlat6 = _DotSize * 0.125 + -0.200000018;
					    u_xlat6 = u_xlat6 * -3.33333349;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat5 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat1.xyz = vec3(u_xlat5) * vec3(u_xlat6) + u_xlat10_1.xyy;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xzz;
					    u_xlatb6 = 0.300000012<u_xlat1.x;
					    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : u_xlat1.xyz;
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