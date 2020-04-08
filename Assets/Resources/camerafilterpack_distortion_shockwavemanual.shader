Shader "CameraFilterPack/Distortion_ShockWaveManual" {
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
			GpuProgramID 1587
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
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat0.xy + (-vec2(_Value, _Value2));
					    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + (-_Value3);
					    u_xlat4.x = u_xlat4.x * 10.0;
					    u_xlat4.x = log2(abs(u_xlat4.x));
					    u_xlat4.x = u_xlat4.x * 0.800000012;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat4.x = u_xlat4.x * _Value4;
					    u_xlat4.x = u_xlat4.x * 0.0199999996;
					    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
					    u_xlat0.xy = (-u_xlat4.xx) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat4.xxx + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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
					; Bound: 136
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %11 %121 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate vs_TEXCOORD0 Location 11 
					                                                     OpMemberDecorate %14 0 Offset 14 
					                                                     OpMemberDecorate %14 1 Offset 14 
					                                                     OpMemberDecorate %14 2 Offset 14 
					                                                     OpMemberDecorate %14 3 Offset 14 
					                                                     OpMemberDecorate %14 4 RelaxedPrecision 
					                                                     OpMemberDecorate %14 4 Offset 14 
					                                                     OpDecorate %14 Block 
					                                                     OpDecorate %16 DescriptorSet 16 
					                                                     OpDecorate %16 Binding 16 
					                                                     OpDecorate %21 RelaxedPrecision 
					                                                     OpDecorate %22 RelaxedPrecision 
					                                                     OpDecorate %25 RelaxedPrecision 
					                                                     OpDecorate %26 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %110 DescriptorSet 110 
					                                                     OpDecorate %110 Binding 110 
					                                                     OpDecorate %111 RelaxedPrecision 
					                                                     OpDecorate %114 RelaxedPrecision 
					                                                     OpDecorate %114 DescriptorSet 114 
					                                                     OpDecorate %114 Binding 114 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %121 Location 121 
					                                                     OpDecorate %125 RelaxedPrecision 
					                                                     OpDecorate %126 RelaxedPrecision 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 2 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_2* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                             %13 = OpTypeVector %6 4 
					                                             %14 = OpTypeStruct %6 %6 %6 %6 %13 
					                                             %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                             %17 = OpTypeInt 32 1 
					                                         i32 %18 = OpConstant 4 
					                                             %19 = OpTypePointer Uniform %13 
					                              Private f32_2* %28 = OpVariable Private 
					                                         i32 %30 = OpConstant 0 
					                                             %31 = OpTypePointer Uniform %6 
					                                         i32 %34 = OpConstant 1 
					                                             %43 = OpTypeInt 32 0 
					                                         u32 %44 = OpConstant 0 
					                                             %45 = OpTypePointer Private %6 
					                                         i32 %53 = OpConstant 2 
					                                         f32 %61 = OpConstant 3,674022E-40 
					                                         f32 %71 = OpConstant 3,674022E-40 
					                                         f32 %81 = OpConstant 3,674022E-40 
					                                         i32 %86 = OpConstant 3 
					                                         f32 %93 = OpConstant 3,674022E-40 
					                                         f32 %98 = OpConstant 3,674022E-40 
					                                            %106 = OpTypePointer Private %13 
					                             Private f32_4* %107 = OpVariable Private 
					                                            %108 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %109 = OpTypePointer UniformConstant %108 
					       UniformConstant read_only Texture2D* %110 = OpVariable UniformConstant 
					                                            %112 = OpTypeSampler 
					                                            %113 = OpTypePointer UniformConstant %112 
					                   UniformConstant sampler* %114 = OpVariable UniformConstant 
					                                            %116 = OpTypeSampledImage %108 
					                                            %120 = OpTypePointer Output %13 
					                              Output f32_4* %121 = OpVariable Output 
					                                            %122 = OpTypeVector %6 3 
					                                        u32 %130 = OpConstant 3 
					                                            %133 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
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
					                                       f32_2 %29 = OpLoad %9 
					                                Uniform f32* %32 = OpAccessChain %16 %30 
					                                         f32 %33 = OpLoad %32 
					                                Uniform f32* %35 = OpAccessChain %16 %34 
					                                         f32 %36 = OpLoad %35 
					                                       f32_2 %37 = OpCompositeConstruct %33 %36 
					                                       f32_2 %38 = OpFNegate %37 
					                                       f32_2 %39 = OpFAdd %29 %38 
					                                                     OpStore %28 %39 
					                                       f32_2 %40 = OpLoad %28 
					                                       f32_2 %41 = OpLoad %28 
					                                         f32 %42 = OpDot %40 %41 
					                                Private f32* %46 = OpAccessChain %28 %44 
					                                                     OpStore %46 %42 
					                                Private f32* %47 = OpAccessChain %28 %44 
					                                         f32 %48 = OpLoad %47 
					                                         f32 %49 = OpExtInst %1 31 %48 
					                                Private f32* %50 = OpAccessChain %28 %44 
					                                                     OpStore %50 %49 
					                                Private f32* %51 = OpAccessChain %28 %44 
					                                         f32 %52 = OpLoad %51 
					                                Uniform f32* %54 = OpAccessChain %16 %53 
					                                         f32 %55 = OpLoad %54 
					                                         f32 %56 = OpFNegate %55 
					                                         f32 %57 = OpFAdd %52 %56 
					                                Private f32* %58 = OpAccessChain %28 %44 
					                                                     OpStore %58 %57 
					                                Private f32* %59 = OpAccessChain %28 %44 
					                                         f32 %60 = OpLoad %59 
					                                         f32 %62 = OpFMul %60 %61 
					                                Private f32* %63 = OpAccessChain %28 %44 
					                                                     OpStore %63 %62 
					                                Private f32* %64 = OpAccessChain %28 %44 
					                                         f32 %65 = OpLoad %64 
					                                         f32 %66 = OpExtInst %1 4 %65 
					                                         f32 %67 = OpExtInst %1 30 %66 
					                                Private f32* %68 = OpAccessChain %28 %44 
					                                                     OpStore %68 %67 
					                                Private f32* %69 = OpAccessChain %28 %44 
					                                         f32 %70 = OpLoad %69 
					                                         f32 %72 = OpFMul %70 %71 
					                                Private f32* %73 = OpAccessChain %28 %44 
					                                                     OpStore %73 %72 
					                                Private f32* %74 = OpAccessChain %28 %44 
					                                         f32 %75 = OpLoad %74 
					                                         f32 %76 = OpExtInst %1 29 %75 
					                                Private f32* %77 = OpAccessChain %28 %44 
					                                                     OpStore %77 %76 
					                                Private f32* %78 = OpAccessChain %28 %44 
					                                         f32 %79 = OpLoad %78 
					                                         f32 %80 = OpFNegate %79 
					                                         f32 %82 = OpFAdd %80 %81 
					                                Private f32* %83 = OpAccessChain %28 %44 
					                                                     OpStore %83 %82 
					                                Private f32* %84 = OpAccessChain %28 %44 
					                                         f32 %85 = OpLoad %84 
					                                Uniform f32* %87 = OpAccessChain %16 %86 
					                                         f32 %88 = OpLoad %87 
					                                         f32 %89 = OpFMul %85 %88 
					                                Private f32* %90 = OpAccessChain %28 %44 
					                                                     OpStore %90 %89 
					                                Private f32* %91 = OpAccessChain %28 %44 
					                                         f32 %92 = OpLoad %91 
					                                         f32 %94 = OpFMul %92 %93 
					                                Private f32* %95 = OpAccessChain %28 %44 
					                                                     OpStore %95 %94 
					                                Private f32* %96 = OpAccessChain %28 %44 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %99 = OpExtInst %1 43 %97 %98 %81 
					                               Private f32* %100 = OpAccessChain %28 %44 
					                                                     OpStore %100 %99 
					                                      f32_2 %101 = OpLoad %28 
					                                      f32_2 %102 = OpVectorShuffle %101 %101 0 0 
					                                      f32_2 %103 = OpFNegate %102 
					                                      f32_2 %104 = OpLoad %9 
					                                      f32_2 %105 = OpFAdd %103 %104 
					                                                     OpStore %9 %105 
					                        read_only Texture2D %111 = OpLoad %110 
					                                    sampler %115 = OpLoad %114 
					                 read_only Texture2DSampled %117 = OpSampledImage %111 %115 
					                                      f32_2 %118 = OpLoad %9 
					                                      f32_4 %119 = OpImageSampleImplicitLod %117 %118 
					                                                     OpStore %107 %119 
					                                      f32_2 %123 = OpLoad %28 
					                                      f32_3 %124 = OpVectorShuffle %123 %123 0 0 0 
					                                      f32_4 %125 = OpLoad %107 
					                                      f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
					                                      f32_3 %127 = OpFAdd %124 %126 
					                                      f32_4 %128 = OpLoad %121 
					                                      f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
					                                                     OpStore %121 %129 
					                               Private f32* %131 = OpAccessChain %107 %130 
					                                        f32 %132 = OpLoad %131 
					                                Output f32* %134 = OpAccessChain %121 %130 
					                                                     OpStore %134 %132 
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
						float _Value3;
						float _Value4;
						vec4 unused_0_5;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat0.xy + (-vec2(_Value, _Value2));
					    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + (-_Value3);
					    u_xlat4.x = u_xlat4.x * 10.0;
					    u_xlat4.x = log2(abs(u_xlat4.x));
					    u_xlat4.x = u_xlat4.x * 0.800000012;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat4.x = (-u_xlat4.x) + 1.0;
					    u_xlat4.x = u_xlat4.x * _Value4;
					    u_xlat4.x = u_xlat4.x * 0.0199999996;
					    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
					    u_xlat0.xy = (-u_xlat4.xx) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat4.xxx + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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