Shader "CameraFilterPack/Colors_Adjust_FullColors" {
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
			GpuProgramID 4726
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
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.x = _Blue_R;
					    u_xlat0.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.x = dot(u_xlat10_1.xyz, u_xlat0.xyz);
					    SV_Target0.z = u_xlat0.x + _Blue_C;
					    SV_Target0.w = 1.0;
					    u_xlat0.x = dot(u_xlat10_1.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat0.y = dot(u_xlat10_1.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    SV_Target0.xy = u_xlat0.xy + vec2(_Red_C, _Green_C);
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
					; Bound: 120
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %36 %67 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpMemberDecorate %11 5 Offset 11 
					                                                      OpMemberDecorate %11 6 Offset 11 
					                                                      OpMemberDecorate %11 7 Offset 11 
					                                                      OpMemberDecorate %11 8 Offset 11 
					                                                      OpMemberDecorate %11 9 Offset 11 
					                                                      OpMemberDecorate %11 10 Offset 11 
					                                                      OpMemberDecorate %11 11 Offset 11 
					                                                      OpMemberDecorate %11 12 RelaxedPrecision 
					                                                      OpMemberDecorate %11 12 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 36 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %45 RelaxedPrecision 
					                                                      OpDecorate %46 RelaxedPrecision 
					                                                      OpDecorate %48 RelaxedPrecision 
					                                                      OpDecorate %51 RelaxedPrecision 
					                                                      OpDecorate %51 DescriptorSet 51 
					                                                      OpDecorate %51 Binding 51 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %55 RelaxedPrecision 
					                                                      OpDecorate %55 DescriptorSet 55 
					                                                      OpDecorate %55 Binding 55 
					                                                      OpDecorate %56 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %67 Location 67 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 6 
					                                              %16 = OpTypePointer Uniform %6 
					                                              %19 = OpTypeInt 32 0 
					                                          u32 %20 = OpConstant 0 
					                                              %21 = OpTypePointer Private %6 
					                                          i32 %23 = OpConstant 7 
					                                          i32 %26 = OpConstant 8 
					                                              %29 = OpTypeVector %6 2 
					                                              %33 = OpTypePointer Private %29 
					                               Private f32_2* %34 = OpVariable Private 
					                                              %35 = OpTypePointer Input %29 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %38 = OpConstant 12 
					                                              %39 = OpTypePointer Uniform %10 
					                               Private f32_3* %48 = OpVariable Private 
					                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %50 = OpTypePointer UniformConstant %49 
					         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
					                                              %53 = OpTypeSampler 
					                                              %54 = OpTypePointer UniformConstant %53 
					                     UniformConstant sampler* %55 = OpVariable UniformConstant 
					                                              %57 = OpTypeSampledImage %49 
					                                              %66 = OpTypePointer Output %10 
					                                Output f32_4* %67 = OpVariable Output 
					                                          i32 %70 = OpConstant 11 
					                                          u32 %74 = OpConstant 2 
					                                              %75 = OpTypePointer Output %6 
					                                          f32 %77 = OpConstant 3,674022E-40 
					                                          u32 %78 = OpConstant 3 
					                                          i32 %81 = OpConstant 0 
					                                          i32 %84 = OpConstant 1 
					                                          i32 %87 = OpConstant 2 
					                                          i32 %94 = OpConstant 3 
					                                          i32 %97 = OpConstant 4 
					                                         i32 %100 = OpConstant 5 
					                                         u32 %105 = OpConstant 1 
					                                         i32 %109 = OpConstant 9 
					                                         i32 %112 = OpConstant 10 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %17 = OpAccessChain %13 %15 
					                                          f32 %18 = OpLoad %17 
					                                 Private f32* %22 = OpAccessChain %9 %20 
					                                                      OpStore %22 %18 
					                                 Uniform f32* %24 = OpAccessChain %13 %23 
					                                          f32 %25 = OpLoad %24 
					                                 Uniform f32* %27 = OpAccessChain %13 %26 
					                                          f32 %28 = OpLoad %27 
					                                        f32_2 %30 = OpCompositeConstruct %25 %28 
					                                        f32_3 %31 = OpLoad %9 
					                                        f32_3 %32 = OpVectorShuffle %31 %30 0 3 4 
					                                                      OpStore %9 %32 
					                                        f32_2 %37 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %40 = OpAccessChain %13 %38 
					                                        f32_4 %41 = OpLoad %40 
					                                        f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                                        f32_2 %43 = OpFMul %37 %42 
					                               Uniform f32_4* %44 = OpAccessChain %13 %38 
					                                        f32_4 %45 = OpLoad %44 
					                                        f32_2 %46 = OpVectorShuffle %45 %45 2 3 
					                                        f32_2 %47 = OpFAdd %43 %46 
					                                                      OpStore %34 %47 
					                          read_only Texture2D %52 = OpLoad %51 
					                                      sampler %56 = OpLoad %55 
					                   read_only Texture2DSampled %58 = OpSampledImage %52 %56 
					                                        f32_2 %59 = OpLoad %34 
					                                        f32_4 %60 = OpImageSampleImplicitLod %58 %59 
					                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
					                                                      OpStore %48 %61 
					                                        f32_3 %62 = OpLoad %48 
					                                        f32_3 %63 = OpLoad %9 
					                                          f32 %64 = OpDot %62 %63 
					                                 Private f32* %65 = OpAccessChain %9 %20 
					                                                      OpStore %65 %64 
					                                 Private f32* %68 = OpAccessChain %9 %20 
					                                          f32 %69 = OpLoad %68 
					                                 Uniform f32* %71 = OpAccessChain %13 %70 
					                                          f32 %72 = OpLoad %71 
					                                          f32 %73 = OpFAdd %69 %72 
					                                  Output f32* %76 = OpAccessChain %67 %74 
					                                                      OpStore %76 %73 
					                                  Output f32* %79 = OpAccessChain %67 %78 
					                                                      OpStore %79 %77 
					                                        f32_3 %80 = OpLoad %48 
					                                 Uniform f32* %82 = OpAccessChain %13 %81 
					                                          f32 %83 = OpLoad %82 
					                                 Uniform f32* %85 = OpAccessChain %13 %84 
					                                          f32 %86 = OpLoad %85 
					                                 Uniform f32* %88 = OpAccessChain %13 %87 
					                                          f32 %89 = OpLoad %88 
					                                        f32_3 %90 = OpCompositeConstruct %83 %86 %89 
					                                          f32 %91 = OpDot %80 %90 
					                                 Private f32* %92 = OpAccessChain %9 %20 
					                                                      OpStore %92 %91 
					                                        f32_3 %93 = OpLoad %48 
					                                 Uniform f32* %95 = OpAccessChain %13 %94 
					                                          f32 %96 = OpLoad %95 
					                                 Uniform f32* %98 = OpAccessChain %13 %97 
					                                          f32 %99 = OpLoad %98 
					                                Uniform f32* %101 = OpAccessChain %13 %100 
					                                         f32 %102 = OpLoad %101 
					                                       f32_3 %103 = OpCompositeConstruct %96 %99 %102 
					                                         f32 %104 = OpDot %93 %103 
					                                Private f32* %106 = OpAccessChain %9 %105 
					                                                      OpStore %106 %104 
					                                       f32_3 %107 = OpLoad %9 
					                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
					                                Uniform f32* %110 = OpAccessChain %13 %109 
					                                         f32 %111 = OpLoad %110 
					                                Uniform f32* %113 = OpAccessChain %13 %112 
					                                         f32 %114 = OpLoad %113 
					                                       f32_2 %115 = OpCompositeConstruct %111 %114 
					                                       f32_2 %116 = OpFAdd %108 %115 
					                                       f32_4 %117 = OpLoad %67 
					                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 2 3 
					                                                      OpStore %67 %118 
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
						float _Red_R;
						float _Red_G;
						float _Red_B;
						float _Green_R;
						float _Green_G;
						float _Green_B;
						float _Blue_R;
						float _Blue_G;
						float _Blue_B;
						float _Red_C;
						float _Green_C;
						float _Blue_C;
						vec4 unused_0_13;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.x = _Blue_R;
					    u_xlat0.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.x = dot(u_xlat10_1.xyz, u_xlat0.xyz);
					    SV_Target0.z = u_xlat0.x + _Blue_C;
					    SV_Target0.w = 1.0;
					    u_xlat0.x = dot(u_xlat10_1.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat0.y = dot(u_xlat10_1.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    SV_Target0.xy = u_xlat0.xy + vec2(_Red_C, _Green_C);
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