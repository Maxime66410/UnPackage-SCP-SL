Shader "CameraFilterPack/Distortion_BlackHole" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_Distortion2 ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_PositionX ("_PositionX", Range(-1, 1)) = 1.5
		_PositionY ("_PositionY", Range(-1, 1)) = 30
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 62552
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
					uniform 	float _Distortion;
					uniform 	vec4 _ScreenResolution;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _PositionX * 0.5 + 0.5;
					    u_xlat0.z = (-_PositionY) * 0.5 + 0.5;
					    u_xlat0.xy = u_xlat0.xz * _ScreenResolution.xy;
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = (-u_xlat4.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xx * vec2(0.00499999989, 0.00200000009) + (-vec2(vec2(_Distortion, _Distortion)));
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat0.y) + 1.0;
					    u_xlat0.x = (-u_xlat2.x) + u_xlat0.x;
					    u_xlat2.x = (-u_xlat0.x) + 1.0;
					    u_xlat2.xy = u_xlat2.xx + u_xlat4.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    SV_Target0 = u_xlat0.xxxx * u_xlat10_1;
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
					; Bound: 152
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %48 %146 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 RelaxedPrecision 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 48 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %53 RelaxedPrecision 
					                                                      OpDecorate %56 RelaxedPrecision 
					                                                      OpDecorate %57 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %135 DescriptorSet 135 
					                                                      OpDecorate %135 Binding 135 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %139 DescriptorSet 139 
					                                                      OpDecorate %139 Binding 139 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %146 Location 146 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %6 %10 %6 %6 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32_4; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 2 
					                                              %16 = OpTypePointer Uniform %6 
					                                          f32 %19 = OpConstant 3,674022E-40 
					                                              %22 = OpTypeInt 32 0 
					                                          u32 %23 = OpConstant 0 
					                                              %24 = OpTypePointer Private %6 
					                                          i32 %26 = OpConstant 3 
					                                          u32 %32 = OpConstant 2 
					                                              %34 = OpTypeVector %6 2 
					                                          i32 %37 = OpConstant 1 
					                                              %38 = OpTypePointer Uniform %10 
					                                              %45 = OpTypePointer Private %34 
					                               Private f32_2* %46 = OpVariable Private 
					                                              %47 = OpTypePointer Input %34 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %50 = OpConstant 4 
					                                          f32 %82 = OpConstant 3,674022E-40 
					                                          f32 %83 = OpConstant 3,674022E-40 
					                                        f32_2 %84 = OpConstantComposite %82 %83 
					                                          i32 %86 = OpConstant 0 
					                                         f32 %101 = OpConstant 3,674022E-40 
					                                         f32 %102 = OpConstant 3,674022E-40 
					                              Private f32_2* %108 = OpVariable Private 
					                                         u32 %109 = OpConstant 1 
					                                             %131 = OpTypePointer Private %10 
					                              Private f32_4* %132 = OpVariable Private 
					                                             %133 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %134 = OpTypePointer UniformConstant %133 
					        UniformConstant read_only Texture2D* %135 = OpVariable UniformConstant 
					                                             %137 = OpTypeSampler 
					                                             %138 = OpTypePointer UniformConstant %137 
					                    UniformConstant sampler* %139 = OpVariable UniformConstant 
					                                             %141 = OpTypeSampledImage %133 
					                                             %145 = OpTypePointer Output %10 
					                               Output f32_4* %146 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %17 = OpAccessChain %13 %15 
					                                          f32 %18 = OpLoad %17 
					                                          f32 %20 = OpFMul %18 %19 
					                                          f32 %21 = OpFAdd %20 %19 
					                                 Private f32* %25 = OpAccessChain %9 %23 
					                                                      OpStore %25 %21 
					                                 Uniform f32* %27 = OpAccessChain %13 %26 
					                                          f32 %28 = OpLoad %27 
					                                          f32 %29 = OpFNegate %28 
					                                          f32 %30 = OpFMul %29 %19 
					                                          f32 %31 = OpFAdd %30 %19 
					                                 Private f32* %33 = OpAccessChain %9 %32 
					                                                      OpStore %33 %31 
					                                        f32_3 %35 = OpLoad %9 
					                                        f32_2 %36 = OpVectorShuffle %35 %35 0 2 
					                               Uniform f32_4* %39 = OpAccessChain %13 %37 
					                                        f32_4 %40 = OpLoad %39 
					                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
					                                        f32_2 %42 = OpFMul %36 %41 
					                                        f32_3 %43 = OpLoad %9 
					                                        f32_3 %44 = OpVectorShuffle %43 %42 3 4 2 
					                                                      OpStore %9 %44 
					                                        f32_2 %49 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %51 = OpAccessChain %13 %50 
					                                        f32_4 %52 = OpLoad %51 
					                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
					                                        f32_2 %54 = OpFMul %49 %53 
					                               Uniform f32_4* %55 = OpAccessChain %13 %50 
					                                        f32_4 %56 = OpLoad %55 
					                                        f32_2 %57 = OpVectorShuffle %56 %56 2 3 
					                                        f32_2 %58 = OpFAdd %54 %57 
					                                                      OpStore %46 %58 
					                                        f32_2 %59 = OpLoad %46 
					                                        f32_2 %60 = OpFNegate %59 
					                               Uniform f32_4* %61 = OpAccessChain %13 %37 
					                                        f32_4 %62 = OpLoad %61 
					                                        f32_2 %63 = OpVectorShuffle %62 %62 0 1 
					                                        f32_2 %64 = OpFMul %60 %63 
					                                        f32_3 %65 = OpLoad %9 
					                                        f32_2 %66 = OpVectorShuffle %65 %65 0 1 
					                                        f32_2 %67 = OpFAdd %64 %66 
					                                        f32_3 %68 = OpLoad %9 
					                                        f32_3 %69 = OpVectorShuffle %68 %67 3 4 2 
					                                                      OpStore %9 %69 
					                                        f32_3 %70 = OpLoad %9 
					                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
					                                        f32_3 %72 = OpLoad %9 
					                                        f32_2 %73 = OpVectorShuffle %72 %72 0 1 
					                                          f32 %74 = OpDot %71 %73 
					                                 Private f32* %75 = OpAccessChain %9 %23 
					                                                      OpStore %75 %74 
					                                 Private f32* %76 = OpAccessChain %9 %23 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpExtInst %1 31 %77 
					                                 Private f32* %79 = OpAccessChain %9 %23 
					                                                      OpStore %79 %78 
					                                        f32_3 %80 = OpLoad %9 
					                                        f32_2 %81 = OpVectorShuffle %80 %80 0 0 
					                                        f32_2 %85 = OpFMul %81 %84 
					                                 Uniform f32* %87 = OpAccessChain %13 %86 
					                                          f32 %88 = OpLoad %87 
					                                 Uniform f32* %89 = OpAccessChain %13 %86 
					                                          f32 %90 = OpLoad %89 
					                                        f32_2 %91 = OpCompositeConstruct %88 %90 
					                                          f32 %92 = OpCompositeExtract %91 0 
					                                          f32 %93 = OpCompositeExtract %91 1 
					                                        f32_2 %94 = OpCompositeConstruct %92 %93 
					                                        f32_2 %95 = OpFNegate %94 
					                                        f32_2 %96 = OpFAdd %85 %95 
					                                        f32_3 %97 = OpLoad %9 
					                                        f32_3 %98 = OpVectorShuffle %97 %96 3 4 2 
					                                                      OpStore %9 %98 
					                                        f32_3 %99 = OpLoad %9 
					                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
					                                       f32_2 %103 = OpCompositeConstruct %101 %101 
					                                       f32_2 %104 = OpCompositeConstruct %102 %102 
					                                       f32_2 %105 = OpExtInst %1 43 %100 %103 %104 
					                                       f32_3 %106 = OpLoad %9 
					                                       f32_3 %107 = OpVectorShuffle %106 %105 3 4 2 
					                                                      OpStore %9 %107 
					                                Private f32* %110 = OpAccessChain %9 %109 
					                                         f32 %111 = OpLoad %110 
					                                         f32 %112 = OpFNegate %111 
					                                         f32 %113 = OpFAdd %112 %102 
					                                Private f32* %114 = OpAccessChain %108 %23 
					                                                      OpStore %114 %113 
					                                Private f32* %115 = OpAccessChain %108 %23 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFNegate %116 
					                                Private f32* %118 = OpAccessChain %9 %23 
					                                         f32 %119 = OpLoad %118 
					                                         f32 %120 = OpFAdd %117 %119 
					                                Private f32* %121 = OpAccessChain %9 %23 
					                                                      OpStore %121 %120 
					                                Private f32* %122 = OpAccessChain %9 %23 
					                                         f32 %123 = OpLoad %122 
					                                         f32 %124 = OpFNegate %123 
					                                         f32 %125 = OpFAdd %124 %102 
					                                Private f32* %126 = OpAccessChain %108 %23 
					                                                      OpStore %126 %125 
					                                       f32_2 %127 = OpLoad %108 
					                                       f32_2 %128 = OpVectorShuffle %127 %127 0 0 
					                                       f32_2 %129 = OpLoad %46 
					                                       f32_2 %130 = OpFAdd %128 %129 
					                                                      OpStore %108 %130 
					                         read_only Texture2D %136 = OpLoad %135 
					                                     sampler %140 = OpLoad %139 
					                  read_only Texture2DSampled %142 = OpSampledImage %136 %140 
					                                       f32_2 %143 = OpLoad %108 
					                                       f32_4 %144 = OpImageSampleImplicitLod %142 %143 
					                                                      OpStore %132 %144 
					                                       f32_3 %147 = OpLoad %9 
					                                       f32_4 %148 = OpVectorShuffle %147 %147 0 0 0 0 
					                                       f32_4 %149 = OpLoad %132 
					                                       f32_4 %150 = OpFMul %148 %149 
					                                                      OpStore %146 %150 
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
						float _Distortion;
						vec4 _ScreenResolution;
						float _PositionX;
						float _PositionY;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _PositionX * 0.5 + 0.5;
					    u_xlat0.z = (-_PositionY) * 0.5 + 0.5;
					    u_xlat0.xy = u_xlat0.xz * _ScreenResolution.xy;
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = (-u_xlat4.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xx * vec2(0.00499999989, 0.00200000009) + (-vec2(vec2(_Distortion, _Distortion)));
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat0.y) + 1.0;
					    u_xlat0.x = (-u_xlat2.x) + u_xlat0.x;
					    u_xlat2.x = (-u_xlat0.x) + 1.0;
					    u_xlat2.xy = u_xlat2.xx + u_xlat4.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    SV_Target0 = u_xlat0.xxxx * u_xlat10_1;
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