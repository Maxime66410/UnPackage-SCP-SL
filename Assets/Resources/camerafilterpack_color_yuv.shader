Shader "CameraFilterPack/Color_YUV" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 39148
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
					uniform 	float _Y;
					uniform 	float _U;
					uniform 	float _V;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat16_1;
					float u_xlat16_2;
					float u_xlat5;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_1 = u_xlat10_0.y * 0.289000005;
					    u_xlat16_1 = u_xlat10_0.x * -0.147 + (-u_xlat16_1);
					    u_xlat1.x = u_xlat10_0.z * 0.43599999 + u_xlat16_1;
					    u_xlat1.y = dot(u_xlat10_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat1.xy = u_xlat1.xy + vec2(_U, _Y);
					    u_xlat5 = (-u_xlat1.x) * 0.395000011 + u_xlat1.y;
					    SV_Target0.z = u_xlat1.x * 2.03200006 + u_xlat1.y;
					    u_xlat16_2 = u_xlat10_0.y * 0.514999986;
					    u_xlat16_0 = u_xlat10_0.x * 0.61500001 + (-u_xlat16_2);
					    u_xlat16_0 = (-u_xlat10_0.z) * 0.100000001 + u_xlat16_0;
					    SV_Target0.w = u_xlat10_0.w;
					    u_xlat0.x = u_xlat16_0 + _V;
					    SV_Target0.y = (-u_xlat0.x) * 0.58099997 + u_xlat5;
					    SV_Target0.x = u_xlat0.x * 1.13999999 + u_xlat1.y;
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
					; Bound: 153
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %11 %96 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpDecorate vs_TEXCOORD0 Location 11 
					                                                OpMemberDecorate %14 0 Offset 14 
					                                                OpMemberDecorate %14 1 Offset 14 
					                                                OpMemberDecorate %14 2 Offset 14 
					                                                OpMemberDecorate %14 3 RelaxedPrecision 
					                                                OpMemberDecorate %14 3 Offset 14 
					                                                OpDecorate %14 Block 
					                                                OpDecorate %16 DescriptorSet 16 
					                                                OpDecorate %16 Binding 16 
					                                                OpDecorate %21 RelaxedPrecision 
					                                                OpDecorate %22 RelaxedPrecision 
					                                                OpDecorate %25 RelaxedPrecision 
					                                                OpDecorate %26 RelaxedPrecision 
					                                                OpDecorate %29 RelaxedPrecision 
					                                                OpDecorate %32 RelaxedPrecision 
					                                                OpDecorate %32 DescriptorSet 32 
					                                                OpDecorate %32 Binding 32 
					                                                OpDecorate %33 RelaxedPrecision 
					                                                OpDecorate %36 RelaxedPrecision 
					                                                OpDecorate %36 DescriptorSet 36 
					                                                OpDecorate %36 Binding 36 
					                                                OpDecorate %37 RelaxedPrecision 
					                                                OpDecorate %43 RelaxedPrecision 
					                                                OpDecorate %47 RelaxedPrecision 
					                                                OpDecorate %49 RelaxedPrecision 
					                                                OpDecorate %52 RelaxedPrecision 
					                                                OpDecorate %54 RelaxedPrecision 
					                                                OpDecorate %55 RelaxedPrecision 
					                                                OpDecorate %56 RelaxedPrecision 
					                                                OpDecorate %57 RelaxedPrecision 
					                                                OpDecorate %61 RelaxedPrecision 
					                                                OpDecorate %63 RelaxedPrecision 
					                                                OpDecorate %64 RelaxedPrecision 
					                                                OpDecorate %65 RelaxedPrecision 
					                                                OpDecorate %68 RelaxedPrecision 
					                                                OpDecorate %69 RelaxedPrecision 
					                                                OpDecorate %74 RelaxedPrecision 
					                                                OpDecorate %96 Location 96 
					                                                OpDecorate %106 RelaxedPrecision 
					                                                OpDecorate %108 RelaxedPrecision 
					                                                OpDecorate %110 RelaxedPrecision 
					                                                OpDecorate %111 RelaxedPrecision 
					                                                OpDecorate %113 RelaxedPrecision 
					                                                OpDecorate %115 RelaxedPrecision 
					                                                OpDecorate %116 RelaxedPrecision 
					                                                OpDecorate %117 RelaxedPrecision 
					                                                OpDecorate %118 RelaxedPrecision 
					                                                OpDecorate %120 RelaxedPrecision 
					                                                OpDecorate %121 RelaxedPrecision 
					                                                OpDecorate %123 RelaxedPrecision 
					                                                OpDecorate %124 RelaxedPrecision 
					                                                OpDecorate %125 RelaxedPrecision 
					                                                OpDecorate %128 RelaxedPrecision 
					                                                OpDecorate %130 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 2 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_2* %9 = OpVariable Private 
					                                        %10 = OpTypePointer Input %7 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                        %13 = OpTypeVector %6 4 
					                                        %14 = OpTypeStruct %6 %6 %6 %13 
					                                        %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                        %17 = OpTypeInt 32 1 
					                                    i32 %18 = OpConstant 3 
					                                        %19 = OpTypePointer Uniform %13 
					                                        %28 = OpTypePointer Private %13 
					                         Private f32_4* %29 = OpVariable Private 
					                                        %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %31 = OpTypePointer UniformConstant %30 
					   UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
					                                        %34 = OpTypeSampler 
					                                        %35 = OpTypePointer UniformConstant %34 
					               UniformConstant sampler* %36 = OpVariable UniformConstant 
					                                        %38 = OpTypeSampledImage %30 
					                                        %42 = OpTypePointer Private %6 
					                           Private f32* %43 = OpVariable Private 
					                                        %44 = OpTypeInt 32 0 
					                                    u32 %45 = OpConstant 1 
					                                    f32 %48 = OpConstant 3,674022E-40 
					                                    u32 %50 = OpConstant 0 
					                                    f32 %53 = OpConstant 3,674022E-40 
					                         Private f32_2* %58 = OpVariable Private 
					                                    u32 %59 = OpConstant 2 
					                                    f32 %62 = OpConstant 3,674022E-40 
					                                        %67 = OpTypeVector %6 3 
					                                    f32 %70 = OpConstant 3,674022E-40 
					                                    f32 %71 = OpConstant 3,674022E-40 
					                                    f32 %72 = OpConstant 3,674022E-40 
					                                  f32_3 %73 = OpConstantComposite %70 %71 %72 
					                                    i32 %77 = OpConstant 1 
					                                        %78 = OpTypePointer Uniform %6 
					                                    i32 %81 = OpConstant 0 
					                           Private f32* %86 = OpVariable Private 
					                                    f32 %90 = OpConstant 3,674022E-40 
					                                        %95 = OpTypePointer Output %13 
					                          Output f32_4* %96 = OpVariable Output 
					                                    f32 %99 = OpConstant 3,674022E-40 
					                                       %104 = OpTypePointer Output %6 
					                          Private f32* %106 = OpVariable Private 
					                                   f32 %109 = OpConstant 3,674022E-40 
					                          Private f32* %111 = OpVariable Private 
					                                   f32 %114 = OpConstant 3,674022E-40 
					                                   f32 %122 = OpConstant 3,674022E-40 
					                                   u32 %126 = OpConstant 3 
					                                   i32 %131 = OpConstant 2 
					                                   f32 %139 = OpConstant 3,674022E-40 
					                                   f32 %146 = OpConstant 3,674022E-40 
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
					                    read_only Texture2D %33 = OpLoad %32 
					                                sampler %37 = OpLoad %36 
					             read_only Texture2DSampled %39 = OpSampledImage %33 %37 
					                                  f32_2 %40 = OpLoad %9 
					                                  f32_4 %41 = OpImageSampleImplicitLod %39 %40 
					                                                OpStore %29 %41 
					                           Private f32* %46 = OpAccessChain %29 %45 
					                                    f32 %47 = OpLoad %46 
					                                    f32 %49 = OpFMul %47 %48 
					                                                OpStore %43 %49 
					                           Private f32* %51 = OpAccessChain %29 %50 
					                                    f32 %52 = OpLoad %51 
					                                    f32 %54 = OpFMul %52 %53 
					                                    f32 %55 = OpLoad %43 
					                                    f32 %56 = OpFNegate %55 
					                                    f32 %57 = OpFAdd %54 %56 
					                                                OpStore %43 %57 
					                           Private f32* %60 = OpAccessChain %29 %59 
					                                    f32 %61 = OpLoad %60 
					                                    f32 %63 = OpFMul %61 %62 
					                                    f32 %64 = OpLoad %43 
					                                    f32 %65 = OpFAdd %63 %64 
					                           Private f32* %66 = OpAccessChain %58 %50 
					                                                OpStore %66 %65 
					                                  f32_4 %68 = OpLoad %29 
					                                  f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
					                                    f32 %74 = OpDot %69 %73 
					                           Private f32* %75 = OpAccessChain %58 %45 
					                                                OpStore %75 %74 
					                                  f32_2 %76 = OpLoad %58 
					                           Uniform f32* %79 = OpAccessChain %16 %77 
					                                    f32 %80 = OpLoad %79 
					                           Uniform f32* %82 = OpAccessChain %16 %81 
					                                    f32 %83 = OpLoad %82 
					                                  f32_2 %84 = OpCompositeConstruct %80 %83 
					                                  f32_2 %85 = OpFAdd %76 %84 
					                                                OpStore %58 %85 
					                           Private f32* %87 = OpAccessChain %58 %50 
					                                    f32 %88 = OpLoad %87 
					                                    f32 %89 = OpFNegate %88 
					                                    f32 %91 = OpFMul %89 %90 
					                           Private f32* %92 = OpAccessChain %58 %45 
					                                    f32 %93 = OpLoad %92 
					                                    f32 %94 = OpFAdd %91 %93 
					                                                OpStore %86 %94 
					                           Private f32* %97 = OpAccessChain %58 %50 
					                                    f32 %98 = OpLoad %97 
					                                   f32 %100 = OpFMul %98 %99 
					                          Private f32* %101 = OpAccessChain %58 %45 
					                                   f32 %102 = OpLoad %101 
					                                   f32 %103 = OpFAdd %100 %102 
					                           Output f32* %105 = OpAccessChain %96 %59 
					                                                OpStore %105 %103 
					                          Private f32* %107 = OpAccessChain %29 %45 
					                                   f32 %108 = OpLoad %107 
					                                   f32 %110 = OpFMul %108 %109 
					                                                OpStore %106 %110 
					                          Private f32* %112 = OpAccessChain %29 %50 
					                                   f32 %113 = OpLoad %112 
					                                   f32 %115 = OpFMul %113 %114 
					                                   f32 %116 = OpLoad %106 
					                                   f32 %117 = OpFNegate %116 
					                                   f32 %118 = OpFAdd %115 %117 
					                                                OpStore %111 %118 
					                          Private f32* %119 = OpAccessChain %29 %59 
					                                   f32 %120 = OpLoad %119 
					                                   f32 %121 = OpFNegate %120 
					                                   f32 %123 = OpFMul %121 %122 
					                                   f32 %124 = OpLoad %111 
					                                   f32 %125 = OpFAdd %123 %124 
					                                                OpStore %111 %125 
					                          Private f32* %127 = OpAccessChain %29 %126 
					                                   f32 %128 = OpLoad %127 
					                           Output f32* %129 = OpAccessChain %96 %126 
					                                                OpStore %129 %128 
					                                   f32 %130 = OpLoad %111 
					                          Uniform f32* %132 = OpAccessChain %16 %131 
					                                   f32 %133 = OpLoad %132 
					                                   f32 %134 = OpFAdd %130 %133 
					                          Private f32* %135 = OpAccessChain %9 %50 
					                                                OpStore %135 %134 
					                          Private f32* %136 = OpAccessChain %9 %50 
					                                   f32 %137 = OpLoad %136 
					                                   f32 %138 = OpFNegate %137 
					                                   f32 %140 = OpFMul %138 %139 
					                                   f32 %141 = OpLoad %86 
					                                   f32 %142 = OpFAdd %140 %141 
					                           Output f32* %143 = OpAccessChain %96 %45 
					                                                OpStore %143 %142 
					                          Private f32* %144 = OpAccessChain %9 %50 
					                                   f32 %145 = OpLoad %144 
					                                   f32 %147 = OpFMul %145 %146 
					                          Private f32* %148 = OpAccessChain %58 %45 
					                                   f32 %149 = OpLoad %148 
					                                   f32 %150 = OpFAdd %147 %149 
					                           Output f32* %151 = OpAccessChain %96 %50 
					                                                OpStore %151 %150 
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
						float _Y;
						float _U;
						float _V;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat16_1;
					float u_xlat16_2;
					float u_xlat5;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_1 = u_xlat10_0.y * 0.289000005;
					    u_xlat16_1 = u_xlat10_0.x * -0.147 + (-u_xlat16_1);
					    u_xlat1.x = u_xlat10_0.z * 0.43599999 + u_xlat16_1;
					    u_xlat1.y = dot(u_xlat10_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat1.xy = u_xlat1.xy + vec2(_U, _Y);
					    u_xlat5 = (-u_xlat1.x) * 0.395000011 + u_xlat1.y;
					    SV_Target0.z = u_xlat1.x * 2.03200006 + u_xlat1.y;
					    u_xlat16_2 = u_xlat10_0.y * 0.514999986;
					    u_xlat16_0 = u_xlat10_0.x * 0.61500001 + (-u_xlat16_2);
					    u_xlat16_0 = (-u_xlat10_0.z) * 0.100000001 + u_xlat16_0;
					    SV_Target0.w = u_xlat10_0.w;
					    u_xlat0.x = u_xlat16_0 + _V;
					    SV_Target0.y = (-u_xlat0.x) * 0.58099997 + u_xlat5;
					    SV_Target0.x = u_xlat0.x * 1.13999999 + u_xlat1.y;
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